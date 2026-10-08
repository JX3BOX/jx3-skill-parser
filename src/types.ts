// 描述解析器配置和已实现的技能结果字段；未知游戏字段保留为 unknown。
import type { Buffer } from 'node:buffer';

export interface CreateOptions {
    /** 文件名已按 GBK 解码并统一路径和大小写；undefined 表示文件不存在。 */
    include?: (name: string) => Buffer | undefined | Promise<Buffer | undefined>;
    /** 默认缓存公共 Include 的执行结果；false 禁用缓存。 */
    cache?: string[] | 'default' | 'all' | false;
}

export interface SkillParseOptions {
    id?: number;
    /** 未指定或小于等于 0 时使用脚本的最大等级。 */
    level?: number;
    skill_name?: string;
}

export interface SkillAttribute {
    ATTRIBUTE_EFFECT_MODE: string;
    ATTRIBUTE_TYPE: string;
    param1: unknown;
    param2: unknown;
}

export interface SkillCheck {
    skillId: number;
    dwLevel: number;
    compareFlag: string | number;
}

export interface BuffCheck {
    dwBuffID: number;
    nStackNum: number;
    eCompareFlag: unknown;
    nLevel: number;
    eLevelCompareFlag: unknown;
}

export interface SkillResult {
    [field: string]: unknown;
    dwSkillID: number | undefined;
    dwLevel: number;
    dwMaxLevel: number;
    skillAttributes?: SkillAttribute[];
    checkSelfLearntSkill?: SkillCheck[];
    slowCheckSelfOwnBuff?: BuffCheck[];
    slowCheckDestOwnBuff?: BuffCheck[];
    slowCheckSelfBuff?: BuffCheck[];
    slowCheckDestBuff?: BuffCheck[];
    buffBinds?: Array<{ buffType: number; nBuffID: number; nBuffLevel: number }>;
    publicCoolDown?: number;
    subsectionSkill?: {
        nBeginInterval: number;
        nEndInterval: number;
        dwSkillID: number;
        dwSkillLevel: number;
    };
    subSkillForAreaDepths?: Array<{
        searchResult: number;
        dwSkillID: number;
        dwSkillLevel: number;
    }>;
    delaySubSkills?: Array<{ delay: number; skillId: number; dwLevel: number }>;
}
