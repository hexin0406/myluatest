--======================================================================--
--该 文件由GGELUA创建
--
--作者：baidwwy  创建日期：2014-05-17 16:26:08
--======================================================================--
require "glow"

local WAS类 = class()


function WAS类:初始化(文件,长度)
	self.was = __was()

	if self.was:OpenFile(文件,长度 or 0) then
		self.p = self.was:GetP()
		self.help = __glowhelp
		local head = self.help.GetHeader(self.p)
		self.方向数 = head.Group
		self.x = head.x
		self.y = head.y
		self.帧数 = head.Frame
		self.宽度 =	head.w
		self.高度 = head.h
	else
		print("打开失败->"..文件)
	end

end
function WAS类:置调色板(文件)
	
	self.was:SetPal(文件)
	return self
end
function WAS类:调色(...)
	self.was:ChangePal(...)
end
function WAS类:取纹理(fid)
	--if self.was:GetPic(fid)==0 then  return 0 end
	local 纹理 =  require ("gge纹理类").创建(self.was:GetPic(fid)) 
	local t = self.help.GetFrame(self.p)
	t.纹理 = 纹理

	return t
end


function WAS类:取精灵(fid)
	local t = self:取纹理(fid)
	local 精灵 = require("gge精灵类").创建(t.纹理)
	t.精灵 = 精灵
	return t
end

return WAS类