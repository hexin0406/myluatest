-- @作者: baidwwy
-- @邮箱:  313738139@qq.com
-- @创建时间:   2016-10-27 23:34:22
-- @最后修改来自: baidwwy
-- @Last Modified time: 2019-07-06 23:03:45
local F函数  			= require("ffi函数")
local GUI输入类 		= require("gge界面/输入类")
local GUI多输入类 		= class(require("gge界面/基类"))
GUI多输入类._输入列表 	= GUI输入类.列表
local function splitstr(str)
	local i = 0
	local ascii = 0
	return function ()
		i = i+1
		ascii = string.byte(str, i)
		if ascii then
			if ascii < 127 then
				return 1,string.sub(str, i, i)
			else
				i = i+1
				return 2,string.sub(str, i-1, i)
			end
		else
			return nil
		end
	end
end
function GUI多输入类:初始化(标记,x,y,宽度,高度)
	self._px 		= x or 0
	self._py 		= y or 0
	self._宽度 		= 宽度 or 200
	self._高度 		= 高度 or 200
	self._类型 		= '多输入'
	self._文字 		= require("gge文字类")()
	self._文字:置行宽(self._宽度)
	self._行距 		= 2
	self._行高 		= 16
	self._行数 		= math.floor(self._高度/16)
	self._行字数 	= math.floor(self._宽度/7)
	self._限制字数 	= self._行字数*self._行数
	self._子输入 		= {}
	self._内容 		= {}--记录字符
	self._光标位置 	= 1--字符插入
	self._按下位置 	= 1
	self._光标行号 	= 1
	self._字符总数 	= 0
	self._焦点 		= false
	self:_插入行(1,"")
end
function GUI多输入类:_更新(dt)
	if self._焦点 then
		for i,v in ipairs(self._子输入) do
			v:_更新(dt)
		end
	end
end
function GUI多输入类:_显示(x,y)
	if self._调试 then self._包围盒:显示() end
	for i,v in ipairs(self._子输入) do
		--if self._调试 then v._包围盒:显示() end
		v:_显示()
	end
end
function GUI多输入类:置焦点(v)
	self._焦点 	= v
	--print(v)
	if v then
		for i,v in pairs(self._输入列表) do
			if v~=self then
				v:置焦点(false)
			end
		end
		self._子输入[#self._子输入]:置光标位置():置焦点(true)
		self._光标位置 = #self._内容+1
	else
		for i,v in ipairs(self._子输入) do
			v:置焦点(false)
		end
	end
	return self
end
function GUI多输入类:_子消息事件(a,b,c)
end
function GUI多输入类:取文本(处理)--\r\n  windows格式
	return 处理 and table.concat(self._内容):gsub('\n', '\r\n') or table.concat(self._内容)
end
function GUI多输入类:取选中文本(处理)
	if self._是否选中 then
		if self._按下位置 > self._光标位置 then
			self._按下位置,self._光标位置 = self._光标位置,self._按下位置
		end
		local r = table.concat(self._内容,nil,self._按下位置,self._光标位置-1)
		return 处理 and string.gsub(r, '\n', '\r\n') or r --\r\n  windows格式
	end
	return ''
end
function GUI多输入类:删除选中()--删除拖选中的文本
	if self._是否选中 then
		local 数量 		= math.abs(self._光标位置 - self._按下位置)
		if self._光标位置 > self._按下位置 then--如果是从左向右拖选
			self._光标位置 = self._按下位置
		end
		for i=1,数量 do
			table.remove(self._内容,self._光标位置)
		end
		self._是否选中 = false
		self:_生成文本()
	end
	return self
end
function GUI多输入类:选中全部()
	self._光标位置 = 1
	self._按下位置 = #self._内容+1
	self._是否选中 =true
	self._子输入[#self._子输入]:置焦点(true)
	for i=1,#self._子输入 do
		self._子输入[i]:选中全部()
	end
	return self
end
function GUI多输入类:_所在行(x,y)
	for i,v in ipairs(self._子输入) do
		if v:检查点(self._x,y) then
			return i
		end
	end
	if (y-self._y)<self._行高 then
		return 1
	end
	return #self._子输入
end
function GUI多输入类:_插入行(位置,内容)
	local v = GUI输入类.创建(位置,self._px,self._py+(位置-1)*self._行高,self._宽度,self._行高)
	v.换行 	= 0
	v.行号 	= 位置
	v:置文本(内容)
	v:置坐标(self._x,self._y+(位置-1)*self._行高)
	v._输入列表 = self._子输入
	v._子消息事件 = function (this, a,b,c)
		if a == "左键按下" or a == "选区变动" then
			self._光标行号 = this.行号
			local 位置 = 0
			for i=1,this.行号-1 do
				位置=位置+self._子输入[i]:取字符总数()+self._子输入[i].换行
			end
			self._光标位置 	= 位置+this:取光标位置()
			if self._按下行==this.行号 and a == "左键按下" then
				self._按下位置 = self._光标位置
			end
		end
	end
	table.insert(self._子输入,位置,v)
	return v
end
function GUI多输入类:_生成文本()
	self._子输入 	= {}
	self._字符总数 	= 0
	local 位置,长度,行号 = 1,0,1
	local 焦点行,光标位置 = 1,1
	for i,v in ipairs(self._内容) do
		self._字符总数 = self._字符总数+#v
		if 长度+#v == self._行字数 then
			self:_插入行(行号,table.concat(self._内容,"",位置,i))
			行号 = 行号 +1
			位置 = i+1
			长度 = 0
		elseif 长度+#v > self._行字数 then--中文
			self:_插入行(行号,table.concat(self._内容,"",位置,i-1))
			行号 = 行号 +1
			位置 = i
			长度 = #v
		elseif v == '\n' then--换行
			self:_插入行(行号,table.concat(self._内容,"",位置,i-1))
				.换行 = 1
			行号 = 行号 +1
			位置 = i+1
			长度 = 0
		else
			长度 = 长度 + #v
		end
		if i == self._光标位置-1 then--结束
			焦点行 = 行号
			光标位置 = i-位置+2
		end
	end
	self:_插入行(行号,table.concat(self._内容,"",位置))
	self._子输入[焦点行]
		:置焦点(true)
		:置光标位置(光标位置)
end
function GUI多输入类:添加文本(str)
	if (self._字符总数 + #str) < self._限制字数  then
		for i,v in splitstr(str) do
			table.insert(self._内容,self._光标位置,v)
			self._光标位置 = self._光标位置+1
		end
		self:_生成文本()
	end
	return self
end
function GUI多输入类:置文本(v)
	print(v)
	if v then
		self._内容 		= {}--记录字符
		self._光标位置 	= 1
		self._字符总数 	= 0
		self:添加文本(tostring(v))
	end
	return self
end
function GUI多输入类:_消息事件(类型,b,c)
--	print(b,c)
	--local b,c = unpack(参数)
	local x,y = b,c
	if 类型 == '输入字符' then
		if self._焦点 then
			if 引擎.按键按住(KEY.CTRL) then
				if c == 0x01 then -- 全选
					self:选中全部()
				elseif c == 0x03 then -- 复制
					F函数.置剪贴板(self:取选中文本(true))
				elseif c == 0x16 then --粘贴
					self:删除选中()
					self:添加文本(string.gsub(F函数.取剪贴板(), '\r\n', '\n'))
				elseif c == 0x18 then --剪贴
					F函数.置剪贴板(self:取选中文本(true))
					self:删除选中()
				end
			elseif c == 0x08 then--退格
				if self._是否选中 then
					self:删除选中()
				elseif self._光标位置 > 1 then
					table.remove(self._内容,self._光标位置-1)
					self._光标位置 = self._光标位置 -1
					self:_生成文本()
				end
			elseif c == 0x0D then--enter
				self:删除选中()
				self:添加文本('\n')
			elseif c <= 0x1C then --特殊
			else
				self:删除选中()
				self:添加文本(b)
			end
			self:发送消息(类型,b,c)
			return true
		end
	elseif 类型 == '输入中文' then
		if self._焦点 then
			self:删除选中()
			self:添加文本(b)
			self:发送消息(类型,b,c)
			return true
		end
	elseif 类型 == '窗口移动' then
		print(x,y)
		self._x,self._y = x+self._px,y+self._py
		self._包围盒:置坐标(self._x,self._y)
		self:发送消息(类型,x,y)
		--return
	elseif 类型 == '左键按下' then
		if self:检查点(x,y) then
			self:置焦点(true)
			self._鼠标按下 	= true
			self._按下行 	= self:_所在行(x,y)
		end
	elseif 类型 == '左键弹起' then
		if self._鼠标按下 then
			self._鼠标按下 = false
			self._是否选中 = (self._光标位置-self._按下位置 ~= 0)
		end
	elseif 类型 == '鼠标移动' then
		if self._鼠标按下 then
			local 当前行,按下行 = self:_所在行(x,y),self._按下行
			if 当前行~=按下行 then
				if 当前行<按下行 then--向上拖选
					self._子输入[当前行]:_消息事件('左键按下',{self._x+self._宽度,y})
					for i=按下行-1,当前行+1,-1 do self._子输入[i]:选中全部()end
					self._子输入[按下行]:选中左边()
				else--向下拖选
					self._子输入[当前行]:_消息事件('左键按下',{self._x,y})
					for i=按下行+1,当前行-1 do self._子输入[i]:选中全部()end
					self._子输入[按下行]:选中右边()
				end
			elseif not self._子输入[当前行]:取焦点() then
				self._子输入[当前行]:置焦点(true)
			end
		end
	elseif 类型 == '释放' then
		self._输入列表[self] = nil
	end
	for i=#self._子输入,1,-1 do--不能用ipairs
		if self._子输入[i]:_消息事件(类型,参数) then
			return true
		end
	end
end
return GUI多输入类