-- @作者: baidwwy
-- @邮箱:  313738139@qq.com
-- @创建时间:   2016-06-09 15:01:50
-- @最后修改来自: baidwwy
-- @Last Modified time: 2016-09-10 17:30:03

local ggeimg = class()

local ffi = require("ffi")
ffi.cdef[[
	//文件是否存在
	int _access(const char*, int);
	]]
local function 文件是否存在(file)
	return ffi.C._access(file,0)==0
end

local Npkcache = _Npkcache
local Dnfpath = _Dnfpath

local function 取NPK全称(imgname,取目录下)
	local _,_,t = (imgname):find("(.+)/")
	local name = Dnfpath..[[\ImagePacks2\]]..string.gsub(t,"/","_")..".NPK"

	if 文件是否存在(name) and (not 取目录下) then
	    return name
	else
		return "Data/"..string.gsub(t,"/","_")..".NPK"
	end
end

function ggeimg:初始化(imgname,npkname,v)
	--self.img = imgname
	if npkname then
	    if Npkcache[npkname] then
	        self.npk = npkname
	    else
	        require("ggednf/npk")(npkname)
	        if Npkcache[npkname] then
		        self.npk = npkname
		    end
	    end
	else
		local npkname = 取NPK全称(imgname)
		require("ggednf/npk")(npkname)
		if Npkcache[npkname] then
	        self.npk = npkname
	    end
	end


	if self.npk then
	    if not Npkcache[self.npk].imgdata[imgname] then
	        if Npkcache[self.npk]:openimg(imgname) then
	            self.img = imgname
	        else
	        	if not v then
	        		local x = require("ggednf/img")(imgname,取NPK全称(imgname,true),true)
	        	    self.npk = x.npk
	        	    self.img = x.img
	        	end
	        end
	    else
	    	self.img = imgname
	    end
	end
	--print(self.npk,self.img)
end
function ggeimg:取纹理(id)
	return Npkcache[self.npk]:取纹理(self.img,id)
end
function ggeimg:取精灵(id)
	return Npkcache[self.npk]:取精灵(self.img,id)
end
function ggeimg:取信息(id)
	return Npkcache[self.npk]:取信息(self.img,id)
end
function ggeimg:取纹理信息(id)
	return Npkcache[self.npk]:取纹理信息(self.img,id)
end
function ggeimg:取偏移(id)
	return Npkcache[self.npk]:取偏移(self.img,id)
end
function ggeimg:取帧数()
	return Npkcache[self.npk]:取img帧数(self.img)
end
return ggeimg