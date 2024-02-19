import { JsType, Lua } from 'wasmoon-lua5.1';
import { Skill } from './skill';
import { pinyin } from 'pinyin-pro';
import { registerIndexFunction, registerNewIndexFunction } from './wasmoon-helper';
import fs from 'fs/promises';
import iconv from 'iconv-lite';
import path from 'path';

declare interface CreateOptions {
    /**
     * Lua环境出现Include的时候，会向js发出请求。
     * 需要提供一个回调函数，传入的是Include的内容，需要返回目标文件的Buffer
     * @param name
     * @returns
     */
    include?: (name: string) => Buffer;
    /**
     * 缓存Include的文件列表，如果不提供，每次Include都会重新读取文件。
     * 如果开启缓存，Include列表内的文件的时候仅第一次会请求Buffer。
     * 同时会将结果添加到envTemplate，后续不需要再Include。
     * 1. 传入数组时使用数组内容作为列表
     * 2. 传入'default'时候使用内置的默认列表
     * 3. 传入'all'时缓存所有文件
     * 4. 传入false或者不传时关闭缓存。
     * 默认取值为'default'
     */
    cache?: string[] | 'default' | 'all' | false;
}
declare interface SkillParseOptions {
    id?: number;
    level?: number;
    skill_name?: string;
}

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
        const parser = new SkillParser(lua, options);
        await parser.mountLuaFS(`${__dirname}/lua`, '/');
        await lua.doFile('/init.lua');
        return parser;
    }

    public lua: Lua;
    public indexPointer: number;
    public newIndexPointer: number;
    public gcPointer: number;
    public options: CreateOptions;
    public script_includes: Record<string, string> = {};

    constructor(lua: Lua, options: CreateOptions = {}) {
        this.lua = lua;
        this.options = options;
        if (!this.options.cache) {
            this.options.cache = 'default';
        }
        this.lua.ctx.__Include = this.include.bind(this);
        // 提前注册好函数指针
        this.indexPointer = registerIndexFunction(this.lua.global);
        this.newIndexPointer = registerNewIndexFunction(this.lua.global);
        this.gcPointer = this.lua.funcManager.registerGcFunction(this.lua.global);
    }

    include(filename: string) {
        if (!this.options.include) {
            return;
        }
        // lua传出来的文件名被base64过，恢复一下
        const file = iconv.decode(Buffer.from(filename, 'base64'), 'gbk');
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
        const buffer = this.options.include(file);
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
        let needCache = false;
        // include的文件记录，在解析完毕之后需要unmount
        if (
            this.options.cache === 'all' ||
            (this.options.cache === 'default' && SkillParser.default_cache.includes(file)) ||
            (Array.isArray(this.options.cache) && this.options.cache.includes(file))
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

    async parse(content: Buffer, options: SkillParseOptions = {}) {
        // 设置默认项目
        if (!options.level) {
            options.level = -1;
        }
        // 载入技能脚本
        this.lua.mountFile('/skill-script.lua', content);
        await this.lua.doString(`loadScript("/skill-script.lua")`);
        // 读最大等级
        let max_level = 0;
        const skill_data = this.lua.ctx.env.tSkillData;
        if (skill_data) {
            max_level = skill_data.$detach().size;
            skill_data.$destroy();
        }
        // 如果等级小于0，取最大等级
        if (options.level < 0) {
            options.level = max_level;
        }
        // 初始化skill对象
        const skill = new Skill({
            dwSkillID: options.id,
            dwLevel: options.level,
            dwMaxLevel: max_level,
        });
        // 拿到lua中的env对象
        const env = this.lua.ctx.env;
        env.tSkill = JsType.decorate(skill)
            .index(this.indexPointer)
            .newindex(this.newIndexPointer)
            .gc(this.gcPointer);
        // 添加AddAttribute代理
        await this.lua.doFile(`/add-attribute-proxy.lua`);
        await this.lua.doString(`env.GetSkillLevelData(env.tSkill)`);
        // 处理完毕，料理后事
        this.lua.unmountFile('/skill-script.lua');
        for (const [, name] of Object.entries(this.script_includes)) {
            this.lua.unmountFile(name);
            delete this.script_includes[name];
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
