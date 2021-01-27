--======================================================================--
-- @作者: GGE研究群: 342119466
-- @创建时间:   2018-03-03 02:34:19
-- @Last Modified time: 2021-01-26 12:45:21
--======================================================================--
function 引擎.特效库(tx)
	local txs = {}
	if tx == "雨落寒沙" then
		txs[1] = 1229832530
		txs[2] = "addon.wdf"
	elseif tx == "失忆符" then
		txs[1] = 3567923082
		txs[2] = "magic.wdf"
   elseif tx == "状态_失忆符" then
		txs[1] = 0xEB3D0AC1
		txs[2] = "waddon.wdf"
   elseif tx == "状态_苍白纸人_敌方" then
		txs[1] = 0x2F45B9F0
		txs[2] = "waddon.wdf"
   elseif tx == "状态_苍白纸人_我方" then
		txs[1] = 0x592EBD89
		txs[2] = "waddon.wdf"
	elseif tx == "状态_混元伞_敌方" then
		txs[1] = 0x2F45B9F0
		txs[2] = "waddon.wdf"
   elseif tx == "状态_混元伞_我方" then
		txs[1] = 0x592EBD89
		txs[2] = "waddon.wdf"
  elseif tx == "状态_乾坤玄火塔_敌方" then
		txs[1] = 0x325A1F6A
		txs[2] = "waddon.wdf"
  elseif tx == "状态_乾坤玄火塔" then
		txs[1] = 0xC236BF21
		txs[2] = "waddon.wdf"
  elseif tx == "状态_干将莫邪_敌方" then
		txs[1] = 0x47F867FF
		txs[2] = "waddon.wdf"
  elseif tx == "状态_干将莫邪_我方" then
		txs[1] = 0x7838CE56
		txs[2] = "waddon.wdf"
   elseif tx == "状态_发瘟匣" then
		txs[1] = 0x325A1F6A
		txs[2] = "waddon.wdf"
   elseif tx == "逃跑" then
		txs[1] = 0xF5189E48
		txs[2] = "addon.wdf"
	elseif tx == "罗汉金钟" then
		txs[1] = 2602824590
		txs[2] = "magic.wdf"
	elseif tx == "状态_罗汉金钟" then
		txs[1] = 1549538628
		txs[2] = "waddon.wdf"
	elseif tx == "慈航普渡" then
		txs[1] = 804734328
		txs[2] = "magic.wdf"
	elseif tx == "太极护法" then
		txs[1] = 2602824590
		txs[2] = "magic.wdf"
	elseif tx == "状态_太极护法" then
		txs[1] = 1549538628
		txs[2] = "waddon.wdf"
	elseif tx == "光辉之甲" then
		txs[1] = 956135146
		txs[2] = "magic.wdf"
	elseif tx == "状态_光辉之甲" then
		txs[1] = 0X26ADD570
		txs[2] = "waddon.wdf"
	elseif tx == "圣灵之甲" then
		txs[1] = 956135146
		txs[2] = "magic.wdf"
	elseif tx == "状态_圣灵之甲" then
		txs[1] = 0X26ADD570
		txs[2] = "waddon.wdf"
	elseif tx == "野兽之力" then
		txs[1] = 540773493
		txs[2] = "magic.wdf"
	elseif tx == "魔兽之印" then
		txs[1] = 540773493
		txs[2] = "magic.wdf"
	elseif tx == "状态_法术防御" then
		txs[1] = 0x7AEF08A1
		txs[2] = "waddon.wdf"
	elseif tx == "八凶法阵" then
		txs[1] = 0x139426B5
		txs[2] = "magic.wdf"
	elseif tx == "天降灵葫" then
		txs[1] = 0X960A8662
		txs[2] = "magic.wdf"
	elseif tx == "叱咤风云" then
		txs[1] = 0x60EB2F76
		txs[2] = "magic.wd1"
	elseif tx == "状态_死亡召唤" then
		txs[1] = 0x2C6223D4
		txs[2] = "waddon.wdf"
    elseif tx == "金甲仙衣_敌方" or tx =="无魂傀儡_敌方" or tx =="断线木偶_敌方" or tx =="降魔斗篷_敌方" then
		txs[1] = 2062485665
		txs[2] = "magic.wdf"
	elseif tx == "金甲仙衣_我方" or tx =="无魂傀儡_我方" or tx =="断线木偶_我方" or tx =="降魔斗篷_我方" then
		txs[1] = 602645836
		txs[2] = "addon.wdf"
	elseif tx =="无魂傀儡_敌方" or tx =="断线木偶_敌方" or tx =="降魔斗篷_敌方" then
		txs[1] = 0x7AEF08A1
		txs[2] = "magic.wdf"
	elseif tx =="无魂傀儡_我方" or tx =="断线木偶_我方" or tx =="降魔斗篷_我方" then
		txs[1] = 0x23EBA54C
		txs[2] = "magic.wdf"
	 elseif tx == "状态_无魂傀儡" or tx == "状态_断线木偶" or tx == "状态_无尘扇" then
		txs[1] = 0xEAA3EC9B
		txs[2] = "addon.wdf"
	elseif tx == "龙腾" then
		txs[1] = 1936174863
		txs[2] = "magic.wdf"
	elseif tx == "无尘扇" then
		txs[1] = 0x0B8C9232
		txs[2] = "magic.wdf"
  	elseif tx == "混元伞" then
		txs[1] = 0x1F334661
		txs[2] = "magic.wdf"
	elseif tx == "上古灵符(怒雷)" then
		txs[1] = 0x538C9770
		txs[2] = "magic.wdf"
   	elseif tx == "上古灵符(流沙)" then
		txs[1] = 0x538C9770
		txs[2] = "magic.wdf"
   	elseif tx == "上古灵符(心火)" then
		txs[1] = 0x9779B893
		txs[2] = "magic.wdf"
  	elseif tx == "干将莫邪_敌方" then
		txs[1] = 0x47F867FF
		txs[2] = "magic.wdf"
  	elseif tx == "干将莫邪_我方" then
		txs[1] = 0x7838CE56
		txs[2] = "magic.wdf"
  	elseif tx == "清心咒" then
		txs[1] = 0x6BF02DCF
		txs[2] = "magic.wdf"
  	elseif tx == "苍白纸人" then
		txs[1] = 0x899DFF11
		txs[2] = "magic.wdf"
	elseif tx == "断线木偶" or tx=="无魂傀儡" then
		txs[1] = 0x23EBA54C
		txs[2] = "addon.wdf"
  	elseif tx == "鬼泣" or tx=="惊魂铃" then
		txs[1] = 0x96E5FD5D
		txs[2] = "magic.wdf"
   	elseif tx == "失心钹"  then
		txs[1] = 0xB5DC4541
		txs[2] = "magic.wdf"
	elseif tx == "乾坤玄火塔"  then
		txs[1] = 0xE4A2B66E
		txs[2] = "magic.wdf"
  	elseif tx == "状态_摄魂" or tx=="摄魂"  then
		txs[1] = 0xE02F2E6D
		txs[2] = "magic.wdf"
  elseif tx == "状态_断线木偶" or tx=="状态_无魂傀儡" then
		txs[1] = 0xEAA3EC9B
		txs[2] = "addon.wdf"
	elseif tx == "妙手回春" then
		txs[1] = 51617616
		txs[2] = "magic.wdf"
	elseif tx == "凝神诀" then
		txs[1] = 2128818470
		txs[2] = "magic.wdf"
	elseif tx == "千里神行" then
		txs[1] = 3356723242
		txs[2] = "magic.wdf"
	elseif tx == "水攻" then
		txs[1] = 4180877467
		txs[2] = "magic.wdf"
	elseif tx == "碎星诀" then
		txs[1] = 2704907892
		txs[2] = "common/lbc.wdf"
	elseif tx == "尸腐毒" then
		txs[1] = 353158077
		txs[2] = "magic.wdf"
   	elseif tx == "自爆" then
		txs[1] = 0xA5199709
		txs[2] = "magic.wdf"
	elseif tx == "捕捉开始" then
		txs[1] = 3195920150
		txs[2] = "addon.wdf"
	elseif tx == "满天花雨" then
		txs[1] = 2640278135
		txs[2] = "magic.wdf"
	elseif tx == "似玉生香" or tx == "碎玉弄影" then
		txs[1] = 1187493750
		txs[2] = "magic.wdf"
	elseif tx == "状态_似玉生香" then
		txs[1] = 0x59D77EF9
		txs[2] = "waddon.wdf"
	elseif tx == "状态_象形" then
		txs[1] = 0x3646A4D9
		txs[2] = "waddon.wdf"

	elseif tx == "状态_雾杀" then
		txs[1] = 1506044316
		txs[2] = "common/sml.wdf"
	elseif tx == "落岩" then
		txs[1] = 180555238
		txs[2] = "magic.wdf"
	elseif tx == "回魂咒" then
		txs[1] = 2391977602
		txs[2] = "magic.wdf"
	elseif tx == "韦陀护法" then
		txs[1] = 2493890284
		txs[2] = "magic.wdf"
	elseif tx == "烟雨剑法" then
		txs[1] = 3496024499
		txs[2] = "magic.wdf"
   elseif tx == "飘渺式" then
		txs[1] = 3496024499
		txs[2] = "magic.wdf"
	elseif tx == "百万神兵" then
		txs[1] = 2340755185
		txs[2] = "magic.wdf"
	elseif tx == "日光华" then
		txs[1] = 0x45CA9913
		txs[2] = "magic.wdf"
	elseif tx == "靛沧海" then
		txs[1] = 0x6C5F8376
		txs[2] = "magic.wdf"
	-- elseif tx == "泰山压顶" then
	-- 	txs[1] = 0xDED2253F
	-- 	txs[2] = "magic.wdf"
	elseif tx == "泰山压顶" then
		txs[1] = 0xDED2253E
		txs[2] = "magic.wdf"
	elseif tx == "苍茫树" then
		txs[1] = 0x9CCB6E84
		txs[2] = "magic.wdf"
	elseif tx == "巨岩破" then
		txs[1] = 0xBBE9480B
		txs[2] = "magic.wdf"
	elseif tx == "地裂火" then
		txs[1] = 0x18E13BE9
		txs[2] = "magic.wdf"
	elseif tx == "惊心一剑" then
		txs[1] = 1000651155
		txs[2] = "addon.wdf"
	elseif tx == "落魄符" then
		txs[1] = 1337287235
		txs[2] = "magic.wdf"
	elseif tx == "水遁" then
		txs[1] = 1280017893
		txs[2] = "magic.wdf"
	elseif tx == "泰山压顶" then
		txs[1] = 2017434912
		txs[2] = "magic.wdf"
	elseif tx == "泰山压顶1" then
		txs[1] = 0xDF4C3BE3
		txs[2] = "magic.wdf"
	elseif tx == "泰山压顶2" then
		txs[1] = 0xE9401B00
		txs[2] = "magic.wdf"
	elseif tx == "泰山压顶3" then
		txs[1] = 0x133F8E31
		txs[2] = "magic.wdf"
	elseif tx == "达摩护体" or tx == "状态_达摩护体"then
		txs[1] = 2565901429
		txs[2] = "magic.wdf"
	elseif tx == "地涌金莲" then
		txs[1] = 3231850111
		txs[2] = "common/wdd.wdf"
	elseif tx == "杀气诀" then
		--txs[1] = 3264874295
		--txs[2] = "magic.wdf"
        txs[1] = 0xC29A0737
		txs[2] = "magic.wdf"
	elseif tx == "龙卷雨击1" then
		txs[1] = 0xA19EAB31
		txs[2] = "magic.wdf"
	-- elseif tx == "地狱烈火" then
	-- 	txs[1] = 0x257635EE
	-- 	txs[2] = "magic.wdf"
	elseif tx == "地狱烈火" then
		txs[1] = 0x257635EF
		txs[2] = "magic.wdf"
	elseif tx == "地狱烈火2" then
		txs[1] = 0xBE325D99
		txs[2] = "magic.wdf"
	elseif tx == "炎护" then
		txs[1] = 1863894572
		txs[2] = "common/sml.wdf"
	elseif tx == "加血" then
		txs[1] = 2010253357
		txs[2] = "addon.wdf"
	elseif tx == "杳无音讯" or tx == "凋零之歌" then
		txs[1] = 2709550029
		txs[2] = "magic.wdf"
	elseif tx == "裂石" then
		txs[1] = 741439825
		txs[2] = "common/lbc.wdf"

	elseif tx == "断岳势" then
		txs[1] = 741439825
		txs[2] = "common/lbc.wdf"
	elseif tx == "推气过宫" then
		txs[1] = 3899242890
		txs[2] = "magic.wdf"
	elseif tx == "状态_金刚护体" then
		txs[1] = 916220457
		txs[2] = "waddon.wdf"
	elseif tx == "离魂符" then
		txs[1] = 421114130
		txs[2] = "magic.wdf"
	elseif tx == "加愤怒" then
		txs[1] = 2156718962
		txs[2] = "addon.wdf"
	elseif tx == "五雷轰顶" then
		txs[1] = 4292234442
		txs[2] = "magic.wdf"
	elseif tx == "冰清诀" or tx == "晶清诀" or tx == "玉清诀" or tx == "水清诀" or tx == "同生共死" then
		txs[1] = 388205471
		txs[2] = "magic.wdf"
	elseif tx == "楚楚可怜" then
		txs[1] = 405595707
		txs[2] = "magic.wdf"
	elseif tx == "佛门普渡" then
		txs[1] = 428453890
		txs[2] = "magic.wdf"
	elseif tx == "防御" then
		txs[1] = 908223343
		txs[2] = "addon.wdf"
	elseif tx == "天神护体" then
		txs[1] = 3231493430
		txs[2] = "magic.wdf"
	elseif tx == "龙卷雨击4" then
		txs[1] = 0xA19EAB31
		txs[2] = "magic.wdf"
	elseif tx == "龙卷雨击5" then
		txs[1] = 0xA19EAB31
		txs[2] = "magic.wdf"
	elseif tx == "活血" then
		txs[1] = 51617616
		txs[2] = "magic.wdf"
	elseif tx == "雷击" then
		txs[1] = 238079300
		txs[2] = "magic.wdf"
	elseif tx == "天蚕丝" then
		txs[1] = 341882911
		txs[2] = "magic.wdf"
	elseif tx == "天罗地网" then
		txs[1] = 513152598
		txs[2] = "magic.wdf"

   elseif tx == "状态_天罗地网" then
		txs[1] = 0x8F3E73D5
		txs[2] = "waddon.wdf"


	elseif tx == "天神护法" then
		txs[1] = 1935690327
		txs[2] = "magic.wdf"
	elseif tx == "状态_夺魄令" then
		txs[1] = 566328485
		txs[2] = "common/wdd.wdf"
	elseif tx == "牛刀小试" then
		txs[1] = 1000651155
		txs[2] = "addon.wdf"
	elseif tx == "二龙戏珠" then
		txs[1] = 2793449505
		txs[2] = "magic.wdf"
	elseif tx == "盘丝阵" then
		txs[1] = 1774142217
		txs[2] = "magic.wdf"
	elseif tx == "惊魂掌" then
		txs[1] = 3285527731
		txs[2] = "common/wdd.wdf"
	elseif tx == "状态_尸腐毒" then
		txs[1] = 2208088730
		txs[2] = "waddon.wdf"
	elseif tx == "四海升平" then
		txs[1] = 3497509792
		txs[2] = "magic.wdf"
	elseif tx == "雷霆万钧" then
		txs[1] = 664467571
		txs[2] = "magic.wdf"
	elseif tx == "状态_韦陀护法" then
		txs[1] = 2243155697
		txs[2] = "waddon.wdf"
	elseif tx == "移形换影" then
		txs[1] = 1963789198
		txs[2] = "magic.wdf"
	elseif tx == "坐莲" then
		txs[1] = 1915810093
		txs[2] = "magic.wdf"
	elseif tx == "后发制人" then
		txs[1] = 968268166
		txs[2] = "magic.wdf"
	elseif tx == "阎罗令" then
		txs[1] = 2662404697
		txs[2] = "magic.wdf"
   elseif tx == "飞镖" then
		txs[1] = 0x494DC152
		txs[2] = "addon.wdf"

	elseif tx == "飞砂走石" then
		txs[1] = 0x49CBD108
		txs[2] = "magic.wdf"
	elseif tx == "红袖添香" then
		txs[1] = 3858048292
		txs[2] = "magic.wdf"
	elseif tx == "状态_追魂符" then
		txs[1] = 3655438388
		txs[2] = "waddon.wdf"
	elseif tx == "牛屎遁" then
		txs[1] = 2938873934
		txs[2] = "magic.wdf"
	elseif tx == "横扫千军" then
		txs[1] = 2896471370
		txs[2] = "magic.wdf"
	elseif tx == "命归术" then
		txs[1] = 821212684
		txs[2] = "magic.wdf"
	elseif tx == "炼气化神" then
		txs[1] = 910697598
		txs[2] = "magic.wdf"
	elseif tx == "移魂化骨" then
		txs[1] = 330324521
		txs[2] = "common/wdd.wdf"
	elseif tx == "推拿" then
		txs[1] = 51617616
		txs[2] = "magic.wdf"
	elseif tx == "状态_红袖添香" then
		txs[1] = 3037907947
		txs[2] = "waddon.wdf"
	elseif tx == "日月乾坤" then
		txs[1] = 2802651747
		txs[2] = "magic.wdf"
	elseif tx == "状态_楚楚可怜" then
		txs[1] = 1923968442
		txs[2] = "waddon.wdf"
	elseif tx == "追魂符" then
		txs[1] = 3556918902
		txs[2] = "magic.wdf"
	elseif tx == "状态_离魂符" then
		txs[1] = 3655438388
		txs[2] = "waddon.wdf"

   	elseif tx == "神龙摆尾" then
		txs[1] = 0xA4790CE1
		txs[2] = "magic.wdf"
	elseif tx == "状态_神龙摆尾" then
		txs[1] = 0xF184BD59
		txs[2] = "waddon.wdf"

	elseif tx == "状态_百万神兵" then
		txs[1] = 3297426043
		txs[2] = "waddon.wdf"
	elseif tx == "烈火" then
		txs[1] = 3507654973
		txs[2] = "magic.wdf"
  elseif tx == "状态_定心术" then
		txs[1] = 0x2D07CCEC
		txs[2] = "magic.wdf"
	elseif tx == "定心术" then
		txs[1] = 0x2D07CCEC
		txs[2] = "magic.wdf"


	elseif tx == "状态_变身" or tx == "变身" then
		txs[1] = 702028255
		txs[2] = "magic.wdf"
	elseif tx == "破血狂攻" then
		txs[1] = 387269810
		txs[2] = "addon.wdf"
	elseif tx == "鹰击" or tx == "象形" then
		txs[1] = 0x82C9074A
		txs[2] = "magic.wdf"
	elseif tx == "弓弩攻击" then
		txs[1] = 3804004647
		txs[2] = "common/lbc.wdf"
	elseif tx == "状态_蓝灯" or tx =="状态_炼气化神" then
		txs[1] = 1906144895
		txs[2] = "waddon.wdf"


	elseif tx == "状态_红灯" then
		txs[1] = 4176381242
		txs[2] = "waddon.wdf"
	elseif tx == "状态_生命之泉" then
		txs[1] = 4176381242
		txs[2] = "waddon.wdf"
	elseif tx == "状态_定身符" then
		txs[1] = 2461182746
		txs[2] = "waddon.wdf"
	elseif tx == "状态_不动如山" then
		txs[1] = 281904888
		txs[2] = "common/lbc.wdf"
	elseif tx == "金刚护体" then
		txs[1] = 952243307
		txs[2] = "magic.wdf"
	elseif tx == "龙卷雨击3" then
		txs[1] = 3514247917
		txs[2] = "magic.wdf"
	elseif tx == "浪涌" then
		txs[1] = 1065487884
		txs[2] = "common/lbc.wdf"
	elseif tx == "状态_如花解语" then
		txs[1] = 505084121
		txs[2] = "waddon.wdf"
	elseif tx == "气归术" then
		txs[1] = 3497509792
		txs[2] = "magic.wdf"
	elseif tx == "天崩地裂" then
		txs[1] = 2761456237
		txs[2] = "common/lbc.wdf"
	elseif tx == "龙吟" then
		txs[1] = 1667259533
		txs[2] = "magic.wdf"
	elseif tx == "状态_莲步轻舞" then
		txs[1] = 3387695093
		txs[2] = "waddon.wdf"
	elseif tx == "加蓝" then
		txs[1] = 1049700101
		txs[2] = "addon.wdf"
	elseif tx == "狮搏" then
		txs[1] = 1754178891
		txs[2] = "addon.wdf"
	elseif tx == "威慑" then
		txs[1] = 0xB77BBE55
		txs[2] = "addon.wdf"
	elseif tx == "尘土刃" then
		txs[1] = 2645145495
		txs[2] = "common/sml.wdf"
	elseif tx == "状态_明光宝烛" then
		txs[1] = 540412418
		txs[2] = "common/wdd.wdf"
	elseif tx == "判官令" then
		txs[1] = 605841034
		txs[2] = "magic.wdf"
	elseif tx == "百爪狂杀" then
		txs[1] = 0x171544B2
		txs[2] = "magic.wdf"
	elseif tx == "状态_摧心术" then
		txs[1] = 2126428619
		txs[2] = "common/wdd.wdf"
	elseif tx == "状态_惊魂掌" then
		txs[1] = 2156799976
		txs[2] = "common/wdd.wdf"
	elseif tx == "错乱" then
		txs[1] = 783501166
		txs[2] = "magic.wdf"
	elseif tx == "状态_炎护" then
		txs[1] = 2336654137
		txs[2] = "common/sml.wdf"
	elseif tx == "状态_后发制人" then
		txs[1] = 707397219
		txs[2] = "waddon.wdf"
	elseif tx == "阵型_不动如山" then
		txs[1] = 4106238113
		txs[2] = "wzife.wd2"
	elseif tx == "状态_碎星诀" then
		txs[1] = 814399755
		txs[2] = "common/lbc.wdf"
	elseif tx == "心疗术" then
		txs[1] = 4227373440
		txs[2] = "magic.wdf"
   elseif tx == "天魔解体" then
		txs[1] = 0xD20E78BF
		txs[2] = "magic.wdf"

	elseif tx == "状态_日月乾坤" then
		txs[1] = 826002553
		txs[2] = "waddon.wdf"

     elseif tx == "魔王回首" then
		txs[1] = 0x16B27FFC
		txs[2] = "magic.wdf"

	elseif tx == "状态_魔王回首" then
		txs[1] = 0xBBEA83F4
		txs[2] = "waddon.wdf"


    elseif tx == "极度疯狂" then
		txs[1] = 0x16B27FFC
		txs[2] = "magic.wdf"

	elseif tx == "状态_极度疯狂" then
		txs[1] = 0xBBEA83F4
		txs[2] = "waddon.wdf"
	elseif tx == "状态_盘丝阵" then
		txs[1] = 0x369C6A29
		txs[2] = "waddon.wdf"
	elseif tx == "落叶萧萧" or tx == "风卷残云" then
		txs[1] = 3177673254
		txs[2] = "common/sml.wdf"
	elseif tx == "状态_象形" then
		txs[1] = 2213550572
		txs[2] = "waddon.wdf"
	-- elseif tx == "水漫金山" then
	-- 	txs[1] = 0x90E8589F
	-- 	txs[2] = "magic.wdf"
	elseif tx == "水漫金山" then
		txs[1] = 0x90E8589E
		txs[2] = "magic.wdf"
	elseif tx == "水漫金山2" then
		txs[1] = 0x97311BAD
		txs[2] = "magic.wdf"
	elseif tx == "天雷斩" then
		txs[1] = 3054771897
		txs[2] = "addon.wdf"
	elseif tx == "状态_紧箍咒" then
		txs[1] = 4024909497
		txs[2] = "waddon.wdf"
	elseif tx == "命疗术" then
		txs[1] = 4088602190
		txs[2] = "magic.wdf"
	elseif tx == "状态_失心符" then
		txs[1] = 3635978625
		txs[2] = "waddon.wdf"
	elseif tx == "定身符" then
		txs[1] = 3729668740
		txs[2] = "magic.wdf"
	elseif tx == "摧心术" then
		txs[1] = 2702496872
		txs[2] = "common/wdd.wdf"
	elseif tx == "碎甲术" or tx == "破甲术" then
		txs[1] = 3505309973
		txs[2] = "magic.wdf"
	elseif tx == "夺命咒" then
		txs[1] = 2699497351
		txs[2] = "common/wdd.wdf"
	elseif tx == "状态_一苇渡江" then
		txs[1] = 382287583
		txs[2] = "waddon.wdf"
	elseif tx == "一苇渡江" then
		txs[1] = 4082420920
		txs[2] = "magic.wdf"
	elseif tx == "凝气诀" then
		txs[1] = 843116756
		txs[2] = "magic.wdf"
	elseif tx == "状态_乘风破浪" then
		txs[1] = 3366209335
		txs[2] = "waddon.wdf"
	elseif tx == "状态_逆鳞" then
		txs[1] = 4066099146
		txs[2] = "waddon.wdf"
	elseif tx == "状态_冰封" then
		txs[1] = 324036383
		txs[2] = "waddon.wdf"
	elseif tx == "如花解语" then
		txs[1] = 2319038367
		txs[2] = "magic.wdf"
	elseif tx == "状态_杀气诀" then

		txs[1] = 0x62EDD1CB
		txs[2] = "waddon.wdf"


    elseif tx == "幽冥鬼眼" then
		txs[1] = 0x07DF52CA
		txs[2] = "magic.wdf"
	elseif tx == "状态_幽冥鬼眼" then

		txs[1] = 0x21435203
		txs[2] = "waddon.wdf"

	elseif tx == "保护" then
		txs[1] = 4027829983
		txs[2] = "addon.wdf"
	elseif tx == "复苏" then
		txs[1] = 3698682735
		txs[2] = "magic.wdf"
   elseif tx == "镇妖" then
		txs[1] = 0x1EB0026B
	 	txs[2] = "magic.wdf"
  elseif tx == "状态_镇妖" then
		txs[1] = 0x98753F94
		txs[2] = "waddon.wdf"

	elseif tx == "状态_催眠符" then
		txs[1] = 3398426285
		txs[2] = "waddon.wdf"
	elseif tx == "状态_横扫千军" or tx == "状态_连环击" then
		txs[1] = 3645258252
		txs[2] = "waddon.wdf"
	elseif tx == "还阳术" then
		txs[1] = 1538345049
		txs[2] = "magic.wdf"
	elseif tx == "状态_毒" then
		txs[1] = 3687768876
		txs[2] = "waddon.wdf"
	elseif tx == "月光" then
		txs[1] = 685510219
		txs[2] = "common/ski.wdf"
	elseif tx == "含情脉脉" then
		txs[1] = 1399041837
		txs[2] = "magic.wdf"
	elseif tx == "状态_错乱" then
		txs[1] = 2557820820
		txs[2] = "waddon.wdf"
	elseif tx == "纵地金光" then
		txs[1] = 3546433571
		txs[2] = "common/lbc.wdf"
	elseif tx == "血雨" then
		txs[1] = 1886752675
		txs[2] = "common/sml.wdf"
	elseif tx == "普渡众生" then
		txs[1] = 804734328
		txs[2] = "magic.wdf"
	elseif tx == "状态_颠倒五行" then
		txs[1] = 923673984
		txs[2] = "magic.wdf"
	elseif tx == "催眠符" then
		txs[1] = 2663408206
		txs[2] = "magic.wdf"
	elseif tx == "冰川怒" then
		txs[1] = 1425547471
		txs[2] = "common/sml.wdf"
	elseif tx == "状态_落魄符" then
		txs[1] = 3635978625
		txs[2] = "waddon.wdf"
	elseif tx == "气疗术" then
		txs[1] = 4088602190
		txs[2] = "magic.wdf"
	elseif tx == "起死回生" then
		txs[1] = 2391977602
		txs[2] = "magic.wdf"
	elseif tx == "力劈华山" then
		txs[1] = 4281577710
		txs[2] = "magic.wdf"
	elseif tx == "叶隐" then
		txs[1] = 1859374553
		txs[2] = "common/sml.wdf"
	elseif tx == "失心符" then
		txs[1] = 152755655
		txs[2] = "magic.wdf"
	elseif tx == "腾云驾雾" then
		txs[1] = 871130409
		txs[2] = "magic.wdf"
	elseif tx == "不动如山" then
		txs[1] = 4106497964
		txs[2] = "common/lbc.wdf"
	elseif tx == "乙木仙遁" or tx == "分身术" then
		txs[1] = 1829610500
		txs[2] = "magic.wdf"
	elseif tx == "状态_分身术" then
		txs[1] = 1829610500
		txs[2] = "magic.wdf"
	elseif tx == "解毒" then
		txs[1] = 3727996990
		txs[2] = "magic.wdf"
	-- elseif tx == "奔雷咒" then
	-- 	txs[1] = 0xF54C4025
	-- 	txs[2] = "magic.wdf"
	elseif tx == "奔雷咒" then
		txs[1] = 0xF54C4026
		txs[2] = "magic.wdf"
	elseif tx == "明光宝烛" then
		txs[1] = 1479134995
		txs[2] = "common/wdd.wdf"
	elseif tx == "状态_移魂化骨" then
		txs[1] = 759125516
		txs[2] = "common/wdd.wdf"
	elseif tx == "唧唧歪歪" then
		txs[1] = 3240896099
		txs[2] = "magic.wdf"
	elseif tx == "连环击" then
		txs[1] = 1441516140
		txs[2] = "addon.wdf"
	elseif tx == "被击中" then
		txs[1] = 490729788
		txs[2] = "addon.wdf"
	elseif tx == "翻江搅海" then
		txs[1] = 3385103645
		txs[2] = "common/lbc.wdf"
	elseif tx == "落雷符" then
		txs[1] = 4292234442
		txs[2] = "magic.wdf"
	elseif tx == "日光华" then
		txs[1] = 1170905363
		txs[2] = "magic.wdf"
	elseif tx == "地裂火" then
		txs[1] = 417414121
		txs[2] = "magic.wdf"
	elseif tx == "解封" then
		txs[1] = 1833750106
		txs[2] = "magic.wdf"

   elseif tx == "魔音摄魂" then
		txs[1] = 0x16B27FFC
		txs[2] = "magic.wdf"

    elseif tx == "状态_魔音摄魂" then
		txs[1] = 0xD9463A0C
		txs[2] = "waddon.wdf"
	elseif tx == "反震" then
		txs[1] = 3690777786
		txs[2] = "addon.wdf"
	elseif tx == "蜜润" then
		txs[1] = 2806422927
		txs[2] = "magic.wdf"
	elseif tx == "状态_蜜润" then
		txs[1] = 0x620A5633
		txs[2] = "common/wdd.wdf"
	elseif tx == "三花聚顶" then
		txs[1] = 2002768611
		txs[2] = "magic.wdf"
	elseif tx == "暴击" then
		txs[1] = 3973111811
		txs[2] = "magic.wdf"
	elseif tx == "法暴" then
		txs[1] = 0x1CB035D2
		txs[2] = "magic.wdf"
    elseif tx == "壁垒击破" then
		txs[1] = 3973111811
		txs[2] = "magic.wdf"
     elseif tx == "善恶有报" then
		txs[1] = 0xDBFCCCBA
		txs[2] = "addon.wdf"

	elseif tx == "状态_天神护法" then
		txs[1] = 3562887539
		txs[2] = "waddon.wdf"
	elseif tx == "荆棘舞" then
		txs[1] = 636234317
		txs[2] = "common/sml.wdf"
	elseif tx == "三昧真火" then
		txs[1] = 0xFCDCCCEC
		txs[2] = "magic.wdf"
	elseif tx == "我佛慈悲" then
		txs[1] = 540772211
		txs[2] = "magic.wdf"
	elseif tx == "紧箍咒" then
		txs[1] = 1417725769
		txs[2] = "magic.wdf"
	elseif tx == "杨柳甘露" then
		txs[1] = 939734977
		txs[2] = "magic.wdf"
	elseif tx == "莲步轻舞" then
		txs[1] = 2556614190
		txs[2] = "magic.wdf"
	elseif tx == "靛沧海" then
		txs[1] = 1818198902
		txs[2] = "magic.wdf"
	elseif tx == "五雷咒" then
		txs[1] = 947658475
		txs[2] = "magic.wdf"
	elseif tx == "龙卷雨击2" then
		txs[1] = 0xA19EAB31
		txs[2] = "magic.wdf"
	elseif tx == "龙卷雨击" then
		txs[1] = 0xA19EAB31
		txs[2] = "magic.wdf"

   elseif tx == "龙吟1" then
	 txs[1] = 0xA5199709
	 txs[2] = "magic.wdf"
   elseif tx == "龙吟2" then
	 txs[1] = 0x5EC2D5BB
	 txs[2] = "magic.wdf"
    elseif tx == "龙吟3" then
	 txs[1] = 0x3D74BE12
	 txs[2] = "magic.wdf"
    elseif tx == "龙吟4" then
	 txs[1] = 0x63605C8D
	 txs[2] = "magic.wdf"
    elseif tx == "龙吟5" then
	 txs[1] = 0x9FE48849
	 txs[2] = "magic.wdf"


	elseif tx == "摄魄" then
		txs[1] = 1505585649
		txs[2] = "magic.wdf"
	elseif tx == "生命之泉" then
		txs[1] = 3537672915
		txs[2] = "magic.wdf"
	elseif tx == "颠倒五行" then
		txs[1] = 923673984
		txs[2] = "magic.wdf"
	elseif tx == "乘风破浪" then
		txs[1] = 1172493695
		txs[2] = "magic.wdf"
	elseif tx == "捕捉成功" then
		txs[1] = 2601915514
		txs[2] = "addon.wdf"
	elseif tx == "清心" then
		txs[1] = 822452251
		txs[2] = "magic.wdf"
	elseif tx == "状态_天神护体" then
		txs[1] = 1724676649
		txs[2] = "waddon.wdf"
	elseif tx == "勾魂" then
		txs[1] = 457649967
		txs[2] = "magic.wdf"
	elseif tx == "振翅千里" then
		txs[1] = 2661053669
		txs[2] = "magic.wdf"
	elseif tx == "逆鳞" then
		txs[1] = 81488906
		txs[2] = "magic.wdf"
    elseif tx == "安神诀" then
		txs[1] = 0xE61DB8B4
		txs[2] = "waddon.wdf"
    elseif tx == "状态_安神诀" then
		txs[1] = 0xE61DB8B4
		txs[2] = "waddon.wdf"
	elseif tx == "象形" or tx == "BOSS绝杀" then
		txs[1] = 3188881443
		txs[2] = "magic.wdf"
	elseif tx == "惊涛怒" then
		txs[1] = 3197608773
		txs[2] = "common/lbc.wdf"
	elseif tx == "反间之计" then
		txs[1] = 1804814488
		txs[2] = "magic.wdf"
	elseif tx == "星月之惠" or tx == "炽火流离" then
		txs[1] = 3298164407
		txs[2] = "common/sml.wdf"
	elseif tx == "斗转星移" then
		txs[1] = 1056770863
		txs[2] = "magic.wdf"
	elseif tx == "状态_含情脉脉" then
		txs[1] = 2164502482
		txs[2] = "waddon.wdf"
	elseif tx == "雾杀" then
		txs[1] = 1264783402
		txs[2] = "common/sml.wdf"
	elseif tx == "夺魄令" then
		txs[1] = 2668097987
		txs[2] = "common/wdd.wdf"
	elseif tx == "上古灵符" then
		txs[1] = 48901659
		txs[2] = "magic.wdf"
	elseif tx == "升级" then
		txs[1] = 2604332261
		txs[2] = "addon.wdf"
	elseif tx == "放下屠刀" or tx == "河东狮吼" or tx =="笑里藏刀" then
		txs[1] = 0x81B4599F
		txs[2] = "magic.wdf"
	elseif tx == "夜舞倾城" then
		txs[1] = 0xF18C76DD
		txs[2] = "magic.wdf"
	elseif tx == "打狗棒" then
		txs[1] = 0x1EE9406C
		txs[2] = "magic.wdf"
   	elseif tx == "驱魔" or tx == "驱尸" then
		txs[1] = 0x726AC447
		txs[2] = "magic.wdf"
   elseif tx == "寡欲令" then
		txs[1] = 0xFDE4BF24
		txs[2] = "magic.wdf"
     elseif tx == "破碎无双" then
		txs[1] = 0x21FAE73F
		txs[2] = "magic.wdf"
    elseif tx == "状态_寡欲令" or tx=="状态_驱魔" then
		txs[1] = 0xE89A19DF
		txs[2] = "waddon.wdf"
	elseif tx == "金刚护法" or tx == "诸天看护" then
		txs[1] = 0x04DB6C0A
		txs[2] = "magic.wdf"
	elseif tx == "状态_金刚护法" then
		txs[1] = 0x16B27FFC
		txs[2] = "magic.wdf"
	elseif tx == "归元咒"  then
		txs[1] = 0x517656E2
		txs[2] = "magic.wdf"
  elseif tx == "乾天罡气" then
		txs[1] = 0x144AF3F8
		txs[2] = "magic.wdf"
   elseif tx == "宁心" then
		txs[1] = 0xA72FDB18
		txs[2] = "magic.wdf"
   elseif tx == "状态_宁心" then
		txs[1] = 0x7DCEE534
		txs[2] = "waddon.wdf"
	elseif tx == "牛劲" or tx == "状态_牛劲" then
		txs[1] = 0x26F090BE
		txs[2] = "magic.wdf"
	elseif tx == "失魂符" then
		txs[1] = 0x7BCD8BC0
		txs[2] = "magic.wdf"
	elseif tx == "碎甲符"or tx == "飞符炼魂"  then
		txs[1] = 0xC27C1229
		txs[2] = "magic.wdf"
	elseif tx == "状态_失魂符" then
		txs[1] = 0x8B43833D
		txs[2] = "waddon.wdf"
	elseif tx == "状态_失心符" then
		txs[1] = 0x8B43833D
		txs[2] = "waddon.wdf"
	elseif tx == "状态_碎甲符" then
		txs[1] = 0xEB3D0AC1
		txs[2] = "waddon.wdf"
	elseif tx == "飞花摘叶" then
		txs[1] = 0x78BF64A4
		txs[2] = "magic.wdf"
	elseif tx == "百毒不侵" then
		txs[1] = 0xD69CAE82
		txs[2] = "magic.wdf"
	elseif tx == "一笑倾城" then
		txs[1] = 0x430A96A6
		txs[2] = "magic.wdf"
	elseif tx == "状态_百毒不侵" then
		txs[1] = 0x860E67C9
		txs[2] = "waddon.wdf"
	elseif tx == "状态_一笑倾城" then
		txs[1] = 0x760B7BD7
		txs[2] = "waddon.wdf"
	elseif tx == "状态_血雨" then
		txs[1] = 0x497E890D
		txs[2] = "waddon.wdf"
	elseif tx == "状态_护法紫丝" then
		txs[1] = 0x042B06AC
		txs[2] = "waddon.wdf"
	elseif tx == "状态_佛法无边" then
		txs[1] = 0xEA4D704A
		txs[2] = "waddon.wdf"
	elseif tx == "佛法无边" then
		txs[1] = 0xC8011EF1
		txs[2] = "magic.wdf"
	elseif tx == "舍身取义" or tx == "妙悟"  then
		txs[1] = 0xF0CE9045
		txs[2] = "magic.wdf"
	elseif tx == "状态_普渡众生"  then
		txs[1] = 0xD8857128
		txs[2] = "waddon.wdf"
	elseif tx == "灵动九天"  then
		txs[1] = 0x6ECA8405
		txs[2] = "waddon.wdf"
	elseif tx == "状态_灵动九天"  then
		txs[1] = 0x95FF4460
		txs[2] = "waddon.wdf"
	elseif tx == "火甲术"  then
		txs[1] = 0x4B621DF7
		txs[2] = "magic.wdf"
	elseif tx == "状态_火甲术"  then
		txs[1] = 0x82D17DF8
		txs[2] = "waddon.wdf"
	elseif tx == "状态_鹰击" or tx == "状态_象形" then
		txs[1] = 0x58628406
		txs[2] = "waddon.wdf"
	elseif tx == "当头一棒" then      ------------------花果山
		txs[1] = 0x3426ACE0
		txs[2] = "magic.wd1"
	elseif tx == "神针撼海" then
		txs[1] = 221458018
		txs[2] = "magic.wd1"
	elseif tx == "泼天乱棒" then
		txs[1] = 0x352F1BBD
		txs[2] = "magic.wd1"
	elseif tx == "杀威铁棒" then
		txs[1] = 221458018
		txs[2] = "magic.wd1"
	elseif tx == "移星换斗" then
		txs[1] = 0x1EDD5D74
		txs[2] = "magic.wd1"
	elseif tx == "云暗天昏" then
		txs[1] = 0x2067A573
		txs[2] = "magic.wd1"
	elseif tx == "无所遁形" then
		txs[1] = 0xBED8962A
		txs[2] = "magic.wd1"
	elseif tx == "状态_无所遁形" then
		txs[1] = 0xBED8962A
		txs[2] = "magic.wd1"
	elseif tx == "威震凌霄" then
		txs[1] = 0x6E888EA0
		txs[2] = "magic.wd1"
	elseif tx == "铜头铁臂" then
		txs[1] = 0x5C5C1544
		txs[2] = "waddon.wdf"
	elseif tx == "状态_铜头铁臂" then
		txs[1] = 0x26ADD570
		txs[2] = "waddon.wdf"
	elseif tx == "呼子唤孙" then
		txs[1] = 0x109B780F
		txs[2] = "magic.wd1"
	elseif tx == "状态_呼子唤孙" then
		txs[1] = 0x0D332E62
		txs[2] = "magic.wd1"
	elseif tx == "气慑天军" then
		txs[1] = 0x109B780F
		txs[2] = "magic.wd1"
	elseif tx == "状态_气慑天军" then
		txs[1] = 0xFC309480
		txs[2] = "magic.wd1"
	elseif tx == "炽火流离" then     ---------------女魃墓
		txs[1] = 0x3B86B284
		txs[2] = "magic.wd1"
	elseif tx == "誓血之祭" then
		txs[1] = 0x6BA62F2C
		txs[2] = "magic.wd1"
	elseif tx == "焚魔烈焰" then
		txs[1] = 0x51ECA52D
		txs[2] = "magic.wd1"
	elseif tx == "状态_焚魔烈焰" then
		txs[1] = 0x51ECA52D
		txs[2] = "magic.wd1"
	elseif tx == "谜毒之缚" then
		txs[1] = 0x693F825E
		txs[2] = "magic.wdf"
	elseif tx == "状态_谜毒之缚" then
		txs[1] = 0xFC309480
		txs[2] = "magic.wd1"
	elseif tx == "诡蝠之刑" then
		txs[1] = 0x4E02EC44
		txs[2] = "magic.wdf"
	elseif tx == "状态_鬼蝠之刑" then
		txs[1] = 0x4E02EC44
		txs[2] = "magic.wdf"
	elseif tx == "恐怖之泣" then
		txs[1] = 0x2A4DE824
		txs[2] = "magic.wdf"
	elseif tx == "状态_恐怖之泣" then
		txs[1] = 0x2A4DE824
		txs[2] = "magic.wdf"
	elseif tx == "针锋相对" then   ---------------天机城
		txs[1] = 0x56E05B32
		txs[2] = "waddon.wdf"
	elseif tx == "状态_针锋相对" then
		txs[1] = 0x56E05B32
		txs[2] = "waddon.wdf"
	elseif tx == "锋芒毕露" then
		txs[1] = 0x1597C433
		txs[2] = "magic.wd1"
	elseif tx == "状态_锋芒毕露" then
		txs[1] = 0x56E05B32
		txs[2] = "waddon.wdf"
	elseif tx == "诱袭" then
		txs[1] = 0x2A4C3F98
		txs[2] = "magic.wd1"
	elseif tx == "状态_诱袭" then
		txs[1] = 0x2A4C3F98
		txs[2] = "magic.wd1"
	elseif tx == "匠心·破击" then
		txs[1] = 0x4E86F9B3
		txs[2] = "magic.wd1"
	elseif tx == "匠心·固甲" then
		txs[1] = 0xF9C3EE74
		txs[2] = "magic.wd1"
	elseif tx == "状态_匠心·固甲" then
		txs[1] = 0xF9C3EE74
		txs[2] = "magic.wd1"
	elseif tx == "匠心·蓄锐" then
		txs[1] = 0x51ECA52D
		txs[2] = "magic.wd1"
	elseif tx == "状态_匠心·蓄锐" then
		txs[1] = 0x51ECA52D
		txs[2] = "magic.wd1"
	elseif tx == "匠心·削铁" then
		txs[1] = 0x60EB2F76
		txs[2] = "magic.wd1"
	elseif tx == "状态_匠心·削铁" then
		txs[1] = 0x51ECA52D
		txs[2] = "magic.wd1"
--########################################################?自己修改?##########################################
	elseif tx == "善恶有报"  then
		txs[1] = 0x8D8A818D
		txs[2] = "magic.wdf"
	elseif tx == "战斗暴击"  then
		txs[1] = 0xECD0E003
		txs[2] = "addon.wdf"
	elseif tx == "战斗头标"  then
		txs[1] = 0x97C79EDB
		txs[2] = "addon.wdf"
	elseif tx == "剑荡四方"  then
		txs[1] = "0x729ADE62"--0xE3D6B98D
		txs[2] ="" --"common/general.wdf"
	elseif tx == "打雷加电"  then
		txs[1] = 0x51EEBFF3
		txs[2] ="magic.wdf"
	elseif tx == "特赦令牌"  then
		txs[1] = 0x7A55F632
		txs[2] ="magic.wdf"
	elseif tx == "闪亮登场" then
		txs[1] = 0x6DFE584A
		txs[2] = "wzife.wd2"
	elseif tx == "挑战失败" then
		txs[1] = 0x36F99CC8
		txs[2] = "wzife.wd2"
	end
	return txs
end

function 引擎.取光环(tx)
	local n={}
	if tx == "烈焰澜翻" then
	   	n[1]=0x52A385FE
	   	n[2]=0x60FB8930
	   	n[3]=0x1CDB4C3F
	   	n[4]="jy.wdf"
	elseif tx == "水墨游龙" then
	   	n[1]=0x0DF5F610
	   	n[2]=0x8109B081
	   	n[3]=0xFFCF398C
	   	n[4]="jy.wdf"
	elseif tx == "星光熠熠" then
	   	n[1]=0xCA82DD54
	   	n[2]=0xFCC5CE3A
	   	n[3]=0xCA82DD54
	    n[4]="jy.wdf"
	elseif tx == "双鲤寄情" then
	   	n[1]=0xC056D8DD
	   	n[2]=0x865FF084
	   	n[3]=0x654EAD9E
	    n[4]="jy.wdf"
	elseif tx == "凌波微步" then
	   	n[1]=0x6F1A7860
	   	n[2]=0x242264D2
	   	n[3]=0xE1D6A08F
	    n[4]="jy.wdf"
	elseif tx == "浩瀚星河" then
	   	n[1]=0x200B20C2
	  	n[2]=0x1E064D72
	   	n[3]=0x04A28CA1
	    n[4]="jy.wdf"
	elseif tx == "荷塘涟漪" then
	   	n[1]=0x085A1CE8
	   	n[2]=0x4F049527
	   	n[3]=0x268ED6D4
	    n[4]="jy.wdf"
	elseif tx == "雪花飘落" then
	   	n[1]=0x12907C0F
	   	n[2]=0xDE953084
	   	n[3]=0xDE953084
	    n[4]="jy.wdf"
	elseif tx == "花的海洋" then
	   	n[1]=0xCA3B3A8F
	   	n[2]=0xBACF8614
	   	n[3]=0xCA3B3A8F
	    n[4]="jy.wdf"
	elseif tx == "爱的光影" then
	   	n[1]=0xF0CBB55B
	   	n[2]=0xF0CBB55B
	   	n[3]=0xF0CBB55B
	    n[4]="jy.wdf"
	elseif tx == "祥云瑞气" then
	   	n[1]=0xD5E2F0A8
	   	n[2]=0x84BE68C9
	   	n[3]=0x50907DFA
	    n[4]="jy.wdf"
	elseif tx == "珠落玉盘" then
	   	n[1]=0xAAC2A157
	   	n[2]=0xAAC2A157
	   	n[3]=0xAAC2A157
	    n[4]="jy.wdf"
	elseif tx == "红叶随风" then
	   	n[1]=0x00000017
	   	n[2]=0x00000017
	   	n[3]=0x00000017
	    n[4]="jy.wdf"
	elseif tx == "月影婆娑" then
	   	n[1]=0x00000018
	   	n[2]=0x00000018
	   	n[3]=0x00000018
	    n[4]="jy.wdf"
	elseif tx == "白色精灵" then
		n[1]=0x01000089
		n[2]=0x01000089
		n[3]=0x01000089
	    n[4]="wzife.wd5"
	elseif tx == "黑色精灵" then
		n[1]=0x01000092
		n[2]=0x01000092
		n[3]=0x01000092
	    n[4]="wzife.wd5"
	elseif tx == "蓝色精灵" then
		n[1]=0x01000095
		n[2]=0x01000095
		n[3]=0x01000095
	    n[4]="wzife.wd5"
	elseif tx == "海豚精灵" then
		n[1]=0x01000098
		n[2]=0x01000098
		n[3]=0x01000098
	    n[4]="wzife.wd5"
	end
	return n
end

function 引擎.取足迹(tx)
	local n={}
	if tx == "龙卷风足迹" then
	   n[1]=0x00000019
	   n[4]="jy.wdf"
    elseif tx == "皮球足迹" then
	   n[1]=0x9C146BBA
	   n[4]="jy.wdf"
	elseif tx == "雀屏足迹" then
	   n[1]=0xFFED8401
	   n[4]="jy.wdf"
	elseif tx == "旋律足迹" then
	   n[1]=0xD8D8AFFF
	   n[4]="jy.wdf"
	elseif tx == "枫叶足迹" then
	   n[1]=0xF879A813
	   n[4]="jy.wdf"
	elseif tx == "飞天足迹" then
	   n[1]=0xE7B37A0B
	   n[4]="jy.wdf"
	elseif tx == "两心相悦足迹" then
	   n[1]=0x7D75476A
	   n[4]="jy.wdf"
	elseif tx == "心花怒放" then
	   n[1]=0xD5933DC2
	   n[4]="jy.wdf"
	elseif tx == "雷电足迹" then
	   n[1]=0xC3060301
	   n[4]="jy.wdf"
	elseif tx == "寒冰足迹" then
	   n[1]=0xD588789A
	   n[4]="jy.wdf"
	elseif tx == "星星祈愿" then
	   n[1]=0xFCA197EB
	   n[4]="jy.wdf"
	elseif tx == "地狱焰火" then
	   n[1]=0x7D931979
	   n[4]="jy.wdf"
	elseif tx == "元宝足迹" then
	   n[1]=0x8E5FA0FF
	   n[4]="jy.wdf"
	elseif tx == "光剑足迹" then
	   n[1]=0x988D7A27
	   n[4]="jy.wdf"
	elseif tx == "雪花足迹" then
	   n[1]=0xF7071DAB
	   n[4]="jy.wdf"
	end
	return n
end