--======================================================================--
-- @作者: GGE研究群: 342119466
-- @创建时间:   2018-03-03 02:34:19
-- @Last Modified time: 2020-09-12 21:04:15
--======================================================================--
local 系统类_时辰 = class()

local floor = math.floor
local ARGB = ARGB
local require = require
local 矩阵 = require("gge包围盒")(0,0,115,95)
local tp
local zt
local format = string.format
local keytq = 引擎.按键弹起

function 系统类_时辰:初始化(根)
	self.序列=1
	local 按钮 = 根._按钮
	local 自适应 = 根._自适应
	local 资源 = 根.资源
	self.背景 = 资源:载入('wzife.wd4',"网易WDF动画",0xF6A5602D)
	self.白昼 = 资源:载入('wzife.wd4',"网易WDF动画",0xAA23B98F)
	self.黑昼 = 资源:载入('wzife.wd4',"网易WDF动画",0x82DB3814)
	self.小人跑步 = 资源:载入('wzife.wdf',"网易WDF动画",0xAC307575)
	self.小人走路 = 资源:载入('wzife.wdf',"网易WDF动画",0xC7BEBF45)
	self.排行 = 按钮.创建(资源:载入('wzife.wd4',"网易WDF动画",0x30712485),0,0,4)
	self.收缩 = 按钮.创建(资源:载入('wzife.wd4',"网易WDF动画",0x6C566DEA),0,0,4)
	self.缩放 = 按钮.创建(资源:载入('wzife.wd4',"网易WDF动画",0xD5E6B287),0,0,4)
	self.世界 = 按钮.创建(资源:载入('wzife.wd4',"网易WDF动画",0xCA5242C2),0,0,4)
	self.日历 = 按钮.创建(资源:载入('wzife.wd4',"网易WDF动画",0xAD514E92),0,0,4)
	self.查询 = 按钮.创建(资源:载入('wzife.wd4',"网易WDF动画",0x6ECBCED7),0,0,4)
	self.VIP = 按钮.创建(资源:载入('wzife.wd5',"网易WDF动画",0x01000073),0,0,4)

	self.蓝宝 = 按钮.创建(资源:载入('wzife.wd6',"网易WDF动画",0x99998888),0,0,4,true)
	self.小表 = 按钮.创建(资源:载入('wzife.wd6',"网易WDF动画",0x99998889),0,0,4,true)
	self.红博 = 按钮.创建(资源:载入('wzife.wd6',"网易WDF动画",0x99998891),0,0,4,true)
	self.珠子 = 按钮.创建(资源:载入('wzife.wd6',"网易WDF动画",0x99998892),0,0,4,true)
	self.小猪 = 按钮.创建(资源:载入('wzife.wd6',"网易WDF动画",0x99998890),0,0,4,true)

	self.地图 = nil
	self.偏移 = nil
	self.计时 = 0
	self.计次 = 150
	self.偏移坐标 = 0
	self.偏移时间 = 0
	tp = 根
	zt = tp.字体表.描边字体
	sj = tp.字体表.时间字体
	local g = {0xB9FD3C98,0xFE026DC3,0xCDB4C444,0xDFE4105D,0xA66B9C4,0x5A94EB4C,0xD2A6E5EC,0xEEADB7F5,0x399E1F40,0x6FFBDFD8,0xDEBA9F52,0x49D3DE80}
	self.时辰={}
	for n=1,12 do
      self.时辰[n]=资源:载入('wzife.wd4',"网易WDF动画",g[n])
	end
end

function 系统类_时辰:刷新()
	self.地图 = 取地图名称(tp.当前地图)
	if tp.剧情开关.副本 ~= false then
		if tp.剧情开关.副本[1] == "乌鸡国" then
			if self.地图 == "狮驼岭" then
				self.地图 = "废弃的御花园"
			elseif self.地图 == "朱紫国皇宫" then
				self.地图 = "乌鸡国皇宫厢房"
			end
		elseif tp.剧情开关.副本[1] == "车迟斗法" then
			if self.地图 == "小雷音寺" then
				self.地图 = "三清道观"
			elseif self.地图 == "灵台宫" then
				self.地图 = "道观大殿"
			elseif self.地图 == "天宫" then
				self.地图 = "九霄云外"
			end
		elseif tp.剧情开关.副本[1] == "水陆大会" then
			if self.地图 == "化生寺" then
				self.地图 = "水陆道场"
			elseif self.地图 == "太岁府" then
				self.地图 = "妖魔巢穴"
			end
		elseif tp.剧情开关.副本[1] == "通天河" then
			if self.地图 == "长寿村" then
				self.地图 = "陈家庄"
			end
		elseif tp.剧情开关.副本[1] == "黑风山" then
			if self.地图 == "解阳山" then
				self.地图 = "双叉岭"
			end
		elseif tp.剧情开关.副本[1] == "秘境降妖" then
			if self.地图 == "比武场" then
				self.地图 = "秘境0层"
			end
		end
	end
	self.偏移 = 60 - #self.地图*3.72
end

function 系统类_时辰:显示(dt,x,y)
	if 矩阵:检查点(x,y) then
		tp.选中UI = true
	end
	self.背景:显示(0,0 + self.偏移坐标)
	if VIP定制 then
		self.VIP:更新(x,y)
		self.VIP:显示(10,70+self.偏移坐标)
	end
	self.收缩:更新(x,y)
	self.收缩:显示(10,49 + self.偏移坐标)
	if self.收缩:事件判断() then
		if self.偏移坐标 == 0 then
			self.偏移坐标 = -49
			self.偏移时间 = -6.5
			矩阵:置坐标(0,-49)
		else
		    self.偏移坐标 = 0
		    self.偏移时间 = 0
		    矩阵:置坐标(0,0)
		end
	end

	if self.偏移坐标 == 0 then
		self.排行:更新(x,y)
		self.世界:更新(x,y)
		self.日历:更新(x,y)
		self.查询:更新(x,y)
		self.蓝宝:更新(x,y)
		self.小表:更新(x,y)
		--self.红博:更新(x,y)
		--self.珠子:更新(x,y)
		self.小猪:更新(x,y)
		if self.日历:事件判断() and not tp.战斗中 then
			发送数据(40)
		end
		self.世界:显示(30,42 + self.偏移坐标)
		self.查询:显示(65,42 + self.偏移坐标)
		self.排行:显示(95,42 + self.偏移坐标)
		self.日历:显示(120,42 + self.偏移坐标)

		self.蓝宝:显示(1,68 + self.偏移坐标)
		self.小表:显示(40,68 + self.偏移坐标)
		--self.红博:显示(80,68 + self.偏移坐标)
		--self.珠子:显示(1,98 + self.偏移坐标)
		self.小猪:显示(80,68 + self.偏移坐标)
	end
	if self.排行:事件判断() and not tp.战斗中 then
		--if tp.窗口.排行榜.可视==false then
		--	发送数据(39)
		--else
		--	tp.窗口.排行榜:打开()
		--end
	elseif self.世界:事件判断() and not tp.战斗中 then
		tp.窗口.世界大地图:打开()
	elseif (self.查询:事件判断() or keytq(KEY.TAB)) and not tp.战斗中 and not tp.消息栏焦点  then
		tp.窗口.小地图:打开(tp.当前地图)
	elseif self.VIP:事件判断() and not tp.战斗中 then
		--if tp.窗口.排行榜.可视==false then
		--	发送数据(45)
		--else
		--	tp.窗口.VIP系统:打开()
		--end
	elseif self.蓝宝:事件判断() and not tp.战斗中 then
		if tp.窗口.助战界面.可视 then
			tp.窗口.助战界面:打开()
		else
			发送数据(88)
		end
	elseif self.红博:事件判断() and not tp.战斗中 then
		--if tp.窗口.排行榜.可视==false then
		--	发送数据(45)
		--else
		--	tp.窗口.VIP系统:打开()
		--end
	elseif self.小猪:事件判断() and not tp.战斗中 then
		if tp.窗口.坐骑属性栏.可视 then
			tp.窗口.坐骑属性栏:打开()
		else
		    发送数据(96)
		end
	elseif self.小表:事件判断() and not tp.战斗中 then
		if tp.窗口.藏宝阁.可视 then
			tp.窗口.藏宝阁:打开()
		else
		    发送数据(60)
		end
	end
	if self.序列>=5 and self.序列<=10 then
	    日夜="白天"
	else
		日夜="黑夜"
	end
	self.时辰[self.序列]:显示(39,7.5 + self.偏移时间)
	sj:显示(75,5.5+self.偏移时间,os.date("%X", os.time()))
	local xy = "["..floor(tp.角色坐标.x/20)..","..floor(tp.角色坐标.y/20).."]"
	if self.偏移~=nil then
	   zt:显示(self.偏移-19,23.5 + self.偏移坐标,self.地图..xy)
	end
	--if self.排行:是否选中(x,y) then
	--	tp.提示:自定义(x-42,y+27,"排行榜")
	--end
	if self.日历:是否选中(x,y) then
		tp.提示:自定义(x-42,y+27,"梦幻指引")
	end
	if self.世界:是否选中(x,y) then
		tp.提示:自定义(x-42,y+27,"快捷键:ALT+M")
	end
	if self.查询:是否选中(x,y) then
		tp.提示:自定义(x-42,y+27,"快捷键:Tab")
	end
	--if self.VIP:是否选中(x,y) then
	--	tp.提示:自定义(x-42,y+27,"VIP福利")
	--end
	if 日夜=="黑夜" then
		self.黑昼:显示(18,7.5 + self.偏移坐标)
		return
	else
		self.白昼:显示(18,7.5 + self.偏移坐标)
		return
	end
end

function 系统类_时辰:检查点(x,y)
	return 矩阵:检查点(x,y)
end

return 系统类_时辰