-- @作者: baidwwy
-- @邮箱:  313738139@qq.com
-- @创建时间:   2015-03-29 06:28:13
-- @最后修改来自: baidwwy
-- @Last Modified time: 2017-08-06 13:02:09

local hpserver = class()

function hpserver:初始化()
	if self._mode ~= 'pack' then
		self._sendbuf 	= require("ggebuf")()
		self._recbuf 	= require("ggebuf")()
	end
	self._client 	= {}
end
function hpserver:置收发BUF(a,b)
	self._sendbuf 	= b
	self._recbuf 	= a
	return self
end
function hpserver:停止()
	self._hp:Stop()
end
function hpserver:发送(dwConnID,...)
	self._sendbuf:添加数据(...)
	self._hp:Send(dwConnID,self._sendbuf:取指针(),self._sendbuf:取长度(),0)
end
function hpserver:发送_指针(dwConnID,pBuffer,iLength,iOffset)
	self._hp:Send(dwConnID,pBuffer,iLength,iOffset or 0)
end
--准备监听通知
function hpserver:OnPrepareListen(soListen)--启动成功
	if self.启动成功 then
		return __gge.safecall(self.启动成功,self,soListen) or 0
	end
	return 1
end
--接收连接通知
function hpserver:OnAccept(dwConnID,soClient)--连接进入
	local ip,port = unpack(self._hp:GetRemoteAddress(dwConnID))
	self._client[dwConnID] = {
		ishead 	= true,
		len 	= self._recbuf and self._recbuf:取头长() or 0,
		ip 		= ip,
		port 	= port
	}
	if self.连接进入 then
		return __gge.safecall(self.连接进入,self,dwConnID,ip,port) or 0
	end
	return 1
end
--已发送数据通知
function hpserver:OnSend(dwConnID,pData,iLength)--发送事件
	return 1
end
--通信错误通知
function hpserver:OnClose(dwConnID,enOperation,iErrorCode)--连接退出
	if self.连接退出 then
		return __gge.safecall(self.连接退出,self,dwConnID,enOperation,iErrorCode) or 0
	end
	return 1
end
--关闭通信组件通知
function hpserver:OnShutdown()
	return 1
end
--数据到达通知
function hpserver:OnReceive()
	return 1
end
--握手完成通知（仅用于 SSL 连接）
function hpserver:OnHandShake()
	return 1
end
-- 连接 ID-- 是否强制断开连接
function hpserver:断开连接(dwConnID,bForce)
	return self._hp:Disconnect(dwConnID,(bForce==nil or bForce) and 1 or 0) ==1
end
-- 时长（毫秒）-- 是否强制断开连接
function hpserver:断开超时连接(dwPeriod,bForce)
	return self._hp:DisconnectLongConnections(dwPeriod,(bForce==nil or bForce) and 1 or 0) ==1
end
-- 时长（毫秒）-- 是否强制断开连接
function hpserver:断开静默连接(dwPeriod,bForce)
	return self._hp:DisconnectSilenceConnections(dwPeriod,(bForce==nil or bForce) and 1 or 0) ==1
end
function hpserver:是否已启动()
	return self._hp:HasStarted() ==1
end
--	/* 查看通信组件当前状态 */
-- enum EnServiceState
-- {
-- 	SS_STARTING	= 0,	// 正在启动
-- 	SS_STARTED	= 1,	// 已经启动
-- 	SS_STOPPING	= 2,	// 正在停止
-- 	SS_STOPPED	= 3,	// 已经停止
-- };
function hpserver:取状态()
	return self._hp:GetState()
end
--	/* 获取连接数 */
function hpserver:取连接数()
	return self._hp:GetConnectionCount()
end
function hpserver:取连接ID()
	return self._hp:GetAllConnectionIDs()
end
--	/* 获取某个连接时长（毫秒） */
function hpserver:取连接时长(dwConnID)
	return self._hp:GetConnectPeriod(dwConnID)
end
--	/* 获取某个连接静默时间（毫秒） */
function hpserver:取静默时长(dwConnID)
	return self._hp:GetSilencePeriod(dwConnID)
end
--	/* 获取某个连接的本地地址信息 */
function hpserver:GetLocalAddress(dwConnID)
	-- body
end
--/* 获取某个连接的远程地址信息 */
function hpserver:GetRemoteAddress(dwConnID)
	-- body
end
--	/* 获取最近一次失败操作的错误代码 */
function hpserver:取错误代码()
	return self._hp:GetLastError()
end
--	/* 获取最近一次失败操作的错误描述 */
function hpserver:取错误描述()
	return self._hp:GetLastErrorDesc()
end
--/* 设置数据发送策略 */
-- enum EnSendPolicy
-- {
-- 	SP_PACK				= 0,	// 打包模式（默认）
-- 	SP_SAFE				= 1,	// 安全模式
-- 	SP_DIRECT			= 2,	// 直接模式
-- };

function hpserver:置数据发送策略(enSendPolicy)
	self._hp:SetSendPolicy(enSendPolicy)
	return self
end
--/* 设置 Socket 缓存对象锁定时间（毫秒，在锁定期间该 Socket 缓存对象不能被获取使用） */
function hpserver:置缓存对象锁定时间(dwFreeSocketObjLockTime)
	self._hp:SetFreeSocketObjLockTime(dwFreeSocketObjLockTime)
	return self
end
--/* 设置 Socket 缓存池大小（通常设置为平均并发连接数量的 1/3 - 1/2） */
function hpserver:置Socket缓存池大小(dwFreeSocketObjPool)
	self._hp:SetFreeSocketObjPool(dwFreeSocketObjPool)
	return self
end
--/* 设置内存块缓存池大小（通常设置为 Socket 缓存池大小的 2 - 3 倍） */
function hpserver:置内存块缓存池大小(dwFreeBufferObjPool)
	self._hp:SetFreeBufferObjPool(dwFreeBufferObjPool)
	return self
end
--/* 设置 Socket 缓存池回收阀值（通常设置为 Socket 缓存池大小的 3 倍） */
function hpserver:置Socket缓存池回收阀值(dwFreeSocketObjHold)
	self._hp:SetFreeSocketObjHold(dwFreeSocketObjHold)
	return self
end
--/* 设置内存块缓存池回收阀值（通常设置为内存块缓存池大小的 3 倍） */
function hpserver:置内存块缓存池回收阀值(dwFreeBufferObjHold)
	self._hp:SetFreeBufferObjHold(dwFreeBufferObjHold)
	return self
end
--/* 设置工作线程数量（通常设置为 2 * CPU + 2） */
function hpserver:置工作线程数量(dwWorkerThreadCount)
	self._hp:SetWorkerThreadCount(dwWorkerThreadCount)
	return self
end
--/* 设置是否标记静默时间（设置为 TRUE 时 DisconnectSilenceConnections() 和 GetSilencePeriod() 才有效，默认：FALSE） */
function hpserver:置静默时间(bMarkSilence)
	self._hp:SetMarkSilence(bMarkSilence and 1 or 0)
	return self
end
--/* 获取连接中未发出数据的长度 */
function hpserver:取未发出数据长度(dwConnID)
	return self._hp:GetPendingDataLength(dwConnID)
end
--/* 获取数据发送策略 */
function hpserver:取数据发送策略()
	return self._hp:GetSendPolicy()
end
--/* 获取 Socket 缓存对象锁定时间 */
function hpserver:取缓存对象锁定时间()
	return self._hp:GetFreeSocketObjLockTime()
end
--/* 获取 Socket 缓存池大小 */
function hpserver:取Socket缓存池大小()
	return self._hp:GetFreeSocketObjPool()
end
--/* 获取内存块缓存池大小 */
function hpserver:取内存块缓存池大小()
	return self._hp:GetFreeBufferObjPool()
end
--/* 获取 Socket 缓存池回收阀值 */
function hpserver:取Socket缓存池回收阀值()
	return self._hp:GetFreeSocketObjHold()
end
--/* 获取内存块缓存池回收阀值 */
function hpserver:取内存块缓存池回收阀值()
	return self._hp:GetFreeBufferObjHold()
end
--/* 获取工作线程数量 */
function hpserver:取工作线程数量()
	return self._hp:GetWorkerThreadCount()
end
--/* 检测是否标记静默时间 */
function hpserver:IsMarkSilence()
	return self._hp:IsMarkSilence()
end

return hpserver