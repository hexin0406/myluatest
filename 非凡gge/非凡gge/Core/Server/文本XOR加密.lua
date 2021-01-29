文本  = "A测试文本测试文本"
function 加密文本(原文,密码)
	local str = ffi.cast("unsigned char*",原文)
	local psd = ffi.cast("unsigned char*",密码)
	local n = 0
	for i=0,#原文-1 do
		str[i] = bit.bxor(str[i],psd[n])
		n=n+1
		if n==#密码 then
			n=0
		end
	end
	return 原文
end
解密文本 = 加密文本
加密后 = 加密文本(文本,"AAAAAAABBBBBBB")
解密后 = 解密文本(加密后,"AAAAAAABBBBBBB")
print(解密后)