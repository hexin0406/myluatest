-- @作者: baidwwy
-- @邮箱:  313738139@qq.com
-- @创建时间:   2017-03-20 19:20:00
-- @最后修改来自: baidwwy
-- @Last Modified time: 2017-03-24 09:42:45
local ffi = require("ffi")
local __hpnew 	 = require("luahp.client")
local tcpclient  = require("hp/TcpClient")
local packclient = class(tcpclient)
packclient._mode = 'pack'
packclient._new  = __hpnew
function packclient:初始化()
	self._hp = self._new(__gge.cs,__gge.state)
	self._hp:Create_TcpPackClient(self)
end

function packclient:OnReceive(pData)--数据到达
	if self.数据到达 then
	    __gge.safecall(self.数据到达,self,dwConnID,pData)
	end
	return 0
end
function packclient:发送(文本)
	self._hp:Send(ffi.getptr(文本),#文本,0)
end
--/* 设置数据包最大长度（有效数据包最大长度不能超过 4194303/0x3FFFFF 字节，默认：262144/0x40000） */
function packclient:置数据最大长度(dwMaxPackSize)
	self._hp:SetMaxPackSize(dwMaxPackSize)
end
--/* 设置包头标识（有效包头标识取值范围 0 ~ 1023/0x3FF，当包头标识为 0 时不校验包头，默认：0） */
function packclient:置包头标识(usPackHeaderFlag)
	self._hp:SetPackHeaderFlag(usPackHeaderFlag)
end
--/* 获取数据包最大长度 */
function packclient:取数据包最大长度()
	return self._hp:GetMaxPackSize()
end
--/* 获取包头标识 */
function packclient:取包头标识()
	return self._hp:GetPackHeaderFlag()
end


return packclient