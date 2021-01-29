-- @作者: baidwwy
-- @邮箱:  313738139@qq.com
-- @创建时间:   2015-01-27 03:51:34
-- @最后修改来自: baidwwy
-- @Last Modified time: 2019-02-24 00:37:04

local pair = ipairs
local setmetatabl = setmetatable
local _class 	= {}--保存父类
local create;

create = function(ctor,ct,...)
	if #ct.super > 0 then for i,v in pair(ct.super) do create(ctor,v,...) end end if ct.初始化 then ct.初始化(ctor,...) end
end

local function super(self,id,name,...)--__super
  	 return _class[id][name](self,...)
end

function class(...)
	local class_type 	= {}--创建的对象
	class_type.super 	= {...} class_type.初始化 	= false
	class_type.创建 	= function(...) local ctor = {} setmetatabl(ctor,{ __index = _class[class_type] }) create(ctor,class_type,...) return ctor end
	_class[class_type] 	= {运行父函数=super} local mt = {} mt.__newindex 		= _class[class_type] mt.__call = function (t,...) return t.创建(...) end setmetatabl(class_type,mt)
	if #class_type.super > 0 then--继承函数
		setmetatabl(_class[class_type],{__index = function (t,k)
		    for i,v in pair(class_type.super) do
		        local ret = _class[v][k]
		        if ret then
		            return ret
		        end
		    end
		end})
	end
	return class_type
end

if not __gge.tmain then
KEY = {}


KEY.LBUTTON		= 0x00--鼠标左
KEY.RBUTTON		= 0x01--鼠标右
KEY.MBUTTON		= 0x02--鼠标中
右键		= 0x01--鼠标右
KEY.ESCAPE		= 0x1B--ESC
KEY.BACKSPACE	= 0x08--退格
KEY.TAB			= 0x09
KEY.ENTER		= 0x0D
KEY.SPACE		= 0x20--空格

KEY.SHIFT		= 0x10
KEY.CTRL		= 0x11
KEY.ALT			= 0x12

KEY.LWIN		= 0x5B--左WIN
KEY.RWIN		= 0x5C--右WIN
KEY.APPS		= 0x5D

KEY.PAUSE		= 0x13
KEY.CAPSLOCK	= 0x14
KEY.NUMLOCK		= 0x90
KEY.SCROLLLOCK	= 0x91

KEY.PGUP		= 0x21
KEY.PGDN		= 0x22
KEY.HOME		= 0x24
KEY.END			= 0x23
KEY.INSERT		= 0x2D
KEY.DELETE		= 0x2E

KEY.LEFT		= 0x25--左
KEY.UP			= 0x26--上
KEY.RIGHT		= 0x27--右
KEY.DOWN		= 0x28--下

KEY._0			= 0x30
KEY._1			= 0x31
KEY._2			= 0x32
KEY._3			= 0x33
KEY._4			= 0x34
KEY._5			= 0x35
KEY._6			= 0x36
KEY._7			= 0x37
KEY._8			= 0x38
KEY._9			= 0x39

KEY.A			= 0x41
KEY.B			= 0x42
KEY.C			= 0x43
KEY.D			= 0x44
KEY.E			= 0x45
KEY.F			= 0x46
KEY.G			= 0x47
KEY.H			= 0x48
KEY.I			= 0x49
KEY.J			= 0x4A
KEY.K			= 0x4B
KEY.L			= 0x4C
KEY.M			= 0x4D
KEY.N			= 0x4E
KEY.O			= 0x4F
KEY.P			= 0x50
KEY.Q			= 0x51
KEY.R			= 0x52
KEY.S			= 0x53
KEY.T			= 0x54
KEY.U			= 0x55
KEY.V			= 0x56
KEY.W			= 0x57
KEY.X			= 0x58
KEY.Y			= 0x59
KEY.Z			= 0x5A

KEY.GRAVE		= 0xC0
KEY.MINUS		= 0xBD
KEY.EQUALS		= 0xBB
KEY.BACKSLASH	= 0xDC
KEY.LBRACKET	= 0xDB
KEY.RBRACKET	= 0xDD
KEY.SEMICOLON	= 0xBA
KEY.APOSTROPHE	= 0xDE
KEY.COMMA		= 0xBC
KEY.PERIOD		= 0xBE
KEY.SLASH		= 0xBF

KEY.NUMPAD0		= 0x60--小键盘数字
KEY.NUMPAD1		= 0x61
KEY.NUMPAD2		= 0x62
KEY.NUMPAD3		= 0x63
KEY.NUMPAD4		= 0x64
KEY.NUMPAD5		= 0x65
KEY.NUMPAD6		= 0x66
KEY.NUMPAD7		= 0x67
KEY.NUMPAD8		= 0x68
KEY.NUMPAD9		= 0x69

KEY.MULTIPLY	= 0x6A
KEY.DIVIDE		= 0x6F
KEY.ADD			= 0x6B
KEY.SUBTRACT	= 0x6D
KEY.DECIMAL		= 0x6E

KEY.F1			= 0x70
KEY.F2			= 0x71
KEY.F3			= 0x72
KEY.F4			= 0x73
KEY.F5			= 0x74
KEY.F6			= 0x75
KEY.F7			= 0x76
KEY.F8			= 0x77
KEY.F9			= 0x78
KEY.F10			= 0x79
KEY.F11			= 0x7A
KEY.F12			= 0x7B

--[[BLEND 			= {}
BLEND.COLORMUL	= 0												--< 颜色乘
BLEND.COLORADD	= 1												--< 颜色加
BLEND.ALPHAMUL	= 0												--< alpha乘
BLEND.ALPHAADD	= 2												--< alpha加
BLEND.NOZWRITE	= 0												--< 不将顶点的Z轴写入Z缓冲
BLEND.ZWRITE	= 4												--< 将顶点的Z轴写入Z缓冲
--BLEND.DEFAULT	= bit.bor(BLEND.COLORMUL,BLEND.ALPHAMUL,BLEND.NOZWRITE)		--< 默认混合模式
BLEND.DEFAULT_Z		= bit.bor(BLEND.COLORMUL,BLEND.ALPHAMUL,BLEND.ZWRITE)		--< 默认开启Z轴写入混合模式
BLEND.FORCE32BIT 	= 0x7FFFFFFF

BLEND.DEFAULT	   = 0	--< 默认值
BLEND.ZERO         = 1	--< ( 0, 0, 0, 0 )
BLEND.ONE          = 2	--< ( 1, 1, 1, 1 )
BLEND.SRCCOLOR     = 3	--< ( Rs, Gs, Bs, As )
BLEND.INVSRCCOLOR  = 4	--< ( 1 - Rs, 1 - Gs, 1 - Bs, 1 - As )
BLEND.SRCALPHA     = 5	--< ( As, As, As, As )
BLEND.INVSRCALPHA  = 6	--< ( 1 - As, 1 - As, 1 - As, 1 - As )
BLEND.DESTALPHA    = 7	--< ( Ad, Ad, Ad, Ad )
BLEND.INVDESTALPHA = 8	--< ( 1 - Ad, 1 - Ad, 1 - Ad, 1 - Ad )
BLEND.DESTCOLOR    = 9	--< ( Rd, Gd, Bd, Ad )
BLEND.INVDESTCOLOR = 10	--< ( 1 - Rd, 1 - Gd, 1 - Bd, 1 - Ad )
BLEND.SRCALPHASAT  = 11	--< ( f, f, f, 1 ); f = min( As, 1 - Ad )
local function GenAlphaBlendModeArg( srcBlend,dstBlend )
	return bit.bor(bit.lshift(srcBlend, 28),bit.lshift(dstBlend, 24))
end
BLEND.Alpha_Default 			= GenAlphaBlendModeArg(BLEND.SRCALPHA,BLEND.INVSRCCOLOR)
BLEND.Alpha_ColorAdd 			= GenAlphaBlendModeArg(BLEND.SRCALPHA,BLEND.INVSRCALPHA)
BLEND.Alpha_Add 				= GenAlphaBlendModeArg(BLEND.SRCCOLOR,BLEND.INVSRCALPHA)
BLEND.Alpha_SrcAlphaAdd 		= GenAlphaBlendModeArg(BLEND.SRCALPHA,BLEND.ONE)
BLEND.Alpha_SrcColor 			= GenAlphaBlendModeArg(BLEND.SRCCOLOR,BLEND.INVSRCCOLOR)
BLEND.Alpha_SrcColorAdd 		= GenAlphaBlendModeArg(BLEND.SRCCOLOR,BLEND.ONE)
BLEND.Alpha_Invert 				= GenAlphaBlendModeArg(BLEND.INVDESTCOLOR,BLEND.ZERO)
BLEND.Alpha_SrcBright 			= GenAlphaBlendModeArg(BLEND.SRCCOLOR,BLEND.SRCCOLOR)
BLEND.Alpha_Multiply 			= GenAlphaBlendModeArg(BLEND.ZERO,BLEND.SRCCOLOR)
BLEND.Alpha_InvMultiply 		= GenAlphaBlendModeArg(BLEND.ZERO,BLEND.INVSRCCOLOR)
BLEND.Alpha_MultiplyAlpha 		= GenAlphaBlendModeArg(BLEND.ZERO,BLEND.SRCALPHA)
BLEND.Alpha_InvMultiplyAlpha 	= GenAlphaBlendModeArg(BLEND.ZERO,BLEND.INVSRCALPHA)
BLEND.Alpha_DestBright 			= GenAlphaBlendModeArg(BLEND.DESTCOLOR,BLEND.DESTCOLOR)
BLEND.Alpha_InvSrcBright 		= GenAlphaBlendModeArg(BLEND.INVSRCCOLOR,BLEND.INVSRCCOLOR)
BLEND.Alpha_InvDestBright 		= GenAlphaBlendModeArg(BLEND.INVDESTCOLOR,BLEND.INVDESTCOLOR)
BLEND.Alpha_Bright 				= GenAlphaBlendModeArg(BLEND.SRCALPHA,BLEND.INVSRCALPHA)
BLEND.Alpha_Light				= GenAlphaBlendModeArg(BLEND.DESTCOLOR,BLEND.ONE)
BLEND.Alpha_Xor					= GenAlphaBlendModeArg(BLEND.INVDESTCOLOR,BLEND.INVSRCCOLOR)--]]
引擎 = require("gge引擎")
end