local ffi  = require("ffi")
local new  = ffi.new
local wdf  = class()
local 文件 = require("Script/系统专用/文件类")--########################################################?自己修改?##########################################
local _Ptr = new('char[10485760]')--全局共享内存

function wdf:初始化(路径)
    self.File  = 文件(路径)
    self.List  = {}
    local head = self.File:读入数据(new("WDF_HEADER"))
    local flag = ffi.string(head.Flag,4)
    self.File:移动读写位置(head.Offset,self.File.SEEK_SET)
    self.Clist = self.File:读入数据(new("FILELIST[?]",head.Number))
    for i=0,head.Number-1 do
        self.List[self.Clist[i].Hash] = self.Clist[i]
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