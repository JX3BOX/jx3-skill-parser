import { JsType, Lua } from 'wasmoon-lua5.1';
import { Skill } from './skill';
import { registerIndexFunction, registerNewIndexFunction } from './wasmoon-helper';
import fs from 'fs/promises';
import path from 'path';

declare interface SkillParseOptions {
    level?: number;
    skill_name?: string;
}

export class SkillParser {
    static async create() {
        const lua = await Lua.create();
        const parser = new SkillParser(lua);
        await parser.mountLuaFS(`${__dirname}/lua`, '/');
        lua.ctx.Include = () => {};
        await lua.doFile('/lib/base64.lua');
        lua.ctx.initScriptPath = '/InitHd.lh';
        await lua.doFile('/lib/init.lua');
        return parser;
    }

    public lua: Lua;

    constructor(lua: Lua) {
        this.lua = lua;
    }

    async parse(content: Buffer, options: SkillParseOptions = {}) {
        if (!options.level) {
            options.level = 0;
        }
        if (!options.skill_name) {
            options.skill_name = '测试技能';
        }

        this.lua.mountFile('/skill-script.lua', content);
        this.lua.ctx.scriptPath = '/skill-script.lua';

        await this.lua.doFile('/lib/load-file.lua');

        const skill_data = this.lua.ctx.env.tSkillData;
        if (!skill_data) {
            throw new Error('Lua解析出错，获取tSkillData时');
        }
        const max_level = skill_data.$detach().size;
        skill_data.$destroy();

        if (options.level <= 0) {
            options.level = max_level;
        }

        const skill = new Skill({
            dwLevel: options.level,
            dwMaxLevel: max_level,
        });
        const env = this.lua.ctx.env;
        env.tSkill = JsType.decorate(skill)
            .index(registerIndexFunction(this.lua.global))
            .newindex(registerNewIndexFunction(this.lua.global))
            .gc(this.lua.funcManager.registerGcFunction(this.lua.global));

        await this.lua.doFile(`/lib/add-attribute-proxy.lua`);

        await this.lua.doString(`env.GetSkillLevelData(env.tSkill)`);

        this.lua.unmountFile('/skill-script.lua');
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
