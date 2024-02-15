---------------------------------------------------------------------->
-- �ű�����:	scripts/skill/��/��_�ٻ���Ѩ��_ѩ���᳾.lua
-- ����ʱ��:	2013/6/22 1:02:43
-- �����û�:	taoli
-- �ű�˵��:	
----------------------------------------------------------------------<
------------------------------------------------
-- ������   :  �ź�	
-- ����ʱ��	:  2011-04-05
-- Ч����ע	:   ѩ���᳾
------------------------------------------------

--------------�ű��ļ���ʼ------------------------------------------------
Include("scripts/Include/Skill.lh")
--�����滻skill�ű�Include("scripts/Include/Player.lh")

tSkillData = 
{
	{nDamageBase = 320 * 0.95, nDamageRand = 320 * 0.1, nCostMana = 0}, --level 1

};

--�����书���ܼ��������ֵ
function GetSkillLevelData(skill)

	local dwSkillLevel = skill.dwLevel;
    	
	----------------- ħ������ -------------------------------------------------
	--[[
	--��Ƕ�������Ŀ��
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK, -- ����AP�ӳ�
		ATTRIBUTE_TYPE.CAST_SKILL_TARGET_DST,
		6233,
		dwSkillLevel
		);
	--��������Ŀ�꣨Ŀǰ��������ʱһ��Ч�������ն�����һ���ű��˺���
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK, -- ����AP�ӳ�
		ATTRIBUTE_TYPE.CAST_SKILL_TARGET_DST,
		6900,
		dwSkillLevel
		);
	--]]
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK,
		ATTRIBUTE_TYPE.EXECUTE_SCRIPT,
		"skill/��/��_�ٻ���Ѩ��_ѩ���᳾.lua",
		0
	);
	----------------- ����ʩ��Buff���� ---------------------------------------------
--	skill.AddSlowCheckSelfBuff(27384, 0, BUFF_COMPARE_FLAG.EQUAL, 0, BUFF_COMPARE_FLAG.EQUAL);		-- ��������Buff
	--skill.AddSlowCheckSelfBuff(dwBuffID, nStackNum, eCompareFlag, nLevel, eLevelCompareFlag);		-- ��������Buff
	--skill.AddSlowCheckDestBuff(dwBuffID, nStackNum, eCompareFlag, nLevel, eLevelCompareFlag);		-- ����Ŀ��Buff
	--skill.AddSlowCheckSelfOwnBuff(dwBuffID, nStackNum, eCompareFlag, nLevel, eLevelCompareFlag);	-- �������������Լ���Buff
	--skill.AddSlowCheckDestOwnBuff(dwBuffID, nStackNum, eCompareFlag, nLevel, eLevelCompareFlag);	-- ����Ŀ�������Լ���Buff   
	----------------- BUFF��� -------------------------------------------------
	--skill.BindBuff(1, nBuffID, nBuffLevel);		-- ����1��λBuff
	--skill.BindBuff(2, nBuffID, nBuffLevel);		-- ����2��λBuff
	--skill.BindBuff(3, nBuffID, nBuffLevel);		-- ����3��λBuff
	--skill.BindBuff(4, nBuffID, nBuffLevel);		-- ����4��λBuff

	----------------- ����Cool down --------------------------------------------
	-- ����CD
	skill.SetPublicCoolDown(16);	
	skill.SetCheckCoolDown(1, 444);
	--skill.SetNormalCoolDown(1, 1810);
	-- ����CD, CoolDownIndexΪCDλ(��3��), nCoolDownIDΪCoolDownList.tab�ڵ�CDID
	--skill.SetNormalCoolDown(CoolDownIndex, nCoolDownID);	--������ͨCD
	--skill.SetCheckCoolDown(CoolDownIndex, nCoolDownID);	--ֻ��鲻�ߵ�CD
	----------------- ����������� ---------------------------------------------
	--ע��,��Ȼ��Щ���ݿ����ڽű��ڸ���,��һ�㲻���κθĶ�!
	--skill.dwLevelUpExp	= 0;    				-- ��������
	--skill.nExpAddOdds		= 1024;					-- ������������������
	--skill.nPlayerLevelLimit	= 0;				-- ��ɫ����ѧ��ü���������ﵽ����͵ȼ�

	----------------- ���ܳ�� -------------------------------------------------
	--skill.nBaseThreat		= 0;

	----------------- �������� -------------------------------------------------
	--skill.nCostLife		= 0;									-- ������������ֵ
	--skill.nCostMana      	= tSkillData[dwSkillLevel].nCostMana;	-- �������ĵ�����
	--skill.nCostStamina	= 0;									-- �������ĵ�����
	--skill.nCostItemType	= 0;									-- �������ĵ���Ʒ����
	--skill.nCostItemIndex	= 0;									-- �������ĵ���Ʒ����ID
	if dwSkillLevel <= 6 then
		skill.nCostManaBasePercent = 914*0.2*0.5;	-- �������ĵ�����
	elseif dwSkillLevel <= 12 then
		skill.nCostManaBasePercent = 914*0.4*0.5;	-- �������ĵ�����
	elseif dwSkillLevel <= 18 then
		skill.nCostManaBasePercent = 914*0.6*0.5;	-- �������ĵ�����
	elseif dwSkillLevel <= 24 then
		skill.nCostManaBasePercent = 914*0.8*0.5;	-- �������ĵ�����
	else
		skill.nCostManaBasePercent = 914*0.5;	-- �������ĵ�����
	end
	skill.nCostSprintPower = 20 * CONSUME_BASE;							-- ������������ֵ
		
	----------------- ������� -------------------------------------------------
	--skill.bIsAccumulate	= false;				-- �����Ƿ���Ҫ����
	--skill.SetSubsectionSkill(nBeginInterval, nEndInterval, dwSkillID, dwSkillLevel)
    
	----------------- ��״������� ---------------------------------------------
	--skill.nChainBranch	= 1;					--��״���ܷ�֧��
	--skill.nChainDepth		= 3;					--��״���ܲ���
	--��״���ܵ��Ӽ�����skill.SetSubsectionSkill()�趨
    
    
	----------------- ʩ�ž��� -------------------------------------------------
	skill.nMinRadius = 0 * LENGTH_BASE;		-- ����ʩ�ŵ���С���� 
	skill.nMaxRadius = 20 * LENGTH_BASE;		-- ����ʩ�ŵ������� 

	----------------- ���÷�Χ -------------------------------------------------
	skill.nAngleRange = 128;					-- ������Χ�����νǶȷ�Χ 
	skill.nAreaRadius = 6 * LENGTH_BASE;		-- �������ð뾶 
	skill.nTargetCountLimit = 8;				-- ��������Ŀ����������,(С��0 ����Ŀ������������) 
    
	----------------- ʱ����� -------------------------------------------------
	--skill.nPrepareFrames  	= 0;				-- ����֡��
	skill.nMinChannelInterval = 1;-- ͨ�������ʱ�� 
	skill.nChannelInterval = 16; 				-- ͨ�������ʱ�� 
	skill.nChannelFrame = 80;	 			-- ͨ��������ʱ�䣬��λ֡��
	skill.nMinChannelFrame = 1
	skill.nBulletVelocity = 0;				-- �ӵ��ٶȣ���λ ��/֡
	skill.bFullAngleInAir  = true
    
	----------------- ����� -------------------------------------------------
	--skill.bIsFormationSkill	= false;			-- �Ƿ����ۼ���
	--skill.nFormationRange		= 0 * LENGTH_BASE;	-- ����ķ�Χ
	--skill.nLeastFormationPopulation	= 2;		-- ����ķ�Χ�����ٶ�Ա���������ӳ���
    
	----------------- Ŀ��Ѫ������ ---------------------------------------------
	--skill.nTargetLifePercentMin	= 0;			-- Ѫ����Сֵ>=
	--skill.nTargetLifePercentMax	= 100;			-- Ѫ�����ֵ<=
    
	----------------- ����Ѫ������ ---------------------------------------------
	--skill.nSelfLifePercentMin	= 0;				-- Ѫ����Сֵ>=
	--skill.nSelfLifePercentMax	= 100;				-- Ѫ�����ֵ<=
    
	----------------- ���˴��������� -------------------------------------------------
	--skill.nBeatBackRate       = 1 * PERCENT_BASE;		-- ���ܱ����˵ĸ���,Ĭ��1024
	--skill.nBrokenRate         = 1 * PERCENT_BASE;		-- ���ܱ���ϵĸ���,Ĭ��1024
	--skill.nBreakRate			= 0 * PERCENT_BASE;		-- ���Ŀ��ʩ���ĸ���,����1024
	
	--skill.nDismountingRate	= 0;					-- ��Ŀ�����������,����1024��Ĭ��0
	
	----------------- �����˺���� ---------------------------------------------
	--skill.nWeaponDamagePercent		= 0;			-- �����˺��ٷֱ�,���⹦�˺����á���0��ʾ�˴��⹦���������������˺�,1024Ϊ100%
	
	return true;
end



-- �Լ���ִ�е�����������飬�ú��������ڿ�ʼʩ�ż��ܵ�ʱ�򱻵��ã���ȷ���Ƿ����ʩ�Ÿû���
-- Player: ����ʩ����, nPreResult: �������水��һ�������жϵĽ��
-- ע�⣬�����Խű����صĽ��Ϊ׼
function CanCast(player, nPreResult)    --�ж���ҵ�״̬�����ж��Ƿ���Է�������
	if nPreResult == SKILL_RESULT_CODE.SUCCESS then
		if player.GetSkillLevel(24912) == 1 then
			if player.GetSkillLevel(5762) == 1 then
				player.AddBuff(player.dwID, player.nLevel, 17901, 1, 3)
			else
				player.AddBuff(player.dwID, player.nLevel, 17901, 1, 4)
			end
			--player.AddBuff(player.dwID, player.nLevel, 24271, 1) --������ѩ�˺�����
		end
		if player.GetSkillLevel(14654) == 1 then
			player.DelMultiGroupBuffByID(23099)
		end

		player.DelBuff(27384, 1) --�������buff�Ƴ�
		wanhuaguNewPower(player, 5) --��ɾ����
	end
	return nPreResult;
end

-- ��������ʱ���ô˺���������skillΪ�������skill����һ�λ��ĳ������ʱҲ���ô˽ű�
function OnSkillLevelUp(skill, player)
	
end

--ħ������Ӧ��ʱ��ִ�к���,dwCharacterID��ħ���������õ�Ŀ��ID
function Apply(dwCharacterID)
	local player = GetPlayer(dwCharacterID)
	if not player then
		return
	end

	--��ѩ����
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
	--�����˹���1��dot��ÿ����1��dot
	if player.GetSkillLevel(32480) == 1 then
		--̤��ָ��ɴ����˺�
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
		if player.GetSkillLevel(24912) == 1 then --����7��
			nNeedStack = 7
		end
		if player.GetBuff(6253, 1).nStackNum == nNeedStack then --�����������1��
			player.CastSkill(32481, nCastLv, nType, dwID)
			player.DelMultiGroupBuffByID(6253)
		end
		
	end

	if player.GetSkillLevel(32628) == 1 then --��ѩ�����˺�
		player.CastSkill(33322, 1, player.GetSkillTarget())
	end
	
	local nlev = player.GetSkillLevel(2636)
	local nType, nID = player.GetSkillTarget()
	--�ж���ѩ����Ŀ������
	if player.GetSkillLevel(14654) == 1 and nlev ~= 0 then
		--[[]
		player.CastSkill(14655, 1, player.GetSkillTarget())	--�ж�Ŀ������
		
		local nbuff_mark = player.GetBuff(9731, 1)		--Ŀ���������buff
		if nbuff_mark and nlev ~= 0 then
			if nbuff_mark.nStackNum > 1 then
				--���buff����1�㣬����������
				player.CastSkill(6233, nlev, player.GetSkillTarget())
				--player.CastSkill(6900, nlev, player.GetSkillTarget())
			else
				--���buff����1�㣬��20%�˺�
				player.CastSkill(14656, nlev, player.GetSkillTarget())
				--player.CastSkill(14657, nlev, player.GetSkillTarget())
			end
		end
		--]]
		--�����˹���1��
		if player.IsHaveBuff(23096, 1) then
			player.AddBuff(player.dwID, player.nLevel, 23099, 1)
			local buff = player.GetBuff(23099, 1)
			if buff then
				local nCount = 5
				if player.GetSkillLevel(24912) == 1 then --���������˹���2��
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
				player.CastSkillXYZ(33231, nlev, npc.nX, npc.nY, npc.nZ) --ע�⣬�����￪ʼgetskilltarget�ͻ��ˣ���Ҫ�õ�skilltarget�Ĵ������ǰ��
			end
		end
	else
		if nlev ~= 0 then
			player.CastSkill(6233, nlev, player.GetSkillTarget())
			--player.CastSkill(6900, nlev, player.GetSkillTarget())
		end
	end

	--��ѩ���
	if player.GetSkillLevel(24912) == 1 then
		if player.GetSkillLevel(5762) == 1 then
			player.AddBuff(player.dwID, player.nLevel, 17901, 1, 3)
		else
			player.AddBuff(player.dwID, player.nLevel, 17901, 1, 4)
		end
	end
	
	--����ʩչ��ѩ���Ӽ���Ч��
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

--ħ�����Է�Ӧ��ʱ��ִ�к���,dwCharacterID��ħ���������õ�Ŀ��ID
function UnApply(dwCharacterID)
end
