
local _字节集 = class()

--a=数值,b=空 时,申请空白
--a=数值,b=数值时,指针到字集
--a=文本时,转换
--a=表时,转换
function _字节集:初始化(a,b)
	if type(a) == 'number' then
		if b then
		else
		end
	elseif type(a) == 'string' then
	elseif type(a) == 'table' then
	elseif type(a) == 'cdata' then
	end
	local mt = getmetatable(self)
	local 原始 = mt.__index
	-- t.__eq 			= _eq
	-- t.__tostring 	= _tostring
	-- t.__concat 		= _concat

	mt.__index 	= function (t,k)
		if 原始[k] then
		    return 原始[k]
		elseif type(k) == 'number' and self.数据[k] then
			return self.数据[k]
		end
	end
end
function _字节集:取空白(长度)

end
function _字节集:取重复(数据,次数)

end
function _字节集:取长度()

end
function _字节集:取指针()

end
function _字节集:取文本(偏移)

end
function _字节集:取整数(偏移)

end
function _字节集:取短整数(偏移)

end
function _字节集:取小数(偏移)

end
function _字节集:取左边(长度)

end
function _字节集:取右边(长度)

end
function _字节集:取中间(偏移,长度)

end
function _字节集:寻找(字节集,偏移)

end
function _字节集:倒找(字节集,偏移)

end
function _字节集:替换(偏移,长度,字节集)

end
function _字节集:子替换(偏移,长度,字节集)

end
function _字节集:分割(偏移,长度,字节集)

end
return _字节集