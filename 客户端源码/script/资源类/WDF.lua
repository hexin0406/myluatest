--======================================================================--
-- @作者: GGE研究群: 342119466
-- @创建时间:   2018-03-03 02:34:19
-- @Last Modified time: 2020-09-18 19:16:49
-- 梦幻西游游戏资源破解 baidwwy@vip.qq.com(313738139) 老毕   和 C++PrimerPlus 717535046 这俩位大神破解所以资源
--======================================================================--
local ffi  = require("ffi")
local new  = ffi.new
local wdf  = class()
local 文件 = require("文件类")
local _Ptr = new('char[10485760]')--全局共享内存
local Key={0x6D,0x37,0x6F,0x35,0x54,0x43,0x32,0x65,0x68,0x53}
function wdf:初始化(路径)
    self.File  = 文件(路径)
    self.List  = {}
    local head = self.File:读入数据(new("WDF_HEADER"))
    local flag = ffi.string(head.Flag,4)
    self.File:移动读写位置(head.Offset,self.File.SEEK_SET)
    self.Clist = self.File:读入数据(new("FILELIST[?]",head.Number))
    if flag ==  "9103" then
       _WDF解密(self.Clist, ffi.sizeof(self.Clist))
    end
    for i=0,head.Number-1 do
        self.List[self.Clist[i].Hash] = self.Clist[i]
    end
end


local function _解密列表(Data, Size)
    local Data = ffi.cast("char*", Data)
    local Key_Step = 1
    for i = 0, Size - 1, 1 do
        Data[i] = bit.bxor(Data[i], Key[Key_Step])
        Key_Step = Key_Step + 1
        if Key_Step == 34 then
            Key_Step = Key_Step + 1
        end
        if Key_Step == 258 then
            Key_Step = 1
        end
    end
end

function _WDF解密(Data, Size)
    local Data = ffi.cast("char*", Data)
    local Key_Step = 1
    for i = 0, Size - 1, 1 do
        Data[i] = bit.bxor(Data[i], Key2[Key_Step])
        Key_Step=Key_Step+1
        if Key_Step == #Key2 +1 then
           Key_Step = 1
        end
    end
end

function wdf:读数据(Hash)
    if self.List[Hash] then
        self.File:移动读写位置(self.List[Hash].Offset,self.File.SEEK_SET)
        self.File:读入数据(_Ptr,self.List[Hash].Size)
        return _Ptr,self.List[Hash].Size
    end
end

function wdf:读偏移(Hash)
    if self.List[Hash] then
        return self.List[Hash].Offset,self.List[Hash].Size
    end
end

return wdf