
local 人物动画类 = class()

local txs = {飞燕女=65,骨精灵=66,狐美人=67,虎头怪=68,巨魔王=69,剑侠客=70,龙太子=71,鬼潇潇=72,偃无师=73,杀破狼=74,神天兵=75,巫蛮儿=76,舞天姬=77,玄彩娥=78,桃夭夭=79,逍遥生=80,羽灵神=81,英女侠=82}
local txk = 引擎.取头像
local mxs = 引擎.取模型
local insert = table.insert
--local tp = nil
local tonumber = tonumber
local pairs = pairs
local tq  = 引擎.鼠标弹起
local qzdjy = 引擎.取锦衣模型
local qzdjys = 取锦衣身体模型
local 临时资源
local 临时资源包
local qmxs = 引擎.取模型

function 人物动画类:初始化(类型,根,模型,武器,染色,方案,锦衣,光环,足迹)
  local s = txs[模型]
  local q = mxs(模型)
  local z = txk(模型)
  if 类型==1 then --进入游戏时的选择角色
    self.人物头像 = pwd(s)
    self.选择人物头像 = 根.资源:载入(z[7],"网易WDF动画",z[5])
    self.动作="静立"
    if 武器.名称=="" then
      if 锦衣 ~= nil then
        if 锦衣.名称 == "夜影" or 锦衣.名称 == "夏日清凉" or 锦衣.名称 == "华风汉雅" or 锦衣.名称 == "萌萌小厨" then
          临时资源 = qzdjy(模型.."_静立_"..锦衣.名称)
          临时资源包 = "shape0.npk"
          if  锦衣.名称 == "华风汉雅" or 锦衣.名称 == "萌萌小厨" then
            临时资源包 = "shape2.npk"
          end
          self[self.动作] = 根.资源:载入(临时资源包,"网易锦衣动画",临时资源)
          if 锦衣.名称 == "夏日清凉" or 锦衣.名称 == "华风汉雅" or 锦衣.名称 == "萌萌小厨" then
            临时资源 = qzdjys(模型.."_静立_"..锦衣.名称.."_头")
            self.身体 = tp.资源:载入("shape0.npk","网易锦衣动画",临时资源)
          end
        else
          q= qmxs(锦衣.名称.."_"..模型)
          self[self.动作] = 根.资源:载入(q[3],"网易WDF动画",q[1])
        end
      else
        self[self.动作] = 根.资源:载入(q[3],"网易WDF动画",q[1])
        if 方案~=0 then
          self[self.动作]:置染色(方案,染色[1],染色[2],染色[3],0)
        end
      end

    else

      self.武器={}
      self.动作="静立"
      local ssss = 武器.子类
      local sss
      if 武器.名称 == "龙鸣寒水" or 武器.名称 == "非攻" then
        ssss = "弓弩1"
      else
        ssss = tp:取武器子类(武器.子类)
      end
      q = mxs(模型,ssss)
        if 锦衣 ~= nil then
          if ssss == "弓弩1" then
            sss = "弓弩"
          else
            sss = ssss
          end
          if 锦衣.名称 == "夜影" or 锦衣.名称 == "夏日清凉" or 锦衣.名称 == "华风汉雅" or 锦衣.名称 == "萌萌小厨" then
            临时资源 = qzdjy(模型..sss.."_静立_"..锦衣.名称)
            临时资源包 = "shape0.npk"
            if 锦衣.名称 == "华风汉雅" or 锦衣.名称 == "萌萌小厨" then
              临时资源包 = "shape2.npk"
            end
            self[self.动作] = 根.资源:载入(临时资源包,"网易锦衣动画",临时资源)
            if 锦衣.名称 == "夏日清凉" or 锦衣.名称 == "华风汉雅" or 锦衣.名称 == "萌萌小厨" then
              临时资源 = qzdjys(模型..sss.."_静立_"..锦衣.名称.."_头")
              self.身体 = tp.资源:载入("shape0.npk","网易锦衣动画",临时资源)
            end
          else
            q= qmxs(锦衣.名称.."_"..模型)
            self[self.动作] = 根.资源:载入(q[3],"网易WDF动画",q[1])
          end
        else
          self[self.动作] = 根.资源:载入(q[3],"网易WDF动画",q[1])
          if 方案~=0 then
            self[self.动作]:置染色(方案,染色[1],染色[2],染色[3],0)
          end
        end
      local m = tp:取武器附加名称(武器.子类,武器.级别限制,武器.名称)
      local x = mxs(m.."_"..模型,nil)
      self.武器[self.动作] = 根.资源:载入(x[3],"网易WDF动画",x[1])
      if 锦衣 == nil then
          self.武器[self.动作]:置差异(self.武器[self.动作].帧数-self[self.动作].帧数)
      end
      if 武器.染色方案~=0 and 武器.染色组~=0 and 武器.染色组~=nil and #武器.染色组>0 then
          self.武器[self.动作]:置染色(武器.染色方案,武器.染色组[1],武器.染色组[2],武器.染色组[3])
      end
    end
    if 光环 ~= nil then
      local gh = 引擎.取光环(光环.名称)
      self.光环=tp.资源:载入(gh[4],"网易WDF动画",gh[1])
    end
    if 足迹 ~= nil then
      local gh = 引擎.取足迹(足迹.名称)
      self.足迹=tp.资源:载入(gh[4],"网易WDF动画",gh[1])
    end
  end
end

function 人物动画类:点击事件()
  if self[self.动作]:是否选中(鼠标.x,鼠标.y) and 引擎.鼠标弹起(左键) then
    return true
  elseif self.武器~=nil and self.武器[self.动作]:是否选中(鼠标.x,鼠标.y) and 引擎.鼠标弹起(左键) then
    return true
  else
    return false
  end
end

function 人物动画类:更新(dt)
  self[self.动作]:更新(dt)
  if self.武器~=nil then
    self.武器[self.动作]:更新(dt)
  end
  if self.身体~=nil then
    self.身体:更新(dt)
  end
  if self.光环~=nil then
    self.光环:更新(dt)
  end
  if self.足迹~=nil then
    self.足迹:更新(dt)
  end
end

function 人物动画类:显示(x,y)
  人物阴影:显示(x,y)
  if self.身体~=nil then
    self.身体:显示(x,y)
  end
  if self.光环~=nil then
    self.光环:显示(x,y)
  end
  if self.足迹~=nil then
    self.足迹:显示(x,y)
  end
  self[self.动作]:显示(x,y)
  if self.武器~=nil then
    self.武器[self.动作]:显示(x,y)
  end

end

return 人物动画类