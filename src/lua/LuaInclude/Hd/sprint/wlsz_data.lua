---------------------------------------------------------------------->
-- 脚本名称:	scripts/skill/轻功/万灵山庄轻功/万灵山庄轻功_data.lua
-- 更新时间:	2023/9/5 14:46:09
-- 更新用户:	梁宏业
-- 脚本说明:	
----------------------------------------------------------------------<
tWLSZ_Sprint =
{
	--单人执行区
	[36221] = {nSkillMove = 175, nJumpCount = 1}, --单人小跳

	[36207] = {nSkillMove = 500, nJumpCount = 2}, --单人一段执行
	[36209] = {nSkillMove = 501, nJumpCount = 3}, --单人二段执行
	[36211] = {nSkillMove = 502, nJumpCount = 4}, --单人三段执行
	[36213] = {nSkillMove = 503, nJumpCount = 5}, --单人四段执行
	[36215] = {nSkillMove = 504, nJumpCount = 6}, --单人五段执行

	[36230] = {nSkillMove = 512, nJumpCount = 7}, --单人加强一段跳
	[36232] = {nSkillMove = 513, nJumpCount = 8}, --单人加强二段跳
	[36234] = {nSkillMove = 514, nJumpCount = 9}, --单人加强三段跳
	[36236] = {nSkillMove = 515, nJumpCount = 10}, --单人加强四段跳
	[36238] = {nSkillMove = 516, nJumpCount = 11}, -- 单人加强五段跳
	
	[36217] = {nSkillMove = 510, nJumpCount = 12}, --单人水冲刺执行
	[36219] = {nSkillMove = 511, nJumpCount = 13}, --单人水冲刺C执行

	--单人判定区
	[36220] = {nNextSkill = 36221, }, --单人小跳

	[36206] = {nNextSkill = 36207, }, --单人一段判定
	[36208] = {nNextSkill = 36209, }, --单人二段判定
	[36210] = {nNextSkill = 36211, }, --单人三段判定
	[36212] = {nNextSkill = 36213, }, --单人四段判定
	[36214] = {nNextSkill = 36215, }, --单人五段判定

	[36229] = {nNextSkill = 36230, }, --单人加强一段跳判定
	[36231] = {nNextSkill = 36232, }, --单人加强二段跳判定
	[36233] = {nNextSkill = 36234, }, --单人加强三段跳判定
	[36235] = {nNextSkill = 36236, }, --单人加强四段跳判定
	[36237] = {nNextSkill = 36238, }, --单人加强五段跳判定

	[36216] = {nNextSkill = 36217, }, --单人水冲刺
	[36218] = {nNextSkill = 36219, }, --单人水冲刺C

	--双人执行区
	[36239] = {nSkillMove = 505, nJumpCount = 1}, --双人一段执行
	[36241] = {nSkillMove = 506, nJumpCount = 2}, --双人二段执行
	[36242] = {nSkillMove = 507, nJumpCount = 3}, --双人三段执行
	[36243] = {nSkillMove = 508, nJumpCount = 4}, --双人四段执行
	[36244] = {nSkillMove = 509, nJumpCount = 5}, --双人五段执行
}