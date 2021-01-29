
鼠标动画类 = class()

function 鼠标动画类:初始化()
 --table.print(wzife)

  self.鼠标动画={[1]=WAS动画类.创建(wzife,0x535C1994)}

 self.显示序列=1


 self.停止更新=false

end



function 鼠标动画类:更新(dt)

 if(self.停止更新==false)then self.鼠标动画[self.显示序列]:更新(dt) end



end

function 鼠标动画类:显示(x,y)

self.鼠标动画[self.显示序列]:显示(x,y)

end

return  鼠标动画类