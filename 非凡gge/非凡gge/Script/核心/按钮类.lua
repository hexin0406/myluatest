
按钮类=class()



function 按钮类:销毁()
      self.动画=nil
      self.宽度=nil
      self.高度=nil
      self.显示进程=nil
      self.显示宽度=nil

      self.获取焦点=nil
      self.包围盒=nil

 end


function 按钮类:初始化(纹理,类型,文字,四层,附加高度,颜色,大小) --类型={1为纯图，2为搭配文字,3=文字按钮}

      self.动画=图像类(纹理)
      self.宽度=self.动画:取宽度()
      self.高度=self.动画:取高度()
      if 附加高度~=nil then self.文字高度=附加高度 else self.文字高度=0 end
      self.显示进程=1
      self.显示宽度=self.宽度/四层
      self.动画:置区域(0,0,self.显示宽度,self.高度) -- 设置图像可显示的区域
      self.获取焦点=false
      self.x=0
      self.y=0
      self.包围盒=包围盒.创建(0,0,self.显示宽度,self.高度)
      self.包围盒坐标={x=0,y=0}
      self.类型=类型

	if(类型==1)then
   self.文字=nil

  elseif(类型==2)then

    self.文字=文字
    self.临时长度=string.len(self.文字)
    self.显示x=math.floor((self.宽度/self.临时长度)/12)+5
    self.字体=文字类.创建("C:/Windows/Fonts/simsun.ttc",14)
  elseif(类型==4)then

    self.文字=文字
    self.临时长度=string.len(self.文字)
    self.显示x=math.floor((self.宽度/self.临时长度)/12)+10
    self.字体=文字类.创建("C:/Windows/Fonts/simsun.ttc",16)
  elseif(类型==5)then

    self.文字=文字
    self.临时长度=string.len(self.文字)
    self.显示x=math.floor((self.宽度/self.临时长度)/12)+8
    self.字体=文字类.创建("C:/Windows/Fonts/simsun.ttc",14)
  elseif(类型==3)then
    self.文字=文字
   -- self.包围盒:置宽高(string.len(self.文字)*10,60)
   if 颜色==nil then

     self.字体颜色={黑色,黄色,黑色}
    else

     self.字体颜色=颜色
     --self.字体颜色={白色,黄色,黑色}

     end
    -- print(文字,颜色)
    self.字体=gge文字.创建("C:/Windows/Fonts/simsun.ttc",大小)
    self.字体:置颜色(self.字体颜色[1])
    --self.包围盒=包围盒.创建(0,0,string.len(文字),大小)


    end

  self.按键事件=false
  self.按键时间=0









 end


function 按钮类:取是否单击()

 if(self.显示进程==3)then
     按钮点击=true
       return true


    else

       return false
 	  end


 end

function 按钮类:更新()

  self.包围盒:置坐标(self.x+self.包围盒坐标.x,self.y+self.包围盒坐标.y)

 if(self.包围盒:检查点(鼠标.x,鼠标.y))then


        if(self.获取焦点==false and self.显示进程~=3)then

         self.获取焦点=true
         self.显示进程=2
         if self.类型==3 then
           self.字体:置颜色(self.字体颜色[2])
          else
           self.动画:置区域(self.显示宽度,0,self.显示宽度,self.高度)
         end

        elseif(self.获取焦点 and self.显示进程~=3)then

         if(引擎.鼠标弹起(KEY.LBUTTON))then

             self.显示进程=3
             if self.类型==3 then
               self.字体:置颜色(self.字体颜色[3])
              else
             self.动画:置区域(self.显示宽度*2,0,self.显示宽度,self.高度)
              end
             self.包围盒坐标.x=self.显示宽度*2



         	  end
        elseif(self.显示进程==3)then
         self.显示进程=1
         self.获取焦点=false
         if self.类型==3 then
           self.字体:置颜色(self.字体颜色[3])
          else
           self.动画:置区域(0,0,self.显示宽度,self.高度)
           end
         self.包围盒坐标.x=0


         end


    else

      if(self.获取焦点)then

         self.获取焦点=false
         self.显示进程=1
         if self.类型==3 then
           self.字体:置颜色(self.字体颜色[1])
          else
           self.动画:置区域(0,0,self.显示宽度,self.高度)
           end
         self.包围盒坐标.x=0

        else
         self.按键事件=false
         self.按键时间=0


      	  end






 	 end




 end

function 按钮类:取按键事件()
  --return self.显示进程
  return self.按键事件




  end





function 按钮类:显示(x,y) --类型={1为纯图，2为搭配文字}

  self.x,self.y=x,y
 --print(self.类型,self.文字)
 if self.类型==3 then
    self.字体:显示(x,y,self.文字)
  else
    self.动画:显示(x,y)
 end
  if self.文字~=nil and self.类型==2 then self.字体:显示(x+self.显示x,y+3+self.文字高度,self.文字) end
   if 引擎.鼠标按住(左键) and self.显示进程==2 then
     -- print(66)
      if self.按键时间==0 then self.按键时间=引擎.取游戏时间() end
      if 引擎.取游戏时间()-self.按键时间>=1.5 then self.按键事件=true end
    else
      self.按键事件=false
      self.按键时间=0

     end

  if self.文字~=nil and self.类型==4 then self.字体:显示(x+self.显示x,y+3+self.文字高度,self.文字) end
   if 引擎.鼠标按住(左键) and self.显示进程==2 then
     -- print(66)
      if self.按键时间==0 then self.按键时间=引擎.取游戏时间() end
      if 引擎.取游戏时间()-self.按键时间>=1.5 then self.按键事件=true end
    else
      self.按键事件=false
      self.按键时间=0

     end
   if self.文字~=nil and self.类型==5 then self.字体:显示(x+self.显示x,y+3+self.文字高度,self.文字) end
   if 引擎.鼠标按住(左键) and self.显示进程==2 then
     -- print(66)
      if self.按键时间==0 then self.按键时间=引擎.取游戏时间() end
      if 引擎.取游戏时间()-self.按键时间>=1.5 then self.按键事件=true end
    else
      self.按键事件=false
      self.按键时间=0

     end

end



return 按钮类