--
local ffi = require("ffi")
ffi.cdef[[
	void* 	CreateFileA(const char*,int,int,void*,int,int,void*);
	bool  	DeviceIoControl(void*,int,void*,int,void*,int,void*,void*);
	bool 	CloseHandle(void*);
	//
	int      OpenClipboard(void*);
	void*    GetClipboardData(unsigned);
	int      CloseClipboard();
	void*    GlobalLock(void*);
	int      GlobalUnlock(void*);
	size_t   GlobalSize(void*);
	//
	int 	GetPrivateProfileStringA(const char*, const char*, const char*, const char*, unsigned, const char*);
	bool 	WritePrivateProfileStringA(const char*, const char*, const char*, const char*);

	int 	OpenClipboard(void*);
	void* 	GetClipboardData(unsigned);
	int 	CloseClipboard();
	void* 	GlobalLock(void*);
	int 	GlobalUnlock(void*);
	size_t 	GlobalSize(void*);

	int 	EmptyClipboard();
	void* 	GlobalAlloc(unsigned, unsigned);
	void* 	GlobalFree(void*);
	void* 	lstrcpy(void*,const char*);
	void* 	SetClipboardData(unsigned,void*);
	//
	typedef struct {
	    unsigned long i[2]; /* number of _bits_ handled mod 2^64 */
	    unsigned long buf[4]; /* scratch buffer */
	    unsigned char in[64]; /* input buffer */
	    unsigned char digest[16]; /* actual digest after MD5Final call */
	} MD5_CTX;
	void MD5Init(MD5_CTX *);
	void MD5Update(MD5_CTX *, const char *, unsigned int);
	void MD5Final(MD5_CTX *);
	//
	int 	MessageBoxA(void *, const char*, const char*, int);
	void 	Sleep(int);
	int 	_access(const char*, int);
]]
local advapi32 = ffi.load("advapi32.dll")
local fun = {}

--=========================
local lfs = require"lfs"
function 取文件夹的所有文件 (path)--取文件夹的所有文件 ("E:/其他用/易语言/游戏源码设计/GGElua/梦幻西游失真调试")
	for file in lfs.dir(path) do
		if file ~= "." and file ~= ".." then
			local f = path..'/'..file
			local attr = lfs.attributes (f)
			assert (type(attr) == "table")
			if attr.mode == "directory" then
				print(f)
			end
		end
	end
end
--取文件夹的所有文件 ("E:/其他用/易语言/游戏源码设计/GGElua/梦幻西游失真调试")
--=============================
require"lfs"
function Lua遍历文档(rootpath, pathes)
    pathes = pathes or {}

    ret, files, iter = pcall(lfs.dir, rootpath)
    if ret == false then
        return pathes
    end
    for entry in files, iter do
        local next = false
        if entry ~= '.' and entry ~= '..' then
            local path = rootpath .. '/' .. entry
            local attr = lfs.attributes(path)
            if attr == nil then
                next = true
            end

            if next == false then
                if attr.mode == 'directory' then
                    Lua遍历文档(path, pathes)
                else
                    table.insert(pathes, path)
                end
            end
        end
        next = false
    end
    return pathes
end
pathes = {}
-- Lua遍历文档("E:/其他用/易语言/游戏源码设计/GGElua/梦幻西游失真调试", pathes)
for i=1,#pathes do
	print(i .. " " .. pathes[i])--1 E:/其他用/易语言/游戏源码设计/GGElua/梦幻西游失真调试/1015.map_mask/000.tga
end
--=====方式2
-- require("lfs")

pathes = {}

function 替换文本(qq,ww,ee)
	if qq==nil then
	    return ""
	end
  local text = string.gsub (qq,tonumber(ww),ee)
  return ffi.string(text)
end

function 替换文本2(qq,ww,ee)
	local 敏感符号={"#dq","#xt","#sj","#dw","群","qun","Q","q","扣","抠"}
	if qq==nil then
	    return ""
	end
	local text = qq
	for i=1,#敏感符号 do
		text = string.gsub(text,敏感符号[i],"**")
	end
	return text--ffi.string(text)
end

function Lua遍历文档2(path)--方法2
    for file in lfs.dir(path) do
        if file ~= "." and file ~= ".." then
            local f = path .. "/" .. file
            local attr = lfs.attributes(f)
            table.insert(pathes, f)
            print (#pathes,f)
            -- for name, value in pairs(attr) do
            --     -- print (name, value)
            -- end
         end
     end
end

-- Lua遍历文档2("scene")
---===================================Lua遍历文档
function 创建目录(dirname)
	print(lfs.currentdir(dirname))
    lfs.mkdir(dirname)
end

function 判断是否数组(是否数组)
	if type(是否数组) == "table" then
	    return true
	end
	return false
end

function 删除目录(dirname)--成功返回true，失败返回nil加上错误信息
   return lfs.rmdir(dirname)
end

function 取当前目录(dirname)--全部目录
    return lfs.currentdir(dirname)
end

function 取文档名称( strurl, strchar, bafter)--getUrlFileName(  "G:/demo/res/readme.txt", "/", true)
    local ts = string.reverse(strurl)
    local param1, param2 = string.find(ts, strchar)  -- 这里以"/"为例
    local m = string.len(strurl) - param2 + 1
    local result
    if (bafter == true) then
    	result = string.sub(strurl, m+1, string.len(strurl))
    else
    	result = string.sub(strurl, 1, m-1)
    end

    return result
end

function 获取文件名(str)--"aaa.bbb.bbb.txt"
    local idx = str:match(".+()%.%w+$")
    if(idx) then
        return str:sub(1, idx-1)
    else
        return str
    end
end

function 获取扩展名(str)--"aaa.bbb.bbb.txt"
    return str:match(".+%.(%w+)$")
end

function 调试输出(内容)
 return print(内容)
end

function 到文本(内容)
 return tonumber(内容)
end

function 到整数(内容)
 return math.ceil(内容)
end

function 取随机数(开始,结束)
 return math.random(开始,结束) --产生1到100之间的随机数［整数型 欲取随机数的最小值］，［整数型 欲取随机数的最大值］
end

function 取长度不足补位(szFullString)
	local 数据E=string.len(szFullString)
	if 数据E==1 then
	    return "00"..szFullString
	elseif 数据E==2 then
		return "0"..szFullString
	else
		return szFullString
	end
end

function 取文本长度(szFullString, szSeparator)--tonumber(文本取长度("文本"))
	return string.len(szFullString)
end

function 判断目录或文件是否存在(path)--判断目录或文件是否存在
	local file = io.open(path, "rb")
	if file then
		file:close()
	end
	return file ~= nil
end

-- function 创建多层目录(_path)--eg:_path = "res/aaa/bbb/ccc"
-- 	if device.platform == "windows" then
-- 		os.execute("mkdir \"" .. _path .. "\"")
-- 	else
-- 		os.execute("mkdir -p \"" .. _path .. "\"")
-- 	end
-- end

-- function 删除目录(_path)
-- 	if device.platform == "windows" then
-- 		os.execute("rm -rf \"" .. _path .. "\"")
-- 	else
-- 		os.execute("rm -rf -p \"" .. _path .. "\"")
-- 	end
-- end

function lua读取文本(文件路径全部)--lua读取文本("server.ini")--lua读取文本("6666666.txt")
 local file1=io.input(文件路径全部)  --当前目录"1.txt"要存在，不然出错
 local str=io.read("*a")
 return str
end

function lua写到文本(文件路径全部,文件内容)--lua写到文本("6666666.txt",file1)
 local file2=io.output(文件路径全部) --当前目录"2.txt"不需要存在
 io.write(文件内容)
 io.flush()
 io.close()
end

function 置DLL目录(d)
	package.cpath = package.cpath ..string.format(';%s/?.dll', d)
end

function 读配置(文件,节点,名称)--读配置("./config.ini","mhxy","宽度")
	local buf = ffi.new("const unsigned char[?]",1024)
	ffi.C.GetPrivateProfileStringA(节点,名称,"空",buf,1024,文件)
	return ffi.string(buf)
end

function 写配置(文件,节点,名称,值)--写配置("./config.ini","mhxy","宽度",全局游戏宽度)
	return ffi.C.WritePrivateProfileStringA(节点,名称,tostring(值),文件)
end

function 文本分割调试(file1)--function [275]-luadec 276
  --   file1= "-1 1 1 内蒙区\n-2 7 7 追忆\n-3 5 1 北京1区\n-4 5 3 上海1区\n-5 1 5 四川2区\n-6 7 4 华南区\n-7 7 2 华北区\n-8 4 6 广东2区\n-9 3 1 江苏1区\n-10 4 2 浙江2区\n-11 2 4 河南1区\n-12 1 3 陕西区\n-13 6 6 山东2区\n-14 2 1 河北1区\n-15 6 3 辽宁1区\n-16 2 7 湖北1区\n-17 7 9 推荐区\n-18 3 7 福建1区\n-19 1 2 山西区\n-20 1 8 广西1区\n-21 3 9 深圳1区\n-22 5 4 上海2区\n-23 1 4 四川1区\n-24 3 4 安徽1区\n-25 3 6 江西区\n-26 2 9 湖南区\n-27 7 1 西北区\n-28 4 1 浙江1区\n-29 1 6 云南区\n-30 7 6 海外专区\n-31 5 5 重庆区\n-50 4 4 浙江4区\n-32 7 8 月光宝盒\n-33 6 5 山东1区\n-34 4 5 广东1区\n-35 6 1 黑龙江区\n-36 6 2 吉林区\n-37 6 7 山东3区\n-38 3 2 江苏2区\n-39 2 5 河南2区\n-40 4 7 广东3区\n-41 2 2 河北2区\n-42 2 8 湖北2区\n-43 4 3 浙江3区\n-44 5 2 北京2区\n-45 3 8 福建2区\n-46 6 4 辽宁2区\n-47 6 8 山东4区\n-48 4 8 广东4区\n-49 2 3 河北3区\n-51 3 3 江苏3区\n-52 4 9 深圳2区\n-53 3 10 活动专区\n-54 6 9 山东5区\n-55 1 9 广西2区\n-56 2 10 测试区\n-57 1 7 贵州区\n-58 2 6 河南3区\n-59 3 5 安徽2区\n-60 7 3 天津区\n-61 7 5 无与伦比\n-62 4 10 帮派联赛\n-63 1 10 新手专区\n-64 5 10 活动1区\n-65 6 10 活动2区\n-66 7 10 2015PK赛\n-67 5 6 天下无双\n66 1 1 华北赛区 127.0.0.1 0 0 欢迎进入龙岚天模拟梦幻PK赛\n66 2 1 东北赛区 127.0.0.1 0 0 欢迎进入龙岚天模拟梦幻PK赛\n66 3 1 山东赛区 127.0.0.1 0 0 欢迎进入龙岚天模拟梦幻PK赛\n66 4 1 华中西北 127.0.0.1 0 0 欢迎进入龙岚天模拟梦幻PK赛\n66 5 1 西南赛区 127.0.0.1 0 0 欢迎进入龙岚天模拟梦幻PK赛\n66 6 1 上海赛区 127.0.0.1 0 0 欢迎进入龙岚天模拟梦幻PK赛\n66 1 2 苏皖赛区 127.0.0.1 0 0 欢迎进入龙岚天模拟梦幻PK赛\n66 2 2 东南赛区 127.0.0.1 0 0 欢迎进入龙岚天模拟梦幻PK赛\n66 3 2 浙江赛区1 127.0.0.1 0 0 欢迎进入龙岚天模拟梦幻PK赛\n66 4 2 浙江赛区2 127.0.0.1 0 0 欢迎进入龙岚天模拟梦幻PK赛\n66 5 2 河南赛区 127.0.0.1 0 0 欢迎进入龙岚天模拟梦幻PK赛\n66 6 2 两广赛区 127.0.0.1 0 0 欢迎进入龙岚天模拟梦幻PK赛\n"
	local servertype = 分割文本(file1, "\n")
	for n = 1, #servertype do
		local typeA = 分割文本(servertype[n], " ")
		if #typeA == 4 then
		    local list_r = typeA
		    -- list_r.cover = D2D_包围盒["创建"](60 - string.len(typeA[4]) * 7 / 2 + 68 * (tonumber(typeA[2]) - 1), 83 + 26 * (tonumber(typeA[3]) - 1), 42, 14)
		    --分割文本1_ -1 _ 1 _ 1 _ 内蒙区 _ 6
		    print("分割文本1_ "..tonumber(typeA[1]).." _ "..tonumber(typeA[2]).." _ "..tonumber(typeA[3]).." _ "..typeA[4].." _ "..tonumber(string.len(typeA[4])))
		    -- table.insert(bigserver, list_r)
		elseif #typeA == 10 then
		    local list_r = typeA
		    -- list_r.cover = D2D_包围盒["创建"](60 - string.len(typeA[4]) * 7 / 2 + 68 * (tonumber(typeA[2]) - 1), 81 + 26 * (10 + tonumber(typeA[3]) - 1), 42, 14)
		    --分割文本2_ 65 _ 1 _ 1 _ 东北赛区 _ 8 _ 122.226.95.91 _ 52667 _ 122.226.95.91 _ 52667 _ 0 _ 欢迎进入模拟梦幻PK赛
		    print("分割文本2_ "..tonumber(typeA[1]).." _ "..tonumber(typeA[2]).." _ "..tonumber(typeA[3]).." _ "..typeA[4].." _ "..tonumber(string.len(typeA[4])).." _ "..typeA[5].." _ "..tonumber(typeA[6]).." _ "..typeA[7].." _ "..tonumber(typeA[8]).." _ "..tonumber(typeA[9]).." _ "..typeA[10])
		    -- table.insert(smallserver, list_r)
		end
	end
   print("分割文本4_ "..servertype[#servertype])
end




function 分割文本(szFullString, szSeparator)
	local nFindStartIndex = 1
	local nSplitIndex = 1
	local nSplitArray = {}
	while true do
		local nFindLastIndex = string.find(szFullString, szSeparator, nFindStartIndex)
		if not nFindLastIndex then
		    nSplitArray[nSplitIndex] = string.sub(szFullString, nFindStartIndex, string.len(szFullString))
		    break
		end
		nSplitArray[nSplitIndex] = string.sub(szFullString, nFindStartIndex, nFindLastIndex - 1)
		nFindStartIndex = nFindLastIndex + string.len(szSeparator)
		nSplitIndex = nSplitIndex + 1
	end
	return nSplitArray
end

function 分割字符(str,tv)
	local t = tv or {}
	local i = 1
	local ascii = 0
	while true do
		ascii = string.byte(str, i)
		if ascii then
			if ascii < 127 then
				table.insert(t,string.sub(str, i, i))
				i = i+1
			else
				table.insert(t,string.sub(str, i, i+1))
			    i = i+2
			end
		else
		    break
		end
	end
	return t
end

function 初始化怪物csv数据()
    local 文件 = assert(io.open("怪物.csv", "r")) -- 打开 配置文件 怪物.csv
    local 文件内容 = 文件:read("*all")  -- 读取所有内容
    文件:close() -- 关闭 配置文件 怪物.csv

    local  首次分割 = 分割文本(文件内容, "\n")  -- 先按行分割
    local  临时怪物 = {}
    local  再次分割 = {}

    for n=2, table.getn(首次分割) do --从第二行开始 因为 怪物.csv 中第一行是解释说明
        if (首次分割[n] ~= "") then
            再次分割 = 分割文本(首次分割[n], ",") -- 每一行用,号分割,分割得到所有的列信息
            if (table.getn(再次分割) == 11 ) then -- 因为 怪物.csv 中一共有11列数据,所以这里判断 如果是11列从继续配置
                临时怪物 =    -- 把列信息分割出来 存放到一个临时表中
                {
                    名称 = 再次分割[1],
                    hp = tonumber( 再次分割[2] ),
                    maxhp = tonumber( 再次分割[3] ),
                    mp =  tonumber( 再次分割[4] ),
                    maxmp =  tonumber( 再次分割[5] ),
                    命中 = tonumber( 再次分割[6] ),
                    躲避 = tonumber( 再次分割[7] ),
                    攻击 = tonumber( 再次分割[8] ),
                    max_攻击 = tonumber( 再次分割[9] ),
                    物防 = tonumber( 再次分割[10] ),
                    max_物防 = tonumber( 再次分割[11] )
                }
                table.insert(Q_游戏怪物组,临时怪物)  -- 加入到全局的数据组中,方便后面调用
                print(临时怪物,再次分割[1])
            end
        end
    end
end

function encodeBase64(source_str)--64加
    local b64chars ='ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/'
    local s64 = ''
    local str = source_str

    while #str > 0 do
        local bytes_num = 0
        local buf = 0

        for byte_cnt=1,3 do
            buf = (buf * 256)
            if #str > 0 then
                buf = buf + string.byte(str, 1, 1)
                str = string.sub(str, 2)
                bytes_num = bytes_num + 1
            end
        end

        for group_cnt=1,(bytes_num+1) do
            local b64char = math.fmod(math.floor(buf/262144), 64) + 1
            s64 = s64 .. string.sub(b64chars, b64char, b64char)
            buf = buf * 64
        end

        for fill_cnt=1,(3-bytes_num) do
            s64 = s64 .. '='
        end
    end

    return s64
end

function decodeBase64(str64)--64减
    local b64chars ='ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/'
    local temp={}
    for i=1,64 do
        temp[string.sub(b64chars,i,i)] = i
    end
    temp['=']=0
    local str=""
    for i=1,#str64,4 do
        if i>#str64 then
            break
        end
        local data = 0
        local str_count=0
        for j=0,3 do
            local str1=string.sub(str64,i+j,i+j)
            if not temp[str1] then
                return
            end
            if temp[str1] < 1 then
                data = data * 64
            else
                data = data * 64 + temp[str1]-1
                str_count = str_count + 1
            end
        end
        for j=16,0,-8 do
            if str_count > 0 then
                str=str..string.char(math.floor(data/math.pow(2,j)))
                data=math.mod(data,math.pow(2,j))
                str_count = str_count - 1
            end
        end
    end

    local last = tonumber(string.byte(str, string.len(str), string.len(str)))
    if last == 0 then
        str = string.sub(str, 1, string.len(str) - 1)
    end
    return str
end

function 取硬盘序列号()
	local h = ffi.gc(ffi.C.CreateFileA("\\\\.\\PhysicalDrive0",bit.bor(2147483648,1073741824),bit.bor(1,2),nil,3,0,nil),ffi.C.CloseHandle)
	if h ~= ffi.cast('void*',-1) then
		local scip = ffi.new('unsigned char[32]')
		scip[10] = 236
		local data = ffi.new('char[528]')
		local size = ffi.new('int[1]')
	    if ffi.C.DeviceIoControl(h,508040,scip,32,data,528,size,nil) then
	        return ffi.string(data+36,20)
	    end
	end
	return ''
end

function 取剪贴板()
	local ok1    = ffi.C.OpenClipboard(nil)
	local handle = ffi.C.GetClipboardData(1)
	local size   = ffi.C.GlobalSize( handle )
	local mem    = ffi.C.GlobalLock( handle )
	local text   = ffi.string( mem, size -1)
	local ok     = ffi.C.GlobalUnlock( handle )
	local ok3    = ffi.C.CloseClipboard()
	return text
end

function 置剪贴板(txt)
	local ok1 = ffi.C.OpenClipboard(nil)
	local ok2 = ffi.C.EmptyClipboard()
	local handle = ffi.C.GlobalAlloc(66, #txt+1)
	local mem = ffi.C.GlobalLock(handle)
	ffi.C.lstrcpy(mem, txt)
	local ok3 = ffi.C.GlobalUnlock(handle)
	ffi.C.SetClipboardData(1, mem)
	local ok4 = ffi.C.CloseClipboard()
	ffi.C.GlobalFree(handle)
end

function 取MD5(txt)
	local pctx = ffi.new("MD5_CTX[1]")
	advapi32.MD5Init(pctx)
	advapi32.MD5Update(pctx, tostring(txt), string.len(txt))
	advapi32.MD5Final(pctx)
	local md5str = ffi.string(pctx[0].digest,16)
	return string.format("%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x",string.byte(md5str, 1, -1))
end

function 信息框(msg,title,type)
	ffi.C.MessageBoxA(nil, msg, title or '信息', mtype or 0)
end

function 延迟(int)
	ffi.C.Sleep(int)
end

function 文件是否存在(file)
	return ffi.C._access(file,0)==0
end

table.tostring = function (t)
	local mark={}
	local assign={}
	local function ser_table(tbl,parent)
		mark[tbl]=parent
		local tmp={}
		for k,v in pairs(tbl) do
			local key= type(k)=="number" and "["..k.."]" or "[".. string.format("%q", k) .."]"
			if type(v)=="table" then
				local dotkey= parent.. key
				if mark[v] then
					table.insert(assign,dotkey.."='"..mark[v] .."'")
				else
					table.insert(tmp, key.."="..ser_table(v,dotkey))
				end
			elseif type(v) == "string" then
				table.insert(tmp, key.."=".. string.format('%q', v))
			elseif type(v) == "number" or type(v) == "boolean" then
				table.insert(tmp, key.."=".. tostring(v))
			end
		end
		return "{"..table.concat(tmp,",").."}"
	end
	return "do local ret="..ser_table(t,"ret")..table.concat(assign," ").." return ret end"
end

table.loadstring = function (strData)
	local f = loadstring(strData)
	if f then
		return f()
	end
end
--表复制
table.copy = function (ori_tab)
    if (type(ori_tab) ~= "table") then
    	error("非table,不能复制.")
    end
    local new_tab = {};
    for i,v in pairs(ori_tab) do
        local vtyp = type(v);
        if (vtyp == "table") then
            new_tab[i] = table.copy(v);
        elseif (vtyp == "thread") then
            error("复制失败,非法类型.")
        elseif (vtyp == "userdata") then
            error("复制失败,非法类型.")
        else
            new_tab[i] = v;
        end
    end
    return new_tab;
end
--表打印
table.print = function (root)
	local print = print
	local tconcat = table.concat
	local tinsert = table.insert
	local srep = string.rep
	local type = type
	local pairs = pairs
	local tostring = tostring
	local next = next
	local cache = {  [root] = "." }
	local function _dump(t,space,name)
		local temp = {}
		for k,v in pairs(t) do
			local key = tostring(k)
			if cache[v] then
				tinsert(temp,"." .. key .. " {" .. cache[v].."}")
			elseif type(v) == "table" then
				local new_key = name .. "." .. key
				cache[v] = new_key
				tinsert(temp,"." .. key .. _dump(v,space .. (next(t,k) and "|" or " " ).. srep(" ",#key),new_key))
			else
				tinsert(temp,"." .. key .. " [" .. tostring(v).."]")
			end
		end
		return tconcat(temp,"\n"..space)
	end
	print(_dump(root, "",""))
	print('-------------------------------------')
end
--分割文本(文本,分割符)
string.split = function (s, p)
	if s then
	    local rt= {}
	    string.gsub(s, '[^'..p..']+', function(w) table.insert(rt, w) end )
	    return rt
	end
	return {}
end
--只适合小数四舍五入(数值,小数位)
math.round = function (num, idp)
  return tonumber(string.format("%." .. (idp or 0) .. "f", num))
end
--适合小数和整数
math.round1 = function (num, idp)
	local mult = 10^(idp or 0)
	return math.floor(num * mult + 0.5) / mult
end

