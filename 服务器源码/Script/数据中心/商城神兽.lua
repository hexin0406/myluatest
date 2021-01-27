function 取神兽资质(造型,物法)
	if 物法 ~= nil then
		造型 = 造型.."_"..物法
	end
	local bbs = {}
	if 造型 == "超级神龙" then
		bbs[1] = 1850 --攻资
		bbs[2] = 1850 --防资
		bbs[3] = 6000 --体资
		bbs[4] = 4000 --法资
		bbs[5] = 1700 --速资
		bbs[6] = 1500 --躲闪
		bbs[7] = 1.5
	    bbs[8] = {"高级必杀","高级驱鬼","高级夜战","幸运","强力"}
	    bbs[9] = {100,20,20,20,20,20}
	elseif 造型 == "超级神龙_法系" then
		bbs[1] = 1850 --攻资
		bbs[2] = 1850 --防资
		bbs[3] = 6000 --体资
		bbs[4] = 4000 --法资
		bbs[5] = 1700 --速资
		bbs[6] = 1500 --躲闪
		bbs[7] = 1.5
	    bbs[8] = {"龙魂","高级法术波动","奔雷咒","再生","魔之心"}
	    bbs[9] = {100,20,20,20,20,20}
	elseif 造型 == "贪狼" then
		bbs[1] = 1850 --攻资
		bbs[2] = 1850 --防资
		bbs[3] = 6000 --体资
		bbs[4] = 4000 --法资
		bbs[5] = 1700 --速资
		bbs[6] = 1500 --躲闪
		bbs[7] = 1.5
	    bbs[8] = {"高级必杀","高级驱鬼","高级夜战","嗜血追击","强力"}
	    bbs[9] = {100,20,20,20,20,20}
	elseif 造型 == "贪狼_法系" then
		bbs[1] = 1850 --攻资
		bbs[2] = 1850 --防资
		bbs[3] = 6000 --体资
		bbs[4] = 4000 --法资
		bbs[5] = 1700 --速资
		bbs[6] = 1500 --躲闪
		bbs[7] = 1.5
	    bbs[8] = {"高级法术连击","高级法术波动","奔雷咒","再生","魔之心"}
	    bbs[9] = {100,20,20,20,20,20}
	elseif 造型 == "超级腾蛇" then
		bbs[1] = 1850 --攻资
		bbs[2] = 1850 --防资
		bbs[3] = 6000 --体资
		bbs[4] = 4000 --法资
		bbs[5] = 1700 --速资
		bbs[6] = 1500 --躲闪
		bbs[7] = 1.5
	    bbs[8] = {"高级连击","高级毒","高级夜战","偷袭","敏捷"}
	    bbs[9] = {100,20,20,20,20,20}
	elseif 造型 == "超级腾蛇_法系" then
		bbs[1] = 1850 --攻资
		bbs[2] = 1850 --防资
		bbs[3] = 6000 --体资
		bbs[4] = 4000 --法资
		bbs[5] = 1700 --速资
		bbs[6] = 1500 --躲闪
		bbs[7] = 1.5
	    bbs[8] = {"高级法术波动","地狱烈火","魔之心","灵能激发","永恒"}
	    bbs[9] = {100,20,20,20,20,20}
	elseif 造型 == "超级青鸾" then
		bbs[1] = 1850 --攻资
		bbs[2] = 1850 --防资
		bbs[3] = 6000 --体资
		bbs[4] = 4000 --法资
		bbs[5] = 1700 --速资
		bbs[6] = 1500 --躲闪
		bbs[7] = 1.5
	    bbs[8] = {"高级夜战","苍鸾怒击","高级飞行","高级反震","高级连击"}
	    bbs[9] = {100,20,20,20,20,20}
	elseif 造型 == "超级青鸾_法系" then
		bbs[1] = 1850 --攻资
		bbs[2] = 1850 --防资
		bbs[3] = 6000 --体资
		bbs[4] = 4000 --法资
		bbs[5] = 1700 --速资
		bbs[6] = 1500 --躲闪
		bbs[7] = 1.5
	    bbs[8] = {"法术暴击","奔雷咒","高级魔之心","高级幸运","高级神佑复生"}
	    bbs[9] = {100,20,20,20,20,20}
	elseif 造型 == "超级人参娃娃" then
		bbs[1] = 1850 --攻资
		bbs[2] = 1850 --防资
		bbs[3] = 6000 --体资
		bbs[4] = 4000 --法资
		bbs[5] = 1700 --速资
		bbs[6] = 1500 --躲闪
		bbs[7] = 1.5
	    bbs[8] = {"壁垒击破","高级必杀","高级强力","高级驱鬼","幸运"}
	    bbs[9] = {100,20,20,20,20,20}
	elseif 造型 == "超级人参娃娃_法系" then
		bbs[1] = 1850 --攻资
		bbs[2] = 1850 --防资
		bbs[3] = 6000 --体资
		bbs[4] = 4000 --法资
		bbs[5] = 1700 --速资
		bbs[6] = 1500 --躲闪
		bbs[7] = 1.5
	    bbs[8] = {"高级法术波动","泰山压顶","魔之心","高级法术连击","高级冥思"}
	    bbs[9] = {100,20,20,20,20,20}
	elseif 造型 == "超级海豚" then
		bbs[1] = 1850 --攻资
		bbs[2] = 1850 --防资
		bbs[3] = 6000 --体资
		bbs[4] = 4000 --法资
		bbs[5] = 1700 --速资
		bbs[6] = 1500 --躲闪
		bbs[7] = 1.5
	    bbs[8] = {"剑荡四方","高级偷袭","高级幸运","高级必杀","驱怪"}
	    bbs[9] = {100,20,20,20,20,20}
	elseif 造型 == "超级海豚_法系" then
		bbs[1] = 1850 --攻资
		bbs[2] = 1850 --防资
		bbs[3] = 6000 --体资
		bbs[4] = 4000 --法资
		bbs[5] = 1700 --速资
		bbs[6] = 1500 --躲闪
		bbs[7] = 1.5
	    bbs[8] = {"高级法术暴击","水漫金山","高级魔之心","高级感知","慧根"}
	    bbs[9] = {100,20,20,20,20,20}
	elseif 造型 == "超级神牛" then
		bbs[1] = 1850 --攻资
		bbs[2] = 1850 --防资
		bbs[3] = 6000 --体资
		bbs[4] = 4000 --法资
		bbs[5] = 1700 --速资
		bbs[6] = 1500 --躲闪
		bbs[7] = 1.5
	    bbs[8] = {"力劈华山","高级幸运","高级招架","必杀","强力"}
	    bbs[9] = {100,20,20,20,20,20}
	elseif 造型 == "超级神牛_法系" then
		bbs[1] = 1850 --攻资
		bbs[2] = 1850 --防资
		bbs[3] = 6000 --体资
		bbs[4] = 4000 --法资
		bbs[5] = 1700 --速资
		bbs[6] = 1500 --躲闪
		bbs[7] = 1.5
	    bbs[8] = {"高级法术波动","奔雷咒","高级法术连击","冥思","魔之心"}
	    bbs[9] = {100,20,20,20,20,20}
	elseif 造型 == "超级神虎" then
		bbs[1] = 1850 --攻资
		bbs[2] = 1850 --防资
		bbs[3] = 6000 --体资
		bbs[4] = 4000 --法资
		bbs[5] = 1700 --速资
		bbs[6] = 1500 --躲闪
		bbs[7] = 1.5
	    bbs[8] = {"高级感知","嗜血追击","高级夜战","连击","强力"}
	    bbs[9] = {100,20,20,20,20,20}
	elseif 造型 == "超级神虎_法系" then
		bbs[1] = 1850 --攻资
		bbs[2] = 1850 --防资
		bbs[3] = 6000 --体资
		bbs[4] = 4000 --法资
		bbs[5] = 1700 --速资
		bbs[6] = 1500 --躲闪
		bbs[7] = 1.5
	    bbs[8] = {"高级法术暴击","奔雷咒","魔之心","高级驱鬼","法术波动"}
	    bbs[9] = {100,20,20,20,20,20}
	elseif 造型 == "超级神兔" then
		bbs[1] = 1850 --攻资
		bbs[2] = 1850 --防资
		bbs[3] = 6000 --体资
		bbs[4] = 4000 --法资
		bbs[5] = 1700 --速资
		bbs[6] = 1500 --躲闪
		bbs[7] = 1.5
	    bbs[8] = {"高级连击","高级偷袭","高级敏捷","驱鬼","幸运"}
	    bbs[9] = {100,20,20,20,20,20}
	elseif 造型 == "超级神兔_法系" then
		bbs[1] = 1850 --攻资
		bbs[2] = 1850 --防资
		bbs[3] = 6000 --体资
		bbs[4] = 4000 --法资
		bbs[5] = 1700 --速资
		bbs[6] = 1500 --躲闪
		bbs[7] = 1.5
	    bbs[8] = {"高级法术连击","奔雷咒","魔之心","高级反震","感知"}
	    bbs[9] = {100,20,20,20,20,20}
	elseif 造型 == "超级泡泡" then
		bbs[1] = 1850 --攻资
		bbs[2] = 1850 --防资
		bbs[3] = 6000 --体资
		bbs[4] = 4000 --法资
		bbs[5] = 1700 --速资
		bbs[6] = 1500 --躲闪
		bbs[7] = 1.5
	    bbs[8] = {"高级必杀","高级神佑复生","高级感知","高级飞行","驱鬼"}
	    bbs[9] = {100,20,20,20,20,20}
	elseif 造型 == "超级泡泡_法系" then
		bbs[1] = 1850 --攻资
		bbs[2] = 1850 --防资
		bbs[3] = 6000 --体资
		bbs[4] = 4000 --法资
		bbs[5] = 1700 --速资
		bbs[6] = 1500 --躲闪
		bbs[7] = 1.5
	    bbs[8] = {"高级感知","奔雷咒","高级魔之心","高级慧根","雷击"}
	    bbs[9] = {100,20,20,20,20,20}
	elseif 造型 == "超级大熊猫" then
		bbs[1] = 1850 --攻资
		bbs[2] = 1850 --防资
		bbs[3] = 6000 --体资
		bbs[4] = 4000 --法资
		bbs[5] = 1700 --速资
		bbs[6] = 1500 --躲闪
		bbs[7] = 1.5
	    bbs[8] = {"高级连击","高级防御","高级感知","高级夜战","高级强力"}
	    bbs[9] = {100,20,20,20,20,20}
	elseif 造型 == "超级大熊猫_法系" then
		bbs[1] = 1850 --攻资
		bbs[2] = 1850 --防资
		bbs[3] = 6000 --体资
		bbs[4] = 4000 --法资
		bbs[5] = 1700 --速资
		bbs[6] = 1500 --躲闪
		bbs[7] = 1.5
	    bbs[8] = {"高级法术波动","奔雷咒","高级魔之心","高级冥思","雷击"}
	    bbs[9] = {100,20,20,20,20,20}
	elseif 造型 == "超级金猴" then
		bbs[1] = 1850 --攻资
		bbs[2] = 1850 --防资
		bbs[3] = 6000 --体资
		bbs[4] = 4000 --法资
		bbs[5] = 1700 --速资
		bbs[6] = 1500 --躲闪
		bbs[7] = 1.5
	    bbs[8] = {"高级偷袭","高级连击","高级幸运","高级敏捷","驱鬼"}
	    bbs[9] = {100,20,20,20,20,20}
	elseif 造型 == "超级金猴_法系" then
		bbs[1] = 1850 --攻资
		bbs[2] = 1850 --防资
		bbs[3] = 6000 --体资
		bbs[4] = 4000 --法资
		bbs[5] = 1700 --速资
		bbs[6] = 1500 --躲闪
		bbs[7] = 1.5
	    bbs[8] = {"高级法术波动","奔雷咒","高级魔之心","高级精神集中","雷击"}
	    bbs[9] = {100,20,20,20,20,20}
	elseif 造型 == "超级大象" then
		bbs[1] = 1850 --攻资
		bbs[2] = 1850 --防资
		bbs[3] = 6000 --体资
		bbs[4] = 4000 --法资
		bbs[5] = 1700 --速资
		bbs[6] = 1500 --躲闪
		bbs[7] = 1.5
	    bbs[8] = {"高级强力","高级再生","高级必杀","高级反震","驱鬼"}
	    bbs[9] = {100,20,20,20,20,20}
	elseif 造型 == "超级大象_法系" then
		bbs[1] = 1850 --攻资
		bbs[2] = 1850 --防资
		bbs[3] = 6000 --体资
		bbs[4] = 4000 --法资
		bbs[5] = 1700 --速资
		bbs[6] = 1500 --躲闪
		bbs[7] = 1.5
	    bbs[8] = {"高级法术连击","奔雷咒","高级魔之心","高级神迹","雷击"}
	    bbs[9] = {100,20,20,20,20,20}
	elseif 造型 == "超级灵鹿" then
		bbs[1] = 1850 --攻资
		bbs[2] = 1850 --防资
		bbs[3] = 6000 --体资
		bbs[4] = 4000 --法资
		bbs[5] = 1700 --速资
		bbs[6] = 1500 --躲闪
		bbs[7] = 1.5
	    bbs[8] = {"善恶有报","高级再生","高级偷袭","高级冥思","永恒"}
	    bbs[9] = {100,20,20,20,20,20}
	elseif 造型 == "超级灵鹿_法系" then
		bbs[1] = 1850 --攻资
		bbs[2] = 1850 --防资
		bbs[3] = 6000 --体资
		bbs[4] = 4000 --法资
		bbs[5] = 1700 --速资
		bbs[6] = 1500 --躲闪
		bbs[7] = 1.5
	    bbs[8] = {"高级法术暴击","泰山压顶","高级法术连击","高级再生","上古灵符"}
	    bbs[9] = {100,20,20,20,20,20}
	elseif 造型 == "超级白泽" then
		bbs[1] = 1850 --攻资
		bbs[2] = 1850 --防资
		bbs[3] = 6000 --体资
		bbs[4] = 4000 --法资
		bbs[5] = 1700 --速资
		bbs[6] = 1500 --躲闪
		bbs[7] = 1.5
	    bbs[8] = {"高级必杀","高级夜战","高级敏捷","高级幸运","感知"}
	    bbs[9] = {100,20,20,20,20,20}
	elseif 造型 == "超级白泽_法系" then
		bbs[1] = 1850 --攻资
		bbs[2] = 1850 --防资
		bbs[3] = 6000 --体资
		bbs[4] = 4000 --法资
		bbs[5] = 1700 --速资
		bbs[6] = 1500 --躲闪
		bbs[7] = 1.5
	    bbs[8] = {"高级法术暴击","水漫金山","高级魔之心","高级反震","上古灵符"}
	    bbs[9] = {100,20,20,20,20,20}
	elseif 造型 == "超级赤焰兽" then
		bbs[1] = 1850 --攻资
		bbs[2] = 1850 --防资
		bbs[3] = 6000 --体资
		bbs[4] = 4000 --法资
		bbs[5] = 1700 --速资
		bbs[6] = 1500 --躲闪
		bbs[7] = 1.5
	    bbs[8] = {"高级必杀","高级感知","高级反击","幸运","高级毒"}
	    bbs[9] = {100,20,20,20,20,20}
	elseif 造型 == "超级赤焰兽_法系" then
		bbs[1] = 1850 --攻资
		bbs[2] = 1850 --防资
		bbs[3] = 6000 --体资
		bbs[4] = 4000 --法资
		bbs[5] = 1700 --速资
		bbs[6] = 1500 --躲闪
		bbs[7] = 1.5
	    bbs[8] = {"高级法术连击","高级神佑复生","魔之心","高级法术暴击","高级冥思"}
	    bbs[9] = {100,20,20,20,20,20}
	elseif 造型 == "超级麒麟" then
		bbs[1] = 1850 --攻资
		bbs[2] = 1850 --防资
		bbs[3] = 6000 --体资
		bbs[4] = 4000 --法资
		bbs[5] = 1700 --速资
		bbs[6] = 1500 --躲闪
		bbs[7] = 1.5
	    bbs[8] = {"高级合纵","高级夜战","高级连击","高级幸运","偷袭"}
	    bbs[9] = {100,20,20,20,20,20}
	elseif 造型 == "超级麒麟_法系" then
		bbs[1] = 1850 --攻资
		bbs[2] = 1850 --防资
		bbs[3] = 6000 --体资
		bbs[4] = 4000 --法资
		bbs[5] = 1700 --速资
		bbs[6] = 1500 --躲闪
		bbs[7] = 1.5
	    bbs[8] = {"高级魔之心","泰山压顶","高级法术连击","感知","高级驱鬼"}
	    bbs[9] = {100,20,20,20,20,20}
	elseif 造型 == "超级大鹏" then
		bbs[1] = 1850 --攻资
		bbs[2] = 1850 --防资
		bbs[3] = 6000 --体资
		bbs[4] = 4000 --法资
		bbs[5] = 1700 --速资
		bbs[6] = 1500 --躲闪
		bbs[7] = 1.5
	    bbs[8] = {"高级飞行","高级偷袭","高级神佑复生","高级敏捷","必杀"}
	    bbs[9] = {100,20,20,20,20,20}
	elseif 造型 == "超级大鹏_法系" then
		bbs[1] = 1850 --攻资
		bbs[2] = 1850 --防资
		bbs[3] = 6000 --体资
		bbs[4] = 4000 --法资
		bbs[5] = 1700 --速资
		bbs[6] = 1500 --躲闪
		bbs[7] = 1.5
	    bbs[8] = {"高级法术波动","奔雷咒","高级法术暴击","高级招架","冥思"}
	    bbs[9] = {100,20,20,20,20,20}
	elseif 造型 == "超级灵狐" then
		bbs[1] = 1850 --攻资
		bbs[2] = 1850 --防资
		bbs[3] = 6000 --体资
		bbs[4] = 4000 --法资
		bbs[5] = 1700 --速资
		bbs[6] = 1500 --躲闪
		bbs[7] = 1.5
	    bbs[8] = {"高级敏捷","惊心一剑","高级必杀","驱怪","高级偷袭"}
	    bbs[9] = {100,20,20,20,20,20}
	elseif 造型 == "超级灵狐_法系" then
		bbs[1] = 1850 --攻资
		bbs[2] = 1850 --防资
		bbs[3] = 6000 --体资
		bbs[4] = 4000 --法资
		bbs[5] = 1700 --速资
		bbs[6] = 1500 --躲闪
		bbs[7] = 1.5
	    bbs[8] = {"高级感知","高级法术暴击","奔雷咒","法术连击","高级魔之心"}
	    bbs[9] = {100,20,20,20,20,20}
	elseif 造型 == "超级孔雀" then
		bbs[1] = 1850 --攻资
		bbs[2] = 1850 --防资
		bbs[3] = 6000 --体资
		bbs[4] = 4000 --法资
		bbs[5] = 1700 --速资
		bbs[6] = 1500 --躲闪
		bbs[7] = 1.5
	    bbs[8] = {"高级偷袭","高级飞行","高级再生","必杀","高级连击"}
	    bbs[9] = {100,20,20,20,20,20}
	elseif 造型 == "超级孔雀_法系" then
		bbs[1] = 1850 --攻资
		bbs[2] = 1850 --防资
		bbs[3] = 6000 --体资
		bbs[4] = 4000 --法资
		bbs[5] = 1700 --速资
		bbs[6] = 1500 --躲闪
		bbs[7] = 1.5
	    bbs[8] = {"幸运","高级法术暴击","高级神佑复生","再生","高级魔之心"}
	    bbs[9] = {100,20,20,20,20,20}
	elseif 造型 == "超级神马" then
		bbs[1] = 1850 --攻资
		bbs[2] = 1850 --防资
		bbs[3] = 6000 --体资
		bbs[4] = 4000 --法资
		bbs[5] = 1700 --速资
		bbs[6] = 1500 --躲闪
		bbs[7] = 1.5
	    bbs[8] = {"高级神佑复生","浮云神马","高级连击","幸运","神迹"}
	    bbs[9] = {100,20,20,20,20,20}
	elseif 造型 == "超级神马_法系" then
		bbs[1] = 1850 --攻资
		bbs[2] = 1850 --防资
		bbs[3] = 6000 --体资
		bbs[4] = 4000 --法资
		bbs[5] = 1700 --速资
		bbs[6] = 1500 --躲闪
		bbs[7] = 1.5
	    bbs[8] = {"高级魔之心","奔雷咒","高级法术连击","法术暴击","慧根"}
	    bbs[9] = {100,20,20,20,20,20}
	elseif 造型 == "超级六耳猕猴" then
		bbs[1] = 1850 --攻资
		bbs[2] = 1850 --防资
		bbs[3] = 6000 --体资
		bbs[4] = 4000 --法资
		bbs[5] = 1700 --速资
		bbs[6] = 1500 --躲闪
		bbs[7] = 1.5
	    bbs[8] = {"高级敏捷","高级招架","高级连击","幸运","高级偷袭"}
	    bbs[9] = {100,20,20,20,20,20}
	elseif 造型 == "超级六耳猕猴_法系" then
		bbs[1] = 1850 --攻资
		bbs[2] = 1850 --防资
		bbs[3] = 6000 --体资
		bbs[4] = 4000 --法资
		bbs[5] = 1700 --速资
		bbs[6] = 1500 --躲闪
		bbs[7] = 1.5
	    bbs[8] = {"须弥真言","高级法术连击","永恒","上古灵符","高级法术暴击"}
	    bbs[9] = {100,20,20,20,20,20}
	elseif 造型 == "超级神羊" then
		bbs[1] = 1850 --攻资
		bbs[2] = 1850 --防资
		bbs[3] = 6000 --体资
		bbs[4] = 4000 --法资
		bbs[5] = 1700 --速资
		bbs[6] = 1500 --躲闪
		bbs[7] = 1.5
	    bbs[8] = {"高级必杀","感知","高级连击","千钧一怒","反震"}
	    bbs[9] = {100,20,20,20,20,20}
	elseif 造型 == "超级神羊_法系" then
		bbs[1] = 1850 --攻资
		bbs[2] = 1850 --防资
		bbs[3] = 6000 --体资
		bbs[4] = 4000 --法资
		bbs[5] = 1700 --速资
		bbs[6] = 1500 --躲闪
		bbs[7] = 1.5
	    bbs[8] = {"驱鬼","高级法术波动","奔雷咒","法术暴击","高级魔之心"}
	    bbs[9] = {100,20,20,20,20,20}
	elseif 造型 == "超级土地公公" then
		bbs[1] = 1850 --攻资
		bbs[2] = 1850 --防资
		bbs[3] = 6000 --体资
		bbs[4] = 4000 --法资
		bbs[5] = 1700 --速资
		bbs[6] = 1500 --躲闪
		bbs[7] = 1.5
	    bbs[8] = {"高级敏捷","高级必杀","高级连击","驱怪","高级神佑复生"}
	    bbs[9] = {100,20,20,20,20,20}
	elseif 造型 == "超级土地公公_法系" then
		bbs[1] = 1850 --攻资
		bbs[2] = 1850 --防资
		bbs[3] = 6000 --体资
		bbs[4] = 4000 --法资
		bbs[5] = 1700 --速资
		bbs[6] = 1500 --躲闪
		bbs[7] = 1.5
	    bbs[8] = {"高级神佑复生","高级法术连击","天降灵葫","招架","高级魔之心"}
	    bbs[9] = {100,20,20,20,20,20}
	elseif 造型 == "超级神猴" then
		bbs[1] = 1850 --攻资
		bbs[2] = 1850 --防资
		bbs[3] = 6000 --体资
		bbs[4] = 4000 --法资
		bbs[5] = 1700 --速资
		bbs[6] = 1500 --躲闪
		bbs[7] = 1.5
	    bbs[8] = {"高级神佑复生","高级吸血","大快朵颐","连击","必杀"}
	    bbs[9] = {100,20,20,20,20,20}
	elseif 造型 == "超级神猴_法系" then
		bbs[1] = 1850 --攻资
		bbs[2] = 1850 --防资
		bbs[3] = 6000 --体资
		bbs[4] = 4000 --法资
		bbs[5] = 1700 --速资
		bbs[6] = 1500 --躲闪
		bbs[7] = 1.5
	    bbs[8] = {"高级法术波动","高级法术连击","奔雷咒","法术暴击","魔之心"}
	    bbs[9] = {100,20,20,20,20,20}
	elseif 造型 == "超级玉兔" then
		bbs[1] = 1850 --攻资
		bbs[2] = 1850 --防资
		bbs[3] = 6000 --体资
		bbs[4] = 4000 --法资
		bbs[5] = 1700 --速资
		bbs[6] = 1500 --躲闪
		bbs[7] = 1.5
	    bbs[8] = {"高级敏捷","高级感知","连击","高级夜战","偷袭"}
	    bbs[9] = {100,20,20,20,20,20}
	elseif 造型 == "超级玉兔_法系" then
		bbs[1] = 1850 --攻资
		bbs[2] = 1850 --防资
		bbs[3] = 6000 --体资
		bbs[4] = 4000 --法资
		bbs[5] = 1700 --速资
		bbs[6] = 1500 --躲闪
		bbs[7] = 1.5
	    bbs[8] = {"高级神佑复生","高级法术波动","月光","驱鬼","高级法术暴击"}
	    bbs[9] = {100,20,20,20,20,20}
	elseif 造型 == "超级神鸡" then
		bbs[1] = 1850 --攻资
		bbs[2] = 1850 --防资
		bbs[3] = 6000 --体资
		bbs[4] = 4000 --法资
		bbs[5] = 1700 --速资
		bbs[6] = 1500 --躲闪
		bbs[7] = 1.5
	    bbs[8] = {"高级神佑复生","高级强力","从天而降","驱鬼","必杀"}
	    bbs[9] = {100,20,20,20,20,20}
	elseif 造型 == "超级神鸡_法系" then
		bbs[1] = 1850 --攻资
		bbs[2] = 1850 --防资
		bbs[3] = 6000 --体资
		bbs[4] = 4000 --法资
		bbs[5] = 1700 --速资
		bbs[6] = 1500 --躲闪
		bbs[7] = 1.5
	    bbs[8] = {"高级感知","高级法术波动","地狱烈火","招架","魔之心"}
	    bbs[9] = {100,20,20,20,20,20}
	elseif 造型 == "超级筋斗云" then
		bbs[1] = 1850 --攻资
		bbs[2] = 1850 --防资
		bbs[3] = 6000 --体资
		bbs[4] = 4000 --法资
		bbs[5] = 1700 --速资
		bbs[6] = 1500 --躲闪
		bbs[7] = 1.5
	    bbs[8] = {"高级神佑复生","高级偷袭","高级夜战","强力","高级敏捷"}
	    bbs[9] = {100,20,20,20,20,20}
	elseif 造型 == "超级筋斗云_法系" then
		bbs[1] = 1850 --攻资
		bbs[2] = 1850 --防资
		bbs[3] = 6000 --体资
		bbs[4] = 4000 --法资
		bbs[5] = 1700 --速资
		bbs[6] = 1500 --躲闪
		bbs[7] = 1.5
	    bbs[8] = {"高级感知","高级法术连击","奔雷咒","反震","高级魔之心"}
	    bbs[9] = {100,20,20,20,20,20}
	elseif 造型 == "超级神蛇" then
		bbs[1] = 1850 --攻资
		bbs[2] = 1850 --防资
		bbs[3] = 6000 --体资
		bbs[4] = 4000 --法资
		bbs[5] = 1700 --速资
		bbs[6] = 1500 --躲闪
		bbs[7] = 1.5
	    bbs[8] = {"高级神佑复生","高级偷袭","高级夜战","强力","高级敏捷"}
	    bbs[9] = {100,20,20,20,20,20}
	elseif 造型 == "超级神蛇_法系" then
		bbs[1] = 1850 --攻资
		bbs[2] = 1850 --防资
		bbs[3] = 6000 --体资
		bbs[4] = 4000 --法资
		bbs[5] = 1700 --速资
		bbs[6] = 1500 --躲闪
		bbs[7] = 1.5
	    bbs[8] = {"高级感知","高级法术连击","奔雷咒","反震","高级魔之心"}
	    bbs[9] = {100,20,20,20,20,20}
	elseif 造型 == "进阶琴仙" then
		bbs[1] = 3000 --攻资
		bbs[2] = 3000 --防资
		bbs[3] = 10000 --体资
		bbs[4] = 8000 --法资
		bbs[5] = 3000 --速资
		bbs[6] = 3000 --躲闪
		bbs[7] = 3
	    bbs[8] = {"观照万象","高级必杀","高级强力","高级夜战","高级偷袭","高级吸血","理直气壮","嗜血追击","苍鸾怒击","高级敏捷","大快朵颐","浮云神马",
	              "高级驱鬼","法术防御","高级神佑复生","高级感知","壁垒击破","千钧一怒","力劈华山","善恶有报","剑荡四方","月光","死亡召唤","从天而降"}
	    bbs[9] = {100,20,20,20,20,20}
	elseif 造型 == "进阶琴仙_法系" then
		bbs[1] = 3000 --攻资
		bbs[2] = 3000 --防资
		bbs[3] = 10000 --体资
		bbs[4] = 8000 --法资
		bbs[5] = 3000 --速资
		bbs[6] = 3000 --躲闪
		bbs[7] = 3
	    bbs[8] = {"观照万象","高级法术连击","高级法术暴击","高级法术波动","高级魔之心","须弥真言","驱怪","龙魂","灵山禅语","净台妙谛","灵能激发","浮云神马","法术防御",
	              "高级神佑复生","高级驱鬼","高级敏捷","理直气壮","苍鸾怒击","嗜血追击","高级连击","高级必杀","天降灵葫","八凶法阵","叱咤风云"}
        bbs[9] = {100,20,20,20,20,20}
	elseif 造型 == "飞天" then
		bbs[1] = 3000 --攻资
		bbs[2] = 3000 --防资
		bbs[3] = 10000 --体资
		bbs[4] = 8000 --法资
		bbs[5] = 3000 --速资
		bbs[6] = 3000 --躲闪
		bbs[7] = 3
	    bbs[8] = {"观照万象","高级必杀","高级强力","高级夜战","高级偷袭","高级吸血","理直气壮","嗜血追击","苍鸾怒击","高级敏捷","大快朵颐","浮云神马",
	              "高级驱鬼","法术防御","高级神佑复生","高级感知","壁垒击破","千钧一怒","力劈华山","善恶有报","剑荡四方","月光","死亡召唤","从天而降"}
	    bbs[9] = {100,20,20,20,20,20}
	elseif 造型 == "飞天_法系" then
		bbs[1] = 3000 --攻资
		bbs[2] = 3000 --防资
		bbs[3] = 10000 --体资
		bbs[4] = 8000 --法资
		bbs[5] = 3000 --速资
		bbs[6] = 3000 --躲闪
		bbs[7] = 3
	    bbs[8] = {"观照万象","高级法术连击","高级法术暴击","高级法术波动","高级魔之心","须弥真言","驱怪","龙魂","灵山禅语","净台妙谛","灵能激发","浮云神马","法术防御",
	              "高级神佑复生","高级驱鬼","高级敏捷","理直气壮","苍鸾怒击","嗜血追击","高级连击","高级必杀","天降灵葫","八凶法阵","叱咤风云"}
        bbs[9] = {100,20,20,20,20,20}
	elseif 造型 == "神狗" then
		bbs[1] = 3000 --攻资
		bbs[2] = 3000 --防资
		bbs[3] = 10000 --体资
		bbs[4] = 8000 --法资
		bbs[5] = 3000 --速资
		bbs[6] = 3000 --躲闪
		bbs[7] = 3
	    bbs[8] = {"观照万象","高级必杀","高级强力","高级夜战","高级偷袭","高级吸血","理直气壮","嗜血追击","苍鸾怒击","高级敏捷","大快朵颐","浮云神马",
	              "高级驱鬼","法术防御","高级神佑复生","高级感知","壁垒击破","千钧一怒","力劈华山","善恶有报","剑荡四方","月光","死亡召唤","从天而降"}
	    bbs[9] = {100,20,20,20,20,20}
	elseif 造型 == "神狗_法系" then
		bbs[1] = 3000 --攻资
		bbs[2] = 3000 --防资
		bbs[3] = 10000 --体资
		bbs[4] = 8000 --法资
		bbs[5] = 3000 --速资
		bbs[6] = 3000 --躲闪
		bbs[7] = 3
	    bbs[8] = {"观照万象","高级法术连击","高级法术暴击","高级法术波动","高级魔之心","须弥真言","驱怪","龙魂","灵山禅语","净台妙谛","灵能激发","浮云神马","法术防御",
	              "高级神佑复生","高级驱鬼","高级敏捷","理直气壮","苍鸾怒击","嗜血追击","高级连击","高级必杀","天降灵葫","八凶法阵","叱咤风云"}
        bbs[9] = {100,20,20,20,20,20}
	elseif 造型 == "超级神狗" then
		bbs[1] = 3000 --攻资
		bbs[2] = 3000 --防资
		bbs[3] = 10000 --体资
		bbs[4] = 8000 --法资
		bbs[5] = 3000 --速资
		bbs[6] = 3000 --躲闪
		bbs[7] = 3
	    bbs[8] = {"观照万象","高级必杀","高级强力","高级夜战","高级偷袭","高级吸血","理直气壮","嗜血追击","苍鸾怒击","高级敏捷","大快朵颐","浮云神马",
	              "高级驱鬼","法术防御","高级神佑复生","高级感知","壁垒击破","千钧一怒","力劈华山","善恶有报","剑荡四方","月光","死亡召唤","从天而降"}
	    bbs[9] = {100,20,20,20,20,20}
	elseif 造型 == "超级神狗_法系" then
		bbs[1] = 3000 --攻资
		bbs[2] = 3000 --防资
		bbs[3] = 10000 --体资
		bbs[4] = 8000 --法资
		bbs[5] = 3000 --速资
		bbs[6] = 3000 --躲闪
		bbs[7] = 3
	    bbs[8] = {"观照万象","高级法术连击","高级法术暴击","高级法术波动","高级魔之心","须弥真言","驱怪","龙魂","灵山禅语","净台妙谛","灵能激发","浮云神马","法术防御",
	              "高级神佑复生","高级驱鬼","高级敏捷","理直气壮","苍鸾怒击","嗜血追击","高级连击","高级必杀","天降灵葫","八凶法阵","叱咤风云"}
        bbs[9] = {100,20,20,20,20,20}
	elseif 造型 == "神鼠" then
		bbs[1] = 3000 --攻资
		bbs[2] = 3000 --防资
		bbs[3] = 10000 --体资
		bbs[4] = 8000 --法资
		bbs[5] = 3000 --速资
		bbs[6] = 3000 --躲闪
		bbs[7] = 3
	    bbs[8] = {"观照万象","高级必杀","高级强力","高级夜战","高级偷袭","高级吸血","理直气壮","嗜血追击","苍鸾怒击","高级敏捷","大快朵颐","浮云神马",
	              "高级驱鬼","法术防御","高级神佑复生","高级感知","壁垒击破","千钧一怒","力劈华山","善恶有报","剑荡四方","月光","死亡召唤","从天而降"}
	    bbs[9] = {100,20,20,20,20,20}
	elseif 造型 == "神鼠_法系" then
		bbs[1] = 3000 --攻资
		bbs[2] = 3000 --防资
		bbs[3] = 10000 --体资
		bbs[4] = 8000 --法资
		bbs[5] = 3000 --速资
		bbs[6] = 3000 --躲闪
		bbs[7] = 3
	    bbs[8] = {"观照万象","高级法术连击","高级法术暴击","高级法术波动","高级魔之心","须弥真言","驱怪","龙魂","灵山禅语","净台妙谛","灵能激发","浮云神马","法术防御",
	              "高级神佑复生","高级驱鬼","高级敏捷","理直气壮","苍鸾怒击","嗜血追击","高级连击","高级必杀","天降灵葫","八凶法阵","叱咤风云"}
        bbs[9] = {100,20,20,20,20,20}
	elseif 造型 == "超级神鼠" then
		bbs[1] = 3000 --攻资
		bbs[2] = 3000 --防资
		bbs[3] = 10000 --体资
		bbs[4] = 8000 --法资
		bbs[5] = 3000 --速资
		bbs[6] = 3000 --躲闪
		bbs[7] = 3
	    bbs[8] = {"观照万象","高级必杀","高级强力","高级夜战","高级偷袭","高级吸血","理直气壮","嗜血追击","苍鸾怒击","高级敏捷","大快朵颐","浮云神马",
	              "高级驱鬼","法术防御","高级神佑复生","高级感知","壁垒击破","千钧一怒","力劈华山","善恶有报","剑荡四方","月光","死亡召唤","从天而降"}
	    bbs[9] = {100,20,20,20,20,20}
	elseif 造型 == "超级神鼠_法系" then
		bbs[1] = 3000 --攻资
		bbs[2] = 3000 --防资
		bbs[3] = 10000 --体资
		bbs[4] = 8000 --法资
		bbs[5] = 3000 --速资
		bbs[6] = 3000 --躲闪
		bbs[7] = 3
	    bbs[8] = {"观照万象","高级法术连击","高级法术暴击","高级法术波动","高级魔之心","须弥真言","驱怪","龙魂","灵山禅语","净台妙谛","灵能激发","浮云神马","法术防御",
	              "高级神佑复生","高级驱鬼","高级敏捷","理直气壮","苍鸾怒击","嗜血追击","高级连击","高级必杀","天降灵葫","八凶法阵","叱咤风云"}
        bbs[9] = {100,20,20,20,20,20}
	elseif 造型 == "神猪" then
		bbs[1] = 3000 --攻资
		bbs[2] = 3000 --防资
		bbs[3] = 10000 --体资
		bbs[4] = 8000 --法资
		bbs[5] = 3000 --速资
		bbs[6] = 3000 --躲闪
		bbs[7] = 3
	    bbs[8] = {"观照万象","高级必杀","高级强力","高级夜战","高级偷袭","高级吸血","理直气壮","嗜血追击","苍鸾怒击","高级敏捷","大快朵颐","浮云神马",
	              "高级驱鬼","法术防御","高级神佑复生","高级感知","壁垒击破","千钧一怒","力劈华山","善恶有报","剑荡四方","月光","死亡召唤","从天而降"}
	    bbs[9] = {100,20,20,20,20,20}
	elseif 造型 == "神猪_法系" then
		bbs[1] = 3000 --攻资
		bbs[2] = 3000 --防资
		bbs[3] = 10000 --体资
		bbs[4] = 8000 --法资
		bbs[5] = 3000 --速资
		bbs[6] = 3000 --躲闪
		bbs[7] = 3
	    bbs[8] = {"观照万象","高级法术连击","高级法术暴击","高级法术波动","高级魔之心","须弥真言","驱怪","龙魂","灵山禅语","净台妙谛","灵能激发","浮云神马","法术防御",
	              "高级神佑复生","高级驱鬼","高级敏捷","理直气壮","苍鸾怒击","嗜血追击","高级连击","高级必杀","天降灵葫","八凶法阵","叱咤风云"}
        bbs[9] = {100,20,20,20,20,20}
	elseif 造型 == "超级神猪" then
		bbs[1] = 3000 --攻资
		bbs[2] = 3000 --防资
		bbs[3] = 10000 --体资
		bbs[4] = 8000 --法资
		bbs[5] = 3000 --速资
		bbs[6] = 3000 --躲闪
		bbs[7] = 3
	    bbs[8] = {"观照万象","高级必杀","高级强力","高级夜战","高级偷袭","高级吸血","理直气壮","嗜血追击","苍鸾怒击","高级敏捷","大快朵颐","浮云神马",
	              "高级驱鬼","法术防御","高级神佑复生","高级感知","壁垒击破","千钧一怒","力劈华山","善恶有报","剑荡四方","月光","死亡召唤","从天而降"}
	    bbs[9] = {100,20,20,20,20,20}
	elseif 造型 == "超级神猪_法系" then
		bbs[1] = 3000 --攻资
		bbs[2] = 3000 --防资
		bbs[3] = 10000 --体资
		bbs[4] = 8000 --法资
		bbs[5] = 3000 --速资
		bbs[6] = 3000 --躲闪
		bbs[7] = 3
	    bbs[8] = {"观照万象","高级法术连击","高级法术暴击","高级法术波动","高级魔之心","须弥真言","驱怪","龙魂","灵山禅语","净台妙谛","灵能激发","浮云神马","法术防御",
	              "高级神佑复生","高级驱鬼","高级敏捷","理直气壮","苍鸾怒击","嗜血追击","高级连击","高级必杀","天降灵葫","八凶法阵","叱咤风云"}
        bbs[9] = {100,20,20,20,20,20}
	elseif 造型 == "小白龙" then
		bbs[1] = 3000 --攻资
		bbs[2] = 3000 --防资
		bbs[3] = 10000 --体资
		bbs[4] = 8000 --法资
		bbs[5] = 3000 --速资
		bbs[6] = 3000 --躲闪
		bbs[7] = 3
	    bbs[8] = {"观照万象","高级必杀","高级强力","高级夜战","高级偷袭","高级吸血","理直气壮","嗜血追击","苍鸾怒击","高级敏捷","大快朵颐","浮云神马",
	              "高级驱鬼","法术防御","高级神佑复生","高级感知","壁垒击破","千钧一怒","力劈华山","善恶有报","剑荡四方","月光","死亡召唤","从天而降"}
	    bbs[9] = {100,20,20,20,20,20}
	elseif 造型 == "小白龙_法系" then
		bbs[1] = 3000 --攻资
		bbs[2] = 3000 --防资
		bbs[3] = 10000 --体资
		bbs[4] = 8000 --法资
		bbs[5] = 3000 --速资
		bbs[6] = 3000 --躲闪
		bbs[7] = 3
	    bbs[8] = {"观照万象","高级法术连击","高级法术暴击","高级法术波动","高级魔之心","须弥真言","驱怪","龙魂","灵山禅语","净台妙谛","灵能激发","浮云神马","法术防御",
	              "高级神佑复生","高级驱鬼","高级敏捷","理直气壮","苍鸾怒击","嗜血追击","高级连击","高级必杀","天降灵葫","八凶法阵","叱咤风云"}
        bbs[9] = {100,20,20,20,20,20}
	elseif 造型 == "超级小白龙" then
		bbs[1] = 3000 --攻资
		bbs[2] = 3000 --防资
		bbs[3] = 10000 --体资
		bbs[4] = 8000 --法资
		bbs[5] = 3000 --速资
		bbs[6] = 3000 --躲闪
		bbs[7] = 3
	    bbs[8] = {"观照万象","高级必杀","高级强力","高级夜战","高级偷袭","高级吸血","理直气壮","嗜血追击","苍鸾怒击","高级敏捷","大快朵颐","浮云神马",
	              "高级驱鬼","法术防御","高级神佑复生","高级感知","壁垒击破","千钧一怒","力劈华山","善恶有报","剑荡四方","月光","死亡召唤","从天而降"}
	    bbs[9] = {100,20,20,20,20,20}
	elseif 造型 == "超级小白龙_法系" then
		bbs[1] = 3000 --攻资
		bbs[2] = 3000 --防资
		bbs[3] = 10000 --体资
		bbs[4] = 8000 --法资
		bbs[5] = 3000 --速资
		bbs[6] = 3000 --躲闪
		bbs[7] = 3
	    bbs[8] = {"观照万象","高级法术连击","高级法术暴击","高级法术波动","高级魔之心","须弥真言","驱怪","龙魂","灵山禅语","净台妙谛","灵能激发","浮云神马","法术防御",
	              "高级神佑复生","高级驱鬼","高级敏捷","理直气壮","苍鸾怒击","嗜血追击","高级连击","高级必杀","天降灵葫","八凶法阵","叱咤风云"}
        bbs[9] = {100,20,20,20,20,20}
	elseif 造型 == "猪小戒" then
		bbs[1] = 3000 --攻资
		bbs[2] = 3000 --防资
		bbs[3] = 10000 --体资
		bbs[4] = 8000 --法资
		bbs[5] = 3000 --速资
		bbs[6] = 3000 --躲闪
		bbs[7] = 3
	    bbs[8] = {"观照万象","高级必杀","高级强力","高级夜战","高级偷袭","高级吸血","理直气壮","嗜血追击","苍鸾怒击","高级敏捷","大快朵颐","浮云神马",
	              "高级驱鬼","法术防御","高级神佑复生","高级感知","壁垒击破","千钧一怒","力劈华山","善恶有报","剑荡四方","月光","死亡召唤","从天而降"}
	    bbs[9] = {100,20,20,20,20,20}
	elseif 造型 == "猪小戒_法系" then
		bbs[1] = 3000 --攻资
		bbs[2] = 3000 --防资
		bbs[3] = 10000 --体资
		bbs[4] = 8000 --法资
		bbs[5] = 3000 --速资
		bbs[6] = 3000 --躲闪
		bbs[7] = 3
	    bbs[8] = {"观照万象","高级法术连击","高级法术暴击","高级法术波动","高级魔之心","须弥真言","驱怪","龙魂","灵山禅语","净台妙谛","灵能激发","浮云神马","法术防御",
	              "高级神佑复生","高级驱鬼","高级敏捷","理直气壮","苍鸾怒击","嗜血追击","高级连击","高级必杀","天降灵葫","八凶法阵","叱咤风云"}
        bbs[9] = {100,20,20,20,20,20}
	elseif 造型 == "超级猪小戒" then
		bbs[1] = 3000 --攻资
		bbs[2] = 3000 --防资
		bbs[3] = 10000 --体资
		bbs[4] = 8000 --法资
		bbs[5] = 3000 --速资
		bbs[6] = 3000 --躲闪
		bbs[7] = 3
	    bbs[8] = {"观照万象","高级必杀","高级强力","高级夜战","高级偷袭","高级吸血","理直气壮","嗜血追击","苍鸾怒击","高级敏捷","大快朵颐","浮云神马",
	              "高级驱鬼","法术防御","高级神佑复生","高级感知","壁垒击破","千钧一怒","力劈华山","善恶有报","剑荡四方","月光","死亡召唤","从天而降"}
	    bbs[9] = {100,20,20,20,20,20}
	elseif 造型 == "超级猪小戒_法系" then
		bbs[1] = 3000 --攻资
		bbs[2] = 3000 --防资
		bbs[3] = 10000 --体资
		bbs[4] = 8000 --法资
		bbs[5] = 3000 --速资
		bbs[6] = 3000 --躲闪
		bbs[7] = 3
	    bbs[8] = {"观照万象","高级法术连击","高级法术暴击","高级法术波动","高级魔之心","须弥真言","驱怪","龙魂","灵山禅语","净台妙谛","灵能激发","浮云神马","法术防御",
	              "高级神佑复生","高级驱鬼","高级敏捷","理直气壮","苍鸾怒击","嗜血追击","高级连击","高级必杀","天降灵葫","八凶法阵","叱咤风云"}
        bbs[9] = {100,20,20,20,20,20}
	elseif 造型 == "谛听" then
		bbs[1] = 3000 --攻资
		bbs[2] = 3000 --防资
		bbs[3] = 10000 --体资
		bbs[4] = 8000 --法资
		bbs[5] = 3000 --速资
		bbs[6] = 3000 --躲闪
		bbs[7] = 3
	    bbs[8] = {"观照万象","高级必杀","高级强力","高级夜战","高级偷袭","高级吸血","理直气壮","嗜血追击","苍鸾怒击","高级敏捷","大快朵颐","浮云神马",
	              "高级驱鬼","法术防御","高级神佑复生","高级感知","壁垒击破","千钧一怒","力劈华山","善恶有报","剑荡四方","月光","死亡召唤","从天而降"}
	    bbs[9] = {100,20,20,20,20,20}
	elseif 造型 == "谛听_法系" then
		bbs[1] = 3000 --攻资
		bbs[2] = 3000 --防资
		bbs[3] = 10000 --体资
		bbs[4] = 8000 --法资
		bbs[5] = 3000 --速资
		bbs[6] = 3000 --躲闪
		bbs[7] = 3
	    bbs[8] = {"观照万象","高级法术连击","高级法术暴击","高级法术波动","高级魔之心","须弥真言","驱怪","龙魂","灵山禅语","净台妙谛","灵能激发","浮云神马","法术防御",
	              "高级神佑复生","高级驱鬼","高级敏捷","理直气壮","苍鸾怒击","嗜血追击","高级连击","高级必杀","天降灵葫","八凶法阵","叱咤风云"}
        bbs[9] = {100,20,20,20,20,20}
	elseif 造型 == "进阶谛听" then
		bbs[1] = 3000 --攻资
		bbs[2] = 3000 --防资
		bbs[3] = 10000 --体资
		bbs[4] = 8000 --法资
		bbs[5] = 3000 --速资
		bbs[6] = 3000 --躲闪
		bbs[7] = 3
	    bbs[8] = {"观照万象","高级必杀","高级强力","高级夜战","高级偷袭","高级吸血","理直气壮","嗜血追击","苍鸾怒击","高级敏捷","大快朵颐","浮云神马",
	              "高级驱鬼","法术防御","高级神佑复生","高级感知","壁垒击破","千钧一怒","力劈华山","善恶有报","剑荡四方","月光","死亡召唤","从天而降"}
	    bbs[9] = {100,20,20,20,20,20}
	elseif 造型 == "进阶谛听_法系" then
		bbs[1] = 3000 --攻资
		bbs[2] = 3000 --防资
		bbs[3] = 10000 --体资
		bbs[4] = 8000 --法资
		bbs[5] = 3000 --速资
		bbs[6] = 3000 --躲闪
		bbs[7] = 3
	    bbs[8] = {"观照万象","高级法术连击","高级法术暴击","高级法术波动","高级魔之心","须弥真言","驱怪","龙魂","灵山禅语","净台妙谛","灵能激发","浮云神马","法术防御",
	              "高级神佑复生","高级驱鬼","高级敏捷","理直气壮","苍鸾怒击","嗜血追击","高级连击","高级必杀","天降灵葫","八凶法阵","叱咤风云"}
        bbs[9] = {100,20,20,20,20,20}
	elseif 造型 == "狐不归" then
		bbs[1] = 3000 --攻资
		bbs[2] = 3000 --防资
		bbs[3] = 10000 --体资
		bbs[4] = 8000 --法资
		bbs[5] = 3000 --速资
		bbs[6] = 3000 --躲闪
		bbs[7] = 3
	    bbs[8] = {"观照万象","高级必杀","高级强力","高级夜战","高级偷袭","高级吸血","理直气壮","嗜血追击","苍鸾怒击","高级敏捷","大快朵颐","浮云神马",
	              "高级驱鬼","法术防御","高级神佑复生","高级感知","壁垒击破","千钧一怒","力劈华山","善恶有报","剑荡四方","月光","死亡召唤","从天而降"}
	    bbs[9] = {100,20,20,20,20,20}
	elseif 造型 == "狐不归_法系" then
		bbs[1] = 3000 --攻资
		bbs[2] = 3000 --防资
		bbs[3] = 10000 --体资
		bbs[4] = 8000 --法资
		bbs[5] = 3000 --速资
		bbs[6] = 3000 --躲闪
		bbs[7] = 3
	    bbs[8] = {"观照万象","高级法术连击","高级法术暴击","高级法术波动","高级魔之心","须弥真言","驱怪","龙魂","灵山禅语","净台妙谛","灵能激发","浮云神马","法术防御",
	              "高级神佑复生","高级驱鬼","高级敏捷","理直气壮","苍鸾怒击","嗜血追击","高级连击","高级必杀","天降灵葫","八凶法阵","叱咤风云"}
        bbs[9] = {100,20,20,20,20,20}
	elseif 造型 == "进阶狐不归" then
		bbs[1] = 3000 --攻资
		bbs[2] = 3000 --防资
		bbs[3] = 10000 --体资
		bbs[4] = 8000 --法资
		bbs[5] = 3000 --速资
		bbs[6] = 3000 --躲闪
		bbs[7] = 3
	    bbs[8] = {"观照万象","高级必杀","高级强力","高级夜战","高级偷袭","高级吸血","理直气壮","嗜血追击","苍鸾怒击","高级敏捷","大快朵颐","浮云神马",
	              "高级驱鬼","法术防御","高级神佑复生","高级感知","壁垒击破","千钧一怒","力劈华山","善恶有报","剑荡四方","月光","死亡召唤","从天而降"}
	    bbs[9] = {100,20,20,20,20,20}
	elseif 造型 == "进阶狐不归_法系" then
		bbs[1] = 3000 --攻资
		bbs[2] = 3000 --防资
		bbs[3] = 10000 --体资
		bbs[4] = 8000 --法资
		bbs[5] = 3000 --速资
		bbs[6] = 3000 --躲闪
		bbs[7] = 3
	    bbs[8] = {"观照万象","高级法术连击","高级法术暴击","高级法术波动","高级魔之心","须弥真言","驱怪","龙魂","灵山禅语","净台妙谛","灵能激发","浮云神马","法术防御",
	              "高级神佑复生","高级驱鬼","高级敏捷","理直气壮","苍鸾怒击","嗜血追击","高级连击","高级必杀","天降灵葫","八凶法阵","叱咤风云"}
        bbs[9] = {100,20,20,20,20,20}
	elseif 造型 == "花灵" then
		bbs[1] = 3000 --攻资
		bbs[2] = 3000 --防资
		bbs[3] = 10000 --体资
		bbs[4] = 8000 --法资
		bbs[5] = 3000 --速资
		bbs[6] = 3000 --躲闪
		bbs[7] = 3
	    bbs[8] = {"观照万象","高级必杀","高级强力","高级夜战","高级偷袭","高级吸血","理直气壮","嗜血追击","苍鸾怒击","高级敏捷","大快朵颐","浮云神马",
	              "高级驱鬼","法术防御","高级神佑复生","高级感知","壁垒击破","千钧一怒","力劈华山","善恶有报","剑荡四方","月光","死亡召唤","从天而降"}
	    bbs[9] = {100,20,20,20,20,20}
	elseif 造型 == "花灵_法系" then
		bbs[1] = 3000 --攻资
		bbs[2] = 3000 --防资
		bbs[3] = 10000 --体资
		bbs[4] = 8000 --法资
		bbs[5] = 3000 --速资
		bbs[6] = 3000 --躲闪
		bbs[7] = 3
	    bbs[8] = {"观照万象","高级法术连击","高级法术暴击","高级法术波动","高级魔之心","须弥真言","驱怪","龙魂","灵山禅语","净台妙谛","灵能激发","浮云神马","法术防御",
	              "高级神佑复生","高级驱鬼","高级敏捷","理直气壮","苍鸾怒击","嗜血追击","高级连击","高级必杀","天降灵葫","八凶法阵","叱咤风云"}
        bbs[9] = {100,20,20,20,20,20}
	elseif 造型 == "进阶花灵" then
		bbs[1] = 3000 --攻资
		bbs[2] = 3000 --防资
		bbs[3] = 10000 --体资
		bbs[4] = 8000 --法资
		bbs[5] = 3000 --速资
		bbs[6] = 3000 --躲闪
		bbs[7] = 3
	    bbs[8] = {"观照万象","高级必杀","高级强力","高级夜战","高级偷袭","高级吸血","理直气壮","嗜血追击","苍鸾怒击","高级敏捷","大快朵颐","浮云神马",
	              "高级驱鬼","法术防御","高级神佑复生","高级感知","壁垒击破","千钧一怒","力劈华山","善恶有报","剑荡四方","月光","死亡召唤","从天而降"}
	    bbs[9] = {100,20,20,20,20,20}
	elseif 造型 == "进阶花灵_法系" then
		bbs[1] = 3000 --攻资
		bbs[2] = 3000 --防资
		bbs[3] = 10000 --体资
		bbs[4] = 8000 --法资
		bbs[5] = 3000 --速资
		bbs[6] = 3000 --躲闪
		bbs[7] = 3
	    bbs[8] = {"观照万象","高级法术连击","高级法术暴击","高级法术波动","高级魔之心","须弥真言","驱怪","龙魂","灵山禅语","净台妙谛","灵能激发","浮云神马","法术防御",
	              "高级神佑复生","高级驱鬼","高级敏捷","理直气壮","苍鸾怒击","嗜血追击","高级连击","高级必杀","天降灵葫","八凶法阵","叱咤风云"}
        bbs[9] = {100,20,20,20,20,20}
	elseif 造型 == "涂山雪" then
		bbs[1] = 3000 --攻资
		bbs[2] = 3000 --防资
		bbs[3] = 10000 --体资
		bbs[4] = 8000 --法资
		bbs[5] = 3000 --速资
		bbs[6] = 3000 --躲闪
		bbs[7] = 3
	    bbs[8] = {"观照万象","高级必杀","高级强力","高级夜战","高级偷袭","高级吸血","理直气壮","嗜血追击","苍鸾怒击","高级敏捷","大快朵颐","浮云神马",
	              "高级驱鬼","法术防御","高级神佑复生","高级感知","壁垒击破","千钧一怒","力劈华山","善恶有报","剑荡四方","月光","死亡召唤","从天而降"}
	    bbs[9] = {100,20,20,20,20,20}
	elseif 造型 == "涂山雪_法系" then
		bbs[1] = 3000 --攻资
		bbs[2] = 3000 --防资
		bbs[3] = 10000 --体资
		bbs[4] = 8000 --法资
		bbs[5] = 3000 --速资
		bbs[6] = 3000 --躲闪
		bbs[7] = 3
	    bbs[8] = {"观照万象","高级法术连击","高级法术暴击","高级法术波动","高级魔之心","须弥真言","驱怪","龙魂","灵山禅语","净台妙谛","灵能激发","浮云神马","法术防御",
	              "高级神佑复生","高级驱鬼","高级敏捷","理直气壮","苍鸾怒击","嗜血追击","高级连击","高级必杀","天降灵葫","八凶法阵","叱咤风云"}
        bbs[9] = {100,20,20,20,20,20}
	elseif 造型 == "进阶涂山雪" then
		bbs[1] = 3000 --攻资
		bbs[2] = 3000 --防资
		bbs[3] = 10000 --体资
		bbs[4] = 8000 --法资
		bbs[5] = 3000 --速资
		bbs[6] = 3000 --躲闪
		bbs[7] = 3
	    bbs[8] = {"观照万象","高级必杀","高级强力","高级夜战","高级偷袭","高级吸血","理直气壮","嗜血追击","苍鸾怒击","高级敏捷","大快朵颐","浮云神马",
	              "高级驱鬼","法术防御","高级神佑复生","高级感知","壁垒击破","千钧一怒","力劈华山","善恶有报","剑荡四方","月光","死亡召唤","从天而降"}
	    bbs[9] = {100,20,20,20,20,20}
	elseif 造型 == "进阶涂山雪_法系" then
		bbs[1] = 3000 --攻资
		bbs[2] = 3000 --防资
		bbs[3] = 10000 --体资
		bbs[4] = 8000 --法资
		bbs[5] = 3000 --速资
		bbs[6] = 3000 --躲闪
		bbs[7] = 3
	    bbs[8] = {"观照万象","高级法术连击","高级法术暴击","高级法术波动","高级魔之心","须弥真言","驱怪","龙魂","灵山禅语","净台妙谛","灵能激发","浮云神马","法术防御",
	              "高级神佑复生","高级驱鬼","高级敏捷","理直气壮","苍鸾怒击","嗜血追击","高级连击","高级必杀","天降灵葫","八凶法阵","叱咤风云"}
        bbs[9] = {100,20,20,20,20,20}
	elseif 造型 == "月魅" then
		bbs[1] = 3000 --攻资
		bbs[2] = 3000 --防资
		bbs[3] = 10000 --体资
		bbs[4] = 8000 --法资
		bbs[5] = 3000 --速资
		bbs[6] = 3000 --躲闪
		bbs[7] = 3
	    bbs[8] = {"观照万象","高级必杀","高级强力","高级夜战","高级偷袭","高级吸血","理直气壮","嗜血追击","苍鸾怒击","高级敏捷","大快朵颐","浮云神马",
	              "高级驱鬼","法术防御","高级神佑复生","高级感知","壁垒击破","千钧一怒","力劈华山","善恶有报","剑荡四方","月光","死亡召唤","从天而降"}
	    bbs[9] = {100,20,20,20,20,20}
	elseif 造型 == "月魅_法系" then
		bbs[1] = 3000 --攻资
		bbs[2] = 3000 --防资
		bbs[3] = 10000 --体资
		bbs[4] = 8000 --法资
		bbs[5] = 3000 --速资
		bbs[6] = 3000 --躲闪
		bbs[7] = 3
	    bbs[8] = {"观照万象","高级法术连击","高级法术暴击","高级法术波动","高级魔之心","须弥真言","驱怪","龙魂","灵山禅语","净台妙谛","灵能激发","浮云神马","法术防御",
	              "高级神佑复生","高级驱鬼","高级敏捷","理直气壮","苍鸾怒击","嗜血追击","高级连击","高级必杀","天降灵葫","八凶法阵","叱咤风云"}
        bbs[9] = {100,20,20,20,20,20}
    elseif 造型 == "进阶月魅" then
		bbs[1] = 3000 --攻资
		bbs[2] = 3000 --防资
		bbs[3] = 10000 --体资
		bbs[4] = 8000 --法资
		bbs[5] = 3000 --速资
		bbs[6] = 3000 --躲闪
		bbs[7] = 3
	    bbs[8] = {"观照万象","高级必杀","高级强力","高级夜战","高级偷袭","高级吸血","理直气壮","嗜血追击","苍鸾怒击","高级敏捷","大快朵颐","浮云神马",
	              "高级驱鬼","法术防御","高级神佑复生","高级感知","壁垒击破","千钧一怒","力劈华山","善恶有报","剑荡四方","津津有味","死亡召唤","从天而降"}
	    bbs[9] = {100,20,20,20,20,20}
	elseif 造型 == "进阶月魅_法系" then
		bbs[1] = 3000 --攻资
		bbs[2] = 3000 --防资
		bbs[3] = 10000 --体资
		bbs[4] = 8000 --法资
		bbs[5] = 3000 --速资
		bbs[6] = 3000 --躲闪
		bbs[7] = 3
	    bbs[8] = {"观照万象","高级法术连击","高级法术暴击","高级法术波动","高级魔之心","须弥真言","驱怪","龙魂","灵山禅语","净台妙谛","灵能激发","浮云神马","法术防御",
	              "高级神佑复生","高级驱鬼","高级敏捷","理直气壮","苍鸾怒击","嗜血追击","高级连击","高级必杀","天降灵葫","八凶法阵","叱咤风云"}
        bbs[9] = {100,20,20,20,20,20}
	elseif 造型 == "月影仙" then
		bbs[1] = 3000 --攻资
		bbs[2] = 3000 --防资
		bbs[3] = 10000 --体资
		bbs[4] = 8000 --法资
		bbs[5] = 3000 --速资
		bbs[6] = 3000 --躲闪
		bbs[7] = 3
	    bbs[8] = {"观照万象","高级必杀","高级强力","高级夜战","高级偷袭","高级吸血","理直气壮","嗜血追击","苍鸾怒击","高级敏捷","大快朵颐","浮云神马",
	              "高级驱鬼","法术防御","高级神佑复生","高级感知","壁垒击破","千钧一怒","力劈华山","善恶有报","剑荡四方","月光","死亡召唤","从天而降"}
	    bbs[9] = {100,20,20,20,20,20}
	elseif 造型 == "月影仙_法系" then
		bbs[1] = 3000 --攻资
		bbs[2] = 3000 --防资
		bbs[3] = 10000 --体资
		bbs[4] = 8000 --法资
		bbs[5] = 3000 --速资
		bbs[6] = 3000 --躲闪
		bbs[7] = 3
	    bbs[8] = {"观照万象","高级法术连击","高级法术暴击","高级法术波动","高级魔之心","须弥真言","驱怪","龙魂","灵山禅语","净台妙谛","灵能激发","浮云神马","法术防御",
	              "高级神佑复生","高级驱鬼","高级敏捷","理直气壮","苍鸾怒击","嗜血追击","高级连击","高级必杀","天降灵葫","八凶法阵","叱咤风云"}
        bbs[9] = {100,20,20,20,20,20}
	elseif 造型 == "进阶月影仙" then
		bbs[1] = 3000 --攻资
		bbs[2] = 3000 --防资
		bbs[3] = 10000 --体资
		bbs[4] = 8000 --法资
		bbs[5] = 3000 --速资
		bbs[6] = 3000 --躲闪
		bbs[7] = 3
	    bbs[8] = {"观照万象","高级必杀","高级强力","高级夜战","高级偷袭","高级吸血","理直气壮","嗜血追击","苍鸾怒击","高级敏捷","大快朵颐","浮云神马",
	              "高级驱鬼","法术防御","高级神佑复生","高级感知","壁垒击破","千钧一怒","力劈华山","善恶有报","剑荡四方","月光","死亡召唤","从天而降"}
	    bbs[9] = {100,20,20,20,20,20}
	elseif 造型 == "进阶月影仙_法系" then
		bbs[1] = 3000 --攻资
		bbs[2] = 3000 --防资
		bbs[3] = 10000 --体资
		bbs[4] = 8000 --法资
		bbs[5] = 3000 --速资
		bbs[6] = 3000 --躲闪
		bbs[7] = 3
	    bbs[8] = {"观照万象","高级法术连击","高级法术暴击","高级法术波动","高级魔之心","须弥真言","驱怪","龙魂","灵山禅语","净台妙谛","灵能激发","浮云神马","法术防御",
	              "高级神佑复生","高级驱鬼","高级敏捷","理直气壮","苍鸾怒击","嗜血追击","高级连击","高级必杀","天降灵葫","八凶法阵","叱咤风云"}
        bbs[9] = {100,20,20,20,20,20}
	elseif 造型 == "云游火" then
		bbs[1] = 3000 --攻资
		bbs[2] = 3000 --防资
		bbs[3] = 10000 --体资
		bbs[4] = 8000 --法资
		bbs[5] = 3000 --速资
		bbs[6] = 3000 --躲闪
		bbs[7] = 3
	    bbs[8] = {"观照万象","高级必杀","高级强力","高级夜战","高级偷袭","高级吸血","理直气壮","嗜血追击","苍鸾怒击","高级敏捷","大快朵颐","浮云神马",
	              "高级驱鬼","法术防御","高级神佑复生","高级感知","壁垒击破","千钧一怒","力劈华山","善恶有报","剑荡四方","月光","死亡召唤","从天而降"}
	    bbs[9] = {100,20,20,20,20,20}
	elseif 造型 == "云游火_法系" then
		bbs[1] = 3000 --攻资
		bbs[2] = 3000 --防资
		bbs[3] = 10000 --体资
		bbs[4] = 8000 --法资
		bbs[5] = 3000 --速资
		bbs[6] = 3000 --躲闪
		bbs[7] = 3
	    bbs[8] = {"观照万象","高级法术连击","高级法术暴击","高级法术波动","高级魔之心","须弥真言","驱怪","龙魂","灵山禅语","净台妙谛","灵能激发","浮云神马","法术防御",
	              "高级神佑复生","高级驱鬼","高级敏捷","理直气壮","苍鸾怒击","嗜血追击","高级连击","高级必杀","天降灵葫","八凶法阵","叱咤风云"}
        bbs[9] = {100,20,20,20,20,20}
	elseif 造型 == "进阶云游火" then
		bbs[1] = 3000 --攻资
		bbs[2] = 3000 --防资
		bbs[3] = 10000 --体资
		bbs[4] = 8000 --法资
		bbs[5] = 3000 --速资
		bbs[6] = 3000 --躲闪
		bbs[7] = 3
	    bbs[8] = {"观照万象","高级必杀","高级强力","高级夜战","高级偷袭","高级吸血","理直气壮","嗜血追击","苍鸾怒击","高级敏捷","大快朵颐","浮云神马",
	              "高级驱鬼","法术防御","高级神佑复生","高级感知","壁垒击破","千钧一怒","力劈华山","善恶有报","剑荡四方","月光","死亡召唤","从天而降"}
	    bbs[9] = {100,20,20,20,20,20}
	elseif 造型 == "进阶云游火_法系" then
		bbs[1] = 3000 --攻资
		bbs[2] = 3000 --防资
		bbs[3] = 10000 --体资
		bbs[4] = 8000 --法资
		bbs[5] = 3000 --速资
		bbs[6] = 3000 --躲闪
		bbs[7] = 3
	    bbs[8] = {"观照万象","高级法术连击","高级法术暴击","高级法术波动","高级魔之心","须弥真言","驱怪","龙魂","灵山禅语","净台妙谛","灵能激发","浮云神马","法术防御",
	              "高级神佑复生","高级驱鬼","高级敏捷","理直气壮","苍鸾怒击","嗜血追击","高级连击","高级必杀","天降灵葫","八凶法阵","叱咤风云"}
        bbs[9] = {100,20,20,20,20,20}
	elseif 造型 == "新手召唤兽" then
		bbs[1] = 1400 --攻资
		bbs[2] = 1400 --防资
		bbs[3] = 4400 --体资
		bbs[4] = 2400 --法资
		bbs[5] = 1400 --速资
		bbs[6] = 1400 --躲闪
		bbs[7] = 1.1
	    bbs[8] = {"水漫金山","魔之心","法术暴击","法术波动","法术连击"}
	    bbs[9] = {100,20,20,20,20,20}
	 elseif 造型 == "古代瑞兽" then
		bbs[1] = 1330
		bbs[2] = 1386
		bbs[3] = 3960
		bbs[4] = 2754
		bbs[5] = 1518
		bbs[6] = 1320
		bbs[7] = 1.173
	    bbs[8] = {"高级神迹","高级反震","泰山压顶","高级驱鬼"}
	    bbs[9] = {100,15,15,15,15,15}
	end
	return  bbs
end

function 取VIP召唤兽(造型,物法)
	local bbs = {}
	if 造型 == "超级神龙" then
		bbs[1] = 1850 --攻资
		bbs[2] = 1850 --防资
		bbs[3] = 6000 --体资
		bbs[4] = 4000 --法资
		bbs[5] = 1700 --速资
		bbs[6] = 1500 --躲闪
		bbs[7] = 1.5
	    bbs[8] = {"高级必杀","高级驱鬼","高级夜战","幸运","强力"}
	    bbs[9] = {100,20,20,20,20,20}
	elseif 造型 == "超级腾蛇" then
		bbs[1] = 1850 --攻资
		bbs[2] = 1850 --防资
		bbs[3] = 6000 --体资
		bbs[4] = 4000 --法资
		bbs[5] = 1700 --速资
		bbs[6] = 1500 --躲闪
		bbs[7] = 1.5
	    bbs[8] = {"高级连击","高级毒","高级夜战","偷袭","敏捷"}
	    bbs[9] = {100,20,20,20,20,20}
	end
	return bbs
end