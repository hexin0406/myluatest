
local 资源加载类 = class()


function 资源加载类:初始化()
 self:加载游戏资源()
end


function 资源加载类:更新(dt)

end
function 资源加载类:加载游戏资源()
  资源char = ffi.new('char[10485760]')
  资源p = tonumber(ffi.cast("intptr_t",资源char))
  wzife = require("Glow/WDF类")(全局变量.游戏目录.."wzife.wdf",资源p,10485760)

  end


function 资源加载类:显示(x,y)

end

return 资源加载类