// 执行技能 Lua 与按需 Include，管理解析环境和临时挂载文件。
import { JsType, Lua, type LuaTable } from 'wasmoon-lua5.1';
import { Skill } from './skill';
import { fileURLToPath } from 'node:url';
import { pinyin } from 'pinyin-pro';
import { registerIndexFunction, registerNewIndexFunction } from './wasmoon-helper';
import fs from 'fs/promises';
import iconv from 'iconv-lite';
import path from 'path';
import type { CreateOptions, SkillParseOptions, SkillResult } from './types';

export class SkillParser {
    static default_cache: string[] = [
        'scripts/Include/Skill.lh',
        'scripts/Include/LogicConst.lh',
        'scripts/Include/Table.lh',
        'scripts/Include/AllDungeonsNpcSkillDataManager.lh',
        'scripts/Include/AllDungeonsNpcSkillData.lh',
    ];

    static async create(options: CreateOptions = {}) {
        const lua = await Lua.create();
        try {
            const parser = new SkillParser(lua, options);
            await parser.mountLuaFS(fileURLToPath(new URL('./lua/', import.meta.url)), '/');
            await lua.doFile('/init.lua');
            return parser;
        } catch (error) {
            lua.global.close();
            throw error;
        }
    }

    public lua: Lua;
    public indexPointer: number;
    public newIndexPointer: number;
    public gcPointer: number;
    public options: CreateOptions;
    public script_includes: Record<string, string> = {};
    private mountedIncludes = new Set<string>();

    constructor(lua: Lua, options: CreateOptions = {}) {
        this.lua = lua;
        this.options = { ...options, cache: options.cache ?? 'default' };
        this.lua.bindAsync('__Include', this.include.bind(this));
        // 提前注册好函数指针
        this.indexPointer = registerIndexFunction(this.lua.global);
        this.newIndexPointer = registerNewIndexFunction(this.lua.global);
        this.gcPointer = this.lua.funcManager.registerGcFunction(this.lua.global);
    }

    async include(filename: string): Promise<[string, boolean?] | undefined> {
        if (!this.options.include) {
            return;
        }
        // lua传出来的文件名被base64过，恢复一下
        const normalize = (value: string) =>
            path.posix.normalize(value.replace(/\\/g, '/')).toLowerCase();
        const file = normalize(iconv.decode(Buffer.from(filename, 'base64'), 'gbk'));
        // 可能会一次解析中多次include，支持简单缓存
        if (this.script_includes[file]) {
            return [
                this.script_includes[file]
                    .replace(/\.lua$/, '')
                    .replace(/\.lh$/, '')
                    .replace(/\.li$/, ''),
            ];
        }
        // 调用传入的include方法拿到buffer
        const buffer = await this.options.include(file);
        if (!buffer) {
            return;
        }
        // lua环境对编码支持怪得很，文件名转换为首字母
        // 可能会有调试需求，要大概能看出是哪个文件
        const name = pinyin(file, { toneType: 'none' })
            .split(' ')
            .map((x) => x[0])
            .join('');
        this.lua.mountFile(name, buffer);
        this.mountedIncludes.add(name);
        let needCache = false;
        // include的文件记录，在解析完毕之后需要unmount
        if (
            this.options.cache === 'all' ||
            (this.options.cache === 'default' &&
                SkillParser.default_cache.some((entry) => normalize(entry) === file)) ||
            (Array.isArray(this.options.cache) &&
                this.options.cache.some((entry) => normalize(entry) === file))
        ) {
            this.script_includes[file] = name;
            needCache = true;
        }
        return [
            name
                .replace(/\.lua$/, '')
                .replace(/\.lh$/, '')
                .replace(/\.li$/, ''),
            needCache,
        ];
    }

    async parse(content: Buffer, options: SkillParseOptions = {}): Promise<SkillResult> {
        let level = options.level || -1;
        // 载入技能脚本
        this.lua.mountFile('/skill-script.lua', content);
        let env: LuaTable | undefined;
        try {
            await this.lua.doString(`loadScript("/skill-script.lua")`);
            env = this.lua.ctx.env as LuaTable;
            // 读最大等级
            let max_level = 0;
            const skill_data = env.tSkillData as LuaTable | undefined;
            if (skill_data) {
                max_level = skill_data.$detach().size;
                skill_data.$destroy();
            }
            // 如果等级小于0，取最大等级
            if (level <= 0) {
                level = max_level;
            }
            // 初始化skill对象
            const skill = new Skill({
                dwSkillID: options.id,
                dwLevel: level,
                dwMaxLevel: max_level,
            });
            env.tSkill = JsType.decorate(skill)
                .index(this.indexPointer)
                .newindex(this.newIndexPointer)
                .gc(this.gcPointer);
            // 添加AddAttribute代理
            await this.lua.doFile(`/add-attribute-proxy.lua`);
            await this.lua.doString(`env.GetSkillLevelData(env.tSkill)`);
            return skill.$getResult();
        } finally {
            this.lua.unmountFile('/skill-script.lua');
            for (const name of this.mountedIncludes) {
                this.lua.unmountFile(name);
            }
            this.mountedIncludes.clear();
            this.script_includes = {};
            env?.$destroy();
        }
    }

    private async mountLuaFS(lua_base: string, fs_base: string) {
        const files = await fs.readdir(lua_base, { withFileTypes: true });
        for (const file of files) {
            if (file.isDirectory()) {
                await this.mountLuaFS(
                    path.join(lua_base, file.name),
                    path.posix.join(fs_base, file.name),
                );
            } else {
                const fs_path = path.posix.join(fs_base, file.name);
                const real_file_path = path.join(lua_base, file.name);
                const file_content = await fs.readFile(real_file_path);
                this.lua.mountFile(fs_path, file_content);
            }
        }
    }
}
