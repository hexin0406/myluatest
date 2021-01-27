--======================================================================--
--	☆ 作者：飞蛾扑火 QQ：1415559882
--======================================================================--
local 场景类_标题 = class()
local tp
local ceil = math.ceil
local min = math.min
local max = math.max
local mouseb = 引擎.鼠标弹起
local box = 引擎.画矩形
local insert = table.insert
local remove = table.remove
require("script/初系统/游戏更新说明")
function 场景类_标题:初始化(根)
	local xx = {{"1989C5FC",0xEB3FD8C3,0xEC1A0419},{"66279210",0x16E9D48F,0x79560528},{"07B8C541",0x7BBB735E,nil}}
	local sj = 引擎.取随机整数(1,1)
	local 资源 = 根.资源
	local 按钮 = 根._按钮
	local 滑块 = 根._滑块
	local 自适应 = 根._自适应
	self.标题背景 = 资源:载入("start.dll","图片")
	self.场景覆盖 = 资源:载入('wzife.wd4',"网易WDF动画",xx[sj][2])
	self.场景计次 = self.场景覆盖.宽度
	self.场景覆盖:置区域(self.场景计次,0,全局游戏宽度,全局游戏高度)
	self.标题背景公告 = 资源:载入('wzife.wd5',"网易WDF动画",0x00010018)
	self.标题背景系统公告图片 = 资源:载入('wzife.wdf',"网易WDF动画",0x9893B897)
	self.标题背景服务器公告图片 = 资源:载入('wzife.wdf',"网易WDF动画",0xD020CFA4)
	self.内部测试 = 资源:载入('wzife.wdf',"网易WDF动画",0xBECEA063)--梦幻西游小图标1 wzife.wd1  655E283A  E60B550B
	self.梦幻西游小图标1 = 按钮.创建(资源:载入("common/general.wdf","网易WDF动画",0x231AEF68),0,0,1,true,true)
	-- self.标题背景系统公告图片:置区域(0,0,全局游戏宽度,全局游戏高度)--可以充填
	if xx[sj][3] ~= nil then
		self.特效覆盖 = 资源:载入('wzife.wd4',"网易WDF动画",xx[sj][3])
		self.特效计次 = self.特效覆盖.宽度/2+450
		self.特效覆盖:置区域(self.特效计次,0,全局游戏宽度,全局游戏高度)
	end
	local dh = {0xDC739617,0x22E6E35C,0x16CC1B46,0xD8632D20}
    self.动画 = {}
	for n=1,4 do
	    self.动画[n] = 资源:载入('wzife.wdf',"网易WDF动画",dh[n])
	end
	self.资源组 = {
		[5] = 按钮.创建(根.资源:载入('wzife.wdf',"网易WDF动画",0x7AB5584C),0,0,4,true,true),--按钮.创建(自适应.创建(20,4,18,19,4,3),0,0,4,true,true),
		[6] = 按钮.创建(根.资源:载入('wzife.wdf',"网易WDF动画",0xCB50AB1D),0,0,3,true,true),--按钮.创建(自适应.创建(21,4,18,19,4,3),0,0,4,true,true),
		[10] = 滑块.创建(自适应.创建(11,4,15,40,2,3,nil),4,14,213,2),
	}
	self.进入游戏 = 根._按钮(资源:载入('wzife.wd5',"网易WDF动画",0x00010014),0,0,3,true,true)
	self.注册账号 = 根._按钮(资源:载入('wzife.wd5',"网易WDF动画",0x00010014),0,0,3,true,true)--根._按钮(资源:载入('wzife.wdf',"网易WDF动画",0x072DD907),0,0,3,true,true)
	self.游戏充值 = 根._按钮(资源:载入('wzife.wd5',"网易WDF动画",0x00010008),0,0,3,true,true)
	self.退出游戏 = 根._按钮(资源:载入('wzife.wd5',"网易WDF动画",0x00010002),0,0,3,true,true)
	self.游戏主页 = 根._按钮(资源:载入('wzife.wd5',"网易WDF动画",0x00010007),0,0,3,true,true)
	self.制作团队 = 根._按钮(资源:载入('wzife.wd5',"网易WDF动画",0x00010004),0,0,3,true,true)
	tp = 根
	self.丰富文本说明 = 根._丰富文本(480,380)
	self.msg系统公告内容 = 场景类_标题说明
	self.丰富文本说明:添加文本(self.msg系统公告内容)
	self.丰富文本说明.滚动值 = self.丰富文本说明.行数量
	self.丰富文本说明:滚动(self.丰富文本说明.滚动值)
	self.丰富文本说明:滚动(-21)
	self.介绍加入 = 0
	self.资源组[10]:置起始点(0)
end

function 场景类_标题:显示(dt,x,y)
    self.标题背景:置区域(self.特效计次,0,全局游戏宽度,全局游戏高度)
    self.标题背景:显示(0,0)
    self.内部测试:显示((全局游戏宽度/2-200)*2+250,全局游戏高度/2-200-150)
	self.场景计次 = self.场景计次 - 0.3
	self.场景覆盖:置区域(self.场景计次,0,全局游戏宽度,全局游戏高度)
	self.场景覆盖:显示(0,全局游戏高度)
	if tp.进程 == 7 or tp.进程 == 8 or tp.进程 == 5 or tp.进程 == 6 then
		self.梦幻西游小图标1:更新(x,y)
        self.梦幻西游小图标1:显示(全局游戏宽度/2-140,全局游戏高度/2-300)
	end
	for n=1,4 do
		self.动画[n]:更新(dt)
	    self.动画[n]:显示(全局游戏宽度-700 + (n-1) *110,全局游戏高度-100)
	end
	if self.特效覆盖 ~= nil then
		self.特效计次 = self.特效计次 - 0.7
		self.特效覆盖:置区域(self.特效计次,0,全局游戏宽度,全局游戏高度)
		self.特效覆盖:显示(0,全局游戏高度)
	end
	if tp.进程 == 1 then
        local msg宽度 =全局游戏宽度/2-250--200
        local msg高度 =全局游戏高度/2-200--200
		-- 引擎.置标题(全局游戏标题)
		self.丰富文本说明:更新(dt,x,y)
		self.标题背景公告:更新(dt,x,y)
		self.标题背景系统公告图片:更新(dt,x,y)
		self.内部测试:更新(x,y)
		self.进入游戏:更新(x,y)
		self.注册账号:更新(x,y)
		self.游戏充值:更新(x,y)
		self.退出游戏:更新(x,y)
		self.游戏主页:更新(x,y)
		self.制作团队:更新(x,y)
		self.资源组[5]:更新(x,y,self.介绍加入 > 0)
		self.资源组[6]:更新(x,y,self.介绍加入 < #self.丰富文本说明.显示表 - 21)
		if self.资源组[5]:事件判断() then
				self.丰富文本说明:滚动(1)
				self.介绍加入=self.介绍加入-1
			self.资源组[10]:置起始点(self.资源组[10]:取百分比转换(self.介绍加入-1,21,#self.丰富文本说明.显示表))
		elseif self.资源组[6]:事件判断() then
				self.丰富文本说明:滚动(-1)
				self.介绍加入=self.介绍加入+1
			self.资源组[10]:置起始点(self.资源组[10]:取百分比转换(self.介绍加入+1,21,#self.丰富文本说明.显示表))
		end
		if(self.标题背景公告:是否选中(x,y) ) and 引擎.取鼠标滚轮() >0 then--鼠标上滚动
			if self.丰富文本说明.滚动值 < #self.丰富文本说明.显示表 -21 then
				self.丰富文本说明:滚动(1)
				self.介绍加入=self.介绍加入-1
			end
		elseif (self.标题背景公告:是否选中(x,y)) and 引擎.取鼠标滚轮() <0  then--鼠标下滚动
			if self.丰富文本说明.滚动值 > 0 then
				self.丰富文本说明:滚动(-1)
				self.介绍加入=self.介绍加入+1
			end
		end
		tp.鼠标.还原鼠标()
		if self.进入游戏:事件判断() then
			tp.进程 = 7
			-- tp.选中窗口 = nil
		elseif self.注册账号:事件判断() then
			tp.进程 = 8--5
		elseif self.游戏充值:事件判断() then
			tp.进程 = 6
		elseif self.游戏主页:事件判断() then
			tp.提示:写入("    游戏官方: WWW.163.COM ")
		elseif self.制作团队:事件判断() then
			tp.提示:写入(tostring(全局msg制作团队))
			-- __gge.messagebox(tostring(全局msg制作团队),"游戏团队",16)
		elseif self.退出游戏:事件判断() then
			引擎关闭开始()
			return false
		end
	    self.标题背景系统公告图片:显示(msg宽度+150,msg高度-50)
	    self.标题背景公告:显示(msg宽度-50,msg高度)
		self.丰富文本说明:显示(msg宽度,msg高度+30)
		-- self.进入游戏:显示(全局游戏宽度-160,全局游戏高度-440)
		self.注册账号:显示(全局游戏宽度-140,全局游戏高度-200)
		-- self.游戏充值:显示(全局游戏宽度-160,全局游戏高度-320)
		self.游戏主页:显示(全局游戏宽度-140,全局游戏高度-380)
		self.制作团队:显示(全局游戏宽度-140,全局游戏高度-320)--320
		self.退出游戏:显示(全局游戏宽度-140,全局游戏高度-260)--240
		self.资源组[5]:显示(msg宽度+ 505,msg高度+20)
		self.资源组[6]:显示(msg宽度+ 505,msg高度 + 388)
	end
end

return 场景类_标题