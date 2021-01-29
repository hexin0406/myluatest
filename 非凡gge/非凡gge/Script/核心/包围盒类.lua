
local g包围盒 = class()


function g包围盒:初始化(x,y,w,h,c)
	self.x = x
	self.y = y
	self.w = w
	self.h = h
	self.颜色 = c or -1
	local t = getmetatable(self)
	t.__tostring = function (a,b)
		return "gge包围盒"
	end
end
function g包围盒:检查包围盒(b)
	if self:检查点(b.x,b.y) then
	    return 1
	elseif self:检查点(b.x+b.w,b.y) then
	    return 2
	elseif self:检查点(b.x,b.y+b.h) then
	    return 3
	elseif self:检查点(b.x+b.w,b.y+b.h) then
	    return 4
	end
	return false
end

function g包围盒:检查点(x,y)
	if x>=self.x and x<=self.x+self.w then
	    if y>=self.y and y<=self.y+self.h then
	    	return true
		end
	end
	return false
end
function g包围盒:置坐标(x,y)
	self.x = x
	self.y = y
	return self
end
function g包围盒:置宽高(x,y)
	self.w = x
	self.h = y
	return self
end
function g包围盒:更新1(x,y,w,h)
	self.x = x
	self.y = y
	if w then
		self.w = w
		self.h = h
	end
end
function g包围盒:更新宽高(x,y)
	self.w = x
	self.h = y
end
function g包围盒:显示(x,y)
	if x then
	    x,y = self.x+x,self.y+y
	else
		x,y =self.x,self.y
	end
	local 画线 = 引擎.画线
	画线(x,y,x+self.w,y,self.颜色)--上
	画线(x,y+self.h,x+self.w,y+self.h,self.颜色)--下
	画线(x,y,x,y+self.h,self.颜色)--左
	画线(x+self.w,y,x+self.w,y+self.h,self.颜色)--右
end

function g包围盒:取坐标()
	return self.x,self.y
end


return g包围盒