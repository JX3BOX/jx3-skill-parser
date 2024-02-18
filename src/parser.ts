import { JsType, Lua } from 'wasmoon-lua5.1';
import { Skill } from './skill';
import { registerIndexFunction, registerNewIndexFunction } from './wasmoon-helper';
import fs from 'fs/promises';
import iconv from 'iconv-lite';
import path from 'path';

declare interface CreateOptions {
    include?: (name: string) => Buffer;
}
declare interface SkillParseOptions {
    id?: number;
    level?: number;
    skill_name?: string;
}

export class SkillParser {
    static cache: string[] = [
        'scripts/Include/Skill.lh',
        'scripts/Include/LogicConst.lh',
        'scripts/Include/Table.lh',
        'scripts/Include/AllDungeonsNpcSkillDataManager.lh',
        'scripts/Include/AllDungeonsNpcSkillData.lh',
    ];
    static async create(options: CreateOptions = {}) {
        const lua = await Lua.create();
        const parser = new SkillParser(lua, options);
        await parser.mountLuaFS(`${__dirname}/lua`, '/');
        await lua.doFile('/init.lua');
        return parser;
    }

    public lua: Lua;
    public options: CreateOptions;
    public extra_include: Record<string, string> = {};

    constructor(lua: Lua, options: CreateOptions = {}) {
        this.lua = lua;
        this.options = options;
        this.lua.ctx.__Include = (filename: string) => {
            if (!this.options.include) {
                return;
            }
            const file = iconv.decode(Buffer.from(filename, 'base64'), 'gbk');
            if (this.extra_include[file]) {
                return this.extra_include[file]
                    .replace(/\.lua$/, '')
                    .replace(/\.lh$/, '')
                    .replace(/\.li$/, '');
            }
            const buffer = this.options.include(file);
            if (!buffer) {
                return;
            }
            const index = Object.keys(this.extra_include).length;
            const name = `/extra/${index}.lua`;
            lua.mountFile(name, buffer);
            this.extra_include[file] = name;
            return name
                .replace(/\.lua$/, '')
                .replace(/\.lh$/, '')
                .replace(/\.li$/, '');
        };
    }

    async parse(content: Buffer, options: SkillParseOptions = {}) {
        if (!options.level) {
            options.level = 0;
        }
        if (!options.skill_name) {
            options.skill_name = '测试技能';
        }

        this.lua.mountFile('/skill-script.lua', content);
        await this.lua.doString(`loadScript("/skill-script.lua")`);

        let max_level = 0;
        const skill_data = this.lua.ctx.env.tSkillData;
        if (skill_data) {
            max_level = skill_data.$detach().size;
            skill_data.$destroy();
        }

        if (options.level <= 0) {
            options.level = max_level;
        }

        const skill = new Skill({
            dwSkillID: options.id,
            dwLevel: options.level,
            dwMaxLevel: max_level,
        });
        const env = this.lua.ctx.env;
        env.tSkill = JsType.decorate(skill)
            .index(registerIndexFunction(this.lua.global))
            .newindex(registerNewIndexFunction(this.lua.global))
            .gc(this.lua.funcManager.registerGcFunction(this.lua.global));

        await this.lua.doFile(`/add-attribute-proxy.lua`);
        await this.lua.doString(`env.GetSkillLevelData(env.tSkill)`);
        this.lua.unmountFile('/skill-script.lua');
        for (const include in this.extra_include) {
            if (!SkillParser.cache.includes(include)) {
                this.lua.unmountFile(this.extra_include[include]);
                delete this.extra_include[include];
            }
        }
        env.$destroy();
        return skill.$getResult();
    }

    private async mountLuaFS(lua_base: string, fs_base: string) {
        const files = await fs.readdir(lua_base, { withFileTypes: true });
        for (const file of files) {
            if (file.isDirectory()) {
                await this.mountLuaFS(
                    path.join(lua_base, file.name),
                    path.join(fs_base, file.name),
                );
            } else {
                const fs_path = path.join(fs_base, file.name);
                const real_file_path = path.join(lua_base, file.name);
                const file_content = await fs.readFile(real_file_path);
                this.lua.mountFile(fs_path, file_content);
            }
        }
    }
}
