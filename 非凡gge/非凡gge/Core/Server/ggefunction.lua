-- @作者: baidwwy
-- @邮箱:  313738139@qq.com
-- @创建时间:   2015-01-27 03:51:34
-- @最后修改来自: baidwwy
-- @Last Modified time: 2016-05-21 22:39:25
table.tostring = function (t)
	if t then
		local mark={}
		local assign={}
		local function ser_table(tbl,parent)
			mark[tbl]=parent
			local tmp={}
			for k,v in pairs(tbl) do
				local key= type(k)=="number" and string.format("[%s]", k) or k--string.format("[%q]", k)
				if type(v)=="table" then
					local dotkey= parent.. key
					if mark[v] then
						table.insert(assign,string.format("%s='%s'", dotkey,mark[v]))
					else
						table.insert(tmp, string.format("%s=%s", key,ser_table(v,dotkey)))
					end
				elseif type(v) == "string" then
					table.insert(tmp, string.format("%s=%q", key,v))
				elseif type(v) == "number" or type(v) == "boolean" then
					table.insert(tmp, string.format("%s=%s", key,v))
				end
			end
			return string.format("{%s}", table.concat(tmp,","))
		end
		return string.format("do local ret=%s%s return ret end", ser_table(t,"ret"),table.concat(assign," "))
	end
	--return "do local ret={} return ret end"
end
-- table.tostring = function (t)
-- 	if t then
-- 		local mark={}
-- 		local assign={}
-- 		local function ser_table(tbl,parent)
-- 			mark[tbl]=parent
-- 			local tmp={}
-- 			for k,v in pairs(tbl) do
-- 				local key= type(k)=="number" and "["..k.."]" or "[".. string.format("%q", k) .."]"
-- 				if type(v)=="table" then
-- 					local dotkey= parent.. key
-- 					if mark[v] then
-- 						table.insert(assign,dotkey.."='"..mark[v] .."'")
-- 					else
-- 						table.insert(tmp, key.."="..ser_table(v,dotkey))
-- 					end
-- 				elseif type(v) == "string" then
-- 					table.insert(tmp, key.."=".. string.format('%q', v))
-- 				elseif type(v) == "number" or type(v) == "boolean" then
-- 					table.insert(tmp, key.."=".. tostring(v))
-- 				end
-- 			end
-- 			return "{"..table.concat(tmp,",").."}"
-- 		end
-- 		return "do local ret="..ser_table(t,"ret")..table.concat(assign," ").." return ret end"
-- 	end
-- 	--return "do local ret={} return ret end"
-- end

table.loadstring = function (t)
	if t then
		local f = loadstring(t)
		if f then
			setfenv(f, {})
			return f()
		end
	end
end

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
end
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