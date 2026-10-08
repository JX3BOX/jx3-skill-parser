// 覆盖动态和嵌套 Include、错误传播、缓存、字节码与调用方输入所有权。
const assert = require('node:assert/strict');
const { SkillParser } = require('../dist');
const iconv = require('iconv-lite');

describe('asynchronous Include', () => {
    let parser;
    afterEach(() => parser?.lua.global.close());

    it('loads dynamic nested GBK paths and resumes protected calls exactly once', async () => {
        const reads = [];
        let effects = 0;
        const files = {
            'scripts/first.lua': "effect(); Include('SCRIPTS/测试.LUA'); First=10",
            'scripts/测试.lua': 'Nested=20',
            'scripts/level2.lua': 'Level=2',
        };
        parser = await SkillParser.create({
            cache: false,
            include: async (name) => {
                reads.push(name);
                await new Promise((resolve) => setTimeout(resolve, 1));
                return files[name] === undefined ? undefined : iconv.encode(files[name], 'gbk');
            },
        });
        parser.lua.ctx.effect = () => {
            effects++;
        };
        const script = iconv.encode(
            `
            local ok, err = pcall(function() Include('scripts/first.lua') end)
            if not ok then error(err) end
            function GetSkillLevelData(skill)
                local ok, err = xpcall(function()
                    Include('scripts/level' .. skill.dwLevel .. '.lua')
                end, function(e) return e end)
                if not ok then error(err) end
                skill.nCostMana = First + Nested + Level
            end
        `,
            'gbk',
        );
        const result = await parser.parse(script, { id: 1, level: 2 });
        assert.equal(result.nCostMana, 32);
        assert.equal(effects, 1);
        assert.deepEqual(reads, Object.keys(files));
        assert(!parser.lua.luaApi.module.FS.readdir('/').includes('skill-script.lua'));
        assert.deepEqual(parser.script_includes, {});
    });

    it('propagates download rejection through pcall/xpcall and cleans failed parses', async () => {
        parser = await SkillParser.create({
            include: () => Promise.reject(new Error('download failed')),
        });
        const result = await parser.parse(
            Buffer.from(`
            local ok, value = xpcall(function() Include('fail.lua') end, function(err)
                return string.find(err, 'download failed') and 7 or 0
            end)
            local a, b, c, d = pcall(function() return nil, 4, nil end)
            function GetSkillLevelData(skill)
                skill.nCostMana = (not ok and value == 7 and a and b == nil and c == 4 and d == nil) and 42 or 0
            end
        `),
            { level: 1 },
        );
        assert.equal(result.nCostMana, 42);
        await assert.rejects(parser.parse(Buffer.from("Include('fail.lua')")), /download failed/);
        assert(!parser.lua.luaApi.module.FS.readdir('/').includes('skill-script.lua'));
    });

    it('preserves default caching across skills and honors cache=false', async () => {
        let reads = 0;
        const include = () => {
            reads++;
            return Buffer.from('Value=(Value or 0)+1');
        };
        const script = Buffer.from(
            "Include('scripts/Include/Skill.lh'); function GetSkillLevelData(s) s.nCostMana=Value end",
        );
        parser = await SkillParser.create({ include });
        assert.equal((await parser.parse(script)).nCostMana, 1);
        assert.equal((await parser.parse(script)).nCostMana, 1);
        assert.equal(reads, 1);
        parser.lua.global.close();
        parser = await SkillParser.create({ include, cache: false });
        await parser.parse(script);
        await parser.parse(script);
        assert.equal(reads, 3);
    });

    it('suspends Includes in Lua 5.1 bytecode as well as source scripts', async () => {
        parser = await SkillParser.create({
            include: () => Promise.resolve(Buffer.from('Value=42')),
        });
        await parser.lua.doString(`
            local chunk = assert(loadstring("Include('data.lua'); function GetSkillLevelData(s) s.nCostMana=Value end"))
            local file = assert(io.open('/compiled.lua', 'wb'))
            file:write(string.dump(chunk))
            file:close()
        `);
        const bytes = parser.lua.luaApi.module.FS.readFile('/compiled.lua');
        assert.equal((await parser.parse(Buffer.from(bytes))).nCostMana, 42);
    });

    it('does not mutate options or reuse a previous skill maximum when level is zero', async () => {
        const options = Object.freeze({});
        const parseOptions = Object.freeze({ id: 123, level: 0 });
        parser = await SkillParser.create(options);
        for (const entries of ['{}, {}', '{}, {}, {}']) {
            const result = await parser.parse(
                Buffer.from(`tSkillData={${entries}}; function GetSkillLevelData(s) end`),
                parseOptions,
            );
            assert.equal(result.dwLevel, entries.split(',').length);
        }
        assert.deepEqual(options, {});
        assert.equal(parseOptions.level, 0);
    });
});
