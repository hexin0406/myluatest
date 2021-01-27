
local 场景类_攻城战 = class()
local bw = require("gge包围盒")(0,0,140,34)
local box = 引擎.画矩形
local format = string.format
local floor = math.floor
local min = math.min
local max = math.max
local tp,zts,zts1,zts2,ztstt3
local ceil = math.ceil
local keyaz = 引擎.按键按住
local tostring = tostring
local mousea = 引擎.鼠标按住
local mouseb = 引擎.鼠标弹起
local insert = table.insert

function 场景类_攻城战:初始化(根)
	self.ID = 9001
	self.x = 0
	self.y = 395
	self.xx = 0
	self.yy = 0
	self.注释 = "攻城战伤害数据"
	self.可视 = false
	self.鼠标 = false
	self.焦点 = false
	self.可移动 = true
	local 资源 = 根.资源
	local 按钮 = 根._按钮
	local 自适应 = 根._自适应
	tp = 根
	self.资源组 = {
		[0] = 自适应.创建(1,1,450,18,1,3,nil,18),
		[1] = 自适应.创建(0,1,460,200,3,9),
		[2] = 按钮.创建(自适应.创建(18,4,16,16,4,3),0,0,4,true,true),
		[3] = 按钮.创建(自适应.创建(20,4,18,19,4,3),0,0,4,true,true),--上滚动
		[4] = 按钮.创建(自适应.创建(21,4,18,19,4,3),0,0,4,true,true),--下滚动
		[5] = 按钮.创建(自适应.创建(12,4,50,19,1,3),0,0,4,true,true,"刷 新")
		--[5] = 按钮.创建(自适应.创建(12,4,57,22,1,3),0,0,4,true,true,"参 战"),
		--[6] = 按钮.创建(自适应.创建(12,4,57,22,1,3),0,0,4,true,true,"休 息"),
		--[7] = 自适应.创建(34,1,140,230,3,9),--召唤兽选择框
	}
	for i=3,5 do
		self.资源组[i]:绑定窗口_(9001)
	end
	self.选中 = 0
	self.加入 = 0
	zts = tp.字体表.普通字体
end

function 场景类_攻城战:打开(数据)
	if self.可视 then
		self.选中 = 0
		self.加入 = 0
		self.可视 = false
		return
	else
		self.选中 = 0
		self.加入 = 0
		self.数据 = 数据
		insert(tp.窗口_,self)
		tp.运行时间 = tp.运行时间 + 1
	    self.窗口时间 = tp.运行时间
	    self.可视 = true
	end
end
function 场景类_攻城战:刷新(攻城数据)
	self.数据 = 攻城数据

end
function 场景类_攻城战:显示(dt,x,y)
	self.资源组[1]:显示(self.x,self.y)
	self.资源组[0]:显示(self.x+6,self.y+3)
	tp.窗口标题背景_:置区域(0,0,70,16)
	tp.窗口标题背景_:显示(self.x+194,self.y+5)
	self.资源组[5]:更新(x,y)
	self.资源组[5]:显示(self.x+400,self.y+3)
	zts:置颜色(红色)
	zts:显示(self.x+200,self.y+6,"攻城信息")
	zts:置颜色(黄色)
	zts:显示(self.x+10,self.y+30,"守城方")
	zts:显示(self.x+10,self.y+70,"攻城方")
	if self.资源组[5]:事件判断() then
		发送数据(26.8)
	end
	if self.数据.守城方.守城天数==nil then
       zts:显示(self.x+10,self.y+50,"帮派名称:  当前无帮派占领")
       zts:显示(self.x+85.5,self.y+70,"伤害倍数: 1")
    else
        zts:显示(self.x+10,self.y+50,"帮派名称:  "..self.数据.守城方.帮派名称)
        zts:显示(self.x+200,self.y+50,"抵消伤害:  "..self.数据.守城方.抵消伤害)
        zts:显示(self.x+360,self.y+50,"守城天数: "..self.数据.守城方.守城天数)
        zts:显示(self.x+85.5,self.y+70,"伤害倍数: "..(self.数据.守城方.守城天数*0.5+1))
    end
	for i=1,#self.数据.攻城方 do
		if self.数据.攻城方[i] ~= nil then
			zts:显示(self.x+10,self.y+90+(i*20)-20,"帮派名称:  "..self.数据.攻城方[i].帮派名称)
			zts:显示(self.x+200,self.y+90+(i*20)-20,"攻城伤害:  "..self.数据.攻城方[i].木桩伤害)
        else
        	zts:显示(self.x+10,self.y+90+(i*20)-20,"帮派名称:  当前无帮派攻城")
		end
	end

end

function 场景类_攻城战:检查点(x,y)
	if self.资源组 ~= nil and self.资源组[1]:是否选中(x,y)  then
		return true
	end
end

function 场景类_攻城战:初始移动(x,y)
	tp.运行时间 = tp.运行时间 + 1
	if not tp.消息栏焦点 then
  		self.窗口时间 = tp.运行时间
 	end
	if not self.焦点 then
		tp.移动窗口 = true
	end
	if self.鼠标 and  not self.焦点 then
		self.xx = x - self.x
		self.yy = y - self.y
	end
end

function 场景类_攻城战:开始移动(x,y)
	if self.鼠标 then
		self.x = x - self.xx
		self.y = y - self.yy
	end
end

return 场景类_攻城战
