local ffi   = require("ffi")
local _cast   = ffi.cast
local _sizeof = ffi.sizeof
local _string = ffi.string
local _band   = bit.band
local _bor    = bit.bor
local _lshift = bit.lshift
ffi.cdef[[

]]
local FMOD = require("Fmod类")
local fsb = class(FMOD)

function fsb:初始化(数据,长度)
    local head = _cast("FSB4_HEADER*",数据)
    self.List = {}
    if head.flag == 0x34425346 then--FSB4
        self.Data = self._data
        local list = _cast("FSB4_LIST*",self.Data+_sizeof("FSB4_HEADER"))
        local offset = _sizeof("FSB4_HEADER")+head.shdrsize
        for i=0,head.Number-1 do
            self.List[i+1] = {
                off      = self.Data+offset,
                len      = list[i].clen,
                wav      = _band(list[i].mode,0x00000200) == 0,--非mp3
                deffreq  = list[i].deffreq,--采样
                channels = list[i].channels--通道
            }
            self.List[_string(list[i].name)]=self.List[i+1]
            offset=offset+list[i].clen
        end
    end
end

function fsb:播放(重复,id)
    id = id or 1
    if self.List[id] then
        if self.List[id].wav then
            local head = _cast("uint32_t*",self.List[id].off)
            head[0] = 0x46464952 -- RIFF
            head[1] = self.List[id].len-8--wavlen
            head[2] = 0x45564157 --WAVE
            head[3] = 0x20746d66 --fmt\32
            head[4] = 16--len
            head[5] = _bor(_lshift(self.List[id].channels, 16),1)
            head[6] = self.List[id].deffreq--44100
            head[7] = self.List[id].deffreq*self.List[id].channels*2
            head[8] = _bor(0x100000,self.List[id].channels*2)
            head[9] = 0x61746164 --data
            head[10] = self.List[id].len-44--datalen
        end
        self:打开(self.List[id].off,self.List[id].len)
    end
    self:运行父函数(FMOD,"播放",重复)
    return self
end

return fsb