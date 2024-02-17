---------------------------------------------------------------------->
-- 脚本名称:	scripts/skill/include/大小攻防载具伤害.lua
-- 更新时间:	2022/10/12 15:50:19
-- 更新用户:	SK-20210531KWPG
-- 脚本说明:	
----------------------------------------------------------------------<
tZaiJuDamage = {
	ShenJiTai = { --据点神机台
		ChuanXinNu1 = 290000,  --穿心弩子技能低伤
		ChuanXinNu2 = 1595000,   --穿心弩子技能高伤
		SaoShe1 = 175000,  --扫射子技能低伤
		SaoShe2 = 1595000,  --扫射子技能高伤
	},
	ShenJiChe = { --据点神机车
		JianNuLianShe1 = 85000,   --箭弩连射子技能
		JianNuLianShe2 = 3195000,  --箭弩连射子技能高伤
		RanHuoJian1 = 175000,  --燃火箭子技能
		RanHuoJian2 = 6385000,  --燃火箭子技能高伤
		GuoRe1 = 865000,  --过热子技能
		GuoRe2 = 13000000,  --过热子技能高伤
	},
	CuiChengChe = {
		SuiShanShi1 = 215000, --碎山石子技能（投石子技能）
		SuiShanShi2 = 26230000, --碎山石子技能高伤（投石技能高伤）
		LieHuoShi1 = 215000,  --裂火石子技能
		LieHuoShi2 = 31935000,  --裂火石子技能高伤
		YeXingZhuangJi1 = 260000, --冲撞子技能
		YeXingZhuangJi2 = 38775000, --冲撞子技能高伤
	},
	ShenJiLei = { --神机雷（21298）
		ZiBao1 = 105000, --神机雷_子技能Player
		ZiBao2 = 38775000, --神机雷_子技能NPC
		TouZhi1 = 35000, --据点争夺改良神机雷低伤
		TouZhi2 = 38775000, --据点争夺改良神机雷高伤
	},
	GFShenJiTai = { --GF载具神机台
		ChuanXinNu1 = 290000,  --穿心弩子技能低伤
		ChuanXinNu2 = 1630000,  --穿心弩子技能高伤
		SaoShe1 = 175000,  --扫射子技能低伤
		SaoShe2 = 1630000,  --扫射子技能高伤
		HuoYouJian1 = 72500,  --火油箭子技能低伤
		HuoYouJian2 = 326000,  --火油箭子技能高伤
	},
	GFShenJiChe = {  --GF载具神机车，2022.10.27小车投多后伤害下降为1/3
		JianNuLianShe1 = 28333,--85000,  --箭弩连射子技能低伤
		JianNuLianShe2 = 1086666,--3260000,  --箭弩连射子技能高伤
		RanHuoJian1 = 58333,--175000,  --燃火箭子技能低伤
		RanHuoJian2 = 2171666,--6515000,  --燃火箭子技能高伤
		ShiShiJuFa1 = 28333,--85000,, --十矢俱发子技能低伤
		ShiShiJuFa2 = 543333,--1630000,  --十矢俱发子技能高伤
		GuoRe1 = 288333,--865000,  --过热子技能低伤
		GuoRe2 = 4345000,--13035000,  --过热子技能高伤
	},
	GFCuiChengChe = {  --GF载具摧城车
		SuiShanShi1 = 345000,  --投石子技能
		SuiShanShi2 = 26070000,  --投石子技能高伤
		LieHuoShi1 = 345000,  --裂火石子技能
		LieHuoShi2 = 32585000,  --裂火石子技能高伤
		ShiBao1 = 345000,  --石爆子技能
		ShiBao2 = 32585000,  --石爆子技能高伤
		YeXingZhuangJi1 = 345000,  --冲撞子技能
		YeXingZhuangJi2 = 32585000,  --冲撞子技能高伤
	},
	GFShenJiLei = {  --GF载具神机雷(24422)
		TouZhi1 = 45000,  --攻防神机雷子技能低伤
		TouZhi2 = 6515000,  --攻防神机雷子技能高伤
	},
	GFFeiXingJiJia = {  --GF载具飞行机甲
		TouZhi1 = 215000,  --轰炸
		TouZhi2 = 34215000,
	},
}