-- @作者: baidwwy
-- @邮箱:  313738139@qq.com
-- @创建时间:   2015-01-27 03:51:34
-- @最后修改来自: baidwwy
-- @Last Modified time: 2018-06-28 18:02:49
--@表 引擎
local 引擎 = {}
local _exit = false
local _base
local _isrun
local _鼠标函数
local _输入函数
local _消息函数
-- local 更新函数
-- local 渲染函数
local _失去焦点
local _获得焦点
local _退出函数
local _新标题
local char = string.char
local rshift = bit.rshift
local band = bit.band
local safecall = __gge.safecall
local function __FrameLoop(d,x,y)
	safecall(渲染函数,d,x,y) return _exit
end
-- WKE_MSG_MOUSEMOVE       =  0x0200,
-- WKE_MSG_LBUTTONDOWN     =  0x0201,
-- WKE_MSG_LBUTTONUP       =  0x0202,
-- WKE_MSG_LBUTTONDBLCLK   =  0x0203,
-- WKE_MSG_RBUTTONDOWN     =  0x0204,
-- WKE_MSG_RBUTTONUP       =  0x0205,
-- WKE_MSG_RBUTTONDBLCLK   =  0x0206,
-- WKE_MSG_MBUTTONDOWN     =  0x0207,
-- WKE_MSG_MBUTTONUP       =  0x0208,
-- WKE_MSG_MBUTTONDBLCLK   =  0x0209,
-- WKE_MSG_MOUSEWHEEL      =  0x020A,
local function __Message(HWND,UMSG,WPARAM,LPARAM)
	-- if UMSG ~=132 and UMSG ~= 32 and UMSG ~= 512 and UMSG ~= 13  then
	--     print(UMSG,WPARAM,LPARAM)
	-- end
	if UMSG > 511 and UMSG < 523 then
		if _鼠标函数 then safecall(_鼠标函数,UMSG)end
	    return true
	end
	if(UMSG==646)then--WM_IME_CHAR
		if WPARAM<=127 then
			__Message(HWND,258,WPARAM,LPARAM)
		else
			if _输入函数 then safecall(_输入函数,UMSG,char(rshift(WPARAM,8),band(WPARAM,255)),WPARAM)end
		end
		return true
	elseif UMSG == 258 then--WM_CHAR
		if _输入函数 then safecall(_输入函数,UMSG,char(WPARAM),WPARAM) end
		return true
	elseif UMSG == 256 then--WM_KEYDOWN
		--print(UMSG,WPARAM,LPARAM)
	end
	if UMSG ==260 or UMSG ==261 or UMSG ==262 then --ALT
	    return true
	end
	if _消息函数 then safecall(_消息函数,UMSG,WPARAM,LPARAM)end
	-- if UMSG == 0x010F then--输入法候选

	-- elseif UMSG == 0x0282 then
	-- 	if WPARAM == 0x0005 then --or WPARAM == 0x0009 or WPARAM == 0x0003 or WPARAM == 0x0004 then
	-- 	    --测试(HWND)
	-- 	end
	-- end
	return false
end
local function __FocusLost()
	if _失去焦点 then
	    return safecall(_失去焦点 )
	end
	return false
end
local function __FocusGain()
	if _获得焦点 then
	    return safecall(_获得焦点 )
	end
	return false
end
local function __Exit()
	if _退出函数 then
	    return safecall(_退出函数)
	end
	return false
end

--<<=========================================================================================>>--
--引擎
--<<=========================================================================================>>--
_base = require("__ggebase__")()

--@说明 创建引擎
--@参数 窗口标题
--@参数 窗口宽度
--@参数 窗口高度
--@参数 刷新帧率
--@参数 是否显示鼠标

function 引擎.创建(标题,宽度,高度,帧率,鼠标)
	if not _isrun then
		_base:Engine_Create()
		引擎.标题 = 标题 or "Galaxy2D Game Engine"
		引擎.原始标题 = 引擎.标题
		_base:System_SetStateChar(0,引擎.标题)
		_base:System_SetStateChar(1,"./log/GGELUA.log")
		_base:System_SetStateInt(0,104)--图标号
		_base:System_SetStateInt(1,帧率 or 120)
		_base:System_SetStateInt(2,宽度 or 800)
		_base:System_SetStateInt(3,高度 or 620)
		--_base:System_SetStateBool(1,鼠标) -- 隐藏鼠标
		_base:System_SetStateBool(4,false)--Z缓冲
		_base:System_SetStateBool(8,true)-- 是否保持浮点精度
		--_base:System_SetStateBool(10,true)--无边框
		_base:System_SetStateFun(0,__FrameLoop)
		_base:System_SetStateFun(4,__Message)
		_base:System_Initiate()

		_isrun 	= true

		引擎.宽度 	= 宽度
		引擎.高度 	= 高度
		引擎.宽度2 	= 宽度/2
		引擎.高度2 	= 高度/2

		引擎.是否全屏 = false

		if 引擎创建完成 then 引擎创建完成() end
	end

	return 引擎
end
setmetatable(引擎,{__call = function (t, ... )
	return t.创建(...)
end
})
function 引擎.关闭()
	if _退出函数 then
	    safecall(_退出函数 )
	end
	_exit = true
end

--########################################################?自己修改?##########################################
function 引擎.置标题(v)
	_新标题 = v
end
--@说明 切换窗口为全屏，再次调用返回窗口
--@参数 bool
function 引擎.置全屏()
	if(_isrun)then
		引擎.是否全屏 = not 引擎.是否全屏
		_base:System_SetStateBool(0,引擎.是否全屏)
		return 引擎.是否全屏
	end
end
function 引擎.置宽度(v)
	_base:System_SetStateInt(2,v or 800)
end
function 引擎.置高度(v)
	_base:System_SetStateInt(3,v or 600)
end
function 引擎.置宽高(k,g)
	_base:System_SetStateInt(2,k or 800)
	_base:System_SetStateInt(3,g or 600)
end

--########################################################?自己修改?##########################################
--@说明 渲染开始
--@参数 若该纹理为渲染目标纹理，则渲染到该纹理，否则渲染到默认渲染目标|创建方法 纹理():渲染目标(...)
function 引擎.渲染开始(tex)
	_base:Graph_BeginScene(tex and tex:取指针() or 0)
end
--@说明 渲染结束
function 引擎.渲染结束()
	_base:Graph_EndScene()
end
function 引擎.置鼠标(鼠标)
	_base:System_SetStateBool(1,鼠标)
end
--@说明 以指定颜色清除屏幕
--@参数 屏幕颜色
function 引擎.渲染清除(v)
	_base:Graph_Clear(v)
end
function 引擎.置纹理过滤(v)
	_base:System_SetStateBool(7,v)
end
function 引擎.置宽度(v)
	_base:System_SetStateInt(2,v or 800)
end
function 引擎.置高度(v)
	_base:System_SetStateInt(3,v or 600)
end
--============================================================================================
--@说明 强制垂直同步
--@参数 bool
function 引擎.垂直同步(v)
	_base:System_SetStateBool(6,v)
end
--@说明 游戏关闭时的回调函数
--@参数 function对象
function 引擎.置退出函数(v)
	if(_isrun)then
		_base:System_SetStateFun(1,__Exit)
		_退出函数 = v
	end
end
--@说明 窗口_失去焦点时的回调函数
--@参数 function对象
function 引擎.置失去焦点函数(v)
	if(_isrun)then
		_base:System_SetStateFun(2,__FocusLost)
		_失去焦点 = v
	end
end
--@说明 窗口_获得焦点时的回调函数
--@参数 function对象
function 引擎.置获得焦点函数(v)
	if(_isrun)then
		_base:System_SetStateFun(3,__FocusGain)
		_获得焦点 = v
	end
end
--@说明  窗口消息回调函数
--@参数 function对象
function 引擎.置消息函数(v)
	if(_isrun)then
		_消息函数 = v
	end
end
--@说明 键盘输入回调函数
--@参数 function对象
function 引擎.置输入函数(v)
	_输入函数 = v
end
function 引擎.置鼠标函数(v)
	_鼠标函数 = v
end
--@说明 运行外部可执行文件或打开URL
--@参数 文件路径
--@返回 成功返回true
function 引擎.运行(v)
	if(_isrun)then return _base:System_Launch(v) end
	return false
end
--@说明 向log文件写出信息(需要要引擎创建时指定LOG文件路径)
--@参数 文本
function 引擎.写日志(t)
	if(_isrun)then _base:System_Log(t) end
end
--==========================================================================
--视频
--==========================================================================
--@说明 载入视频文件，已知支持 avi
--@参数 文件路径
--@返回 成功返回true
function 引擎.载入视频(v)
	if(_isrun)then return _base:Video_LoadFromFile(v) end
	return false
end
function 引擎.播放视频()
	if(_isrun)then _base:Video_Play() end
end
function 引擎.暂停视频()
	if(_isrun)then _base:Video_Pause() end
end
function 引擎.停止视频()
	if(_isrun)then _base:Video_Stop() end
end
function 引擎.显示视频()
	if(_isrun)then _base:Video_Render() end
end
function 引擎.显示视频_高级(x,y,width,height)
	if(_isrun)then _base:Video_RenderEx(x,y,width,height) end
end
function 引擎.视频是否播放()
	if(_isrun)then _base:Video_IsPlaying() end
end
function 引擎.取视频时间()
	if(_isrun)then _base:Video_GetPlayingTime() end
end
--@参数 0-100
function 引擎.置视频音量(v)
	if(_isrun)then _base:Video_SetVolume(v) end
end
--@返回 一帧所用时间
function 引擎.取帧时间()
	if(_isrun)then return _base:Timer_GetDelta() end
	return 0
end
--==========================================================================
--随机
--==========================================================================
--@参数 数值
function 引擎.置随机种子(v)
	_base:Random_Seed(v or os.time())
end
--@参数 最小整数,最大整数
--@返回 随机结果
function 引擎.取随机整数(a,b)
	return _base:Random_Int(a,b)
end
--@参数 最小小数,最大小数
--@返回 随机结果
function 引擎.取随机小数(a,b)
	return _base:Random_Float(a,b)
end
--==========================================================================
--渲染
--==========================================================================
--@参数 起点xy,终点xy,颜色(可空)
function 引擎.画线(x1,y1,x2,y2,color)
	_base:Graph_RenderLine(x1,y1,x2,y2,color or -1)
end
--@参数 起点xy,终点xy,颜色(可空)
function 引擎.画矩形(x1,y1,x2,y2,color)
	_base:Graph_RenderQuad(x1,y1,x2,y2,color or -1)
end
--@参数 起点xy,终点xy
function 引擎.置区域(x1,y1,x2,y2)
	_base:Graph_SetClipping(x1,y1,x2,y2)
end
function 引擎.截图(file,格式)
	_base:Graph_Snapshot(file,格式 or 3)
end
function 引擎.截图到纹理(text)--必须是渲染目标纹理
	_base:Graph_GetRenderTarget(text._ptr)
end
--==========================================================================
--输入
--==========================================================================
--@返回 滚动值
function 引擎.取鼠标滚轮()
	return _base:Input_GetMouseWheel()
end
--@参数 键值
--@返回 逻辑值
function 引擎.按键按住(v)
	return _base:Input_IsKeyPress(v)
end
--@参数 键值
--@返回 逻辑值
function 引擎.按键弹起(v)
	return _base:Input_IsKeyUp(v)
end
--@参数 键值
--@返回 逻辑值
function 引擎.按键按下(v)
	return _base:Input_IsKeyDown(v)
end
--@参数 键值
--@返回 逻辑值
function 引擎.鼠标按住(v)
	return _base:Input_IsMousePress(v)
end
--@参数 键值
--@返回 逻辑值
function 引擎.鼠标弹起(v)
	return _base:Input_IsMouseUp(v)
end
--@参数 键值
--@返回 逻辑值
function 引擎.鼠标按下(v)
	return _base:Input_IsMouseDown(v)
end
--@返回 键盘键值
function 引擎.取按下键值()
	return _base:Input_GetKey()
end
--@返回 输入字符
function 引擎.取输入字符()
	return _base:Input_GetChar()
end
--==========================================================================
--资源
--==========================================================================
--@参数 包内文件名,或磁盘文件名.
--@返回 存在返回true
function 引擎.文件是否存在(v)
	return _base:Resource_IsExist(v)
end
function 引擎.取窗口句柄()
	return _base:System_GetStateHwnd()
end
function 引擎.是否在窗口内()
	return _base:Input_IsMouseOver()
end
return 引擎
