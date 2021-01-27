--======================================================================--
-- @作者: GGE研究群: 342119466
-- @创建时间:   2018-03-03 02:34:19
-- @Last Modified time: 2020-05-15 15:59:36
--======================================================================--
function 引擎.取宝宝(bb,类型)
	local bbs = {}
	if 类型=="神兽" then
        bbs[1] = 0
		bbs[2] = 1850
		bbs[3] = 1600
		bbs[4] = 6000
		bbs[5] = 4000
		bbs[6] = 1400
		bbs[7] = 1400
		bbs[8] = {1.37,1.37,1.37,1.37,1.37}
	    bbs[9] = {"迟钝","强力","防御","高级反击","高级必杀"}
	    if 取随机数()<=50 then
          bb=bb.."（物理型）"
        else
       	  bb=bb.."（法术型）"
	    end
	end
	if bb == "老虎" then
	    bbs[1] = 15
		bbs[2] = 1080
		bbs[3] = 1140
		bbs[4] = 2520
		bbs[5] = 1800
		bbs[6] = 1500
		bbs[7] = 1500
		bbs[8] = {1.058,1.069,1.08,1.09,1.101}
	    bbs[9] = {"连击","驱鬼","幸运","强力"}
	elseif bb == "白熊" then
	    bbs[1] = 45
		bbs[2] = 1320
		bbs[3] = 1320
		bbs[4] = 5280
		bbs[5] = 1800
		bbs[6] = 960
		bbs[7] = 1380
		bbs[8] = {1.097,1.108,1.12,1.131,1.142}
	    bbs[9] = {"迟钝","强力","防御","高级反击","高级必杀"}
	elseif bb == "虾兵" then
	    bbs[1] = 25
		bbs[2] = 1200
		bbs[3] = 1380
		bbs[4] = 4800
		bbs[5] = 2400
		bbs[6] = 1080
		bbs[7] = 1140
		bbs[8] = {1.014,1.024,1.035,1.045,1.055}
	    bbs[9] = {"高级反击","高级必杀","驱鬼","水属性吸收"}
  	elseif bb == "狼" then
	    bbs[1] = 25
		bbs[2] = 1500
		bbs[3] = 1120
		bbs[4] = 3200
		bbs[5] = 1140
		bbs[6] = 1320
		bbs[7] = 1160
		bbs[8] = {1.058,1.069,1.08,1.09,1.101}
	    bbs[9] = {"高级连击","驱鬼","驱鬼","连击","偷袭"}
	elseif bb == "进阶鬼将" then
	    bbs[1] = 0
		bbs[2] = 1660
		bbs[3] = 1313
		bbs[4] = 4514
		bbs[5] = 1525
		bbs[6] = 1432
		bbs[7] = 1251
		bbs[8] = {1.21,1.24,1.26,1.28,1.3}
	    bbs[9] = {"高级必杀","高级连击","吸血","高级偷袭","高级反震","嗜血追击","高级夜战"}
	elseif bb == "噬天虎" then
	    bbs[1] = 125
		bbs[2] = 1500
		bbs[3] = 1440
		bbs[4] = 4800
		bbs[5] = 2400
		bbs[6] = 1500
		bbs[7] = 1600
		bbs[8] = {1.215,1.227,1.24,1.252,1.264}
	    bbs[9] = {"高级连击","驱鬼","幸运","高级强力"}
	elseif bb == "雨师" then
	    bbs[1] = 65
		bbs[2] = 1200
		bbs[3] = 1380
		bbs[4] = 4200
		bbs[5] = 3424
		bbs[6] = 1440
		bbs[7] = 1618
		bbs[8] = {1.156,1.168,1.18,1.191,1.203}
	    bbs[9] = {"水攻","烈火","高级雷属性吸收","高级水属性吸收","高级土属性吸收","高级火属性吸收"}
	elseif bb == "牛头" then
	    bbs[1] = 35
		bbs[2] = 1320
		bbs[3] = 1320
		bbs[4] = 3600
		bbs[5] = 1800
		bbs[6] = 1400
		bbs[7] = 1200
		bbs[8] = {1.058,1.069,1.08,1.09,1.101}
	    bbs[9] = {"驱鬼","高级必杀","招架","高级鬼魂术","驱怪"}
	elseif bb == "骷髅怪" then
	    bbs[1] = 15
		bbs[2] = 1260
		bbs[3] = 1380
		bbs[4] = 3360
		bbs[5] = 1320
		bbs[6] = 1200
		bbs[7] = 1200
		bbs[8] = {1.004,1.014,1.025,1.035,1.045}
	    bbs[9] = {"土属性吸收","弱点雷","鬼魂术","驱怪"}
	elseif bb == "祥瑞腾蛇" then
	    bbs[1] = 0
		bbs[2] = 1400
		bbs[3] = 1400
		bbs[4] = 4500
		bbs[5] = 2500
		bbs[6] = 1200
		bbs[7] = 1200
		bbs[8] = {1.25,1.25,1.25,1.25,1.25}
	    bbs[9] = {}
	elseif bb == "修罗傀儡鬼" then
	    bbs[1] = 155
		bbs[2] = 1524
		bbs[3] = 1380
		bbs[4] = 5040
		bbs[5] = 2400
		bbs[6] = 1440
		bbs[7] = 1440
		bbs[8] = {1.244,1.257,1.27,1.282,1.295}
	    bbs[9] = {"高级夜战","反震","高级必杀","强力","嗜血追击"}
	elseif bb == "树怪" then
	    bbs[1] = 5
		bbs[2] = 1320
		bbs[3] = 1320
		bbs[4] = 3300
		bbs[5] = 1320
		bbs[6] = 900
		bbs[7] = 960
		bbs[8] = {0.882,0.891,0.9,0.909,0.918}
	    bbs[9] = {"反击","感知","驱鬼","再生","烈火","弱点火","迟钝"}
	elseif bb == "羊头怪" then
	    bbs[1] = 15
		bbs[2] = 1260
		bbs[3] = 1380
		bbs[4] = 3360
		bbs[5] = 1320
		bbs[6] = 1200
		bbs[7] = 1200
		bbs[8] = {1.004,1.014,1.025,1.035,1.045}
	    bbs[9] = {"连击","必杀","幸运","永恒"}
	elseif bb == "海毛虫" then
	    bbs[1] = 5
		bbs[2] = 1440
		bbs[3] = 900
		bbs[4] = 2400
		bbs[5] = 1200
		bbs[6] = 1320
		bbs[7] = 1200
		bbs[8] = {0.989,0.999,1.01,1.02,1.03}
	    bbs[9] = {"毒","高级反震","必杀","驱怪","弱点火"}
	elseif bb == "野猪" then
	    bbs[1] = 5
		bbs[2] = 1320
		bbs[3] = 1320
		bbs[4] = 3300
		bbs[5] = 1320
		bbs[6] = 900
		bbs[7] = 960
		bbs[8] = {0.999,1.009,1.02,1.03,1.04}
	    bbs[9] = {"感知","高级感知","高级幸运","强力","弱点土","弱点火"}
	elseif bb == "天兵" then
	    bbs[1] = 55
		bbs[2] = 1400
		bbs[3] = 1500
		bbs[4] = 5100
		bbs[5] = 2319
		bbs[6] = 1368
		bbs[7] = 1320
		bbs[8] = {1.127,1.138,1.15,1.161,1.173}
	    bbs[9] = {"高级防御","高级感知","必杀","高级驱鬼"}
	elseif bb == "野猪精" then
	    bbs[1] = 85
		bbs[2] = 1464
		bbs[3] = 1560
		bbs[4] = 4800
		bbs[5] = 2400
		bbs[6] = 1200
		bbs[7] = 1320
		bbs[8] = {1.205,1.217,1.23,1.242,1.254}
	    bbs[9] = {"反击","感知","弱点水","高级强力"}
	elseif bb == "灵灯侍者" then
	    bbs[1] = 175
		bbs[2] = 1440
		bbs[3] = 1440
		bbs[4] = 4800
		bbs[5] = 2800
		bbs[6] = 1500
		bbs[7] = 1440
		bbs[8] = {1.264,1.277,1.29,1.3,1.31}
	    bbs[9] = {"奔雷咒","须弥真言","法术暴击","法术连击"}
	elseif bb == "赌徒" then
	    bbs[1] = 5
		bbs[2] = 1020
		bbs[3] = 1140
		bbs[4] = 3000
		bbs[5] = 1440
		bbs[6] = 1440
		bbs[7] = 1380
		bbs[8] = {0.931,0.94,0.95,0.959,0.969}
	    bbs[9] = {"反击","偷袭"}
	elseif bb == "野鬼" then
	    bbs[1] = 35
		bbs[2] = 1320
		bbs[3] = 1320
		bbs[4] = 4200
		bbs[5] = 1200
		bbs[6] = 1140
		bbs[7] = 1260
		bbs[8] = {0.994,1.004,1.015,1.025,1.035}
	    bbs[9] = {"落岩","弱点雷","鬼魂术","驱怪"}
	elseif bb == "修罗傀儡妖" then
	    bbs[1] = 165
		bbs[2] = 1536
		bbs[3] = 1380
		bbs[4] = 4800
		bbs[5] = 2400
		bbs[6] = 1500
		bbs[7] = 1440
		bbs[8] = {1.254,1.267,1.28,1.292,1.3}
	    bbs[9] = {"合纵","感知","高级幸运","高级连击"}
	elseif bb == "连弩车" then
	    bbs[1] = 145
		bbs[2] = 1500
		bbs[3] = 1560
		bbs[4] = 5400
		bbs[5] = 2400
		bbs[6] = 1200
		bbs[7] = 1320
		bbs[8] = {1.235,1.247,1.26,1.273,1.285}
	    bbs[9] = {"高级强力","防御","连击","迟钝"}
	elseif bb == "黑熊精" then
	    bbs[1] = 35
		bbs[2] = 1380
		bbs[3] = 1260
		bbs[4] = 5040
		bbs[5] = 2160
		bbs[6] = 1020
		bbs[7] = 1320
		bbs[8] = {1.038,1.049,1.06,1.07,1.081}
	    bbs[9] = {"反震","必杀","幸运","高级强力","弱点雷"}
	elseif bb == "金身罗汉" then
	    bbs[1] = 165
		bbs[2] = 1380
		bbs[3] = 1500
		bbs[4] = 5400
		bbs[5] = 2400
		bbs[6] = 1560
		bbs[7] = 1440
		bbs[8] = {1.254,1.267,1.28,1.292,1.3}
	    bbs[9] = {"永恒","高级反震","神佑复生","盾气","高级敏捷"}
	elseif bb == "犀牛将军人形" then
	    bbs[1] = 75
		bbs[2] = 1440
		bbs[3] = 1464
		bbs[4] = 4800
		bbs[5] = 2520
		bbs[6] = 1200
		bbs[7] = 1140
		bbs[8] = {1.205,1.217,1.23,1.242,1.254}
	    bbs[9] = {"高级强力","高级幸运","剑荡四方","再生"}
	elseif bb == "大海龟" then
	    bbs[1] = 0
		bbs[2] = 960
		bbs[3] = 960
		bbs[4] = 3600
		bbs[5] = 1200
		bbs[6] = 840
		bbs[7] = 1320
		bbs[8] = {0.882,0.891,0.9,0.909,0.918}
	    bbs[9] = {"反震","慧根","幸运","水属性吸收","防御"}
	elseif bb == "曼珠沙华" then
	    bbs[1] = 165
		bbs[2] = 1440
		bbs[3] = 1440
		bbs[4] = 4800
		bbs[5] = 2800
		bbs[6] = 1500
		bbs[7] = 1440
		bbs[8] = {1.254,1.267,1.28,1.292,1.3}
	    bbs[9] = {"奔雷咒","魔之心","反震","法术连击","高级再生"}
	elseif bb == "长眉灵猴" then
	    bbs[1] = 155
		bbs[2] = 1440
		bbs[3] = 1500
		bbs[4] = 5640
		bbs[5] = 3240
		bbs[6] = 1200
		bbs[7] = 1560
		bbs[8] = {1.244,1.257,1.27,1.282,1.295}
	    bbs[9] = {"奔雷咒","高级法术暴击","冥思","高级再生"}
	elseif bb == "护卫" then
	    bbs[1] = 0
		bbs[2] = 1140
		bbs[3] = 1020
		bbs[4] = 2700
		bbs[5] = 1800
		bbs[6] = 1200
		bbs[7] = 1200
		bbs[8] = {0.931,0.94,0.95,0.959,0.969}
	    bbs[9] = {"反击","必杀","强力"}
	elseif bb == "巨力神猿" then
	    bbs[1] = 155
		bbs[2] = 1500
		bbs[3] = 1440
		bbs[4] = 4560
		bbs[5] = 2640
		bbs[6] = 1500
		bbs[7] = 1560
		bbs[8] = {1.244,1.257,1.27,1.282,1.295}
	    bbs[9] = {"敏捷","高级盾气","高级连击","强力","高级驱鬼"}
	elseif bb == "章鱼" then
	    bbs[1] = 0
		bbs[2] = 1440
		bbs[3] = 840
		bbs[4] = 2400
		bbs[5] = 1200
		bbs[6] = 1320
		bbs[7] = 1200
		bbs[8] = {0.989,0.999,1.01,1.02,1.03}
	    bbs[9] = {"连击","毒","吸血","水属性吸收","弱点火"}
	elseif bb == "蔓藤妖花" then
	    bbs[1] = 155
		bbs[2] = 1464
		bbs[3] = 1440
		bbs[4] = 4560
		bbs[5] = 3120
		bbs[6] = 1200
		bbs[7] = 1440
		bbs[8] = {1.244,1.257,1.27,1.282,1.295}
	    bbs[9] = {"灵能激发","落岩","高级招架","高级法术连击"}
	elseif bb == "金饶僧" then
	    bbs[1] = 125
		bbs[2] = 1550
		bbs[3] = 1500
		bbs[4] = 4800
		bbs[5] = 2400
		bbs[6] = 1500
		bbs[7] = 1500
		bbs[8] = {1.215,1.227,1.24,1.252,1.264}
	    bbs[9] = {"再生","必杀","招架","偷袭","高级防御"}
	elseif bb == "大力金刚" then
	    bbs[1] = 125
		bbs[2] = 1548
		bbs[3] = 1334
		bbs[4] = 6000
		bbs[5] = 2640
		bbs[6] = 1200
		bbs[7] = 1200
		bbs[8] = {1.215,1.227,1.24,1.252,1.264}
	    bbs[9] = {"高级强力","泰山压顶","力劈华山","高级永恒"}
	elseif bb == "花妖" then
	    bbs[1] = 15
		bbs[2] = 1020
		bbs[3] = 1440
		bbs[4] = 3780
		bbs[5] = 1440
		bbs[6] = 1140
		bbs[7] = 1140
		bbs[8] = {1.029,1.039,1.05,1.06,1.071}
	    bbs[9] = {"感知","慧根","落岩","防御","水属性吸收"}
	elseif bb == "蜃气妖" then
	    bbs[1] = 155
		bbs[2] = 1464
		bbs[3] = 1440
		bbs[4] = 5040
		bbs[5] = 3240
		bbs[6] = 1320
		bbs[7] = 1440
		bbs[8] = {1.244,1.257,1.27,1.282,1.295}
	    bbs[9] = {"高级法术连击","雷击","法术暴击","上古灵符"}
	elseif bb == "猫灵人形" then
	    bbs[1] = 155
		bbs[2] = 1524
		bbs[3] = 1464
		bbs[4] = 4560
		bbs[5] = 2640
		bbs[6] = 1500
		bbs[7] = 1680
		bbs[8] = {1.244,1.257,1.27,1.282,1.295}
	    bbs[9] = {"必杀","高级幸运","高级偷袭","反击","敏捷"}
	elseif bb == "蚌精" then
	    bbs[1] = 65
		bbs[2] = 1200
		bbs[3] = 1500
		bbs[4] = 3840
		bbs[5] = 2880
		bbs[6] = 1200
		bbs[7] = 1140
		bbs[8] = {1.176,1.188,1.2,1.212,1.224}
	    bbs[9] = {"水攻","慧根","高级水属性吸收","神迹","冥思"}
	elseif bb == "机关兽" then
	    bbs[1] = 145
		bbs[2] = 1440
		bbs[3] = 1500
		bbs[4] = 5280
		bbs[5] = 2880
		bbs[6] = 1440
		bbs[7] = 1440
		bbs[8] = {1.235,1.247,1.26,1.273,1.285}
	    bbs[9] = {"魔之心","高级法术连击","土属性吸收","烈火"}
	elseif bb == "阴阳伞" then
	    bbs[1] = 95
		bbs[2] = 1440
		bbs[3] = 1440
		bbs[4] = 4800
		bbs[5] = 3000
		bbs[6] = 1500
		bbs[7] = 1440
		bbs[8] = {1.205,1.217,1.23,1.242,1.254}
	    bbs[9] = {"上古灵符","驱怪","剑荡四方","高级飞行"}
	elseif bb == "混沌兽" then
	    bbs[1] = 155
		bbs[2] = 1440
		bbs[3] = 1476
		bbs[4] = 5400
		bbs[5] = 3240
		bbs[6] = 1320
		bbs[7] = 1560
		bbs[8] = {1.244,1.257,1.27,1.282,1.295}
	    bbs[9] = {"再生","高级慧根","高级永恒","高级魔之心","奔雷咒"}
	elseif bb == "古代瑞兽" then
	    bbs[1] = 45
		bbs[2] = 1210
		bbs[3] = 1260
		bbs[4] = 3600
		bbs[5] = 2504
		bbs[6] = 1380
		bbs[7] = 1200
		bbs[8] = {1.127,1.138,1.15,1.161,1.173}
	    bbs[9] = {"高级神迹","高级反震","泰山压顶","高级驱鬼"}
	elseif bb == "蛟龙" then
	    bbs[1] = 65
		bbs[2] = 1440
		bbs[3] = 1440
		bbs[4] = 4560
		bbs[5] = 3000
		bbs[6] = 1200
		bbs[7] = 1320
		bbs[8] = {1.176,1.188,1.2,1.212,1.224}
	    bbs[9] = {"水漫金山","感知","高级永恒","高级水属性吸收"}
	elseif bb == "葫芦宝贝" then
	    bbs[1] = 135
		bbs[2] = 1440
		bbs[3] = 1500
		bbs[4] = 4800
		bbs[5] = 2760
		bbs[6] = 1320
		bbs[7] = 1800
		bbs[8] = {1.225,1.237,1.25,1.262,1.275}
	    bbs[9] = {"高级冥思","上古灵符","反震","魔之心"}
	elseif bb == "踏云兽" then
	    bbs[1] = 135
		bbs[2] = 1524
		bbs[3] = 1440
		bbs[4] = 5400
		bbs[5] = 1800
		bbs[6] = 1440
		bbs[7] = 1440
		bbs[8] = {1.225,1.237,1.25,1.262,1.275}
	    bbs[9] = {"高级招架","高级必杀","高级强力","弱点土"}
	elseif bb == "鬼将" then
	    bbs[1] = 105
		bbs[2] = 1524
		bbs[3] = 1380
		bbs[4] = 5040
		bbs[5] = 1440
		bbs[6] = 1320
		bbs[7] = 1320
		bbs[8] = {1.215,1.227,1.24,1.252,1.264}
	    bbs[9] = {"惊心一剑","高级必杀","冥思","鬼魂术"}
	elseif bb == "狸" then
	    bbs[1] = 5
		bbs[2] = 1440
		bbs[3] = 900
		bbs[4] = 2880
		bbs[5] = 1200
		bbs[6] = 1380
		bbs[7] = 1320
		bbs[8] = {0.996,1.002,1.03,1.032,1.042}
	    bbs[9] = {}
	elseif bb == "狐狸精" then
	    bbs[1] = 15
		bbs[2] = 1320
		bbs[3] = 1260
		bbs[4] = 3000
		bbs[5] = 1440
		bbs[6] = 1320
		bbs[7] = 1200
		bbs[8] = {1.009,1.019,1.03,1.04,1.05}
	    bbs[9] = {"驱怪","高级感知","慧根","高级慧根","弱点雷"}
	elseif bb == "巨蛙" then
	    bbs[1] = 0
		bbs[2] = 1080
		bbs[3] = 840
		bbs[4] = 2700
		bbs[5] = 1190
		bbs[6] = 1309
		bbs[7] = 1309
		bbs[8] = {0.882,0.891,0.9,0.909,0.918}
	    bbs[9] = {"慧根","幸运","水攻","弱点火"}
	elseif bb == "山贼" then
	    bbs[1] = 5
		bbs[2] = 1080
		bbs[3] = 1200
		bbs[4] = 3600
		bbs[5] = 1200
		bbs[6] = 1200
		bbs[7] = 1320
		bbs[8] = {0.989,0.999,1.01,1.02,1.03}
	    bbs[9] = {"招架","偷袭","强力","高级否定信仰"}
	elseif bb == "海星" then
	    bbs[1] = 0
		bbs[2] = 1080
		bbs[3] = 1140
		bbs[4] = 2400
		bbs[5] = 1440
		bbs[6] = 1200
		bbs[7] = 1020
		bbs[8] = {0.989,0.999,1.01,1.02,1.04}
	    bbs[9] = {"水属性吸收","弱点火","慧根","高级反震","水攻"}
	elseif bb == "小龙女" then
	    bbs[1] = 25
		bbs[2] = 1500
		bbs[3] = 1020
		bbs[4] = 3000
		bbs[5] = 1140
		bbs[6] = 1320
		bbs[7] = 960
		bbs[8] = {1.058,1.069,1.08,1.09,1.101}
	    bbs[9] = {"神佑复生","高级驱鬼","慧根","水攻","高级水属性吸收"}
	elseif bb == "红萼仙子" then
	    bbs[1] = 135
		bbs[2] = 1500
		bbs[3] = 1500
		bbs[4] = 5400
		bbs[5] = 3000
		bbs[6] = 960
		bbs[7] = 1800
		bbs[8] = {1.225,1.237,1.25,1.262,1.275}
	    bbs[9] = {"上古灵符","高级飞行","高级冥思","奔雷咒"}
	elseif bb == "浣熊" then
	    bbs[1] = 5
		bbs[2] = 1440
		bbs[3] = 900
		bbs[4] = 2880
		bbs[5] = 1200
		bbs[6] = 1380
		bbs[7] = 1320
		bbs[8] = {0.996,1.002,1.03,1.032,1.042}
	    bbs[9] = {"幸运","偷袭","必杀","招架"}
	elseif bb == "风伯" then
	    bbs[1] = 55
		bbs[2] = 1380
		bbs[3] = 1395
		bbs[4] = 4200
		bbs[5] = 2358
		bbs[6] = 1368
		bbs[7] = 1320
		bbs[8] = {1.127,1.138,1.15,1.161,1.173}
	    bbs[9] = {"高级敏捷","奔雷咒","高级雷属性吸收","高级飞行"}
	elseif bb == "大蝙蝠" then
	    bbs[1] = 5
		bbs[2] = 1080
		bbs[3] = 1140
		bbs[4] = 2520
		bbs[5] = 1800
		bbs[6] = 1500
		bbs[7] = 1500
		bbs[8] = {1.058,1.069,1.08,1.09,1.101}
	    bbs[9] = {"吸血","高级感知","高级驱鬼","飞行","高级夜战","弱点水"}
	elseif bb == "幽萤娃娃" then
	    bbs[1] = 105
		bbs[2] = 1440
		bbs[3] = 1440
		bbs[4] = 4200
		bbs[5] = 2640
		bbs[6] = 1536
		bbs[7] = 1560
		bbs[8] = {1.215,1.227,1.24,1.252,1.264}
	    bbs[9] = {"高级鬼魂术","高级防御","敏捷","高级法术抵抗"}
	elseif bb == "强盗" then
	    bbs[1] = 5
		bbs[2] = 1260
		bbs[3] = 1260
		bbs[4] = 3300
		bbs[5] = 1380
		bbs[6] = 1200
		bbs[7] = 1200
		bbs[8] = {0.989,0.999,1.01,1.02,1.03}
	    bbs[9] = {"连击","烈火","强力","否定信仰"}
	elseif bb == "巴蛇" then
	    bbs[1] = 145
		bbs[2] = 1524
		bbs[3] = 1440
		bbs[4] = 4800
		bbs[5] = 1560
		bbs[6] = 1560
		bbs[7] = 1560
		bbs[8] = {1.235,1.247,1.26,1.273,1.285}
	    bbs[9] = {"敏捷","嗜血追击","感知","毒","再生"}
	elseif bb == "机关鸟" then
	    bbs[1] = 145
		bbs[2] = 1500
		bbs[3] = 1344
		bbs[4] = 4800
		bbs[5] = 2520
		bbs[6] = 1560
		bbs[7] = 1560
		bbs[8] = {1.235,1.247,1.26,1.273,1.285}
	    bbs[9] = {"高级偷袭","驱怪","高级再生","神迹","飞行"}
	elseif bb == "律法女娲" then
	    bbs[1] = 95
		bbs[2] = 1440
		bbs[3] = 1560
		bbs[4] = 4440
		bbs[5] = 2400
		bbs[6] = 1440
		bbs[7] = 1680
		bbs[8] = {1.205,1.217,1.23,1.242,1.254}
	    bbs[9] = {"善恶有报","敏捷","再生","高级反击"}
	elseif bb == "猫灵兽形" then
	    bbs[1] = 135
		bbs[2] = 1464
		bbs[3] = 1464
		bbs[4] = 4080
		bbs[5] = 2400
		bbs[6] = 1560
		bbs[7] = 1680
		bbs[8] = {1.225,1.237,1.25,1.262,1.275}
	    bbs[9] = {"必杀","敏捷","高级偷袭","弱点水"}
	elseif bb == "镜妖" then
	    bbs[1] = 85
		bbs[2] = 1481
		bbs[3] = 1325
		bbs[4] = 4027
		bbs[5] = 2492
		bbs[6] = 1584
		bbs[7] = 1455
		bbs[8] = {1.205,1.217,1.23,1.242,1.254}
	    bbs[9] = {"反震","高级夜战","鬼魂术","雷击"}
	elseif bb == "龙龟" then
	    bbs[1] = 135
		bbs[2] = 1440
		bbs[3] = 1560
		bbs[4] = 5760
		bbs[5] = 3000
		bbs[6] = 1200
		bbs[7] = 1560
		bbs[8] = {1.225,1.237,1.25,1.262,1.275}
	    bbs[9] = {"水属性吸收","反震","高级防御","法术防御","水攻"}
	elseif bb == "机关人人形" then
	    bbs[1] = 135
		bbs[2] = 1500
		bbs[3] = 1500
		bbs[4] = 5400
		bbs[5] = 1680
		bbs[6] = 1320
		bbs[7] = 1440
		bbs[8] = {1.225,1.237,1.25,1.262,1.275}
	    bbs[9] = {"壁垒击破","弱点火","必杀","高级招架"}
	elseif bb == "吸血鬼" then
	    bbs[1] = 95
		bbs[2] = 1440
		bbs[3] = 1320
		bbs[4] = 3600
		bbs[5] = 2400
		bbs[6] = 132
		bbs[7] = 1800
		bbs[8] = {1.205,1.217,1.23,1.242,1.254}
	    bbs[9] = {"偷袭","吸血","鬼魂术","驱怪","弱点水"}
	elseif bb == "地狱战神" then
	    bbs[1] = 55
		bbs[2] = 1500
		bbs[3] = 1530
		bbs[4] = 4500
		bbs[5] = 1868
		bbs[6] = 1080
		bbs[7] = 1503
		bbs[8] = {1.107,1.118,1.13,1.141,1.152}
	    bbs[9] = {"泰山压顶","高级连击","高级魔之心","高级反震"}
	elseif bb == "琴仙" then
	    bbs[1] = 125
		bbs[2] = 1500
		bbs[3] = 1500
		bbs[4] = 5100
		bbs[5] = 3499
		bbs[6] = 1490
		bbs[7] = 1555
		bbs[8] = {1.215,1.227,1.24,1.252,1.264}
	    bbs[9] = {"泰山压顶","魔之心","神佑复生","再生","敏捷"}
	elseif bb == "蛤蟆精" then
	    bbs[1] = 15
		bbs[2] = 1380
		bbs[3] = 1140
		bbs[4] = 3300
		bbs[5] = 1200
		bbs[6] = 1320
		bbs[7] = 1320
		bbs[8] = {1.009,1.019,1.03,1.04,1.05}
	    bbs[9] = {"毒","必杀"}
	elseif bb == "如意仙子" then
	    bbs[1] = 75
		bbs[2] = 1200
		bbs[3] = 1416
		bbs[4] = 4378
		bbs[5] = 2700
		bbs[6] = 1400
		bbs[7] = 1380
		bbs[8] = {1.205,1.217,1.23,1.242,1.254}
	    bbs[9] = {"奔雷咒","地狱烈火","泰山压顶","烈火","雷击","弱点水"}
	elseif bb == "锦毛貂精" then
	    bbs[1] = 75
		bbs[2] = 1200
		bbs[3] = 1260
		bbs[4] = 4200
		bbs[5] = 2711
		bbs[6] = 1560
		bbs[7] = 1680
		bbs[8] = {1.205,1.217,1.23,1.242,1.254}
	    bbs[9] = {"冥思","泰山压顶","法术连击","敏捷"}
	elseif bb == "雾中仙" then
	    bbs[1] = 125
		bbs[2] = 1440
		bbs[3] = 1500
		bbs[4] = 5400
		bbs[5] = 3000
		bbs[6] = 1320
		bbs[7] = 1880
		bbs[8] = {1.215,1.227,1.24,1.252,1.264}
	    bbs[9] = {"高级神佑复生","高级感知","法术连击","敏捷"}
	elseif bb == "灵鹤" then
	    bbs[1] = 125
		bbs[2] = 1440
		bbs[3] = 1440
		bbs[4] = 4560
		bbs[5] = 2760
		bbs[6] = 1560
		bbs[7] = 1440
		bbs[8] = {1.215,1.227,1.24,1.252,1.264}
	    bbs[9] = {"高级永恒","高级驱鬼","高级再生","高级慧根","飞行"}
	elseif bb == "百足将军" then
	    bbs[1] = 85
		bbs[2] = 1440
		bbs[3] = 1320
		bbs[4] = 4560
		bbs[5] = 2640
		bbs[6] = 1560
		bbs[7] = 1320
		bbs[8] = {1.205,1.217,1.23,1.242,1.254}
	    bbs[9] = {"毒","落岩","高级夜战","弱点水"}
	elseif bb == "牛妖" then
	    bbs[1] = 25
		bbs[2] = 1080
		bbs[3] = 1140
		bbs[4] = 2520
		bbs[5] = 1800
		bbs[6] = 1500
		bbs[7] = 1500
		bbs[8] = {1.058,1.069,1.08,1.09,1.101}
	    bbs[9] = {"高级反击","高级慧根","高级防御","烈火"}
	elseif bb == "黑山老妖" then
	    bbs[1] = 45
		bbs[2] = 1130
		bbs[3] = 1500
		bbs[4] = 6000
		bbs[5] = 2400
		bbs[6] = 952
		bbs[7] = 1320
		bbs[8] = {1.107,1.118,1.13,1.141,1.152}
	    bbs[9] = {"高级偷袭","高级吸血","高级精神集中"}
	elseif bb == "雷鸟人" then
	    bbs[1] = 45
		bbs[2] = 1200
		bbs[3] = 1200
		bbs[4] = 4200
		bbs[5] = 1920
		bbs[6] = 1440
		bbs[7] = 1140
		bbs[8] = {1.205,1.217,1.23,1.242,1.254}
	    bbs[9] = {"高级雷属性吸收","奔雷咒","飞行","弱点土","雷击"}
	elseif bb == "芙蓉仙子" then
	    bbs[1] = 75
		bbs[2] = 1440
		bbs[3] = 1440
		bbs[4] = 4560
		bbs[5] = 2632
		bbs[6] = 1380
		bbs[7] = 1440
		bbs[8] = {1.205,1.217,1.23,1.242,1.254}
	    bbs[9] = {"高级再生","高级飞行","高级幸运"}
	elseif bb == "凤凰" then
	    bbs[1] = 65
		bbs[2] = 1200
		bbs[3] = 1440
		bbs[4] = 4200
		bbs[5] = 2400
		bbs[6] = 1560
		bbs[7] = 1320
		bbs[8] = {1.205,1.217,1.23,1.242,1.254}
	    bbs[9] = {"地狱烈火","高级神佑复生","高级火属性吸收","飞行"}
	elseif bb == "千年蛇魅" then
	    bbs[1] = 75
		bbs[2] = 1380
		bbs[3] = 1320
		bbs[4] = 4380
		bbs[5] = 2640
		bbs[6] = 1440
		bbs[7] = 1500
		bbs[8] = {1.2,1.21,1.229,1.238,1.244}
	    bbs[9] = {"敏捷","毒","偷袭","高级吸血"}
	elseif bb == "巡游天神" then
	    bbs[1] = 75
		bbs[2] = 1380
		bbs[3] = 1380
		bbs[4] = 5400
		bbs[5] = 2640
		bbs[6] = 1210
		bbs[7] = 1680
		bbs[8] = {1.195,1.207,1.22,1.232,1.244}
	    bbs[9] = {"泰山压顶","地狱烈火","高级招架","高级必杀"}
	elseif bb == "兔子怪" then
	    bbs[1] = 35
		bbs[2] = 1320
		bbs[3] = 1140
		bbs[4] = 4200
		bbs[5] = 2400
		bbs[6] = 1440
		bbs[7] = 1140
		bbs[8] = {1.038,1.049,1.06,1.07,1.081}
	    bbs[9] = {"高级感知","高级冥思","高级驱鬼","高级幸运","高级永恒","高级敏捷","弱点土"}
	elseif bb == "黑熊" then
	    bbs[1] = 15
		bbs[2] = 1080
		bbs[3] = 1140
		bbs[4] = 2520
		bbs[5] = 1800
		bbs[6] = 1500
		bbs[7] = 1500
		bbs[8] = {1.058,1.069,1.08,1.09,1.101}
	    bbs[9] = {"反击","必杀","强力","防御","迟钝"}
	elseif bb == "狂豹兽形" then
	    bbs[1] = 135
		bbs[2] = 1500
		bbs[3] = 1440
		bbs[4] = 4560
		bbs[5] = 2160
		bbs[6] = 1320
		bbs[7] = 1560
		bbs[8] = {1.225,1.237,1.25,1.262,1.275}
	    bbs[9] = {"高级强力","驱怪","高级飞行","偷袭"}
	elseif bb == "灵符女娲" then
	    bbs[1] = 95
		bbs[2] = 1320
		bbs[3] = 1560
		bbs[4] = 4800
		bbs[5] = 3000
		bbs[6] = 1440
		bbs[7] = 1440
		bbs[8] = {1.205,1.217,1.23,1.242,1.254}
	    bbs[9] = {"上古灵符","高级冥思","地狱烈火","落岩"}
	elseif bb == "泡泡" then
	    bbs[1] = 0
		bbs[2] = 1320
		bbs[3] = 1380
		bbs[4] = 4200
		bbs[5] = 2160
		bbs[6] = 1320
		bbs[7] = 1320
		bbs[8] = {1.048,1.059,1.07,1.08,1.091}
	    bbs[9] = {"高级防御","高级幸运","连击","精神集中","再生"}
	elseif bb == "幽灵" then
	    bbs[1] = 95
		bbs[2] = 1476
		bbs[3] = 1440
		bbs[4] = 4200
		bbs[5] = 2640
		bbs[6] = 1320
		bbs[7] = 1680
		bbs[8] = {1.205,1.217,1.23,1.242,1.254}
	    bbs[9] = {"高级反击","高级飞行","死亡召唤","鬼魂术"}
	elseif bb == "泪妖" then
	    bbs[1] = 85
		bbs[2] = 1296
		bbs[3] = 1296
		bbs[4] = 3888
		bbs[5] = 2592
		bbs[6] = 1296
		bbs[7] = 1684
		bbs[8] = {1.205,1.217,1.23,1.242,1.254}
	    bbs[9] = {"冥思","高级魔之心","法术暴击","弱点土","水攻"}
	elseif bb == "炎魔神" then
	    bbs[1] = 125
		bbs[2] = 1500
		bbs[3] = 1440
		bbs[4] = 4800
		bbs[5] = 3000
		bbs[6] = 1440
		bbs[7] = 1320
		bbs[8] = {1.215,1.227,1.24,1.252,1.264}
	    bbs[9] = {"高级必杀","高级火属性吸收","烈火","地狱烈火"}
	elseif bb == "鼠先锋" then
	    bbs[1] = 85
		bbs[2] = 1200
		bbs[3] = 1440
		bbs[4] = 4440
		bbs[5] = 2880
		bbs[6] = 1560
		bbs[7] = 1560
		bbs[8] = {1.205,1.217,1.23,1.242,1.254}
	    bbs[9] = {"驱怪","冥思","泰山压顶","敏捷"}
	elseif bb == "夜罗刹" then
	    bbs[1] = 125
		bbs[2] = 1500
		bbs[3] = 1440
		bbs[4] = 5760
		bbs[5] = 2880
		bbs[6] = 1440
		bbs[7] = 1440
		bbs[8] = {1.215,1.227,1.24,1.252,1.264}
	    bbs[9] = {"必杀","高级敏捷","高级魔之心","夜舞倾城"}
	elseif bb == "星灵仙子" then
	    bbs[1] = 75
		bbs[2] = 1200
		bbs[3] = 1416
		bbs[4] = 4378
		bbs[5] = 2700
		bbs[6] = 1440
		bbs[7] = 1446
		bbs[8] = {1.205,1.217,1.23,1.242,1.254}
	    bbs[9] = {"雷击","奔雷咒","水漫金山","高级慧根"}
	elseif bb == "蜘蛛精" then
	    bbs[1] = 35
		bbs[2] = 1140
		bbs[3] = 1355
		bbs[4] = 4980
		bbs[5] = 2580
		bbs[6] = 1080
		bbs[7] = 1200
		bbs[8] = {1.038,1.049,1.06,1.07,1.081}
	    bbs[9] = {"吸血","高级感知","高级毒","弱点土"}
	elseif bb == "净瓶女娲" then
	    bbs[1] = 105
		bbs[2] = 1464
		bbs[3] = 1440
		bbs[4] = 4800
		bbs[5] = 2880
		bbs[6] = 1560
		bbs[7] = 1560
		bbs[8] = {1.215,1.227,1.24,1.252,1.264}
	    bbs[9] = {"上古灵符","奔雷咒","高级慧根","感知"}
	elseif bb == "鲛人" then
	    bbs[1] = 65
		bbs[2] = 1440
		bbs[3] = 1440
		bbs[4] = 4560
		bbs[5] = 1920
		bbs[6] = 1380
		bbs[7] = 1440
		bbs[8] = {1.176,1.188,1.2,1.212,1.224}
	    bbs[9] = {"连击","高级水属性吸收","移花接木","敏捷"}
	elseif bb == "天将" then
	    bbs[1] = 55
		bbs[2] = 1380
		bbs[3] = 1140
		bbs[4] = 5406
		bbs[5] = 2450
		bbs[6] = 1380
		bbs[7] = 1204
		bbs[8] = {1.136,1.148,1.16,1.171,1.183}
	    bbs[9] = {"高级强力","驱鬼","连击","幸运"}
	elseif bb == "龟丞相" then
	    bbs[1] = 35
		bbs[2] = 1375
		bbs[3] = 1313
		bbs[4] = 3000
		bbs[5] = 2500
		bbs[6] = 1500
		bbs[7] = 1500
		bbs[8] = {1.038,1.049,1.06,1.07,1.081}
	    bbs[9] = {"冥思","驱鬼","防御","水漫金山","水属性吸收","水攻"}
	elseif bb == "蝎子精" then
	    bbs[1] = 135
		bbs[2] = 1464
		bbs[3] = 1464
		bbs[4] = 6240
		bbs[5] = 2880
		bbs[6] = 1320
		bbs[7] = 1920
		bbs[8] = {1.225,1.237,1.25,1.262,1.275}
	    bbs[9] = {"高级反震","招架","高级再生","毒"}
	elseif bb == "犀牛将军兽形" then
	    bbs[1] = 75
		bbs[2] = 1440
		bbs[3] = 1464
		bbs[4] = 4800
		bbs[5] = 2520
		bbs[6] = 1200
		bbs[7] = 1140
		bbs[8] = {1.205,1.217,1.23,1.242,1.254}
	    bbs[9] = {"法术暴击","土属性吸收","法术波动","落岩"}
	elseif bb == "僵尸" then
	    bbs[1] = 35
		bbs[2] = 1440
		bbs[3] = 1080
		bbs[4] = 4320
		bbs[5] = 2400
		bbs[6] = 1200
		bbs[7] = 1380
		bbs[8] = {1.048,1.059,1.07,1.08,1.091}
	    bbs[9] = {"土属性吸收","弱点雷","防御","鬼魂术","驱怪"}
	elseif bb == "蝴蝶仙子" then
	    bbs[1] = 45
		bbs[2] = 1320
		bbs[3] = 1140
		bbs[4] = 3000
		bbs[5] = 3000
		bbs[6] = 1440
		bbs[7] = 1440
		bbs[8] = {1.097,1.108,1.12,1.131,1.142}
	    bbs[9] = {"神迹","高级魔之心","高级敏捷","飞行","弱点水"}
	elseif bb == "马面" then
	    bbs[1] = 35
		bbs[2] = 1320
		bbs[3] = 1320
		bbs[4] = 3600
		bbs[5] = 1800
		bbs[6] = 1440
		bbs[7] = 1200
		bbs[8] = {1.048,1.059,1.07,1.08,1.091}
	    bbs[9] = {"驱鬼","高级必杀","强力","高级鬼魂术","驱怪"}
	elseif bb == "蟹将" then
	    bbs[1] = 25
		bbs[2] = 1320
		bbs[3] = 1200
		bbs[4] = 5100
		bbs[5] = 2280
		bbs[6] = 1200
		bbs[7] = 1200
		bbs[8] = {1.025,1.035,1.046,1.056,1.066}
	    bbs[9] = {"高级连击","精神集中","招架","水属性吸收"}
	elseif bb == "画魂" then
	    bbs[1] = 105
		bbs[2] = 1380
		bbs[3] = 1440
		bbs[4] = 4320
		bbs[5] = 2880
		bbs[6] = 1320
		bbs[7] = 1440
		bbs[8] = {1.215,1.227,1.24,1.252,1.264}
	    bbs[9] = {"高级鬼魂术","地狱烈火","幸运","高级魔之心"}
	elseif bb == "碧水夜叉" then
	    bbs[1] = 65
		bbs[2] = 1380
		bbs[3] = 1320
		bbs[4] = 4200
		bbs[5] = 2760
		bbs[6] = 1440
		bbs[7] = 1800
		bbs[8] = {1.186,1.198,1.21,1.222,1.234}
	    bbs[9] = {"高级反震","奔雷咒","强力","壁垒击破"}
	elseif bb == "狂豹人形" then
	    bbs[1] = 155
		bbs[2] = 1536
		bbs[3] = 1440
		bbs[4] = 4800
		bbs[5] = 2280
		bbs[6] = 1440
		bbs[7] = 1560
		bbs[8] = {1.244,1.257,1.27,1.282,1.295}
	    bbs[9] = {"驱怪","高级飞行","高级强力","偷袭","吸血"}
	-- 神兽
	elseif bb == "超级土地公公（法术型）" then
	    bbs[9] = {"高级神佑","高级法术连击","天降灵葫","招架","高级魔之心"}
	elseif bb == "超级六耳猕猴（法术型）" then
	    bbs[9] = {"须弥真言","高级法术连击","永恒","上古灵符","高级法术暴击"}
	elseif bb == "超级神鸡（法术型）" then
	    bbs[9] = {"高级感知","高级法术波动","地狱烈火","招架","魔之心"}
	elseif bb == "超级玉兔（法术型）" then
	    bbs[9] = {"高级神佑复生","高级法术波动","月光","驱怪","高级法术暴击"}
	elseif bb == "超级神猴（法术型）" then
	    bbs[9] = {"高级法术波动","高级法术连击","奔雷咒","法术暴击","魔之心"}
	elseif bb == "超级神龙（法术型）" then
	    bbs[9] = {"龙魂","高级法术波动","奔雷咒","再生","魔之心"}
	elseif bb == "超级神羊（法术型）" then
	    bbs[9] = {"驱鬼","高级法术波动","奔雷咒","法术暴击","高级魔之心"}
	elseif bb == "超级孔雀（法术型）" then
	    bbs[9] = {"幸运","高级法术暴击","高级神佑","再生","高级魔之心"}
	elseif bb == "超级灵狐（法术型）" then
	    bbs[9] = {"高级感知","高级法术暴击","奔雷咒","法术连击","高级魔之心"}
	elseif bb == "超级筋斗云（法术型）" then
	    bbs[9] = {"高级感知","高级法术连击","奔雷咒","反震","高级魔之心"}
	elseif bb == "超级神鸡（物理型）" then
	    bbs[9] = {"高级神佑","高级强力","从天而降","驱怪","必杀"}
	elseif bb == "超级玉兔（物理型）" then
	    bbs[9] = {"高级敏捷","高级感知","连击","高级夜战","偷袭"}
	elseif bb == "超级神猴（物理型）" then
	    bbs[9] = {"高级神佑复生","高级吸血","大快朵颐","连击","必杀"}
	elseif bb == "超级土地公公（物理型）" then
	    bbs[9] = {"高级敏捷","高级必杀","高级连击","驱怪","高级神佑复生"}
	elseif bb == "超级神羊（物理型）" then
	    bbs[9] = {"高级必杀","感知","高级连击","千钧一怒","反震"}
	elseif bb == "超级六耳猕猴（物理型）" then
	    bbs[9] = {"高级敏捷","高级招架","高级连击","幸运","高级偷袭"}
	elseif bb == "超级神马（物理型）" then
	    bbs[9] = {"高级神佑复生","浮云神马","高级连击","幸运","神迹"}
	elseif bb == "超级神马（法术型）" then
	    bbs[9] = {"高级魔之心","奔雷咒","高级法术连击","法术暴击","慧根"}
	elseif bb == "超级孔雀（物理型）" then
	    bbs[9] = {"高级偷袭","高级飞行","高级再生","必杀","高级连击"}
	elseif bb == "超级灵狐（物理型）" then
	    bbs[9] = {"高级敏捷","惊心一剑","高级必杀","驱怪","高级偷袭"}
	elseif bb == "超级筋斗云（物理型）" then
	    bbs[9] = {"高级神佑复生","高级偷袭","高级夜战","强力","高级敏捷"}
	elseif bb == "超级神龙（物理型）" then
	    bbs[9] = {"高级必杀","高级驱鬼","高级夜战","幸运","强力"}
	elseif bb == "超级麒麟（物理型）" then
	    bbs[9] = {"高级合纵","高级夜战","高级连击","高级幸运","偷袭"}
	elseif bb == "超级麒麟（法术型）" then
	    bbs[9] = {"高级魔之心","泰山压顶","高级法术连击","感知","高级驱鬼"}
	elseif bb == "超级大鹏（法术型）" then
	    bbs[9] = {"高级法术波动","奔雷咒","高级法术暴击","高级招架","冥思"}
	elseif bb == "超级麒麟（物理型）" then
	    bbs[9] = {"高级飞行","高级偷袭","高级神佑复生","高级敏捷","必杀"}
	elseif bb == "超级赤焰兽（法术型）" then
	    bbs[9] = {"高级法术连击","高级神佑复生","魔之心","高级法术暴击","高级冥思"}
	elseif bb == "超级赤焰兽（物理型）" then
	    bbs[9] = {"高级必杀","高级感知","高级反击","幸运","高级毒"}
	elseif bb == "超级白泽（法术型）" then
	    bbs[9] = {"高级法术暴击","水漫金山","高级魔之心","高级反震","上古灵符"}
	elseif bb == "超级白泽（物理型）" then
	    bbs[9] = {"高级必杀","高级夜战","高级敏捷","高级幸运","感知"}
	elseif bb == "超级灵鹿（法术型）" then
	    bbs[9] = {"高级法术暴击","泰山压顶","高级法术连击","高级再生","上古灵符"}
	elseif bb == "超级灵鹿（物理型）" then
	    bbs[9] = {"善恶有报","高级再生","高级偷袭","高级冥思","永恒"}
	elseif bb == "超级大象（法术型）" then
	    bbs[9] = {"高级法术连击","奔雷咒","高级魔之心","高级神迹","雷击"}
	elseif bb == "超级大象（物理型）" then
	    bbs[9] = {"高级强力","高级再生","高级必杀","高级反震","驱怪"}
	elseif bb == "超级金猴（法术型）" then
	    bbs[9] = {"高级法术波动","奔雷咒","高级魔之心","高级精神集中","雷击"}
	elseif bb == "超级金猴（物理型）" then
	    bbs[9] = {"高级偷袭","高级连击","高级幸运","高级敏捷","驱怪"}
	elseif bb == "超级大熊猫（法术型）" then
	    bbs[9] = {"高级法术波动","奔雷咒","高级魔之心","高级冥思","雷击"}
	elseif bb == "超级大熊猫（物理型）" then
	    bbs[9] = {"高级连击","高级防御","高级感知","高级夜战","高级强力"}
	elseif bb == "超级泡泡（法术型）" then
	    bbs[9] = {"高级感知","奔雷咒","高级魔之心","高级慧根","雷击"}
	elseif bb == "超级泡泡（物理型）" then
	    bbs[9] = {"高级必杀","高级神佑复生","高级感知","高级飞行","驱怪"}
	elseif bb == "超级神兔（法术型）" then
	    bbs[9] = {"高级法术连击","奔雷咒","魔之心","高级反震","感知"}
	elseif bb == "超级神兔（物理型）" then
	    bbs[9] = {"高级连击","高级偷袭","高级敏捷","驱怪","幸运"}
	elseif bb == "超级神虎（法术型）" then
	    bbs[9] = {"高级法术暴击","奔雷咒","魔之心","高级驱鬼","法术波动"}
	elseif bb == "超级神虎（物理型）" then
	    bbs[9] = {"高级感知","嗜血追击","高级夜战","连击","强力"}
	elseif bb == "超级神牛（法术型）" then
	    bbs[9] = {"高级法术波动","奔雷咒","高级法术连击","冥思","魔之心"}
	elseif bb == "超级神牛（物理型）" then
	    bbs[9] = {"力劈华山","高级幸运","高级招架","必杀","强力"}
	elseif bb == "超级海豚（法术型）" then
	    bbs[9] = {"高级法术暴击","水漫金山","高级魔之心","高级感知","慧根"}
	elseif bb == "超级海豚（物理型）" then
	    bbs[9] = {"剑荡四方","高级偷袭","高级幸运","高级必杀","驱怪"}
	elseif bb == "超级人参娃娃（法术型）" then
	    bbs[9] = {"高级法术波动","泰山压顶","魔之心","高级法术连击","高级冥思"}
	elseif bb == "超级人参娃娃（物理型）" then
	    bbs[9] = {"壁垒击破","高级必杀","高级强力","高级驱鬼","幸运"}
	elseif bb == "超级青鸾（法术型）" then
	    bbs[9] = {"法术暴击","奔雷咒","高级魔之心","高级幸运","高级神佑复生"}
	elseif bb == "超级青鸾（物理型）" then
	    bbs[9] = {"高级夜战","苍鸾怒击","高级飞行","高级反震","高级连击"}
	elseif bb == "超级腾蛇（法术型）" then
	    bbs[9] = {"高级法术波动","地狱烈火","魔之心","灵能激发","永恒"}
	elseif bb == "超级腾蛇（物理型）" then
	    bbs[9] = {"高级连击","高级毒","高级夜战","偷袭","敏捷"}
	-- 进阶神兽
	elseif bb == "进阶超级土地公公（法术型）" then
	    bbs[9] = {"高级神佑","高级法术连击","天降灵葫","招架","高级魔之心"}
	elseif bb == "进阶超级六耳猕猴（法术型）" then
	    bbs[9] = {"须弥真言","高级法术连击","永恒","上古灵符","高级法术暴击"}
	elseif bb == "进阶超级神鸡（法术型）" then
	    bbs[9] = {"高级感知","高级法术波动","地狱烈火","招架","魔之心"}
	elseif bb == "进阶超级玉兔（法术型）" then
	    bbs[9] = {"高级神佑复生","高级法术波动","月光","驱怪","高级法术暴击"}
	elseif bb == "进阶超级神猴（法术型）" then
	    bbs[9] = {"高级法术波动","高级法术连击","奔雷咒","法术暴击","魔之心"}
	elseif bb == "进阶超级神龙（法术型）" then
	    bbs[9] = {"龙魂","高级法术波动","奔雷咒","再生","魔之心"}
	elseif bb == "进阶超级神羊（法术型）" then
	    bbs[9] = {"驱鬼","高级法术波动","奔雷咒","法术暴击","高级魔之心"}
	elseif bb == "进阶超级孔雀（法术型）" then
	    bbs[9] = {"幸运","高级法术暴击","高级神佑","再生","高级魔之心"}
	elseif bb == "进阶超级灵狐（法术型）" then
	    bbs[9] = {"高级感知","高级法术暴击","奔雷咒","法术连击","高级魔之心"}
	elseif bb == "进阶超级筋斗云（法术型）" then
	    bbs[9] = {"高级感知","高级法术连击","奔雷咒","反震","高级魔之心"}
	elseif bb == "进阶超级神鸡（物理型）" then
	    bbs[9] = {"高级神佑","高级强力","从天而降","驱怪","必杀"}
	elseif bb == "进阶超级玉兔（物理型）" then
	    bbs[9] = {"高级敏捷","高级感知","连击","高级夜战","偷袭"}
	elseif bb == "进阶超级神猴（物理型）" then
	    bbs[9] = {"高级神佑复生","高级吸血","大快朵颐","连击","必杀"}
	elseif bb == "进阶超级土地公公（物理型）" then
	    bbs[9] = {"高级敏捷","高级必杀","高级连击","驱怪","高级神佑复生"}
	elseif bb == "进阶超级神羊（物理型）" then
	    bbs[9] = {"高级必杀","感知","高级连击","千钧一怒","反震"}
	elseif bb == "进阶超级六耳猕猴（物理型）" then
	    bbs[9] = {"高级敏捷","高级招架","高级连击","幸运","高级偷袭"}
	elseif bb == "进阶超级神马（物理型）" then
	    bbs[9] = {"高级神佑复生","浮云神马","高级连击","幸运","神迹"}
	elseif bb == "进阶超级神马（法术型）" then
	    bbs[9] = {"高级魔之心","奔雷咒","高级法术连击","法术暴击","慧根"}
	elseif bb == "进阶超级孔雀（物理型）" then
	    bbs[9] = {"高级偷袭","高级飞行","高级再生","必杀","高级连击"}
	elseif bb == "进阶超级灵狐（物理型）" then
	    bbs[9] = {"高级敏捷","惊心一剑","高级必杀","驱怪","高级偷袭"}
	elseif bb == "进阶超级筋斗云（物理型）" then
	    bbs[9] = {"高级神佑复生","高级偷袭","高级夜战","强力","高级敏捷"}
	elseif bb == "进阶超级神龙（物理型）" then
	    bbs[9] = {"高级必杀","高级驱鬼","高级夜战","幸运","强力"}
	elseif bb == "进阶超级麒麟（物理型）" then
	    bbs[9] = {"高级合纵","高级夜战","高级连击","高级幸运","偷袭"}
	elseif bb == "进阶超级麒麟（法术型）" then
	    bbs[9] = {"高级魔之心","泰山压顶","高级法术连击","感知","高级驱鬼"}
	elseif bb == "进阶超级大鹏（法术型）" then
	    bbs[9] = {"高级法术波动","奔雷咒","高级法术暴击","高级招架","冥思"}
	elseif bb == "进阶超级麒麟（物理型）" then
	    bbs[9] = {"高级飞行","高级偷袭","高级神佑复生","高级敏捷","必杀"}
	elseif bb == "进阶超级赤焰兽（法术型）" then
	    bbs[9] = {"高级法术连击","高级神佑复生","魔之心","高级法术暴击","高级冥思"}
	elseif bb == "进阶超级赤焰兽（物理型）" then
	    bbs[9] = {"高级必杀","高级感知","高级反击","幸运","高级毒"}
	elseif bb == "进阶超级白泽（法术型）" then
	    bbs[9] = {"高级法术暴击","水漫金山","高级魔之心","高级反震","上古灵符"}
	elseif bb == "进阶超级白泽（物理型）" then
	    bbs[9] = {"高级必杀","高级夜战","高级敏捷","高级幸运","感知"}
	elseif bb == "进阶超级灵鹿（法术型）" then
	    bbs[9] = {"高级法术暴击","泰山压顶","高级法术连击","高级再生","上古灵符"}
	elseif bb == "进阶超级灵鹿（物理型）" then
	    bbs[9] = {"善恶有报","高级再生","高级偷袭","高级冥思","永恒"}
	elseif bb == "进阶超级大象（法术型）" then
	    bbs[9] = {"高级法术连击","奔雷咒","高级魔之心","高级神迹","雷击"}
	elseif bb == "进阶超级大象（物理型）" then
	    bbs[9] = {"高级强力","高级再生","高级必杀","高级反震","驱怪"}
	elseif bb == "进阶超级金猴（法术型）" then
	    bbs[9] = {"高级法术波动","奔雷咒","高级魔之心","高级精神集中","雷击"}
	elseif bb == "进阶超级金猴（物理型）" then
	    bbs[9] = {"高级偷袭","高级连击","高级幸运","高级敏捷","驱怪"}
	elseif bb == "进阶超级大熊猫（法术型）" then
	    bbs[9] = {"高级法术波动","奔雷咒","高级魔之心","高级冥思","雷击"}
	elseif bb == "进阶超级大熊猫（物理型）" then
	    bbs[9] = {"高级连击","高级防御","高级感知","高级夜战","高级强力"}
	elseif bb == "进阶超级泡泡（法术型）" then
	    bbs[9] = {"高级感知","奔雷咒","高级魔之心","高级慧根","雷击"}
	elseif bb == "进阶超级泡泡（物理型）" then
	    bbs[9] = {"高级必杀","高级神佑复生","高级感知","高级飞行","驱怪"}
	elseif bb == "进阶超级神兔（法术型）" then
	    bbs[9] = {"高级法术连击","奔雷咒","魔之心","高级反震","感知"}
	elseif bb == "进阶超级神兔（物理型）" then
	    bbs[9] = {"高级连击","高级偷袭","高级敏捷","驱怪","幸运"}
	elseif bb == "进阶超级神虎（法术型）" then
	    bbs[9] = {"高级法术暴击","奔雷咒","魔之心","高级驱鬼","法术波动"}
	elseif bb == "进阶超级神虎（物理型）" then
	    bbs[9] = {"高级感知","嗜血追击","高级夜战","连击","强力"}
	elseif bb == "进阶超级神牛（法术型）" then
	    bbs[9] = {"高级法术波动","奔雷咒","高级法术连击","冥思","魔之心"}
	elseif bb == "进阶超级神牛（物理型）" then
	    bbs[9] = {"力劈华山","高级幸运","高级招架","必杀","强力"}
	elseif bb == "进阶超级海豚（法术型）" then
	    bbs[9] = {"高级法术暴击","水漫金山","高级魔之心","高级感知","慧根"}
	elseif bb == "进阶超级海豚（物理型）" then
	    bbs[9] = {"剑荡四方","高级偷袭","高级幸运","高级必杀","驱怪"}
	elseif bb == "进阶超级人参娃娃（法术型）" then
	    bbs[9] = {"高级法术波动","泰山压顶","魔之心","高级法术连击","高级冥思"}
	elseif bb == "进阶超级人参娃娃（物理型）" then
	    bbs[9] = {"壁垒击破","高级必杀","高级强力","高级驱鬼","幸运"}
	elseif bb == "进阶超级青鸾（法术型）" then
	    bbs[9] = {"法术暴击","奔雷咒","高级魔之心","高级幸运","高级神佑复生"}
	elseif bb == "进阶超级青鸾（物理型）" then
	    bbs[9] = {"高级夜战","苍鸾怒击","高级飞行","高级反震","高级连击"}
	elseif bb == "进阶超级腾蛇（法术型）" then
	    bbs[9] = {"高级法术波动","地狱烈火","魔之心","灵能激发","永恒"}
	elseif bb == "进阶超级腾蛇（物理型）" then
	    bbs[9] = {"高级连击","高级毒","高级夜战","偷袭","敏捷"}
	elseif bb == "小毛头" then
	    bbs[1] = 0
		bbs[2] = 960
		bbs[3] = 960
		bbs[4] = 3600
		bbs[5] = 1200
		bbs[6] = 840
		bbs[7] = 1320
		bbs[8] = {0.882,0.891,0.9,0.909,0.918}
	    bbs[9] = {"高级连击","高级防御","高级夜战","高级偷袭"}
	elseif bb == "小丫丫" then
	    bbs[1] = 0
		bbs[2] = 960
		bbs[3] = 960
		bbs[4] = 3600
		bbs[5] = 1200
		bbs[6] = 840
		bbs[7] = 1320
		bbs[8] = {0.882,0.891,0.9,0.909,0.918}
	    bbs[9] = {"高级连击","高级防御","高级夜战","高级偷袭"}
	elseif bb == "毗舍童子" then
	    bbs[1] = 175
		bbs[2] = 1684
		bbs[3] = 1542
		bbs[4] = 4536
		bbs[5] = 2332
		bbs[6] = 1555
		bbs[7] = 1749
		bbs[8] = {1.265,1.27,1.275,1.28,1.285}
	    bbs[9] = {"高级合纵","敏捷","高级法术抵抗","连击","神迹"}
	elseif bb == "增长巡守" then--########################################################?自己修改?##########################################
	    bbs[1] = 175
		bbs[2] = 1684
		bbs[3] = 1542
		bbs[4] = 4536
		bbs[5] = 2332
		bbs[6] = 1555
		bbs[7] = 1749
		bbs[8] = {1.265,1.27,1.275,1.28,1.285}
	    bbs[9] = {"高级精神集中","必杀","偷袭","吸血","驱鬼","连击"}
	elseif bb == "真陀护法" then
	    bbs[1] = 175
		bbs[2] = 1684
		bbs[3] = 1542
		bbs[4] = 4536
		bbs[5] = 2332
		bbs[6] = 1555
		bbs[7] = 1749
		bbs[8] = {1.265,1.27,1.275,1.28,1.285}
	    bbs[9] = {"高级精神集中","必杀","偷袭","吸血","驱鬼","连击"}
	elseif bb == "般若天女" then
	    bbs[1] = 175
		bbs[2] = 1684
		bbs[3] = 1542
		bbs[4] = 4536
		bbs[5] = 2332
		bbs[6] = 1555
		bbs[7] = 1749
		bbs[8] = {1.265,1.27,1.275,1.28,1.285}
	    bbs[9] = {"须弥真言","再生","奔雷咒","神佑复生"}
	elseif bb == "持国巡守" then
	    bbs[1] = 175
		bbs[2] = 1684
		bbs[3] = 1542
		bbs[4] = 4536
		bbs[5] = 2332
		bbs[6] = 1555
		bbs[7] = 1749
		bbs[8] = {1.265,1.27,1.275,1.28,1.285}
	    bbs[9] = {"须弥真言","再生","奔雷咒","神佑复生"}
	end
	return bbs
end

function 引擎.取天生(ac)
	local acs = {}
	if ac == "大海龟" then
		acs = {"水属性吸收","防御"}
	elseif ac == "巨蛙" then
		acs = {"弱点火"}
	elseif ac == "海星" then
		acs = {"弱点火","水属性吸收"}
	elseif ac == "章鱼" then
		acs = {"弱点火"}
	elseif ac == "海毛虫" then
		acs = {"弱点火","驱怪"}
	elseif ac == "树怪" then
		acs = {"弱点火","迟钝"}
	elseif ac == "浣熊" then
		acs = {"招架"}
	elseif ac == "大蝙蝠" then
		acs = {"弱点水","高级夜战","飞行"}
	elseif ac == "花妖" then
		acs = {"水属性吸收"}
	elseif ac == "黑熊" then
		acs = {"迟钝"}
	elseif ac == "狐狸精" then
		acs = {"弱点雷","驱怪"}
	elseif ac == "骷髅怪" then
		acs = {"弱点雷","鬼魂术"}
	elseif ac == "蟹将" then
		acs = {"水属性吸收"}
	elseif ac == "虾兵" then
		acs = {"水属性吸收"}
	elseif ac == "小龙女" then
		acs = {"高级水属性吸收"}
	elseif ac == "狼" then
		acs = {"连击","偷袭","驱怪"}
	elseif ac == "野鬼" then
		acs = {"鬼魂术","驱怪"}
	elseif ac == "僵尸" then
		acs = {"鬼魂术","驱怪"}
	elseif ac == "黑熊精" then
		acs = {"弱点雷"}
	elseif ac == "兔子哥" then
		acs = {"弱点土"}
	elseif ac == "牛头" then
		acs = {"高级鬼魂术","驱怪"}
	elseif ac == "马面" then
		acs = {"高级鬼魂术","驱怪"}
	elseif ac == "白熊" then
		acs = {"迟钝"}
	elseif ac == "雷鸟人" then
		acs = {"弱点土","雷击","飞行"}
	elseif ac == "蝴蝶仙子" then
		acs = {"弱点水","飞行"}
	elseif ac == "鲛人" then
		acs = {"敏捷"}
	elseif ac == "蚌精" then
		acs = {"冥思"}
	elseif ac == "雨师" then
		acs = {"水攻"}
	elseif ac == "蛟龙" then
		acs = {"感知"}
	elseif ac == "凤凰" then
		acs = {"飞行"}
	elseif ac == "如意仙子" then
		acs = {"烈火"}
	elseif ac == "星灵仙子" then
		acs = {"雷击"}
	elseif ac == "鼠先锋" then
		acs = {"敏捷"}
	elseif ac == "百足将军" then
		acs = {"弱点水"}
	elseif ac == "犀牛将军人形" then
		acs = {"再生"}
	elseif ac == "犀牛将军兽形" then
		acs = {"落岩"}
	elseif ac == "锦毛貂精" then
		acs = {"敏捷"}
	elseif ac == "吸血鬼" then
		acs = {"弱点水","驱怪","鬼魂术"}
	elseif ac == "幽灵" then
		acs = {"鬼魂术"}
	elseif ac == "灵符女蜗" then
		acs = {"落岩"}
	elseif ac == "画魂" then
		acs = {"高级鬼魂术","地狱烈火"}
	elseif ac == "幽萤娃娃" then
		acs = {"高级鬼魂术"}
	elseif ac == "鬼将" then
		acs = {"鬼魂术"}
	elseif ac == "净瓶女娲" then
		acs = {"感知"}
	elseif ac == "炎魔神" then
		acs = {"地狱烈火"}
	elseif ac == "机关人" then
		acs = {"高级招架"}
	elseif ac == "龙龟" then
		acs = {"水攻"}
	elseif ac == "猫灵兽形" then
		acs = {"弱点水"}
	elseif ac == "蝎子精" then
		acs = {"毒"}
	elseif ac == "葫芦宝贝" then
		acs = {"魔之心"}
	elseif ac == "踏云兽" then
		acs = {"弱点土"}
	elseif ac == "巴蛇" then
		acs = {"再生"}
	elseif ac == "机关兽" then
		acs = {"烈火"}
	elseif ac == "连弩车" then
		acs = {"迟钝"}
	elseif ac == "机关鸟" then
		acs = {"飞行"}
	elseif ac == "蜃气妖" then
		acs = {"雷击"}
	elseif ac == "藤蔓妖花" then
		acs = {"高级法术连击"}
	elseif ac == "长眉灵猴" then
		acs = {"奔雷咒"}
	elseif ac == "修罗傀儡鬼" then
		acs = {"嗜血追击"}
	elseif ac == "巨力猿猴" then
		acs = {"敏捷"}
	elseif ac == "混沌兽" then
		acs = {"奔雷咒"}
	elseif ac == "狂豹人形" then
		acs = {"吸血","偷袭"}
	elseif ac == "猫灵人形" then
		acs = {"敏捷"}
	elseif ac == "曼珠沙华" then
		acs = {"高级再生"}
	elseif ac == "金身罗汉" then
		acs = {"高级敏捷"}
	elseif ac == "修罗傀儡妖" then
		acs = {"高级连击"}
	end
	return acs
end