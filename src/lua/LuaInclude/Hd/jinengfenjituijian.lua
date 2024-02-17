---------------------------------------------------------------------->
-- 脚本名称:	scripts/skill/include/技能分级推荐.lua
-- 更新时间:	2019/6/10 星期一 下午 2:42:31
-- 更新用户:	hudongchao
-- 脚本说明:
----------------------------------------------------------------------<

tSkillRecommendTable = {
	--通用（轻功类）
	[100] = {
		{ 9006 }, -- 95级
		{ 0 }, -- 96级
		{ 9005 }, --97级
		{ 0 }, -- 98级
		{ 9004 }, -- 99级
		{ 0 }, -- 100级
	},
	--少林
	[1] = {
		{ 261 }, -- 95级
		{ 200 }, -- 96级
		{ 258 }, --97级
		{ 245 }, -- 98级
		{ 242 }, -- 99级
		{ 257 }, -- 100级
	},
	--万花
	[2] = {
		{ 139, 130  }, -- 95级
		{ 100}, -- 96级
		{ 2645 }, --97级
		{ 2663 }, -- 98级
		{ 136 }, -- 99级
		{ 2654 }, -- 100级
	},
	--天策
	[3] = {
		{ 422, 404  }, -- 95级
		{ 413, 433}, -- 96级
		{ 426 }, --97级
		{ 423 }, -- 98级
		{ 428 }, -- 99级
		{ 2603 }, -- 100级
	},
	--纯阳
	[4] = {
		{ 18640, 372  }, -- 95级
		{ 362, 359}, -- 96级
		{ 371, 2690 }, --97级
		{ 305, 363 }, -- 98级
		{ 2674 }, -- 99级
		{ 355 }, -- 100级
	},
	--七秀
	[5] = {
		{ 3003 }, -- 95级
		{ 545 }, -- 96级
		{ 574 }, --97级
		{ 558 }, -- 98级
		{ 550 }, -- 99级
		{ 551 }, -- 100级
	},
	--五毒
	[6] = {
		{ 2222, 2229 }, -- 95级
		{ 2210, 2235 }, -- 96级
		{ 3702 }, --97级
		{ 2230, 2221 }, -- 98级
		{ 2224, 2965 }, -- 99级
		{ 2220 }, -- 100级
	},
	--唐门
	[7] = {
		{ 3098 }, -- 95级
		{ 3110 }, -- 96级
		{ 3112 }, --97级
		{ 3114 }, -- 98级
		{ 3090 }, -- 99级
		{ 3103 }, -- 100级
	},
	--藏剑
	[8] = {
		{ 1589 }, -- 95级
		{ 1666 }, -- 96级
		{ 1613 }, --97级
		{ 1668 }, -- 98级
		{ 0 }, -- 99级
		{ 0 }, -- 100级
	},
	--丐帮
	[9] = {
		{ 5262, 5267}, -- 95级
		{ 5270 }, -- 96级
		{ 18523}, --97级
		{ 5263 }, -- 98级
		{ 5361}, -- 99级
		{ 5265}, -- 100级
	},
	--丐帮
	[9] = {
		{ 5262, 5267}, -- 95级
		{ 5270 }, -- 96级
		{ 18523}, --97级
		{ 5263 }, -- 98级
		{ 5361}, -- 99级
		{ 5265}, -- 100级
	},
	--明教
	[10] = {
		{ 4910}, -- 95级
		{ 3960 }, -- 96级
		{ 3977}, --97级
		{ 3985 }, -- 98级
		{ 3969}, -- 99级
		{ 3975}, -- 100级
	},
	--苍云
	[21] = {
		{ 13053}, -- 95级
		{ 13047 }, -- 96级
		{ 13042}, --97级
		{ 13070 }, -- 98级
		{ 13045, 13068}, -- 99级
		{ 13067}, -- 100级
	},
	--长歌
	[22] = {
		{ 14081, 14075}, -- 95级
		{ 14074, 14154 }, -- 96级
		{ 14073}, --97级
		{ 14072 }, -- 98级
		{ 15092}, -- 99级
		{ 14084}, -- 100级
	},
	--霸刀
	[23] = {
		{ 16166}, -- 95级
		{ 16870 }, -- 96级
		{ 16598}, --97级
		{ 17057 }, -- 98级
		{ 16304}, -- 99级
		{ 16455}, -- 100级
	},
	--蓬莱
	[24] = {
		{ 20083}, -- 95级
		{ 20281 }, -- 96级
		{ 19984}, --97级
		{ 20285 }, -- 98级
		{ 20084}, -- 99级
		{ 0}, -- 100级
	},
	--凌雪阁
	[25] = {
		{ 22321}, -- 95级
		{ 22358}, -- 96级
		{ 22417}, --97级
		{ 22360}, -- 98级
		{ 22614}, -- 99级
		{ 0}, -- 100级
	},
	--衍天宗
	[211] = {
		{ 24382}, -- 95级
		{ 24383}, -- 96级
		{ 24385}, --97级
		{ 25142}, -- 98级
		{ 0}, -- 99级
		{ 0}, -- 100级
	},
	--北天药宗
	[212] = {
		{ 27634}, -- 95级
		{ 28620}, -- 96级
		{ 27642}, --97级
		{ 27675}, -- 98级
		{ 27674}, -- 99级
		{ 27897}, -- 100级
	},
	--刀宗
	[213] = {
	},
	--万灵山庄
	[214] = {
	},
}
function OnPlayerLevelupSkillRecommend(player)
	local ForceID = player.dwForceID
	local nLevelUp95 = player.nLevel - 94
	if nLevelUp95 > 0 then
		if ForceID ~= 0 and tSkillRecommendTable[ForceID][nLevelUp95] then
			--门派技能学习提示
			for i = 1, #tSkillRecommendTable[ForceID][nLevelUp95] do
				local nRecentSkillID = tSkillRecommendTable[ForceID][nLevelUp95][i]
				local nSKillLevel = player.GetSkillLevel(nRecentSkillID)
				if nSKillLevel > 0 then
					RemoteCallToClient(player.dwID, "CallUIGlobalFunction", "ShowNewSkillIfNotExist", nRecentSkillID, nSKillLevel)
				end
			end
			--通用技能学习提示
			for i = 1, #tSkillRecommendTable[100][nLevelUp95] do
				local nRecentSkillID = tSkillRecommendTable[100][nLevelUp95][i]
				local nSKillLevel = player.GetSkillLevel(nRecentSkillID)
				if nSKillLevel > 0 then
					RemoteCallToClient(player.dwID, "CallUIGlobalFunction", "ShowNewSkillIfNotExist", nRecentSkillID, nSKillLevel)
				end
			end
		end
	end
end