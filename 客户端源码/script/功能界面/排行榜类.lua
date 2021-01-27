--======================================================================--
-- @作者: GGE研究群: 342119466
-- @创建时间:   2018-03-03 02:34:19
-- @Last Modified time: 2020-06-27 20:53:25
-- 梦幻西游游戏资源破解 baidwwy@vip.qq.com(313738139) 老毕   和 C++PrimerPlus 717535046 这俩位大神破解所以资源
--======================================================================--
local 排行榜类 = class()
local insert = table.insert
local zt = {"实\n力\n排\n行","比\n武\n排\n行","帮\n派\n排\n行","财\n富\n排\n行"}
local 数据名称={"实力","比武","帮派","财富"}
local 分组={"精锐组","勇武组","神威组","天科组","天启组","天元组"}
local 财富={"银子排行","充值排行"}
local 财富名称={"银子","金额"}
local zts1,zts

function 排行榜类:初始化(根)
    self.ID = 1421
	self.x = 125
	self.y = 70
	self.xx = 0
	self.yy = 0
	self.注释 = "排行榜类"
	self.可视 = false
	self.鼠标 = false
	self.焦点 = false
	self.可移动 = true
	zts1 = tp.字体表.普通字体_
	zts = require("gge文字类").创建(nil,18,true,false,true)
	zts1:置行间距(8)
	self.状态 = 1
	self.分组 = 1
	self.财富 = 1
end

function 排行榜类:打开(数据)
	if self.可视 then
		self.状态 = 1
		self.可视 = false
		self.背景 = nil
		self.资源组 = nil
		return
	else
		insert(tp.窗口_,self)
		local 按钮 = tp._按钮
		local 自适应 = tp._自适应
		local 资源 = tp.资源
		self.背景=资源:载入('wzife.wd5',"网易WDF动画",0X01000054)
		self.资源组={
			[1] = 按钮.创建(tp.资源:载入('wzife.wd5',"网易WDF动画",0x01000025),0,0,4,true,true),
			[2] = 按钮.创建(tp.资源:载入('wzife.wdf',"网易WDF动画",0x67A60C94),0,0,4,true,true),
			[3] = 按钮.创建(tp.资源:载入('wzife.wdf',"网易WDF动画",0x67A60C94),0,0,4,true,true),
			[4] = 按钮.创建(tp.资源:载入('wzife.wdf',"网易WDF动画",0x67A60C94),0,0,4,true,true),
			[5] = 按钮.创建(tp.资源:载入('wzife.wdf',"网易WDF动画",0x67A60C94),0,0,4,true,true),
			[6] = 按钮.创建(tp.资源:载入('wzife.wd3',"网易WDF动画",0x75C6DBC0),0,0,4,true,true),
			[7] = 按钮.创建(tp.资源:载入('wzife.wd3',"网易WDF动画",0x75C6DBC0),0,0,4,true,true),
			[8] = 按钮.创建(tp.资源:载入('wzife.wd3',"网易WDF动画",0x75C6DBC0),0,0,4,true,true),
			[9] = 按钮.创建(tp.资源:载入('wzife.wd3',"网易WDF动画",0x75C6DBC0),0,0,4,true,true),
			[10] = 按钮.创建(tp.资源:载入('wzife.wd3',"网易WDF动画",0x75C6DBC0),0,0,4,true,true),
			[11] = 按钮.创建(tp.资源:载入('wzife.wd3',"网易WDF动画",0x75C6DBC0),0,0,4,true,true),
			[12] = 按钮.创建(tp.资源:载入('wzife.wd3',"网易WDF动画",0x75C6DBC0),0,0,4,true,true),
			[13] = 按钮.创建(tp.资源:载入('wzife.wd3',"网易WDF动画",0x75C6DBC0),0,0,4,true,true),
			[14] = 按钮.创建(tp.资源:载入('wzife.wd5',"网易WDF动画",0x01000070),0,0,4,true,true),
			[15] = 按钮.创建(tp.资源:载入('wzife.wd5',"网易WDF动画",0x01000058),0,0,4,true,true),
			[16] = 按钮.创建(tp.资源:载入('wzife.wd5',"网易WDF动画",0x01000055),0,0,4,true,true),
			[17] = 按钮.创建(tp.资源:载入('wzife.wd5',"网易WDF动画",0x01000072),0,0,4,true,true),
			[18] = 按钮.创建(tp.资源:载入('wzife.wd5',"网易WDF动画",0x01000066),0,0,4,true,true),
			[19] = 按钮.创建(tp.资源:载入('wzife.wd5',"网易WDF动画",0x01000061),0,0,4,true,true),
			[20] = 按钮.创建(tp.资源:载入('wzife.wd5',"网易WDF动画",0x01000068),0,0,4,true,true),
			[21] = 按钮.创建(tp.资源:载入('wzife.wd5',"网易WDF动画",0x01000060),0,0,4,true,true),
			[22] = 按钮.创建(tp.资源:载入('wzife.wd5',"网易WDF动画",0x01000062),0,0,4,true,true),
		}
		tp.运行时间 = tp.运行时间 + 1
		self.窗口时间 = tp.运行时间
	    self.可视 = true
	    self.数据=数据
	end
end

function 排行榜类:显示(dt,x,y)
	self.焦点=false
	self.背景:显示(self.x,self.y)
	local 字体 = tp.字体表.普通字体
	self.资源组[1]:更新(x,y)
	self.资源组[2]:更新(x,y)
	self.资源组[1]:显示(self.x+583,self.y+4)
	zts1:置颜色(4294967295)
	for i=1,4 do
		self.资源组[i+1]:更新(x,y,self.状态 ~= i)
		if self.资源组[i+1]:事件判断() then
		    self.状态=i
		end
		local jx = self.x+610
		local jy = self.y+66+(i-1)*92
		self.资源组[i+1]:显示(jx,jy,nil,nil,nil,self.状态 == i,2)
		zts1:显示(jx+7,jy+6,zt[i])
	end
	if self.资源组[1]:事件判断() then
		self:打开()
		return
	end
	if self.状态==1 then
		self.资源组[14]:显示(self.x-150,self.y+90)
	    字体:置颜色(白色)
		字体:显示(self.x+280,self.y+3,"实 力 榜")
		字体:置颜色(绿色)
		字体:显示(self.x+275+15,self.y+69,"排名")
		字体:显示(self.x+335+20,self.y+69,"名称")
		字体:显示(self.x+405+25,self.y+69,"ID")
		字体:显示(self.x+455+15+15,self.y+69,"等级")
		字体:显示(self.x+505+15+20,self.y+69,"门派")
		字体:显示(self.x+275,self.y+420,"我的排名")
		字体:置颜色(黑色)
		for n=1,#self.数据[数据名称[1]] do
			if n<=10 then
			    字体:显示(self.x+280+15,self.y+99+n*33-33,n)
		      	字体:显示(self.x+315+20,self.y+99+n*33-33,self.数据[数据名称[1]][n].名称)
		      	字体:显示(self.x+390+25,self.y+99+n*33-33,self.数据[数据名称[1]][n].id)
		      	字体:显示(self.x+458+15+15,self.y+99+n*33-33,self.数据[数据名称[1]][n].等级)
		      	字体:显示(self.x+500+15+20,self.y+99+n*33-33,self.数据[数据名称[1]][n].门派)
			end
			if self.数据[数据名称[1]][n].id==self.数据.id then
			    字体:显示(self.x+280+15,self.y+99+11*33-20,n)
		      	字体:显示(self.x+315+20,self.y+99+11*33-20,self.数据[数据名称[1]][n].名称)
		      	字体:显示(self.x+390+25,self.y+99+11*33-20,self.数据[数据名称[1]][n].id)
		      	字体:显示(self.x+458+15+15,self.y+99+11*33-20,self.数据[数据名称[1]][n].等级)
		      	字体:显示(self.x+500+15+20,self.y+99+11*33-20,self.数据[数据名称[1]][n].门派)
			end
	 	end
	elseif self.状态==2 then
		字体:置颜色(白色)
		字体:显示(self.x+270,self.y+3,"英雄大会排行")
		字体:置颜色(绿色)
		字体:显示(self.x+275,self.y+69,"排名")
		字体:显示(self.x+335,self.y+69,"名称")
		字体:显示(self.x+405,self.y+69,"ID")
		字体:显示(self.x+455,self.y+69,"等级")
		字体:显示(self.x+505,self.y+69,"门派")
		字体:显示(self.x+555,self.y+69,"积分")
		字体:显示(self.x+275,self.y+420,"我的排名")
		字体:置颜色(黑色)
		for i=1,#分组 do
			self.资源组[i+5]:更新(x,y,self.分组 ~= i)
			if self.资源组[i+5]:事件判断() then
			    self.分组=i
			end
			local jx = self.x+10+(i-1)*98
			local jy = self.y+35
			self.资源组[i+5]:显示(jx,jy,nil,nil,nil,self.分组 == i,2)
			zts:显示(jx+20,jy+2,分组[i])
			if self.分组==i then
				if self.分组==1 then
				    self.资源组[15]:显示(self.x-70,self.y+80)
				elseif self.分组==2 then
					self.资源组[18]:显示(self.x-10,self.y+105)
				elseif self.分组==3 then
					self.资源组[19]:显示(self.x,self.y+85)
				elseif self.分组==4 then
					self.资源组[20]:显示(self.x-20,self.y+95)
				elseif self.分组==5 then
					self.资源组[21]:显示(self.x-70,self.y+95)
				elseif self.分组==6 then
					self.资源组[22]:显示(self.x-70,self.y+95)
				end
				for n=1,#self.数据[数据名称[2]][分组[i]] do
					if n<=10 then
					    字体:显示(self.x+280,self.y+99+n*33-33,n)
				      	字体:显示(self.x+315,self.y+99+n*33-33,self.数据[数据名称[2]][分组[i]][n].名称)
				      	字体:显示(self.x+390,self.y+99+n*33-33,self.数据[数据名称[2]][分组[i]][n].id)
				      	字体:显示(self.x+458,self.y+99+n*33-33,self.数据[数据名称[2]][分组[i]][n].等级)
				      	字体:显示(self.x+500,self.y+99+n*33-33,self.数据[数据名称[2]][分组[i]][n].门派)
				      	字体:显示(self.x+560,self.y+99+n*33-33,self.数据[数据名称[2]][分组[i]][n].积分)
					end
					if self.数据[数据名称[2]][分组[i]][n].id==self.数据.id then
				 		字体:显示(self.x+280,self.y+99+11*33-20,n)
				      	字体:显示(self.x+315,self.y+99+11*33-20,self.数据[数据名称[2]][分组[i]][n].名称)
				      	字体:显示(self.x+390,self.y+99+11*33-20,self.数据[数据名称[2]][分组[i]][n].id)
				      	字体:显示(self.x+458,self.y+99+11*33-20,self.数据[数据名称[2]][分组[i]][n].等级)
				      	字体:显示(self.x+500,self.y+99+11*33-20,self.数据[数据名称[2]][分组[i]][n].门派)
				      	字体:显示(self.x+560,self.y+99+11*33-20,self.数据[数据名称[2]][分组[i]][n].积分)
				 	end
			 	end
			end
		end
	elseif self.状态==3 then
		self.资源组[16]:显示(self.x,self.y)
		字体:置颜色(白色)
		字体:显示(self.x+280,self.y+3,"帮派实力榜")
		字体:置颜色(绿色)
		字体:显示(self.x+275+15,self.y+69,"排名")
		字体:显示(self.x+335+10,self.y+69,"帮派")
		字体:显示(self.x+405+10,self.y+69,"帮主")
		字体:显示(self.x+455+15+15,self.y+69,"ID")
		字体:显示(self.x+505+15+20,self.y+69,"积分")
		字体:显示(self.x+275,self.y+420,"我的排名")
		字体:置颜色(黑色)
		for n=1,#self.数据[数据名称[3]] do
			if n<=10 then
			    字体:显示(self.x+280+15,self.y+99+n*33-33,n)
		      	字体:显示(self.x+315+20,self.y+99+n*33-33,self.数据[数据名称[3]][n].帮派)
		      	字体:显示(self.x+390+13,self.y+99+n*33-33,self.数据[数据名称[3]][n].帮主)
		      	字体:显示(self.x+458+15,self.y+99+n*33-33,self.数据[数据名称[3]][n].id)
		      	字体:显示(self.x+500+15+20+10,self.y+99+n*33-33,self.数据[数据名称[3]][n].积分)
			end
	      	if self.数据[数据名称[3]][n].id==self.数据.id then
	      		字体:显示(self.x+280+15,self.y+99+11*33-20,n)
		      	字体:显示(self.x+315+20,self.y+99+11*33-20,self.数据[数据名称[3]][n].帮派)
		      	字体:显示(self.x+390+13,self.y+99+11*33-20,self.数据[数据名称[3]][n].帮主)
		      	字体:显示(self.x+458+15,self.y+99+11*33-20,self.数据[数据名称[3]][n].id)
		      	字体:显示(self.x+500+15+20+10,self.y+99+11*33-20,self.数据[数据名称[3]][n].积分)
	      	end
	 	end
	elseif self.状态==4 then
		self.资源组[17]:显示(self.x-170,self.y+100)
		字体:置颜色(白色)
		字体:显示(self.x+280,self.y+3,"财 富 榜")
		字体:置颜色(绿色)
		字体:显示(self.x+275+15,self.y+69,"排名")
		字体:显示(self.x+335+15,self.y+69,"名称")
		字体:显示(self.x+405+20,self.y+69,"ID")
		字体:显示(self.x+455+10+15,self.y+69,"等级")
		字体:显示(self.x+275,self.y+420,"我的排名")
		for i=1,#财富 do
			self.资源组[i+11]:更新(x,y,self.财富 ~= i)
			if self.资源组[i+11]:事件判断() then
			    self.财富=i
			end
			local jx = self.x+98+(i-1)*310
			local jy = self.y+25
			self.资源组[i+11]:显示(jx,jy,nil,nil,nil,self.财富 == i,2)
			zts:显示(jx+13,jy+2,财富[i])
		end
    	if self.财富==1 then
			字体:显示(self.x+505+15+20,self.y+69,"银子")
			字体:置颜色(黑色)
			if self.数据[数据名称[4]]["银子"]~=nil then
				for n=1,#self.数据[数据名称[4]]["银子"] do
					if n<=10 then
					    字体:显示(self.x+280+15,self.y+99+n*33-33,n)
				      	字体:显示(self.x+315+20,self.y+99+n*33-33,self.数据[数据名称[4]]["银子"][n].名称)
				      	字体:显示(self.x+390+20,self.y+99+n*33-33,self.数据[数据名称[4]]["银子"][n].id)
				      	字体:显示(self.x+458+10+15,self.y+99+n*33-33,self.数据[数据名称[4]]["银子"][n].等级)
				      	字体:显示(self.x+500+20,self.y+99+n*33-33,self.数据[数据名称[4]]["银子"][n].银子)
					end
					if self.数据[数据名称[4]]["银子"][n].id==self.数据.id then
					    字体:显示(self.x+280+15,self.y+99+11*33-20,n)
				      	字体:显示(self.x+315+20,self.y+99+11*33-20,self.数据[数据名称[4]]["银子"][n].名称)
				      	字体:显示(self.x+390+20,self.y+99+11*33-20,self.数据[数据名称[4]]["银子"][n].id)
				      	字体:显示(self.x+458+10+15,self.y+99+11*33-20,self.数据[数据名称[4]]["银子"][n].等级)
				      	字体:显示(self.x+500+20,self.y+99+11*33-20,self.数据[数据名称[4]]["银子"][n].银子)
					end
				end
			end
    	elseif self.财富==2 then
    		字体:置颜色(绿色)
			字体:显示(self.x+505+15+20,self.y+69,"金额(元)")
			字体:置颜色(黑色)
			if self.数据[数据名称[4]]["金额"]~=nil then
				for n=1,#self.数据[数据名称[4]]["金额"] do
					if n<=10 then
					    字体:显示(self.x+280+15,self.y+99+n*33-33,n)
				      	字体:显示(self.x+315+20,self.y+99+n*33-33,self.数据[数据名称[4]]["金额"][n].名称)
				      	字体:显示(self.x+390+20,self.y+99+n*33-33,self.数据[数据名称[4]]["金额"][n].id)
				      	字体:显示(self.x+458+10+15,self.y+99+n*33-33,self.数据[数据名称[4]]["金额"][n].等级)
				      	字体:显示(self.x+500+20+20,self.y+99+n*33-33,self.数据[数据名称[4]]["金额"][n].金额)
					end
					if self.数据[数据名称[4]]["金额"][n].id==self.数据.id then
					    字体:显示(self.x+280+15,self.y+99+11*33-20,n)
				      	字体:显示(self.x+315+20,self.y+99+11*33-20,self.数据[数据名称[4]]["金额"][n].名称)
				      	字体:显示(self.x+390+20,self.y+99+11*33-20,self.数据[数据名称[4]]["金额"][n].id)
				      	字体:显示(self.x+458+10+15,self.y+99+11*33-20,self.数据[数据名称[4]]["金额"][n].等级)
				      	字体:显示(self.x+500+20+20,self.y+99+11*33-20,self.数据[数据名称[4]]["金额"][n].金额)
					end

				end
			end
    	end
	end
end

function 排行榜类:检查点(x,y)
	if self.可视 and self.背景 ~= nil and self.背景:是否选中(x,y)  then
		return true
	else
		return false
	end
end

function 排行榜类:初始移动(x,y)
	tp.运行时间 = tp.运行时间 + 1
	if not tp.消息栏焦点 then
  		self.窗口时间 = tp.运行时间
 	end
	if not self.焦点 then
		tp.移动窗口 = true
	end
	if self.鼠标 and  not self.焦点 then
		self.xx = x - self.x
		self.yy = y - self.y
	end
end

function 排行榜类:开始移动(x,y)
	if self.鼠标 then
		self.x = x - self.xx
		self.y = y - self.yy

	end
end

return 排行榜类