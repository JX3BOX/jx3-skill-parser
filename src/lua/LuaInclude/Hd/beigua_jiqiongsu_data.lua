---------------------------------------------------------------------->
-- 脚本名称:	scripts/skill/装备/挂件相关/背挂_寄琼苏_data.lua
-- 更新时间:	2020/11/9 9:47:24
-- 更新用户:	biyueyang
-- 脚本说明:	
----------------------------------------------------------------------<
Include("scripts/Emotion/IsCorrectState.lua")

tJiQiongSu_Data =
{
	nNPCID = 103209,
	nTime = 60 * 10,
	
	nSkill_Open = 25925,
	nSkill_Active = 25926,
	nSkill_Exit = 25927,

	nCD_Open = 1918,
	nCD_Active = 1919,
	nCD_Exit = 1922,

	nBuff_Player1 = 18710,
	nBuff_Player2 = 18712,
	nBuff_NPC = 18711,

	nDynamicSkill = 718,
	nDynamicSkill2 = 719,

	nBackItemIndex = 25580,
	nRepresentID = 732,

	szNicknamePre = "jiqiongsu",
}

function tJiQiongSu_Data.IsParty(player, owner)--返回值：true 是队友，false：不是队友
	if not player or not owner then
		return false
	end

	local tTeamMemberList = owner.GetPartyMemberList()
	if not tTeamMemberList then
		return false
	end
	for k = 1, #tTeamMemberList do
		if player.dwID == tTeamMemberList[k] then
			return true
		end
	end
	return false
end