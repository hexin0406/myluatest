-- @作者: baidwwy
-- @邮箱:  313738139@qq.com
-- @创建时间:   2015-01-27 03:51:34
-- @最后修改来自: baidwwy
-- @Last Modified time: 2015-06-01 01:24:10

function 左移(a,b)
	return bit.lshift(a,b)
end
function 右移(a,b)
	return bit.rshift(a,b)
end
function 位取反(a,b)
	return bit.bnot(a,b)
end
function 位与(a,b)
	return bit.band(a,b)
end
function 位或(a,b)
	return bit.bor(a,b)
end
function 位异或(a,b)
	return bit.bxor(a,b)
end
function ARGB(a,r,g,b)
	return (bit.lshift(a,24) + bit.lshift(r,16) + bit.lshift(g,8) + b)
end
function RGB(r,g,b)
	return ARGB(255,r,g,b)
end

function 置DLL目录(d)
	package.cpath = package.cpath ..string.format(';%s/?.dll', d)
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

function 取两点距离(src,dst)
    return math.sqrt (math.pow(src.x-dst.x,2) + math.pow(src.y-dst.y,2))
end
function 取两点距离a(x,y,x1,y1)
    return math.sqrt (math.pow(x-x1,2) + math.pow(y-y1,2))
end
function 取两点孤度(src,dst)

	if(dst.y ==src.y and dst.x==src.x)then
		return 0
	elseif(dst.y >=src.y and dst.x<=src.x)then
		return math.pi-math.abs(math.atan((dst.y-src.y)/(dst.x-src.x)))
	elseif(dst.y <=src.y and dst.x>=src.x)then
		return math.pi2-math.abs(math.atan((dst.y-src.y)/(dst.x-src.x)))
	elseif(dst.y <=src.y and dst.x<=src.x)then
		return math.atan((dst.y-src.y)/(dst.x-src.x))+math.pi

	elseif(dst.y >=src.y and dst.x>=src.x)then
		return math.atan((dst.y-src.y)/(dst.x-src.x))
	end

end
function 取两点孤度a(x,y,x1,y1)
	if(y1 ==y and x1==x)then
		return 0
	elseif(y1 >=y and x1<=x)then
		return math.pi-math.abs(math.atan((y1-y)/(x1-x)))
	elseif(y1 <=y and x1>=x)then
		return math.pi2-math.abs(math.atan((y1-y)/(x1-x)))
	elseif(y1 <=y and x1<=x)then
		return math.atan((y1-y)/(x1-x))+math.pi

	elseif(y1 >=y and x1>=x)then
		return math.atan((y1-y)/(x1-x))
	end
end

function 取两点角度(src,dst)
	return math.deg(取两点孤度(src,dst))
end
function 取两点角度a(x,y,x1,y1)
	return math.deg(取两点孤度a (x,y,x1,y1))
end
function 取距离坐标(xy,r,a) --r距离,a孤度
	local x1,y1 = 0,0

	x1=r* math.cos(a) + xy.x
	y1=r* math.sin(a) + xy.y
	return 生成XY(math.floor(x1),math.floor(y1))
end
function 取距离坐标a(x,y,r,a) --r距离,a孤度
	local x1,y1 = 0,0

	x1=r* math.cos(a)+x
	y1=r* math.sin(a)+y
	return math.floor(x1),math.floor(y1)
end
function 取移动坐标(src,dst,r) 
	local a = 取两点孤度 (src,dst)
	return 生成XY(r* math.cos(a) +src.x ,r* math.sin(a)+src.y)
end

function 取画面坐标(x,y,w,h) --人物坐标,地图宽高
	local w2,h2 = 引擎.宽度2,引擎.高度2--窗口宽高的一半
	local rx,ry = 0,0
	if (x>w2 and x<w-w2) then
		rx = -(x-w2)
	elseif x<=w2 then
		rx=0
	elseif x>=w-w2 then
		rx=-(w-引擎.宽度)
	end

	if (y>h2 and y<h-h2) then
		ry = -(y-h2)
	elseif y<=h2 then
		ry=0
	elseif y>=h-h2 then
		ry=-(h-引擎.高度)
	end

	return 生成XY(rx,ry)
end
--@参数 显示x,显示y,半径,边数,颜色
function 画多边形(x,y,r,num,color)
	local draw = 引擎.画线
	local c = color or 0xFFFF0000
	r = r or 3
	num = num or 20
	local a = 360/num
	local px,py,px1,py1 = 0,0,0,0

	for i=0,num-1 do
		px,py = 取距离坐标a (x,y,r,math.rad(i*a))
		px1,py1 = 取距离坐标a (x,y,r,math.rad((i+1)*a))
		draw(px,py,px1,py1,c)
	end
end

function 生成XY(x,y) 
	local f ={}
	f.x = tonumber(x) or 0
	f.y = tonumber(y) or 0
	setmetatable(f,{ 
	__add = function (a,b)
		return 生成XY(a.x + b.x,a.y + b.y)
	end,
	__sub = function (a,b)
		return 生成XY(a.x - b.x,a.y - b.y)
	end
	})
	return f
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

