
local 资源类_加载 = class()
local aaaa = require("gge纹理类")
local aaab = require("gge精灵类")
local aaac = require("Fmod类")
local bbbb = require("Script/资源类/动画类")
local yq = 引擎

function 资源类_加载:初始化()
	self.wdf = {}
	self.记录={}
end

function 资源类_加载:打开()
	self.files = {
		"addon.wdf",
		"atom.wdf",
		"item.wdf",
		"item.wd1",
		-- "迭代.wd1",
		"jy.wdf",
		"WP1.dll",
		-- "gsbu.dll",
		"smap.wdf",
		"goods.wdf",
		"shape.wdf",
		"shape.wd5",
		"shape.dll",
		"wzife.wd1",
		"wzife.wd2",
		"wzife.wd3",
		"wzife.wd4",
		"wzife.wd5",
		"wzife.wd6",
		"wzife.wdf",
		"waddon.wdf",
		"waddon.wdf",
		"magic.wdf",
		"magic.wd1",
		"common/item.wdf",
		"common/lbc.wdf",
		"common/sml.wdf",
		"common/wdd.wdf",
		"common/shape.wd1",
		"common/shape.wda",
		"common/shape.wdb",
		"common/shape.wdc",
		"common/general.wdf",
		"common/add.wdf",
		"common/ski.wdf",
		"common/qj.wdf",
		"mapani.wdf",
		"mapani.wd2",
		"sound.wdf",
		"misc.wdf",
		"sound.wd1",
		"commonm/effect.wd1",
		"commonm/magic.wd4",
		"commonm/resource.wd2",
		"commonm/resource.wd3",
		"新增技能.wdf",
	}
	local __wdf = require("script/资源类/WDF")
	local format = string.format
	local a = wdf配置--"WDF/"
	self.id2file = {}
	for n=1,#self.files do
		-- if files[n] == "sound.wdf" or files[n] == "sound.wd1" then
		-- 	a = "./"
		-- end
		self.wdf[self.files[n]] = __wdf(format("%s/%s",a,self.files[n]))
		self.记录[self.files[n]]={}
	end
	__wdf = require("script/资源类/锦衣wdf")

	local fileso = {
		"shape2.npk",
		"shape1.npk",
		"shape0.npk"
	}

	for n=1,#fileso do
		self.wdf[fileso[n]] = __wdf(format("%s/%s",a,fileso[n]))
	end
end

function 资源类_加载:取偏移(file,id)
	return self.wdf[file]:读偏移(id)
end

function 资源类_加载:读数据(file,id)
	return self.wdf[file]:读数据(id)
end

function 资源类_加载:载入(文件,类型,文件号,音量,附加,fs,fs1)
	if 文件==nil or 文件=="" then
	    return self:载入未知WDF(nil,类型,文件号)
	end
	if 类型 == "网易WDF动画" then
		if 文件==nil then
		    print("注意WDF载入没有[ NIL值 ]文件")
		elseif 文件~=nil and self.wdf[文件]==nil then
		    print("注意WDF载入没有[ "..文件.." ]文件")
		elseif 文件~=nil and self.wdf[文件]~=nil and self.wdf[文件]:读数据(文件号)==nil then
			print(文件,文件号)
			print("注意WDF载入[ "..文件.." ]文件没有[ "..文件号.." ]")
		end
		return bbbb(self.wdf[文件 or "wzife.wdf"]:读数据(文件号 or 0xFCD58523))
	elseif 类型 == "图片" then
		return aaab(aaaa(文件))
	elseif 类型 == "音乐" then
		return aaac(文件,2,nil,nil,0 or 0)
	elseif 类型 == "网易WDF动画s" then
		return bbbb(文件)
	elseif 类型 == "网易锦衣动画" then
		return WAS动画类动画(self.wdf[文件]:取文件(文件号 or 0xEC4818D8))
	elseif 类型 == "网易假人动画" then
		if self.记录[文件][文件号] == nil then
	 		local 资源=bbbb(self.wdf[文件 or "wzife.wdf"]:读数据(文件号 or 0xFF997CF6))
			self.记录[文件][文件号] = DeepCopy(资源.was)
			return 资源
		else
		    return bbbb(nil,nil,DeepCopy(self.记录[文件][文件号]),2)
		end
	end
end

function DeepCopy(object)
    local lookup_table = {}
    local function _copy(object)
        if type(object) ~= "table" then
            return object
        elseif lookup_table[object] then
            return lookup_table[object]
        end
        local new_table = {}
        lookup_table[object] = new_table
        for key, value in pairs(object) do
            new_table[_copy(key)] = _copy(value)
        end
        return setmetatable(new_table, getmetatable(object))
    end
    return _copy(object)
end


function 资源类_加载:载入未知WDF(file1,类型,id) -- String 例如 0x00FF 非法, 改为 0xFF 正确   资源:载入未知WDF(nil,"网易WDF动画","0xBECEA063")
	if id and tonumber(id) > 0 and file1 == nil then
		for i,o in pairs(self.files)  do
			if 读配置(wdf配置.."/ini/"..o..".ini","Resource",id)=="1" then
				local file = o
				if not self.wdf[file] then
					self:打开(file)
				end
				self.id2file[id] = file
				return self:载入(file,类型,到整数(id))
			end
		end
	end
	return self:载入("wzife.wdf",类型,0xFCD58523)
end

return 资源类_加载