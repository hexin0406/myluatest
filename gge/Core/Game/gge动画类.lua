-- @作者: baidwwy
-- @邮箱:  313738139@qq.com
-- @创建时间:   2015-01-27 03:51:34
-- @最后修改来自: baidwwy
-- @Last Modified time: 2015-06-30 20:48:16
--======================================================================--
--该 文件由GGELUA创建
--
--作者：baidwwy  创建日期：2014-06-23 11:55:35
--======================================================================--
local __ggeAnimation = require "ggeanimation"
local _tostring = function (t) return "ggeAnimation",tostring(t.Ani) end
local GGE动画 = class()


function GGE动画:初始化(纹理,帧数,帧率,宽度,高度,纹理x,纹理y)
	if tostring(纹理) == "ggeTexture" then
		self.宽度 = 宽度
		self.高度 = 高度
		self.Ani = __ggeAnimation(纹理:取指针(),帧数,帧率,宽度,高度,纹理x or 0,纹理y or 0)
		self.isok = self.Ani:CheckP()
		self.包围盒 = require ("gge包围盒")(0,0,宽度,高度)
	end
	getmetatable(self).__tostring = _tostring
end
function GGE动画:销毁()
	if __gge.destroy then
	    print('销毁动画->'..tostring(self.Ani))
	end
end
function GGE动画:取包围盒()
	return self.包围盒
end
function GGE动画:检查点(x,y)
	if type(x) == 'table' then
	    y,x = x.y,x.x
	end
	return self.包围盒:检查点(x,y)
end
function GGE动画:播放()
	if(self.isok)then self.Ani:Play() end
	return self
end
function GGE动画:停止()
	if(self.isok)then self.Ani:Stop() end
	return self
end
function GGE动画:继续()
	if(self.isok)then self.Ani:Resume() end
	return self
end
function GGE动画:是否播放()
	if(self.isok)then return self.Ani:IsPlaying() end
end
function GGE动画:置模式(v)
	if(self.isok)then self.Ani:SetMode(v) end
end
function GGE动画:置帧率(v)
	if(self.isok)then self.Ani:SetSpeed(v) end
end
function GGE动画:置当前帧(v)
	if(self.isok)then self.Ani:SetFrame(v) end
end
function GGE动画:置纹理(v)
	if(self.isok)then self.Ani:SetTexture(v:取指针()) end
end
function GGE动画:置颜色(v)
	if(self.isok)then self.Ani:SetColor(v,-1) end
end
function GGE动画:置帧数(v)
	if(self.isok)then self.Ani:SetFrameNum(v) end
end
function GGE动画:置混合模式(v)
	if(self.isok)then self.Ani:SetBlendMode(v) end
end
function GGE动画:置纹理过滤(v)
	if(self.isok)then self.Ani:SetTextureFilter(v) end
end
function GGE动画:置中心(x,y)
	if(self.isok)then self.Ani:SetHotSpot(x,y) end
end
function GGE动画:置翻转(x,y,h)
	if(self.isok)then self.Ani:SetFlip(x,y,h) end
end
function GGE动画:取宽度()
	if(self.isok)then return self.宽度 end
	return 0
end
function GGE动画:取高度()
	if(self.isok)then return self.高度 end
	return 0
end
function GGE动画:更新(dt)
	if(self.isok)then self.Ani:Update(dt) end
end


function GGE动画:显示(x,y)
	if type(x)=='table' then
	    y,x=x.y,x,x
	end
	if(self.isok)then 

		if x then self.包围盒:置坐标(x,y);self.Ani:SetPosition(x,y) end
		self.Ani:Render()
	end
end

return GGE动画