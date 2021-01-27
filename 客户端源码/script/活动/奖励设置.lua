--======================================================================--
-- @作者: GGE研究群: 342119466
-- @创建时间:   2018-03-03 02:34:19
-- @Last Modified time: 2020-01-05 13:31:28
--======================================================================--
local floor = math.floor
local random = 引擎.取随机整数
local tp = 引擎.场景
local format = string.format
local djg = 引擎.取等级怪

local function 低级魔兽要诀()
	local ms = {"反震","吸血","反击","连击","飞行","驱怪","隐身","感知","再生","冥思","慧根","必杀","幸运","神迹","招架","永恒","敏捷","强力","防御","偷袭","毒","驱鬼","鬼魂术","魔之心","神佑复生","精神集中","否定信仰","雷击","落岩","水攻","烈火","法术连击","法术暴击","法术波动","雷属性吸收","土属性吸收","火属性吸收","水属性吸收","迟钝"}
	return ms[random(1,#ms)]
end

local function 高级魔兽要诀()
	local ms =  {"高级反震","高级吸血","高级反击","高级连击","高级飞行","高级夜战","高级隐身","高级感知","高级再生","高级冥思","高级慧根","高级必杀","高级幸运","高级神迹","高级招架","高级永恒","高级敏捷","高级强力","高级防御","高级偷袭","高级毒","高级驱鬼","高级鬼魂术","高级魔之心","高级神佑复生","高级精神集中","高级否定信仰","奔雷咒","泰山压顶","水漫金山","地狱烈火","高级法术连击","高级法术暴击","高级法术波动","高级雷属性吸收","高级土属性吸收","高级火属性吸收","高级水属性吸收","高级迟钝"}
	return ms[random(1,#ms)]
end

local function 宝石()
	local ms = {"光芒石","月亮石","太阳石","舍利子","红玛瑙","黑宝石","神秘石"}
	return ms[random(1,#ms)]
end

function 引擎.保卫长安奖励(是否BOSS战)
	if tp.剧情开关.保卫长安 == false then
		return false
	end
	local 平均等级 = 0
	local 数量 = 0
	for n=1,#tp.队伍 do
		数量 = 数量 + 1
	    平均等级 = 平均等级 + tp.队伍[n].等级
	end
	平均等级 = floor(平均等级 / 数量)
	local jy
	local jq
	if tp.剧情开关.保卫长安[1] == "鬼王密信" then
		jy = floor(平均等级*551+平均等级*平均等级)
		jq = floor(平均等级*200+(平均等级+10)*(平均等级-10))
		for i=1,#tp.队伍 do
			tp.队伍[i].当前经验 = tp.队伍[i].当前经验 + jy
			if tp.队伍[1].参战宝宝.名称 ~= nil then
				tp.队伍[1].参战宝宝.当前经验 = tp.队伍[1].参战宝宝.当前经验 + jy
			end
		end
		tp:增加经验(jy)
		local dj = tp:取进制等级(tp.队伍[1].等级)
		if dj >= 160 then
			dj = 160
		end
		tp.金钱 = tp.金钱 + jq
		tp.储备 = tp.储备 + jq * 2
		tp.提示:写入(format("#Y/你获得了%d经验，%d金钱，%d储备金",jy,jq,jq*2))
		local wb = random(1,10)
		if wb <= 1 then
			增加物品("金柳露")
			tp.提示:写入(format("#Y/你获得了金柳露"))
		elseif wb > 1 and wb <= 2 then
			增加物品("彩果")
			tp.提示:写入(format("#Y/你获得了彩果"))
		elseif wb > 2 and wb <= 3 then
			local a = {"青龙石","白虎石","朱雀石","玄武石"}
			a = a[random(1,4)]
			tp.提示:写入(format("#Y/你获得了%s",a))
			增加物品(a)
		end
		wb = random(1,10)
		if wb <= 1 then
			增加物品("高级藏宝图")
			tp.提示:写入(format("#Y/你获得了高级藏宝图"))
		elseif wb > 1 and wb <= 2 then
			增加物品(高级魔兽要诀())
		elseif wb > 2 and wb <= 3 then
			增加物品("制造指南书",dj,random(1,23))
			tp.提示:写入(format("#Y/你获得了制造指南书"))
		elseif wb > 3 and wb <= 4 then
			增加物品("百炼精铁",dj)
			tp.提示:写入(format("#Y/你获得了百炼精铁"))
		end
		wb = {"金刚石","定魂珠","避水珠","夜光珠","龙鳞"}
		wb = wb[random(1,#wb)]
		tp.提示:写入(format("#Y/你获得了%s",wb))
		增加物品(wb)
	elseif tp.剧情开关.保卫长安[1] == "无尽梦魇" then
		if 是否BOSS战 then
			jy = floor((平均等级*451+平均等级*平均等级)*3)
			jq = floor((平均等级*200+(平均等级+10)*(平均等级-10))*2)
		else
			jy = floor(平均等级*451+平均等级*平均等级)
			jq = floor(平均等级*200+(平均等级+10)*(平均等级-10))
		end
		tp:增加经验(jy)
		tp.金钱 = tp.金钱 + jq
		tp.储备 = tp.储备 + jq * 2
		tp.提示:写入(format("#Y/你获得了%d经验，%d金钱，%d储备金",jy,jq,jq*2))
	end
end

function 引擎.挖宝图(zl)
	local cs = 2
	if zl == 2 then
		cs = 3
	end
	local wp = 0
	local by = nil
	local hd = 0
	local sm = 0
	local s = nil
	for n=1,cs do
		hd = 0
		local gl = random(1,100)
		if gl <= 1 then
			增加物品("灵丹")
			tp.提示:写入("#Y/你获得了灵丹")
			wp = 1
			hd = 1
		elseif gl > 1 and gl <= 4 then
			if zl == 2 then
				增加物品("超级金柳露")
				tp.提示:写入("#Y/你获得了超级金柳露")
				wp = 1
			else
				增加物品("金柳露")
				tp.提示:写入("#Y/你获得了金柳露")
				wp = 1
			end
			hd = 1
		elseif gl > 82 then
			local a = {"青龙石","白虎石","朱雀石","玄武石"}
			hd = 1
			wp = 1
			local wp = a[random(1,#a)]
			增加物品(wp)
			tp.提示:写入("#Y/你获得了"..wp)
		elseif gl > 62 and gl <= 82 then
			增加物品("彩果")
			tp.提示:写入("#Y/你获得了彩果")
		elseif gl == 51 and by == nil and sm == 0 and s == nil then
			local b = djg(tp.队伍[1].等级)
			by = b[random(1,#b)]+3
			hd = 1
			wp = 1
			tp.提示:写入("#Y/你挖出了一只变异宝宝")
		end
		if hd ~= 0 then
			local dj = tp:取进制等级(tp.队伍[1].等级)
			if dj >= 160 then
				dj = 160
			end
			gl = random(1,100)
			if gl <= 6 then
				wp = 1
				增加物品("制造指南书",dj,random(1,23))
				tp.提示:写入("#Y/你得到了一本制造指南书")
			elseif gl >= 96 then
				增加物品("百炼精铁",dj)
				tp.提示:写入("#Y/你得到了一个百炼精铁")
				wp = 1
			elseif gl > 5 and gl <= 26 then
				增加物品("魔兽要诀",高级魔兽要诀())
				tp.提示:写入("#Y/你得到了一本魔兽要诀")
				wp = 1
			elseif gl > 40 and gl <= 55 then
				增加物品(宝石())
				wp = 1
			end
		end
		s = 0
	end
	if by ~= nil then
		tp.场景.战斗:进入战斗({by})
	end
	if wp == 0 then
		if random(1,10) <= 4 then
			tp.提示:写入("#Y/你挖到了一些钱")
			tp.金钱 = tp.金钱 + 10000
			return
		elseif random(1,10) <= 1 then
			tp.提示:写入("#Y/你得到了一个梦魇幻境")
			增加物品("梦魇幻境")
		end
		tp.提示:写入("#Y/很遗憾，你什么也没挖到")
	end
end

function 引擎.跑环奖励(bl,hs,ls)
	local pj = 0
	local sl = 0
	for i=1,#tp.队伍 do
		pj = pj + tp.队伍[i].等级
		sl = sl + 1
	end
	local pj = floor(pj/sl)
	local jy = floor(pj*651+hs*(40+pj)*pj/40)
	local jq = floor(pj*100+hs*pj*10)
	tp:增加经验(jy)
	tp.金钱 = tp.金钱 + jq
	tp.储备 = tp.储备 + jq*2
	tp.提示:写入(format("#Y/你获得了%d经验，%d金钱，%d储备金",jy,jq,jq*2))
end

function 引擎.抓鬼奖励()
	local dj = tp:取进制等级(tp.队伍[1].等级)
	if dj >= 160 then
		dj = 160
	end
	-- 物品奖励
	local gl = random(1,10)
	if gl == 1 then
		增加物品("鬼王的密信")
		tp.提示:写入("#Y/你获得了鬼王的密信")
	elseif gl <= 3 then
		if random(1,10) <= 3 then
			local 三药 = {"金创药","金香玉","小还丹","千年保心丹","风水混元丹","定神香","蛇蝎美人","九转回魂丹","佛光舍利子","五龙丹"}
			local b = 三药[random(1,#三药)]
			增加物品(b)
			tp.提示:写入("#Y/你获得了"..b)
		else
			local 二药 = {"天不老","紫石英","鹿茸","血色茶花","六道轮回","熊胆","凤凰尾","硫磺草","龙之心屑","火凤之睛","丁香水","月星子","仙狐涎","地狱灵芝","麝香","血珊瑚","餐风饮露","白露为霜","天龙水","孔雀红"}
			local b = 二药[random(1,#二药)]
			增加物品(b)
			tp.提示:写入("#Y/你获得了"..b)
		end
	end
	if tp.剧情进度.抓鬼 == 5 then
		if random(1,10) <= 5 then
			if random(1,2) == 1 then
				增加物品("制造指南书",dj,random(1,23))
				tp.提示:写入("#Y/你获得了制造指南书")
			else
				增加物品("百炼精铁",dj)
				tp.提示:写入("#Y/你获得了百炼精铁")
			end
		end
	elseif tp.剧情进度.抓鬼 == 10 then
		if random(1,15) <= 8 then
			for i=1,2 do
				if random(1,2) == 1 then
					增加物品("制造指南书",dj,random(1,23))
					tp.提示:写入("#Y/你获得了制造指南书")
				else
					增加物品("百炼精铁",dj)
					tp.提示:写入("#Y/你获得了百炼精铁")
				end
			end
		end
	else
		if random(1,20) == 1 then
			if random(1,2) == 1 then
				增加物品("制造指南书",dj,random(1,23))
				tp.提示:写入("#Y/你获得了制造指南书")
			else
				增加物品("百炼精铁",dj)
				tp.提示:写入("#Y/你获得了百炼精铁")
			end
		end
	end
	-- 其他奖励
	local pj = 0
	local sl = 0
	for i=1,#tp.队伍 do
		pj = pj + tp.队伍[i].等级
		sl = sl + 1
	end
	local pj = floor(pj/sl)
	local jy = floor(pj*251+tp.剧情进度.抓鬼*(40+pj)*pj/50)
	local jq = floor(pj*100+tp.剧情进度.抓鬼*pj*10)
	tp:增加经验(jy)
	tp.金钱 = tp.金钱 + jq
	tp.储备 = tp.储备 + jq*2
	tp.提示:写入(format("#Y/你获得了%d经验，%d金钱，%d储备金",jy,jq,jq*2))
end
