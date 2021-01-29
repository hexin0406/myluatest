-- @作者: baidwwy
-- @邮箱:  313738139@qq.com
-- @创建时间:   2015-03-29 06:28:13
-- @最后修改来自: baidwwy
-- @Last Modified time: 2017-03-24 09:44:09
local __hpnew 	= require("luahp.server")
local server 	= require("hp/Server")
local tcpserver = class(server)
tcpserver._mode = 'push'
tcpserver._new  = __hpnew
function tcpserver:初始化()
	if self._mode == 'push' then
		self._hp = self._new(__gge.cs,__gge.state)
		self._hp:Create_TcpServer(self)
	end
end
function tcpserver:OnReceive(dwConnID,pData,iLength)--数据到达
	return 1
end
function tcpserver:启动(ip,port)
	if self._hp:Start(ip,port) == 0 then
		return false
	end
	return true
end
function tcpserver:GetListenAddress( ... )
	-- body
end
--	/* 设置 Accept 预投递数量（根据负载调整设置，Accept 预投递数量越大则支持的并发连接请求越多） */
function tcpserver:置预投递数量(v)
	self._hp:SetAcceptSocketCount(v)
	return self
end
--	/* 设置通信数据缓冲区大小（根据平均通信数据包大小调整设置，通常设置为 1024 的倍数） */
function tcpserver:置缓冲区大小(v)
	self._hp:SetSocketBufferSize(v)
	return self
end
--	/* 设置监听 Socket 的等候队列大小（根据并发连接数量调整设置） */
function tcpserver:置等候队列大小(v)
	self._hp:SetSocketListenQueue(v)
	return self
end
--	/* 设置心跳包间隔（毫秒，0 则不发送心跳包） */
function tcpserver:置心跳检查次数(v)
	self._hp:SetKeepAliveTime(v)
	return self
end
--	/* 设置心跳确认包检测间隔（毫秒，0 不发送心跳包，如果超过若干次 [默认：WinXP 5 次, Win7 10 次] 检测不到心跳确认包则认为已断线） */
function tcpserver:置心跳检查间隔(v)
	self._hp:SetKeepAliveInterval(v)
	return self
end
--	/* 获取 Accept 预投递数量 */
function tcpserver:取预投递数量()
	return self._hp:GetAcceptSocketCount()
end
--	/* 获取通信数据缓冲区大小 */
function tcpserver:取缓冲区大小()
	return self._hp:GetSocketBufferSize()
end
--	/* 获取监听 Socket 的等候队列大小 */
function tcpserver:取等候队列大小()
	return self._hp:GetSocketListenQueue()
end
--	/* 获取心跳检查次数 */
function tcpserver:取心跳检查次数()
	return self._hp:GetKeepAliveTime()
end
--	/* 获取心跳检查间隔 */
function tcpserver:取心跳检查间隔()
	return self._hp:GetKeepAliveInterval()
end

return tcpserver