--======================================================================--
-- @作者: GGE研究群: 342119466
-- @创建时间:   2018-03-03 02:34:19
-- @Last Modified time: 2018-11-13 19:47:31
--======================================================================--
local 内存类_敌人 = class()
local floor = math.floor
local ceil = math.ceil
local insert = table.insert
local random = 引擎.取随机整数
local jns = require("script/显示类/技能")
local 成长 = 0
local cf = 删除重复
local ems = 引擎.取敌人信息
local typ = type
local 五行_ = {"金","木","水","火","土"}
local ski = 引擎.取技能
--local 速度资质 =
--local 躲闪资质 = random(((self.等级*24/7)+900)*0.95,((self.等级*30/7)+900))
function 内存类_敌人:初始化(模型)
	local n = 模型
	if typ(n) == "number" then
		n = ems(模型)
	end
	self.名称 = n[1]
	self.模型 = n[2]
	self.等级 = n[3] or 0
	self.种类 = n[11]
	self.智能 = n[19]
	self.修炼 = {攻击修炼={0,0},法术修炼={0,0},防御修炼={0,0},速度修炼={0,0}}
	self.掉落 = {n[30] or floor((self.等级*1*1000/19+41)),floor(self.等级*5+10)}
	self.门派 = n[20]
	self.技能等级 = n[21] or self.等级
	local jc = self.等级 + 20
	self.体质 = jc
	self.魔力 = jc
	self.力量 = jc
	self.耐力 = jc
	self.敏捷 = jc
	self.最大魔法 = 99999999999999
	self.愤怒 = 150
	if n[18] then
		self.最大气血 = n[18][1]
		self.防御 = n[18][2]
		self.伤害 = n[18][3]
		self.躲避 = n[18][4]
		self.速度 = n[18][5]
		self.灵力 = n[18][6]
		self.最大魔法 = n[18][7] or 99999999999999
	else
		local 法力资质 = random(((self.等级*72/7)+1700)*0.95,((self.等级*96/7)+1700))
		local 成长 = random(((self.等级*2/8.45)+100)*0.95,((self.等级*2/8.45)+100))/100
		self.最大气血 = ceil(self.等级*random(((self.等级*96/7)+2600)*0.95,((self.等级*96/7)+2600))/1000+self.体质*成长*6)
		self.最大魔法 = ceil(self.等级*法力资质/500+self.魔力*成长*3)
		self.伤害 = ceil(self.等级*random(((self.等级*30/7)+950)*0.95,((self.等级*30/7)+950))*(成长+1.4)/750+self.力量*成长)
		self.防御 = ceil(self.等级*random(((self.等级*24/7)+1000)*0.95,((self.等级*24/7)+1000))*(成长+1.4)/1143+self.耐力*(成长-1/253)*253/190)
		self.速度 = ceil(random(((self.等级*26/7)+950)*0.95,((self.等级*30/7)+950)) * self.敏捷/1000)
		self.灵力 = ceil(self.等级*(法力资质+1666)/3333+self.魔力*0.7+self.力量*0.4+self.体质*0.3+self.耐力*0.2)
	end
	self.气血 = self.最大气血
	self.魔法 = self.最大魔法
	self.武器 = n[16]
	self.技能 = {}
	if n[15] then
		self.技能 = n[14]
	else
		for q=1,#(n[14] or {}) do
			insert(self.技能, n[14][random(1,#n[14])])
		end
		self.技能 = cf(self.技能)
	end
	self.战斗技能 = {}
	for i=1,#self.技能 do
		local p1 = self.技能[i]
		local p = ski(p1)
		self.技能[i] = {名称=p1,种类=p[3]}
		if self.技能[i].种类 == 4 or self.技能[i].种类 == 2 or self.技能[i].种类 == 3 or self.技能[i].种类 == 5 or self.技能[i].种类 == 6 or self.技能[i].种类 == 10 then
			insert(self.战斗技能,self.技能[i])
		end
	end
	self.五行 = 五行_[random(1,5)]
	self.染色方案 = n[12]
	self.染色组 = n[13]
end

return 内存类_敌人