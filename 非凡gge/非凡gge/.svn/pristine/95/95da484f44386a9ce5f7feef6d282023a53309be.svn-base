--======================================================================--
--该 文件由GGELUA创建
--
--作者：baidwwy  创建日期：2014-05-17 16:51:26
--======================================================================--
require "glow"

local WDF类 = class()


function WDF类:初始化(文件)
	self.wdf = __wdf()
	if self.wdf:OpenFile(文件)then 
		self.p = self.wdf:GetDP() --全局共享,如果不使用会被覆盖
	else
		print("打开失败->"..文件)
	end
end


function WDF类:取文件(id)--返回指针和长度
	local len = self.wdf:GetFile(id)
	if len >0 then
		return self.p,len
	else
		return 0,0
	end
end

function WDF类:取信息(id)--返回偏移和长度,一般音效使用
	return self.wdf:GetOffset(id),self.wdf:GetLen(id)
end
function WDF类:取偏移(id)
	return self.wdf:GetOffset(id)
end
function WDF类:取长度(id)
	return self.wdf:GetLen(id)
end

function WDF类:取图像(id,透明色)
	local p,l = self:取文件(id)
	return require("gge图像类")(p,透明色,l)
end
function WDF类:取精灵(id,透明色)
	return require("gge精灵类")(self:取纹理(id,透明色))
end
function WDF类:取纹理(id,透明色)
	local p,l = self:取文件(id)
	return require("gge纹理类")(p,l,透明色)
end
return WDF类