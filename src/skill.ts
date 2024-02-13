import iconv from 'iconv-lite';
export interface SkillAttribute {
    ATTRIBUTE_EFFECT_MODE: string;
    ATTRIBUTE_TYPE: string;
    param1: any;
    param2: any;
}

export interface SkillCheck {
    skillId: number;
    dwLevel: number;
    compareFlag: number;
}

export class Skill {
    [key: string]: any;

    constructor(defaults: any) {
        Object.assign(this, defaults);
    }

    $getResult() {
        return Object.fromEntries(
            Object.entries(this).filter(([_, value]) => typeof value !== 'function'),
        );
    }

    AddCheckSelfLearntSkill(skillId: number, dwLevel: number, compareFlag: string) {
        if (!this.checkSelfLearntSkill) {
            this.checkSelfLearntSkill = [];
        }
        this.checkSelfLearntSkill.push({
            skillId,
            dwLevel,
            compareFlag,
        });
    }

    AddSlowCheckSelfOwnBuff(
        dwBuffID: number,
        nStackNum: number,
        eCompareFlag: string,
        nLevel: number,
        eLevelCompareFlag: string,
    ) {
        if (!this.slowCheckSelfOwnBuff) {
            this.slowCheckSelfOwnBuff = [];
        }
        this.slowCheckSelfOwnBuff.push({
            dwBuffID,
            nStackNum,
            eCompareFlag,
            nLevel,
            eLevelCompareFlag,
        });
    }

    AddSlowCheckDestOwnBuff(
        dwBuffID: number,
        nStackNum: number,
        eCompareFlag: string,
        nLevel: number,
        eLevelCompareFlag: string,
    ) {
        if (!this.slowCheckDestOwnBuff) {
            this.slowCheckDestOwnBuff = [];
        }
        this.slowCheckDestOwnBuff.push({
            dwBuffID,
            nStackNum,
            eCompareFlag,
            nLevel,
            eLevelCompareFlag,
        });
    }

    AddSlowCheckSelfBuff(
        dwBuffID: number,
        nStackNum: number,
        eCompareFlag: string,
        nLevel: number,
        eLevelCompareFlag: string,
    ) {
        if (!this.slowCheckSelfBuff) {
            this.slowCheckSelfBuff = [];
        }
        this.slowCheckSelfBuff.push({
            dwBuffID,
            nStackNum,
            eCompareFlag,
            nLevel,
            eLevelCompareFlag,
        });
    }

    AddSlowCheckDestBuff(
        dwBuffID: number,
        nStackNum: number,
        eCompareFlag: string,
        nLevel: number,
        eLevelCompareFlag: string,
    ) {
        if (!this.slowCheckDestBuff) {
            this.slowCheckDestBuff = [];
        }
        this.slowCheckDestBuff.push({
            dwBuffID,
            nStackNum,
            eCompareFlag,
            nLevel,
            eLevelCompareFlag,
        });
    }
    _AddAttribute(mode: string, type: string, param1: any, param2: any) {
        if (!this.skillAttributes) {
            this.skillAttributes = [];
        }
        if (typeof param1 === 'string') {
            param1 = iconv.decode(Buffer.from(param1, 'base64'), 'gbk');
        }
        if (typeof param2 === 'string') {
            param2 = iconv.decode(Buffer.from(param2, 'base64'), 'gbk');
        }
        this.skillAttributes.push({
            ATTRIBUTE_EFFECT_MODE: mode,
            ATTRIBUTE_TYPE: type,
            param1,
            param2,
        });
    }
    GetAttribute() {}
    BindBuff(buffType: number, nBuffID: number, nBuffLevel: number) {
        if (buffType > 4 || buffType < 1) {
            throw new Error('buffType must be 1-4');
        }
        if (!this.buffBinds) {
            this.buffBinds = [];
        }
        this.buffBinds.push({
            buffType,
            nBuffID,
            nBuffLevel,
        });
    }
    GetBuffBind() {}
    SetBuffRecipe() {
        console.warn('[SetBuffRecipe] 缺少样本暂未实现');
    }
    SetPublicCoolDown(params: number) {
        this.publicCoolDown = params;
    }
    GetPublicCooldown() {}
    SetCheckCoolDown(nCoolDownIndex: number, cooldown: number) {
        this[`checkCoolDownSlot${nCoolDownIndex}`] = cooldown;
    }
    GetCheckCoolDownCount() {}
    GetCheckCoolDownID() {}
    SetNormalCoolDown(nCoolDownIndex: number, cooldown: number) {
        this[`normalCoolDownSlot${nCoolDownIndex}`] = cooldown;
    }
    GetNormalCooldownCount() {}
    GetNormalCooldownID() {}
    SetSubsectionSkill(
        nBeginInterval: number,
        nEndInterval: number,
        dwSkillID: number,
        dwSkillLevel: number,
    ) {
        if (!this.subsectionSkill) {
            this.subsectionSkill = {
                nBeginInterval,
                nEndInterval,
                dwSkillID,
                dwSkillLevel,
            };
        }
    }
    SetSunSubsectionSkill() {
        console.warn('[SetSunSubsectionSkill] 缺少样本暂未实现');
    }
    SetMoonSubsectionSkill() {
        console.warn('[SetMoonSubsectionSkill] 缺少样本暂未实现');
    }
    UITestCast() {}
    CheckWeaponRequest() {}
    CheckMountRequest() {}
    CheckCostItemRequest() {}
    CheckDistance() {}
    CheckAngle() {}
    CheckCasterState() {}
    CheckTargetState() {}
    IsRelationEnemy() {
        console.warn('[IsRelationEnemy] 缺少样本暂未实现');
    }
    SetSubSkillForAreaDepth(searchResult: number, dwSkillID: number, dwSkillLevel: number) {
        if (!this.subSkillForAreaDepths) {
            this.subSkillForAreaDepths = [];
        }
        this.subSkillForAreaDepths.push({
            searchResult,
            dwSkillID,
            dwSkillLevel,
        });
    }
    SetDelaySubSkill(delay: number, skillId: number, dwLevel: number) {
        if (!this.delaySubSkills) {
            this.delaySubSkills = [];
        }
        this.delaySubSkills.push({
            delay,
            skillId,
            dwLevel,
        });
    }
    SetHoardSkill() {
        console.warn('[SetHoardSkill] 缺少样本暂未实现');
    }
}
