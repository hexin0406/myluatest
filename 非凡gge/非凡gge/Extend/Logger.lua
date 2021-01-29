
local logger = {}
local ffi = require( "ffi" )
ffi.cdef[[
	int 	_access(const char*, int);
	void* 	ILogger_Create();
	bool 	ILogger_Init(void*);
	void 	ILogger_Debug_0(void*,const char*);
	void 	ILogger_Trace_0(void*,const char*);
	void 	ILogger_Info_0(void*,const char*);
	void 	ILogger_Warn_0(void*,const char*);
	void 	ILogger_Error_0(void*,const char*);
	void 	ILogger_Fatal_0(void*,const char*);
]]

local Logdll
if ffi.C._access(__gge.runpath.."/lib/Logger_C.dll",0) == 0 then
    Logdll = ffi.load("./lib/Logger_C.dll")
else
	Logdll = ffi.load("Logger_C.dll")
end

function logger.创建()
	logger.log 	= Logdll.ILogger_Create()
	logger.isok = Logdll.ILogger_Init(logger.log)
	return logger
end
setmetatable(logger,{__call = function (t,...)
	return t.创建(...)
end
})
function logger:debug(str)--调试
	Logdll.ILogger_Debug_0(self.log,tostring(str))
end
function logger:trace(str)--追踪
	Logdll.ILogger_Trace_0(self.log,tostring(str))
end
function logger:info(str)--信息
	Logdll.ILogger_Info_0(self.log,tostring(str))
end
function logger:warn(str)--警告
	Logdll.ILogger_Warn_0(self.log,tostring(str))
end
function logger:error(str)--错误
	Logdll.ILogger_Error_0(self.log,tostring(str))
end
function logger:fatal(str)--致命
	Logdll.ILogger_Fatal_0(self.log,tostring(str))
end

return logger