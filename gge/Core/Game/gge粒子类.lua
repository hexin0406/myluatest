local __ggeParticle = require "ggeparticle"
local _tostring = function (t) return "ggeParticle",tostring(t.Par) end
local GGE粒子 = class()


function GGE粒子:初始化(info)
	self.par = __ggeParticle()
end
function GGE粒子:更新(dt)
	if self.isok then self.par:Update(dt) end
end
function GGE粒子:显示(x,y)
	if self.isok then self:置坐标(x,y);self.par:Render() end
end
function GGE粒子:置坐标(x,y)
	if self.isok then self.par:FireAt(x,y) end
end
function GGE粒子:启动()
	if self.isok then self.par:Fire() end
end
function GGE粒子:停止(b)
	if self.isok then self.par:Stop(b) end
end
function GGE粒子:移动到(x,y,b)
	if self.isok then self.par:MoveTo(x,y,b) end
end
function GGE粒子:置缩放(v)
	if self.isok then self.par:SetScale(v) end
end
function GGE粒子:置位移(x,y)
	if self.isok then self.par:Transpose(x,y) end
end
function GGE粒子:置跟踪(b)
	if self.isok then self.par:TrackBoundingBox(b) end
end
function GGE粒子:置精灵(v)
	if self.isok then self.par:SetSprite(v:取指针()) end
end
function GGE粒子:取总数()
	if self.isok then return self.par:GetParticleCount() end
end
function GGE粒子:取活动数()
	if self.isok then return self.par:GetParticlesAlive() end
end
function GGE粒子:取时间()
	if self.isok then return self.par:GetAge() end
end
function GGE粒子:取缩放()
	if self.isok then return self.par:GetScale() end
end
function GGE粒子:置指针(p)
	self.par:SetP(p)
	self.isok = true
	return self
end
return GGE粒子