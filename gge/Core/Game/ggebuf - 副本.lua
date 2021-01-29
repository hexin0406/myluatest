
local ffi 	= require("ffi")
local ggebuf = class()

function ggebuf:初始化()
	self.buflen = 40960
	self.data 	= ffi.new('char[?]',self.buflen)
	self.int 	= ffi.cast('int*',self.data)
	self.prt 	= tonumber(ffi.cast("intptr_t",self.data))
	self.seq 	= 1
	self.len 	= 0
	self.lock 	= true
end
function ggebuf:打包()--0包头，1序号，2长度，3数量
	self.int[0] = 14138
	self.int[1] = self.seq
	self.i 		= 4
	self.len 	= 16
	self.seq 	= self.seq +1
	self.lock 	= false
	if self.seq >9527 then
	    self.seq = 1
	end
end
function ggebuf:添加数值(v)
	if self.len+4 <=self.buflen and not self.lock then
		self.int[self.i] = tonumber(v)
		self.i = self.i +1
		self.len = self.len +4
	else
		error('添加失败.')
	end
end
function ggebuf:添加文本(v)
	if self.len+#v <=self.buflen and not self.lock then
		ffi.copy(self.data+self.len,tostring(v))
		self.len = self.len + #v
		self.lock = true
	else
		error('添加失败.')
	end
end
function ggebuf:打包完成()
	self.int[2] = self.len -12
	self.int[3] = self.i -4
	self.lock 	= true
end
function ggebuf:添加数据( ... )
	self:打包()
	local arg = {...}
	for i,v in ipairs(arg) do
		if type(v) == 'number' then
			self:添加数值(v)
		else
			self:添加文本(v)
		end
	end
	self:打包完成()
end
--=========================解包========================================
function ggebuf:取头长()--0包头，1序号，2长度
	return 12
end
function ggebuf:校验头()--成功返回包体长度
	local len = self.int[2]
	if self.int[0] == 14138 and len >0 and len <=4084 then
		self.len = len
	    return self.len
	end
	return 0
end
function ggebuf:取数据()
	local r = {}
	local num = self.int[0]
	if num >= 0 and num*4 < self.len then
		for i=1,num do
			table.insert(r, self.int[i])
		end
		local stroff = num*4+4
		if self.len > stroff then
		    table.insert(r, ffi.string(self.data+stroff,self.len-stroff))
		end
	end
	return r
end
function ggebuf:取指针()
	return self.prt
end
function ggebuf:取长度()
	return self.len
end
return ggebuf