-- @作者: baidwwy
-- @邮箱:  313738139@qq.com
-- @创建时间:   2015-04-24 12:51:44
-- @最后修改来自: baidwwy
-- @Last Modified time: 2019-07-13 03:35:10
local GUI基类
local GUI创建基类

local GUI控件类
local GUI按钮类
local GUI列表类
local GUI多列表类
local GUI滑块类
local GUI进度类
local GUI丰富文本
local GUI树形类
local GUI自适应类
local GUI网格类
local GUI输入类
local GUI输入类列表 = {}--全局输入控件

local GUI
local 引擎 = require("gge引擎")
--=====================================================================================
GUI基类 = class()

function GUI基类:初始化(标记,x,y,宽度,高度)
	self._id 		= -1
	self._标记 		= 标记
	self._x 		= x or 0
	self._y 		= y or 0
	self._px 		= x or 0--偏移
	self._py 		= y or 0--当控件移动，偏移就有用
	self._宽度 		= 宽度 or 0
	self._高度 		= 高度 or 0
	self._类型 		= '控件'
	self._焦点 		= false
	self._标记 		= '控件'
	self._鼠标按下 	= false
	self._可视 		= false
	self._禁止 		= false
	self._静态 		= false
	self._层次 		= 0
	self._初始化 	= false --是否已经加载
	self._包围盒 	= require("gge包围盒")(self._x,self._y,self._宽度,self._高度)
end
function GUI基类:置坐标(x,y)
	self._x = x
	self._y = y
	if self._fx then--是否有父窗口
		self._x,self._y = self._fx+x,self._fy+y
		self._px = x
		self._py = y
	end
	self._包围盒:置坐标(self._x,self._y)
end
function GUI基类:取坐标()
	return self._x,self._y
end
function GUI基类:置宽高(w,h)
	self._宽度 		= w
	self._高度 		= h
	self._包围盒:置宽高(w,h)
end
function GUI基类:取类型()
	return self._类型
end
function GUI基类:取父控件()
	return self._父控件
end
function GUI基类:置包围盒(v)
	self._包围盒 	= v
end
function GUI基类:取包围盒()
	return self._包围盒
end
function GUI基类:检查点(x,y)
	return self._包围盒:检查点(x,y)
end
function GUI基类:取层次()
	return self._层次
end
function GUI基类:置层次(v)
	self._层次 	= v
end
function GUI基类:置静态(v)
	self._静态 		= v
end
function GUI基类:置可视(v)
	self._可视 		= v
	if self._可视 and not self._初始化 then
		self._初始化 	= true
		if self.初始化 then self:初始化()end
	end
end
function GUI基类:置禁止(v)
	self._焦点 		= false
	self._鼠标按下 	= false
	self._禁止 		= v
end
function GUI基类:是否禁止()
	return self._禁止
end
function GUI基类:是否可视()
	return self._可视
end
function GUI基类:是否静态()
	return self._静态
end
function GUI基类:发送消息(...)
	if self._初始化 then
		if self.消息事件 then
		    return self:消息事件(...)
		end
	end
	return true
end
--======================================================================--
GUI创建基类 = class()

function GUI创建基类:初始化()
	self._按钮列表 		= {}
	self._控件列表 		= {}
	self._输入列表 		= {}
	self._滑块列表 		= {}
	self._文本列表 		= {}
	self._列表列表 		= {}
	self._多列表列表 	= {}
	self._进度列表 		= {}
	self._树形列表 		= {}
	self._自适应列表 	= {}
	self._网格列表 		= {}
	self._子控件 		= {}
end
function GUI创建基类:取子控件(名称)

end
function GUI创建基类:取子控件列表()
	return self._子控件
end
function GUI创建基类:排序()
	table.sort(self._子控件,function (a,b)
		return a._层次 < b._层次
	end)
end
function GUI创建基类:创建按钮(名称,...)
	if self._按钮列表[名称] then error(名称..":此按钮已存在，不能重复创建.")end
	local 对象 				= GUI按钮类.创建(名称,...)--基类
	对象._父控件 			= self
	对象._层次 				= #self._子控件
	self._按钮列表[名称] 	= 对象
	table.insert(self._子控件, 对象)
	return 对象
end
function GUI创建基类:创建精灵按钮(名称,...)
	local 对象 		= self:创建按钮(名称,...)
	对象._纹理类型 	= '精灵'
	return 对象
end
function GUI创建基类:创建复选按钮(名称,...)
	local 对象 		= self:创建按钮(名称,...)
	对象._类型 		= '复选按钮'
	return 对象
end
function GUI创建基类:创建单选按钮(名称,...)
	local 对象 		= self:创建按钮(名称,...)
	对象._类型 		= '单选按钮'
	return 对象
end
function GUI创建基类:创建控件(名称,...)
	if self._控件列表[名称] then error(名称..":此控件已存在，不能重复创建.")end
	local 对象 				= GUI控件类.创建(名称,...)
	对象._父控件 			= self
	对象._层次 				= #self._子控件
	self._控件列表[名称] 	= 对象
    table.insert(self._子控件, 对象)
	return 对象
end
function GUI创建基类:创建窗口(名称,...)
	local 对象 		= self:创建控件(名称,...)
	对象._类型 		= '窗口'
	return 对象
end
function GUI创建基类:创建输入(名称,...)
	if self._输入列表[名称] then error(名称..":此输入已存在，不能重复创建.")end
	local 对象 				= GUI输入类.创建(名称,...)
	self._输入列表[名称] 	= 对象
	对象._父控件 			= self
	对象._层次 				= #self._子控件
	table.insert(GUI输入类列表, 对象)
    table.insert(self._子控件, 对象)
	return 对象
end
function GUI创建基类:创建丰富文本(名称,...)
	if self._文本列表[名称] then error(名称..":此丰富文本已存在，不能重复创建.")end
	local 对象 				= GUI丰富文本.创建(名称,...)
	对象._父控件 			= self
	对象._层次 				= #self._子控件
	self._文本列表[名称] 	= 对象
    table.insert(self._子控件, 对象)
	return 对象
end
function GUI创建基类:创建竖形滑块(名称,...)
	if self._滑块列表[名称] then error(名称..":此滑块已存在，不能重复创建.")end
	local 对象 				= GUI滑块类.创建(名称,...)
	对象._父控件 			= self
	对象._层次 				= #self._子控件
	self._滑块列表[名称] 	= 对象
    table.insert(self._子控件, 对象)
	return 对象
end
function GUI创建基类:创建横形滑块(名称,...)
	local 对象 = self:创建竖形滑块(名称,...)
	对象._类型 		= '横形滑块'
	return 对象
end
function GUI创建基类:创建列表(名称,...)
	if self._列表列表[名称] then error(名称..":此列表已存在，不能重复创建.")end
	local 对象 				= GUI列表类.创建(名称,...)
	对象._父控件 			= self
	对象._层次 				= #self._子控件
	self._列表列表[名称] 	= 对象
    table.insert(self._子控件, 对象)
	return 对象
end
function GUI创建基类:创建多列表(名称,...)
	if self._多列表列表[名称] then error(名称..":此多列表已存在，不能重复创建.")end
	local 对象 				= GUI多列表类.创建(名称,...)
	对象._父控件 			= self
	对象._层次 				= #self._子控件
	self._多列表列表[名称] 	= 对象
    table.insert(self._子控件, 对象)
	return 对象
end
function GUI创建基类:创建进度(名称,...)
	if self._进度列表[名称] then error(名称..":此进度已存在，不能重复创建.")end
	local 对象 				= GUI进度类.创建(名称,...)
	对象._父控件 			= self
	对象._层次 				= #self._子控件
	self._进度列表[名称] 	= 对象
    table.insert(self._子控件, 对象)
	return 对象
end
function GUI创建基类:创建树形(名称,...)
	if self._树形列表[名称] then error(名称..":此树形已存在，不能重复创建.")end
	local 对象 				= GUI树形类.创建(名称,...)
	对象._父控件 			= self
	对象._层次 				= #self._子控件
	self._树形列表[名称] 	= 对象
    table.insert(self._子控件, 对象)
	return 对象
end
function GUI创建基类:创建自适应(名称,...)
	if self._自适应列表[名称] then error(名称..":此自适应已存在，不能重复创建.")end
	local 对象 				= GUI自适应类.创建(名称,...)
	对象._父控件 			= self
	对象._层次 				= #self._子控件
	self._自适应列表[名称] 	= 对象
    table.insert(self._子控件, 对象)
	return 对象
end
function GUI创建基类:创建网格(名称,...)
	if self._网格列表[名称] then error(名称..":此网格已存在，不能重复创建.")end
	local 对象 				= GUI网格类.创建(名称,...)
	对象._父控件 			= self
	对象._层次 				= #self._子控件
	self._网格列表[名称] 	= 对象
    table.insert(self._子控件, 对象)
	return 对象
end
--======================================================================--
GUI控件类 = class(GUI基类,GUI创建基类)

function GUI控件类:初始化(标记,x,y)
	self._px 		= x or 0
	self._py 		= y or 0
	self._精灵 		= require("gge精灵类")()
end
function GUI控件类:_更新(dt,x,y)
	if self.更新 then  self:更新(dt,x,y)end
	for i,v in ipairs(self._子控件) do
		if v.更新 then v:更新(dt,x,y) end
		if v._更新 then v:_更新(dt,x,y) end
	end
end
function GUI控件类:置纹理(v)
	self._精灵:置纹理(v)
	self._包围盒 = self._精灵:取包围盒()
end
function GUI控件类:检查像素(x,y)
	return self._精灵:取像素(x,y) ~= 0
end
function GUI控件类:取精灵()
	return self._精灵
end
function GUI控件类:_显示(x,y)
	if self._可视 then
		self._精灵:显示(self._x,self._y)
		for k,v in ipairs(self._子控件) do
			if v._可视 then
				if v._类型 == "控件" or v._类型 == "窗口" then
					if v.显示 then  v:显示(x,y)end--因为有子控件，所以先显示自身
					if v._显示 then v:_显示(x,y)end
				else
				    if v._显示 then v:_显示(x,y)end
				    if v.显示 then  v:显示(x,y)end
				end
			end
		end
	end
end
function GUI控件类:置可视(v)
	self._可视 = v
	if self._可视 and not self._初始化 then
		self._初始化 	= true
		for k,v in ipairs(self._子控件) do
			v:置可视(true)
		end
		if self.初始化 then self:初始化()end
		if self._类型 == '窗口' then self:_消息事件('窗口移动',self._x,self._y) end
	end
end
function GUI控件类:_消息事件(...)
	local 消息类型,x,y = ...
	for i=#self._子控件,1,-1 do
		local v = self._子控件[i]
		if v:是否可视() and not v:是否静态() and v:_消息事件(...) then
			return true
		elseif 消息类型 == '窗口移动' and v:_消息事件(...) then
			return true
		end
	end
	-- if self:是否可视() and not self:是否静态() and self.消息事件 and self:消息事件(...) then
	-- 	return true
	-- end
	if self._类型 == '窗口' then
	    if 消息类型 == '左键按下' and self:检查像素(x,y) then
	        self._鼠标按下 = true
	        self._cx,self._cy = x-self._x,y-self._y
	        self._层次 = os.clock() + 1000
	        self:取父控件():排序()--告诉父控件
	        return true
	    elseif 消息类型 == '鼠标移动' then
	    	if self._鼠标按下 then
				self._x,self._y = x-self._cx,y-self._cy
	    		self:_消息事件('窗口移动',self._x,self._y)--告诉子控件
	    		return true
	    	elseif self:检查像素(x,y) then
	    		return true
	    	end
	    elseif 消息类型 == '左键弹起' then
	    	self._鼠标按下 = false
	    end
	end
	if 消息类型 == '窗口移动' then
    	if x~=self._x or y ~= self._y then
    	    self._x,self._y = self._px+x,self._py+y
    	    self._fx,self._fy = x,y--记录父坐标
    	    if self._类型 == '窗口' then self:_消息事件('窗口移动',self._x,self._y) end--告诉子窗口的子控件
    	end
    end
	return false
end
--=====================================================================================
GUI按钮类 = class(GUI基类)
--=====================================================================================
function GUI按钮类:初始化(标记,x,y)
	self._px 		= x or 0
	self._py 		= y or 0
	self._选中 		= false
	self._状态 		= 0
	self._类型 		= '普通按钮'
	self._精灵 		= require("gge精灵类")()
end
function GUI按钮类:取精灵()
	return self._精灵
end
function GUI按钮类:置选中(v)
	self._选中 = v
	self:_置纹理(v and self._选中正常纹理 or self._正常纹理)
end
function GUI按钮类:是否选中()
	return self._选中
end
function GUI按钮类:置正常纹理(v)
	self._正常纹理 = v
	if self._纹理类型 == '精灵' then
		self._精灵 = v
	else
	    self._精灵:置纹理(v)
	end
end
function GUI按钮类:置按下纹理(v)
	self._按下纹理 = v
end
function GUI按钮类:置经过纹理(v)
	self._经过纹理 = v
end
function GUI按钮类:置选中正常纹理(v)
	self._选中正常纹理 = v
end
function GUI按钮类:置选中按下纹理(v)
	self._选中按下纹理 = v
end
function GUI按钮类:置选中经过纹理(v)
	self._选中经过纹理 = v
end
function GUI按钮类:_显示()
	self._精灵:显示(self._x,self._y)
end
function GUI按钮类:检查点(x,y)
	return self._精灵:检查点(x,y)
end
function GUI按钮类:检查像素(x,y)
	return self._精灵:取像素(x,y) ~= 0
end
function GUI按钮类:_置纹理(v)
	if v then
		if self._纹理类型 == '精灵' then
			self._精灵 = v
		else
			self._精灵:置纹理(v)
		end
	end
end
function GUI按钮类:_更新纹理()
	local 纹理,选中纹理
	if self._状态 == 0 then
		纹理,选中纹理 = self._正常纹理,self._选中正常纹理
    elseif self._状态 == 1 then
    	纹理,选中纹理 = self._经过纹理,self._选中经过纹理
    elseif self._状态 == 2 then
    	纹理,选中纹理 = self._按下纹理,self._选中按下纹理
	end
	if self._类型 == '普通按钮' or not self._选中 then
		self:_置纹理(纹理)
	else
		self:_置纹理(选中纹理)
	end
end
function GUI按钮类:_消息事件(类型,x,y)
	if 类型 == '鼠标移动' then
	    if self._状态 == 0 and self:检查像素(x,y) then
	        self._状态 = 1
	        self:_更新纹理()
	        return true
	    elseif self._状态 == 1 and not self:检查像素(x,y) then
	    	self._状态 = 0
	    	self:_更新纹理()
	    end
	elseif self._状态 == 1 and 类型 == '左键按下' then
		self._状态 = 2
		self:_更新纹理()
		return true
	elseif self._状态 == 2 and 类型 == '左键弹起' then
		self._状态 = 0
		self:_更新纹理()
		if self:检查像素(x,y) then--是否还在按钮上
			self._状态 = 1
			if self._类型 == '普通按钮' then
			    self:_置纹理(self._经过纹理)
			elseif self._类型 == '复选按钮' then --复选型
				self:置选中(not self._选中)
			elseif self._类型 == '单选按钮' then --单选型
				if not self._选中 then
				    local 子控件 = self:取父控件():取子控件列表()
				    for i,v in ipairs(子控件) do
				    	if v:取类型() == '单选按钮' and v:是否选中() then
				    		v:置选中(false);
				    		break
				    	end
				    end
					self:置选中(true)
				end
			end
			self:发送消息(类型,x,y)
		end
		return true
	elseif 类型 == '窗口移动' then
		self._x,self._y = x+self._px,y+self._py
		self:发送消息(类型,x,y)
	end

	return false
end
--=====================================================================================
GUI输入类 = class(GUI基类)
--=====================================================================================
local function _分割字符(str,tv,ltv,idx,size)
	local t = tv
	local lt = ltv
	local i = 1
	local ascii = 0
	while true do
		ascii = string.byte(str, i)
		if ascii then
			idx = idx +1
			if ascii < 127 then
				table.insert(t,idx,string.sub(str, i, i))
				table.insert(lt,idx,size/2)
				i = i+1
			else
				table.insert(t,idx,string.sub(str, i, i+1))
				table.insert(lt,idx,size)
			    i = i+2
			end
		else
		    break
		end
	end
	return idx
end

function GUI输入类:初始化(标记,x,y,宽度,高度)

	self._px 		= x or 0
	self._py 		= y or 0
	self._宽度 		= 宽度 or 200
	self._高度 		= 高度 or 16
	self._文字 		= require("gge文字类")()
	self._文字大小 	= self._文字:取大小()
	self._光标 		= require("gge精灵类")(0,0,0,2,self._高度):置颜色(0xFFFF0000)
	self._选中精灵 	= require("gge精灵类")(0,0,0,0,self._高度):置颜色(0xFF0000FF)
	self._按下偏移 	= 0
	self._按下位置 	= 0
	self._闪烁间隔 	= 0.6
	self._闪烁计时 	= 0

	self._光标可视 	= false
	self._内容 		= {}--记录字符
	self._内容长度 	= {}--记录字符长度
	self._长度 		= 0
	self._光标偏移 	= 0
	self._光标位置 	= 1
	self._显示内容 	= ""

	self._颜色 		= 0xFFFFFFFF
	self._输入模式 	= 0
	self._输入焦点 	= false
end
function GUI输入类:取文字()
	return self._文字
end
function GUI输入类:置文字(v)
	self._文字 = v
	self._文字大小 	= self._文字:取大小()
end
function GUI输入类:取光标精灵()
	return self._光标
end
function GUI输入类:置光标精灵(v)
	self._光标 = v
end
function GUI输入类:取选中精灵()
	return self._选中精灵
end
function GUI输入类:置选中精灵(v)
	self._选中精灵 = v
end
function GUI输入类:置正常模式()
	self._输入模式 = 0
	return self
end
function GUI输入类:置密码模式()
	self._输入模式 = bit.bor(self._输入模式,1)
	return self
end
function GUI输入类:置数字模式()
	self._输入模式 = bit.bor(self._输入模式,2)
	return self
end
function GUI输入类:置英文模式()
	self._输入模式 = bit.bor(self._输入模式,4)
	return self
end
function GUI输入类:置小数模式()
	self._输入模式 = bit.bor(self._输入模式,8)
	return self
end
function GUI输入类:置焦点(v)
	self._输入焦点 	= v
	if v then
		for i,v in ipairs(GUI输入类列表) do
			if v~=self then
			    v:置焦点(false)
			end
		end
		self._光标可视 	= true
	else
		self._光标可视 	= false
		self._选中 = false
		self._选中精灵:置区域(0,0,0,self._高度)
	end
end
function GUI输入类:置文本(v)
	self._内容 = {}
	self._内容长度 = {}
	self._光标位置 = _分割字符(v,self._内容,self._内容长度,0,self._文字大小)--分割并加入
	self:_生成文本()
	self._光标可视 = false
	self._光标偏移 = self._长度
	self._光标位置 	= #self._内容+1
end
function GUI输入类:取文本()
	return  table.concat(self._内容)
end
function GUI输入类:_更新(dt,x,y)
	if not self._禁止 then
		if self._输入焦点 then--光标闪烁计算
			self._闪烁计时 = self._闪烁计时 +dt
			if self._闪烁计时 >= self._闪烁间隔 then
				self._闪烁计时  = 0
			    self._光标可视 = not self._光标可视
			end
		end
	end
end
function GUI输入类:_显示(x,y)
	self._选中精灵:显示(self._x+self._按下偏移,self._y)

	self._文字:置颜色(self._颜色):显示(self._x,self._y,self._显示内容)
	--self._包围盒:显示()
	if self._光标可视 then
	    self._光标:显示(self._x+self._光标偏移,self._y)
	end
end
function GUI输入类:_生成文本() -- 生成用于显示的文本
    self._光标可视 = true
    if bit.band(self._输入模式,1) == 1 then--密码模式
    	self._显示内容 = string.rep('*', #table.concat(self._内容))
    else
    	self._显示内容 = table.concat(self._内容)
    end
    self._长度 = self._文字:取宽度(self._显示内容)
end
function GUI输入类:_更新位置(目标长度)--更新鼠标操作位置
	if 目标长度<=4 then
	    self._光标偏移 = 0
	    self._光标位置 = 1
	    return
	end
	local 长度 		= 0
	for i,v in ipairs(self._内容长度) do
		长度 = 长度 + v
		if 长度+v/2 >= 目标长度 then
		    self._光标偏移 = 长度
		    self._光标位置 = i+1
		    return
		end
	end
	self._光标偏移 = self._长度
	self._光标位置 = #self._内容+1
end
function GUI输入类:_删除选中()--删除拖选中的文本
	if self._选中 then
		local 数量 		= math.abs(self._光标位置 - self._按下位置)
		if self._光标位置 > self._按下位置 then--如果是从左向右拖选
			self._光标位置 = self._按下位置
			self._光标偏移 = self._按下偏移
		end
		for i=1,数量 do
		    table.remove(self._内容,self._光标位置)
		    table.remove(self._内容长度,self._光标位置)
		end
		self._选中 = false
		self._选中精灵:置区域(0,0,0,self._高度)
	end
end
function GUI输入类:_添加字符(t,l)--添加字符到表,并更新显示文本
	table.insert(self._内容,self._光标位置,t)
	table.insert(self._内容长度 ,self._光标位置,l)
	self._光标位置 = self._光标位置+1
	self:_生成文本()
	self._光标偏移 = self._光标偏移+l
end
function GUI输入类:_模式限制(c)
	--输入数字，并且不是普通模式，并且没有启动数字模式
	if c >=48 and c<=57 and self._输入模式 > 1 and bit.band(self._输入模式,2) ~= 2 then -- 数字模式
	    return true
	--如果限制了数字，并且没有开启英文（46=小数点）
	elseif (c<48 or c>57) and bit.band(self._输入模式,2) == 2 and bit.band(self._输入模式,4) ~= 4 then
		 return true
	elseif c >=97 and c<=122 and self._输入模式 > 1 and bit.band(self._输入模式,4) ~= 4 then -- 英文模式
	     return true
	end
	return false
end
function GUI输入类:_消息事件(a,b,c)
	if a == '输入字符' and self._输入焦点 then
		if c == 8 then--back
			if self._选中 then
			    self:_删除选中()
			    self:_生成文本()
			elseif self._光标位置 > 1 then
			    self._光标偏移 = self._光标偏移 - self._内容长度[self._光标位置-1]
			    table.remove(self._内容,self._光标位置-1)
			    table.remove(self._内容长度,self._光标位置-1)
			    self._光标位置 = self._光标位置 -1
			    self:_生成文本()
			    self._光标可视 = true
			end
		elseif c == 13 or c ==10 then--enter
			self:发送消息(a,b,c)
		elseif c <= 28 then --特殊
		elseif self._长度 +self._文字大小/2 < self._宽度 then
			if self:_模式限制(c) then return end
			self:_删除选中()
			self:_添加字符(b,self._文字大小/2 )
		end
	elseif a == '输入中文' and self._输入焦点 and self._长度+self._文字大小< self._宽度 then
		self:_删除选中()
		self:_添加字符(b,self._文字大小)
	elseif a == '鼠标移动' and self._鼠标按下 then
		self:_更新位置(b - self._x)
		self._选中精灵:置区域(0,0,self._光标偏移-self._按下偏移,self._高度)
	elseif a == '左键按下' and self:检查点(b,c) then
		self:_更新位置(b - self._x)
		self._鼠标按下 = true
		self._按下偏移 = self._光标偏移
		self._按下位置 = self._光标位置
		self._选中精灵:置区域(0,0,0,self._高度)
		self:置焦点(true)
		return true
	elseif a == '左键弹起' and self._鼠标按下 then
		self._鼠标按下 = false
		self._选中 = (self._光标位置-self._按下位置 ~= 0)
		return self:检查点(b,c)
	elseif a == '窗口移动' then
		self._x,self._y = b+self._px,c+self._py
	end
end
--=========================================================================
GUI丰富文本 = class(GUI基类,require("丰富文本类"))
--=========================================================================
function GUI丰富文本:初始化(标记,x,y,宽度,高度)
	self._px = x or 0
	self._py = y or 0
	--self.行间距 = 15
end
function GUI丰富文本:显示()--重载
end
function GUI丰富文本:_显示()
	self:运行父函数(2,'显示',self._x,self._y)
	--self._包围盒:显示()
end
function GUI丰富文本:_消息事件(a,b,c)
	if a == '窗口移动' then
		self._x,self._y = b+self._px,c+self._py
		self._包围盒:置坐标(self._x,self._y)
	elseif a == '鼠标移动' then
		self.鼠标x,self.鼠标y = b,c
	end
end
--=====================================================================================
GUI滑块类 = class(GUI按钮类)
--=====================================================================================
function GUI滑块类:初始化(标记,x,y,宽度,高度)
	self._类型 		= '竖形滑块'
	self._位置 		= 1
	self._px 		= x or 0
	self._py 		= y or 0
	self._宽度 		= 宽度 or 10
	self._高度 		= 高度 or 10
	self._滑块高度 	= 0
	self._滑块宽度 	= 0
	self._最大值 	= 100
	self._最小值 	= 1
	self._包围盒:置中心(-self._px,-self._py)
	self._包围盒:置宽高(self._宽度,self._高度)
end
function GUI滑块类:取位置()
	return  self._位置
end
function GUI滑块类:置位置(v)
	self:_更新位置(self._位置/self._最大值*self._宽度,self._位置/self._最大值*self._高度)
	self._位置 = v
end
function GUI滑块类:置滑块高度(v)
	self._滑块高度 = v
end
function GUI滑块类:置滑块宽度(v)
	self._滑块宽度 = v
end
function GUI滑块类:_更新位置(x,y)
	if self._类型 == '竖形滑块' then
		self._位置 = math.floor(y/self._高度*self._最大值)
		if y < 0 then y = 0;self._位置 = self._最小值 end
	    if y > self._高度-self._滑块高度 then y = self._高度-self._滑块高度;self._位置 = self._最大值 end
	    self._精灵:置中心(0,-y)
	else
		self._位置 = math.floor(x/self._宽度*self._最大值)
		if x <0 then x = 0;self._位置 = self._最小值 end
	    if x > self._宽度-self._滑块宽度 then x = self._宽度-self._滑块宽度;self._位置 = self._最大值 end
	    self._精灵:置中心(-x,0)
	end
	self:发送消息('位置改变',self._位置)
end
function GUI滑块类:_消息事件(a,b,c)
	local ret = self:运行父函数(1,'_消息事件',a,b,c)
	if a == '鼠标移动' and self._状态 == 2 then
		local py = c-self._y-self._滑块高度/2--鼠标坐标-滑块坐标-滑块大小
		local px = b-self._x-self._滑块宽度/2
		self:_更新位置(px,py)
	elseif a == '左键按下' and self._包围盒:检查点(b,c) then
		local py = c-self._y-self._滑块高度/2
		local px = b-self._x-self._滑块宽度/2
		self:_更新位置(px,py)
		return true--已收到，不向下发送（窗口，则不会移动）
	elseif a == '窗口移动' then
		self._包围盒:置坐标(b,c)
	end
	return ret
end
--=========================================================================
GUI列表类 = class(GUI基类)

function GUI列表类:初始化(标记,x,y,宽度,高度)
	self._内容 		= {}
	self._选中项 	= 0
	self._焦点项 	= 0
	self._文字 		= require("gge文字类")()
	self._文字高度 	= self._文字:取高度()
	self._选中精灵 	= require("gge精灵类")(0,0,0,宽度,self._文字高度):置颜色(0x80808080)
	self._焦点精灵 	= require("gge精灵类")(0,0,0,宽度,self._文字高度):置颜色(0x80008000)
	self._px 		= x or 0
	self._py 		= y or 0
	self._宽度 		= 宽度 or 200
	self._高度 		= 高度 or 200
	self._行距 		= 1
	self._行高度 	= self._文字高度 + self._行距 -- 一行占用高度
	self._可显示数 	= math.floor(self._高度 /self._行高度 ) -- 最多可显示数量
	self._起始显示 	= 1 --滚动后,起始显示的位置
	self._包围盒:置中心(-self._px,-self._py)
	self._包围盒:置宽高(self._宽度,self._高度)
	self._选中精灵可见 = false
	self._焦点精灵可见 = false
	self._显示数 	= 0
end
function GUI列表类:取选中精灵()
	return self._选中精灵
end
function GUI列表类:取焦点精灵()
	return self._焦点精灵
end
function GUI列表类:置行距(v)
	self._行距 = v
	self._行高度 	= self._文字高度 + self._行距 -- 一行占用高度
	self._可显示数 	= math.floor(self._高度 /self._行高度 ) -- 最多可显示数量
end
function GUI列表类:置颜色(i,颜色)
	self._内容[i] = 颜色
end
function GUI列表类:添加(内容,颜色,其它)
	local t = {}
	t.颜色 	= 颜色 or 0xFFFFFFFF
	t.内容 	= 内容 or ''
	t.x 	= 0
	t.其它 	= 其它
	table.insert(self._内容,t)
	self._显示数 = #self._内容
	if self._显示数 > self._可显示数 then self._显示数 = self._可显示数 end
	return #self._内容
end
function GUI列表类:_显示()
	--self._包围盒:显示()
	if self._选中精灵可见 then self._选中精灵:显示(self._x,self._y) end
	if self._焦点精灵可见 then self._焦点精灵:显示(self._x,self._y) end
	for i=self._起始显示,self._起始显示+self._显示数-1 do
		self._文字:置颜色(self._内容[i].颜色):显示(self._x+self._内容[i].x,self._y +(i-self._起始显示)*self._行高度,self._内容[i].内容)
	end
end
function GUI列表类:滚动百分比(v)
	self._起始显示 = math.floor(v/100*#self._内容)
	self:_更新位置()
end
function GUI列表类:_取同步信息()--多列表
	local x,y = self._焦点精灵:取中心()
	local x1,y1 = self._选中精灵:取中心()
	return self._焦点精灵可见,y,self._选中精灵可见,y1,self._起始显示
end
function GUI列表类:_置同步信息(焦点可见,焦点偏移,选中可见,选中偏移,起始显示)--多列表
	self._焦点精灵可见 = 焦点可见
	self._焦点精灵:置中心(0,焦点偏移)
	self._选中精灵可见 = 选中可见
	self._选中精灵:置中心(0,选中偏移)
	self._起始显示 = 起始显示
end
function GUI列表类:_取选中项()
	return self._选中项
end
function GUI列表类:_取当前项(x,y)
	--local x,y = 引擎.取鼠标坐标()
	if self:检查点(x,y) then
	    local i = math.ceil((y-self._y)/self._行高度)
	    if self._内容[i] and i <= self._显示数 then
	        return i
	    end
	end
end
function GUI列表类:_更新位置()
	if self._起始显示 <1 then
	    self._起始显示 = 1
	elseif self._起始显示 >#self._内容-self._可显示数 then
		self._起始显示 = #self._内容-self._可显示数 + 1
	end
	if self._选中项 >= self._起始显示 and self._选中项 < self._起始显示+self._可显示数 then
	    self._选中精灵可见 = true
	    self._选中精灵:置中心(0,-(self._选中项-self._起始显示)*self._行高度)
	else
	    self._选中精灵可见 = false
	end

end
function GUI列表类:_消息事件(消息类型,x,y,滚动值)
	if 消息类型 == '窗口移动' then
		self._x,self._y = x+self._px,y+self._py
		self._包围盒:置坐标(x,y)
	elseif 消息类型 ==  '鼠标移动' then
		local i = self:_取当前项(x,y)
		self._焦点精灵可见 = false
		if i then
			self._焦点项 = i+self._起始显示-1
		    self._焦点精灵可见 = true
		    self._焦点精灵:置中心(0,-(i-1)*self._行高度)
		end
	elseif 消息类型 ==  '左键按下'and self:检查点(x,y) then
	    local i = self:_取当前项(x,y)
	    self._选中精灵可见 = false
	    if i then
	    	self._选中项 = i+self._起始显示-1
	    	self._选中精灵可见 = true
	    	self._选中精灵:置中心(0,-(i-1)*self._行高度)
	    end
	    return true
	elseif 消息类型 == '鼠标滚动'and self:检查点(x,y) and #self._内容 > self._可显示数 then
		self._起始显示 = self._起始显示 - 滚动值
		self:_更新位置()
		return true
	end
end
--=========================================================================
GUI多列表类 = class(GUI基类)
--=========================================================================
function GUI多列表类:初始化(标记,x,y,宽度,高度)
	self._px 		= x or 0
	self._py 		= y or 0
	self._宽度 		= 宽度 or 200
	self._高度 		= 高度 or 200
	self._列宽 		= 0
	self._列项 		= {}
	self._列数 		= 0
end
function GUI多列表类:添加列(宽度,名称)
	table.insert(self._列项,GUI列表类.创建(名称,self._列宽+self._px,self._py,宽度,self._高度))
	self._列宽 	= self._列宽 + 宽度
	self._列数 	= #self._列项
end
function GUI多列表类:添加行(...)
	for i,v in ipairs({...}) do
		if self._列项[i] then
		    self._列项[i]:添加(v)
		end
	end
end
function GUI多列表类:_显示()
	for i,v in ipairs(self._列项) do
		v:_显示()
	end
end
function GUI多列表类:_消息事件(...)
	for i,v in ipairs(self._列项) do
		v:_消息事件(...)
		if v:检查点(引擎.取鼠标坐标()) then
		    for ii,vv in ipairs(self._列项) do
		    	vv:_置同步信息(v:_取同步信息())
		    end
		    return true
		end
	end
end
--=========================================================================
GUI进度类 = class(GUI基类)
--=========================================================================
function GUI进度类:初始化(标记,x,y,宽度,高度)
	self._px 		= x or 0
	self._py 		= y or 0
	self._宽度 		= 宽度 or 200
	self._高度 		= 高度 or 20
	self._最大值 	= 100
	self._最小值 	= 1
	self._精灵 		= require("gge精灵类")(0,0,0,self._宽度,self._高度)
end
function GUI进度类:置纹理(v)
	self._精灵:置纹理(v)
end
function GUI进度类:置颜色(v)
	self._精灵:置颜色(v)
end
function GUI进度类:取位置()
	return  self._位置
end
function GUI进度类:置位置(v)
	self._位置 = v
	self._精灵:置区域(0,0,v/self._最大值*self._宽度,self._高度)
end
function GUI进度类:_显示()
	self._精灵:显示(self._x,self._y)
end
function GUI进度类:_消息事件(a,b,c)
	if a == '窗口移动' then
		self._x,self._y = b+self._px,c+self._py
	end
end
--===========================================================================
GUI树形类 = class(GUI列表类)
--===========================================================================
function GUI树形类:初始化(标记,x,y,宽度,高度)
	self._节点内容  = {}
	self._精灵 		= require("gge精灵类")()
	self:置行距(3)
end
function GUI树形类:添加(父索引,内容,纹理,展开纹理)
	local t = {}
	t.颜色 		= 0xFFFFFFFF
	t.父索引 	= 父索引 or 0
	t.内容 		= 内容
	t.纹理 		= 纹理
	t.展开纹理  = 展开纹理
	t.当前纹理 	= 纹理
	t.展开 		= false
	table.insert(self._节点内容,t)
	t.索引 		= #self._节点内容
	t.tx 		= self:_取层数(t.索引)*20
	t.x 		= 20 +t.tx
	self:_更新列表()
	return t.索引
end
function GUI树形类:_取层数(id)--计算层数来计算x显示偏移
	local	递归函数
	local 	层数 = 0
	递归函数 = function (id)
		if self._节点内容[id].父索引 ~= 0 then
		    层数 = 层数 +1
		   	递归函数(self._节点内容[id].父索引)
		end
	end
	递归函数(id)
	return 层数
end
function GUI树形类:_是否展开(id)--判断所有父层是否展开
	local 递归函数
	local 是否展开 = true
	递归函数 = function (id)
		if not self._节点内容[id].展开 then
		    是否展开 =  false
		end
		if 是否展开 and self._节点内容[id].父索引 ~= 0 then
		   	递归函数(self._节点内容[id].父索引)
		end
	end
	递归函数(id)
	return 是否展开
end
function GUI树形类:_更新列表()
	self._显示数 = 0
	self._内容 = {}
	for i,v in ipairs(self._节点内容) do
		if v.父索引 == 0 or self:_是否展开(v.父索引) then
		    table.insert(self._内容,v)
		end
	end
	self._显示数 = #self._内容
	if self._显示数 > self._可显示数 then self._显示数 = self._可显示数 end
    if self._起始显示 + self._可显示数 > #self._内容 then
        self._起始显示 = #self._内容 - self._可显示数+1
    end
    if self._起始显示 <1 then self._起始显示 = 1 end

end
function GUI树形类:_显示(x,y)
	self:运行父函数(1,'_显示')
	--self._包围盒:显示()
	for i=self._起始显示,self._起始显示+self._显示数-1 do
	    self._精灵:置纹理(self._内容[i].当前纹理):置区域(0,0,20,20)
	    self._精灵:显示(self._x+self._内容[i].tx,self._y +(i-self._起始显示)*self._行高度)
	    if  self._鼠标按下 and self._精灵:检查点(x,y) and 引擎.鼠标弹起(KEY.LBUTTON) and self._内容[i].展开纹理 then
	        self._内容[i].展开 = not self._内容[i].展开
	        self._内容[i].当前纹理 = self._内容[i].展开 and self._内容[i].展开纹理 or self._内容[i].纹理
	        if i == self._起始显示+self._显示数-1 then
	            self._起始显示 = i
	        end
	        self:_更新列表()
	        self._鼠标按下 	= false
	        break
	    end
	end
end
function GUI树形类:_消息事件(消息类型,x,y,滚动值)
	local ret = self:运行父函数(1,'_消息事件',消息类型,x,y,滚动值)
	if 消息类型 ==  '左键按下'and self:检查点(x,y) then
		self._鼠标按下 	= true
		return true
	end
	return ret
end

--=========================================================================
GUI自适应类 = class(GUI基类)
--=========================================================================
function GUI自适应类:初始化(标记,x,y,宽度,高度)
	self.纹理表 	= {}
	self._px = x or 0
	self._py = y or 0
	self._包围盒:置中心(-self._px,-self._py)
	for i=1,9 do
		self.纹理表[i] = require("gge精灵类")()
	end
end
function GUI自适应类:置宽高(w,h)
	self._宽度 		= w
	self._高度 		= h
	self._包围盒:置宽高(w,h)
	local 偏移 = self.纹理表[1]:取宽度()
	local 偏移2 = 偏移*2
	self.纹理表[3]:置中心(-self._宽度+偏移,0)--右上
	self.纹理表[6]:置中心(-self._宽度+偏移,-偏移)--右边
	self.纹理表[7]:置中心(0,-self._高度+偏移)--左下
	self.纹理表[8]:置中心(-偏移,-self._高度+偏移)--下边
	self.纹理表[9]:置中心(-self._宽度+偏移,-self._高度+偏移)--右下

	self.纹理表[2]:置区域(0,0,self._宽度-偏移2,偏移)
	self.纹理表[4]:置区域(0,0,偏移,self._高度-偏移2)
	self.纹理表[5]:置区域(0,0,self._宽度-偏移2,self._高度-偏移2)
	self.纹理表[6]:置区域(0,0,偏移,self._高度-偏移2)
	self.纹理表[8]:置区域(0,0,self._宽度-偏移2,偏移)
end
function GUI自适应类:置左上纹理(纹理)
	self.纹理表[1]:置纹理(纹理)
end
function GUI自适应类:置右上纹理(纹理)
	self.纹理表[3]:置纹理(纹理)
	self.纹理表[3]:置中心(-self._宽度+纹理:取宽度(),0)--右上
end
function GUI自适应类:置左下纹理(纹理)
	self.纹理表[7]:置纹理(纹理)
	self.纹理表[7]:置中心(0,-self._高度+纹理:取高度())--左下
end
function GUI自适应类:置右下纹理(纹理)
	self.纹理表[9]:置纹理(纹理)
	self.纹理表[9]:置中心(-self._宽度+纹理:取宽度(),-self._高度+纹理:取高度())--右下
end
function GUI自适应类:置上边纹理(纹理)
	self.纹理表[2]:置纹理(纹理)
	self.纹理表[2]:置中心(-纹理:取宽度(),0)
	self.纹理表[2]:置区域(0,0,self._宽度-纹理:取宽度()*2,纹理:取高度())
end
function GUI自适应类:置下边纹理(纹理)
	self.纹理表[8]:置纹理(纹理)
	self.纹理表[8]:置中心(-纹理:取宽度(),-self._高度+纹理:取高度())--下边
	self.纹理表[8]:置区域(0,0,self._宽度-纹理:取宽度()*2,纹理:取高度())
end
function GUI自适应类:置左边纹理(纹理)
	self.纹理表[4]:置纹理(纹理)
	self.纹理表[4]:置中心(0,-纹理:取高度())
	self.纹理表[4]:置区域(0,0,纹理:取宽度(),self._高度-纹理:取高度()*2)
end
function GUI自适应类:置右边纹理(纹理)
	self.纹理表[6]:置纹理(纹理)
	self.纹理表[6]:置中心(-self._宽度+纹理:取宽度(),-纹理:取高度())--右边
	self.纹理表[6]:置区域(0,0,纹理:取宽度(),self._高度-纹理:取高度()*2)
end
function GUI自适应类:置中间纹理(纹理)
	self.纹理表[5]:置纹理(纹理)
	self.纹理表[5]:置中心(-纹理:取宽度(),-纹理:取高度())
	self.纹理表[5]:置区域(0,0,self._宽度-纹理:取宽度()*2,self._高度-纹理:取高度()*2)
end
function GUI自适应类:_显示()
	for i=1,9 do
		self.纹理表[i]:显示(self._x,self._y)
	end
	--self._包围盒:显示()
end
function GUI自适应类:_消息事件(类型,x,y)
	if 类型 == '窗口移动' then
		self._x,self._y = x+self._px,y+self._py
		self._包围盒:置坐标(x,y)
	end
end
--=========================================================================
GUI网格类 = class(GUI基类)
--=========================================================================
function GUI网格类:初始化(标记,x,y,宽度,高度)
	self._px 		= x or 0
	self._py 		= y or 0
	self._行距 		= 1
	self._列距 		= 1
	self._格子宽 	= 32
	self._格子高 	= 32
	self._行数 		= 1
	self._列数 		= 1
	self._内容  	= {}
	self._精灵 		= require("gge精灵类")()
	self._格子 		= {}
	self._包围盒:置中心(-self._px,-self._py)
end
function GUI网格类:置格子宽高(a,b)
	self._格子宽 	= a
	self._格子高 	= b
end
function GUI网格类:置行列间距(a,b)
	self._行距 		= a
	self._列距 		= b
end
function GUI网格类:置行列数(a,b)
	self._行数 		= a
	self._列数 		= b
	local i =0
	for h=1,self._行数 do
		self._格子[h] = {}
		for l=1,self._列数 do
			i=i+1
			self._格子[h][l] = require("gge包围盒")(0,0,self._格子宽,self._格子高)
			self._格子[h][l]:置中心(-((l-1)*(self._格子宽+self._列距)+self._px), -((h-1)*(self._格子高+self._行距)+self._py))
			self._格子[h][l].id = i
		end
	end
end
function GUI网格类:置内容(i,t)
	self._内容[i] 	= t
end
function GUI网格类:_显示(a,b)
	local i = 0
	for h=1,self._行数 do
		for l=1,self._列数 do
			i = i+1
			self._格子[h][l]:显示()
			if self._内容[i]  then
				if tostring(self._内容[i]) == 'ggeTexture' then
				    self._精灵:置纹理(self._内容[i])
				    self._精灵:显示(self._格子[h][l]:取坐标())
				else
				    self._内容[i]:显示(self._格子[h][l]:取坐标())
				end
			end
		end
	end
	self._包围盒:显示()
end
function GUI网格类:_消息事件(类型,x,y)
	if 类型 == '窗口移动' then
		self._x,self._y = x,y
		self._包围盒:置坐标(x,y)
		for h=1,self._行数 do
			for l=1,self._列数 do
				self._格子[h][l]:置坐标(self._x,self._y)
			end
		end
	elseif 类型 == '鼠标移动' then
		if self._包围盒:检查点(x,y) then
			for h=1,self._行数 do
				for l=1,self._列数 do
					if self._格子[h][l]:检查点(x,y) then
					    self:发送消息('格子碰撞',self._格子[h][l].id)
					    return true
					end
				end
			end
		end
		self:发送消息(类型,x,y)
	elseif 类型 == '左键按下' and self._包围盒:检查点(x,y) then
		self._鼠标按下 = true
		self:发送消息(类型,x,y)
		return true
	elseif 类型 == '左键弹起' and self._鼠标按下 then
		self._鼠标按下 = false
		self:发送消息(类型,x,y)
	end
end
--=========================================================================
local 注册输入事件 = {}
-- local 注册鼠标事件 = {}
-- local function 鼠标事件(msg)
-- 	for i,v in ipairs(注册鼠标事件) do
-- 		v:消息事件(msg)
-- 	end
-- end
local function 输入事件(msg,char,wparam)
	for i,v in ipairs(注册输入事件) do
		v:消息事件(msg,char,wparam)
	end
end
local 消息常量 = {
	[512] = '鼠标移动',
	[513] = '左键按下',
	[514] = '左键弹起',
	[515] = '左键双击',
	[516] = '右键按下',
	[517] = '右键弹起',
	[518] = '右键双击',
	[519] = '中键按下',
	[520] = '中键弹起',
	[521] = '中键双击',
	[522] = '鼠标滚动',
	[646] = '输入中文',
	[258] = '输入字符'
}

引擎.置输入函数(输入事件)
--引擎.置鼠标函数(鼠标事件)


GUI = class()

function GUI:初始化()
	self._子控件 		= {}
	table.insert(注册输入事件, self)
	--table.insert(注册鼠标事件, self)
	self._x = 0
	self._y = 0
	self._wheel = 0
end
function GUI:更新(dt,x,y)
	if self._x ~= x or self._y ~= y then
		self._x = x
		self._y = y
		self:消息事件(512,x,y)--鼠标移动
	end
	if self._wheel ~= 引擎.取鼠标滚轮() then
	    self._wheel = 引擎.取鼠标滚轮()
	    self:消息事件(522,x,y,self._wheel)
	end
	for i=0,2 do--GGEK_LBUTTON
		if 引擎.鼠标按下(i) then
			self:消息事件(513+i*3,x,y)
		end
		if 引擎.鼠标弹起(i) then
			self:消息事件(514+i*3,x,y)
		end
	end

	for i,v in ipairs(self._子控件) do
		if v:是否可视() and v._更新 then
			v:_更新(dt,x,y)
		end
	end
end
function GUI:显示(x,y)
	for i,v in ipairs(self._子控件) do
		if v:是否可视() then
			if v.显示 then v:显示(x,y)end
			if v._显示 then v:_显示(x,y)end
		end
	end
end
function GUI:消息事件(id,...)
	--for i,v in ipairs(self._子控件) do
	for i=#self._子控件,1,-1 do
		local v = self._子控件[i]
		if v:是否可视() then
			if v:_消息事件(消息常量[id],...) then
				-- if id == 512 then
				-- 	for i,v in ipairs(self._子控件) do
				-- 		if v:是否可视() then v:_消息事件(消息常量[id],-1,-1)end
				-- 	end
				-- 	v:_消息事件(消息常量[id],...)
				-- end
			    break
			end
		end
	end
end
function GUI:创建控件(名称)
	if self._子控件[名称] then error('控件已存在->'..名称)end
	local 对象 			= GUI控件类.创建(名称)
	self._子控件[名称] 	= 对象
	table.insert(self._子控件, 对象)
	return 对象
end
function GUI:取控件(名称)
	return self._子控件[名称]
end
return GUI