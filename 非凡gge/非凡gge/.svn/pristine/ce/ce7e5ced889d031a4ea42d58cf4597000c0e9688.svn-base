
鼠标动画类 = class()

function 鼠标动画类:初始化()
 self.鼠标动画={[1]=WAS动画类.创建(wzife,0x535C1994),[2]=WAS动画类.创建(wzife,0x1FBC5273),[3]=WAS动画类.创建(wzife,0xC5750B15),[4]=WAS动画类.创建(wzife,0xB48A9B3D),[5]=WAS动画类.创建(wzife,0xB352AE45),[6]=WAS动画类.创建(wzife,0x183DC759),[7]=WAS动画类.创建(wzife,0x5A055B13),[8]=WAS动画类.创建(wzife,0xCF1D211E),[9]=WAS动画类.创建(wzife,0xB87E0F0C)}--1=移动，2=攻击，3=捕捉，4=法术,5=保护 7=对话
 self.显示序列=1
 self.点击动画={动画=WAS动画类.创建(addon,0x0D98AC0A),开关=false}

 self.停止更新=false

end
function 鼠标动画类:添加点击动画(x,y)
 self.点击动画.开关=true
 self.点击动画.x=x
 self.点击动画.y=y
 self.点击动画.动画:换帧更新()
 -- print(self.点击动画.开关)
 end


function 鼠标动画类:更新(dt)

 if(self.停止更新==false)then self.鼠标动画[self.显示序列]:更新(dt) end

  if self.点击动画.开关 then
  	  self.点击动画.动画:更新(dt)
  	 -- print(self.点击动画.动画.动画.当前帧,self.点击动画.动画.动画.结束帧 )
  	 if self.点击动画.动画.动画.当前帧==self.点击动画.动画.动画.结束帧 then
         self.点击动画.开关 =false



  	 	 end

     end

end

function 鼠标动画类:显示(x,y)

self.鼠标动画[self.显示序列]:显示(x,y)

if self.点击动画.开关 then
  	  self.点击动画.动画:显示(self.点击动画.x+屏幕.xy.x,self.点击动画.y+屏幕.xy.y)

  	  end



end

return  鼠标动画类