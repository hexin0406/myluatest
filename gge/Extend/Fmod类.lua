-- @作者: baidwwy
-- @邮箱:  313738139@qq.com
-- @创建时间:   2017-05-08 00:05:51
-- @最后修改来自: baidwwy
-- @Last Modified time: 2018-05-15 18:50:22


local ffi = require( "ffi" )

ffi.cdef[[
    void*   __stdcall FSOUND_Init(int,int,int);
    void    __stdcall FSOUND_Close();

    void*   __stdcall FSOUND_Stream_Open(const char*,int,int,int);

    int     __stdcall FSOUND_Stream_Play(int,void*);
    bool    __stdcall FSOUND_Stream_Close(void*);
    bool    __stdcall FSOUND_Stream_Stop(void*);
    bool    __stdcall FSOUND_Stream_SetPosition(void*,int);
    int     __stdcall FSOUND_Stream_GetPosition(void*);
    bool    __stdcall FSOUND_Stream_SetTime(void*,int);
    int     __stdcall FSOUND_Stream_GetTime(void*);
    int     __stdcall FSOUND_Stream_GetLength(void*);
    int     __stdcall FSOUND_Stream_GetLengthMs(void*);
    bool    __stdcall FSOUND_Stream_SetMode(void*,int);
    int     __stdcall FSOUND_Stream_GetMode(void*);
    bool    __stdcall FSOUND_Stream_SetLoopPoints(void*,int,int);
    bool    __stdcall FSOUND_Stream_SetLoopCount(void*,int);

    bool    __stdcall FSOUND_SetFrequency(int,int);
    bool    __stdcall FSOUND_SetVolume(int,int);
    bool    __stdcall FSOUND_SetVolumeAbsolute(int,int);
    bool    __stdcall FSOUND_SetPaused(int,bool);
    bool    __stdcall FSOUND_SetLoopMode(int,int);
    bool    __stdcall FSOUND_SetCurrentPosition(int,int);

    bool    __stdcall FSOUND_IsPlaying(int);
    int     __stdcall FSOUND_GetVolume(int);
    bool    __stdcall FSOUND_GetPaused(int);
    int     __stdcall FSOUND_GetLoopMode(int);
    int     __stdcall FSOUND_GetCurrentPosition(int);

    int     _access(const char*, int);
]]
local _lib

if ffi.C._access(__gge.runpath.."/lib/fmod.dll",0) == 0 then
    _lib = ffi.load("./lib/fmod.dll")
else
    _lib = ffi.load("fmod.dll")
end

local init = ffi.gc(_lib.FSOUND_Init(44100, 32, 0),function ()
    _lib.FSOUND_Close()
end)
local FMOD = class()
rawset(FMOD, "_fmodh", init)
-- #define FSOUND_LOOP_OFF      0x00000001  /* For non looping samples. */
-- #define FSOUND_LOOP_NORMAL   0x00000002  /* For forward looping samples. */
-- #define FSOUND_LOOP_BIDI     0x00000004  /* For bidirectional looping samples.  (no effect if in hardware). */
-- #define FSOUND_8BITS         0x00000008  /* For 8 bit samples. */
-- #define FSOUND_16BITS        0x00000010  /* For 16 bit samples. */
-- #define FSOUND_MONO          0x00000020  /* For mono samples. */
-- #define FSOUND_STEREO        0x00000040  /* For stereo samples. */
-- #define FSOUND_UNSIGNED      0x00000080  /* For user created source data containing unsigned samples. */
-- #define FSOUND_SIGNED        0x00000100  /* For user created source data containing signed data. */
-- #define FSOUND_DELTA         0x00000200  /* For user created source data stored as delta values. */
-- #define FSOUND_IT214         0x00000400  /* For user created source data stored using IT214 compression. */
-- #define FSOUND_IT215         0x00000800  /* For user created source data stored using IT215 compression. */
-- #define FSOUND_HW3D          0x00001000  /* Attempts to make samples use 3d hardware acceleration. (if the card supports it) */
-- #define FSOUND_2D            0x00002000  /* Tells software (not hardware) based sample not to be included in 3d processing. */
-- #define FSOUND_STREAMABLE    0x00004000  /* For a streamimg sound where you feed the data to it. */
-- #define FSOUND_LOADMEMORY    0x00008000  /* "name" will be interpreted as a pointer to data for streaming and samples. */
-- #define FSOUND_LOADRAW       0x00010000  /* Will ignore file format and treat as raw pcm. */
-- #define FSOUND_MPEGACCURATE  0x00020000  /* For FSOUND_Stream_Open - for accurate FSOUND_Stream_GetLengthMs/FSOUND_Stream_SetTime.  WARNING, see FSOUND_Stream_Open for inital opening time performance issues. */
-- #define FSOUND_FORCEMONO     0x00040000  /* For forcing stereo streams and samples to be mono - needed if using FSOUND_HW3D and stereo data - incurs a small speed hit for streams */
-- #define FSOUND_HW2D          0x00080000  /* 2D hardware sounds.  allows hardware specific effects */
-- #define FSOUND_ENABLEFX      0x00100000  /* Allows DX8 FX to be played back on a sound.  Requires DirectX 8 - Note these sounds cannot be played more than once, be 8 bit, be less than a certain size, or have a changing frequency */
-- #define FSOUND_MPEGHALFRATE  0x00200000  /* For FMODCE only - decodes mpeg streams using a lower quality decode, but faster execution */
-- #define FSOUND_IMAADPCM      0x00400000  /* Contents are stored compressed as IMA ADPCM */
-- #define FSOUND_VAG           0x00800000  /* For PS2 only - Contents are compressed as Sony VAG format */
-- #define FSOUND_NONBLOCKING   0x01000000  /* For FSOUND_Stream_Open/FMUSIC_LoadSong - Causes stream or music to open in the background and not block the foreground app.  See FSOUND_Stream_GetOpenState or FMUSIC_GetOpenState to determine when it IS ready. */
-- #define FSOUND_GCADPCM       0x02000000  /* For Gamecube only - Contents are compressed as Gamecube DSP-ADPCM format */
-- #define FSOUND_MULTICHANNEL  0x04000000  /* For PS2 and Gamecube only - Contents are interleaved into a multi-channel (more than stereo) format */
-- #define FSOUND_USECORE0      0x08000000  /* For PS2 only - Sample/Stream is forced to use hardware voices 00-23 */
-- #define FSOUND_USECORE1      0x10000000  /* For PS2 only - Sample/Stream is forced to use hardware voices 24-47 */
-- #define FSOUND_LOADMEMORYIOP 0x20000000  /* For PS2 only - "name" will be interpreted as a pointer to data for streaming and samples.  The address provided will be an IOP address */
-- #define FSOUND_IGNORETAGS    0x40000000  /* Skips id3v2 etc tag checks when opening a stream, to reduce seek/read overhead when opening files (helps with CD performance) */
-- #define FSOUND_STREAM_NET    0x80000000  /* Specifies an internet stream */

-- #define FSOUND_NORMAL       (FSOUND_16BITS | FSOUND_SIGNED | FSOUND_MONO)
function FMOD:初始化(...)
    self._channel = -1
    self._mode = 1
    self.isppaused = false
    self:打开(...)
end
function FMOD:销毁()
    _lib.FSOUND_Stream_Close(self.stream)
end
function FMOD:打开(...)
    local arg = {...}
    if #arg>0 then
        if type(arg[1])=='string' then
            if #arg == 3 then
                self.stream = _lib.FSOUND_Stream_Open(arg[1],0,arg[2],arg[3])--有偏移
            else
                self.stream = _lib.FSOUND_Stream_Open(arg[1],0,0,0)
            end
            self.文件 = arg[1]
        else--内存
            self._mode = 0x8000
            self._data = ffi.new('char[?]',arg[2])
            ffi.copy(self._data,ffi.cast("char*",arg[1]),arg[2])
            self.stream = _lib.FSOUND_Stream_Open(self._data,self._mode,0,arg[2])
        end
    end
    return self
end
function FMOD:播放(loop)
    self._channel = _lib.FSOUND_Stream_Play(-1,self.stream)
    _lib.FSOUND_Stream_SetMode(self.stream,loop and bit.bxor(self._mode,2) or self._mode)
    return self
end
function FMOD:暂停()
    self.isppaused = not self.isppaused
    _lib.FSOUND_SetPaused(self._channel,self.isppaused)
end
FMOD.恢复 = FMOD.暂停

function FMOD:停止()
    _lib.FSOUND_Stream_Stop(self.stream)
    return self
end
function FMOD:置位置(v)--FSOUND_SetCurrentPosition
    _lib.FSOUND_Stream_SetPosition(self.stream,v)
    return self
end
function FMOD:取位置()
    return _lib.FSOUND_Stream_GetPosition(self.stream)
end
-- function FMOD:置模式(v)
--     _lib.FSOUND_Stream_SetMode(self.stream,v)
--     return self
-- end
function FMOD:取模式()
    return _lib.FSOUND_Stream_GetMode(self.stream)
end
function FMOD:置循环点(s,e)
    _lib.FSOUND_Stream_SetLoopPoints(self.stream,s,e)
    return self
end
function FMOD:置循环次数(v)
    _lib.FSOUND_Stream_SetLoopCount(self.stream,v)
    return self
end
function FMOD:置音量(v)
    v = v or 0
    _lib.FSOUND_SetVolume(self._channel,v>140 and 140 or v)
    return self
end
function FMOD:取音量()
    return _lib.FSOUND_GetVolume(self._channel)
end
function FMOD:是否播放()
    return _lib.FSOUND_IsPlaying(self._channel)
end
function FMOD:是否暂停()
    return _lib.FSOUND_GetPaused(self._channel)
end
return FMOD