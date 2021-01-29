-- @作者: baidwwy
-- @邮箱:  313738139@qq.com
-- @创建时间:   2017-03-20 20:41:09
-- @最后修改来自: baidwwy
-- @Last Modified time: 2017-03-24 09:44:28
local __hpnew 	= require("luahp.client")
local client 	= require("hp/Client")
local udpcast 	= class(client)
udpcast._mode 	= 'udpcast'
udpcast._new  = __hpnew
function udpcast:初始化()
	self._hp = self._new(__gge.cs,__gge.state)
	self._hp:Create_UdpCast(self)
end

function udpcast:OnReceive(pData)--数据到达
	if self.数据到达 then
	    __gge.safecall(self.数据到达,self,pData)
	end
	return 0
end
--"233.0.0.1"
function udpcast:连接(ip,port,async,bind)--地址，端口，异步
	return self._hp:Start(ip,port,async and 1 or 0,bind or "0.0.0.0") ==1
end
function udpcast:发送(文本)
	self._hp:Send(ffi.getptr(文本),#文本,0)
end
--/* 设置数据报文最大长度（建议在局域网环境下不超过 1472 字节，在广域网环境下不超过 548 字节） */
function udpcast:置数据最大长度(dwMaxDatagramSize)
	self._hp:SetMaxDatagramSize(dwMaxDatagramSize)
end
--/* 设置是否启用地址重用机制（默认：不启用） */
function udpcast:置地址重用(bReuseAddress)
	self._hp:SetReuseAddress(bReuseAddress and 1 or 0)
end
--/* 获取数据报文最大长度 */
function udpcast:取数据最大长度()
	return self._hp:GetMaxDatagramSize()
end
--	/* 检测是否启用地址重用机制 */
function udpcast:是否地址重用()
	return self._hp:IsReuseAddress()==1
end
--	/* 设置传播模式（组播或广播） */
	-- CM_MULTICAST	= 0,	// 组播
	-- CM_BROADCAST	= 1,	// 广播
function udpcast:置传播模式(enCastMode)
	self._hp:SetCastMode(enCastMode)
end
--	/* 获取传播模式 */
function udpcast:取传播模式()
	return self._hp:GetCastMode()
end
--	/* 设置组播报文的 TTL（0 - 255） */
function udpcast:置组播TTL(iMCTtl)
	self._hp:SetMultiCastTtl(iMCTtl)
end
--	/* 获取组播报文的 TTL */
function udpcast:取组播TTL()
	return self._hp:GetMultiCastTtl()
end
--	/* 设置是否启用组播环路（TRUE or FALSE） */
function udpcast:置组播环路(bMCLoop)
	self._hp:SetMultiCastLoop(bMCLoop and 1 or 0)
end
--	/* 检测是否启用组播环路 */
function udpcast:是否组播环路()
	return self._hp:IsMultiCastLoop()==1
end
--	/* 获取当前数据报的远程地址信息（通常在 OnReceive 事件中调用） */
function udpcast:取远程地址()
	return unpack(self._hp:GetRemoteAddress())
end
return udpcast