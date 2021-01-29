-- @作者: baidwwy
-- @邮箱:  313738139@qq.com
-- @创建时间:   2015-11-13 10:12:10
-- @最后修改来自: baidwwy
-- @Last Modified time: 2017-03-24 09:31:33

local hpclient = class()

function hpclient:初始化()
	if self._mode ~= 'pack' and self._mode ~= 'udpcast' then
		self._sendbuf 	= require("ggebuf")()
		self._recbuf 	= require("ggebuf")()
	end
end
function hpclient:置收发BUF(a,b)
	self._sendbuf = b
	self._recbuf = a
	return self
end
function hpclient:连接(ip,port,async)--地址，端口，异步
	self._info = {
		ishead 	= true,
		len 	= self._recbuf and self._recbuf:取头长() or 0
	}
	return self._hp:Start(ip,port,async and 1 or 0) ==1
end
function hpclient:断开()
	self._hp:Stop()
end
function hpclient:发送(...)
	self._sendbuf:添加数据(...)
	return self._hp:Send(self._sendbuf:取指针(),self._sendbuf:取长度())==1
end
--准备连接通知
function hpclient:OnPrepareConnect( ... )
	return 1
end
--连接完成通知
function hpclient:OnConnect()
	if self.连接成功 then
	    return __gge.safecall(self.连接成功,self) or 0
	end
	return 1
end
--已发送数据通知
function hpclient:OnSend(pData,iLength)
	if self.发送事件 then
	    return __gge.safecall(self.发送事件,self) or 0
	end
	return 1
end
--通信错误通知
function hpclient:OnClose(...)
	if self.连接断开 then
	    return __gge.safecall(self.连接断开,self,...) or 0
	end
	return 1
end
--握手完成通知（仅用于 SSL 连接）
function hpclient:OnHandShake( ... )
	return 1
end
--数据到达通知
function hpclient:OnReceive( ... )
	return 1
end
--===============================================
function hpclient:是否连接()
	return self._hp:HasStarted() ==1
end
-- enum EnServiceState
-- {
-- 	SS_STARTING	= 0,	// 正在启动
-- 	SS_STARTED	= 1,	// 已经启动
-- 	SS_STOPPING	= 2,	// 正在停止
-- 	SS_STOPPED	= 3,	// 已经停止
-- };
function hpclient:取状态()
	return self._hp:GetState()
end
function hpclient:取错误代码()
	return self._hp:GetLastError()
end
function hpclient:取错误描述()
	return self._hp:GetLastErrorDesc()
end
function hpclient:取连接ID()
	return self._hp:GetConnectionID()
end
--	/* 获取 Client Socket 的地址信息 */
function hpclient:取地址信息()
	return self._hp:GetLocalAddress()
end
function hpclient:取未发出数据长度()
	return self._hp:GetPendingDataLength()
end
function hpclient:置缓存池大小()
	self._hp:SetFreeBufferPoolSize()
end
function hpclient:置缓存池回收阀值()
	self._hp:SetFreeBufferPoolHold()
end
function hpclient:取缓存池大小()
	return self._hp:GetFreeBufferPoolSize()
end
function hpclient:取缓存池回收阀值()
	return self._hp:GetFreeBufferPoolHold()
end
return hpclient