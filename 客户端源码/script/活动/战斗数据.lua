--======================================================================--
-- @作者: GGE研究群: 342119466
-- @创建时间:   2018-03-03 02:34:19
-- @Last Modified time: 2018-11-13 19:47:31
--======================================================================--
local floor = math.floor
local ceil  = math.ceil
local min   = math.min
local max   = math.max

function 引擎.场景:获取战斗特长(门派,方式,强度,自由设定属性,是否pk) -- 这个就是分为职业了，不同的职业特长不同，基础以15门派作为基础
	-- 方式：加点方式，不同技能敌人不同出
	local 体力特长强度 = 0
	local 防御特长强度 = 0
	local 攻击特长强度 = 0
	local 躲闪特长强度 = 0
	local 速度特长强度 = 0
	local 法力特长强度 = 0
	local 成长方式 = 0
	if 门派 == "大唐官府" then
		if 是否pk == nil then
			if 方式 == 0 then -- 全力dt
				攻击特长强度 = 5
			elseif 方式 == 1 then -- 4力1体dt
				攻击特长强度 = 4
				体力特长强度 = 1
			elseif 方式 == 2 then -- 4力1体耐dt
				攻击特长强度 = 4
				防御特长强度 = 1
			end
		end
		成长方式 = 1
	elseif 门派 == "化生寺" then
		if 是否pk == nil then
			if 方式 == 0 then -- 爆发全魔hs
				法力特长强度 = 5
			elseif 方式 == 1 then -- 医生hs
				体力特长强度 = 2
				防御特长强度 = 2
				速度特长强度 = 1
			end
		end
		成长方式 = 1
	elseif 门派 == "神木林" then
		if 是否pk == nil then
			if 方式 == 0 then -- 全魔lsm
				法力特长强度 = 5
			elseif 方式 == 1 then -- 4魔1体lsm
				体力特长强度 = 1
				法力特长强度 = 4
			elseif 方式 == 1 then -- 4魔1耐lsm
				防御特长强度 = 1
				法力特长强度 = 4
			end
		end
		成长方式 = 1
	elseif 门派 == "方寸山" then
		if 是否pk == nil then
			if 方式 == 0 then -- 封fc
				体力特长强度 = 1
				防御特长强度 = 1
				速度特长强度 = 3
			elseif 方式 == 1 then -- 爆发全魔fc
				法力特长强度 = 5
			elseif 方式 == 2 then -- 消耗fc
				法力特长强度 = 3
				体力特长强度 = 1
				防御特长强度 = 1
			end
		end
		成长方式 = 1
	elseif 门派 == "女儿村" then
		if 是否pk == nil then
			if 方式 == 0 then -- 肉ne
				体力特长强度 = 2
				防御特长强度 = 2
				速度特长强度 = 1
			elseif 方式 == 1 then -- 速ne
				体力特长强度 = 1
				防御特长强度 = 2
				速度特长强度 = 3
			end
		end
		成长方式 = 1
	elseif 门派 == "狮驼岭" then
		if 是否pk == nil then
			if 方式 == 0 then -- 全力st
				攻击特长强度 = 5
			elseif 方式 == 1 then -- 4力1体st
				攻击特长强度 = 4
				体力特长强度 = 1
			elseif 方式 == 2 then -- 4力1体耐st
				攻击特长强度 = 4
				防御特长强度 = 1
			end
		end
		成长方式 = 2
	elseif 门派 == "魔王寨" then
		if 是否pk == nil then
			if 方式 == 0 then -- 全魔sm
				法力特长强度 = 5
			elseif 方式 == 1 then -- 4魔1体sm
				体力特长强度 = 1
				法力特长强度 = 4
			elseif 方式 == 1 then -- 4魔1耐sm
				防御特长强度 = 1
				法力特长强度 = 4
			end
		end
		成长方式 = 2
	elseif 门派 == "盘丝洞" then
		if 是否pk == nil then
			if 方式 == 0 then -- 封ps
				体力特长强度 = 2
				速度特长强度 = 3
			elseif 方式 == 1 then -- 力ps
				攻击特长强度 = 5
			elseif 方式 == 2 then -- 4力1体ps
				体力特长强度 = 1
				攻击特长强度 = 4
			elseif 方式 == 3 then -- 4力1耐ps
				防御特长强度 = 1
				攻击特长强度 = 4
			end
		end
		成长方式 = 2
	elseif 门派 == "阴曹地府" then
		if 是否pk == nil then
			if 方式 == 0 then -- 医生df
				体力特长强度 = 2
				速度特长强度 = 3
			elseif 方式 == 1 then -- 力df
				攻击特长强度 = 5
			elseif 方式 == 1 then -- 4力1体df
				体力特长强度 = 1
				攻击特长强度 = 4
			elseif 方式 == 1 then -- 4力1耐df
				防御特长强度 = 1
				攻击特长强度 = 4
			end
		end
		成长方式 = 2
	elseif 门派 == "无底洞" then
		if 是否pk == nil then
			if 方式 == 0 then -- 医生wd
				体力特长强度 = 2
				速度特长强度 = 3
			elseif 方式 == 1 then -- 封wd
				体力特长强度 = 1
				速度特长强度 = 4
			end
		end
		成长方式 = 2
	elseif 门派 == "五庄观" then
		if 是否pk == nil then
			if 方式 == 0 then -- 封wz
				体力特长强度 = 1
				防御特长强度 = 2
				速度特长强度 = 2
			elseif 方式 == 1 then -- 全力wz
				攻击特长强度 = 5
			elseif 方式 == 2 then -- 4力1体wz
				体力特长强度 = 1
				攻击特长强度 = 4
			elseif 方式 == 3 then -- 4力1耐wz
				防御特长强度 = 1
				攻击特长强度 = 4
			end
		end
		成长方式 = 3
	elseif 门派 == "天宫" then
		if 是否pk == nil then
			if 方式 == 0 then -- 封tg
				法力特长强度 = 1
				防御特长强度 = 2
				速度特长强度 = 2
			elseif 方式 == 1 then -- 全力tg
				攻击特长强度 = 5
			elseif 方式 == 2 then -- 消耗力tg
				体力特长强度 = 1
				防御特长强度 = 1
				攻击特长强度 = 3
			elseif 方式 == 3 then -- 全魔tg
				法力特长强度 = 5
			elseif 方式 == 4 then -- 消耗魔tg
				体力特长强度 = 1
				防御特长强度 = 1
				法力特长强度 = 3
			end
		end
		成长方式 = 3
	elseif 门派 == "龙宫" then
		if 是否pk == nil then
			if 方式 == 0 then -- 全魔lg
				法力特长强度 = 5
			elseif 方式 == 1 then -- 4魔1体lg
				体力特长强度 = 1
				法力特长强度 = 4
			elseif 方式 == 1 then -- 4魔1耐lg
				防御特长强度 = 1
				法力特长强度 = 4
			end
		end
		成长方式 = 3
	elseif 门派 == "普陀山" then
		if 是否pk == nil then
			if 方式 == 0 then -- 全魔pt
				法力特长强度 = 5
			elseif 方式 == 1 then -- 消耗魔pt
				体力特长强度 = 1
				防御特长强度 = 1
				法力特长强度 = 3
			elseif 方式 == 2 then -- 医生pt
				体力特长强度 = 2
				防御特长强度 = 3
			end
		end
		成长方式 = 3
	elseif 门派 == "凌波城" then
		if 是否pk == nil then
			if 方式 == 0 then -- 全力lb
				攻击特长强度 = 5
			elseif 方式 == 1 then -- 4力1体lb
				攻击特长强度 = 4
				体力特长强度 = 1
			elseif 方式 == 2 then -- 4力1体耐lb
				攻击特长强度 = 4
				防御特长强度 = 1
			end
		end
		成长方式 = 3
	elseif 门派 == "无门派" then
		成长方式 = 4
	end
	local 体力特长 = ceil(强度 * (自由设定属性[1] or 体力特长强度))
	local 防御特长 = ceil(强度 * (自由设定属性[2] or 防御特长强度))
	local 攻击特长 = ceil(强度 * (自由设定属性[3] or 攻击特长强度))
	local 躲闪特长 = ceil(强度 * (自由设定属性[4] or 躲闪特长强度))
	local 速度特长 = ceil(强度 * (自由设定属性[5] or 速度特长强度))
	local 法力特长 = ceil(强度 * (自由设定属性[6] or 法力特长强度))
	--print(体力特长,防御特长,攻击特长,躲闪特长,速度特长,法力特长)
	return {体力特长,防御特长,攻击特长,躲闪特长,速度特长,法力特长,强度,成长方式}
end

function 引擎.场景:战斗数据(方式,等级,难度,增长,特长,曲线)
	local 属性表 = {}
	local 等级1 = 等级 + 增长
	if 方式 == 1 then
		等级 = 0
		for n=1,#self.队伍 do
		    等级 = 等级 + 160
		end
		等级 = floor(等级 / #self.队伍)
		等级1 = 等级 + 增长
	end
	特长 = self:获取战斗特长(特长[1],特长[2],特长[3],特长[4],特长[5])
	local 体力资质 = 1000--floor((成长*1000) + (难度 * (特长[1]*(成长+特长[7]))))
	local 防御资质 = 1000--floor((等级*难度 + 特长[2]*难度 + 特长[7]*难度)*成长)
	local 攻击资质 = 1000--floor((等级*难度 + 特长[3]*难度 + 特长[7]*难度)*成长)
	local 躲闪资质 = 1000--floor((等级*难度 + 特长[4]*难度 + 特长[7]*难度)*成长)
	local 速度资质 = 1000--floor((等级*难度 + 特长[5]*难度 + 特长[7]*难度)*成长)
	local 法力资质 = 1000--floor((等级*难度 + 特长[6]*难度 + 特长[7]*难度)*成长)
	if 特长[8] == 4 then
		属性表[1] = ceil((等级1*难度)+(特长[1]*特长[7])*1.2)
		属性表[2] = ceil(((等级1*难度)+(特长[2]*特长[7]))*0.45)
		属性表[3] = ceil((39+(等级1*难度)+(特长[3]*特长[7]))*0.67)
		属性表[4] = ceil(10+((等级1*难度)+(特长[4]*特长[7]))*0.15)
		属性表[5] = ceil(((等级1*难度)+(特长[5]*特长[7]))*0.12)
		属性表[6] = ceil(((等级1*难度)+(特长[6]*特长[7]))*0.3)
	end
	--print("体力："..属性表[1],"防御："..属性表[2],"攻击："..属性表[3],"躲避："..属性表[4],"速度："..属性表[5],"法力："..属性表[6])
	return 属性表
end