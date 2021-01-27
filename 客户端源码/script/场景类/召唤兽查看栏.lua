--======================================================================--

--======================================================================--
local 场景类_召唤兽查看栏 = class()
local floor = math.floor
local xslb,bb,lb,tp,fy,gz
local format = string.format
local insert = table.insert

function 场景类_召唤兽查看栏:初始化(根)
	self.ID = 35
	self.x = 271
	self.y = 117
	self.xx = 0
	self.yy = 0
	self.注释 = "副本创建栏"
	self.可视 = false
	self.鼠标 = false
	self.焦点 = false
	self.可移动 = true
	self.窗口时间 = 0
	tp = 根
end

function 场景类_召唤兽查看栏:打开(b,l,c)
	if b~=nil and self.可视 then self.可视=false end
	if self.可视 then
		if b ~= nil and bb ~= b then
			bb = b
			fy = 0
			for n=1,#bb.技能 do
		  		self.技能[n] = gz(0,0,n,"技能查看")
			    local 临时技能=tp._技能.创建()
			    if bb.技能[n] ~= nil then
				   临时技能:置对象(bb.技能[n],2)
				   self.技能[n]:置技能(临时技能)
			    else
			       break
			    end
			end
			self:置形象()
			tp.运行时间 = tp.运行时间 + 1
		    self.窗口时间 = tp.运行时间
		    return false
		end
		fy = nil
		bb = nil
		xslb = nil
		self.可视 = false
		self.资源组=nil
		self.技能=nil
		return
	else
		fy = 0
		bb = b
		self.技能={}
		insert(tp.窗口_,self)
		self:加载资源()
		for n=1,#bb.技能 do
	  		self.技能[n] = gz(0,0,n,"技能查看")
		    local 临时技能=tp._技能.创建()
		    if bb.技能[n] ~= nil then
			   临时技能:置对象(bb.技能[n],2)
			   self.技能[n]:置技能(临时技能)
		    else
		       break
		    end
		end
		self:置形象()
		tp.运行时间 = tp.运行时间 + 1
	    self.窗口时间 = tp.运行时间
	    self.可视 = true
	end
end
function 场景类_召唤兽查看栏:加载资源()
	local 资源 = tp.资源
	local 按钮 = tp._按钮
	self.资源组 = {
		[1] = 资源:载入('wzife.wdf',"网易WDF动画",0x536A7E15),
		[2] = 按钮.创建(tp.资源:载入('wzife.wdf',"网易WDF动画",0xF11233BB),0,0,4,true,true),
		[3] =  按钮.创建(资源:载入('wzife.wdf',"网易WDF动画",0x86D66B9A),0,0,4,true,true,"显示类型"),
		[4] =  按钮.创建(tp.资源:载入('wzife.wdf',"网易WDF动画",0x7AB5584C),0,0,3,true,true),
		[5] =  按钮.创建(tp.资源:载入('wzife.wdf',"网易WDF动画",0xCB50AB1D),0,0,3,true,true),
	}
	self.技能 = {}
	for n=2,5 do
	    self.资源组[n]:绑定窗口_(35)
	end
	gz = tp._技能格子
end

function 场景类_召唤兽查看栏:置形象()
	if bb ~= nil then
		self.资源组[6] = nil
		self.资源组[7] = nil
		local n = 引擎.取战斗模型(bb.模型)
		self.资源组[6] = tp.资源:载入(n[10],"网易WDF动画",n[6])
		if 引擎.取战斗模型(bb.模型.."_饰品") ~= nil and #引擎.取战斗模型(bb.模型.."_饰品") >0 then
			n = 引擎.取战斗模型(bb.模型.."_饰品")
			self.资源组[7] = tp.资源:载入(n[10],"网易WDF动画",n[6])
		end
		if bb.染色方案 ~= nil then
			if bb.染色方案 == "黑白" then
				self.资源组[6]:置染色("黑白",ARGB(255,235,235,235))
				self.资源组[6]:置方向(0)
				if bb.饰品 ~= nil then
					self.资源组[7]:置染色("黑白",ARGB(255,185,185,185))
					self.资源组[7]:置方向(0)
				end
			else
				self.资源组[6]:置染色(bb.染色方案,bb.染色组[1],bb.染色组[2],bb.染色组[3])
				self.资源组[6]:置方向(0)
			end
		end
	end
end

function 场景类_召唤兽查看栏:显示(dt,x,y)
	self.焦点 = false
	self.资源组[2]:更新(x,y)
	self.资源组[4]:更新(x,y,fy == 12)
	self.资源组[5]:更新(x,y,#bb.技能>12 and fy == 0)
	self.资源组[1]:显示(self.x,self.y)
	self.资源组[2]:显示(self.x + 431,self.y + 6)
	self.资源组[4]:显示(self.x + 436,self.y + 278)
	self.资源组[5]:显示(self.x + 436,self.y + 312)
	if lb == nil then
		self.资源组[3]:更新(x,y)
		self.资源组[3]:显示(self.x + 6,self.y+2,true)
	end
	if self.鼠标 then
		if self.资源组[2]:事件判断() then
			self:打开()
			return false
		elseif self.资源组[3] ~= nil and self.资源组[3]:事件判断() then
			if xslb == nil then
				xslb = true
				self.资源组[3]:置文字("关闭类型")
			else
				xslb = nil
				self.资源组[3]:置文字("显示类型")
			end
		elseif self.资源组[4]:事件判断() then
			if fy == 0 then
				tp.提示:写入("#Y/已经到顶了!")
			else
				fy = 0
			end
		elseif self.资源组[5]:事件判断() then
			if fy == 12 then
				tp.提示:写入("#Y/已经到最下面!")
			else
				fy = 12
			end
		end
	end
	if self.资源组[6] ~= nil then
		tp.影子:显示(self.x + 116,self.y+152)
		self.资源组[6]:更新(dt)
		self.资源组[6]:显示(self.x + 116,self.y+152)
		if self.资源组[7] ~= nil then
			self.资源组[7]:更新(dt)
			self.资源组[7]:显示(self.x + 116,self.y+152)
		end
	end
	local 字体 = tp.字体表.普通字体
	字体:置颜色(ARGB(255,255,255,255))
	local v = ""
	if xslb then
		if bb.种类==nil then
			v = "(未知)"
		else
			v = "("..bb.种类..")"
		end
	end
	字体:显示(self.x + 50,self.y + 35,bb.模型..v)
	字体:置颜色(-16711936)
	--字体:显示(self.x + 50 + #bb.名称*7.2,self.y + 35,v)
	字体:置颜色(-16777216)
	字体:显示(self.x + 75,self.y + 181,bb.名称)
	字体:显示(self.x + 95,self.y + 209,bb.参战等级)
	字体:显示(self.x + 219,self.y + 209,bb.等级)
	字体:显示(self.x + 62,self.y + 233,bb.气血)
	字体:显示(self.x + 62,self.y + 256,bb.魔法)
	字体:显示(self.x + 62,self.y + 280,bb.伤害)
	字体:显示(self.x + 62,self.y + 305,bb.防御)
	字体:显示(self.x + 62,self.y + 328,bb.速度)
	字体:显示(self.x + 62,self.y + 353,bb.灵力)

	字体:显示(self.x + 206,self.y + 232,20)
	字体:显示(self.x + 206,self.y + 257,20)
	字体:显示(self.x + 206,self.y + 280,20)
	字体:显示(self.x + 206,self.y + 305,20)
	字体:显示(self.x + 206,self.y + 328,20)
	字体:显示(self.x + 206,self.y + 352,0)

	字体:显示(self.x + 374,self.y + 33,bb.攻击资质)
	字体:显示(self.x + 374,self.y + 55,bb.防御资质)
	字体:显示(self.x + 374,self.y + 77,bb.体力资质)
	字体:显示(self.x + 374,self.y + 101,bb.法力资质)
	字体:显示(self.x + 374,self.y + 122,bb.速度资质)
	字体:显示(self.x + 374,self.y + 144,bb.躲闪资质)
   	if bb.种类=="神兽" then
      	字体:显示(self.x + 374,self.y + 170,"★永生★")
   	else
   	 	字体:显示(self.x + 374,self.y + 170,bb.寿命)
	end
	字体:显示(self.x + 374,self.y + 192,bb.成长)
	字体:显示(self.x + 374,self.y + 215,bb.五行)
	local xx = 0
	local yy = 0
	for n=1,12 do
		if self.技能[n+fy] ~= nil and self.技能[n+fy].技能 ~= nil then
			self.技能[n+fy]:置坐标(self.x+266+(xx*42),self.y+240+(yy*42))
			self.技能[n+fy]:显示(x,y,self.鼠标)
			if self.技能[n+fy].焦点 then
				tp.提示:技能(x,y,self.技能[n+fy].技能)
			end
			xx = xx + 1
			if xx > 3 then
				xx = 0
				yy = yy + 1
			end
		end
	end
end

function 场景类_召唤兽查看栏:检查点(x,y)
	if self.资源组 ~= nil and self.资源组[1]:是否选中(x,y)  then
		return true
	end
end

function 场景类_召唤兽查看栏:初始移动(x,y)
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

function 场景类_召唤兽查看栏:开始移动(x,y)
	if self.鼠标 then
		self.x = x - self.xx
		self.y = y - self.yy
	end
end

return 场景类_召唤兽查看栏