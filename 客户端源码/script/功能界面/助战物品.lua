--======================================================================--
--	☆ 作者：飞蛾扑火 QQ：1415559882
--======================================================================--
local 助战物品界面 = class()
local zts,bb,tp,zts1
local yx = {{68,4},{25,28},{111,28},{24,75},{111,75},{68,97}}
local insert = table.insert
local mousea = 引擎.鼠标弹起
function 助战物品界面:初始化(根)
	self.ID = 49
	self.xx = 0
	self.yy = 0
	self.注释 = "助战物品栏"
	self.可视 = false
	self.鼠标 = false
	self.焦点 = false
	self.可移动 = true
	tp = 根
	zts = tp.字体表.普通字体
	zts1 = tp.字体表.描边字体
	self.状态 = 1
	self.窗口时间 = 0
	font = 根.字体表.人物字体_
	self.装备坐标 = {x={21,75,21,75,21,75},y={53,53,108,108,162,162},xx={176,234,176,234},yy={105,105,160,160}}
end

function 助战物品界面:打开(数据)
	if self.可视 then
		self.状态 = nil
		self.可视 = false
		if tp.窗口.助战技能栏.可视 then
			tp.窗口.助战技能栏:打开()
		end
		self.资源组 = nil
		self.物品 = nil
		self.人物装备 = nil
		self.人物灵饰 = nil
		return
	else
		insert(tp.窗口_,self)
		local 资源 = tp.资源
		local 按钮 = tp._按钮
		local 自适应 = tp._自适应
		local 滑块 = tp._滑块
		self.资源组 = {
			[0] = 自适应.创建(1,1,275,18,1,3,nil,18), --横条
			[1] = 自适应.创建(0,1,315,453,3,9),
			[2] = 按钮.创建(自适应.创建(18,4,16,16,4,3),0,0,4,true,true),
			[3] = 资源:载入('wzife.wd5',"网易WDF动画",0x01000001),
			[18] = 按钮.创建(资源:载入('wzife.wdf',"网易WDF动画",0xB15C5678),0,0,4,true,true,"查看技能"),
		}
		self.资源组[18]:置偏移(0,3)
		self.物品 = {}
		self.人物装备 = {}
		self.人物灵饰 = {}
		local 底图 =资源:载入('wzife.wdf',"网易WDF动画",0xA393A808)
		local 格子 = tp._物品格子
		for i=1,6 do
			self.人物装备[i] = 格子(0,0,i,"助战物品_人物装备",底图)
			if i<=4 then
				self.人物灵饰[i] = 格子(0,0,i,"助战物品_人物装备",底图)
			end
		end
		for i=1,20 do
			self.物品[i] = 格子.创建(0,0,i,"助战物品_物品")
		end
		self.编号 = 数据.编号
		for i=1,6 do
			self.人物装备[i]:置物品(数据.装备[i])
		end
		self.开始 = 1
		self.结束 = 20
		for q=1,20 do
			self.物品[q]:置物品(数据.道具.道具[q])
		end
		for i=1,4 do
			self.人物灵饰[i]:置物品(数据.灵饰[i])
		end
		self.状态 = 1
		tp.运行时间 = tp.运行时间 + 1
	    self.窗口时间 = tp.运行时间
	    self.可视 = true
	end
end

function 助战物品界面:刷新物品(数据)
	for q=1,20 do
		self.物品[q]:置物品(数据[q])
	end
end
function 助战物品界面:刷新装备(数据)
	for i=1,6 do
		self.人物装备[i]:置物品(数据.装备[i])
	end
	self.编号 = 数据.编号
end
function 助战物品界面:刷新灵饰(数据)
	for i=1,4 do
		self.人物灵饰[i]:置物品(数据.灵饰[i])
	end
	self.编号 = 数据.编号
end
function 助战物品界面:显示(dt,x,y)
	self.焦点 = false
	self.资源组[2]:更新(x,y)
	self.资源组[18]:更新(x,y)
	if self.资源组[2]:事件判断() then
		self:打开()
		if tp.窗口.助战技能栏.可视 then
			tp.窗口.助战技能栏:打开()
		end
		return false
	elseif self.资源组[18]:事件判断() then
		self:打开()
		tp.窗口.助战技能栏:打开(self.编号)
		tp.窗口.助战技能栏.x = self.x
		tp.窗口.助战技能栏.y = self.y
		return
	end
	self.资源组[1]:显示(self.x,self.y)
	self.资源组[0]:显示(self.x+6,self.y+3)
	self.资源组[3]:显示(self.x-10,self.y)
	tp.窗口标题背景_:置区域(0,0,84+30,16)
	tp.窗口标题背景_:显示(self.x+71+40,self.y+3)
	zts1:置字间距(1)
	zts1:显示(self.x+76+60,self.y+3,"装备系统")
	zts1:显示(self.x+40,self.y+29,"当前装备")
	zts1:显示(self.x+190,self.y+80,"当前灵饰")
	zts1:置字间距(0)
	zts1:置字间距(2)
	zts:置颜色(-16777216)
	zts:显示(self.x+110,self.y+29+5,"0")
	self.资源组[18]:显示(self.x+230,self.y+29,true)
	zts1:置颜色(4294967295)
	zts1:置字间距(0)
	self.资源组[2]:显示(self.x+216+73,self.y+5)
	local o = self.开始 - 1
	for h=1,4 do
		for l=1,5 do
			o = o + 1
			self.物品[o]:置坐标(l * 51 - 26 + self.x+5,h * 51 + 175	 + self.y)
			self.物品[o]:显示(dt,x,y,self.鼠标)
			if  tp.场景.地图.抓取物品 == nil and self.物品[o].焦点 and not tp.消息栏焦点 and self.物品[o].物品 ~= nil then
				if self.物品[o].物品 ~= nil then
					tp.提示:道具行囊(x,y,self.物品[o].物品)
					if mousea(1) and self.物品[o].物品.分类 <=12 and self.物品[o].物品.总类~=2 and self.物品[o].物品.总类~="坐骑饰品" then
						--使用物品
						发送数据(79,{编号=self.编号,物品编号=o})
					elseif mousea(1) and self.物品[o].物品 ~= nil and self.物品[o].物品.分类 >= 10 and self.物品[o].物品.分类 <=14 then
						--佩戴灵饰
						发送数据(78,{编号=self.编号,物品编号=o})
					elseif mousea(1) and self.物品[o].物品.分类 < 10 then
						--佩戴装备
						发送数据(78,{编号=self.编号,物品编号=o})
					end
				end
				self.焦点 = true
			end
		end
	end
	for i=1,6 do
		local 补差高度=3
		if i==1 or i == 2 then
		    补差高度=1
		elseif i==5 or i == 6 then
		    补差高度=2
		end
		if self.人物装备[i].物品 ~= nil and self.人物装备[i].焦点 then
			tp.提示:道具行囊(x,y,self.人物装备[i].物品)
			if mousea(1) then
				发送数据(77,{编号=self.编号,物品编号=i})
			end
		end
		if self.人物装备[i].焦点 then
			self.焦点 = true
		end
		self.人物装备[i]:置坐标(self.x+self.装备坐标.x[i]+2,self.y+self.装备坐标.y[i]-补差高度,nil,nil,4,-1)
		self.人物装备[i]:显示(dt,x,y,self.鼠标,nil,1)
	end
	for i=1,4 do
		local 补差高度=3
		if i==1 or i == 2 then
		    补差高度=1
		elseif i==5 or i == 6 then
		    补差高度=2
		end
		if self.人物灵饰[i].物品 ~= nil and self.人物灵饰[i].焦点 then
			tp.提示:道具行囊(x,y,self.人物灵饰[i].物品)
			if mousea(1) then
				发送数据(77,{编号=self.编号,物品编号=i,灵饰=1})
			end
		end
		if self.人物灵饰[i].焦点 then
			self.焦点 = true
		end
		self.人物灵饰[i]:置坐标(self.x+self.装备坐标.xx[i]+2,self.y+self.装备坐标.yy[i]-补差高度,nil,nil,4,-1)
		self.人物灵饰[i]:显示(dt,x,y,self.鼠标,nil,1)
	end
end

function 助战物品界面:检查点(x,y)
	if self.资源组 ~= nil and self.资源组[1]:是否选中(x,y)  then
		return true
	end
end

function 助战物品界面:初始移动(x,y)
	tp.运行时间 = tp.运行时间 + 1
	if not tp.消息栏焦点 then
  		self.窗口时间 = tp.运行时间
 	end
	if not self.焦点 then
		tp.移动窗口 = true
	end
	if self.鼠标 and not self.焦点 then
		self.xx = x - self.x
		self.yy = y - self.y
	end
end

function 助战物品界面:开始移动(x,y)
	if self.鼠标 then
		self.x = x - self.xx
		self.y = y - self.yy
	end
end

return 助战物品界面