local __ggeThread = require("ggethread")
local _tostring = function (t) return "ggeThread",tostring(t.t) end

local thread = class()

function thread:初始化(callback)
	self.cb = callback
	self.t = __ggeThread()
	getmetatable(self).__tostring = _tostring
end
function thread:销毁()
	if __gge.isdestroy then
	    print('销毁线程->'..tostring(self.t))
	end
end
function thread:CallBack()
	if self.cb  then
	    __SafeCall(self.cb,self.dwThread)
	end
end

function thread:启动(v)
	if v then
	    self.t:SetSleep(v)
	end
	self.dwThread = self.t:StartThread(self)
	return self.dwThread
end

function thread:结束(b)
	if b then
	    self.t:StopThread()
	else
		local a= 0
		while not self.t:Stop() do
			a=a+1
			if a>100000 then
			    break
			end
		end
	end
	return true
end

function thread:置睡眠时间(v)
	self.t:SetSleep(v)
end
return thread