---------------------------------------------------------------------->
-- �ű�����:	scripts/skill/include/23�������սboss�˺�data.lua
-- ����ʱ��:	2023/2/14 16:24:15
-- �����û�:	SK-20210531KWPG
-- �ű�˵��:	
----------------------------------------------------------------------<
local nScale = 1.1 --2023��10��26�ŵ��˺�ϵ���������������˺������ϵ������

local tPugong = {
	[1] = 40000 * nScale,
	[2] = 60000 * nScale,
	[3] = 80000 * nScale,
	[4] = 161000 * nScale,
}

tBHLDZBossSkillDamage = {
	LiLin = {--����
		atk = tPugong[3], --��ͨ����
		qmfg = 40000 * nScale, --���ŷɹ�
		gxkx = 121000 * nScale,  --���ǿ�Ѩ
	},
	FengNiu = {--���
		jxmy = 60000 * nScale, --��Ϫ����
		flws = 101000 * nScale, --������ɽ
		yfyh = tPugong[1], --�Ʒ����
		jxmyjz = 15000 * nScale, --��Ϫ���̽���
	},
	ChenShiMei = {--��ʿ��
		cc = 45000 * nScale,          --����
		atk = tPugong[2],	     --�չ�
	},
	SuBuChen = {--�ղ���
		cwsw = 50000 * nScale,       --��������
		zywf = 40000 * nScale,        --մ��δ��
	--	lk = 20000,           --�����Կ�
		atk = tPugong[3],	     --�չ�
	},
	MengXiangFei = {--�����
		dclx = 80000 * nScale,       --��������
		dxjq = 40000 * nScale,       --���Ҽ���
		atk = tPugong[1],	     --�չ�
	},
	KaiFeng = {--����
		pfyj = 80000 * nScale,       --�Ʒ�һ��
		pfyjd = 101000 * nScale,       --�Ʒ�һ������
		atk = tPugong[1],	     --�չ�
	},
	HanFeiZi = {--������
		xtd = 30000 * nScale,   --�����
		lz = 30000 * nScale,    --��ת
		yzj = 30000 * nScale, --���н�
		atk = tPugong[3], --�չ�
	},
	HuangJianXiang = {--�ƽ���
		stt = 80000 * nScale,       --ɨ����
		wyj = 101000 * nScale,       --��Ӱ��
		atk = tPugong[1],	     --�չ�
	},
	HanQiaoSheng = {--������
       dtz = 80000 * nScale,       --������
		mlbw = 101000 * nScale,       --������β
		atk = tPugong[1],	     --�չ�
	},
	GaoJiuWen = {--�߾���
		HJD = 101000 * nScale,  --�ӽ���
		LL = 50000 * nScale,  --�ӽ����Ӽ�������
		ZBF = 80000 * nScale,  --ս�˷�
		CY = 60000 * nScale, --����
		atk = tPugong[3], --�չ�
	},
	LuYin = {--³ӡ
		jchd = 50000 * nScale,  --�޴�����
		hdqk = 80000 * nScale,  --�ζ�Ǭ��
		lpfw = 101000 * nScale, --��������
		atk = tPugong[3],	    --�չ�
	},

	ShaoQingCheng = {
		DQ = 50000 * nScale,  --����
		YSJF = 121000 * nScale, --��ʯ���
		YSJF2 =70000 * nScale, --��ʯ����Ӽ���
		ZLYX = 30000 * nScale, --����ع��
		atk = tPugong[3], --�չ�
	},

	XiongYe = {
		DQD = 101000 * nScale,
		ZDQJ = 60000 * nScale,
		atk = tPugong[2], --�չ�
	},

	JiaBian = {
		XFZ = 50000 * nScale,
		HXPB = 80000 * nScale,
		atk = tPugong[1], --�չ�
	},

	ZhenQi = {
		SJBQ = 60000 * nScale,
		DMCC = 101000 * nScale,
		atk = tPugong[1], --�չ�
	},

	SanShiShu = {
		JT = 60000 * nScale,
		CF = 80000 * nScale,
		XZatk = 10000 * nScale,
		atk = tPugong[1],
	},
}