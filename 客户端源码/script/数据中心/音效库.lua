--======================================================================--
-- @作者: GGE研究群: 342119466
-- @创建时间:   2018-03-03 02:34:19
-- @Last Modified time: 2020-06-08 14:54:10
--======================================================================--
function 引擎.取音效(yx)
	local yxs = {}
	if yx == "骨精灵_爪刺" then
		yxs = {死亡=1015578079,挨打=2448026491,施法=1045546970,攻击=3681921992,防御=3681921992,资源="sound.wdf"}
	elseif yx == "白熊" then
		yxs = {死亡=2141423483,挨打=1753531635,施法=1950310209,攻击=3715878608,防御=2234245875,资源="sound.wdf"}
	elseif yx == "羽灵神_法杖" then
		yxs = {死亡=2458706401,挨打=3407056961,施法=3004979591,攻击=195856226,防御=3407056961,资源="sound.wdf"}
	elseif yx == "飞符炼魂" then
		yxs = {资源="sound.wdf",文件=2585405572}
	elseif yx == "雨师" then
		yxs = {死亡=3573873885,挨打=1459468329,施法=7452289,攻击=3708916370,防御=1748656363,资源="sound.wdf"}
	elseif yx == "舞天姬" then
		yxs = {死亡=204903607,挨打=1288367693,施法=3093677842,攻击=804680942,防御=4164331995,资源="sound.wdf"}
	elseif yx == "镜妖" then
		yxs = {死亡=3144522577,挨打=3712770835,施法=1503709144,攻击=4081372887,防御=2880121122,资源="sound.wdf"}
	elseif yx == "骷髅怪" then
		yxs = {死亡=3560494956,挨打=1245546270,施法=523531882,攻击=818944834,防御=784784891,资源="sound.wdf"}
	elseif yx == "龙太子_扇" then
		yxs = {死亡=2458706401,挨打=3407056961,施法=3004979591,攻击=545171,防御=3702918125,资源="sound.wdf"}
	elseif yx == "水攻" then
		yxs = {资源="sound.wdf",文件=7452289}
	elseif yx == "龙腾" then
		yxs = {资源="sound.wdf",文件=1426439228}
	elseif yx == "普渡众生" then
		yxs = {资源="sound.wdf",文件=626046160}
	elseif yx == "唧唧歪歪" then
		yxs = {资源="sound.wdf",文件=3686303330}
	elseif yx == "金刚护法" or yx == "金刚护体" or yx == "诸天看护" then
		yxs = {资源="sound.wdf",文件=3231847826}
	elseif yx == "韦陀护法" then
		yxs = {资源="sound.wdf",文件=3208021037}
	elseif yx == "我佛慈悲" then
		yxs = {资源="sound.wdf",文件=2535996480}
	elseif yx == "推拿" or yx == "活血" or yx == "推气过宫" or yx == "舍身取义" or yx == "妙悟" then
		yxs = {资源="sound.wdf",文件=82059830}
	elseif yx == "长眉灵猴" then
		yxs = {死亡=487913509,挨打=3021936694,施法=2115031259,攻击=1929267837,防御=2880121122,资源="sound.wdf"}
	elseif yx == "修罗傀儡鬼" then
		yxs = {死亡=0,挨打=1873908350,施法=3341541225,攻击=3213730902,防御=2880121122,资源="sound.wd1"}
	elseif yx == "尸腐毒" then
		yxs = {资源="sound.wdf",文件=2562583651}
	elseif yx == "乾天罡气" then
		yxs = {资源="sound.wdf",文件=82059830}
	elseif yx == "树怪" then
		yxs = {死亡=1668550238,挨打=350566834,施法=3303750905,攻击=3618060822,防御=1459245093,资源="sound.wdf"}
	elseif yx == "归元咒" then
		yxs = {资源="sound.wdf",文件=82059830}
	elseif yx == "羊头怪" then
		yxs = {死亡=319998428,挨打=1178246524,施法=1177119848,攻击=2516357468,防御=2661218083,资源="sound.wdf"}
	elseif yx == "似玉生香" or yx == "碎玉弄影" then
		yxs = {资源="sound.wdf",文件=3184366984}
	elseif yx == "善恶有报" then
		yxs = {资源="sound.wdf",文件=561268351}
	elseif yx == "狐美人_爪刺" then
		yxs = {死亡=222809359,挨打=2410753087,施法=803377543,攻击=3129483601,防御=1482085804,资源="sound.wdf"}
	elseif yx == "上古灵符" then
		yxs = {资源="sound.wdf",文件=1448022160}
	elseif yx == "力劈华山" then
		yxs = {资源="sound.wdf",文件=587133534}
	elseif yx == "修罗傀儡妖" then
		yxs = {死亡=0,挨打=3960267172,施法=3341541225,攻击=236023717,防御=2880121122,资源="sound.wd1"}
	elseif yx == "帮派妖兽" then
		yxs = {死亡=0,挨打=1532537522,施法=76460801,攻击=76460801,防御=2880121122,资源="sound.wd1"}
	elseif yx == "落叶萧萧" or yx == "风卷残云" then
		yxs = {资源="sound.wdf",文件=1617017747}
	elseif yx == "野鬼" then
		yxs = {死亡=2007276527,挨打=621481322,施法=3750445058,攻击=1079371167,防御=1079371167,资源="sound.wdf"}
	elseif yx == "增长巡守" then
		yxs = {死亡=0,挨打=2194115600,施法=2456408467,攻击=705045340,防御=2880121122,资源="sound.wdf"}
	elseif yx == "百万神兵" then
		yxs = {资源="sound.wdf",文件=830899639}
	elseif yx == "曼珠沙华" then
		yxs = {死亡=0,挨打=2194115600,施法=2456408467,攻击=83721517,防御=2880121122,资源="sound.wd1"}
	elseif yx == "连弩车" then
		yxs = {死亡=3263486412,挨打=1315738080,施法=3045913148,攻击=2798251516,防御=2880121122,资源="sound.wdf"}
	elseif yx == "杀破狼" then
		yxs = {死亡=2458706401,挨打=3407056961,施法=3004979591,攻击=195856226,防御=3407056961,资源="sound.wdf"}
	elseif yx == "蜃气妖" then
		yxs = {死亡=0,挨打=2194115600,施法=1437469676,攻击=3959208329,防御=2880121122,资源="sound.wd1"}
	elseif yx == "空度禅师" then
		yxs = {死亡=487913509,挨打=3021936694,施法=2115031259,攻击=1929267837,防御=2880121122,资源="sound.wdf"}
	elseif yx == "羽灵神_弓弩" then
		yxs = {死亡=2458706401,挨打=3407056961,施法=3004979591,攻击=195856226,防御=3407056961,资源="sound.wdf"}
	elseif yx == "超级神虎" then
		yxs = {死亡=652298838,挨打=1050657571,施法=1219687599,攻击=2043984545,防御=1710948577,资源="sound.wdf"}
	elseif yx == "水遁" then
		yxs = {资源="sound.wdf",文件=1688924528}
	elseif yx == "泰山压顶" then
		yxs = {资源="sound.wdf",文件=587133534}
	elseif yx == "牛屎遁" then
		yxs = {资源="sound.wdf",文件=350575346}
	elseif yx == "牛头" then
		yxs = {死亡=3373303673,挨打=2032596974,施法=2925753758,攻击=3349447201,防御=3150225918,资源="sound.wdf"}
	elseif yx == "护卫" then
		yxs = {死亡=511113157,挨打=1557199780,施法=2732679302,攻击=2334207220,防御=1754055816,资源="sound.wdf"}
	elseif yx == "错乱" then
		yxs = {资源="sound.wdf",文件=1459874646}
	elseif yx == "紧箍咒" then
		yxs = {资源="sound.wdf",文件=3490664861}
	elseif yx == "超级神牛" then
		yxs = {死亡=0,挨打=925054982,施法=2456408467,攻击=810033887,防御=2880121122,资源="sound.wdf"}
	elseif yx == "虎头怪_斧钺" then
		yxs = {死亡=3781138438,挨打=2899330032,施法=4073038797,攻击=2215864757,防御=2899330032,资源="sound.wdf"}
	elseif yx == "金饶僧" then
		yxs = {死亡=389403591,挨打=2974405975,施法=2197612092,攻击=19687065,防御=4070699672,资源="sound.wdf"}
	elseif yx == "大力金刚" then
		yxs = {死亡=1251425422,挨打=1532537522,施法=3414094801,攻击=3162946826,防御=2880121122,资源="sound.wdf"}
	elseif yx == "地狱烈火" then
		yxs = {资源="sound.wdf",文件=780721396}
	elseif yx == "知了王" then
		yxs = {死亡=0,挨打=2194115600,施法=1437469676,攻击=78516386,防御=2880121122,资源="sound.wdf"}
	elseif yx == "五雷轰顶" then
		yxs = {资源="sound.wdf",文件=3679425336}
	elseif yx == "雷霆万钧" then
		yxs = {资源="sound.wdf",文件=67470579}
	elseif yx == "乙木仙遁" then
		yxs = {资源="sound.wdf",文件=2735331492}
	elseif yx == "苍茫树"then
		yxs = {资源="sound.wdf",文件=622227707}
	elseif yx == "普渡众生" then
		yxs = {资源="sound.wdf",文件=626046160}
	elseif yx == "腾云驾雾" then
		yxs = {资源="sound.wdf",文件=2704079219}
	elseif yx == "地裂火" then
		yxs = {资源="sound.wdf",文件=325503083}
	elseif yx == "摄魄" then
		yxs = {资源="sound.wdf",文件=3230935559}
	elseif yx == "逍遥生_剑" then
		yxs = {死亡=518982477,挨打=2648789847,施法=2013348912,攻击=1962554948,防御=2648789847,资源="sound.wdf"}
	elseif yx == "离魂符" then
		yxs = {资源="sound.wdf",文件=4139701329}
	elseif yx == "百足将军" then
		yxs = {死亡=996019855,挨打=1929768413,施法=266523058,攻击=2649300220,防御=2880121122,资源="sound.wdf"}
	elseif yx == "狐狸精" then
		yxs = {死亡=624071037,挨打=2255953070,施法=3538259135,攻击=3652014537,防御=447335069,资源="sound.wdf"}
	elseif yx == "小毛头" then
		yxs = {死亡=3912516332,挨打=1766484482,施法=1312716926,攻击=629949036,防御=2880121122,资源="sound.wdf"}
	elseif yx == "芙蓉仙子" then
		yxs = {死亡=3960602968,挨打=1710537164,施法=4210261291,攻击=818418342,防御=3853960820,资源="sound.wdf"}
	elseif yx == "巨岩破" then
		yxs = {资源="sound.wdf",文件=1387957901}
	elseif yx == "日光华" then
		yxs = {资源="sound.wdf",文件=3458571916}
	elseif yx == "杨柳甘露" then
		yxs = {资源="sound.wdf",文件=2763632926}
	elseif yx == "浣熊" then
		yxs = {死亡=0,挨打=2194115600,施法=2456408467,攻击=2194115600,防御=2880121122,资源="sound.wd1"}
	elseif yx == "风伯" then
		yxs = {死亡=51091117,挨打=1269429483,施法=3647964645,攻击=2393779394,防御=2215513543,资源="sound.wdf"}
	elseif yx == "兔子怪" then
		yxs = {死亡=3070774280,挨打=2547845711,施法=1981901691,攻击=2302249515,防御=12321819,资源="sound.wdf"}
	elseif yx == "天罗地网" then
		yxs = {资源="sound.wdf",文件=327454581}
	elseif yx == "强盗" then
		yxs = {死亡=3124902859,挨打=814292021,施法=3339097640,攻击=3943194138,防御=1179874618,资源="sound.wdf"}
	elseif yx == "巴蛇" then
		yxs = {死亡=3263486412,挨打=1315738080,施法=3045913148,攻击=352101457,防御=2880121122,资源="sound.wdf"}
	elseif yx == "机关鸟" then
		yxs = {死亡=3263486412,挨打=1315738080,施法=3045913148,攻击=3531190471,防御=2880121122,资源="sound.wdf"}
	elseif yx == "飞燕女_双短剑" then
		yxs = {死亡=1837222459,挨打=1558500900,施法=15065168,攻击=2366096944,防御=4042212276,资源="sound.wdf"}
	elseif yx == "三昧真火" then
		yxs = {资源="sound.wdf",文件=4104677014}
	elseif yx == "鹰击" then
		yxs = {资源="sound.wdf",文件=1634240280}
	elseif yx == "雾中仙" then
		yxs = {死亡=2382579566,挨打=2493182138,施法=1057608231,攻击=4226488868,防御=2880121122,资源="sound.wdf"}
	elseif yx == "机关人人形" then
		yxs = {死亡=3263486412,挨打=1315738080,施法=3045913148,攻击=78516386,防御=2880121122,资源="sound.wdf"}
	elseif yx == "逍遥生" then
		yxs = {死亡=518982477,挨打=2648789847,施法=2013348912,攻击=1962554948,防御=2648789847,资源="sound.wdf"}
	elseif yx == "龙龟" then
		yxs = {死亡=2212267125,挨打=2194115600,施法=3081630765,攻击=1910937308,防御=2880121122,资源="sound.wdf"}
	elseif yx == "靛沧海" then
		yxs = {资源="sound.wdf",文件=3914845508}
	elseif yx == "超级赤焰兽" then
		yxs = {死亡=3672377755,挨打=1509049151,施法=3775307605,攻击=3237925644,防御=2798717351,资源="sound.wdf"}
	elseif yx == "舞天姬_环圈" then
		yxs = {死亡=204903607,挨打=1288367693,施法=3093677842,攻击=1033777538,防御=4164331995,资源="sound.wdf"}
	elseif yx == "如意仙子" then
		yxs = {死亡=4021736912,挨打=2609187034,施法=364403254,攻击=2982724910,防御=4183002674,资源="sound.wdf"}
	elseif yx == "勾魂" then
		yxs = {资源="sound.wdf",文件=3230935559}
	elseif yx == "含情脉脉" then
		yxs = {资源="sound.wdf",文件=2136985642}
	elseif yx == "超级白泽" then
		yxs = {死亡=0,挨打=2194115600,施法=2456408467,攻击=2260404585,防御=2880121122,资源="sound.wdf"}
	elseif yx == "杳无音讯" then
		yxs = {资源="sound.wdf",文件=3139328488}
	elseif yx == "二龙戏珠" then
		yxs = {资源="sound.wdf",文件=1871130489}
	elseif yx == "盘丝阵" then
		yxs = {资源="sound.wdf",文件=2742979353}
	elseif yx == "红萼仙子" then
		yxs = {死亡=0,挨打=1923679999,施法=1543411045,攻击=190071159,防御=1923679999,资源="sound.wdf"}
	elseif yx == "还阳术" then
		yxs = {资源="sound.wdf",文件=2535996480}
	elseif yx == "判官令" then
		yxs = {资源="sound.wdf",文件=3064515352}
	elseif yx == "玄彩娥" then
		yxs = {死亡=1837222459,挨打=614405189,施法=1792267731,攻击=3304945064,防御=4228027665,资源="sound.wdf"}
	elseif yx == "千年蛇魅" then
		yxs = {死亡=0,挨打=1715665584,施法=3837633016,攻击=190071159,防御=2880121122,资源="sound.wdf"}
	elseif yx == "阎罗令" then
		yxs = {资源="sound.wdf",文件=312674496}
	elseif yx == "踏云兽" then
		yxs = {死亡=3569227376,挨打=594622824,施法=1427173121,攻击=1358395955,防御=2880121122,资源="sound.wdf"}
	elseif yx == "黑熊" then
		yxs = {死亡=490810214,挨打=2822661914,施法=3083387154,攻击=4259283484,防御=3603070735,资源="sound.wdf"}
	elseif yx == "狂豹兽形" then
		yxs = {死亡=0,挨打=3144614980,施法=3144614980,攻击=705045340,防御=2880121122,资源="sound.wdf"}
	elseif yx == "佛门普渡" then
		yxs = {资源="sound.wdf",文件=138504409}
	elseif yx == "灵鹤" then
		yxs = {死亡=3568179012,挨打=690082626,施法=1758652696,攻击=4094384674,防御=2880121122,资源="sound.wdf"}
	elseif yx == "千里神行" then
		yxs = {资源="sound.wdf",文件=81851589}
	elseif yx == "移形换影" then
		yxs = {资源="sound.wdf",文件=4263025612}
	elseif yx == "一笑倾城" then
		yxs = {资源="sound.wdf",文件=1375219069}
	elseif yx == "坐莲" then
		yxs = {资源="sound.wdf",文件=4021690868}
	elseif yx == "猫灵人形" then
		yxs = {死亡=0,挨打=64142213,施法=82170304,攻击=2641029083,防御=2559105037,资源="sound.wdf"}
	elseif yx == "神天兵_锤" then
		yxs = {死亡=656344040,挨打=779917427,施法=3019919639,攻击=2176360328,防御=98435676,资源="sound.wdf"}
	elseif yx == "剑侠客" then
		yxs = {死亡=1327318008,挨打=155161828,施法=320557781,攻击=3451673424,防御=155161828,资源="sound.wdf"}
	elseif yx == "净瓶女娲" then
		yxs = {死亡=1181749929,挨打=3439683191,施法=3341541225,攻击=3332257767,防御=2880121122,资源="sound.wdf"}
	elseif yx == "鲛人" then
		yxs = {死亡=0,挨打=3569051100,施法=3837633016,攻击=159830263,防御=2880121122,资源="sound.wd1"}
	elseif yx == "飞砂走石" then
		yxs = {资源="sound.wdf",文件=1427041343}
	elseif yx == "玄彩娥_魔棒" then
		yxs = {死亡=1837222459,挨打=614405189,施法=1792267731,攻击=3859229234,防御=4228027665,资源="sound.wdf"}
	elseif yx == "羽灵神" then
		yxs = {死亡=2458706401,挨打=3407056961,施法=3004979591,攻击=195856226,防御=3407056961,资源="sound.wdf"}
	elseif yx == "鬼潇潇_伞" then
		yxs = {死亡=1015578079,挨打=2448026491,施法=1045546970,攻击=2604636862,防御=3681921992,资源="sound.wdf"}
	elseif yx == "僵尸" then
		yxs = {死亡=389403591,挨打=2974405975,施法=2197612092,攻击=19687065,防御=4070699672,资源="sound.wdf"}
	elseif yx == "蝴蝶仙子" then
		yxs = {死亡=4016824274,挨打=3760228976,施法=1568204826,攻击=1275875469,防御=4112272317,资源="sound.wdf"}
	elseif yx == "满天花雨" then
		yxs = {资源="sound.wdf",文件=3382388992}
	elseif yx == "蟹将" then
		yxs = {死亡=2861076852,挨打=1315200530,施法=780788950,攻击=484676069,防御=1326035271,资源="sound.wdf"}
	elseif yx == "画魂" then
		yxs = {死亡=0,挨打=3439683191,施法=1057608231,攻击=2606196116,防御=2423858235,资源="sound.wdf"}
	elseif yx == "金身罗汉" then
		yxs = {死亡=0,挨打=4135167637,施法=3414094801,攻击=986965302,防御=986965302,资源="sound.wdf"}
	elseif yx == "狂豹人形" then
		yxs = {死亡=652298838,挨打=1050657571,施法=1219687599,攻击=2043984545,防御=1710948577,资源="sound.wdf"}
	elseif yx == "虎头怪" then
		yxs = {死亡=3781138438,挨打=2899330032,施法=4073038797,攻击=1252214659,防御=2899330032,资源="sound.wdf"}
	elseif yx == "老虎" then
		yxs = {死亡=652298838,挨打=1050657571,施法=1219687599,攻击=2043984545,防御=1710948577,资源="sound.wdf"}
	elseif yx == "律法女娲" then
		yxs = {死亡=4255712904,挨打=1873908350,施法=3341541225,攻击=1540887421,防御=2880121122,资源="sound.wdf"}
	elseif yx == "追魂符" then
		yxs = {资源="sound.wdf",文件=4139701329}
	elseif yx == "碎甲符" then
		yxs = {资源="sound.wdf",文件=2930500780}
	elseif yx == "虾兵" then
		yxs = {死亡=1261853798,挨打=1587602365,施法=3627563328,攻击=561385427,防御=1668221049,资源="sound.wdf"}
	elseif yx == "烈火" then
		yxs = {资源="sound.wdf",文件=1042954076}
	elseif yx == "飞燕女_环圈" then
		yxs = {死亡=1837222459,挨打=1558500900,施法=15065168,攻击=3660542162,防御=4042212276,资源="sound.wdf"}
	elseif yx == "杀破狼_宝珠" then
		yxs = {死亡=2458706401,挨打=3407056961,施法=3004979591,攻击=195856226,防御=3407056961,资源="sound.wdf"}
	elseif yx == "噬天虎" then
		yxs = {死亡=1387891793,挨打=3491671125,施法=26937970,攻击=132336716,防御=2880121122,资源="sound.wdf"}
	elseif yx == "羽灵神_弓弩1" then
		yxs = {死亡=2458706401,挨打=3407056961,施法=3004979591,攻击=195856226,防御=3407056961,资源="sound.wdf"}
	elseif yx == "进阶鬼将" then
		yxs = {死亡=1416021503,挨打=3628019536,施法=776657085,攻击=628825018,防御=2880121122,资源="sound.wdf"}
	elseif yx == "古代瑞兽" then
		yxs = {死亡=2869533871,挨打=3272663421,施法=640035134,攻击=2869533871,防御=2192138994,资源="sound.wdf"}
	elseif yx == "催眠符" then
		yxs = {资源="sound.wdf",文件=4139701329}
	elseif yx == "定身符" then
		yxs = {资源="sound.wdf",文件=4139701329}
	elseif yx == "骨精灵" then
		yxs = {死亡=1015578079,挨打=2448026491,施法=1045546970,攻击=499499799,防御=3681921992,资源="sound.wdf"}
	elseif yx == "落魄符" then
		yxs = {资源="sound.wdf",文件=4139701329}
	elseif yx == "超级青鸾" then
		yxs = {死亡=2372137339,挨打=3272663421,施法=640035134,攻击=2869533871,防御=2192138994,资源="sound.wd1"}
	elseif yx == "杀破狼_弓弩1" then
		yxs = {死亡=2458706401,挨打=3407056961,施法=3004979591,攻击=195856226,防御=3407056961,资源="sound.wdf"}
	elseif yx == "神天兵" then
		yxs = {死亡=656344040,挨打=779917427,施法=3019919639,攻击=659057244,防御=98435676,资源="sound.wdf"}
	elseif yx == "五雷咒" then
		yxs = {资源="sound.wdf",文件=3721556213}
	elseif yx == "龙吟" then
		yxs = {资源="sound.wdf",文件=2693627185}
	elseif yx == "夜舞倾城" then
		yxs = {资源="sound.wdf",文件=2517237236}
	elseif yx == "横扫千军" then
		yxs = {资源="sound.wdf",文件=819432687}
	elseif yx == "狮搏" then
		yxs = {资源="sound.wdf",文件=4083313644}
	elseif yx == "幽灵" then
		yxs = {死亡=2610842059,挨打=2139087151,施法=1270233730,攻击=1923445066,防御=2880121122,资源="sound.wdf"}
	elseif yx == "海毛虫" then
		yxs = {死亡=838273552,挨打=4035138027,施法=1553258660,攻击=1590450855,防御=3631720163,资源="sound.wdf"}
	elseif yx == "英女侠_鞭" then
		yxs = {死亡=2078703053,挨打=2976075470,施法=2603956615,攻击=2604636862,防御=4042212276,资源="sound.wdf"}
	elseif yx == "偃无师_巨剑" then
		yxs = {死亡=1327318008,挨打=155161828,施法=320557781,攻击=677653198,防御=155161828,资源="sound.wdf"}
	elseif yx == "天兵" then
		yxs = {死亡=367923792,挨打=2411204702,施法=2562583651,攻击=3865709012,防御=1912915351,资源="sound.wdf"}
	elseif yx == "飞燕女" then
		yxs = {死亡=1837222459,挨打=1558500900,施法=15065168,攻击=2366096944,防御=4042212276,资源="sound.wdf"}
	elseif yx == "桃夭夭_灯笼" then
		yxs = {死亡=1542568619,挨打=2410753087,施法=1792267731,攻击=3304945064,防御=4228027665,资源="sound.wdf"}
	elseif yx == "巫蛮儿_宝珠" then
		yxs = {死亡=1542568619,挨打=2410753087,施法=1792267731,攻击=3304945064,防御=4228027665,资源="sound.wdf"}
	elseif yx == "犀牛将军兽形" then
		yxs = {死亡=2999070547,挨打=4135167637,施法=3837633016,攻击=1776209400,防御=2880121122,资源="sound.wdf"}
	elseif yx == "水漫金山" then
		yxs = {资源="sound.wdf",文件=1326039389}
	elseif yx == "落岩" then
		yxs = {资源="sound.wdf",文件=1448022160}
	elseif yx == "灵灯侍者" then
		yxs = {死亡=389403591,挨打=2974405975,施法=2197612092,攻击=19687065,防御=4070699672,资源="sound.wdf"}
	elseif yx == "持国巡守" then
		yxs = {死亡=0,挨打=1532537522,施法=3414094801,攻击=3162946826,防御=2880121122,资源="sound.wdf"}
	elseif yx == "真陀护法" then
		yxs = {死亡=0,挨打=2194115600,施法=2456408467,攻击=705045340,防御=2880121122,资源="sound.wdf"}
	elseif yx == "黑熊精" then
		yxs = {死亡=1759306014,挨打=4245326009,施法=827568683,攻击=3989023880,防御=3173669447,资源="sound.wdf"}
	elseif yx == "毗舍童子" then
		yxs = {死亡=0,挨打=2194115600,施法=2456408467,攻击=705045340,防御=2880121122,资源="sound.wdf"}
	elseif yx == "天雷斩" then
		yxs = {资源="sound.wdf",文件=622227707}
	elseif yx == "龟丞相" then
		yxs = {死亡=388532813,挨打=2685029276,施法=4060523007,攻击=2646214528,防御=3496984894,资源="sound.wdf"}
	elseif yx == "龙太子_枪矛" then
		yxs = {死亡=2458706401,挨打=3407056961,施法=3004979591,攻击=195856226,防御=3702918125,资源="sound.wdf"}
	elseif yx == "大海龟" then
		yxs = {死亡=871240528,挨打=3131487772,施法=2707547291,攻击=2127205477,防御=3957482735,资源="sound.wdf"}
	elseif yx == "超级玉兔" then
		yxs = {死亡=0,挨打=2194115600,施法=2456408467,攻击=3705410330,防御=2880121122,资源="sound.wdf"}
	elseif yx == "失心符" then
		yxs = {资源="sound.wdf",文件=2585405572}
	elseif yx == "巫蛮儿_法杖" then
		yxs = {死亡=1542568619,挨打=2410753087,施法=1792267731,攻击=3304945064,防御=4228027665,资源="sound.wdf"}
	elseif yx == "牛妖" then
		yxs = {死亡=3212655002,挨打=925054982,施法=1954866876,攻击=2637302114,防御=48383547,资源="sound.wdf"}
	elseif yx == "章鱼" then
		yxs = {死亡=0,挨打=2194115600,施法=7452289,攻击=52752290,防御=52752290,资源="sound.wd1"}
	elseif yx == "哮天犬" then
		yxs = {死亡=2708113174,挨打=3133455853,施法=3842906130,攻击=3316056138,防御=475350356,资源="sound.wdf"}
	elseif yx == "狼" then
		yxs = {死亡=2708113174,挨打=3133455853,施法=3842906130,攻击=3316056138,防御=475350356,资源="sound.wdf"}
	elseif yx == "葫芦宝贝" then
		yxs = {死亡=0,挨打=3519019586,施法=3837633016,攻击=4160726282,防御=2880121122,资源="sound.wdf"}
	elseif yx == "机关兽" then
		yxs = {死亡=3263486412,挨打=1315738080,施法=3045913148,攻击=2855753258,防御=2880121122,资源="sound.wdf"}
	elseif yx == "花妖" then
		yxs = {死亡=3042612186,挨打=1867247498,施法=2972372550,攻击=3143425208,防御=2633715194,资源="sound.wdf"}
	elseif yx == "剑侠客_剑" then
		yxs = {死亡=1327318008,挨打=155161828,施法=320557781,攻击=400657779,防御=155161828,资源="sound.wdf"}
	elseif yx == "如花解语" then
		yxs = {资源="sound.wdf",文件=3184366984}
	elseif yx == "巡游天神" then
		yxs = {死亡=583330905,挨打=741807116,施法=4227780475,攻击=2296360938,防御=1728600899,资源="sound.wdf"}
	elseif yx == "蚌精" then
		yxs = {死亡=0,挨打=1389231832,施法=3837633016,攻击=705045340,防御=2880121122,资源="sound.wdf"}
	elseif yx == "阴阳伞" then
		yxs = {死亡=3263486412,挨打=1315738080,施法=3045913148,攻击=2547905352,防御=2880121122,资源="sound.wdf"}
	elseif yx == "混沌兽" then
		yxs = {死亡=756393989,挨打=2809241142,施法=3464961617,攻击=4081372887,防御=2880121122,资源="sound.wd1"}
	elseif yx == "碧水夜叉" then
		yxs = {死亡=0,挨打=3837633016,施法=3837633016,攻击=653574113,防御=2880121122,资源="sound.wdf"}
	elseif yx == "蛟龙" then
		yxs = {死亡=3329377485,挨打=2970665478,施法=1959454355,攻击=1222830518,防御=931042917,资源="sound.wdf"}
	elseif yx == "虎头怪_锤" then
		yxs = {死亡=3781138438,挨打=2899330032,施法=4073038797,攻击=1252214659,防御=2899330032,资源="sound.wdf"}
	elseif yx == "锦毛貂精" then
		yxs = {死亡=0,挨打=495028856,施法=3832438398,攻击=3832438398,防御=2880121122,资源="sound.wd1"}
	elseif yx == "鬼将" then
		yxs = {死亡=1416021503,挨打=3628019536,施法=776657085,攻击=628825018,防御=2880121122,资源="sound.wdf"}
	elseif yx == "龙卷雨击" then
		yxs = {资源="sound.wdf",文件=2744863907}
	elseif yx == "舞天姬_飘带" then
		yxs = {死亡=204903607,挨打=1288367693,施法=3093677842,攻击=804680942,防御=4164331995,资源="sound.wdf"}
	elseif yx == "巨蛙" then
		yxs = {死亡=2999070547,挨打=1795177224,施法=1888910843,攻击=3008582154,防御=3414599612,资源="sound.wdf"}
	elseif yx == "山贼" then
		yxs = {死亡=943533248,挨打=1293847218,施法=16908835,攻击=3321555335,防御=2880121122,资源="sound.wdf"}
	elseif yx == "海星" then
		yxs = {死亡=0,挨打=2194115600,施法=1437469676,攻击=34505741,防御=2880121122,资源="sound.wd1"}
	elseif yx == "小龙女" then
		yxs = {死亡=1591572490,挨打=3049184326,施法=3049184326,攻击=789882072,防御=3547355172,资源="sound.wdf"}
	elseif yx == "冰川怒" then
		yxs = {资源="sound.wdf",文件=4150925370}
	elseif yx == "泪妖" then
		yxs = {死亡=2999070547,挨打=1710537164,施法=4221606384,攻击=804680942,防御=3414599612,资源="sound.wdf"}
	elseif yx == "分身术" then
		yxs = {资源="sound.wdf",文件=2735331492}
	elseif yx == "大蝙蝠" then
		yxs = {死亡=3421749718,挨打=1245546270,施法=1666501049,攻击=3518277960,防御=3102202973,资源="sound.wdf"}
	elseif yx == "幽萤娃娃" then
		yxs = {死亡=0,挨打=3519019586,施法=1867036243,攻击=2096418495,防御=2880121122,资源="sound.wdf"}
	elseif yx == "黑山老妖" then
		yxs = {死亡=2636731460,挨打=3799816302,施法=1727732694,攻击=4203145572,防御=3220309884,资源="sound.wdf"}
	elseif yx == "野猪精" then
		yxs = {死亡=194273491,挨打=3721479617,施法=2574066915,攻击=1685697597,防御=3636788168,资源="sound.wdf"}
	elseif yx == "灵符女娲" then
		yxs = {死亡=0,挨打=2160835279,施法=4221606384,攻击=3332257767,防御=2880121122,资源="sound.wdf"}
	elseif yx == "巨魔王_刀" then
		yxs = {死亡=2323003374,挨打=916433000,施法=1429774061,攻击=677653198,防御=3074235483,资源="sound.wdf"}
	elseif yx == "龙太子" then
		yxs = {死亡=2458706401,挨打=3407056961,施法=3004979591,攻击=195856226,防御=3702918125,资源="sound.wdf"}
	elseif yx == "琴仙" then
		yxs = {死亡=3960602968,挨打=1710537164,施法=1015578079,攻击=3304945064,防御=3853960820,资源="sound.wdf"}
	elseif yx == "奔雷咒" then
		yxs = {资源="sound.wdf",文件=67470579}
	elseif yx == "偃无师" then
		yxs = {死亡=1327318008,挨打=155161828,施法=320557781,攻击=677653198,防御=155161828,资源="sound.wdf"}
	elseif yx == "吸血鬼" then
		yxs = {死亡=656318663,挨打=3078005202,施法=177375547,攻击=2289549345,防御=3997612676,资源="sound.wdf"}
	elseif yx == "地狱战神" then
		yxs = {死亡=1711283247,挨打=746002057,施法=4218442141,攻击=1570228677,防御=1897410428,资源="sound.wdf"}
	elseif yx == "连环击" then
		yxs = {资源="sound.wdf",文件=805076874}
	elseif yx == "炎魔神" then
		yxs = {死亡=1308418699,挨打=291502600,施法=3653656369,攻击=1973126590,防御=2880121122,资源="sound.wdf"}
	elseif yx == "蛤蟆精" then
		yxs = {死亡=1431920351,挨打=602028705,施法=393201907,攻击=1276533297,防御=1570262764,资源="sound.wdf"}
	elseif yx == "超级泡泡" then
		yxs = {死亡=1383131555,挨打=4055472634,施法=807924065,攻击=2747091459,防御=112926784,资源="sound.wdf"}
	elseif yx == "剑侠客_刀" then
		yxs = {死亡=1327318008,挨打=155161828,施法=320557781,攻击=3451673424,防御=155161828,资源="sound.wdf"}
	elseif yx == "巨魔王_斧钺" then
		yxs = {死亡=2323003374,挨打=916433000,施法=1429774061,攻击=677653198,防御=3074235483,资源="sound.wdf"}
	elseif yx == "巨力神猿" then
		yxs = {死亡=487913509,挨打=3021936694,施法=668863761,攻击=1223183938,防御=2880121122,资源="sound.wdf"}
	elseif yx == "猫灵兽形" then
		yxs = {死亡=0,挨打=2194115600,施法=1421404486,攻击=705045340,防御=2559105037,资源="sound.wdf"}
	elseif yx == "失魂符" then
		yxs = {资源="sound.wdf",文件=4139701329}
	elseif yx == "野猪" then
		yxs = {死亡=194273491,挨打=3721479617,施法=2574066915,攻击=1685697597,防御=3636788168,资源="sound.wdf"}
	elseif yx == "逍遥生_扇" then
		yxs = {死亡=518982477,挨打=2648789847,施法=2013348912,攻击=4026676540,防御=2648789847,资源="sound.wdf"}
	elseif yx == "雷鸟人" then
		yxs = {死亡=3672377755,挨打=1509049151,施法=3775307605,攻击=3237925644,防御=2798717351,资源="sound.wdf"}
	elseif yx == "鬼潇潇" then
		yxs = {死亡=1015578079,挨打=2448026491,施法=1045546970,攻击=499499799,防御=3681921992,资源="sound.wdf"}
	elseif yx == "凤凰" then
		yxs = {死亡=802634997,挨打=2893660229,施法=2242027434,攻击=4180273224,防御=865894152,资源="sound.wdf"}
	elseif yx == "巨魔王" then
		yxs = {死亡=2323003374,挨打=916433000,施法=1429774061,攻击=677653198,防御=3074235483,资源="sound.wdf"}
	elseif yx == "骨精灵_魔棒" then
		yxs = {死亡=1015578079,挨打=2448026491,施法=1045546970,攻击=499499799,防御=3681921992,资源="sound.wdf"}
	elseif yx == "马面" then
		yxs = {死亡=543104812,挨打=4079987514,施法=780788950,攻击=1888054507,防御=563150282,资源="sound.wdf"}
	elseif yx == "莲步轻舞" then
		yxs = {资源="sound.wdf",文件=3184366984}
	elseif yx == "狐美人" then
		yxs = {死亡=222809359,挨打=2410753087,施法=803377543,攻击=1598860941,防御=1482085804,资源="sound.wdf"}
	elseif yx == "狐美人_鞭" then
		yxs = {死亡=222809359,挨打=2410753087,施法=803377543,攻击=1598860941,防御=1482085804,资源="sound.wdf"}
	elseif yx == "泡泡" then
		yxs = {死亡=2069724230,挨打=4055472634,施法=2322934290,攻击=3876088364,防御=112926784,资源="sound.wdf"}
	elseif yx == "巫蛮儿" then
		yxs = {死亡=1542568619,挨打=2410753087,施法=1792267731,攻击=3304945064,防御=4228027665,资源="sound.wdf"}
	elseif yx == "玄彩娥_飘带" then
		yxs = {死亡=1837222459,挨打=614405189,施法=1792267731,攻击=3304945064,防御=4228027665,资源="sound.wdf"}
	elseif yx == "英女侠" then
		yxs = {死亡=2078703053,挨打=2976075470,施法=2603956615,攻击=2604636862,防御=4042212276,资源="sound.wdf"}
	elseif yx == "桃夭夭" then
		yxs = {死亡=1542568619,挨打=2410753087,施法=1792267731,攻击=3304945064,防御=4228027665,资源="sound.wdf"}
	elseif yx == "夜罗刹" then
		yxs = {死亡=3874120041,挨打=1873908350,施法=2020017406,攻击=1050928977,防御=2880121122,资源="sound.wdf"}
	elseif yx == "星灵仙子" then
		yxs = {死亡=1540473805,挨打=2834322465,施法=4155523088,攻击=1268762037,防御=3765776993,资源="sound.wdf"}
	elseif yx == "蜘蛛精" then
		yxs = {死亡=407080408,挨打=1015767490,施法=930686860,攻击=1618653484,防御=3083137918,资源="sound.wdf"}
	elseif yx == "赌徒" then
		yxs = {死亡=563557440,挨打=2978707923,施法=1485725321,攻击=1485725321,防御=3756606716,资源="sound.wdf"}
	elseif yx == "振翅千里" then
		yxs = {资源="sound.wdf",文件=900857475}
	elseif yx == "落雷符" then
		yxs = {资源="sound.wdf",文件=3721556213}
	elseif yx == "象形" then
		yxs = {资源="sound.wdf",文件=2096780433}
	elseif yx == "蝎子精" then
		yxs = {死亡=0,挨打=2729136424,施法=656200786,攻击=4081372887,防御=2880121122,资源="sound.wdf"}
	elseif yx == "神天兵_枪矛" then
		yxs = {死亡=656344040,挨打=779917427,施法=3019919639,攻击=659057244,防御=98435676,资源="sound.wdf"}
	elseif yx == "超级海豚" then
		yxs = {死亡=0,挨打=2194115600,施法=2456408467,攻击=658670191,防御=1300144853,资源="sound.wdf"}
	elseif yx == "斗转星移" then
		yxs = {资源="sound.wdf",文件=2442638758}
	elseif yx == "蔓藤妖花" then
		yxs = {死亡=0,挨打=495028856,施法=3653656369,攻击=3465790549,防御=2880121122,资源="sound.wdf"}
	elseif yx == "杀破狼_弓弩" then
		yxs = {死亡=2458706401,挨打=3407056961,施法=3004979591,攻击=195856226,防御=3407056961,资源="sound.wdf"}
	elseif yx == "英女侠_双短剑" then
		yxs = {死亡=2078703053,挨打=2976075470,施法=2603956615,攻击=2604636862,防御=4042212276,资源="sound.wdf"}
	elseif yx == "鼠先锋" then
		yxs = {死亡=3144522577,挨打=3712770835,施法=1503709144,攻击=4081372887,防御=2880121122,资源="sound.wdf"}
	elseif yx == "天将" then
		yxs = {死亡=2453907670,挨打=3490324928,施法=4200965191,攻击=628525694,防御=1251547833,资源="sound.wdf"}
	elseif yx == "斗转星移" then
		yxs = {资源="sound.wdf",文件=2442638758}
	end
	return  yxs
end