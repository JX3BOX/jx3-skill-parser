// 安装实际 tarball 验证 CJS/ESM、随包 Lua 文件和严格类型；不依赖邻仓库产物。
import assert from 'node:assert/strict';
import { execFileSync } from 'node:child_process';
import { mkdtempSync, readFileSync, rmSync, writeFileSync } from 'node:fs';
import { tmpdir } from 'node:os';
import { dirname, join, resolve } from 'node:path';
import { fileURLToPath } from 'node:url';

const root = fileURLToPath(new URL('..', import.meta.url));
const manifest = JSON.parse(readFileSync(join(root, 'package.json'), 'utf8'));
const directory = mkdtempSync(join(tmpdir(), 'jx3-skill-parser-package-'));
const npm = (...args) =>
    execFileSync(process.execPath, [process.env.npm_execpath, ...args], {
        cwd: directory,
        encoding: 'utf8',
    });
try {
    // npm 12 返回按包名索引的对象，npm 11 返回数组；当前命令只打包一个包。
    const [packed] = Object.values(
        JSON.parse(
            execFileSync(
                process.execPath,
                [process.env.npm_execpath, 'pack', '--json', '--pack-destination', directory],
                {
                    cwd: root,
                    encoding: 'utf8',
                },
            ),
        ),
    );
    for (const file of ['init.lua', 'mock.lua', 'base64.lua', 'add-attribute-proxy.lua']) {
        assert(packed.files.some((entry) => entry.path === `dist/lua/${file}`));
    }
    assert(!packed.files.some((entry) => /^(src|test|scripts|types)\//.test(entry.path)));
    writeFileSync(join(directory, 'package.json'), '{"private":true}');
    npm(
        'install',
        '--ignore-scripts',
        '--no-audit',
        '--no-fund',
        join(directory, packed.filename),
        `@types/node@${manifest.devDependencies['@types/node']}`,
    );
    const body = `
        const reads = [];
        const parser = await SkillParser.create({cache: false, include: async (name) => {
            reads.push(name);
            return Buffer.from(name.endsWith('first.lua') ? "Include('nested.lua'); Value=Nested+2" : 'Nested=40');
        }});
        try {
            const result = await parser.parse(Buffer.from("Include('first.lua'); function GetSkillLevelData(s) s.nCostMana=Value end"), {id: 123, level: 2});
            if (result.nCostMana !== 42 || result.dwSkillID !== 123 || result.dwLevel !== 2 || reads.length !== 2) throw new Error('invalid parser result');
        } finally { parser.lua.global.close(); }
    `;
    writeFileSync(
        join(directory, 'consumer.cjs'),
        `const {SkillParser}=require('@jx3box/jx3-skill-parser'); (async()=>{${body}})().catch(e=>{console.error(e);process.exitCode=1});`,
    );
    writeFileSync(
        join(directory, 'consumer.mjs'),
        `import {SkillParser} from '@jx3box/jx3-skill-parser'; ${body}`,
    );
    for (const name of ['consumer.cjs', 'consumer.mjs'])
        execFileSync(process.execPath, [name], { cwd: directory, stdio: 'inherit' });
    const source = `
        import {SkillParser, type CreateOptions, type SkillParseOptions, type SkillResult, type SkillAttribute, type BuffCheck} from '@jx3box/jx3-skill-parser';
        const options: CreateOptions = {include: () => Promise.resolve(Buffer.from('')), cache: false};
        const parseOptions: SkillParseOptions = {id: 123, level: 1};
        async function main() {
            const parser = await SkillParser.create(options);
            const result: SkillResult = await parser.parse(Buffer.from(''), parseOptions);
            const level: number = result.dwLevel;
            const attributes: SkillAttribute[] | undefined = result.skillAttributes;
            const checks: BuffCheck[] | undefined = result.slowCheckSelfBuff;
            // @ts-expect-error Unknown game fields require narrowing.
            const unknownValue: number = result.unknownGameField;
            return [level, attributes, checks];
        }
        // @ts-expect-error Include must return bytes rather than a string.
        const invalid: CreateOptions = {include: () => 'not a Buffer'};
        void main;
    `;
    for (const extension of ['cts', 'mts'])
        writeFileSync(join(directory, `consumer.${extension}`), source);
    writeFileSync(
        join(directory, 'tsconfig.json'),
        JSON.stringify({
            compilerOptions: {
                target: 'ES2022',
                module: 'NodeNext',
                moduleResolution: 'NodeNext',
                strict: true,
                skipLibCheck: false,
                noEmit: true,
                types: ['node'],
                lib: ['ES2022'],
            },
            files: ['consumer.cts', 'consumer.mts'],
        }),
    );
    execFileSync(
        process.execPath,
        [join(root, 'node_modules/typescript/bin/tsc'), '-p', join(directory, 'tsconfig.json')],
        { stdio: 'inherit' },
    );
    console.log(
        'Packed CJS/ESM, nested async Include, Lua assets and strict consumer types passed.',
    );
} finally {
    assert.equal(dirname(resolve(directory)), resolve(tmpdir()));
    rmSync(directory, { recursive: true, force: true });
}
