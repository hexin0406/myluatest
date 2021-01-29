--===================以下函数由start.dll导出==========================================

require("start")
--====================================================================================
function 调试输出(...)
	local x = {...}
	__start.输出(table.concat( x, ", " ))
end

function 取硬盘特征字()
	return __start.取硬盘特征字()
end
function 取CPU特征字()
	return __start.取CPU特征字()
end
function 寻找文件(文件,是否目录)
	return __start.寻找文件(文件,是否目录)
end
function 文本随机加密(t,p)
	return __start.文本随机加密(t,p)
end
function 文本随机解密(t,p)
	return __start.文本随机解密(t,p)
end
function 检测VMWare()
	return __start.检测VMWare()
end
function 检测VPC()
	return __start.检测VPC()
end