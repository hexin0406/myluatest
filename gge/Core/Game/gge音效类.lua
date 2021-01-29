-- @作者: baidwwy
-- @邮箱:  313738139@qq.com
-- @创建时间:   2015-01-27 03:51:34
-- @最后修改来自: baidwwy
-- @Last Modified time: 2015-06-27 11:02:11
--<<=========================================================================================>>--
--音效类
local __ggeSound = require "ggesound"
local _tostring = function (t) return "ggeSound",tostring(t.Sound) end
--<<=========================================================================================>>--

local GGE音效 = class()

function GGE音效:初始化(文件,大小,流)
	if type(文件) == "userdata" then
	    self.Sound = 文件
	else
		self.Sound = __ggeSound(文件,流,大小 or 0)
	end

	self.isok = self.Sound:CheckP()
	getmetatable(self).__tostring = _tostring
end
function GGE音效:销毁()
	if __gge.destroy then
	    print('销毁音效->'..tostring(self.Sound))
	end
end
function GGE音效:播放(重复)
	if(self.isok and not self.Sound:IsPlaying())then return self.Sound:Play(重复) end
	return false
end
function GGE音效:播放_高级(音量,声道,音效,重复)
	if(self.isok)then return self.Sound:PlayEx(音量,声道,音效,重复 ) end
	return false
end
function GGE音效:是否播放()
	if(self.isok)then return self.Sound:IsPlaying() end
	return false
end
function GGE音效:暂停()
	if(self.isok)then  self.Sound:Pause() end
end
function GGE音效:停止()
	if(self.isok)then  self.Sound:Stop() end
end
function GGE音效:恢复()
	if(self.isok)then  self.Sound:Resume() end
end
function GGE音效:声道(v)
	if(self.isok)then  self.Sound:SetPan(v) end
end
function GGE音效:置音量(v)
	if(self.isok)then  self.Sound:SetVolume(v) end
end
-- function GGE音效:释放()
-- 	if(self.isok)then  self.Sound:Release() end
-- end

return GGE音效