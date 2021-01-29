
local WAS动画类 = class()





function WAS动画类:初始化(wdf,id,造型,变异,召唤兽)

   	 self.动画=动画类(wdf:取文件(id))

end


function WAS动画类:更新(dt)
 self.动画:更新(dt)
end
function WAS动画类:取包围盒()
  return self.动画.精灵:取包围盒()

end

function WAS动画类:取当前帧()
  return self.动画.当前帧

end

function WAS动画类:取结束帧()
  return self.动画.结束帧

end

function WAS动画类:显示(x,y)
 self.动画:显示(x,y)
end
function WAS动画类:换帧更新()
 self.动画:换帧更新()
end
function WAS动画类:置方向(q)
 self.动画:置方向(q)
end

return WAS动画类