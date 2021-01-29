-- @作者: baidwwy
-- @邮箱:  313738139@qq.com
-- @创建时间:   2016-06-09 15:01:50
-- @最后修改来自: baidwwy
-- @Last Modified time: 2017-07-07 23:54:15
local ffi = require("ffi")
ffi.cdef[[
	typedef struct
	{
		uint32_t ofs;
		uint32_t size;
		uint8_t name[256];
	}npklist;
	typedef struct
	{
		uint32_t type;
		uint32_t zlib;
		uint32_t w;
		uint32_t h;
		uint32_t size;
		uint32_t x;
		uint32_t y;
		uint32_t allw;
		uint32_t allh;
		uint32_t ofs;
	}imginf;
]]

local b64dds = [[RERTIHwAAAAHEAoAWAIAAB4CAABA2RMAAAAAAAoAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAACAAAABBAAAAAAAAACAAAAAAAP8AAP8AAP8AAAAAAAD/CBBAAAAAAAAAAAAAAAAAAAAAAAA=]]
local dds = require("字节集类")(128)
do
	local len = __gge.debase64(dds:取地址(),128,b64dds,#b64dds)
end

local 密码 = require("字节集类")("puchikon@neople dungeon and fighter DNFDNFDNFDNFDNFDNFDNFDNFDNFDNFDNFDNFDNFDNFDNFDNFDNFDNFDNFDNFDNFDNFDNFDNFDNFDNFDNFDNFDNFDNFDNFDNFDNFDNFDNFDNFDNFDNFDNFDNFDNFDNFDNFDNFDNFDNFDNFDNFDNFDNFDNFDNFDNFDNFDNFDNFDNFDNFDNFDNFDNFDNFDNFDNFDNFDNFDNFDNFDNFDNFDNFDNFDNF\0")
local function _解密(数据,密码)
	for i=1,256 do
		数据[i] = bit.bxor(数据[i],密码[i])
	end
	return 数据:取文本(1)
end

local ggenpk = class()

local Npkcache = _Npkcache
local FMOD类 = FMOD类

local ddscache = require("字节集类")(2000000)
local unmemcache = require("字节集类")(2000000)
local 颜色表 = require("字节集类")(1024)
local 颜色数据 = require("字节集类")(500000)
ffi.copy(ddscache:取地址(),dds:取地址(),128)

--print("我申请了内存")

function ggenpk:初始化(路径,内存)
	if not Npkcache[路径] then
		self.file = 路径
	    self.npkfile 	= require("文件类")(路径)
		self.内存大小 = 内存 or 2000000
		if self.npkfile:读入文本(16) == "NeoplePack_Bill" then
		    local 文件数 = self.npkfile:读入整数()
		    self._list = {}
		    for i=1,文件数 do
		    	local list = self.npkfile:读入数据(ffi.new("npklist"))
		    	self._list[i] = {}
		    	self._list[i].ofs = list.ofs
		    	self._list[i].size = list.size
		    	self._list[i].name = _解密(require("字节集类")(list.name,256),密码)
		    	--print(self._list[i].ofs,self._list[i].name)
		    end
		    --unmemcache 	= require("字节集类")(self.内存大小)

			--ddscache = require("字节集类")(self.内存大小)
			--ffi.copy(ddscache:取地址(),dds:取地址(),128)

		    self.imgdata = {}
		    self.imgcache = {}
		    self.infocache = {}
		    self.isok = true
		    Npkcache[路径] = self
		end
	end
end

function ggenpk:openimg(img,ret)
	if not self.imgdata[img] then
	    for i=1,#self._list do
			if img == self._list[i].name then
				if not self.imgcache[img] then
				    self.imgcache[img] = {}
				    self.infocache[img] = {}
				end
				self.imgdata[img] = {}
			    self.npkfile:移动读写位置(self._list[i].ofs)
			    local imagetype = self.npkfile:读入文本(16)
			    if imagetype=="Neople Image Fil" then imagetype = true else imagetype = nil end
			    self.npkfile:移动读写位置(8,1)
			    self.imgdata[img].版本 = self.npkfile:读入整数()
			    self.imgdata[img].num = self.npkfile:读入整数()
			    if self.imgdata[img].版本==4 then
			    	self.imgdata[img].颜色个数 = self.npkfile:读入整数()
			        self.imgdata[img].颜色表 = require("字节集类")(self.imgdata[img].颜色个数*4)

			        self.npkfile:读入数据(颜色表:取地址(),self.imgdata[img].颜色个数*4)
			        ffi.copy(self.imgdata[img].颜色表:取地址(),颜色表:取地址(),self.imgdata[img].颜色个数*4)
			    elseif self.imgdata[img].版本 > 4 then
			    	print('遇到新版本资源，请截图发给作者->"'..self.imgdata[img].版本.."，"..self.file..'，'..img)
			    end
			    --print(self.imgdata[img].num)
			    for i=1,self.imgdata[img].num do
			    	local imgtype = self.npkfile:读入整数()
			    	if imgtype == 17 then
			    		local link = self.npkfile:读入整数()
			    	    --self.imgdata[img][i] = self.imgdata[img][link+1]
			    	    self.imgdata[img][i] = link+1
			    	else
			    	    self.npkfile:移动读写位置(-4,1)
			    	    self.imgdata[img][i] = self.npkfile:读入数据(ffi.new("imginf"))
			    	    --print(i,self.imgdata[img][i].zlib,self.imgdata[img][i].size)
			    	    if self.imgdata[img][i].zlib == 5 then
			    	        if imgtype == 14 or imgtype == 15 then
			    	            if self.imgdata[img][i].size ~= 2 then
			    	            	if self.imgdata[img].版本==2 then
			    	            	    self.imgdata[img][i].size = self.imgdata[img][i].size / 2
			    	            	end
			    	            end
			    	        end
			    	    end
			    	    self.npkfile:移动读写位置(-4,1)
			    	    if imagetype then
			    	        self.imgdata[img][i].ofs = self.npkfile:取读写位置()
			    	        self.npkfile:移动读写位置(self.imgdata[img][i].size,1)
			    	    end
			    	end
			    	--print(self.imgdata[img][i].zlib)
			    end
			    if not imagetype then
				    for i=1,self.imgdata[img].num do
				    	--print(type(self.imgdata[img][i]))
				    	if type(self.imgdata[img][i]) ~= "number" then
				    	    self.imgdata[img][i].ofs = self.npkfile:取读写位置()
				    	    self.npkfile:移动读写位置(self.imgdata[img][i].size,1)
				    	end

				    end
			    end
			    if ret then
			        return require("ggednf/img")(img,self.file)
			    else
			    	return true
			    end
			end
		end
		return false
	else
		if ret then
	        return require("ggednf/img")(img,self.file)
	    else
	    	return true
	    end
	end
end
function ggenpk:取纹理(img,id)
	--print(img,id)
	if not self.imgcache[img] then
	    if not self:openimg(img) then
	        print("打开img失败",self.file,img,id)
	    	return require("gge纹理类")():空白纹理(15,15):置颜色(0xffff0000)
	    end
	end
	if self.imgcache[img][id] then
	    return self.imgcache[img][id]
	end
	if self.isok and id>0 and id <= self.imgdata[img].num then
		if type(self.imgdata[img][id]) == "number" then
			self.imgdata[img][id] = self.imgdata[img][self.imgdata[img][id]]
			if self.imgcache[img][id] then
			    return self.imgcache[img][id]
			end
		end
		ddscache:写整数(13,self.imgdata[img][id].h)--写高宽
		ddscache:写整数(17,self.imgdata[img][id].w)
		ddscache[29]=0 --MipMapCount

		if self.imgdata[img][id].h == 1 and self.imgdata[img][id].w == 1 then
		    self.imgcache[img][id] = require("gge纹理类")():空白纹理(1,1)
			return self.imgcache[img][id]
		end

		self.npkfile:移动读写位置(self.imgdata[img][id].ofs)

		self.npkfile:读入数据(unmemcache:取地址(),self.imgdata[img][id].size)
		--print(id,self.imgdata[img][id].ofs)
		if self.imgdata[img].颜色个数 and self.imgdata[img][id].zlib == 6 then --有压缩且有颜色表  这里可能有锅
		    --print(self.imgdata[img][id].type,self.imgdata[img].颜色个数)
		    if self.imgdata[img][id].type == 14 then --1555
		    	ddscache:写整数(21,self.imgdata[img][id].w*self.imgdata[img][id].h*4)
				ddscache:写整数(89,32)
				ddscache:写整数(93,16711680)
				ddscache:写整数(97,65280)
				ddscache:写整数(101,255)
				ddscache:写整数(105,4278190080)
				local imglen = self.imgdata[img][id].w*self.imgdata[img][id].h
				assert(self.内存大小 > imglen+128, "内存不足!")
				if self.imgdata[img][id].zlib == 6 then
					__gge.uncompress(颜色数据:取地址(),self.内存大小,unmemcache:取地址(),imglen)
				elseif self.imgdata[img][id].zlib == 5 then
					--print(id,self.imgdata[img][id].ofs,self.imgdata[img][id].size)
				    ffi.copy(颜色数据:取地址(),unmemcache:取地址(),imglen)
				    print(imglen)
				end

				for i=1,self.imgdata[img][id].w*self.imgdata[img][id].h do
					local 颜色索引 = 颜色数据[i]
					ddscache.bin[(i-1)*4+128] = self.imgdata[img].颜色表.bin[颜色索引*4+2]
					ddscache.bin[(i-1)*4+128+1] =self.imgdata[img].颜色表.bin[颜色索引*4+1]
					ddscache.bin[(i-1)*4+128+2] =self.imgdata[img].颜色表.bin[颜色索引*4]
					ddscache.bin[(i-1)*4+128+3] =self.imgdata[img].颜色表.bin[颜色索引*4+3]
				end

				self.imgcache[img][id] = require("gge纹理类")(ddscache:取地址(),imglen*4+128)
				--ddscache:保存到文件("dds.dds",1,imglen+128)
				return self.imgcache[img][id]

		    elseif self.imgdata[img][id].type == 15 then --4444
		    	assert(false, "新格式 类型15")
		    elseif self.imgdata[img][id].type == 16 then --8888
		    	assert(false, "新格式 类型16")
		    end
		else
			if self.imgdata[img][id].type == 14 then --1555
				ddscache:写整数(21,self.imgdata[img][id].w*self.imgdata[img][id].h*2) --PitchOrLinearSize
				ddscache:写整数(89,16) --RGBBitCount
				ddscache:写整数(93,31744) --RBitMask
				ddscache:写整数(97,992) --GBitMask
				ddscache:写整数(101,31) --BBitMask
				ddscache:写整数(105,32768) --ABitMask
				local imglen = self.imgdata[img][id].w*self.imgdata[img][id].h*2
				assert(self.内存大小 > imglen+128, "内存不足!")
			    if self.imgdata[img][id].zlib == 6 then
			    	assert(__gge.uncompress(ddscache:取地址()+128,self.内存大小,unmemcache:取地址(),imglen)==imglen, "解压失败!")
			   	elseif self.imgdata[img][id].zlib == 5 then
			   		ffi.copy(ddscache:取地址()+128,unmemcache:取地址(),imglen)
			    end
			    self.imgcache[img][id] = require("gge纹理类")(ddscache:取地址(),imglen+128)
				return self.imgcache[img][id]
			elseif self.imgdata[img][id].type == 15 then --4444
				ddscache:写整数(21,self.imgdata[img][id].w*self.imgdata[img][id].h*2)
				ddscache:写整数(89,16)
				ddscache:写整数(93,3840)
				ddscache:写整数(97,240)
				ddscache:写整数(101,15)
				ddscache:写整数(105,61440)
				local imglen = self.imgdata[img][id].w*self.imgdata[img][id].h*2
			    assert(self.内存大小 > imglen+128, "内存不足!")
			    if self.imgdata[img][id].zlib == 6 then
			    	assert(__gge.uncompress(ddscache:取地址()+128,self.内存大小,unmemcache:取地址(),imglen)==imglen, "解压失败!")
			    elseif self.imgdata[img][id].zlib == 5 then
			   		ffi.copy(ddscache:取地址()+128,unmemcache:取地址(),imglen)
			    end
			    self.imgcache[img][id] = require("gge纹理类")(ddscache:取地址(),imglen+128)
				return self.imgcache[img][id]
			elseif self.imgdata[img][id].type == 16 then --8888
				ddscache:写整数(21,self.imgdata[img][id].w*self.imgdata[img][id].h*4)
				ddscache:写整数(89,32)
				ddscache:写整数(93,16711680)
				ddscache:写整数(97,65280)
				ddscache:写整数(101,255)
				ddscache:写整数(105,4278190080)
				local imglen = self.imgdata[img][id].w*self.imgdata[img][id].h*4
				assert(self.内存大小 > imglen+128, "内存不足!")
				if self.imgdata[img][id].zlib == 6 then
					assert(__gge.uncompress(ddscache:取地址()+128,self.内存大小,unmemcache:取地址(),imglen)==imglen, "解压失败!")
				elseif self.imgdata[img][id].zlib == 5 then
				    ffi.copy(ddscache:取地址()+128,unmemcache:取地址(),imglene)
				end
				self.imgcache[img][id] = require("gge纹理类")(ddscache:取地址(),imglen+128)
				--ddscache:保存到文件("dds.dds",1,imglen+128)
				return self.imgcache[img][id]
			end
		end
	end
end
function ggenpk:取img帧数(img)
	if not self.imgcache[img] then
	    self:openimg(img)
	end
	return self.imgdata[img].num
end
function ggenpk:取偏移(img,id)--先取纹理才行
	if self.infocache[img] then
	    local r = {}
		if self.infocache[img][id] then
			setmetatable(r, {__index=self.infocache[img][id]})
		    return r
		end
		self.infocache[img][id] = {
			w=self.imgdata[img][id].w,
			h=self.imgdata[img][id].h,
			x=self.imgdata[img][id].x,
			y=self.imgdata[img][id].y
		}
		setmetatable(r, {__index=self.infocache[img][id]})
		return r
	else
		return {
			x = 0,
			y = 0,
			w = 15,
			h = 15
		}
	end
end
function ggenpk:取精灵(img,id)
	return require("gge精灵类")(self:取纹理(img,id))
end
function ggenpk:取信息(img,id)
	local s = self:取精灵(img,id)
	local t = self:取偏移(img,id)
	t.精灵 = s
	return t
end
function ggenpk:取纹理信息(img,id)
	local s = self:取纹理(img,id)
	local t = self:取偏移(img,id)
	t.纹理 = s
	return t
end
function ggenpk:openogg(name)
	if self.isok then
		for i=1,#self._list do
			if name == self._list[i].name then
				return FMOD类.创建(self.file,2,self._list[i].ofs,self._list[i].size)
			end
		end
	end
end
-- function ggenpk:释放()
-- 	self.imgdata = nil
-- 	for k,v in pairs(self.imgcache) do
-- 		--print(k,v)
-- 		for i,m in pairs(self.imgcache[k]) do
-- 			m:释放()
-- 		end
-- 	end
-- 	self.infocache = nil
-- end
return ggenpk