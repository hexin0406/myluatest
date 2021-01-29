
local CFile = class()
local ffi 	= require("ffi")
-- r 以只读方式打开文件，该文件必须存在。
-- r+ 以可读写方式打开文件，该文件必须存在。
-- rb+ 读写打开一个二进制文件，允许读写数据，文件必须存在。
-- w 打开只写文件，若文件存在则文件长度清为0，即该文件内容会消失。若文件不存在则建立该文件。
-- w+ 打开可读写文件，若文件存在则文件长度清为零，即该文件内容会消失。若文件不存在则建立该文件。
-- a 以附加的方式打开只写文件。若文件不存在，则会建立该文件，如果文件存在，写入的数据会被加到文件尾，即文件原先的内容会被保留。（EOF符保留）
-- a+ 以附加方式打开可读写的文件。若文件不存在，则会建立该文件，如果文件存在，写入的数据会被加到文件尾后，即文件原先的内容会被保留。 （原来的EOF符不保留）
-- wb 只写打开或新建一个二进制文件；只允许写数据。
-- wb+ 读写打开或建立一个二进制文件，允许读和写。
-- ab+ 读写打开一个二进制文件，允许读或在文件末追加数据。

function CFile:初始化(路径,模式)
	self.fp = ffi.gc(ffi.C.fopen(路径,模式 or 'rb'),ffi.C.fclose)
	if self.fp == nil then
	    error('打开失败->'..路径..'.')
	end
end
function CFile:读入字节集(长度)
	local data = ffi.new('char[?]',长度)
	ffi.C.fread(data,长度,1,self.fp)
	return data
end
function CFile:读入整数()
	local int = ffi.new("int[1]")
	ffi.C.fread(int,4,1,self.fp)
	return int[0]
end
function CFile:读入短整数()
	local int = ffi.new("short int[1]")
	ffi.C.fread(int,2,1,self.fp)
	return int[0]
end
function CFile:写出指针(指针,长度)
	return ffi.C.fwrite(指针,长度,1,self.fp)
end
function CFile:移动读写位置(起始,距离)
	ffi.C.fseek(self.fp,距离,起始)--SEEK_SET,SEEK_CUR,SEEK_END=0,1,2.
end
function CFile:移到文件首()
	ffi.C.rewind(self.fp)
end
function CFile:取读写位置()
	return ffi.C.ftell(self.fp)
end
-- function CFile:关闭()
-- 	ffi.C.fclose(self.fp)
-- end
return CFile