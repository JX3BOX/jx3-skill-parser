---------------------------------------------------------------------->
-- 脚本名称:	scripts/skill/include/23年帮会领地战boss伤害data.lua
-- 更新时间:	2023/2/14 16:24:15
-- 更新用户:	SK-20210531KWPG
-- 脚本说明:	
----------------------------------------------------------------------<
local nScale = 1.1 --2023年10月26号的伤害系数，后面赛季调伤害调这个系数就行

local tPugong = {
	[1] = 40000 * nScale,
	[2] = 60000 * nScale,
	[3] = 80000 * nScale,
	[4] = 161000 * nScale,
}

tBHLDZBossSkillDamage = {
	LiLin = {--李霖
		atk = tPugong[3], --普通攻击
		qmfg = 40000 * nScale, --奇门飞宫
		gxkx = 121000 * nScale,  --鬼星开穴
	},
	FengNiu = {--凤妞
		jxmy = 60000 * nScale, --九溪弥烟
		flws = 101000 * nScale, --风来吴山
		yfyh = tPugong[1], --云飞玉皇
		jxmyjz = 15000 * nScale, --九溪弥烟剑泽
	},
	ChenShiMei = {--陈士美
		cc = 45000 * nScale,          --除草
		atk = tPugong[2],	     --普攻
	},
	SuBuChen = {--苏不尘
		cwsw = 50000 * nScale,       --川乌射罔
		zywf = 40000 * nScale,        --沾衣未防
	--	lk = 20000,           --龙葵自苦
		atk = tPugong[3],	     --普攻
	},
	MengXiangFei = {--梦香菲
		dclx = 80000 * nScale,       --帝骖龙翔
		dxjq = 40000 * nScale,       --玳弦急曲
		atk = tPugong[1],	     --普攻
	},
	KaiFeng = {--凯风
		pfyj = 80000 * nScale,       --破风一击
		pfyjd = 101000 * nScale,       --破风一击·大
		atk = tPugong[1],	     --普攻
	},
	HanFeiZi = {--韩非子
		xtd = 30000 * nScale,   --行天道
		lz = 30000 * nScale,    --流转
		yzj = 30000 * nScale, --云中剑
		atk = tPugong[3], --普攻
	},
	HuangJianXiang = {--黄剑翔
		stt = 80000 * nScale,       --扫堂腿
		wyj = 101000 * nScale,       --无影脚
		atk = tPugong[1],	     --普攻
	},
	HanQiaoSheng = {--韩荞生
       dtz = 80000 * nScale,       --地堂震
		mlbw = 101000 * nScale,       --猛龙摆尾
		atk = tPugong[1],	     --普攻
	},
	GaoJiuWen = {--高九问
		HJD = 101000 * nScale,  --挥金镝
		LL = 50000 * nScale,  --挥金镝子技能烈雷
		ZBF = 80000 * nScale,  --战八方
		CY = 60000 * nScale, --沧月
		atk = tPugong[3], --普攻
	},
	LuYin = {--鲁印
		jchd = 50000 * nScale,  --巨锤撼地
		hdqk = 80000 * nScale,  --晃动乾坤
		lpfw = 101000 * nScale, --乱披风舞
		atk = tPugong[3],	    --普攻
	},

	ShaoQingCheng = {
		DQ = 50000 * nScale,  --丹青
		YSJF = 121000 * nScale, --玉石俱焚
		YSJF2 =70000 * nScale, --玉石俱焚子技能
		ZLYX = 30000 * nScale, --钟林毓秀
		atk = tPugong[3], --普攻
	},

	XiongYe = {
		DQD = 101000 * nScale,
		ZDQJ = 60000 * nScale,
		atk = tPugong[2], --普攻
	},

	JiaBian = {
		XFZ = 50000 * nScale,
		HXPB = 80000 * nScale,
		atk = tPugong[1], --普攻
	},

	ZhenQi = {
		SJBQ = 60000 * nScale,
		DMCC = 101000 * nScale,
		atk = tPugong[1], --普攻
	},

	SanShiShu = {
		JT = 60000 * nScale,
		CF = 80000 * nScale,
		XZatk = 10000 * nScale,
		atk = tPugong[1],
	},
}