---------------------------------------------------------------------->
-- 脚本名称:	scripts/skill/江湖/心法秘籍属性头文件.lua
-- 更新时间:	2021/1/29 星期五 上午 9:58:30
-- 更新用户:	hudongchao
-- 脚本说明:	
----------------------------------------------------------------------<
local tMentalSkillData =
{
	[1] =	--dps会心
	{
		{BasePotentialAdd = 15, AllTypeCriticalStrike = 29, AllTypeOverCome = 0, TherapyPowerBase = 0, StrainBase = 29, DecriticalDamagePowerBase = 29, VitalityBase = 0, AllTypeShield = 0, SurplusValueBase = 0},
		{BasePotentialAdd = 45, AllTypeCriticalStrike = 87, AllTypeOverCome = 0, TherapyPowerBase = 0, StrainBase = 87, DecriticalDamagePowerBase = 87, VitalityBase = 0, AllTypeShield = 0, SurplusValueBase = 0},
		{BasePotentialAdd = 75, AllTypeCriticalStrike = 145, AllTypeOverCome = 0, TherapyPowerBase = 0, StrainBase = 145, DecriticalDamagePowerBase = 145, VitalityBase = 0, AllTypeShield = 0, SurplusValueBase = 0},
		{BasePotentialAdd = 105, AllTypeCriticalStrike = 203, AllTypeOverCome = 0, TherapyPowerBase = 0, StrainBase = 203, DecriticalDamagePowerBase = 203, VitalityBase = 0, AllTypeShield = 0, SurplusValueBase = 0},
		{BasePotentialAdd = 135, AllTypeCriticalStrike = 261, AllTypeOverCome = 0, TherapyPowerBase = 0, StrainBase = 261, DecriticalDamagePowerBase = 261, VitalityBase = 0, AllTypeShield = 0, SurplusValueBase = 0},
	},
	[2] =	--dps破防
	{
		{BasePotentialAdd = 15, AllTypeCriticalStrike = 0, AllTypeOverCome = 29, TherapyPowerBase = 0, StrainBase = 29, DecriticalDamagePowerBase = 29, VitalityBase = 0, AllTypeShield = 0, SurplusValueBase = 0},
		{BasePotentialAdd = 45, AllTypeCriticalStrike = 0, AllTypeOverCome = 87, TherapyPowerBase = 0, StrainBase = 87, DecriticalDamagePowerBase = 87, VitalityBase = 0, AllTypeShield = 0, SurplusValueBase = 0},
		{BasePotentialAdd = 75, AllTypeCriticalStrike = 0, AllTypeOverCome = 145, TherapyPowerBase = 0, StrainBase = 145, DecriticalDamagePowerBase = 145, VitalityBase = 0, AllTypeShield = 0, SurplusValueBase = 0},
		{BasePotentialAdd = 105, AllTypeCriticalStrike = 0, AllTypeOverCome = 203, TherapyPowerBase = 0, StrainBase = 203, DecriticalDamagePowerBase = 203, VitalityBase = 0, AllTypeShield = 0, SurplusValueBase = 0},
		{BasePotentialAdd = 135, AllTypeCriticalStrike = 0, AllTypeOverCome = 261, TherapyPowerBase = 0, StrainBase = 261, DecriticalDamagePowerBase = 261, VitalityBase = 0, AllTypeShield = 0, SurplusValueBase = 0},
	},
	[3] =	--纯疗
	{
		{BasePotentialAdd = 15, AllTypeCriticalStrike = 0, AllTypeOverCome = 0, TherapyPowerBase = 22, StrainBase = 0, DecriticalDamagePowerBase = 29, VitalityBase = 0, AllTypeShield = 0, SurplusValueBase = 0},
		{BasePotentialAdd = 45, AllTypeCriticalStrike = 0, AllTypeOverCome = 0, TherapyPowerBase = 67, StrainBase = 0, DecriticalDamagePowerBase = 87, VitalityBase = 0, AllTypeShield = 0, SurplusValueBase = 0},
		{BasePotentialAdd = 75, AllTypeCriticalStrike = 0, AllTypeOverCome = 0, TherapyPowerBase = 112, StrainBase = 0, DecriticalDamagePowerBase = 145, VitalityBase = 0, AllTypeShield = 0, SurplusValueBase = 0},
		{BasePotentialAdd = 105, AllTypeCriticalStrike = 0, AllTypeOverCome = 0, TherapyPowerBase = 157, StrainBase = 0, DecriticalDamagePowerBase = 203, VitalityBase = 0, AllTypeShield = 0, SurplusValueBase = 0},
		{BasePotentialAdd = 135, AllTypeCriticalStrike = 0, AllTypeOverCome = 0, TherapyPowerBase = 202, StrainBase = 0, DecriticalDamagePowerBase = 261, VitalityBase = 0, AllTypeShield = 0, SurplusValueBase = 0},
	},
	[4] =	--会心治疗
	{
		{BasePotentialAdd = 15, AllTypeCriticalStrike = 29, AllTypeOverCome = 0, TherapyPowerBase = 8, StrainBase = 0, DecriticalDamagePowerBase = 29, VitalityBase = 0, AllTypeShield = 0, SurplusValueBase = 0},
		{BasePotentialAdd = 45, AllTypeCriticalStrike = 87, AllTypeOverCome = 0, TherapyPowerBase = 25, StrainBase = 0, DecriticalDamagePowerBase = 87, VitalityBase = 0, AllTypeShield = 0, SurplusValueBase = 0},
		{BasePotentialAdd = 75, AllTypeCriticalStrike = 145, AllTypeOverCome = 0, TherapyPowerBase = 42, StrainBase = 0, DecriticalDamagePowerBase = 145, VitalityBase = 0, AllTypeShield = 0, SurplusValueBase = 0},
		{BasePotentialAdd = 105, AllTypeCriticalStrike = 203, AllTypeOverCome = 0, TherapyPowerBase = 59, StrainBase = 0, DecriticalDamagePowerBase = 203, VitalityBase = 0, AllTypeShield = 0, SurplusValueBase = 0},
		{BasePotentialAdd = 135, AllTypeCriticalStrike = 261, AllTypeOverCome = 0, TherapyPowerBase = 76, StrainBase = 0, DecriticalDamagePowerBase = 261, VitalityBase = 0, AllTypeShield = 0, SurplusValueBase = 0},
	},
	[5] =	--防御
	{
		{BasePotentialAdd = 0, AllTypeCriticalStrike = 0, AllTypeOverCome = 0, TherapyPowerBase = 0, StrainBase = 0, DecriticalDamagePowerBase = 0, VitalityBase = 36, AllTypeShield = 34, SurplusValueBase = 0},
		{BasePotentialAdd = 0, AllTypeCriticalStrike = 0, AllTypeOverCome = 0, TherapyPowerBase = 0, StrainBase = 0, DecriticalDamagePowerBase = 0, VitalityBase = 107, AllTypeShield = 101, SurplusValueBase = 0},
		{BasePotentialAdd = 0, AllTypeCriticalStrike = 0, AllTypeOverCome = 0, TherapyPowerBase = 0, StrainBase = 0, DecriticalDamagePowerBase = 0, VitalityBase = 179, AllTypeShield = 169, SurplusValueBase = 0},
		{BasePotentialAdd = 0, AllTypeCriticalStrike = 0, AllTypeOverCome = 0, TherapyPowerBase = 0, StrainBase = 0, DecriticalDamagePowerBase = 0, VitalityBase = 250, AllTypeShield = 236, SurplusValueBase = 0},
		{BasePotentialAdd = 0, AllTypeCriticalStrike = 0, AllTypeOverCome = 0, TherapyPowerBase = 0, StrainBase = 0, DecriticalDamagePowerBase = 0, VitalityBase = 322, AllTypeShield = 304, SurplusValueBase = 0},
	},
	[6] =	--攻防
	{
		{BasePotentialAdd = 0, AllTypeCriticalStrike = 0, AllTypeOverCome = 0, TherapyPowerBase = 0, StrainBase = 0, DecriticalDamagePowerBase = 0, VitalityBase = 36, AllTypeShield = 24, SurplusValueBase = 48},
		{BasePotentialAdd = 0, AllTypeCriticalStrike = 0, AllTypeOverCome = 0, TherapyPowerBase = 0, StrainBase = 0, DecriticalDamagePowerBase = 0, VitalityBase = 107, AllTypeShield = 72, SurplusValueBase = 145},
		{BasePotentialAdd = 0, AllTypeCriticalStrike = 0, AllTypeOverCome = 0, TherapyPowerBase = 0, StrainBase = 0, DecriticalDamagePowerBase = 0, VitalityBase = 179, AllTypeShield = 121, SurplusValueBase = 241},
		{BasePotentialAdd = 0, AllTypeCriticalStrike = 0, AllTypeOverCome = 0, TherapyPowerBase = 0, StrainBase = 0, DecriticalDamagePowerBase = 0, VitalityBase = 250, AllTypeShield = 169, SurplusValueBase = 338},
		{BasePotentialAdd = 0, AllTypeCriticalStrike = 0, AllTypeOverCome = 0, TherapyPowerBase = 0, StrainBase = 0, DecriticalDamagePowerBase = 0, VitalityBase = 322, AllTypeShield = 217, SurplusValueBase = 434},
	},
}

--dps会心/破防对应1/2
--治疗纯疗/会心对应3/4
--T防御/攻防兼备对应5/6
local tSkillTypeData =
{
	[26443] = 1, --dps会心
	[26444] = 2, --dps破防
	[26445] = 1, --dps会心
	[26446] = 2, --dps破防
	[26447] = 1, --dps会心
	[26448] = 2, --dps破防
	[26449] = 3, --纯疗
	[26450] = 4, --会心治疗
	[26451] = 5, --防御
	[26452] = 6, --攻防
	[26453] = 1, 
	[26454] = 2,
	[26455] = 5, 
	[26456] = 6,
	[26457] = 1, 
	[26458] = 2,
	[26459] = 1, 
	[26460] = 2,
	[26461] = 3, 
	[26462] = 4,
	[26463] = 1, 
	[26464] = 2,
	[26465] = 1, 
	[26466] = 2,
	[26467] = 3, 
	[26468] = 4,
	[26469] = 1, 
	[26470] = 2,
	[26471] = 1, 
	[26472] = 2,
	[26473] = 5, 
	[26474] = 6,
	[26475] = 1, 
	[26476] = 2,
	[26477] = 1, 
	[26478] = 2,
	[26479] = 5, 
	[26480] = 6,
	[26481] = 1, 
	[26482] = 2,
	[26483] = 1, 
	[26484] = 2,
	[26485] = 3, 
	[26486] = 4,
	[26487] = 1, 
	[26488] = 2,
	[26489] = 1, 
	[26490] = 2,
	[26491] = 1, 
	[26492] = 2,
	[26493] = 1, 
	[26494] = 2,
	}

function GetMentalSkillDate()
	return tMentalSkillData
end

function GetMentalTypeSkillDate()
	return tSkillTypeData
end

--全属性
function GetMentalSkillBasePotentialAdd(dwSkillID, dwSkillLevel)
	local tSkillTypeData = GetMentalTypeSkillDate()
	local tMentalSkillData = GetMentalSkillDate()
	if tSkillTypeData and tSkillTypeData[dwSkillID] and tMentalSkillData and tMentalSkillData[tSkillTypeData[dwSkillID]] and tMentalSkillData[tSkillTypeData[dwSkillID]][dwSkillLevel] then
		local BasePotentialAdd = tMentalSkillData[tSkillTypeData[dwSkillID]][dwSkillLevel].BasePotentialAdd
		if BasePotentialAdd then
			return BasePotentialAdd
		end
	end
	return 0
end

--全会心
function GetMentalSkillAllTypeCriticalStrike(dwSkillID, dwSkillLevel)
	local tSkillTypeData = GetMentalTypeSkillDate()
	local tMentalSkillData = GetMentalSkillDate()
	if tSkillTypeData and tSkillTypeData[dwSkillID] and tMentalSkillData and tMentalSkillData[tSkillTypeData[dwSkillID]] and tMentalSkillData[tSkillTypeData[dwSkillID]][dwSkillLevel] then
		local AllTypeCriticalStrike = tMentalSkillData[tSkillTypeData[dwSkillID]][dwSkillLevel].AllTypeCriticalStrike
		if AllTypeCriticalStrike then
			return AllTypeCriticalStrike
		end
	end
	return 0
end

--全破防
function GetMentalSkillAllTypeOverCome(dwSkillID, dwSkillLevel)
	local tSkillTypeData = GetMentalTypeSkillDate()
	local tMentalSkillData = GetMentalSkillDate()
	if tSkillTypeData and tSkillTypeData[dwSkillID] and tMentalSkillData and tMentalSkillData[tSkillTypeData[dwSkillID]] and tMentalSkillData[tSkillTypeData[dwSkillID]][dwSkillLevel] then
		local AllTypeOverCome = tMentalSkillData[tSkillTypeData[dwSkillID]][dwSkillLevel].AllTypeOverCome
		if AllTypeOverCome then
			return AllTypeOverCome
		end
	end
	return 0
end

--治疗量
function GetMentalSkillTherapyPowerBase(dwSkillID, dwSkillLevel)
	local tSkillTypeData = GetMentalTypeSkillDate()
	local tMentalSkillData = GetMentalSkillDate()
	if tSkillTypeData and tSkillTypeData[dwSkillID] and tMentalSkillData and tMentalSkillData[tSkillTypeData[dwSkillID]] and tMentalSkillData[tSkillTypeData[dwSkillID]][dwSkillLevel] then
		local TherapyPowerBase = tMentalSkillData[tSkillTypeData[dwSkillID]][dwSkillLevel].TherapyPowerBase
		if TherapyPowerBase then
			return TherapyPowerBase
		end
	end
	return 0
end

--无双
function GetMentalSkillStrainBase(dwSkillID, dwSkillLevel)
	local tSkillTypeData = GetMentalTypeSkillDate()
	local tMentalSkillData = GetMentalSkillDate()
	if tSkillTypeData and tSkillTypeData[dwSkillID] and tMentalSkillData and tMentalSkillData[tSkillTypeData[dwSkillID]] and tMentalSkillData[tSkillTypeData[dwSkillID]][dwSkillLevel] then
		local StrainBase = tMentalSkillData[tSkillTypeData[dwSkillID]][dwSkillLevel].StrainBase
		if StrainBase then
			return StrainBase
		end
	end
	return 0
end

--化劲
function GetMentalSkillDecriticalDamagePowerBase(dwSkillID, dwSkillLevel)
	local tSkillTypeData = GetMentalTypeSkillDate()
	local tMentalSkillData = GetMentalSkillDate()
	if tSkillTypeData and tSkillTypeData[dwSkillID] and tMentalSkillData and tMentalSkillData[tSkillTypeData[dwSkillID]] and tMentalSkillData[tSkillTypeData[dwSkillID]][dwSkillLevel] then
		local DecriticalDamagePowerBase = tMentalSkillData[tSkillTypeData[dwSkillID]][dwSkillLevel].DecriticalDamagePowerBase
		if DecriticalDamagePowerBase then
			return DecriticalDamagePowerBase
		end
	end
	return 0
end

--体质
function GetMentalSkillVitalityBase(dwSkillID, dwSkillLevel)
	local tSkillTypeData = GetMentalTypeSkillDate()
	local tMentalSkillData = GetMentalSkillDate()
	if tSkillTypeData and tSkillTypeData[dwSkillID] and tMentalSkillData and tMentalSkillData[tSkillTypeData[dwSkillID]] and tMentalSkillData[tSkillTypeData[dwSkillID]][dwSkillLevel] then
		local VitalityBase = tMentalSkillData[tSkillTypeData[dwSkillID]][dwSkillLevel].VitalityBase
		if VitalityBase then
			return VitalityBase
		end
	end
	return 0
end

--内外防
function GetMentalSkillAllTypeShield(dwSkillID, dwSkillLevel)
	local tSkillTypeData = GetMentalTypeSkillDate()
	local tMentalSkillData = GetMentalSkillDate()
	if tSkillTypeData and tSkillTypeData[dwSkillID] and tMentalSkillData and tMentalSkillData[tSkillTypeData[dwSkillID]] and tMentalSkillData[tSkillTypeData[dwSkillID]][dwSkillLevel] then
		local AllTypeShield = tMentalSkillData[tSkillTypeData[dwSkillID]][dwSkillLevel].AllTypeShield
		if AllTypeShield then
			return AllTypeShield
		end
	end
	return 0
end

--破招
function GetMentalSkillSurplusValueBase(dwSkillID, dwSkillLevel)
	local tSkillTypeData = GetMentalTypeSkillDate()
	local tMentalSkillData = GetMentalSkillDate()
	if tSkillTypeData and tSkillTypeData[dwSkillID] and tMentalSkillData and tMentalSkillData[tSkillTypeData[dwSkillID]] and tMentalSkillData[tSkillTypeData[dwSkillID]][dwSkillLevel] then
		local SurplusValueBase = tMentalSkillData[tSkillTypeData[dwSkillID]][dwSkillLevel].SurplusValueBase
		if SurplusValueBase then
			return SurplusValueBase
		end
	end
	return 0
end