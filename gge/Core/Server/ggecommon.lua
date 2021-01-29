-- @作者: baidwwy
-- @邮箱:  313738139@qq.com
-- @创建时间:   2015-01-27 03:51:34
-- @最后修改来自: baidwwy
-- @Last Modified time: 2016-05-27 17:17:22
require("ggefunction")
local _class 	= {}--保存父类
local ffi = require("ffi")
function class(...)
	local class_type 	= {}--创建的对象
	class_type.super 	= {...}
	class_type.初始化 	= false
	class_type.创建 	= function(...)
		local ctor = {}
			setmetatable(ctor,{ __index = _class[class_type] })--继承类属性和函数
			do--获得初始化属性
				local create;
				create = function(c,...)
					if #c.super > 0	then--继承属性
						for i,v in ipairs(c.super) do
						 	create(v,...)
						end
					end
					if c.初始化 then c.初始化(ctor,...) end
				end
				create(class_type,...)--递归所有父类
			end
			function ctor:运行父函数(id,name,...)
				if type(id) == 'number' then
					if _class[class_type.super[id]] and _class[class_type.super[id]][name] then
					    return _class[class_type.super[id]][name](self,...)
					end
				else
					if _class[id] and _class[id][name] then
					    return _class[id][name](self,...)
					end
				end
			end
		return ctor
	end
	_class[class_type] = {}--类函数实际保存
	local mt = {}
	mt.__newindex 	= _class[class_type]
	mt.__call		= function (t,...)
		return t.创建(...)
	end
	setmetatable(class_type,mt)
	if #class_type.super > 0 then--继承函数
		setmetatable(_class[class_type],{__index = function (t,k)
		    for i,v in ipairs(class_type.super) do
		        local ret = _class[v][k]
		        if ret then
		            return ret
		        end
		    end
		end})
	end
	return class_type
end
--=============================================================================================
function classex(...)
	local class_type 	= {}--创建的对象
	class_type.super 	= {...}
	class_type.初始化 	= false
	class_type.销毁 		= false
	class_type.创建 	= function(...)
		local ctor = {}--对像真身
			setmetatable(ctor,{ __index = _class[class_type] })--继承类属性和函数
			do--获得初始化属性
				local create;
				create = function(c,...)
					if #c.super > 0	then--继承属性
						for i,v in ipairs(c.super) do
						 	create(v,...)
						end
					end
					if c.初始化 then c.初始化(ctor,...) end
				end
				create(class_type,...)--递归所有父类
			end
			function ctor:运行父函数(id,name,...)
				if _class[class_type.super[id]] and _class[class_type.super[id]][name] then
				    return _class[class_type.super[id]][name](self,...)
				end
			end
		local obj 	= {}--用于检测对象销毁
			obj.__gc = ffi.gc(ffi.new('char[1]'),function ()
				local destroy
				destroy = function(c)
					if #c.super > 0	then
						for i,v in ipairs(c.super) do
						 	destroy(v)
						end
					end
					if c.销毁 then c.销毁(ctor) end
				end
				destroy(class_type)--递归所有父类
				ctor = nil
			end)
		local cmt 	= getmetatable(ctor)--ctormetatable
		local omt 	= {}				--objmetatable
			for k,v in pairs(cmt) do--获得用户修改的mt
				omt[k] = v
			end
			omt.__index 	= ctor
			omt.__newindex 	= ctor
			setmetatable(obj,omt)
		return obj
	end
	_class[class_type] = {}--类函数实际保存
	local mt = {}
	mt.__newindex 	= _class[class_type]
	mt.__call		= function (t,...)
		return t.创建(...)
	end
	-- mt.__tostring 	= function ()
	-- 	return "ggeclass"
	-- end
	setmetatable(class_type,mt)
	if #class_type.super > 0 then--继承函数
		setmetatable(_class[class_type],{__index = function (t,k)
		    for i,v in ipairs(class_type.super) do
		        local ret = _class[v][k]
		        if ret then
		            return ret
		        end
		    end
		end})
	end
	return class_type
end


__颜色 = {
	深蓝 = 1,
	深绿 = 2,
	深青 = 3,
	深红 = 4,
	深紫 = 5,
	深黄 = 6,
	深白 = 7,
	深灰 = 8,

	蓝色 = 9,
	绿色 = 10,
	青色 = 11,
	红色 = 12,
	紫色 = 13,
	黄色 = 14,
	白色 = 15
}
__SO ={--错误类型
	'HP_SO_UNKNOWN'	,	-- 未知
	'HP_SO_ACCEPT'	,	-- 请求
	'HP_SO_CONNECT'	,	-- 连接
	'HP_SO_SEND'	,	-- 发送
	'HP_SO_RECEIVE'	,	-- 数据
	[100] = '非法封包1',--普通
	[101] = '非法封包2',--压缩
	[103] = '非法封包3',--指针
	[104] = '非法封包4',--GGE
	[105] = '非法封包5',--备用
	[106] = '数据丢失',
	[107] = '数据错误',
	[108] = '序号错误'
}
