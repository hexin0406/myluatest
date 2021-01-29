
local ffi 	= require("ffi")
local BUF类 = class(require("ggebuf"))


function BUF类:初始化()
	--self.head = 9527
	self.key = {57,25,35,441,5585,68587,441324,3541,12256,8777,156,512,478,758,9556,4447,5586,88574,12584,25841,55452,554112,981445,15571,6471,554,25}--随意修改增加,还可以按包体长度设置不同的密码
end

function BUF类:取长度()--加密
	local prt = ffi.cast('char*',self:取指针())+self:取头长()--不加密头
	local len = self:运行父函数(1,'取长度')
	local dlen = len-self:取头长()--不加密头
	local ki = 1
	for i=0,dlen-1 do
		prt[i]=bit.bxor(prt[i],self.key[ki])
		ki=ki+1
		if ki >#self.key then ki=1 end
	end
	return len
end
--如果加密头在这修改
-- function BUF类:校验头()
-- end
function BUF类:取数据()--解密
	local prt = ffi.cast('char*',self:取指针())
	local dlen = self:运行父函数(1,'取长度')
	local ki = 1
	for i=0,dlen-1 do
		prt[i]=bit.bxor(prt[i],self.key[ki])
		ki=ki+1
		if ki >#self.key then ki=1 end
	end
	return self:运行父函数(1,'取数据')
end
return BUF类