--======================================================================--
--======================================================================--
local 选择角色 = class()

local tp
local qtx = 引擎.取头像
local mouseb = 引擎.鼠标按下
local qmx = 引擎.取模型
local qzd = 引擎.取战斗模型

function 选择角色:初始化(根)
  local 资源 = 根.资源
  tp = 根
 -- self.背景图片 = pwd("54")
 self.背景图片 = 图像类("save/bj/1.png")
  local 按钮 = 根._按钮
  self.上一步 = 按钮.创建(资源:载入('wzife.wd5',"网易WDF动画",0x00010009),0,0,3,true,true)
  self.创建 = 按钮.创建(资源:载入('wzife.wd5',"网易WDF动画",0x00010013),0,0,3,true,true)
  self.下一步 = 按钮.创建(资源:载入('wzife.wd5',"网易WDF动画",0x00010003),0,0,3,true,true)

  self.选中人物 = 0
  self.选择人物 = false
  self.说明框状态 = "人物介绍"
  self.动作 = "静立"
  self.方向 = 4
  self.染色ID = 0
  self.介绍文本 = 根._丰富文本(250,81)
  local 资源 = 根.资源
  self.介绍文本:置行度(-1)

  self.文字创建角色 = 资源:载入('wzife.wdf',"网易WDF动画",0xB3E8376C)
  self.文字人魔仙 = 资源:载入('wzife.wdf',"网易WDF动画",0xA4B96C8E)
  self.文字未选择人物背景 = 资源:载入('wzife.wd1',"网易WDF动画",0x35BE402C)
  self.文字未选择人物 = 资源:载入('wzife.wd1',"网易WDF动画",0xA0087F62)
  self.人物已选择头像背景 = 资源:载入('wzife.wdf',"网易WDF动画",0x820CE56F)
  -- self.人物头像框大图背景 = 资源:载入('wzife.wd5',"网易WDF动画",0x00A12153)
  self.人物姓名框 = 资源:载入('wzife.wdf',"网易WDF动画",0x1BA268A5)
  self.染色切换 = 资源:载入('wzife.wdf',"网易WDF动画",0x5C939428)

  local 按钮 = tp._按钮
  self.介绍加入 = 0
  人物阴影 =资源:载入('shape.wdf',"网易WDF动画",0xDCE4B562)
  self.影子 = 资源:载入('shape.wdf',"网易WDF动画",0xDCE4B562)
  self.选择框 = 资源:载入('wzife.wdf',"网易WDF动画",0x37DD63ED)
  self.一号染色 =  按钮.创建(资源:载入('wzife.wdf',"网易WDF动画",0xE328CB14),0,0,3,true,true)
  self.二号染色 =  按钮.创建(资源:载入('wzife.wdf',"网易WDF动画",0x57DAD188),0,0,3,true,true)
  self.三号染色 =  按钮.创建(资源:载入('wzife.wdf',"网易WDF动画",0x185D8D97),0,0,3,true,true)
  self.人物站立 =  按钮.创建(资源:载入('wzife.wdf',"网易WDF动画",0x74706375),0,0,3,true,true)
  self.人物奔跑 =  按钮.创建(资源:载入('wzife.wdf',"网易WDF动画",0x5CB66E72),0,0,3,true,true)
  self.人物攻击 =  按钮.创建(资源:载入('wzife.wdf',"网易WDF动画",0xD27DAAD2),0,0,3,true,true)
  self.人物施法 =  按钮.创建(资源:载入('wzife.wdf',"网易WDF动画",0xB8EBD1E5),0,0,3,true,true)
  self.后退一个方向 =  按钮.创建(资源:载入('wzife.wdf',"网易WDF动画",0x15B09F21),0,0,3,true,true)
  self.前进一个方向 =  按钮.创建(资源:载入('wzife.wdf',"网易WDF动画",0x2AF9D941),0,0,3,true,true)
  self.人物介绍 =  按钮.创建(资源:载入('wzife.wdf',"网易WDF动画",0x9EBCAA98),0,0,3,true,true)
  self.可用兵器 =  按钮.创建(资源:载入('wzife.wdf',"网易WDF动画",0x1559A775),0,0,3,true,true)
  self.可选门派 =  按钮.创建(资源:载入('wzife.wdf',"网易WDF动画",0xF0B715C0),0,0,3,true,true)
  self.人物说明框 = 资源:载入('wzife.wdf',"网易WDF动画",0x9DCA2A15)
  self.人物说明框上翻 =  按钮.创建(资源:载入('wzife.wdf',"网易WDF动画",0xFD3D61F2),0,0,3,true,true)
  self.人物说明框下翻 = 按钮.创建(资源:载入('wzife.wdf',"网易WDF动画",0x09217E13),0,0,3,true,true)
  self.人物随机名字 = 按钮.创建(资源:载入('wzife.wdf',"网易WDF动画",0x92ABEFD3),0,0,3,true,true)
  self.角色数据={}
  self.角色信息={}
  self.角色选中号码=0
  self.角色选中=0
  self.事件 = false
  self.焦点 = false
  self.开启 = false
  self.编号 = 编号
  self.双击 = nil
  self.时间 = 0
  self.头像显示={[1]={x=580,y=55},[2]={x=580,y=125},[3]={x=580,y=195},[4]={x=580,y=265},[5]={x=580,y=335},[6]={x=580,y=405}}
end

function 选择角色:置方向(方向,n)
  self.创建人物精灵[n]["静立"]:置方向(方向)
  self.创建人物精灵[n]["行走"]:置方向(方向)
  self.创建人物精灵[n]["攻击"]:置方向(取四至八方向(方向))
  self.创建人物精灵[n]["施法"]:置方向(取四至八方向(方向))
end

function 选择角色:置染色(人物ID,染色方案,染色ID,方向)
  self.创建人物精灵[人物ID]["静立"]:置染色(染色方案,染色ID,染色ID,染色ID)
  self.创建人物精灵[人物ID]["行走"]:置染色(染色方案,染色ID,染色ID,染色ID)
  self.创建人物精灵[人物ID]["攻击"]:置染色(染色方案,染色ID,染色ID,染色ID)
  self.创建人物精灵[人物ID]["施法"]:置染色(染色方案,染色ID,染色ID,染色ID)
  self:置方向(方向,人物ID)
end

function 选择角色:后退方向()
  if self.方向 < 7 then
    self.方向 = self.方向 + 1
    self:置方向(self.方向,self.选中人物)
  else
    self.方向 = 0
    self:置方向(self.方向,self.选中人物)
  end
end

function 选择角色:前进方向()
  if self.方向 >= 1 then
    self.方向 = self.方向 - 1
    self:置方向(self.方向,self.选中人物)
  else
    self.方向 = 7
    self:置方向(self.方向,self.选中人物)
  end
end

function 选择角色:更新(dt)

end

function 选择角色:显示(dt,x,y)
  self.背景图片:显示(0,0)
	self.上一步:更新(x,y)
	self.下一步:更新(x,y)
	self.创建:更新(x,y)
	self.创建:显示(625,489)
	self.上一步:显示(625,529)
	self.下一步:显示(625,569)
	for n=1,#self.角色数据 do
    self.包围盒[n]:置坐标(self.头像显示[n].x,self.头像显示[n].y-10)
    self.角色数据[n].选择人物头像:更新()
    self.角色数据[n].选择人物头像:显示(self.头像显示[n].x,self.头像显示[n].y)
    if self.角色选中号码==n then
      tp.字体表.普通字体:置颜色(红色)
    end

    tp.字体表.普通字体:显示(self.头像显示[n].x+78,self.头像显示[n].y+20,self.角色信息[n].名称)
    tp.字体表.普通字体:显示(self.头像显示[n].x+78,self.头像显示[n].y+45,"等级:"..self.角色信息[n].等级)
    tp.字体表.普通字体:显示(self.头像显示[n].x+153,self.头像显示[n].y+45,"门派:"..self.角色信息[n].门派)
    tp.字体表.普通字体:置颜色(白色)
    if self.包围盒[n]:检查点(x,y) and 引擎.鼠标按下(左键) then
      self.角色选中号码=n
    end
    if self.角色选中号码==n then
      if 引擎.鼠标弹起(0) then
				if self.双击 == nil then
					self.事件 = true
					self.双击 = 1
          self.角色选中=self.角色选中号码
				else
					self.事件 = nil
					self.载入 = 1
				end
      end
      if self.双击 == 1 then
        self.时间 = self.时间 + 1
        if self.时间 >= 16 then
          self.双击 = nil
          self.时间 = 0
        end
      end
      if self.载入 ~= nil then
        if self.角色选中~=self.角色选中号码 then
          self.双击 = nil
          self.时间 = 0
          self.载入 = nil
          return
        else
          系统参数.选中玩家id = self.角色信息[self.角色选中号码].id
          客户端:发送数据(4,self.角色信息[self.角色选中号码].id)
          全局登陆内容()
          self.载入 = nil
        end
      end
    end
  end
  if self.角色选中号码~=0 then
    tp.字体表.普通字体:显示(125,534,self.角色信息[self.角色选中号码].名称)
    tp.字体表.普通字体:显示(377,534,self.角色信息[self.角色选中号码].id)
    tp.字体表.普通字体:显示(125,573,self.角色信息[self.角色选中号码].等级)
    tp.字体表.普通字体:显示(377,573,self.角色信息[self.角色选中号码].门派)
    self.角色数据[self.角色选中号码].人物头像:显示(10,0)
    self.角色数据[self.角色选中号码]:更新(dt)
    self.角色数据[self.角色选中号码]:显示(435,480)
  end
  if self.创建:事件判断() then
    tp.创建:刷新位置()
    客户端:发送数据(2)
	elseif self.上一步:事件判断() then
		self.焦点 = 0
		self.上一焦点 = 0
    self.角色选中号码=0
		tp.进程 = 7
		tp.登陆.账号输入框:置可视(true,true)
		tp.登陆.密码输入框:置可视(true,true)
    系统退出=true
	elseif self.下一步:事件判断() then
		if self.角色选中号码==0 then
			提示("#y/请先选择一个角色")
			return 0
		else
      系统参数.选中玩家id = self.角色信息[self.角色选中号码].id
			客户端:发送数据(4,self.角色信息[self.角色选中号码].id)
		end
  end
end

function 选择角色:添加角色信息(信息)
	self.角色数据={}
	self.角色信息={}
  self.包围盒={}
	for n=1,#信息 do
		self.角色数据[n]= require("script/初系统/选择角色动画")(1,tp,信息[n].造型,信息[n].武器数据,信息[n].染色组,信息[n].染色方案,信息[n].锦衣数据,信息[n].光环数据,信息[n].足迹数据) --信息[n].武器数据
		self.角色信息[n]=信息[n]
    self.包围盒[n]  = require("gge包围盒")(0,0,200,45)
	end
	tp.进程 = 2
	tp.选中窗口 = nil
end

return 选择角色