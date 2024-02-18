---------------------------------------------------------------------->
-- 脚本名称:	scripts/skill/npc助战降临/npc助战跟随/共鸣降临npc伤害表.lua
-- 更新时间:	2022/6/23 23:11:17
-- 更新用户:	KING-20191203GI
-- 脚本说明:	
----------------------------------------------------------------------<
tGMJL_KangYanBie = {
	ATK1 = {nDamageBase =965 , nChannelInterval = 69},			--轻击1
	ATK2 = {nDamageBase =906 , nChannelInterval = 65},			--轻击2
	ATK3 = {nDamageBase =337 , nChannelInterval = 25},			--轻击3-（2段一样的伤害）
	ATK4 = {nDamageBase =1575 , nChannelInterval = 113},	 	--轻击4 

	BATK0 = {nDamageBase =2007 , nChannelInterval = 145}, 		--重击0
	BATK1 = {nDamageBase =2475 , nChannelInterval = 178}, 		--重击1
	BATK2 = {nDamageBase =2943 , nChannelInterval = 212},		 --重击2
	BATK3 = {nDamageBase =3412 , nChannelInterval = 246}, 		--重击3
	BATK4 = {nDamageBase =3880 , nChannelInterval = 279}, 		--重击4
	BATK5 = {nDamageBase =4349 , nChannelInterval = 313}, 		--重击5
	BATK6 = {nDamageBase =4817 , nChannelInterval = 347}, 		--重击6
	BATK7 = {nDamageBase =5285 , nChannelInterval = 380}, 		--重击7
	BATK8 = {nDamageBase =5754 , nChannelInterval = 414}, 		--重击8
	BATK9 = {nDamageBase =6222 , nChannelInterval = 448}, 		--重击9
	BATK10 ={nDamageBase =6691 , nChannelInterval = 482}, 		--重击10

	SKILL = {nDamageBase =4917 , nChannelInterval = 354}, 		--小技能
	STUNT = {nDamageBase =4696 , nChannelInterval = 338},		 --大招1
	--有补充的系数写在下面
}

tGMJL_ShenJianXin = {
	ATK1 = {nDamageBase =1891 , nChannelInterval = 113},    --轻击1
	ATK2 = {nDamageBase =1006 , nChannelInterval = 60},  --轻击2（3段一样的伤害）
	ATK3 = {nDamageBase =2519 , nChannelInterval = 151},    --轻击3
	
	BATK1 = {nDamageBase =4085 , nChannelInterval = 245},    --重击1

	--SKILL = {nDamageBase 	= 1, nChannelInterval = 1}, --小技能（命座版）
	
	STUNT1 = {nDamageBase =1867 , nChannelInterval = 112},  --大招1（3段）轻
	STUNT2 = {nDamageBase =2988 , nChannelInterval = 179},  --大招2（5段技能）中
	STUNT3 = {nDamageBase =5603 , nChannelInterval = 336},  --大招2（1段技能）重
	STUNT4 = {nDamageBase =11206 , nChannelInterval = 672},	  --大招爆气场收尾
	
	--有补充的系数写在下面（武学境界）
	JINGJIE1 = {nDamageBase =2767 , nChannelInterval = 166},    --武学境界1伤害
}

tGMJL_QingRou = {
	ATK1 = {nDamageBase =1020 , nChannelInterval = 73},       --轻击1
	ATK1_H = {nDamageBase = 4385, nChannelInterval = 168},     --轻击1治疗
	
	ATK2 = {nDamageBase =2683 , nChannelInterval = 193},     --轻击2
	ATK2_H = {nDamageBase = 4604, nChannelInterval = 177},     --轻击2治疗
	
	ATK3 = {nDamageBase =2947 , nChannelInterval = 212},     --轻击3
	ATK3_H = {nDamageBase = 4834, nChannelInterval = 186},     --轻击3治疗
	
	BATK1 = {nDamageBase =6772 , nChannelInterval = 488},   --重击1
	BATK1_H = {nDamageBase = 23625, nChannelInterval = 907},  --重击1治疗
	
	SKILL_H = {nDamageBase = 42000, nChannelInterval = 1613},  --小技能治疗
	STUNT = {nDamageBase =4341 , nChannelInterval = 313},    --大招每次重击附伤
	STUNT_H = {nDamageBase 	= 50400	, nChannelInterval = 1935	}, --大招治疗
	
	--有补充的系数写在下面（武学境界）
	JINGJIE4 = {nDamageBase =2532 , nChannelInterval = 182},    --武学境界4伤害每次轻击附伤
}

tGMJL_TangXiaoKe = {
	ATK1 = {nDamageBase =1094 , nChannelInterval = 66},			--轻击1
	ATK2 = {nDamageBase =2173 , nChannelInterval = 130},  		 --轻击2
	ATK3 = {nDamageBase =4103 , nChannelInterval = 246},		 --轻击3
	
	BATK1 = {nDamageBase =6041 , nChannelInterval = 362},		    --重击1
	
	SKILL = {nDamageBase =3490 , nChannelInterval = 209},            --小技能
	STUNT = {nDamageBase =32221 , nChannelInterval = 1933}, 		  --大招
	
	--有补充的系数写在下面（武学境界）
	JINGJIE2 = {nDamageBase =906 , nChannelInterval = 54},		    --武学境界2伤害
}

tGMJL_WenZheZhi = { --温折枝
	YANGMING = {nDamageBase =2617 , nChannelInterval = 244},  		 --阳明
	SHANGYANG = {nDamageBase =2600 , nChannelInterval = 238},		 --商阳
	SHANGYANG_DOT = {nDamageBase =2600 , nChannelInterval = 238},		 --商阳（dot）dot和商阳在技能脚本里是同一个系数
	YUSHI = {nDamageBase =1515 , nChannelInterval = 326}, --玉石
	KUAIXUE = {nDamageBase =2290 , nChannelInterval = 381},	  		  --快雪
}

tGMJL_NianXiaoLu = { --年小鹿
	XIEXIN = {nDamageBase =3380 , nChannelInterval = 310},  		 --蝎心
	SHEYING_DOT = {nDamageBase =780 , nChannelInterval = 520},		 --蛇影dot
	BAIZU = {nDamageBase =1500 , nChannelInterval = 300},		 --百足， 实际上和百足dot是同一个系数
	BAIZU_DOT = {nDamageBase =1500 , nChannelInterval = 300}, --百足dot
	LIANYUAN = {nDamageBase =3250 , nChannelInterval = 286},	  		  --连缘
}

tGMJL_RuanGuiYun = { --阮归云
	YINGUANG = {nDamageBase =1980 , nChannelInterval = 181},  		 --银光照雪
	GOUWEN = {nDamageBase =1760 , nChannelInterval = 176},		 --钩吻
	ZHANYI = {nDamageBase =1210 , nChannelInterval = 121},		 --沾衣
	CHUANWU = {nDamageBase =2420 , nChannelInterval = 242}, --射罔
	NILUAN_DOT = {nDamageBase =242 , nChannelInterval = 136},	  		  --逆乱
}
--以下是治疗和T，CD单位为秒
tGMJL_WenCiQiu = { --温辞秋
	TIZHEN = {nDamageBase =12000 , nChannelInterval = 718},  		 --提针
	CHUNNI = {nCD = 30},  		 --春泥
	FENGZHEN = {nCD = 900},  		 --锋针，暂不可用
}

tGMJL_NianXiaoXiong = { --年小熊
	BINGCAN = {nDamageBase =7000 , nChannelInterval = 500},  		 --冰蚕
	BINGCAN_JS = {nDamageBase =2100 , nChannelInterval = 150},  		 --冰蚕溅射2目标
	SHENGSHOU = {nDamageBase =10000 , nChannelInterval = 1000, nCD = 30},		 --圣手
	FENGHUANG = {nCD = 900},		 --凤凰
}

tGMJL_RuanXianZhou = { --阮闲舟
	BAIZHI = {nDamageBase =11000 , nChannelInterval = 676},  		 --白芷
	LONGKUI = {nDamageBase =20000 , nChannelInterval = 1000, nCD = 30},		 --龙葵
	KUMU = {nCD = 900},		 --枯木
}

tGMJL_RongRong = { -- 茸茸
	CHIRILUN = {nDamageBase = 1500, nChannelInterval = 120.},  		 --赤日轮
	YOUYUELUN = {nDamageBase = 1500 , nChannelInterval = 120},  		 --幽月轮
	TANMOTI = {nCD = 60},		 --贪魔体
	CHAOSHENGYAN = {nCD = 360},		 --朝圣言
}

tGMJL_YanZiNiang = { -- 燕子娘
	
	ATK1 = {nDamageBase = 7200, nChannelInterval = 97}, --刺击一
	ATK2 = {nDamageBase = 9600, nChannelInterval = 130}, --刺击二
	ATK3 = {nDamageBase = 12000, nChannelInterval = 162}, --刺击三
	CHUXUE = {nDamageBase = 24000, nChannelInterval = 600.},  		 --血泣被动伤害
	YOUYANBU = {nDamageBase = 14400, nChannelInterval = 360},		 --暗影步单体
	YANFEIHUAN = {nDamageBase = 2400, nChannelInterval = 60}, --燕飞还攻击
	YANFEIHUAN_H = {nDamageBase = 15000, nChannelInterval = 2500}, --燕飞还治疗
	
}

tGMJL_DaoMa = { -- 刀马
	ATK_S		= 	{nDamageBase = 5000, 	nChannelInterval = 150 , nBaseThreat=1}, --环首刀·裁血
	ATK_B 		= 	{nDamageBase = 6500, 	nChannelInterval = 195 , nBaseThreat=1}, --头锥大刀·裁血
	LIESUZHAN1 = 	{nDamageBase = 4000, 	nChannelInterval = 120 , nBaseThreat=1}, --列肃斩（一段）
	LIESUZHAN2 = 	{nDamageBase = 6000, 	nChannelInterval = 180 , nBaseThreat=1}, --列肃斩（二段）
	LIESUZHAN3 = 	{nDamageBase = 10000, 	nChannelInterval = 300 , nBaseThreat=1}, --列肃斩（三段）
	CHONGJIBO	= 	{nDamageBase = 3000,	nChannelInterval = 90  , nBaseThreat=1}, --虎出渊(切武器冲击波伤害)
}

tGMJL_LiXingYun = { --李星云
	ATK1_A = {nDamageBase =1408 , nChannelInterval = 85},  --轻击1外功
	ATK2_A = {nDamageBase =1809 , nChannelInterval = 109},   --轻击2外功
	ATK3_A = {nDamageBase =2515 , nChannelInterval = 151},	 --轻击3外功

	ATK1_B = {nDamageBase =704 , nChannelInterval = 51}, 	--轻击1内功（开大后才有）
	ATK2_B = {nDamageBase =904 , nChannelInterval = 65},	--轻击2内功
	ATK3_B = {nDamageBase =1257 , nChannelInterval = 91},	 --轻击3内功
	
	BATK1 = {nDamageBase =471 , nChannelInterval = 28},   --重击(外)

	SKILL_A   = {nDamageBase =978 , nChannelInterval = 59},		--小技能外功
	SKILL_B0  = {nDamageBase =611 , nChannelInterval = 44},		--小技能内功基础伤害
	SKILL_B1  = {nDamageBase =1064 , nChannelInterval = 77},		--小技能内功1气点
	SKILL_B2  = {nDamageBase =1516 , nChannelInterval = 109},	--小技能内功2气点
	SKILL_B3  = {nDamageBase =1969 , nChannelInterval = 142},	--小技能内功3气点
	SKILL_B4  = {nDamageBase =2421 , nChannelInterval = 174},	--小技能内功4气点
	SKILL_B5  = {nDamageBase =2874 , nChannelInterval = 207},	--小技能内功5气点
	SKILL_B6  = {nDamageBase =3327 , nChannelInterval = 240},	--小技能内功6气点
	SKILL_B7  = {nDamageBase =3779 , nChannelInterval = 272},	--小技能内功7气点
	SKILL_B8  = {nDamageBase =4232 , nChannelInterval = 305},	--小技能内功8气点
	SKILL_B9  = {nDamageBase =4684 , nChannelInterval = 337},	--小技能内功9气点
	SKILL_B10 = {nDamageBase =5137 , nChannelInterval = 370},	--小技能内功10气点
	
	
	STUNT = {nDamageBase =5243 , nChannelInterval = 315},		 --大招1（5段）
	
	--有补充的系数写在下面（武学境界）
}

tGMJL_YueJiaHe = { --月嘉禾

	ATK1    =	{nDamageBase =1408 , nChannelInterval = 79},--轻击1	
	ATK2    =	{nDamageBase =1239 , nChannelInterval = 69},--轻击2 
	ATK3_A  =	{nDamageBase =2235 , nChannelInterval = 125},--轻击3 基础
	ATK3_B  =	{nDamageBase =1490 , nChannelInterval = 83},--轻击3 追加
	BATK1   =	{nDamageBase =830 , nChannelInterval = 47},--重击
	BATK2   =	{nDamageBase =4844 , nChannelInterval = 271},--重击追加
	STUNT   =	{nDamageBase =5190 , nChannelInterval = 291},--绝技
	
	HN      ={nDamageBase =10 , nChannelInterval = 30},--武学境界一回能和小技能回能
	

	--有补充的系数写在下面（武学境界）
	--暂缺境界3伤害
	--JINGJIE3 = {nDamageBase =917 , nChannelInterval = 66},		 --已改为会心加成
}

tGMJL_HeXian = { --贺闲

	ATK1    =	{nDamageBase =1408 , nChannelInterval = 79},--轻击1	剑宫的子技能
	ATK2_A  = {nDamageBase = 1239, nChannelInterval = 44}, --轻击2 1曲风剑徵三次伤害的每次伤害
	ATK2_B  = {nDamageBase = 1239, nChannelInterval = 48}, --轻击2 2曲风剑徵三次伤害的每次伤害
	ATK2_C  = {nDamageBase = 1239, nChannelInterval = 52}, --轻击2 3曲风剑徵三次伤害的每次伤害
	ATK2_D  = {nDamageBase = 1239, nChannelInterval = 56}, --轻击2 4曲风剑徵三次伤害的每次伤害
	ATK2_E  =	{nDamageBase =1239 , nChannelInterval = 60},--轻击2 5曲风剑徵三次伤害的每次伤害
	ATK3_A  =	{nDamageBase =4103 , nChannelInterval = 246},--轻击3 剑商一段范围伤害的子技能
	ATK3_B  =	{nDamageBase =1490 , nChannelInterval = 83},--轻击3 剑商延时爆裂伤害的子技能
	BATK1   =	{nDamageBase =6041 , nChannelInterval = 362},--重击 剑角自身的伤害子技能
	BATK2   =	{nDamageBase =4844 , nChannelInterval = 271},--重击追加 剑角低血量追加子技能
	STUNT_Q =  {nDamageBase = 5190, nChannelInterval = 380}, --大招 万籁通微琴姿态的0.8秒一次的子技能伤害
	STUNT_J = {nDamageBase = 7000, nChannelInterval = 500}, --大招 万籁通微最后剑姿态收尾的全力一击
	SKILL  = {nDamageBase = 3490, nChannelInterval = 287}, --绝技 剑羽伤害子技能
	SKILL5 = {nDamageBase = 3490, nChannelInterval = 120}, --绝技 剑羽五秒伤害子技能
}

tGMJL_FeiDaJin = { -- 费大劲
	ATK1_P = {nDamageBase = 2400, nChannelInterval = 30,nBaseThreat=30000}, --拳punch轻击
	ATK2_P = {nDamageBase = 2400, nChannelInterval = 30,nBaseThreat=30000}, --拳punch轻击
	ATK1_K = {nDamageBase = 4800, nChannelInterval = 60,nBaseThreat=40000}, --腿kick轻击
	ATK2_K = {nDamageBase = 4800, nChannelInterval = 60,nBaseThreat=40000}, --腿kick轻击
	BATK1 = {nDamageBase = 2880, nChannelInterval = 36, nCD = 9, nBaseThreat = 50000}, --小群嘲
	--拳可以叠加BUFF，10拳后读条切换姿态，持续50秒，期间给召唤者增伤15%
}


tGMJL_BaiQue = { --白鹊
	ATK1 =  {nDamageBase =1653 , nChannelInterval = 47}, --轻击1
	ATK2 =  {nDamageBase =2045 , nChannelInterval = 58},   --轻击2
	ATK3 =  {nDamageBase =3603 , nChannelInterval = 103},   --轻击3	
	BATK1  ={nDamageBase =19611 , nChannelInterval = 642},  --重击1
	BATK2 = {nDamageBase =11984 , nChannelInterval = 344},   --满能量重击附带踢腿
	SKILL1 ={nDamageBase =6640 , nChannelInterval = 191},    --小技能
	SKILL2 ={nDamageBase =3320 , nChannelInterval = 114},   --小技能落枪	
	STUNT1 ={nDamageBase =23907 , nChannelInterval = 687},     --大招1（3段）轻
	STUNT2 ={nDamageBase =15938 , nChannelInterval = 458},     --大招2（5段技能）中
	STUNT3 ={nDamageBase =19922 , nChannelInterval = 572},     --大招2（1段技能）重

}