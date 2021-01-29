-- @作者: baidwwy
-- @邮箱:  313738139@qq.com
-- @创建时间:   2015-06-12 12:31:00
-- @最后修改来自: baidwwy
-- @Last Modified time: 2015-07-11 11:45:01
local __ggeGuiWindow = require("ggeguiwindow")
local __ggeGuiControl = require("ggeguicontrol")
local GUI控件类 = class()

local 子消息常量 = {
	鼠标碰撞 		= 0,
	鼠标取消碰撞 	= 1,
	鼠标位置移动 	= 2,
	鼠标左键按下	= 3,
	鼠标左键放开	= 4,
	鼠标右键按下 	= 5,
	鼠标右键放开 	= 6,
	鼠标滚轮滚动 	= 7,
	字符输入		= 8,

	获得焦点		= 9,
	失去焦点		= 10,
	按钮单击		= 11,
	选择按钮改变	= 12,
	编辑框改变		= 13,
	滑块改变 		= 14,
	滑块移动 		= 15,
	列表框单击		= 16,
	列表框选中改变	= 17,
	列表框顶部改变	= 18,
	列表框滚动		= 19,

	窗口	=0,
	按钮 	=1,
	选择按钮=2,
	滑块条	=3,
	列表框 	=4,
	编辑框 	=5,
	文本框	=6,
}
function GUI_创建函数(类)
	local 回调类 = 类
	local ffi = require("ffi")
	local cfun = ffi.cast('unsigned(*)(unsigned)',function (info)
		local 对象 = 回调类()
		local ctrl = __ggeGuiControl(对象)--回调消息
		对象:置指针(ctrl:GetP())
		对象.ctrl = ctrl
		return ctrl:Create(info)
	end)
	ffi.gc(cfun,function (p)
		--print('创建函数销毁.')
		p:free()
	end)
	return cfun
end
function GUI控件类:初始化(p)
	self.常量 = 子消息常量
	self.wnd = __ggeGuiWindow()

	if p  then
		self.p = p
	    self.wnd:SetP(p)
	end

	local t = getmetatable(self)
	t.__tostring = function (a,b)
		return "ggeGuiControl",tostring(a.wnd)
	end
end
function GUI控件类:取指针()
	return self.p
end
function GUI控件类:置指针(p)
	self.p = p
	self.wnd:SetP(p)
	return self
end
function GUI控件类:取回调()
	return self.wnd:GetCallBack()
end
function GUI控件类:释放()
	self.ctrl = nil
end
function GUI控件类:取引用总数()
	return self.wnd:GetRefCount()
end
function GUI控件类:是否等于(b)
	if self:取指针() == b:取指针() then
	    return true
	end
	return false
end
function GUI控件类:OnRender()
	
end
function GUI控件类:OnUpdate(dt)

end
function GUI控件类:OnFocus(bFocused)

end
function GUI控件类:OnMouseOver(bOver)

end
function GUI控件类:OnMouseMove(x,y)
	if self.鼠标移动消息 then
	    return __SafeCall(self.鼠标移动消息,self,x,y)
	end
end
function GUI控件类:OnMouseLButton(bDown,x,y)
	if self.鼠标左键消息 then
	    return __SafeCall(self.鼠标左键消息,self,bDown,x,y)
	end
end
function GUI控件类:OnMouseRButton(bDown,x,y)
	if self.鼠标右键消息 then
	    return __SafeCall(self.鼠标右键消息,self,bDown,x,y)
	end
end
function GUI控件类:OnMouseWheel(notches)
	if self.鼠标滚轮消息 then
	    return __SafeCall(self.鼠标滚轮消息,self,notches)
	end
end
function GUI控件类:OnKeyClick(key,str)

end
--local 控件壳 = GUI控件类(0)
function GUI控件类:OnMessage(ctrl,msgType,msgData)
	if self.消息处理 then
	    return __SafeCall(self.消息处理,self,GUI控件类(ctrl),msgType,msgData,true)
	end
	return false
end
function GUI控件类:OnChildMsg(msgType,ctrl)
	if self.子消息处理 then
	    return __SafeCall(self.子消息处理,self,msgType,GUI控件类(ctrl),true)
	end
	return false
end
function GUI控件类:置ID(id)
	self.wnd:SetID(id)
end
function GUI控件类:取ID()
	return self.wnd:GetID()
end
function GUI控件类:置名称(n)
	self.wnd:SetName(n)
end
function GUI控件类:取名称()
	return self.wnd:GetName()
end
function GUI控件类:置提示(n)
	self.wnd:SetToolTip(n)
end
function GUI控件类:取提示()
	return self.wnd:GetToolTip()
end
function GUI控件类:置提示宽度(n)
	self.wnd:SetToolTipWidth(n)
end
function GUI控件类:取提示宽度()
	return self.wnd:GetToolTipWidth()
end
function GUI控件类:置坐标(x,y,b)
	self.wnd:SetPos(x,y,b == nil and true or b)
end
function GUI控件类:取坐标()
	return self.wnd:GetPosX(),self.wnd:GetPosY()
end
function GUI控件类:置宽度(n)
	self.wnd:SetWidth(n)
end
function GUI控件类:取宽度()
	return self.wnd:GetWidth()
end
function GUI控件类:置高度(n)
	self.wnd:SetHeight(n)
end
function GUI控件类:取高度()
	return self.wnd:GetHeight()
end
function GUI控件类:置通知父控件(b)
	self.wnd:SetNotifyParent(b)
end
function GUI控件类:是否通知父控件()
	return self.wnd:IsNotifyParent()
end
function GUI控件类:置静态(b)
	self.wnd:SetStatic(b)
end
function GUI控件类:是否静态()
	return self.wnd:IsStatic()
end
function GUI控件类:置可见(b)
	self.wnd:SetVisible(b)
end
function GUI控件类:是否可见()
	return self.wnd:IsVisible()
end
function GUI控件类:置禁止(b)
	self.wnd:SetEnabled(b)
end
function GUI控件类:是否禁止()
	return self.wnd:IsEnabled()
end
function GUI控件类:置文本(t)
	self.wnd:SetText(t)
end
function GUI控件类:取文本()
	return self.wnd:GetText()
end
function GUI控件类:置对齐模式(t)
	self.wnd:SetAlignMode(t)
end
function GUI控件类:取对齐模式()
	return self.wnd:GetAlignMode()
end
function GUI控件类:置自动换行(b)
	self.wnd:SetTextWarp(b)
end
function GUI控件类:是否自动换行()
	return self.wnd:IsTextWarp()
end
function GUI控件类:置行间距(t)
	self.wnd:SetLineSpace(t)
end
function GUI控件类:取行间距()
	return self.wnd:GetLineSpace()
end
function GUI控件类:置字间距(t)
	self.wnd:SetCharSpace(t)
end
function GUI控件类:取字间距()
	return self.wnd:GetCharSpace()
end
function GUI控件类:置顶层()
	self.wnd:SetTop()
end
function GUI控件类:置焦点()
	self.wnd:SetFocus()
end
function GUI控件类:删除所有控件()
	self.wnd:RemoveAllCtrl()
end
function GUI控件类:通知父控件(msg)
	return self.wnd:NotifyParent(msg)
end
function GUI控件类:发送消息给子控件(类型,数据,遍历)
	return self.wnd:SendChildMsg(类型,数据 or 0,遍历 or false)
end
function GUI控件类:发送消息给父控件(类型,数据)
	return self.wnd:SendParentMsg(类型,数据 or 0)
end
function GUI控件类:查找控件_按ID(id,遍历)
	return GUI控件类(self.wnd:FindCtrl(id,遍历 or false))
end
function GUI控件类:查找控件_按名称(名称,遍历)
	return GUI控件类(self.wnd:FindCtrl2(名称,遍历 or false))
end
function GUI控件类:取父控件()
	return GUI控件类(self.wnd:GetParent())
end
function GUI控件类:消息处理(ctrl,msgType,msgData,p)--p防止死循环
	if p == nil then
	    return self.wnd:OnMessage(ctrl,msgType,msgData)
	end
end
function GUI控件类:子消息处理(msgType,ctrl,p)
	if p == nil then
		return self.wnd:OnChildMsg(msgType,ctrl)
	end
end
function GUI控件类:取类型()
	return self.wnd:GetType()
end
--ggeGuiCheckButton 控件
function GUI控件类:按钮_置选中(b)
	self.wnd:CB_SetChecked(b)
end
function GUI控件类:按钮_是否选中()
	return self.wnd:CB_IsChecked()
end
return GUI控件类