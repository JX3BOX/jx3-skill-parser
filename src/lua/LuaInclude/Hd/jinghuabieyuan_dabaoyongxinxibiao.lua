local MANAGE_CUS = { --玩家主数据块,用于记录玩家拥有的管家的信息
}
local tTowerList = {--塔的信息表，复制一份放到scripts/skill/Quest/镜花别院/打包用信息表.lua
	{Name = GetEditorString(0, 1633), bCanChoose = true, TemplateID = 99453, ShowItemIndex = 36211, nCreateSkillID = 24567, nCD = 1785, nMouseCreateID = 24769, nSkillID = 24460, nAttackArea = nil, nMarkBuffID = 17567, dwPartnerID = 99457, nCoopSkillID = 24527, nCoopMark = MANAGE_CUS.SHOP_FOXIU, nPrice = 150},
	{Name = GetEditorString(0, 1635), bCanChoose = true, TemplateID = 99454, ShowItemIndex = 36212, nCreateSkillID = 24568, nCD = 1786, nMouseCreateID = 24770, nSkillID = 24412, nAttackArea = 10, nMarkBuffID = 17570, dwPartnerID = 99456, nCoopSkillID = 24526, nCoopMark = MANAGE_CUS.SHOP_HUAYANG, nPrice = 150},
	{Name = GetEditorString(0, 1645), bCanChoose = true, TemplateID = 99455, ShowItemIndex = 36213, nCreateSkillID = 24569, nCD = 1787, nMouseCreateID = 24771, nSkillID = 24671, nAttackArea = nil, nMarkBuffID = 17568, dwPartnerID = 99460, nCoopSkillID = 24550, nCoopMark = MANAGE_CUS.SHOP_CECANG, nPrice = 200},
	{Name = GetEditorString(0, 1646), bCanChoose = true, TemplateID = 99456, ShowItemIndex = 36214, nCreateSkillID = 24570, nCD = 1788, nMouseCreateID = 24772, nSkillID = 24481, nAttackArea = 15, nMarkBuffID = 17568, dwPartnerID = 99454, nCoopSkillID = 24526, nCoopMark = MANAGE_CUS.SHOP_HUAYANG, nPrice = 150},
	{Name = GetEditorString(0, 1654), bCanChoose = true, TemplateID = 99457, ShowItemIndex = 36215, nCreateSkillID = 24571, nCD = 1789, nMouseCreateID = 24773, nSkillID = 24483, nAttackArea = 15, nMarkBuffID = 17570, dwPartnerID = 99453, nCoopSkillID = 24527, nCoopMark = MANAGE_CUS.SHOP_FOXIU, nPrice = 240},
	{Name = GetEditorString(0, 5770), bCanChoose = true, TemplateID = 99458, ShowItemIndex = 36216, nCreateSkillID = 24573, nCD = 1790, nMouseCreateID = 24775, nSkillID = 24492, nAttackArea = 6, nMarkBuffID = 17570, dwPartnerID = 99459, nCoopSkillID = 24743, nCoopMark = MANAGE_CUS.SHOP_TANGDU, nPrice = 150},
	{Name = GetEditorString(0, 6552), bCanChoose = true, TemplateID = 99459, ShowItemIndex = 36217, nCreateSkillID = 24572, nCD = 1791, nMouseCreateID = 24774, nSkillID = 24435, nAttackArea = 15, nMarkBuffID = 17573, dwPartnerID = 99458, nCoopSkillID = 24743, nCoopMark = MANAGE_CUS.SHOP_TANGDU, nPrice = 180},
	{Name = GetEditorString(0, 1636), bCanChoose = true, TemplateID = 99460, ShowItemIndex = 36218, nCreateSkillID = 24574, nCD = 1792, nMouseCreateID = 24776, nSkillID = 24478, nAttackArea = 2, nMarkBuffID = 17571, dwPartnerID = 99455, nCoopSkillID = 24550, nCoopMark = MANAGE_CUS.SHOP_CECANG, nPrice = 220},
	{Name = GetEditorString(0, 6023), bCanChoose = true, TemplateID = 99461, ShowItemIndex = 36219, nCreateSkillID = 24575, nCD = 1793, nMouseCreateID = 24777, nSkillID = 24488, nAttackArea = 2, nMarkBuffID = 17567, nPrice = 200},
	{Name = GetEditorString(0, 4845), bCanChoose = true, TemplateID = 99462, ShowItemIndex = 36220, nCreateSkillID = 24576, nCD = 1794, nMouseCreateID = 24778, nSkillID = 24671, nAttackArea = nil, nBuffID = 17563, nMarkBuffID = 17571, dwPartnerID = 99464, nCoopSkillID = 24535, nCoopMark = MANAGE_CUS.SHOP_MINGGE, nPrice = 200},
	{Name = GetEditorString(6, 8209), bCanChoose = true, TemplateID = 99463, ShowItemIndex = 36221, nCreateSkillID = 24577, nCD = 1795, nMouseCreateID = 24779, nSkillID = 24671, nAttackArea = nil, nBuffID = 17564, nMarkBuffID = 17569, nPrice = 240},
	{Name = GetEditorString(8, 791), bCanChoose = true, TemplateID = 99464, ShowItemIndex = 36222, nCreateSkillID = 24578, nCD = 1796, nMouseCreateID = 24780, nSkillID = 24521, nAttackArea = 15, nMarkBuffID = 17569, dwPartnerID = 99462, nCoopSkillID = 24535, nCoopMark = MANAGE_CUS.SHOP_MINGGE, nPrice = 200},
	{Name = GetEditorString(0, 5114), bCanChoose = true, TemplateID = 99465, ShowItemIndex = 36223, nCreateSkillID = 24579, nCD = 1797, nMouseCreateID = 24781, nSkillID = 24475, nAttackArea = 2, nMarkBuffID = 17569, nPrice = 200},
	{Name = GetEditorString(7, 2579), bCanChoose = true, TemplateID = 99466, ShowItemIndex = 36224, nCreateSkillID = 24580, nCD = 1798, nMouseCreateID = 24782, nSkillID = 24443, nAttackArea = 10, nMarkBuffID = 17573, nPrice = 180},
	{Name = GetEditorString(2, 865), bCanChoose = true, TemplateID = 99467, ShowItemIndex = 36225, nCreateSkillID = 24581, nCD = 1799, nMouseCreateID = 24783, nSkillID = 24462, nAttackArea = 6, nMarkBuffID = 17573, nPrice = 220},
	{Name = GetEditorString(17, 3257), bCanChoose = true, TemplateID = 106244, ShowItemIndex = 40950, nCreateSkillID = 28167, nCD = 2048, nMouseCreateID = 28168, nSkillID = 0, nAttackArea = 0, nMarkBuffID = 0, nPrice = 0},
	{Name = GetEditorString(17, 1491), bCanChoose = true, TemplateID = 99710, ShowItemIndex = 36226, nCreateSkillID = 24582, nCD = 1800, nMouseCreateID = 24784, nSkillID = nil, nPrice = 50}, --这个是摇钱树
	
	{Name = GetEditorString(21, 2449), TemplateID = 106329, ShowItemIndex = 40955, nCreateSkillID = 28203, nCD = 2049, nMouseCreateID = 28204, nSkillID = 0, nAttackArea = 0, nMarkBuffID = 0, nPrice = 0},
	{Name = GetEditorString(4, 645), TemplateID = 106244, ShowItemIndex = 40951, nCreateSkillID = 28169, nCD = 2048, nMouseCreateID = 28170, nSkillID = 0, nAttackArea = 0, nMarkBuffID = 0, nPrice = 0},
	--以下就不是正常可选塔了
	{Name = GetEditorString(17, 1886), TemplateID = 99682, nCreateSkillID = 24736, nMouseCreateID = 24763, nSkillID = 24687, nAttackArea = nil, nPrice = 0, nLastTime = 30}, --陷阱
	{Name = GetEditorString(16, 8974), TemplateID = 99683, nCreateSkillID = 24736, nMouseCreateID = 24764, nSkillID = 24690, nAttackArea = nil, nPrice = 0, nLastTime = 30}, --藤蔓
	{Name = GetEditorString(17, 1887), TemplateID = 99684, nCreateSkillID = 24736, nMouseCreateID = 24765, nSkillID = 24692, nAttackArea = nil, nPrice = 0, nLastTime = 30}, --栅栏
	{Name = GetEditorString(17, 1754), TemplateID = 99681, nCreateSkillID = 24736, nMouseCreateID = 0, nSkillID = 24683, nPrice = 0}, --炸弹
	{Name = GetEditorString(17, 2102), TemplateID = 99893, nCreateSkillID = 0, nMouseCreateID = 0, nSkillID = 0, nPrice = 0}, --障碍
	{Name = GetEditorString(7, 2607), TemplateID = 99921, nCreateSkillID = 0, nMouseCreateID = 0, nSkillID = 0, nPrice = 0}, --多多
}
function GetTowerList()
	return tTowerList
end
local tTowerIDList = {} --转置表
for k, v in pairs(tTowerList) do
	tTowerIDList[v.TemplateID] = k
end
function GetTowerIDList()
	return tTowerIDList
end
local tTowerCreateList = {} --创建塔技能ID对应塔编号的转置
for k, v in pairs(tTowerList) do
	tTowerCreateList[v.nCreateSkillID] = k
	tTowerCreateList[v.nMouseCreateID] = k
end
function GetTowerCreateList()
	return tTowerCreateList
end
local tTowerSkillToCD = {} --创建塔技能ID对应塔CD的转置
for k, v in pairs(tTowerList) do
	tTowerSkillToCD[v.nCreateSkillID] = v.nCD
	tTowerSkillToCD[v.nMouseCreateID] = v.nCD
end
function GetTowerSkillToCD()
	return tTowerSkillToCD
end
local tTowerSkill2Price = {} --创建塔技能ID对应塔价格
for k, v in pairs(tTowerList) do
	tTowerSkill2Price[v.nCreateSkillID] = v.nPrice
	tTowerSkill2Price[v.nMouseCreateID] = v.nPrice
end
function GetTowerSkill2Price()
	return tTowerSkill2Price
end
local tMouseCreateList = {}
for k, v in pairs(tTowerList) do
	tMouseCreateList[v.nMouseCreateID] = k
end
function GetMouseCreateList()
	return tMouseCreateList
end