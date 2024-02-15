---------------------------------------------------------------------->
-- 脚本名称:	scripts/skill/万花/万花_百花拂穴手_雪舞轻尘.lua
-- 更新时间:	2013/6/22 1:02:43
-- 更新用户:	taoli
-- 脚本说明:	
----------------------------------------------------------------------<
------------------------------------------------
-- 创建人   :  张豪	
-- 创建时间	:  2011-04-05
-- 效果备注	:   雪舞轻尘
------------------------------------------------

--------------脚本文件开始------------------------------------------------
Include("scripts/Include/Skill.lh")
--批量替换skill脚本Include("scripts/Include/Player.lh")

tSkillData = 
{
	{nDamageBase = 320 * 0.95, nDamageRand = 320 * 0.1, nCostMana = 0}, --level 1

};

--设置武功技能级别相关数值
function GetSkillLevelData(skill)

	local dwSkillLevel = skill.dwLevel;
    	
	----------------- 魔法属性 -------------------------------------------------
	--[[
	--打非定身锁足目标
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK, -- 花间AP加成
		ATTRIBUTE_TYPE.CAST_SKILL_TARGET_DST,
		6233,
		dwSkillLevel
		);
	--打定身锁足目标（目前和上述都时一个效果，最终都调用一个脚本伤害）
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK, -- 花间AP加成
		ATTRIBUTE_TYPE.CAST_SKILL_TARGET_DST,
		6900,
		dwSkillLevel
		);
	--]]
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK,
		ATTRIBUTE_TYPE.EXECUTE_SCRIPT,
		"skill/万花/万花_百花拂穴手_雪舞轻尘.lua",
		0
	);
	----------------- 技能施放Buff需求 ---------------------------------------------
--	skill.AddSlowCheckSelfBuff(27384, 0, BUFF_COMPARE_FLAG.EQUAL, 0, BUFF_COMPARE_FLAG.EQUAL);		-- 需求自身Buff
	--skill.AddSlowCheckSelfBuff(dwBuffID, nStackNum, eCompareFlag, nLevel, eLevelCompareFlag);		-- 需求自身Buff
	--skill.AddSlowCheckDestBuff(dwBuffID, nStackNum, eCompareFlag, nLevel, eLevelCompareFlag);		-- 需求目标Buff
	--skill.AddSlowCheckSelfOwnBuff(dwBuffID, nStackNum, eCompareFlag, nLevel, eLevelCompareFlag);	-- 需求自身属于自己的Buff
	--skill.AddSlowCheckDestOwnBuff(dwBuffID, nStackNum, eCompareFlag, nLevel, eLevelCompareFlag);	-- 需求目标属于自己的Buff   
	----------------- BUFF相关 -------------------------------------------------
	--skill.BindBuff(1, nBuffID, nBuffLevel);		-- 设置1号位Buff
	--skill.BindBuff(2, nBuffID, nBuffLevel);		-- 设置2号位Buff
	--skill.BindBuff(3, nBuffID, nBuffLevel);		-- 设置3号位Buff
	--skill.BindBuff(4, nBuffID, nBuffLevel);		-- 设置4号位Buff

	----------------- 设置Cool down --------------------------------------------
	-- 公共CD
	skill.SetPublicCoolDown(16);	
	skill.SetCheckCoolDown(1, 444);
	--skill.SetNormalCoolDown(1, 1810);
	-- 技能CD, CoolDownIndex为CD位(共3个), nCoolDownID为CoolDownList.tab内的CDID
	--skill.SetNormalCoolDown(CoolDownIndex, nCoolDownID);	--技能普通CD
	--skill.SetCheckCoolDown(CoolDownIndex, nCoolDownID);	--只检查不走的CD
	----------------- 经验升级相关 ---------------------------------------------
	--注意,虽然这些内容可以在脚本内更改,但一般不做任何改动!
	--skill.dwLevelUpExp	= 0;    				-- 升级经验
	--skill.nExpAddOdds		= 1024;					-- 技能熟练度增长概率
	--skill.nPlayerLevelLimit	= 0;				-- 角色可以学会该技能所必须达到的最低等级

	----------------- 技能仇恨 -------------------------------------------------
	--skill.nBaseThreat		= 0;

	----------------- 技能消耗 -------------------------------------------------
	--skill.nCostLife		= 0;									-- 技能消耗生命值
	--skill.nCostMana      	= tSkillData[dwSkillLevel].nCostMana;	-- 技能消耗的内力
	--skill.nCostStamina	= 0;									-- 技能消耗的体力
	--skill.nCostItemType	= 0;									-- 技能消耗的物品类型
	--skill.nCostItemIndex	= 0;									-- 技能消耗的物品索引ID
	if dwSkillLevel <= 6 then
		skill.nCostManaBasePercent = 914*0.2*0.5;	-- 技能消耗的内力
	elseif dwSkillLevel <= 12 then
		skill.nCostManaBasePercent = 914*0.4*0.5;	-- 技能消耗的内力
	elseif dwSkillLevel <= 18 then
		skill.nCostManaBasePercent = 914*0.6*0.5;	-- 技能消耗的内力
	elseif dwSkillLevel <= 24 then
		skill.nCostManaBasePercent = 914*0.8*0.5;	-- 技能消耗的内力
	else
		skill.nCostManaBasePercent = 914*0.5;	-- 技能消耗的内力
	end
	skill.nCostSprintPower = 20 * CONSUME_BASE;							-- 技能消耗气力值
		
	----------------- 聚气相关 -------------------------------------------------
	--skill.bIsAccumulate	= false;				-- 技能是否需要聚气
	--skill.SetSubsectionSkill(nBeginInterval, nEndInterval, dwSkillID, dwSkillLevel)
    
	----------------- 链状技能相关 ---------------------------------------------
	--skill.nChainBranch	= 1;					--链状技能分支数
	--skill.nChainDepth		= 3;					--链状技能层数
	--链状技能的子技能用skill.SetSubsectionSkill()设定
    
    
	----------------- 施放距离 -------------------------------------------------
	skill.nMinRadius = 0 * LENGTH_BASE;		-- 技能施放的最小距离 
	skill.nMaxRadius = 20 * LENGTH_BASE;		-- 技能施放的最大距离 

	----------------- 作用范围 -------------------------------------------------
	skill.nAngleRange = 128;					-- 攻击范围的扇形角度范围 
	skill.nAreaRadius = 6 * LENGTH_BASE;		-- 技能作用半径 
	skill.nTargetCountLimit = 8;				-- 技能作用目标数量限制,(小于0 代表目标数量不限制) 
    
	----------------- 时间相关 -------------------------------------------------
	--skill.nPrepareFrames  	= 0;				-- 吟唱帧数
	skill.nMinChannelInterval = 1;-- 通道技间隔时间 
	skill.nChannelInterval = 16; 				-- 通道技间隔时间 
	skill.nChannelFrame = 80;	 			-- 通道技持续时间，单位帧数
	skill.nMinChannelFrame = 1
	skill.nBulletVelocity = 0;				-- 子弹速度，单位 点/帧
	skill.bFullAngleInAir  = true
    
	----------------- 阵法相关 -------------------------------------------------
	--skill.bIsFormationSkill	= false;			-- 是否阵眼技能
	--skill.nFormationRange		= 0 * LENGTH_BASE;	-- 结阵的范围
	--skill.nLeastFormationPopulation	= 2;		-- 结阵的范围的最少队员数（包括队长）
    
	----------------- 目标血量需求 ---------------------------------------------
	--skill.nTargetLifePercentMin	= 0;			-- 血量最小值>=
	--skill.nTargetLifePercentMax	= 100;			-- 血量最大值<=
    
	----------------- 自身血量需求 ---------------------------------------------
	--skill.nSelfLifePercentMin	= 0;				-- 血量最小值>=
	--skill.nSelfLifePercentMax	= 100;				-- 血量最大值<=
    
	----------------- 打退打断落马相关 -------------------------------------------------
	--skill.nBeatBackRate       = 1 * PERCENT_BASE;		-- 技能被打退的概率,默认1024
	--skill.nBrokenRate         = 1 * PERCENT_BASE;		-- 技能被打断的概率,默认1024
	--skill.nBreakRate			= 0 * PERCENT_BASE;		-- 打断目标施法的概率,基数1024
	
	--skill.nDismountingRate	= 0;					-- 将目标击落下马几率,基数1024，默认0
	
	----------------- 武器伤害相关 ---------------------------------------------
	--skill.nWeaponDamagePercent		= 0;			-- 武器伤害百分比,对外功伤害有用。填0表示此次外功攻击不计算武器伤害,1024为100%
	
	return true;
end



-- 对技能执行的特殊条件检查，该函数可以在开始施放技能的时候被调用，以确定是否可以施放该机能
-- Player: 技能施放者, nPreResult: 程序里面按照一般流程判断的结果
-- 注意，最终以脚本返回的结果为准
function CanCast(player, nPreResult)    --判断玩家的状态，以判断是否可以发出技能
	if nPreResult == SKILL_RESULT_CODE.SUCCESS then
		if player.GetSkillLevel(24912) == 1 then
			if player.GetSkillLevel(5762) == 1 then
				player.AddBuff(player.dwID, player.nLevel, 17901, 1, 3)
			else
				player.AddBuff(player.dwID, player.nLevel, 17901, 1, 4)
			end
			--player.AddBuff(player.dwID, player.nLevel, 24271, 1) --丹鼎快雪伤害增加
		end
		if player.GetSkillLevel(14654) == 1 then
			player.DelMultiGroupBuffByID(23099)
		end

		player.DelBuff(27384, 1) --青歌需求buff移除
		wanhuaguNewPower(player, 5) --增删能量
	end
	return nPreResult;
end

-- 技能升级时调用此函数，参数skill为升级后的skill，第一次获得某个技能时也调用此脚本
function OnSkillLevelUp(skill, player)
	
end

--魔法属性应用时的执行函数,dwCharacterID是魔法属性作用的目标ID
function Apply(dwCharacterID)
	local player = GetPlayer(dwCharacterID)
	if not player then
		return
	end

	--新雪中行
	if player.GetSkillLevel(32477) == 1 then
		local buff_xzx = player.GetBuff(24599, 0)
		if buff_xzx then
			--player.AddBuff(player.dwID, player.nLevel, 24210, 1, 100, 0, buff_xzx.nStackNum)
			if buff_xzx.nStackNum < 3 then
				player.AddBuff(player.dwID, player.nLevel, 24599, math.min(buff_xzx.nLevel + 1, 3), 100, 0, math.min(buff_xzx.nLevel + 1, 3))
			end
		else
			player.AddBuff(player.dwID, player.nLevel, 24599, 1, 100, 0, 1)
		end
	end
	--完整运功上1层dot，每跳上1层dot
	if player.GetSkillLevel(32480) == 1 then
		--踏歌指造成大量伤害
		if player.GetSkillLevel(32483) == 1 then
			if player.IsHaveBuff(24595, 1) then
				player.CastSkill(32501, 4, player.GetSkillTarget())
				--print(player.CastSkill(33091, 4, player.GetSkillTarget()))
				player.DelBuff(24595, 1)
			end
		end
		local nType, dwID = player.GetSkillTarget()
		local nCastLv = 1
		if nType == TARGET.NPC then
			nCastLv = 1
		else
			nCastLv = 2
		end
		player.CastSkill(32481, nCastLv, nType, dwID)
		
		player.AddBuff(dwCharacterID, player.nLevel, 6253, 1, 1)
		local nNeedStack = 5
		if player.GetSkillLevel(24912) == 1 then --丹鼎7跳
			nNeedStack = 7
		end
		if player.GetBuff(6253, 1).nStackNum == nNeedStack then --读满后额外上1层
			player.CastSkill(32481, nCastLv, nType, dwID)
			player.DelMultiGroupBuffByID(6253)
		end
		
	end

	if player.GetSkillLevel(32628) == 1 then --香雪额外伤害
		player.CastSkill(33322, 1, player.GetSkillTarget())
	end
	
	local nlev = player.GetSkillLevel(2636)
	local nType, nID = player.GetSkillTarget()
	--判定快雪命中目标数量
	if player.GetSkillLevel(14654) == 1 and nlev ~= 0 then
		--[[]
		player.CastSkill(14655, 1, player.GetSkillTarget())	--判定目标数量
		
		local nbuff_mark = player.GetBuff(9731, 1)		--目标数量标记buff
		if nbuff_mark and nlev ~= 0 then
			if nbuff_mark.nStackNum > 1 then
				--标记buff超过1层，打正常技能
				player.CastSkill(6233, nlev, player.GetSkillTarget())
				--player.CastSkill(6900, nlev, player.GetSkillTarget())
			else
				--标记buff等于1层，多20%伤害
				player.CastSkill(14656, nlev, player.GetSkillTarget())
				--player.CastSkill(14657, nlev, player.GetSkillTarget())
			end
		end
		--]]
		--完整运功多1跳
		if player.IsHaveBuff(23096, 1) then
			player.AddBuff(player.dwID, player.nLevel, 23099, 1)
			local buff = player.GetBuff(23099, 1)
			if buff then
				local nCount = 5
				if player.GetSkillLevel(24912) == 1 then --丹鼎完整运功多2跳
					nCount = nCount + 2
				end
				if buff.nStackNum >= nCount then
					player.DelMultiGroupBuffByID(23099)
					player.DelBuff(23096, 1)
					player.CastSkill(14656, nlev, player.GetSkillTarget())
				end
			end
		end
		player.CastSkill(6233, nlev, player.GetSkillTarget())
	elseif player.GetSkillLevel(32480) == 1 and nType == TARGET.NPC and nlev ~= 0 then
		local nResult = player.CastSkill(33222, nlev, player.GetSkillTarget())
		if nResult == 1 then
			local npc = GetNpc(nID)
			if npc then
				npc.AddBuff(player.dwID, player.nLevel, 24741, 1)
				player.CastSkillXYZ(33231, nlev, npc.nX, npc.nY, npc.nZ) --注意，从这里开始getskilltarget就坏了，需要用到skilltarget的代码放在前面
			end
		end
	else
		if nlev ~= 0 then
			player.CastSkill(6233, nlev, player.GetSkillTarget())
			--player.CastSkill(6900, nlev, player.GetSkillTarget())
		end
	end

	--快雪免控
	if player.GetSkillLevel(24912) == 1 then
		if player.GetSkillLevel(5762) == 1 then
			player.AddBuff(player.dwID, player.nLevel, 17901, 1, 3)
		else
			player.AddBuff(player.dwID, player.nLevel, 17901, 1, 4)
		end
	end
	
	--完整施展快雪叠加加速效果
	if player.GetSkillLevel(5764) == 1 then
		player.AddBuff(dwCharacterID, player.nLevel, 6253, 1, 1)
		if player.GetBuff(6253, 1).nStackNum == 5 then
			if not player.GetBuff(6252, 1) then
				player.AddBuff(dwCharacterID, player.nLevel, 6251, 1, 1)
				player.DelBuff(6253, 1)
				player.DelBuff(6253, 1)
				player.DelBuff(6253, 1)
				player.DelBuff(6253, 1)
				player.DelBuff(6253, 1)
				--player.AddBuff(dwCharacterID, player.nLevel, 6252, 1, 1)
			end
		end
	end

	
	local buff = player.GetBuff(12670, 0)
	if not buff then
		return
	end

	if buff then
		if buff.nCustomValue >= 4 then
			player.DelBuffByID(12670)
		else
			buff.nCustomValue = buff.nCustomValue + 1
		end
	end
end

--魔法属性反应用时的执行函数,dwCharacterID是魔法属性作用的目标ID
function UnApply(dwCharacterID)
end
