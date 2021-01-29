-- @作者: baidwwy
-- @邮箱:  313738139@qq.com
-- @创建时间:   2015-01-27 03:51:34
-- @最后修改来自: baidwwy
-- @Last Modified time: 2016-05-24 09:41:11
local bit = require("bit")
-- function 左移(a,b)
-- 	return bit.lshift(a,b)
-- end
-- function 右移(a,b)
-- 	return bit.rshift(a,b)
-- end
-- function 位取反(a,b)
-- 	return bit.bnot(a,b)
-- end
-- function 位与(a,b)
-- 	return bit.band(a,b)
-- end
-- function 位或(a,b)
-- 	return bit.bor(a,b)
-- end
-- function 位异或(a,b)
-- 	return bit.bxor(a,b)
-- end
function ARGB(a,r,g,b)
	return (bit.lshift(a,24) + bit.lshift(r,16) + bit.lshift(g,8) + b)
end
function RGB(r,g,b)
	return ARGB(255,r,g,b)
end
--lua51,Galaxy2d除外
function 置库目录(d)
	package.cpath = package.cpath ..string.format(';%s/?.dll', d)
end
--按分割每个字,添加到表
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

--表序列化
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
--载入序列化表
table.loadstring = function (t)
	if t then
		local f = loadstring(t)
		if f then
			setfenv(f, {})
			return f()
		end
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
	if root then
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
end
--分割文本(文本,分割符)
string.split = function (str, delimiter)
	if str  then
	    local result = {}
	    str = str..delimiter
	    delimiter = "(.-)"..delimiter
	    for match in str:gmatch(delimiter) do
	        table.insert(result, match)
	    end
	    return result
	end
	return {}
end
-- string.split = function (s, p)
-- 	if s then
-- 	    local rt= {}
-- 	    string.gsub(s, '[^'..p..']+', function(w) table.insert(rt, w) end )
-- 	    return rt
-- 	end
-- 	return {}
-- end
--只适合小数四舍五入(数值,小数位)
math.round = function (num, idp)
  return tonumber(string.format("%." .. (idp or 0) .. "f", num))
end
--适合小数和整数
math.iround = function (num, idp)
	local mult = 10^(idp or 0)
	return math.floor(num * mult + 0.5) / mult
end

