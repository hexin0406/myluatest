-- @作者: baidwwy
-- @邮箱:  313738139@qq.com
-- @创建时间:   2017-03-20 16:55:00
-- @最后修改来自: baidwwy
-- @Last Modified time: 2017-08-06 13:11:00
local pullclient = class(require("hp/TcpClient"))
pullclient._new  = require("luahp.client")
pullclient._mode = 'pull'

function pullclient:初始化()
    self._hp = self._new(__gge.cs,__gge.state)
    self._hp:Create_TcpPullClient(self)
end
function pullclient:OnReceive(iLength)
    local required  = self._info.len
    local remain    = iLength
    while remain >= required do
        remain = remain -required --剩余数据长度
        local FR_OK = self._hp:Fetch(self._recbuf:取指针(),required)
        if FR_OK == 0 then
            if self._info.ishead then--是否是包头
                required = self._recbuf:校验头() --获取包体长度
                if required == 0 then --非法数据
                    self:断开()
                    break
                end
            else
                if self.数据到达 then
                    __gge.safecall(self.数据到达,self,unpack(self._recbuf:取数据()))
                end
                required = self._recbuf:取头长()--获取包头长度
            end
            self._info.ishead   = not self._info.ishead
            self._info.len      = required
        else
            break
        end
    end
    return 0
end


return pullclient