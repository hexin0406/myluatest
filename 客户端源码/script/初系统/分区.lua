--======================================================================--
--	☆ 作者：飞蛾扑火 QQ：1415559882
--======================================================================--
local 场景类_分区 = class()
local tp
local insert = table.insert

function 场景类_分区:初始化(根)
	local 资源 = 根.资源
	self.标题背景 = 资源:载入('wzife.wd5',"网易WDF动画",0x00010017)--899E213B  --分区背景
    self.右边分区1 = 资源:载入('wzife.wdf',"网易WDF动画",0x0E3A7EE6)
    self.右边分区2 = 资源:载入('wzife.wdf',"网易WDF动画",0xFB057B3D)--红色动态
    self.默认服务器 = 资源:载入('wzife.wdf',"网易WDF动画",0x40FD8B71)
    self.大分区 = 资源:载入('wzife.wdf',"网易WDF动画",0xD330CE3F)
    self.大分区选中 = 资源:载入('wzife.wdf',"网易WDF动画",0xF5674AFF)
    self.小分区= 资源:载入('wzife.wdf',"网易WDF动画",0xBD57A592)
    self.默认 = 资源:载入('wzife.wdf',"网易WDF动画",0x2E588160)
    self.默认X = 资源:载入('wzife.wdf',"网易WDF动画",0x19243A82)
    self.默认背景 = 资源:载入('wzife.wdf',"网易WDF动画",0xBD57A592)
	self.进入游戏 = 根._按钮(资源:载入('wzife.wdf',"网易WDF动画",0x0A247197),0,0,3,true,true)
	self.上一步 = 根._按钮(资源:载入('wzife.wd5',"网易WDF动画",0x00010009),0,0,3,true,true)
	self.退出游戏 = 根._按钮(资源:载入('wzife.wd5',"网易WDF动画",0x00010002),0,0,3,true,true)
	self.下一步 = 根._按钮(资源:载入('wzife.wd5',"网易WDF动画",0x00010003),0,0,3,true,true)
	tp = 根
	local 按钮 = 根._按钮
	local 自适应 = 根._自适应
    self.临时计次O=0
    --================
    self.大分区按钮事件 = 0
    self.小分区按钮事件 = 0
	local file1=self:分区内容()
	local servertype = 分割文本(file1, "\n")
	self.大分区OL = {	}
	self.小分区OL = {	}
	self.大分区分类 = {	}
	self.小分区分类 = {	}
	self.小分区分类背景 = {	}
	for n = 1, #servertype do
		local typeA = 分割文本(servertype[n], " ")
		if #typeA == 4 then
		    n = 按钮.创建(自适应.创建(31,4,65,22,1,3),0,0,4,true,true,typeA[4])
		    insert(self.大分区OL,n)
		    n={tonumber(typeA[1]),tonumber(typeA[2]),tonumber(typeA[3]),typeA[4]}
		    insert(self.大分区分类,n)
		elseif #typeA == 10 then--梦幻的是18
		    n = 按钮.创建(自适应.创建(32,4,65,22,1,3),0,0,4,true,true,typeA[4])
		    insert(self.小分区OL,n)
		    n={tonumber(typeA[1]),tonumber(typeA[2]),tonumber(typeA[3]),typeA[4],typeA[5],tonumber(typeA[6]),typeA[7],tonumber(typeA[8]),tonumber(typeA[9]),typeA[10]}
		    insert(self.小分区分类,n)
		    n=资源:载入('wzife.wdf',"网易WDF动画",0xBD57A592)
		    insert(self.小分区分类背景,n)
		elseif #typeA == 18 then--梦幻官方
		    n = 按钮.创建(自适应.创建(32,4,65,22,1,3),0,0,4,true,true,typeA[4])
		    insert(self.小分区OL,n)
		    n={tonumber(typeA[1]),tonumber(typeA[2]),tonumber(typeA[3]),typeA[4],typeA[5],tonumber(typeA[6]),typeA[7],tonumber(typeA[8]),tonumber(typeA[9]),typeA[10]}
		    insert(self.小分区分类,n)
		    n=资源:载入('wzife.wdf',"网易WDF动画",0xBD57A592)
		    insert(self.小分区分类背景,n)
		end
	end
  self.服务器数据={}
  for n=1,#self.小分区分类 do
    self.服务器数据[n]={mc=self.小分区分类[n][4],状态=1,x=0,y=0,背景=0,ip=连接ip,dk=8080}
    if 老九定制 then
    	self.服务器数据[n].dk=8013
  	end
  end

end

function 场景类_分区:显示(dt,x,y)
	if tp.进程 == 8 then
		引擎.置标题(全局游戏标题.."- 请选择分区")
		self.上一步:更新(x,y)
		self.下一步:更新(x,y)
		self.右边分区1:更新(x,y)
		for n = 1, #self.大分区OL do
			self.大分区OL[n]:更新(x,y)
		end
		for n = 1, #self.小分区OL do
			self.小分区OL[n]:更新(x,y)
		end
        self.临时计次O=self.临时计次O+1
        if self.临时计次O==6 then
            self.右边分区2:更新(x,y)
            self.临时计次O=0
        end
		self.退出游戏:更新(x,y)
		if self.进入游戏:事件判断() then
			引擎.置新标题(全局游戏标题)
			tp.进程 = 7
		elseif self.上一步:事件判断() then
			tp.进程 = 1
		elseif self.下一步:事件判断() then
		    local 服务器名称数据 = f函数.读配置(程序目录.."配置文件.ini","主要配置","服务器名称")
    	    系统参数.服务器={名称=服务器名称数据,ip=self.服务器数据[1].ip,端口=8080}
			tp.登陆.账号输入框:置可视(true,true)
			tp.登陆.密码输入框:置可视(true,true)
			if 客户端.连接结果 == false then
			    客户端:连接处理(系统参数.服务器.ip,系统参数.服务器.端口)
			end
			tp.进程 = 7
		elseif self.退出游戏:事件判断() then
			引擎关闭开始()
			return false
		end
        local msgq宽度 = 全局游戏宽度/2
        local msgq高度 = 全局游戏高度/2
        self.右边分区1:显示(msgq宽度+260,msgq高度-190)
        self.右边分区2:显示(msgq宽度+275,msgq高度-10)

		self.标题背景:显示(msgq宽度-255,msgq高度-196)

        self.默认服务器:显示(msgq宽度-220,msgq高度+160)
		self.默认背景:显示(msgq宽度+170,msgq高度+160)
        self.默认:显示(msgq宽度+180,msgq高度+160)
        self.默认X:显示(msgq宽度+140,msgq高度+160)

		--self.进入游戏:显示(全局游戏宽度-160,全局游戏高度-320)
		self.上一步:显示(全局游戏宽度-160,全局游戏高度-200)
		self.退出游戏:显示(全局游戏宽度-160,全局游戏高度-260)
		self.下一步:显示(全局游戏宽度-160,全局游戏高度-140)

		for n = 1, #self.大分区OL do
			if self.大分区OL[n]:事件判断() then
			     self.大分区按钮事件 = n
			     全局大分区 = self.大分区分类[n][4]
            end
		end

		local msgq列 = 1
		for n = 1, #self.大分区OL do
			msgq行=服务区取行(n)
			if self.大分区按钮事件==n then
			    self.大分区选中:显示(msgq宽度-305+msgq列*68,msgq高度-215+msgq行*28)
			end
			self.大分区OL[n]:显示(msgq宽度-305+msgq列*68,msgq高度-215+msgq行*28,nil,nil,nil,self.大分区按钮事件==n,2)
			if msgq列 ~=7 then
			    msgq列 = msgq列 +1
			elseif msgq列 ==7  then
				msgq列 = 1
			end
		end
		local msgq行 = 1
		local msgq列 = 1
		msgq行=1
		for n = 1, #self.小分区OL do
			self.小分区分类背景[n]:显示(msgq宽度-308+msgq列*68,msgq高度+70+msgq行*28)
			 if msgq列 ~=7 then
			    msgq列 = msgq列 +1
			elseif msgq列 ==7  then
				msgq列 = 1
				msgq行=msgq行+1
			 end
		end
		msgq行=1
		for n = 1, #self.小分区OL do
            if self.大分区按钮事件 == 到整数(self.小分区分类[n][1]) and self.大分区按钮事件 ~= 0 then
			    self.小分区OL[n]:显示(msgq宽度-308-68+msgq列*68,msgq高度+70+msgq行*28,nil,122)

			    if msgq列 ~=7 then
			        msgq列 = msgq列 +1
			    elseif msgq列 ==7  then
				    msgq列 = 1
				    msgq行=msgq行+1
			    end
            end
		end
		for n = 1, #self.小分区OL do
			if self.小分区OL[n]:事件判断() then
			     self.小分区按钮事件 = n
			     if self.大分区按钮事件 == 到整数(self.小分区分类[n][1]) and self.小分区分类[n][4]~="" then
			        -- 引擎.置新标题(全局游戏标题)
			        local 服务器名称数据 = f函数.读配置(程序目录.."配置文件.ini","主要配置","服务器名称")
    	            系统参数.服务器={名称=服务器名称数据,ip=self.服务器数据[1].ip,端口=8080}
			        tp.登陆.账号输入框:置可视(true,true)
			        tp.登陆.密码输入框:置可视(true,true)
			        if 客户端.连接结果 == false then
			        客户端:连接处理(系统参数.服务器.ip,系统参数.服务器.端口)
			        end
			        tp.进程 = 7
			        --全局小分区 = self.小分区分类[n][4]
		            --self.服务器编号=到整数(self.小分区分类[n][1])
		            --self.服务器数据[self.服务器编号].名称=全局小分区
			        --系统参数.服务器={名称=self.服务器数据[self.服务器编号].mc,ip=self.服务器数据[n].ip,端口=self.服务器数据[n].dk}
			        --tp.登陆.账号输入框:置可视(true,true)
			        --tp.登陆.密码输入框:置可视(true,true)
			        --if 客户端.连接结果 == false then
			        --	客户端:连接处理(系统参数.服务器.ip,系统参数.服务器.端口)
			       	--end
			        --tp.进程 = 7
			     end
            end
		end
	end
end

function 服务区取行(n)
	local msgq行 = 1
	if n<=7  then
		msgq行=1
	elseif n<=14 then
		msgq行=2
	elseif n<=21 then
		msgq行=3
	elseif n<=28 then
		msgq行=4
	elseif n<=35  then
		msgq行=5
	elseif n<=42 then
		msgq行=6
	elseif n<=49  then
		msgq行=7
	elseif n<=56  then
		msgq行=8
	elseif n<=63 then
		msgq行=9
	elseif n<=70  then
		msgq行=10
	elseif n<=77  then
		msgq行=11
	elseif n<=84  then
		msgq行=12
	elseif n<=91  then
		msgq行=13
	elseif n<=98  then
		msgq行=14
	end
	return msgq行
end

function 场景类_分区:分区内容()
	local x返回=nil
	if 服务器名称数据 == "雷霆嘎巴" then --ZYL(707198409)
	    x返回 =[[
-1 7 9 雷霆嘎巴
1 1 1 雷霆嘎巴 106.2.55.218 11566 4 106.2.55.218 11566 4 106.2.55.218 11566 4 2 欢迎进入梦幻西游 1156 0 201204130000
]]
    elseif 服务器名称数据 == "征梦西游" then --ZYL(707198409)
	    x返回 =[[
-1 7 9 征梦西游
1 1 1 征梦西游 106.2.55.218 11566 4 106.2.55.218 11566 4 106.2.55.218 11566 4 2 欢迎进入梦幻西游 1156 0 201204130000
]]
	else
	    x返回 =[[
-1 7 9 本地测试
1 1 1 本地测试 106.2.55.218 11566 4 106.2.55.218 11566 4 106.2.55.218 11566 4 2 欢迎进入梦幻西游 1156 0 201204130000
]]
	end
  return x返回
end


return 场景类_分区