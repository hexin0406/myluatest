-- @作者: baidwwy
-- @邮箱:  313738139@qq.com
-- @创建时间:   2016-04-17 19:35:04
-- @最后修改来自: baidwwy
-- @Last Modified time: 2017-08-06 13:06:14

local ffi   = require("ffi")
ffi.cdef[[
#pragma pack(1)
    typedef struct
    {
        uint16_t flag;
        int32_t crc;
        uint32_t len;
        uint16_t qty;
    }ggebuf;
#pragma pack()
    int     RtlComputeCrc32(int,const char*,int);
]]
local ntdll     = ffi.load('ntdll.dll')
__crc32 = function (str,len)
    return ntdll.RtlComputeCrc32(0,str,len)
end
local ggebuf = class()

function ggebuf:初始化(v)
    self.buflen    = v or 4096 --缓存大小
    self.headlen   = ffi.sizeof("ggebuf")
    self.bodylen   = self.buflen - self.headlen--包体长度
    self.flag      = 14138 --包头识别

    self.data      = ffi.new('char[?]',self.buflen)
    self.head      = ffi.cast('ggebuf*',self.data)
    self.head.flag = self.flag

    self.int       = ffi.cast('int*',self.data+self.headlen)
    self.rint      = ffi.cast('int*',self.data)
    self.prt       = tonumber(ffi.cast("intptr_t",self.data))
    self.len       = 0
    self.lock      = true
end
function ggebuf:打包重置()--0包头，1序号，2长度，3数量
    self.i    = 0
    self.len  = self.headlen
    self.lock = false
end
function ggebuf:添加数值(v)
    if self.len+4 <=self.buflen and not self.lock then
        self.int[self.i] = tonumber(v)
        self.i   = self.i +1
        self.len = self.len +4
    else
        error(string.format('添加失败:规则错误或者数据过长.(%s)', v))
    end
end
function ggebuf:添加文本(v)
    if self.len+#v <=self.buflen and not self.lock then
        ffi.copy(self.data+self.len,v,#v)
        self.len  = self.len + #v
        self.lock = true
    else
        error(string.format('添加失败:规则错误或者数据过长.(%s)', #v))
    end
end
function ggebuf:打包完成()
    self.head.len = self.len - self.headlen
    self.head.qty = self.i
    self.head.crc = __crc32(self.data+self.headlen,self.head.len)
    self.lock   = true
end
function ggebuf:添加数据( ... )
    local arg = {...}
    if #arg <5000 then
        self:打包重置()
        for i,v in ipairs(arg) do
            if type(v) == 'number' then
                self:添加数值(v)
            else
                self:添加文本(tostring(v))
            end
        end
        self:打包完成()
    else
        error("参数过多.")
    end
end
--=========================解包========================================
function ggebuf:取头长()--0包头，1序号，2长度
    return self.headlen
end
function ggebuf:校验头()--成功返回包体长度
    if self.head.flag == self.flag and self.head.len >0 and self.head.len <=self.bodylen then
        self.len = self.head.len
        self.qty = self.head.qty
        self.crc = self.head.crc
        return self.len
    end
    return 0
end
function ggebuf:取数据()
    local r = {}
    if self.crc~=__crc32(self.data,self.len) then
        print("数据不完整")
        return r
    end

    local num = self.qty
    if num >= 0 and num<5000 and num*4 < self.bodylen then
        for i=0,num-1 do
            table.insert(r, self.rint[i])
        end
        local stroff = num*4
        if self.len > stroff then
            table.insert(r, ffi.string(self.data+stroff,self.len-stroff))
        end
    end
    return r
end
function ggebuf:取指针()
    return self.prt
end
function ggebuf:取长度()
    return self.len
end
return ggebuf