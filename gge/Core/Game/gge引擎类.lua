-- @作者: baidwwy
-- @邮箱:  313738139@qq.com
-- @创建时间:   2015-01-27 03:51:34
-- @最后修改来自: baidwwy
-- @Last Modified time: 2019-08-01 17:08:01
--@表 引擎
local GGE = {}
local function __Frame()
	if(GGE.msg)then
		GGE.char = GGE.Base:Input_GetChar()
		GGE.chartime = os.clock ()
		GGE.msg = false
		if GGE.输入函数 then
		    __SafeCall(GGE.输入函数,GGE.char)
		end
	end
	if(更新函数)then
		if __SafeCall(更新函数,GGE.取帧时间(),GGE.取鼠标坐标()) then
		    return true
		end
	end
	if(渲染函数)then
		if __SafeCall(渲染函数,GGE.取鼠标坐标()) then
		    return true
		end
	end
	return false
end
local function __Message(HWND,UMSG,WPARAM,LPARAM)
	if(UMSG==646 or UMSG==258)then--输入法输入
		GGE.msg = true
	end
	if UMSG ==260 or UMSG ==261 or UMSG ==262 then --ALT
	    return true
	end
	if GGE.消息函数 then __SafeCall(GGE.消息函数 )end
	if UMSG == 0x010F then--输入法候选

	elseif UMSG == 0x0282 then
		if WPARAM == 0x0005 then --or WPARAM == 0x0009 or WPARAM == 0x0003 or WPARAM == 0x0004 then
		    --测试(HWND)
		end
	end
	return false
end
local function __FocusLost()
	if GGE.失去焦点 then
	    return __SafeCall(GGE.失去焦点 )
	end
	return false
end
local function __FocusGain()
	if GGE.获得焦点 then
	    return __SafeCall(GGE.获得焦点 )
	end
	return false
end
local function __Exit()
	if GGE.退出函数 then
	    return __SafeCall(GGE.退出函数 )
	end
	return false
end
local __ggeBase = require("ggebase")

--<<=========================================================================================>>--
--引擎
--<<=========================================================================================>>--


--@说明 创建引擎
--@参数 窗口标题
--@参数 窗口宽度
--@参数 窗口高度
--@参数 是否限制帧率
--@参数 是否显示鼠标
--@参数 是否使用Z轴
--@参数 日志路径
--@参数 是否显示窗口边框
function GGE.创建(标题,宽度,高度,帧率,鼠标,Z轴,日志,无框)

	GGE.Base = __ggeBase()
	GGE.Base:Engine_Create()

	GGE.Base:System_SetStateChar(0,标题 or "Galaxy2D Game Engine")
	GGE.Base:System_SetStateChar(1,日志 or "./log/gge.log")
	--GGE.Base:System_SetStateInt(0,104)
	GGE.Base:System_SetStateInt(1,帧率 or 60)
	GGE.Base:System_SetStateInt(2,宽度 or 800)
	GGE.Base:System_SetStateInt(3,高度 or 600)
	GGE.Base:System_SetStateBool(1,鼠标) -- 隐藏鼠标
	GGE.Base:System_SetStateBool(8,1)-- 是否保持浮点精度
	GGE.Base:System_SetStateBool(4,Z轴)
	--GGE.Base:System_SetStateBool(2,0)
	GGE.Base:System_SetStateFun(0,__Frame)
	GGE.Base:System_SetStateFun(4,__Message)
	GGE.Base:System_NoWindow(无框)
	GGE.Base:System_Initiate()

	GGE.isrun 	= true
	GGE.char = ""
	--__start.更改窗口图标(GGE.取窗口句柄())

	GGE.宽度 	= 宽度
	GGE.高度 	= 高度
	GGE.宽度2 	= 宽度/2
	GGE.高度2 	= 高度/2
	if 引擎创建完成 then 引擎创建完成() end
	return GGE
end
setmetatable(GGE,{__call = function (t, ... )
	return t.创建(...)
end
})
--@说明 渲染开始
--@参数 若该纹理为渲染目标纹理，则渲染到该纹理，否则渲染到默认渲染目标|创建方法 纹理():渲染目标(...)
function GGE.渲染开始( tex )
	if(GGE.isrun)then GGE.Base:Graph_BeginScene(tex and tex.p or 0) end
end
--@说明 渲染结束
function GGE.渲染结束()
	if(GGE.isrun)then GGE.Base:Graph_EndScene() end
end
--@说明 以指定颜色清除屏幕
--@参数 屏幕颜色
function GGE.渲染清除(v)
	if(GGE.isrun)then GGE.Base:Graph_Clear(v) end
end
	-- /// 图元类型
	-- enum PRIM_TYPE
	-- {
	-- 	PRIM_POINTS			= 1, ///< 画点
	-- 	PRIM_LINES			= 2, ///< 画线
	-- 	PRIM_TRIPLES		= 3, ///< 画三角形
	-- 	PRIM_QUADS			= 4, ///< 画矩形
	-- 	PRIM_LINESTRIP		= 5, ///< 画线带
	-- 	PRIM_TRIANGLESTRIP	= 6, ///< 画三角带
	-- 	PRIM_TRIANGLEFAN	= 7, ///< 画扇形
	-- 	PRIM_FORCE32BIT = 0x7FFFFFFF,
	-- };
	-- /// 顶点定义
	-- struct ggeVertex
	-- {
	-- 	float	x, y;		///< 屏幕坐标
	-- 	float	z;			///< Z缓冲(0~1)
	-- 	gUInt	color;		///< 顶点颜色
	-- 	float	tx, ty;		///< 纹理坐标
	-- };
function GGE.渲染图元(类型,图元,数量,纹理,混合,过滤)
	if(GGE.isrun)then GGE.Base:Graph_RenderBatch(类型,图元,数量,纹理 or 0,混合 or 0,过滤 or false) end
end
--@说明 切换窗口为全屏，再次调用返回窗口
--@参数 bool
function GGE.选标题(v)

 print(v)

 end
function GGE.全屏模式(v)
	if(GGE.isrun)then GGE.Base:System_SetStateBool(0,v) end
end
--@说明 切换窗口为无框模式，再次调用返回正常
--@参数 bool
function GGE.无框模式(v)
	if(GGE.isrun)then GGE.Base:System_SetStateBool(0,v) end
end
--@说明 强制垂直同步
--@参数 bool
function GGE.垂直同步(v)
	if(GGE.isrun)then GGE.Base:System_SetStateBool(6,v) end
end
--@说明 修改窗口图标
--@参数 base64文本，TOOLS下的工具生成
function GGE.置图标(v)
	if(GGE.isrun)then __start.更改窗口图标(GGE.取窗口句柄(),v or '') end
end
--@说明 游戏关闭时的回调函数
--@参数 function对象
function GGE.置退出函数(v)
	if(GGE.isrun)then
		GGE.Base:System_SetStateFun(1,__Exit)
		GGE.退出函数 = v
	end
end
--@说明 窗口失去焦点时的回调函数
--@参数 function对象
function GGE.置失去焦点函数(v)
	if(GGE.isrun)then
		GGE.Base:System_SetStateFun(2,__FocusLost)
		GGE.失去焦点 = v
	end
end
--@说明 窗口获得焦点时的回调函数
--@参数 function对象
function GGE.置获得焦点函数(v)
	if(GGE.isrun)then
		GGE.Base:System_SetStateFun(3,__FocusGain)
		GGE.获得焦点 = v
	end
end
--@说明  窗口消息回调函数
--@参数 function对象
function GGE.置消息函数(v)
	if(GGE.isrun)then
		GGE.消息函数 = v
	end
end
--@说明 键盘输入回调函数
--@参数 function对象
function GGE.置输入函数(v)
	GGE.输入函数 = v
end
--@说明 取窗口句柄
--@返回 窗口句柄
function GGE.取窗口句柄()
	if(GGE.isrun)then return GGE.Base:System_GetStateHwnd() end
	return 0
end
--@说明 运行外部可执行文件或打开URL
--@参数 文件路径
--@返回 成功返回true
function GGE.运行(v)
	if(GGE.isrun)then return GGE.Base:System_Launch(v) end
	return false
end
--@说明 向log文件写出信息(需要要引擎创建时指定LOG文件路径)
--@参数 文本
function GGE.写log(t)
	if(GGE.isrun)then GGE.Base:System_Log(t) end
end
--@说明 设置用于操作的ini文件，如果配置文件在但前目录下要在文件名前加"./"，例如：Ini_SetFile("./cfg.ini")
--@参数 文件路径
function GGE.置ini(v)
	if(string.sub(v,1,1)~=".")then v="./"..v end
	if(GGE.isrun)then GGE.Base:Ini_SetFile(v) end
	return GGE
end
--@说明 写配置文件
--@参数 节点名
--@参数 配置名
--@参数 内容
function GGE.写ini(a,b,c)
	if(GGE.isrun)then GGE.Base:Ini_SetString(a,b,c) end
end
--@说明 读配置文件
--@参数 节点名
--@参数 配置名
function GGE.读ini(a,b)
	if(GGE.isrun)then
		local 结果 = GGE.Base:Ini_GetString(a,b,"")
		return (结果~="" and 结果 or nil)
	end
	return nil
end
function GGE.读配置(f,a,b)
	GGE.置ini(f)
	return GGE.读ini(a,b)
end
--@说明 载入视频文件，已知支持 avi
--@参数 文件路径
--@返回 成功返回true
function GGE.载入视频(v)
	if(GGE.isrun)then return GGE.Base:Video_LoadFromFile(v) end
	return false
end
function GGE.播放视频()
	if(GGE.isrun)then GGE.Base:Video_Play() end
end
function GGE.暂停视频()
	if(GGE.isrun)then GGE.Base:Video_Pause() end
end
function GGE.停止视频()
	if(GGE.isrun)then GGE.Base:Video_Stop() end
end
function GGE.显示视频()
	if(GGE.isrun)then GGE.Base:Video_Render() end
end
function GGE.显示视频_高级(x,y,width,height)
	if(GGE.isrun)then GGE.Base:Video_RenderEx(x,y,width,height) end
end
function GGE.视频是否播放()
	if(GGE.isrun)then GGE.Base:Video_IsPlaying() end
end
function GGE.取视频时间()
	if(GGE.isrun)then GGE.Base:Video_GetPlayingTime() end
end
--@参数 0-100
function GGE.置视频音量(v)
	if(GGE.isrun)then GGE.Base:Video_SetVolume(v) end
end
--@返回 游戏运行时间长
function GGE.取游戏时间()
	if(GGE.isrun)then return GGE.Base:Timer_GetTime() end
	return 0
end
--@返回 系统时间
function GGE.取时间戳() --系统时间
	if(GGE.isrun)then return GGE.Base:Timer_GetTick() end
	return 0
end
--@返回 一帧所用时间
function GGE.取帧时间()
	if(GGE.isrun)then return GGE.Base:Timer_GetDelta() end
	return 0
end
--@返回 FPS
function GGE.取FPS()
	if(GGE.isrun)then return GGE.Base:Timer_GetFPS() end
	return 0
end
--@参数 数值
function GGE.置随机种子(v)
	if(GGE.isrun)then GGE.Base:Random_Seed(v or os.time()) end
end
--@参数 最小整数,最大整数
--@返回 随机结果
function GGE.取随机整数(a,b)
	if(GGE.isrun)then return GGE.Base:Random_Int(a or 0,b or 100) end
	return 0
end
--@参数 最小小数,最大小数
--@返回 随机结果
function GGE.取随机小数(a,b)
	if(GGE.isrun)then return GGE.Base:Random_Float(a or 0,b or 1) end
	return 0
end
--@参数 起点xy,终点xy,颜色(可空),Z轴(可空)
function GGE.画线(x1,y1,x2,y2,color,z)
	if(GGE.isrun)then
		GGE.Base:Graph_RenderLine(x1,y1,x2,y2,color or 0xFFFF0000,z)
	end
end
--@参数 起点xy,终点xy,颜色(可空),Z轴(可空)
function GGE.画矩形(x1,y1,x2,y2,color,z)
	if(GGE.isrun)then GGE.Base:Graph_RenderQuad(x1,y1,x2,y2,color,z) end
end
--@参数 起点xy,终点xy
function GGE.置显示区域(x1,y1,x2,y2)
	if(GGE.isrun)then GGE.Base:Graph_SetClipping(x1,y1,x2,y2) end
end
--@参数
function GGE.置变换矩阵(x,y,dx,dy,rot,hscale,vscale)
	if(GGE.isrun)then GGE.Base:Graph_SetTransform(x,y,dx,dy,rot,hscale,vscale) end
end
	-- /// 屏幕截图格式
	-- enum GGE_IMAGE_FORMAT
	-- {
	-- 	IMAGE_JPG, ///< jpg文件
	-- 	IMAGE_PNG, ///< png文件
	-- 	IMAGE_BMP, ///< bmp文件
	-- 	IMAGE_TGA, ///< tga文件
	-- 	IMAGE_DXT1,///< dds文件
	-- 	IMAGE_DXT3,///< dds文件
	-- 	IMAGE_DXT5,///< dds文件
	-- 	IMAGE_FORCE32BIT = 0x7FFFFFFF,
	-- };
--@参数 文件路径
function GGE.截图(file,格式)
	if(GGE.isrun)then GGE.Base:Graph_Snapshot(file,格式 or 3) end
end
function GGE.截图到纹理(text)--必须是渲染目标纹理
	if(GGE.isrun)then GGE.Base:Graph_GetRenderTarget(text.p) end
end
--@返回 x,y
function GGE.取鼠标坐标(类)
	if(GGE.isrun)then
		if 类 then
		    return require("gge坐标类")(GGE.Base:Input_GetMousePosX(),GGE.Base:Input_GetMousePosY())
		end
		return GGE.Base:Input_GetMousePosX(),GGE.Base:Input_GetMousePosY()
	end
end
--@返回 滚动值
function GGE.取鼠标滚轮()
	if(GGE.isrun)then return GGE.Base:Input_GetMouseWheel() end
end
--@返回 逻辑值
function GGE.是否在窗口内()
	if(GGE.isrun)then return GGE.Base:Input_IsMouseOver() end
end
--@参数 键值
--@返回 逻辑值
function GGE.按键按住(v)
	if(GGE.isrun)then return GGE.Base:Input_IsKeyPress(v) end
end
--@参数 键值
--@返回 逻辑值
function GGE.按键弹起(v)
	if(GGE.isrun)then return GGE.Base:Input_IsKeyUp(v) end
end
--@参数 键值
--@返回 逻辑值
function GGE.按键按下(v)
	if(GGE.isrun)then return GGE.Base:Input_IsKeyDown(v) end
end
--@参数 键值
--@返回 逻辑值
function GGE.鼠标按住(v)
	if(GGE.isrun)then return GGE.Base:Input_IsMousePress(v) end
end
--@参数 键值
--@返回 逻辑值
function GGE.鼠标弹起(v)
	if(GGE.isrun)then return GGE.Base:Input_IsMouseUp(v) end
end
--@参数 键值
--@返回 逻辑值
function GGE.鼠标按下(v)
	if(GGE.isrun)then return GGE.Base:Input_IsMouseDown(v) end
end
--@返回 键盘键值
function GGE.取按下键值()
	if(GGE.isrun)then return GGE.Base:Input_GetKey(v) end
end
--@返回 输入的字符
function GGE.取输入字符()--返回字符时间和字符
	if(GGE.isrun and GGE.char ~="")then
		return GGE.chartime,GGE.char
	end
	return 0,""
end
--@参数 包内文件名,或磁盘文件名.
--@返回 存在返回true
function GGE.文件是否存在(v)
	if(GGE.isrun)then return GGE.Base:Resource_IsExist(v) end
end
--@参数 文件路径,密码
--@返回 成功返回true
function GGE.ZIP添加(v,p)
	if(GGE.isrun)then return GGE.Base:Resource_AttachPack(v,p) end
end
--@参数 添加时的zip文件路径
function GGE.ZIP删除(v)
	if(GGE.isrun)then GGE.Base:Resource_RemovePack(v) end
end
--@参数 目录路径
function GGE.添加路径(v)--添加搜索路径,当zip包找不到文件时,会从磁盘加载
	if(GGE.isrun)then GGE.Base:Resource_AddPath(v) end
end
--@参数 添加时的zip文件路径
--@返回 返回文件名
function GGE.ZIP取首文件名(v) --遍历文件名1
	if(GGE.isrun)then return GGE.Base:Resource_GetPackFirstFileName(v) end
end
--必须用取首文件名先取出一个路径.
--@返回 返回文件名
function GGE.ZIP取下一文件名()--遍历文件名2
	if(GGE.isrun)then return GGE.Base:Resource_GetPackNextFileName() end
end
--@参数 包内文件名,或磁盘文件名.
--@返回 文件长度
function GGE.ZIP读大小(文件)
	if(GGE.isrun)then return GGE.Base:Resource_GetSize(文件) end
end
--@参数 包内文件名,或磁盘文件名.
--@返回 文件指针
function GGE.ZIP读文件(文件)
	if(GGE.isrun)then return GGE.Base:Resource_Load(文件) end
end
function GGE.ZIP读文件2(文件,指针,长度)
	if(GGE.isrun)then return GGE.Base:Resource_LoadTo(文件,指针,长度) end
end
function GGE.ZIP到文本(指针)
	if(GGE.isrun)then return GGE.Base:Resource_ToText(指针) end
end
--@参数 ZIP读取 返回的指针
function GGE.ZIP释放(指针)
	if(GGE.isrun)then  GGE.Base:Resource_Free(指针) end
end
	-- /// 系统状态
	-- enum GGE_STATE_INT
	-- {
	-- 	GGE_ICON,			///< int	设置图标
	-- 	GGE_FPS,			///< int	设置帧率(0:不限制 | >0:限制为该帧率)，可在运行时更改，默认:0
	-- 	GGE_SCREENWIDTH,    ///< int	屏幕宽度，可在运行时更改，默认:640
	-- 	GGE_SCREENHEIGHT,   ///< int	屏幕高度，可在运行时更改，默认:480
	-- 	GGE_SCREENBPP,		///< int	色深(16/32)，可在运行时更改，默认:32
	-- 	GGE_TEXTURESIZE,	///< int	获得纹理最大尺寸，只用于System_GetState()函数
	-- 	GGE_SOUNDBIT,		///< int	音频位率，默认:16
	-- 	GGE_SOUNDRATE,		///< int	音频频率，默认:44100
	-- 	GGE_PSVERSION,		///< int	PixelShader版本，参见PIXEL_SHADER_VERSION，只用于System_GetState()函数
	-- 	GGE_MAXTEXTUREUNITS,///< int	显卡支持的最大纹理单元数，只用于System_GetState()函数
	-- 	GGE_FORCE32BIT_STATE_I = 0x7FFFFFFF,
	-- };

	-- /// 系统状态
	-- enum GGE_STATE_BOOL
	-- {
	-- 	GGE_FULLSCREEN,			///< bool	是否全屏模式，可在运行时更改，默认:false
	-- 	GGE_HIDEMOUSE,			///< bool	是否隐藏系统鼠标，可在运行时更改，默认:true
	-- 	GGE_DEBUGLOG,			///< bool	是否写入调试记录（注意：即使关闭调试记录，还是会创建调试记录文件和写入错误记录），可在运行时更改，默认:true
	-- 	GGE_SUSPEND,			///< bool	非激活状态时是否挂起，默认:false
	-- 	GGE_ZBUFFER,			///< bool	是否开启Z缓冲，可在运行时更改，默认:false（注意：调用System_Initiate()时设为true该功能方可使用）
	-- 	GGE_USESOUND,			///< bool	是否启用引擎音效模块，默认:true
	-- 	GGE_VSYNC,				///< bool	是否开启垂直同步，可在运行时更改，默认:false
	-- 	GGE_FORCETEXFILTER,		///< bool	强制开启纹理过滤，可在运行时更改，默认:false
	-- 	GGE_FPUPRESERVE,		///< bool	是否保持浮点精度，用于解决D3D自动修改浮点精度导致的一些问题，默认:false
	-- 	GGE_ALPHARENDERTARGET,	///< bool	显卡是否支持带Alpha通道的渲染目标纹理，只用于System_GetState()函数
	-- 	GGE_FORCE32BIT_STATE_B = 0x7FFFFFFF,
	-- };

return GGE