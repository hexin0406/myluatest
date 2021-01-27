--======================================================================--
-- @作者: GGE研究群: 342119466
-- @创建时间:   2018-03-03 02:34:19
-- @Last Modified time: 2020-08-22 02:07:04
-- 梦幻西游游戏资源破解 baidwwy@vip.qq.com(313738139) 老毕   和 C++PrimerPlus 717535046 这俩位大神破解所以资源
--======================================================================--
local 登录类 = class()

local tp
local mouseb = 引擎.鼠标按下

function 登录类:初始化(根)
	local 资源 = 根.资源
	self.进入游戏 = 根._按钮(资源:载入('wzife.wd5',"网易WDF动画",0x00010014),0,0,3,true,true)
	self.注册账号 = 根._按钮(资源:载入('wzife.wd5',"网易WDF动画",0x00010001),0,0,3,true,true)
	self.游戏充值 = 根._按钮(资源:载入('wzife.wd5',"网易WDF动画",0x00010007),0,0,3,true,true)
	self.制作团队 = 根._按钮(资源:载入('wzife.wd5',"网易WDF动画",0x00010004),0,0,3,true,true)
	self.退出游戏 = 根._按钮(资源:载入('wzife.wd5',"网易WDF动画",0x00010002),0,0,3,true,true)
	self.游戏主页 = 根._按钮(资源:载入('wzife.wd5',"网易WDF动画",0x00010008),0,0,3,true,true)
	self.上一步 = 根._按钮(资源:载入('wzife.wd5',"网易WDF动画",0x00010011),0,0,3,true,true)
	self.创建 = 根._按钮(资源:载入('wzife.wd5',"网易WDF动画",0x00010013),0,0,3,true,true)
	self.下一步 = 根._按钮(资源:载入('wzife.wd5',"网易WDF动画",0x00010010),0,0,3,true,true)

	tp = 根
	self.背景图片={}
	-- self.背景图片[1] = 资源:载入('wzife.wdf',"网易WDF动画",0xA2EC482E)
	self.背景图片[3]=资源:载入('wzife.wd5',"网易WDF动画",0x00010016)
	self.控件类 = require("ggeui/加载类")()
	local 总控件 = self.控件类:创建控件('创建控件')
	总控件:置可视(true,true)
	self.账号输入框 = 总控件:创建输入("账号输入",0,0,240,14,根)
	self.账号输入框:置可视(false,false)
	self.账号输入框:置限制字数(12)
	self.账号输入框:置光标颜色(4294967295)
	self.账号输入框:置文字颜色(4294967295)
	self.账号输入框:置文本("账号输入")
	self.密码输入框 = 总控件:创建输入("密码输入",0,0,200,14,根)

	self.密码输入框:置可视(false,false)
	self.密码输入框:置限制字数(12)
	self.密码输入框:置光标颜色(4294967295)
	self.密码输入框:置文字颜色(4294967295)
	self.密码输入框:置密码模式()
	self.账号输入框:置文本(f函数.读配置(程序目录.."config.ini","mhxy","账号"))
	self.密码输入框:置文本(f函数.读配置(程序目录.."config.ini","mhxy","密码"))

	self.事件 = false
	self.焦点 = false
	self.开启 = false
	self.编号 = 编号
	self.双击 = nil
	self.时间 = 0
  self.账号输入焦点 = false
  self.密码输入焦点 = false
  self.置坐标 = false
end

function 登录类:更新(dt)

    if self.i ~= nil then
  self.i = self.i +1.5
  if self.i >100 then
      self.i = 1
  end
  渐进加载界面_进度条:置位置(self.i)
  if self.i==91 then
    self.i=nil
      tp.进程=1
      渐进加载界面_进度条:置可视(false)
  end
end

end

function 登录类:显示(dt,x,y)
  引擎.置标题(全局游戏标题.." - ".."登陆")
  self.密码输入框:置坐标(全局游戏宽度/2-80,全局游戏高度/2-42+60)
  self.账号输入框:置坐标(全局游戏宽度/2-80,全局游戏高度/2-90+60)
  -- self.背景图片[1]:显示(全局游戏宽度/2-155,全局游戏高度/2-120)
  self.背景图片[3]:显示(全局游戏宽度/2-180,全局游戏高度/2-180+60)
  self.控件类:更新(dt,x,y)
  self.控件类:显示(x,y)
  self.上一步:更新(x,y)
  self.下一步:更新(x,y)
  self.上一步:显示(全局游戏宽度/2-130,全局游戏高度/2-10+60)
  self.下一步:显示(全局游戏宽度/2+10,全局游戏高度/2-10+60)

  self.注册账号:更新(x,y)
  self.游戏充值:更新(x,y)
  self.制作团队:更新(x,y)
  self.退出游戏:更新(x,y)
  self.游戏主页:更新(x,y)

  self.注册账号:显示(全局游戏宽度-150,全局游戏高度-300)
  self.游戏充值:显示(全局游戏宽度-150,全局游戏高度-250)
  self.游戏主页:显示(全局游戏宽度-150,全局游戏高度-200)
  self.制作团队:显示(全局游戏宽度-150,全局游戏高度-150)
  self.退出游戏:显示(全局游戏宽度-150,全局游戏高度-100)

  if 引擎.按键弹起(键盘符号.tab) then
    if self.账号输入焦点 then
      self.账号输入框:置焦点(false)
      self.密码输入框:置焦点(true)
      self.账号输入焦点 = false
      self.密码输入焦点 = true
    elseif self.密码输入焦点 then
      self.密码输入框:置焦点(false)
      self.账号输入框:置焦点(true)
      self.账号输入焦点 = true
      self.密码输入焦点 = false
    else
      self.账号输入框:置焦点(true)
      self.账号输入焦点 = true
    end
  end
  if self.上一步:事件判断() then
    tp.进程 = 1
    系统退出=true
    客户端:断开(1)

  elseif self.下一步:事件判断() then
    if self.账号输入框:取文本()=="" or self.密码输入框:取文本()=="" then
      tp.提示:写入("#Y/请先输入账号或密码")
      return 0
    elseif #self.账号输入框:取文本() <6 or #self.密码输入框:取文本() <6  then
      tp.提示:写入("#Y/账号或密码格式不正确")
      return 0
    else
        系统参数.账号=self.账号输入框:取文本()
        系统参数.密码=self.密码输入框:取文本()
        f函数.写配置(程序目录.."config.ini","mhxy","账号",系统参数.账号)
        f函数.写配置(程序目录.."config.ini","mhxy","密码",系统参数.密码)
        客户端:发送数据(1,版本..fgc..系统参数.账号..fgc..系统参数.密码..fgc..f函数.取硬盘序列号())
    end
  elseif self.注册账号:事件判断() then
    tp.进程 = 5
  elseif self.游戏充值:事件判断() then
    tp.进程 = 6
  elseif self.游戏主页:事件判断() then
    tp.提示:写入("    游戏官方: WWW.163.COM ")
  elseif self.制作团队:事件判断() then
    tp.提示:写入(tostring(全局msg制作团队))
  elseif self.退出游戏:事件判断() then
    引擎.关闭()
  -- elseif self.注册账号:事件判断() then
  --   tp.提示:写入("#Y/游戏账号无须注册，首次登录的账号会自动创建，请进入游戏后尽快按照提示设置安全码")
  end
end

return 登录类