local __ggeImage = require "ggeimage"
local _tostring = function (t) return "ggeImage",tostring(t.Image) end
-- <<=========================================================================================>>--
local GGE图像 = class()

function GGE图像:初始化(...)
	local arg = {...}
	local x = type(arg[1])
	self.Image = __ggeImage()

	if(x == "string")then
		self.Image:Image_LoadFile(arg[1],arg[2] or 0)
	elseif(x == "number")then
		if type(arg[2])  == "number" then--2为指针长度
			self.Image:Image_LoadMem(arg[1],arg[2] or 0,arg[3] or 0,arg[4] or '未知')
		else
			self.Image:SetP(arg[1],arg[2] or '未知') --gge图像指针
		end
	end
	self.isok = self.Image:CheckP()
	if not self.isok then
	    print("图像载入失败->"..arg[1])
	end
	--self:锁定(true)
	self.包围盒 = require ("gge包围盒")(0,0,self:取宽度(),self:取高度())
	getmetatable(self).__tostring = _tostring
end
function GGE图像:销毁()
	if __gge.destroy then
	    print('销毁图像->'..tostring(self.Image))
	end
end
function GGE图像:取包围盒()
	return self.包围盒
end
function GGE图像:检查点(x,y)
	if type(x) == 'table' then
	    y,x = x.y,x.x
	end
	return self.包围盒:检查点(x,y)
end
function GGE图像:显示(x,y)
	if type(x) == 'table' then
	    y,x = x.y,x.x
	end
	if(self.isok)then
		self.x,self.y = x or 0,y or 0
		self.包围盒:置坐标(self.x,self.y)
		self.Image:Render(self.x,self.y)
	end
end

function GGE图像:锁定(v)
	if(self.isok)then
		self.islock = self.Image:Lock(v)
		return self.islock
	end
end
function GGE图像:解锁()
	if(self.isok)then
		self.islock = false
		self.Image:Unlock() end
end
function GGE图像:取像素(x,y)
	if type(x) == 'table' then
	    y,x = x.y,x.x
	end
	if(self.isok)then
		if(not self.islock)then self:锁定(true) end
		if self:检查点(x,y) then
			if self.x then
			    return self.Image:GetPixel(x-self.x,y-self.y)
			end
		end
	end
	return 0
end
function GGE图像:置像素(x,y,v)
	if(self.isok and self.islock)then  self.Image:SetPixel(x,y,v) end
end
function GGE图像:置区域(x,y,w,h)
	if(self.isok)then  self.Image:SetRect(x,y,w,h) end
	return self
end
function GGE图像:置颜色(v)
	if(self.isok)then  self.Image:SetColor(v) end
end
function GGE图像:置Z轴(v)
	if(self.isok)then  self.Image:SetZ(v) end
end
function GGE图像:置混合(v)
	if(self.isok)then  self.Image:SetBlendMode(v) end
end
function GGE图像:置过滤(v)
	if(self.isok)then  self.Image:SetTextureFilter(v) end
end
function GGE图像:置翻转(x,y)
	if(self.isok)then  self.Image:SetFlip(x,y) end
end
function GGE图像:取颜色()
	if(self.isok)then return self.Image:GetColor() end
end
function GGE图像:取Z轴()
	if(self.isok)then return self.Image:GetZ() end
end
function GGE图像:取混合()
	if(self.isok)then return self.Image:GetBlendMode() end
end
function GGE图像:是否过滤()
	if(self.isok)then return self.Image:IsTextureFilter() end
end
function GGE图像:是否翻转()
	if(self.isok)then return unpack(self.Image:GetFlip()) end
end

function GGE图像:取宽度()
	if(self.isok)then return self.Image:GetWidth() end
	return 0
end
function GGE图像:取高度()
	if(self.isok)then return self.Image:GetHeight() end
	return 0
end


return GGE图像