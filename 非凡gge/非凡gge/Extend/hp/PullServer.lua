-- @作者: baidwwy
-- @邮箱:  313738139@qq.com
-- @创建时间:   2017-03-20 11:50:34
-- @最后修改来自: baidwwy
-- @Last Modified time: 2017-03-24 09:43:42
local __hpnew 	 = require("luahp.server")
local tcpserver  = require("hp/TcpServer")
local pullserver = class(tcpserver)
pullserver._mode = 'pull'
pullserver._new  = __hpnew
function pullserver:初始化()
	self._hp = self._new(__gge.cs,__gge.state)
	self._hp:Create_TcpPullServer(self)
end

function pullserver:OnReceive(dwConnID,iLength)--数据到达
	local required 	= self._client[dwConnID].len
	local remain 	= iLength
	while remain >= required do
		remain = remain -required --剩余数据长度
		local FR_OK = self._hp:Fetch(dwConnID,self._recbuf:取指针(),required)
		if FR_OK == 0 then
			if self._client[dwConnID].ishead then--是否是包头
				required = self._recbuf:校验头() --获取包体长度
				if required == 0 then --非法数据
				    self:断开连接(dwConnID)
				    self:OnClose(dwConnID,100,100)
				    break
				end
			else
				if self.数据到达 then
				    __gge.safecall(self.数据到达,self,dwConnID,unpack(self._recbuf:取数据()))
				end
				required = self._recbuf:取头长()--获取包头长度
			end
			self._client[dwConnID].ishead 	= not self._client[dwConnID].ishead
			self._client[dwConnID].len 		= required
		else
			--error('获取失败')
			break
		end
	end

	return 0
end

return pullserver