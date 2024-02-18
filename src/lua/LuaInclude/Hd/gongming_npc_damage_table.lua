---------------------------------------------------------------------->
-- �ű�����:	scripts/skill/npc��ս����/npc��ս����/��������npc�˺���.lua
-- ����ʱ��:	2022/6/23 23:11:17
-- �����û�:	KING-20191203GI
-- �ű�˵��:	
----------------------------------------------------------------------<
tGMJL_KangYanBie = {
	ATK1 = {nDamageBase =965 , nChannelInterval = 69},			--���1
	ATK2 = {nDamageBase =906 , nChannelInterval = 65},			--���2
	ATK3 = {nDamageBase =337 , nChannelInterval = 25},			--���3-��2��һ�����˺���
	ATK4 = {nDamageBase =1575 , nChannelInterval = 113},	 	--���4 

	BATK0 = {nDamageBase =2007 , nChannelInterval = 145}, 		--�ػ�0
	BATK1 = {nDamageBase =2475 , nChannelInterval = 178}, 		--�ػ�1
	BATK2 = {nDamageBase =2943 , nChannelInterval = 212},		 --�ػ�2
	BATK3 = {nDamageBase =3412 , nChannelInterval = 246}, 		--�ػ�3
	BATK4 = {nDamageBase =3880 , nChannelInterval = 279}, 		--�ػ�4
	BATK5 = {nDamageBase =4349 , nChannelInterval = 313}, 		--�ػ�5
	BATK6 = {nDamageBase =4817 , nChannelInterval = 347}, 		--�ػ�6
	BATK7 = {nDamageBase =5285 , nChannelInterval = 380}, 		--�ػ�7
	BATK8 = {nDamageBase =5754 , nChannelInterval = 414}, 		--�ػ�8
	BATK9 = {nDamageBase =6222 , nChannelInterval = 448}, 		--�ػ�9
	BATK10 ={nDamageBase =6691 , nChannelInterval = 482}, 		--�ػ�10

	SKILL = {nDamageBase =4917 , nChannelInterval = 354}, 		--С����
	STUNT = {nDamageBase =4696 , nChannelInterval = 338},		 --����1
	--�в����ϵ��д������
}

tGMJL_ShenJianXin = {
	ATK1 = {nDamageBase =1891 , nChannelInterval = 113},    --���1
	ATK2 = {nDamageBase =1006 , nChannelInterval = 60},  --���2��3��һ�����˺���
	ATK3 = {nDamageBase =2519 , nChannelInterval = 151},    --���3
	
	BATK1 = {nDamageBase =4085 , nChannelInterval = 245},    --�ػ�1

	--SKILL = {nDamageBase 	= 1, nChannelInterval = 1}, --С���ܣ������棩
	
	STUNT1 = {nDamageBase =1867 , nChannelInterval = 112},  --����1��3�Σ���
	STUNT2 = {nDamageBase =2988 , nChannelInterval = 179},  --����2��5�μ��ܣ���
	STUNT3 = {nDamageBase =5603 , nChannelInterval = 336},  --����2��1�μ��ܣ���
	STUNT4 = {nDamageBase =11206 , nChannelInterval = 672},	  --���б�������β
	
	--�в����ϵ��д�����棨��ѧ���磩
	JINGJIE1 = {nDamageBase =2767 , nChannelInterval = 166},    --��ѧ����1�˺�
}

tGMJL_QingRou = {
	ATK1 = {nDamageBase =1020 , nChannelInterval = 73},       --���1
	ATK1_H = {nDamageBase = 4385, nChannelInterval = 168},     --���1����
	
	ATK2 = {nDamageBase =2683 , nChannelInterval = 193},     --���2
	ATK2_H = {nDamageBase = 4604, nChannelInterval = 177},     --���2����
	
	ATK3 = {nDamageBase =2947 , nChannelInterval = 212},     --���3
	ATK3_H = {nDamageBase = 4834, nChannelInterval = 186},     --���3����
	
	BATK1 = {nDamageBase =6772 , nChannelInterval = 488},   --�ػ�1
	BATK1_H = {nDamageBase = 23625, nChannelInterval = 907},  --�ػ�1����
	
	SKILL_H = {nDamageBase = 42000, nChannelInterval = 1613},  --С��������
	STUNT = {nDamageBase =4341 , nChannelInterval = 313},    --����ÿ���ػ�����
	STUNT_H = {nDamageBase 	= 50400	, nChannelInterval = 1935	}, --��������
	
	--�в����ϵ��д�����棨��ѧ���磩
	JINGJIE4 = {nDamageBase =2532 , nChannelInterval = 182},    --��ѧ����4�˺�ÿ���������
}

tGMJL_TangXiaoKe = {
	ATK1 = {nDamageBase =1094 , nChannelInterval = 66},			--���1
	ATK2 = {nDamageBase =2173 , nChannelInterval = 130},  		 --���2
	ATK3 = {nDamageBase =4103 , nChannelInterval = 246},		 --���3
	
	BATK1 = {nDamageBase =6041 , nChannelInterval = 362},		    --�ػ�1
	
	SKILL = {nDamageBase =3490 , nChannelInterval = 209},            --С����
	STUNT = {nDamageBase =32221 , nChannelInterval = 1933}, 		  --����
	
	--�в����ϵ��д�����棨��ѧ���磩
	JINGJIE2 = {nDamageBase =906 , nChannelInterval = 54},		    --��ѧ����2�˺�
}

tGMJL_WenZheZhi = { --����֦
	YANGMING = {nDamageBase =2617 , nChannelInterval = 244},  		 --����
	SHANGYANG = {nDamageBase =2600 , nChannelInterval = 238},		 --����
	SHANGYANG_DOT = {nDamageBase =2600 , nChannelInterval = 238},		 --������dot��dot�������ڼ��ܽű�����ͬһ��ϵ��
	YUSHI = {nDamageBase =1515 , nChannelInterval = 326}, --��ʯ
	KUAIXUE = {nDamageBase =2290 , nChannelInterval = 381},	  		  --��ѩ
}

tGMJL_NianXiaoLu = { --��С¹
	XIEXIN = {nDamageBase =3380 , nChannelInterval = 310},  		 --Ы��
	SHEYING_DOT = {nDamageBase =780 , nChannelInterval = 520},		 --��Ӱdot
	BAIZU = {nDamageBase =1500 , nChannelInterval = 300},		 --���㣬 ʵ���ϺͰ���dot��ͬһ��ϵ��
	BAIZU_DOT = {nDamageBase =1500 , nChannelInterval = 300}, --����dot
	LIANYUAN = {nDamageBase =3250 , nChannelInterval = 286},	  		  --��Ե
}

tGMJL_RuanGuiYun = { --�����
	YINGUANG = {nDamageBase =1980 , nChannelInterval = 181},  		 --������ѩ
	GOUWEN = {nDamageBase =1760 , nChannelInterval = 176},		 --����
	ZHANYI = {nDamageBase =1210 , nChannelInterval = 121},		 --մ��
	CHUANWU = {nDamageBase =2420 , nChannelInterval = 242}, --����
	NILUAN_DOT = {nDamageBase =242 , nChannelInterval = 136},	  		  --����
}
--���������ƺ�T��CD��λΪ��
tGMJL_WenCiQiu = { --�´���
	TIZHEN = {nDamageBase =12000 , nChannelInterval = 718},  		 --����
	CHUNNI = {nCD = 30},  		 --����
	FENGZHEN = {nCD = 900},  		 --���룬�ݲ�����
}

tGMJL_NianXiaoXiong = { --��С��
	BINGCAN = {nDamageBase =7000 , nChannelInterval = 500},  		 --����
	BINGCAN_JS = {nDamageBase =2100 , nChannelInterval = 150},  		 --���Ͻ���2Ŀ��
	SHENGSHOU = {nDamageBase =10000 , nChannelInterval = 1000, nCD = 30},		 --ʥ��
	FENGHUANG = {nCD = 900},		 --���
}

tGMJL_RuanXianZhou = { --������
	BAIZHI = {nDamageBase =11000 , nChannelInterval = 676},  		 --����
	LONGKUI = {nDamageBase =20000 , nChannelInterval = 1000, nCD = 30},		 --����
	KUMU = {nCD = 900},		 --��ľ
}

tGMJL_RongRong = { -- ����
	CHIRILUN = {nDamageBase = 1500, nChannelInterval = 120.},  		 --������
	YOUYUELUN = {nDamageBase = 1500 , nChannelInterval = 120},  		 --������
	TANMOTI = {nCD = 60},		 --̰ħ��
	CHAOSHENGYAN = {nCD = 360},		 --��ʥ��
}

tGMJL_YanZiNiang = { -- ������
	
	ATK1 = {nDamageBase = 7200, nChannelInterval = 97}, --�̻�һ
	ATK2 = {nDamageBase = 9600, nChannelInterval = 130}, --�̻���
	ATK3 = {nDamageBase = 12000, nChannelInterval = 162}, --�̻���
	CHUXUE = {nDamageBase = 24000, nChannelInterval = 600.},  		 --Ѫ�������˺�
	YOUYANBU = {nDamageBase = 14400, nChannelInterval = 360},		 --��Ӱ������
	YANFEIHUAN = {nDamageBase = 2400, nChannelInterval = 60}, --��ɻ�����
	YANFEIHUAN_H = {nDamageBase = 15000, nChannelInterval = 2500}, --��ɻ�����
	
}

tGMJL_DaoMa = { -- ����
	ATK_S		= 	{nDamageBase = 5000, 	nChannelInterval = 150 , nBaseThreat=1}, --���׵�����Ѫ
	ATK_B 		= 	{nDamageBase = 6500, 	nChannelInterval = 195 , nBaseThreat=1}, --ͷ׶�󵶡���Ѫ
	LIESUZHAN1 = 	{nDamageBase = 4000, 	nChannelInterval = 120 , nBaseThreat=1}, --����ն��һ�Σ�
	LIESUZHAN2 = 	{nDamageBase = 6000, 	nChannelInterval = 180 , nBaseThreat=1}, --����ն�����Σ�
	LIESUZHAN3 = 	{nDamageBase = 10000, 	nChannelInterval = 300 , nBaseThreat=1}, --����ն�����Σ�
	CHONGJIBO	= 	{nDamageBase = 3000,	nChannelInterval = 90  , nBaseThreat=1}, --����Ԩ(������������˺�)
}

tGMJL_LiXingYun = { --������
	ATK1_A = {nDamageBase =1408 , nChannelInterval = 85},  --���1�⹦
	ATK2_A = {nDamageBase =1809 , nChannelInterval = 109},   --���2�⹦
	ATK3_A = {nDamageBase =2515 , nChannelInterval = 151},	 --���3�⹦

	ATK1_B = {nDamageBase =704 , nChannelInterval = 51}, 	--���1�ڹ����������У�
	ATK2_B = {nDamageBase =904 , nChannelInterval = 65},	--���2�ڹ�
	ATK3_B = {nDamageBase =1257 , nChannelInterval = 91},	 --���3�ڹ�
	
	BATK1 = {nDamageBase =471 , nChannelInterval = 28},   --�ػ�(��)

	SKILL_A   = {nDamageBase =978 , nChannelInterval = 59},		--С�����⹦
	SKILL_B0  = {nDamageBase =611 , nChannelInterval = 44},		--С�����ڹ������˺�
	SKILL_B1  = {nDamageBase =1064 , nChannelInterval = 77},		--С�����ڹ�1����
	SKILL_B2  = {nDamageBase =1516 , nChannelInterval = 109},	--С�����ڹ�2����
	SKILL_B3  = {nDamageBase =1969 , nChannelInterval = 142},	--С�����ڹ�3����
	SKILL_B4  = {nDamageBase =2421 , nChannelInterval = 174},	--С�����ڹ�4����
	SKILL_B5  = {nDamageBase =2874 , nChannelInterval = 207},	--С�����ڹ�5����
	SKILL_B6  = {nDamageBase =3327 , nChannelInterval = 240},	--С�����ڹ�6����
	SKILL_B7  = {nDamageBase =3779 , nChannelInterval = 272},	--С�����ڹ�7����
	SKILL_B8  = {nDamageBase =4232 , nChannelInterval = 305},	--С�����ڹ�8����
	SKILL_B9  = {nDamageBase =4684 , nChannelInterval = 337},	--С�����ڹ�9����
	SKILL_B10 = {nDamageBase =5137 , nChannelInterval = 370},	--С�����ڹ�10����
	
	
	STUNT = {nDamageBase =5243 , nChannelInterval = 315},		 --����1��5�Σ�
	
	--�в����ϵ��д�����棨��ѧ���磩
}

tGMJL_YueJiaHe = { --�¼κ�

	ATK1    =	{nDamageBase =1408 , nChannelInterval = 79},--���1	
	ATK2    =	{nDamageBase =1239 , nChannelInterval = 69},--���2 
	ATK3_A  =	{nDamageBase =2235 , nChannelInterval = 125},--���3 ����
	ATK3_B  =	{nDamageBase =1490 , nChannelInterval = 83},--���3 ׷��
	BATK1   =	{nDamageBase =830 , nChannelInterval = 47},--�ػ�
	BATK2   =	{nDamageBase =4844 , nChannelInterval = 271},--�ػ�׷��
	STUNT   =	{nDamageBase =5190 , nChannelInterval = 291},--����
	
	HN      ={nDamageBase =10 , nChannelInterval = 30},--��ѧ����һ���ܺ�С���ܻ���
	

	--�в����ϵ��д�����棨��ѧ���磩
	--��ȱ����3�˺�
	--JINGJIE3 = {nDamageBase =917 , nChannelInterval = 66},		 --�Ѹ�Ϊ���ļӳ�
}

tGMJL_HeXian = { --����

	ATK1    =	{nDamageBase =1408 , nChannelInterval = 79},--���1	�������Ӽ���
	ATK2_A  = {nDamageBase = 1239, nChannelInterval = 44}, --���2 1���罣�������˺���ÿ���˺�
	ATK2_B  = {nDamageBase = 1239, nChannelInterval = 48}, --���2 2���罣�������˺���ÿ���˺�
	ATK2_C  = {nDamageBase = 1239, nChannelInterval = 52}, --���2 3���罣�������˺���ÿ���˺�
	ATK2_D  = {nDamageBase = 1239, nChannelInterval = 56}, --���2 4���罣�������˺���ÿ���˺�
	ATK2_E  =	{nDamageBase =1239 , nChannelInterval = 60},--���2 5���罣�������˺���ÿ���˺�
	ATK3_A  =	{nDamageBase =4103 , nChannelInterval = 246},--���3 ����һ�η�Χ�˺����Ӽ���
	ATK3_B  =	{nDamageBase =1490 , nChannelInterval = 83},--���3 ������ʱ�����˺����Ӽ���
	BATK1   =	{nDamageBase =6041 , nChannelInterval = 362},--�ػ� ����������˺��Ӽ���
	BATK2   =	{nDamageBase =4844 , nChannelInterval = 271},--�ػ�׷�� ���ǵ�Ѫ��׷���Ӽ���
	STUNT_Q =  {nDamageBase = 5190, nChannelInterval = 380}, --���� ����ͨ΢����̬��0.8��һ�ε��Ӽ����˺�
	STUNT_J = {nDamageBase = 7000, nChannelInterval = 500}, --���� ����ͨ΢�����̬��β��ȫ��һ��
	SKILL  = {nDamageBase = 3490, nChannelInterval = 287}, --���� �����˺��Ӽ���
	SKILL5 = {nDamageBase = 3490, nChannelInterval = 120}, --���� ���������˺��Ӽ���
}

tGMJL_FeiDaJin = { -- �Ѵ�
	ATK1_P = {nDamageBase = 2400, nChannelInterval = 30,nBaseThreat=30000}, --ȭpunch���
	ATK2_P = {nDamageBase = 2400, nChannelInterval = 30,nBaseThreat=30000}, --ȭpunch���
	ATK1_K = {nDamageBase = 4800, nChannelInterval = 60,nBaseThreat=40000}, --��kick���
	ATK2_K = {nDamageBase = 4800, nChannelInterval = 60,nBaseThreat=40000}, --��kick���
	BATK1 = {nDamageBase = 2880, nChannelInterval = 36, nCD = 9, nBaseThreat = 50000}, --СȺ��
	--ȭ���Ե���BUFF��10ȭ������л���̬������50�룬�ڼ���ٻ�������15%
}


tGMJL_BaiQue = { --��ȵ
	ATK1 =  {nDamageBase =1653 , nChannelInterval = 47}, --���1
	ATK2 =  {nDamageBase =2045 , nChannelInterval = 58},   --���2
	ATK3 =  {nDamageBase =3603 , nChannelInterval = 103},   --���3	
	BATK1  ={nDamageBase =19611 , nChannelInterval = 642},  --�ػ�1
	BATK2 = {nDamageBase =11984 , nChannelInterval = 344},   --�������ػ���������
	SKILL1 ={nDamageBase =6640 , nChannelInterval = 191},    --С����
	SKILL2 ={nDamageBase =3320 , nChannelInterval = 114},   --С������ǹ	
	STUNT1 ={nDamageBase =23907 , nChannelInterval = 687},     --����1��3�Σ���
	STUNT2 ={nDamageBase =15938 , nChannelInterval = 458},     --����2��5�μ��ܣ���
	STUNT3 ={nDamageBase =19922 , nChannelInterval = 572},     --����2��1�μ��ܣ���

}