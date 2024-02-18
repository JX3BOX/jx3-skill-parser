---------------------------------------------------------------------->
-- �ű�����:	scripts/skill/װ��/�Ҽ����/����_������_data.lua
-- ����ʱ��:	2020/11/9 9:47:24
-- �����û�:	biyueyang
-- �ű�˵��:	
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

function tJiQiongSu_Data.IsParty(player, owner)--����ֵ��true �Ƕ��ѣ�false�����Ƕ���
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