-- @作者: baidwwy
-- @邮箱:  313738139@qq.com
-- @创建时间:   2015-01-27 03:51:34
-- @最后修改来自: baidwwy
-- @Last Modified time: 2016-05-25 00:44:54


local _class 	= {}--保存父类
local ffi = require("ffi")
function class(...)
	local class_type 	= {}--创建的对象
	class_type.super 	= {...}
	class_type.初始化 	= false
	class_type.创建 	= function(...)
		local ctor = {}
			setmetatable(ctor,{ __index = _class[class_type] })--继承类属性和函数
			do--获得初始化属性
				local create;
				create = function(c,...)
					if #c.super > 0	then--继承属性
						for i,v in ipairs(c.super) do
						 	create(v,...)
						end
					end
					if c.初始化 then c.初始化(ctor,...) end
				end
				create(class_type,...)--递归所有父类
			end
			function ctor:运行父函数(id,name,...)--__super
				if type(id) == 'number' then
					if _class[class_type.super[id]] and _class[class_type.super[id]][name] then
					    return _class[class_type.super[id]][name](self,...)
					end
				else
					if _class[id] and _class[id][name] then
					    return _class[id][name](self,...)
					end
				end
			end
		return ctor
	end
	_class[class_type] 	= {}--类函数实际保存
	local mt 			= {}
	mt.__newindex 		= _class[class_type]
	mt.__call			= function (t,...) return t.创建(...) end
	setmetatable(class_type,mt)
	if #class_type.super > 0 then--继承函数
		setmetatable(_class[class_type],{__index = function (t,k)
		    for i,v in ipairs(class_type.super) do
		        local ret = _class[v][k]
		        if ret then
		            return ret
		        end
		    end
		end})
	end
	return class_type
end
--=============================================================================================
--高级类,带有销毁事件,但性能略低
--=============================================================================================
function classex(...)
	local class_type 	= {}--创建的对象
	class_type.super 	= {...}
	class_type.初始化 	= false
	class_type.销毁 	= false
	class_type.创建 	= function(...)
		local ctor = {}--对像真身
			setmetatable(ctor,{ __index = _class[class_type] })--继承类属性和函数
			do--获得初始化属性
				local create;
				create = function(c,...)
					if #c.super > 0	then--继承属性
						for i,v in ipairs(c.super) do
						 	create(v,...)
						end
					end
					if c.初始化 then c.初始化(ctor,...) end
				end
				create(class_type,...)--递归所有父类
			end
			function ctor:运行父函数(id,name,...)
				if type(id) == 'number' then
					if _class[class_type.super[id]] and _class[class_type.super[id]][name] then
					    return _class[class_type.super[id]][name](self,...)
					end
				else
					if _class[id] and _class[id][name] then
					    return _class[id][name](self,...)
					end
				end
			end
		local obj 	= {}--用于检测对象销毁
			obj.__gc = ffi.gc(ffi.new('char[1]'),function ()
				local destroy
				destroy = function(c)
					if #c.super > 0	then
						for i,v in ipairs(c.super) do
						 	destroy(v)
						end
					end
					if c.销毁 then c.销毁(ctor) end
				end
				destroy(class_type)--递归所有父类
				ctor = nil
			end)
		local cmt 	= getmetatable(ctor)--ctormetatable
		local omt 	= {}				--objmetatable
			for k,v in pairs(cmt) do--获得用户修改的mt
				omt[k] = v
			end
			omt.__index 	= ctor
			omt.__newindex 	= ctor
			setmetatable(obj,omt)
		return obj
	end
	_class[class_type] 	= {}--类函数实际保存
	local mt 			= {}
	mt.__newindex 		= _class[class_type]
	mt.__call			= function (t,...) return t.创建(...) end
	-- mt.__tostring 	= function ()
	-- 	return "ggeclass"
	-- end
	setmetatable(class_type,mt)
	if #class_type.super > 0 then--继承函数
		setmetatable(_class[class_type],{__index = function (t,k)
		    for i,v in ipairs(class_type.super) do
		        local ret = _class[v][k]
		        if ret then
		            return ret
		        end
		    end
		end})
	end
	return class_type
end

-- function 测试(hwnd)
-- 	local ffi = require( "ffi" )

-- 	ffi.cdef[[
-- 	typedef struct {
-- 	    unsigned long dwSize;
-- 	    unsigned long dwStyle;
-- 	    unsigned long dwCount;
-- 	    unsigned long dwSelection;
-- 	    unsigned long dwPageStart;
-- 	    unsigned long dwPageSize;
-- 	    unsigned long dwOffset[1];
-- 	} LPCANDIDATELIST;
-- 	void* 	malloc(int);
-- 	void 	free(void*);
-- 	int		ImmGetContext(int);
-- 	bool 	ImmReleaseContext(int ,int);
-- 	int 	ImmGetCandidateListA(int,int,void*,int);
-- 	]]
-- 	local imm32 = ffi.load("imm32.dll")
-- 	local hIMC 	= imm32.ImmGetContext(hwnd)
-- 	local len = imm32.ImmGetCandidateListA(hIMC,0,nil,0)
-- 	if len>28 then
-- 		local pList = ffi.new('char[?]',len)
-- 		imm32.ImmGetCandidateListA(hIMC,0,pList,len)
-- 		local List = ffi.cast("LPCANDIDATELIST*",pList)
-- 		for i=0,List.dwCount-1 do
-- 			print(ffi.string(pList+List.dwOffset[i]))
-- 		end
-- 	end
-- 	imm32.ImmReleaseContext(hwnd,hIMC)
-- end



KEY = {}


KEY.LBUTTON		= 0x00--鼠标左
KEY.RBUTTON		= 0x01--鼠标右
KEY.MBUTTON		= 0x02--鼠标中

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

if not __gge.tmain then 引擎 = require("gge引擎") end