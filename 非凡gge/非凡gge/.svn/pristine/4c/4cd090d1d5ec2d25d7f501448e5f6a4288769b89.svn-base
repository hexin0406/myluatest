--======================================================================--
--	☆ 作者：飞蛾扑火 QQ：1415559882
--======================================================================--
local 资源类_加载 = class()
local aaaa = require("gge纹理类")
local aaab = require("gge精灵类")
local aaac = require("Fmod类")
local bbbb = require("script/直读系统/动画类")
local bbbbD = require("script/直读系统/动画类D")
local yq = 引擎

function 资源类_加载:初始化()
	self.wdf = {}
	self.files = {}
end

function 资源类_加载:打开()
	self.files = {
		-- "addon.wdf",
		-- "item.wdf",
		-- "item.wd1",
		-- "smap.wdf",
		-- "goods.wdf",
		-- "shape.wdf",
		-- "shape.wd2",
		-- "shape.wd3",
		-- "shape.wd4",
		-- "shape.wd5",
		-- "shape.wd6",
		-- "shape.wd7",
		-- "shape.wd8",
		-- "shape.wd9",
		-- "shape.wd10",
		-- "shape.wd13",
		-- "shape.wd17",
		-- "shape.wda",
		-- "shape.wdb",
		-- "shape.wdc",
		"wzife.wd1",
		"wzife.wd2",
		"wzife.wd3",
		"wzife.wd4",
		"wzife.wd5",
		"wzife.wdf"
		-- "waddon.wdf",
		-- "waddon.wdf",
		-- "magic.wdf",
		-- "magic.wd1",
		-- "common/item.wdf",
		-- "common/lbc.wdf",
		-- "common/sml.wdf",
		-- "common/wdd.wdf",
		-- "common/shape.wd1",
		-- "common/shape.wda",
		-- "common/shape.wdb",
		-- "common/shape.wdc",
		-- "common/general.wdf",
		-- "common/add.wdf",
		-- "common/ski.wdf",
		-- "common/qj.wdf",
		-- "common/cb.wdf",
		-- "mapani.wdf",
		-- "mapani.wd2",
		-- "sound.wdf",
		-- "sound.wd1"
	}
	local __wdf = require("script/直读系统/WDF")
	local format = string.format
	local a = wdf配置--"WDF/"
	self.id2file = {}
	for n=1,#self.files do
		-- if files[n] == "sound.wdf" or files[n] == "sound.wd1" then
		-- 	a = "./"
		-- end
		self.wdf[self.files[n]] = __wdf(format("%s/%s",a,self.files[n]))
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
		return bbbb(self.wdf[文件 or "wzife.wdf"]:读数据(文件号 or 0xFCD58523))--987841DE
	elseif 类型 == "网易WDF动画D" then
		return bbbbD(self.wdf[文件 or "wzife.wdf"]:读数据(文件号 or 0xFCD58523))--987841DE
	elseif 类型 == "图片" then
		return aaab(aaaa(文件))
	elseif 类型 == "音乐" then
		return aaac(文件,2,nil,nil,0 or 0)
	elseif 类型 == "网易WDF动画s" then
		return bbbb(文件)
	end
end
--########################################################?自己修改?###########梦战调用开始###############################
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
--########################################################?自己修改?###########梦战调用结束###############################
return 资源类_加载