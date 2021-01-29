local GUI按钮
local GUI控件
local GUI容器
local GUI列表
local GUI超级列表
local GUI滑块
local GUI窗口
local GUI界面
local GUI输入
local GUI

local 输入框组 = {}

--=========================================================================
GUI按钮 = class()

function GUI按钮:初始化(名称)
	self.t焦点 		= false
	self.x,self.y  	= 0,0
	self.t名称 		= 名称
	self.t鼠标按下 	= false
	self.t按钮组 	= {}
	self.t禁止 		= false
	self.t可见 		= true
	self.t层次 		= 1
end
function GUI按钮:置选中(v)
	
	if v then
	    for k,v in pairs(self.t按钮组) do
	    	if(v.t选中)then v:发送消息(2,"取消选中");v.t选中 = false; end
	    end
	     self:发送消息(1,"选中")
	else
		self:发送消息(1,"取消选中")
	end
	self.t选中 = v
end

function GUI按钮:置可见(v)
	self.t可见 		= v
	self.t焦点 		= false
	self.t鼠标按下 	= false
	self:发送消息(1,v and '可见' or '取消可见')
end
function GUI按钮:置禁止(v)
	self.t禁止 		= v
	self.t焦点 		= false
	self.t鼠标按下 	= false
	self:发送消息(1,v and '禁止' or '取消禁止')
end
function GUI按钮:是否碰撞()
	return self.t焦点
end
function GUI按钮:是否按下()
	return self.t鼠标按下
end
function GUI按钮:是否选中()
	return self.t选中
end
function GUI按钮:是否禁止()
	return self.t禁止
end
function GUI按钮:是否可见()
	return self.t可见
end
function GUI按钮:发送消息(类型,消息,参数)
	if self.t加载 then
		if self.按钮消息 then --全局消息
		    self.按钮消息(类型,消息,参数,self.t名称)
		end
		if self.消息事件 then
		    return self:消息事件(类型,消息,参数)
		end
	end

	return true
end
function GUI按钮:更新_内部()
	if self.t可见 and not self.t禁止 then
		local x,y = 引擎.取鼠标坐标()
		if  self:检查点(x,y)  then 
			if(not self.t焦点)then 
				self:发送消息(1,"获得焦点") end
			self.t焦点 = true
			if 引擎.鼠标按下(KEY.LBUTTON) then
				self:发送消息(1,"鼠标按下")
				self.t鼠标按下 = true
			end
			if 引擎.鼠标按住(KEY.LBUTTON) then
				self:发送消息(1,"鼠标按住")
			end
			if self.t鼠标按下 and 引擎.鼠标弹起(KEY.LBUTTON) then
			    self.t鼠标按下 = false
			    self:发送消息(1,"鼠标弹起")
			    if self.t单选型 and not self.t选中 then
				    for k,v in pairs(self.t按钮组) do
				    	if(v.t选中)then v:发送消息(2,"取消选中");v.t选中 = false; end
				    end
				    self:发送消息(1,"选中")
				    self.t选中 = true
				elseif self.t选择型  then
					if self.t选中 then
						self:发送消息(1,"取消选中")
						self.t选中 = false
					else
						self:消息事件(1,"选中")
						self.t选中 = true
					end
			    end
			end
		elseif self.t焦点 and not self.t鼠标按下 then
		    self.t焦点 = false
		    self:发送消息(1,"失去焦点")
		elseif self.t鼠标按下 and 引擎.鼠标弹起(KEY.LBUTTON) then
			self.t鼠标按下 = false
		end
	end

end
--======================================================================--
--======================================================================--
--======================================================================--
GUI控件 = class()

function GUI控件:初始化(名称)
	self.t焦点 		= false
	self.x,self.y  	= 0,0
	self.t名称 		= 名称
	self.t鼠标按下 	= false
	self.t层次 		= 1
	self.t可见 		= true
end

function GUI控件:置可见(v)
	self.t可见 = v
end

function GUI控件:是否碰撞()
	return self.t焦点
end

function GUI控件:是否按下()
	return self.t鼠标按下
end

function GUI控件:发送消息(类型,消息,a)

	if self.消息事件 then
	    return self:消息事件(类型,消息,a)
	end
	return true
end
function GUI控件:更新_内部()
	if self.t可见 then
		local x,y = 引擎.取鼠标坐标()
		if   self:检查点(x,y)  then 
			if(not self.t焦点)then 
				self:发送消息(1,"获得焦点") end
			self.t焦点 = true
			if 引擎.鼠标按下(KEY.LBUTTON) then
				self:发送消息(1,"鼠标按下",self.t窗口)
				self.t鼠标按下 = true
			end
			if self.t鼠标按下 and 引擎.鼠标弹起(KEY.LBUTTON) then
			    self.t鼠标按下 = false
			    self:发送消息(1,"鼠标弹起",self.t窗口)
			end
		elseif self.t焦点 and not self.t鼠标按下 then
		    self.t焦点 = false
		    self:发送消息(1,"失去焦点")
		elseif self.t鼠标按下 and 引擎.鼠标弹起(KEY.LBUTTON) then
			self.t鼠标按下 = false
		end
	end

end
-- --======================================================================--
-- --======================================================================--
-- --======================================================================--
-- GUI容器 = class()
-- function GUI容器:初始化(名称)
-- 	self.t按钮组 	= {}
-- 	self.t单选组 	= {}
-- 	self.名称 		= 名称
-- 	self.t可见 		= true
-- 	self.t层次  	= 1
-- end
-- function GUI容器:初始化_内部()
-- 	for k,v in pairs(self.t单选组) do
-- 		v:初始化()
-- 	end
-- end
-- function GUI容器:更新(dt,x,y)--此坐标为窗口坐标
-- 	for k,v in pairs(self.t单选组) do
-- 		v:更新(dt,x,y)
-- 	end
-- end
-- function GUI容器:更新_内部()
-- 	for k,v in pairs(self.t单选组) do
-- 		v:更新_内部()
-- 	end
-- end
-- function GUI容器:显示()
-- 	for k,v in pairs(self.t单选组) do
-- 		v:显示()
-- 	end
-- end
-- function GUI容器:发送消息(类型,消息,a)
-- 	for k,v in pairs(self.t单选组) do
-- 		local ret =  v:发送消息(0,消息,a)
-- 		if not ret then
-- 		    return ret
-- 		end 
-- 	end
-- 	return true
-- end
-- function GUI容器:创建容器()
	
-- end
-- function GUI容器:创建按钮(名称)
-- 	local 按钮 			= GUI按钮.创建(名称)
-- 	self.t按钮组[名称] 	= 按钮
-- 	return 按钮
-- end
-- function GUI容器:创建复选按钮(名称)
-- 	local 按钮 			= GUI按钮.创建(名称)
-- 	按钮.t选择型 		= true
-- 	self.t按钮组[名称] 	= 按钮

-- 	return 按钮
-- end
-- function GUI容器:创建单选按钮(名称)
-- 	local 按钮 			= GUI按钮.创建(名称)
-- 	按钮.t单选型 		= true
-- 	按钮.t按钮组 		= self.t单选组
-- 	self.t单选组[名称] 	= 按钮

-- 	return 按钮
-- end
-- function GUI容器:创建控件(名称)

-- end

--=========================================================================
--======================================================================--
--======================================================================--
GUI列表 = class()
function GUI列表:初始化(名称,文字,宽度,高度)
	self.t内容 		= {}
	self.t选中项 	= 0
	self.t焦点项 	= 0
	self.t焦点 		= false
	self.x,self.y  	= 0,0
	self.t名称 		= 名称
	self.t文字 		= 文字
	self.t文字高度 	= self.t文字.大小
	self.t行距 		= 1
	self.t行高度 	= self.t文字高度 +self.t行距 -- 一行占用高度
	self.t鼠标按下 	= false
	self.t高度 		= 高度
	self.t可显示数 	= math.floor(self.t高度 /self.t行高度 ) -- 最多可显示数量
	self.t起始显示 	= 1 --滚动后,起始显示的位置
	self.t显示数 	= 0
	self.t可见 		= true
	self.t层次  	= 1



	self.t选中精灵 = require("gge精灵类")(0,0,0,宽度,self.t文字高度):置颜色(0x80808080)
	self.t焦点精灵 = require("gge精灵类")(0,0,0,宽度,self.t文字高度):置颜色(0x80008000)
	self.t焦点精灵偏移 = 0
	self.t选中精灵偏移 = 0
	self.t焦点精灵可见 = false
	self.t选中精灵可见 = false
end
function GUI列表:置选中精灵(v)
	self.t选中精灵 	= v
end
function GUI列表:置焦点精灵(v)
	self.t焦点精灵 	= v
end
function GUI列表:置底图精灵(v)
	self.t底图精灵 	= v
end
function GUI列表:置标题颜色(i,v)
	if self.t内容[i] then
	    self.t内容[i][3] = v
	end
	
end
function GUI列表:置标题(i,v)
	self.t内容[i][1] = v
end
function GUI列表:置可见(v)
	self.t可见 		= v
end
function GUI列表:置行距(v)
	self.t行距 		= v
	self.t行高度 	= self.t文字高度 +self.t行距 -- 一行占用高度
	self.t可显示数 	= math.floor(self.t高度 /self.t行高度 ) -- 最多可显示数量
end
function GUI列表:置选中(v)
	if v<=#self.t内容 then
		self.t选中项 = v
		
		self.t选中精灵偏移 = (v-1)*self.t行高度
		self.t选中精灵可见 = true
		self:发送消息(1,"选中",self.t选中项 )
		if v >self.t可显示数 then
		    self.t起始显示 = v - self.t可显示数
		end
	end

end
function GUI列表:滚动到(v)
	local 位置 = math.floor(v/100*#self.t内容)
	self.t起始显示 = 位置
	if self.t起始显示 <1 or self.t起始显示 <=self.t可显示数 then
	    self.t起始显示=1
	elseif self.t起始显示 >#self.t内容-self.t可显示数 then
		self.t起始显示=#self.t内容-self.t可显示数+1
	end
	local x = self.t选中项- self.t起始显示+1
	if x>0 and x <=self.t可显示数 then
		self.t选中精灵偏移 = (self.t选中项-self.t起始显示)*self.t行高度
		self.t选中精灵可见 = true
	else
		self.t选中精灵可见 = false
	end
end
function GUI列表:取选中()
	return self.t选中项 
end
function GUI列表:取标题(i)
	if self.t内容[i] then
	    return self.t内容[i][1]
	end
	return ''
end
function GUI列表:取ID(i)
	return self.t内容[i][2]
end
function GUI列表:取数量()
	return #self.t内容
end
function GUI列表:是否碰撞()
	return self.t焦点
end
function GUI列表:添加(标题,颜色,id)
	id = id or #self.t内容
	颜色 = 颜色 or 0xFFFFFFFF
	table.insert(self.t内容 , {标题,id,颜色})
	if #self.t内容 <= self.t可显示数 then
	    self.t显示数 = #self.t内容 
	else
		 self.t显示数 = self.t可显示数 
	end
end
function GUI列表:清空()
	self.t内容 		= {}
	self.t选中项 	= 0
	self.t焦点项 	= 0
	self.t焦点 		= false
	self.t起始显示 	= 1
	self.t焦点精灵可见 = false
	self.t选中精灵可见 = false
	self.t显示数 	= 0
end
function GUI列表:删除(i)
	if #self.t内容 >0 then
		i = i or self.t选中项 
		self:发送消息(1,"删除",i)
		table.remove(self.t内容 , i)
		--当在尾部删除,选中会上移
		if #self.t内容 >=self.t可显示数 and (self.t起始显示 +self.t可显示数 -1)>#self.t内容 then --数量超过一屏
			self.t选中项 =  self.t选中项 -1
		    self.t起始显示 = self.t起始显示 -1
		elseif self.t选中项 >#self.t内容 then
		    self.t选中项 =  self.t选中项 -1
		end
		self:发送消息(1,"选中",self.t选中项 )
		if #self.t内容 <= self.t可显示数 then
		    self.t显示数 = #self.t内容 
		    if #self.t内容 ==0 then
		    	self.t选中精灵可见 = false
		    	self:发送消息(1,"取消选中")
		    else
		    	self.t选中精灵偏移 = (self.t选中项 -1)*self.t行高度
		    end
		else
			self.t显示数 = self.t可显示数 
		end
	end

end
function GUI列表:发送消息(类型,消息,...)
	if self.消息事件 then
	    return self:消息事件(类型,消息,...)
	end
	return true
end
function GUI列表:更新_内部(dt,窗口x,窗口y)
	local x,y = 引擎.取鼠标坐标()
	if self:检查点(x,y)  then 
		if(not self.t焦点 )then self:发送消息(1,"获得焦点") end
		self.t焦点 = true
		if #self.t内容 >0 then self.t焦点精灵可见 = true end

		local 焦点项 = math.ceil((y-窗口y-self.y)/self.t行高度)

		if  焦点项 <= #self.t内容 and self.t焦点项 ~= 焦点项 and 焦点项 <=self.t显示数 then
			self.t焦点项 = 焦点项 --发头焦点Y坐标，和位置
			self.t焦点精灵偏移 = (self.t焦点项 -1)*self.t行高度
			if self.t焦点精灵偏移 <0 then self.t焦点精灵偏移 = 0 end
			self:发送消息(1,"焦点项改变",self.t焦点项)
		end
		if 引擎.鼠标按下(KEY.LBUTTON) then
			self:发送消息(1,"鼠标按下")
			self.t鼠标按下 = true
		end
		if self.t鼠标按下 and 引擎.鼠标弹起(KEY.LBUTTON) then
		    self.t鼠标按下 = false
		    self:发送消息(1,"鼠标弹起")
		    if self.t内容[焦点项] and 焦点项 <=self.t显示数 then
			    self.t选中项 = self.t焦点项+self.t起始显示-1
			    self.t选中精灵偏移 = (self.t焦点项-1)*self.t行高度
			    self:发送消息(1,"选中",self.t选中项)
			    self.t选中精灵可见 = true
		    end
		end
		
		local 滚动值 = 引擎.取鼠标滚轮()
		if 滚动值 ~=0 and #self.t内容 >self.t可显示数 then
			self.t起始显示 = self.t起始显示 - 滚动值
			if self.t起始显示 <1 then
			    self.t起始显示=1
			elseif self.t起始显示 >#self.t内容-self.t可显示数 then
				self.t起始显示=#self.t内容-self.t可显示数+1
			end
			local x = self.t选中项- self.t起始显示+1
			if x>0 and x <=self.t可显示数 then
				self.t选中精灵偏移 = (self.t选中项-self.t起始显示)*self.t行高度
				self.t选中精灵可见 = true
			else
				self.t选中精灵可见 = false
			end
		end
	elseif self.t焦点 then
	    self.t焦点 = false
	   	self.t焦点精灵可见 = false
	elseif self.t鼠标按下 and 引擎.鼠标弹起(KEY.LBUTTON) then
		self.t鼠标按下 = false
	end
end

function GUI列表:显示_内部(x,y)
	if self.t选中精灵可见 then self.t选中精灵:显示(x+self.x,y+self.y+self.t选中精灵偏移) end
	if self.t焦点精灵可见 then self.t焦点精灵:显示(x+self.x,y+self.y+self.t焦点精灵偏移) end
	for i=self.t起始显示,self.t起始显示+self.t显示数-1 do
		if self.t底图精灵 then self.t底图精灵:显示(x+self.x,y+self.y+(i-self.t起始显示)*self.t行高度) end
	    self.t文字:置颜色(self.t内容[i][3]):显示(x+self.x,y+self.y +(i-self.t起始显示)*self.t行高度,self.t内容[i][1])
	end

end
--======================================================================--
--======================================================================--
--======================================================================--

GUI超级列表 = class()


function GUI超级列表:初始化(名称,文字,宽度,高度)
	self.t内容 		= {}
	self.t选中项 	= 0
	self.t焦点项 	= 0
	self.t焦点 		= false
	self.x,self.y  	= 0,0
	self.t名称 		= 名称
	self.t文字 		= 文字
	self.t文字高度 	= self.t文字.大小
	self.t行距 		= 1
	self.t行高度 	= self.t文字高度 +self.t行距 -- 一行占用高度
	self.t鼠标按下 	= false
	self.t可显示数 	= math.floor(高度/self.t行高度)
	self.t起始显示 	= 1
	self.t显示数 	= 0
	self.t可见 		= true

	self.t列宽 		= 0
	self.t列项 		= {}
	self.t层次  		= 1

	self.t选中精灵 = require("gge精灵类")(0,0,0,宽度,self.t文字高度):置颜色(0x80808080)
	self.t焦点精灵 = require("gge精灵类")(0,0,0,宽度,self.t文字高度):置颜色(0x80008000)
	self.t焦点精灵偏移 = 0
	self.t选中精灵偏移 = 0
	self.t焦点精灵可见 = false
	self.t选中精灵可见 = false
end
function GUI超级列表:是否碰撞()
	return self.t焦点
end
function GUI超级列表:添加列(宽度,颜色,标题,居中)
	local 内容 	= {}
	内容.宽度 	= 宽度
	内容.偏移 	= self.t列宽
	内容.颜色 	= 颜色
	内容.标题 	= 标题
	table.insert(self.t列项,内容)
	self.t列宽 	= self.t列宽+宽度
	self.t列数 	= #self.t列项
end
function GUI超级列表:添加(...)
	table.insert(self.t内容, {...})
	if #self.t内容 <= self.t可显示数 then
	    self.t显示数 = #self.t内容
	else
		self.t显示数 = self.t可显示数
	end
end
function GUI超级列表:更新内容(...)
	local arg = {...}
	for i,v in ipairs(self.t内容) do
		if v[1] == arg[1] then
		  	self.t内容[i] = arg
		    break
		end
	end
end
function GUI超级列表:取数量()
	return #self.t内容
end
function GUI超级列表:取内容(行)
	return self.t内容[行]
end
function GUI超级列表:取选中()
	return self.t选中项 
end
function GUI超级列表:取焦点()
	return self.t焦点项 
end
function GUI超级列表:置标题(行,列,值)
	self.t内容[行][列] = 值
end
function GUI超级列表:取标题(行,列)
	return self.t内容[行][列]
end
function GUI超级列表:清空()
	self.t内容 		= {}
	self.t选中项 	= 0
	self.t焦点项 	= 0
	self.t焦点 		= false
	self.t起始显示 	= 1
	self.t焦点精灵可见 = false
	self.t选中精灵可见 = false
	self.t显示数 	= 0
end
function GUI超级列表:删除(i)
	if #self.t内容 >0 then
		i = i or self.t选中项 
		self:发送消息(1,"删除",i)
		table.remove(self.t内容 , i)
		--当在尾部删除,选中会上移
		if #self.t内容 >=self.t可显示数 and (self.t起始显示 +self.t可显示数 -1)>#self.t内容 then --数量超过一屏
			self.t选中项 =  self.t选中项 -1
		    self.t起始显示 = self.t起始显示 -1
		elseif self.t选中项 >#self.t内容 then
		    self.t选中项 =  self.t选中项 -1
		end
		self:发送消息(1,"选中",self.t选中项 )
		if #self.t内容 <= self.t可显示数 then
		    self.t显示数 = #self.t内容 
		    if #self.t内容 ==0 then
		    	self.t选中精灵可见 = false
		    	self:发送消息(1,"取消选中")
		    else
		    	self.t选中精灵偏移 = (self.t选中项 -1)*self.t行高度
		    end
		else
			self.t显示数 = self.t可显示数 
		end
	end
end

function GUI超级列表:发送消息(类型,消息,...)
	if self.消息事件 then
	    return self:消息事件(类型,消息,...)
	end
	return true
end
function GUI超级列表:更新_内部(dt,窗口x,窗口y)
	local x,y = 引擎.取鼠标坐标()
	if self:检查点(x,y)  then 
		if(not self.t焦点)then self:发送消息(1,"获得焦点") end
		self.t焦点 = true
		if #self.t内容 >0 then self.t焦点精灵可见 = true end
		local 焦点项 = math.ceil((y-窗口y-self.y)/self.t行高度)

		if  焦点项 <= #self.t内容 and self.t焦点项 ~= 焦点项 and 焦点项 <=self.t显示数 then
			self.t焦点项 = 焦点项 --发头焦点Y坐标，和位置
			self.t焦点精灵偏移 = (self.t焦点项 -1)*self.t行高度
			if self.t焦点精灵偏移 <0 then self.t焦点精灵偏移 = 0 end
			self:发送消息(1,"焦点",self.t焦点项)
		end
		if 引擎.鼠标按下(KEY.LBUTTON) then
			self.t鼠标按下 = true
			self:发送消息(1,"鼠标按下")
		end
		if self.t鼠标按下 and 引擎.鼠标弹起(KEY.LBUTTON)  then
		    self.t鼠标按下 = false
		    self:发送消息(1,"鼠标弹起")
		    if self.t内容[焦点项] and 焦点项 <=self.t显示数 then
			    self.t选中项 = self.t焦点项+self.t起始显示-1
			    self.t选中精灵偏移 = (self.t焦点项-1)*self.t行高度
			    self:发送消息(1,"选中",self.t选中项)
			    self.t选中精灵可见 = true
		    end
		end
		local 滚动值 = 引擎.取鼠标滚轮()
		if 滚动值 ~=0 and #self.t内容 >self.t可显示数 then
			self.t起始显示 = self.t起始显示 - 滚动值
			if self.t起始显示 <1 then
			    self.t起始显示=1
			elseif self.t起始显示 >#self.t内容-self.t可显示数 then
				self.t起始显示=#self.t内容-self.t可显示数+1
			end
			local x = self.t选中项- self.t起始显示+1
			if x>0 and x <=self.t可显示数 then
				self.t选中精灵偏移 = (self.t选中项-self.t起始显示)*self.t行高度
				self.t选中精灵可见 = true
			else
				self.t选中精灵可见 = false
			end
		end
	elseif self.t焦点 then
	    self.t焦点 = false
	    self.t焦点精灵可见 = false
	elseif self.t鼠标按下 and 引擎.鼠标弹起(KEY.LBUTTON) then
		self.t鼠标按下 = false
	end
end
function GUI超级列表:显示_内部(x,y)
	if self.t选中精灵可见 then self.t选中精灵:显示(x+self.x,y+self.y+self.t选中精灵偏移) end
	if self.t焦点精灵可见 then self.t焦点精灵:显示(x+self.x,y+self.y+self.t焦点精灵偏移) end
	for i=self.t起始显示,self.t起始显示+self.t显示数-1 do
		for k,v in ipairs(self.t列项) do
			self.t文字:置颜色(v.颜色):显示(x+self.x+v.偏移, y+self.y +(i-self.t起始显示)*(self.t文字高度+self.t行距),self.t内容[i][k])
		end
	end
end
--======================================================================--
--======================================================================--
--======================================================================--
GUI滑块 = class()


function GUI滑块:初始化(名称,竖型,滑块宽,滑块高,边框宽,边框高,边框x,边框y)
	self.t名称 		= 名称
	self.t宽度 		= 边框宽
	self.t高度 	 	= 边框高
	self.t最小 		= 0
	self.t最大 		= 100
	self.t位置 		= 0
	self.t鼠标按下 	= false
	self.t焦点 		= false
	self.x 			= 0
	self.y 			= 0
	self.t边框x 	= 边框x
	self.t边框y 	= 边框y
	self.t包围盒 	= require ("gge包围盒")(0,0,边框宽,边框高)
	if 竖型 then
		self.t起始 		= 边框y + 滑块高/2
		self.t终止 		= self.t起始 + 边框高 -  滑块高
		self.t真实高度  = 边框高 -  滑块高
	else
		self.t起始 		= 边框x + 滑块宽/2
		self.t终止 		= self.t起始 + 边框宽 -  滑块宽
		self.t真实宽度  = 边框宽 -  滑块宽
	end

	self.t竖型 		= 竖型
	self.t可见 		= true
	self.t层次  	= 1
	
	self.tx 		= 0
	self.ty 		= 0
end

function GUI滑块:置位置(v)
	if v>=0 and v<=100 then
		self.t位置 = v
		if self.t竖型 then
			self.y = v/100*self.t真实高度 +self.t起始
		else
			self.x = v/100*self.t真实宽度 +self.t起始
		end
	end
end
function GUI滑块:取位置()
	return self.t位置
end
function GUI滑块:是否碰撞()
	return self.t焦点 or self.t包围盒焦点 
end
function GUI滑块:发送消息(类型,消息,a)
	if self.消息事件 then
	    return self:消息事件(类型,消息,a)
	end
	return true
end
function GUI滑块:更新_滑块(鼠标x,鼠标y,窗口x,窗口y)

    if self.t鼠标按下 then
    	if self.t竖型 then
	        self.y = 鼠标y - 窗口y --算出滑块相对于窗口的位置
	        if self.y < self.t起始 then
	            self.y = self.t起始
	        end
	        if self.y > self.t终止 then
	            self.y = self.t终止
	        end
	        if self.y ~= self.ty then
	            self.ty = self.y 
	            self.t位置 = math.floor((self.y-self.t起始)/self.t真实高度*100)
	            self:发送消息(1,"位置改变",self.t位置)
	        end
    	else
	        self.x = 鼠标x - 窗口x --算出滑块相对于窗口的位置
	        if self.x < self.t起始 then
	            self.x = self.t起始
	        end
	        if self.x > self.t终止 then
	            self.x = self.t终止
	        end
	        if self.x ~= self.tx then
	            self.tx = self.x 
	            self.t位置 = math.floor((self.x-self.t起始)/self.t真实宽度*100)
	            self:发送消息(1,"位置改变",self.t位置)
	        end
    	end
    end
end
function GUI滑块:更新_内部(dt,窗口x,窗口y)
	local x,y = 引擎.取鼠标坐标()

	if self:检查点(x,y)  then 
		if(not self.t焦点)then self:发送消息(1,"获得焦点") end
		self.t焦点 = true
		if 引擎.鼠标按下(KEY.LBUTTON) then
			self.t鼠标按下 = true
			self:发送消息(1,"鼠标按下")
		end
		if self.t鼠标按下 then
		    self:更新_滑块(x,y,窗口x,窗口y)
		end
		if 引擎.鼠标弹起(KEY.LBUTTON) then
		    self.t鼠标按下 = false
		    self:发送消息(1,"鼠标弹起")
		end
	elseif self.t焦点 and not self.t鼠标按下 then
	    self.t焦点 = false
	    self:发送消息(1,"失去焦点")
	elseif self.t鼠标按下 and 引擎.鼠标弹起(KEY.LBUTTON) then
		self.t鼠标按下 = false
	elseif self.t鼠标按下 then
		self:更新_滑块(x,y,窗口x,窗口y)
	end


	self.t包围盒:置坐标(窗口x+self.t边框x ,窗口y+self.t边框y)

	
	if self.t包围盒:检查点(x,y) then
		self.t包围盒焦点 = true
		if 引擎.鼠标按下(KEY.LBUTTON) then
			if self.t竖型 then
				self.y = y - 窗口y
			else
				self.x = x - 窗口x
			end
		    self.t鼠标按下 = true
		end
	else
		self.t包围盒焦点 = false
	end
end

--======================================================================--
GUI输入 = class()

--@参数 文字对象,字体颜色,输入框宽度,输入框高度
function GUI输入:初始化(名称,文字,宽度,高度)

	self.t名称 		= 名称
	self.t文字 		= 文字
	self.t光标 		= require("gge精灵类")(0,0,0,2,高度)
	self.t选中精灵 	= require("gge精灵类")(0,0,0,20,高度):置颜色(0xFF0000FF)
	
	self.t闪烁间隔 	= 0.6
	self.t闪烁计时 	= 0
	self.t光标可视 	= false
	self.t宽度 		= 宽度
	self.t内容 		= {}
	self.t长度 		= 0 
	self.t光标偏移 	= 0
	self.t光标位置 	= 0
	self.t显示内容 	= ""
	self.t退格时间 	= 0.5
	self.t退格速度 	= 0.03
	self.t退格计时 	= 0
	self.t退格速度计时 	= 0
	self.t可见 		= true
	self.x 			= 0
	self.y 			= 0
	self.t颜色 		= 0xFFFFFFFF
	self.t输入模式 	= 0
end
function GUI输入:是否碰撞()
	return self.t焦点 
end

function GUI输入:取光标精灵()
	return self.t光标 
end
function GUI输入:置输入模式(v)
	self.t输入模式 = v
	return self
end
function GUI输入:置文本(v)
	self.t内容 = {}
	self.t光标位置 = self:分割字符(v,self.t内容,0)--分割并加入
	self:生成文本()
	self.t光标可视 = false
	self.t光标偏移 = self.t长度
end
function GUI输入:置禁止(v)
	self.t禁止 = v
	self.t光标可视 = false
end
function GUI输入:清空()
	self.t内容 = {}
	self:生成文本()
	self.t光标可视 = false
	self.t光标偏移 = 0
	self.t光标位置 = 0
end

function GUI输入:取文本()
	return  table.concat(self.t内容)
end
function GUI输入:发送消息(类型,消息,a)
	if self.消息事件 then
	    return self:消息事件(类型,消息,a)
	end
	return true
end
function GUI输入:分割字符(str,tv,idx)
	local t = tv or {}
	local i = 1
	local ascii = 0
	while true do
		ascii = string.byte(str, i)
		if ascii then
			idx = idx +1
			if ascii < 127 then
				table.insert(t,idx,string.sub(str, i, i))
				i = i+1
			else
				table.insert(t,idx,string.sub(str, i, i+1))
			    i = i+2
			end	
		else
		    break
		end
	end
	return idx
end
function GUI输入:更新_内部(dt)
	if not self.t禁止 then
		if self.t输入焦点 then
			--闪烁计算
			self.t闪烁计时 = self.t闪烁计时 +dt
			if self.t闪烁计时 >= self.t闪烁间隔 then
				self.t闪烁计时  = 0
			    self.t光标可视 = not self.t光标可视 
			end
			--获取字符
			local 时间,字符 =  引擎.取输入字符()
			if 时间 ~= 0 and 时间 ~= self.t时间 then
				self.t时间 = 时间
				if self.t长度+self.t文字:取文本宽度(字符) <=self.t宽度 then--限制长度
					if self.t输入模式 == 1 then--密码模式
						if string.byte(字符) <127 then
							self.t光标位置 = self:分割字符(字符,self.t内容,self.t光标位置)
							self.t光标偏移 = self.t文字:取文本宽度(table.concat(self.t内容,'',1,self.t光标位置))
							self:生成文本()
						end
					else
						self.t光标位置 = self:分割字符(字符,self.t内容,self.t光标位置)
						self.t光标偏移 = self.t文字:取文本宽度(table.concat(self.t内容,'',1,self.t光标位置))
						self:生成文本()
					end
				end
			end
			--退格
			if 引擎.按键按下(KEY.BACKSPACE) then
				if self.t光标位置 >=1 then
				    table.remove(self.t内容,self.t光标位置)
				    self.t光标位置 = self.t光标位置 -1
				    self.t光标偏移 = self.t文字:取文本宽度(table.concat(self.t内容,'',1,self.t光标位置))
				    self:生成文本()
				end
			end
			--按住退格
			if 引擎.按键按住(KEY.BACKSPACE) then
				if self.t光标位置 >=1 then
				    self.t退格计时 = self.t退格计时 + dt
				    if self.t退格计时 > self.t退格时间 then
				    	self.t退格速度计时 = self.t退格速度计时 + dt
				    	if self.t退格速度计时 >self.t退格速度 then
				    		self.t退格速度计时 = 0
					        table.remove(self.t内容,self.t光标位置)
						    self.t光标位置 = self.t光标位置 -1
						    self.t光标偏移 = self.t文字:取文本宽度(table.concat(self.t内容,'',1,self.t光标位置))
					        self:生成文本()
				    	end
				    end
				end
			end
			if 引擎.按键弹起(KEY.BACKSPACE) then self.t退格计时 = 0 end
			--左按键
			if 引擎.按键按下(KEY.LEFT) and  self.t光标位置 >=1 then
				self.t光标可视 = true
				self.t光标位置 = self.t光标位置 -1
				self.t光标偏移 = self.t文字:取文本宽度(table.concat(self.t内容,'',1,self.t光标位置))
			--右按键
			elseif 引擎.按键按下(KEY.RIGHT) and self.t光标位置<#self.t内容 then
				self.t光标可视 = true
				self.t光标位置 = self.t光标位置 +1
				self.t光标偏移 = self.t文字:取文本宽度(table.concat(self.t内容,'',1,self.t光标位置))
			end
		else
			local x,y = 引擎.取鼠标坐标()
			if  self:检查点(x,y)  then 
				if(not self.t焦点)then 
				self:发送消息(1,"获得焦点") end
				self.t焦点 = true
				if 引擎.鼠标按下(KEY.LBUTTON) then
					self:发送消息(1,"鼠标按下")
					self:发送消息(1,"获得输入焦点")
					self.t鼠标按下 = true
					self.t输入焦点 = true
					self.t光标可视 = true
					for i,v in ipairs(self.t输入框组) do
						if v.t名称 ~= self.t名称 then
						    v.t输入焦点 = false
						    v.t光标可视 = false
						    v:发送消息(1,"失去输入焦点")
						end
					end
				end
			elseif self.t焦点 and not self.t鼠标按下 then
			    self.t焦点 = false
			    self:发送消息(1,"失去焦点")
			elseif self.t鼠标按下 and 引擎.鼠标弹起(KEY.LBUTTON) then
				self.t鼠标按下 = false
			end
			self.t时间 = 引擎.取输入字符() --更新到最新
		end
	end
end

function GUI输入:生成文本()
    self.t光标可视 = true
    if self.t输入模式 == 0 then
         self.t显示内容 = table.concat(self.t内容)
    elseif self.t输入模式 == 1 then--密码模式
    	self.t显示内容 = string.rep('*', #self.t内容)
    end
   
    self.t长度 = self.t文字:取文本宽度(self.t显示内容)
end

function GUI输入:显示_内部(x,y)
	--self.t选中精灵:显示(self.x,self.y)
	if self.t光标可视 then
	    self.t光标:显示(x+self.x+self.t光标偏移,y+self.y)
	end
	self.t文字:置颜色(self.t颜色):显示(self.x+x,self.y+y,self.t显示内容)
end

--======================================================================--
--===========================GUI窗口====================================--
--======================================================================--
GUI窗口 = class()


function GUI窗口:初始化(名称)
	self.t焦点 		= false
	self.t激活时间 	= 0
	self.t可见 		= false
	self.t激活 		= false
	self.t移动 		= nil
	self.t加载 		= false
	self.x,self.y  	= 0,0
	self.名称 		= 名称

	self.t按钮组 	= {}
	self.t列表组 	= {}
	self.t滑块组 	= {}
	self.t窗口组 	= {}
	self.t容器组 	= {}
	self.t控件组 	= {}

	self.t所有表 	= {}

end
function GUI窗口:更新_移动(x,y)

	if self.t激活  then
		if 引擎.鼠标弹起(KEY.LBUTTON) then
	        self:取消激活()
	        --self:发送消息("鼠标弹起")
	    end
	    if self.t移动 == nil then
	        self.t移动 = self:发送消息("移动")
	    end
	    if self.t移动  then 
	    	self.x,self.y = x-self.t按下坐标.x,y-self.t按下坐标.y 
	    else
	    	self:取消激活()
	    end
	end
end
function GUI窗口:更新_内部(dt,x,y)
	self:更新_移动(x,y)
	for k,v in pairs(self.t所有表) do
		if v.t可见 then 
			v:更新(dt,self.x,self.y)
			v:更新_内部(dt,self.x,self.y)
		end
	end
end

function GUI窗口:显示_内部()
	for k,v in pairs(self.t所有表) do
		if v.t可见 then 
			v:显示(self.x,self.y) 
			if v.显示_内部 then
		   		v:显示_内部(self.x,self.y)
			end
		end
	end
end
function GUI窗口:打开()
	if not self.t可见 then
		if(not self.t加载)then 
			self.t加载 	= true
			self:初始化_内部()
		end
		self.t激活时间 	= os.clock ()
		self.t可见 		= true
		
		--if self.t系统 then self.tGUI:锁定() end
		self:发送消息("打开")
		self:更新_内部(0,0,0)--防止子控件错位
	end
end
--@说明 窗口第1次打开时,初始化自身和子控件.
function GUI窗口:初始化_内部()
	self:初始化()

	for k,v in pairs(self.t所有表) do
		v.t加载 	= true
		if v.初始化_内部 then
		    v:初始化_内部()
		else
			v:初始化()
		end
	end
end
function GUI窗口:关闭(强制关闭)
	if 强制关闭 then
	    self.t可见 	= false
	elseif(self:发送消息("准备关闭"))then 
		self.t可见 	= false
	end

	if not self.t可见 then
		self:发送消息("关闭",强制关闭)

		if self.t系统 then self.tGUI:解锁() end
	end
end
function GUI窗口:激活(x,y)
	self.t激活时间 	= os.clock ()
	self.t按下坐标 	= {x=x-self.x,y=y-self.y}
	self.t激活 		= true
	self.t移动 		= nil
	self:发送消息("激活",self.t激活时间)
end
function GUI窗口:取消激活()
	self.t激活 		= false
	self.t移动 		= nil
	self:发送消息("取消激活")
end
function GUI窗口:是否焦点()
	return self.t焦点 
end

function GUI窗口:是否打开()
	return self.t可见
end
function GUI窗口:获得焦点(x,y)
	self.t焦点 		= true
	self:发送消息("获得焦点")
end
function GUI窗口:失去焦点()
	self.t焦点 		= false
	self.t激活 		= false
	self:发送消息("失去焦点")
end
--@说明 向子控件发送消息
--@参数 消息编号,参数
function GUI窗口:发送消息(消息,参)
	if self.消息事件 then
		local ret = self:消息事件(0,消息,参)
		if not ret then
		    return ret
		end    
	end
	for k,v in pairs(self.t所有表) do
		local ret =  v:发送消息(0,消息,参)
		if not ret then
		    return ret
		end 
	end
	return true
end
function GUI窗口:添加控件(对象)
	table.insert(self.t所有表, 对象)
	table.sort(self.t所有表,	function (a,b)
		return a.t层次 < b.t层次
	end)
end
--@说明 一般用作单选按钮
-- function GUI窗口:创建容器(名称)
-- 	if self.t容器组[名称] then
-- 	    error("容器名称已存在->"..名称)
-- 	end
-- 	local 对象 			= GUI容器.创建(名称)
-- 	self.t容器组[名称] 	= 对象
-- 	对象.t层次 			= 层次 or 1
-- 	self:添加控件(对象)
-- 	return 对象
-- end

function GUI窗口:创建按钮(名称,层次)
	if self.t按钮组[名称] then
	    error("按钮名称已存在->"..名称)
	end
	local 对象 			= GUI按钮.创建(名称)
	self.t按钮组[名称] 	= 对象
	对象.t层次 			= 层次 or 1
	self:添加控件(对象)
	return 对象
end
--
function GUI窗口:创建复选按钮(名称,层次)
	if self.t按钮组[名称] then
	    error("按钮名称已存在->"..名称)
	end
	local 对象 			= GUI按钮.创建(名称)
	self.t按钮组[名称] 	= 对象
	对象.t选择型 		= true
	对象.t层次 			= 层次 or 1
	self:添加控件(对象)
	return 对象
end

function GUI窗口:创建单选按钮(名称,按钮组,层次)

	if self.t按钮组[名称] then
	    error(名称..":按钮名称重复.")
	end
	local 对象 			= GUI按钮.创建(名称)--基类
	self.t按钮组[名称] 	= 对象
	按钮组[名称] 		= 对象
	对象.t单选型 		= true
	对象.t按钮组 		= 按钮组
	对象.t层次 			= 层次 or 1

	self:添加控件(对象)
	return 对象
end
--@说明 自定义控件
function GUI窗口:创建控件(名称,层次)
	if self.t控件组[名称] then
	    error("控件名称已存在->"..名称)
	end
	local 对象 			= GUI控件.创建(名称)
	self.t控件组[名称] 	= 对象
	对象.t层次 			= 层次 or 1
	self:添加控件(对象)
	return 对象
end
--@参数 列表名称,文字对象,列表宽度,列表高度,显示层次
function GUI窗口:创建列表(名称,文字,宽度,高度,层次)
	if self.t列表组[名称] then
	    error("列表名称已存在->"..名称)
	end
	local 对象 			= GUI列表.创建(名称,文字,宽度,高度)
	self.t列表组[名称] 	= 对象
	对象.t层次 			= 层次 or 1
	self:添加控件(对象)
	return 对象
end
--@参数 列表名称,文字对象,列表宽度,列表高度,显示层次
function GUI窗口:创建超级列表(名称,文字,宽度,高度,层次)
	if self.t列表组[名称] then
	    error("超级列表名称已存在->"..名称)
	end
	local 对象 			= GUI超级列表.创建(名称,文字,宽度,高度)
	self.t列表组[名称] 	= 对象
	对象.t层次 			= 层次 or 1
	self:添加控件(对象)
	return 对象
end
--@参数 
function GUI窗口:创建滑块(名称,竖型,滑块宽,滑块高,边框宽,边框高,边框x,边框y,层次)
	if self.t滑块组[名称] then
	    error("滑块名称已存在->"..名称)
	end
	local 对象 			= GUI滑块.创建(名称,竖型,滑块宽,滑块高,边框宽,边框高,边框x,边框y)
	self.t滑块组[名称] 	= 对象
	对象.t层次 			= 层次 or 1
	self:添加控件(对象)
	return 对象
end
function GUI窗口:创建输入(名称,文字,宽度,高度,层次)
	if 输入框组[名称] then
	    error("输入框名称已存在->"..名称)
	end
	local 对象 			= GUI输入.创建(名称,文字,宽度,高度)
	输入框组[名称] 		= 对象
	对象.t层次 			= 层次 or 1
	对象.t输入框组 		= 输入框组
	table.insert(输入框组, 对象)
    self:添加控件(对象)
	return 对象
end
--======================================================================--
GUI界面 = class()


function GUI界面:初始化(名称)
	self.t名称 			= 名称
	self.t按钮组 		= {}
	self.t控件组 		= {}
	self.t容器组 		= {}
	self.t所有表 		= {}
	self.t可见 			= false
end


function GUI界面:更新_内部(dt,x,y,是否已碰撞)

	local v
	for i = #self.t所有表,1,-1 do
		v = self.t所有表[i]
		if v.更新 then v:更新(dt,x,y) end
		if not 是否已碰撞 and v.更新_内部 then
			v:更新_内部(dt)
			if v:检查点(x,y) then
				是否已碰撞 = true
			end
		end
		
	end
	return  是否已碰撞
end

function GUI界面:显示_内部()
	if self.t可见 then
		for k,v in ipairs(self.t所有表) do
			if v.t可见 then
				if v.显示_内部 then
					v:显示_内部(0,0)
				end
				if v.显示 then
				    v:显示()
				end
			end
		end
	end
end

function GUI界面:打开()

	if(not self.t加载)then 
		self.t加载 	= true
		for i,v in ipairs(self.t所有表) do
			v.t加载 	= true
			v:初始化()
		end
	end
	self.t可见 = true
	if self.消息事件 then
	    self:消息事件(0,'打开')
	end
end
function GUI界面:关闭()
	self.t可见 = false
	if self.消息事件 then
	    self:消息事件(0,'关闭')
	end
end
function GUI界面:是否打开()
	return self.t可见
end
function GUI界面:添加控件(对象)
	table.insert(self.t所有表, 对象)
	table.sort(self.t所有表,	function (a,b)
		return a.t层次 < b.t层次
	end)
end
function GUI界面:创建按钮(名称,层次)
	if self.t按钮组[名称] then
	    error(名称..":按钮名称重复.")
	end
	local 对象 			= GUI按钮.创建(名称)--基类
	self.t按钮组[名称] 	= 对象
	对象.t层次 			= 层次 or 1
	self:添加控件(对象)
	return 对象
end
function GUI界面:创建复选按钮(名称,层次)
	if self.t按钮组[名称] then
	    error("按钮名称已存在->"..名称)
	end
	local 对象 			= GUI按钮.创建(名称)
	self.t按钮组[名称] 	= 对象
	对象.t选择型 		= true
	对象.t层次 			= 层次 or 1
	self:添加控件(对象)
	return 对象
end
function GUI界面:创建控件(名称,层次)
	if self.t控件组[名称] then
	    error(名称..":控件名称重复.")
	end
	local 对象 			= GUI控件.创建(名称)
	self.t控件组[名称] 	= 对象
	对象.t层次 			= 层次 or 1
    self:添加控件(对象)
	return 对象
end
function GUI界面:创建输入(名称,文字,宽度,高度,层次)
	if 输入框组[名称] then
	    error(名称..":控件名称重复.")
	end
	local 对象 			= GUI输入.创建(名称,文字,宽度,高度)
	输入框组[名称] 		= 对象
	对象.t层次 			= 层次 or 1
	对象.t输入框组 		= 输入框组
	table.insert(输入框组, 对象)
    self:添加控件(对象)
	return 对象
end

function GUI界面:创建单选按钮(名称,按钮组,层次)

	if self.t按钮组[名称] then
	    error(名称..":按钮名称重复.")
	end
	local 对象 			= GUI按钮.创建(名称)--基类
	self.t按钮组[名称] 	= 对象
	按钮组[名称] 		= 对象
	对象.t单选型 		= true
	对象.t按钮组 		= 按钮组
	对象.t层次 			= 层次 or 1

	self:添加控件(对象)
	return 对象
end
--=========================================================================
--======================================================================--
--=========================================================================
GUI = class()


function GUI:初始化()
	self.t窗口组 		= {}
	self.t顶级窗口组 	= {}
	self.t界面组 		= {}
	self.t输入框 		= {}

end


function GUI:更新(dt)
	local 是否已碰撞 = false
		local x,y = 引擎.取鼠标坐标()

		for i,v in ipairs(self.t顶级窗口组) do
			if v.t可见 then

				v:更新(dt,x,y) 
				v:更新_内部(dt,x,y)
				if v:检查点(x,y) then 
					if not v.t焦点 then v:获得焦点() end
					if 引擎.鼠标按下(KEY.LBUTTON) then
						v:激活(x,y)
					end
					if 引擎.鼠标按下(KEY.RBUTTON) then
						v:关闭()
					end
				elseif v:是否焦点() then
					v:失去焦点()
				end
				是否已碰撞 = true
				break
			end
		end
		--===========================普通窗口===================================
		if  not 是否已碰撞 then
			for i,v in ipairs(self.t窗口组) do
				if v.t可见 then 
					v:更新(dt,x,y) 
					if not 是否已碰撞 then
						v:更新_内部(dt,x,y) 
					end
					if not 是否已碰撞  and v:检查点(x,y) then 
						是否已碰撞 = true
						if not v.t焦点 then v:获得焦点() end
						if 引擎.鼠标按下(KEY.LBUTTON) then
							v:激活(x,y)
							self:窗口排序()
						end
						if 引擎.鼠标按下(KEY.RBUTTON) then
							v:关闭()
						end
					elseif v:是否焦点() then
						v:失去焦点()
					end
				end
			end
		end
		--=========================界面更新====================================

		for i,v in ipairs(self.t界面组) do
			if v.t可见 then 
				是否已碰撞 = v:更新_内部(dt,x,y,是否已碰撞)
			end
		end


	
	return 是否已碰撞
end


function GUI:显示()
	for i,v in ipairs(self.t界面组) do
		v:显示_内部()
	end
	for i = #self.t窗口组,1,-1 do
		if self.t窗口组[i].t可见 then 
			self.t窗口组[i]:显示() 
			self.t窗口组[i]:显示_内部() 
		end
	end
	for i = #self.t顶级窗口组,1,-1 do
		if self.t顶级窗口组[i].t可见 then 
			self.t顶级窗口组[i]:显示() 
			self.t顶级窗口组[i]:显示_内部() 
		end
	end
end
function GUI:窗口排序()
	table.sort(self.t顶级窗口组,function (a,b)
		return a.t激活时间 > b.t激活时间
	end)
	table.sort(self.t窗口组,function (a,b)
		return a.t激活时间 > b.t激活时间
	end)
end
function GUI:打开窗口(名称)
	local 窗口 = self.t窗口组[名称]
	if not 窗口 then
	    窗口 = self.t顶级窗口组[名称]
	end
	if 窗口 and not 窗口:是否打开() then
	    窗口:打开()
	    self:窗口排序()
	end
end
function GUI:关闭窗口(名称)
	local 窗口 = self.t窗口组[名称]
	if not 窗口 then
	    窗口 = self.t顶级窗口组[名称]
	end
	if 窗口 then
	    窗口:关闭(true)
	end
end
function GUI:窗口是否打开(名称)
	local 窗口 = self.t窗口组[名称]
	if not 窗口 then
	    窗口 = self.t顶级窗口组[名称]
	end
	if 窗口 then
	    return 窗口:是否打开()
	end
	return false
end
function GUI:关闭所有窗口()
	for i,v in ipairs(self.t窗口组) do
		if v:是否打开() then
		    v:关闭(true)
		end
	end
end
function GUI:开关窗口(名称)
	local 窗口 = self.t窗口组[名称]
	if not 窗口 then
	    窗口 = self.t顶级窗口组[名称]
	end
	if 窗口 then
		if 窗口:是否打开() then
		    窗口:关闭(true)
		else
			窗口:打开()
			self:窗口排序()
		end
	end
end
function GUI:打开界面(名称)
	local 对象 = self.t界面组[名称]
	if 对象 then
		对象:打开()
	end
end
function GUI:关闭界面(名称)
	local 对象 = self.t界面组[名称]
	if 对象 then
		对象:关闭()
	end
end
function GUI:取窗口(名称)
	return self.t窗口组[名称] or self.t顶级窗口组[名称]
end
function GUI:取界面(名称)
	return self.t界面组[名称]
end

function GUI:创建窗口(名称)
	if self.t窗口组[名称] then
	    error('窗口已存在->'..名称)
	end
	local 对象 			= GUI窗口.创建(名称)--基类
	self.t窗口组[名称] 	= 对象
	table.insert(self.t窗口组, 对象)
	return 对象
end
function GUI:创建顶级窗口(名称)
	if self.t顶级窗口组[名称] then
	    error('顶级窗口已存在->'..名称)
	end
	local 对象 				= GUI窗口.创建(名称)--基类
	self.t顶级窗口组[名称] 	= 对象
	table.insert(self.t顶级窗口组, 对象)
	return 对象
end
function GUI:创建界面(名称)
	if self.t界面组[名称] then
	    error('界面已存在->'..名称)
	end
	local 对象 			= GUI界面.创建(名称)
	self.t界面组[名称] 	= 对象
	table.insert(self.t界面组, 对象)
	return 对象
end
function GUI:置全局按钮消息(函数)
	GUI按钮.按钮消息 = 函数
end

return GUI
