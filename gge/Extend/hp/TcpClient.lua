-- @作者: baidwwy
-- @邮箱:  313738139@qq.com
-- @创建时间:   2017-03-20 16:42:46
-- @最后修改来自: baidwwy
-- @Last Modified time: 2017-03-24 09:42:11
local __hpnew 	= require("luahp.client")
local client 	= require("hp/Client")
local tcpclient = class(client)
tcpclient._mode = 'push'
tcpclient._new  = __hpnew
function tcpclient:初始化()
	if self._mode == 'push' then
		self._hp = self._new(__gge.cs,__gge.state)
		self._hp:Create_TcpClient(self)
	end
end
function tcpclient:OnReceive(pData,iLength)--数据到达
	return 1
end
function tcpclient:置缓冲区大小(v)
	self._hp:SetSocketBufferSize(v)
end
function tcpclient:置心跳检查次数(v)
	self._hp:SetKeepAliveTime(v)
end
function tcpclient:置心跳检查间隔(v)
	self._hp:SetKeepAliveInterval(v)
end
function tcpclient:取缓冲区大小()
	return self._hp:GetSocketBufferSize()
end
function tcpclient:取心跳检查次数()
	return self._hp:GetKeepAliveTime()
end
function tcpclient:取心跳检查间隔()
	return self._hp:GetKeepAliveInterval()
end

return tcpclient