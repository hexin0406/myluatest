require("GGE")--引用头


引擎("游戏模版",850,620,60)


 人物属性=gge.精灵("pic/人物界面.png")


function 更新函数(dt,x,y)--帧率,鼠标x,鼠标y



end


function 渲染函数(x,y)--鼠标x,鼠标y
	引擎.渲染开始()
	引擎.渲染清除(0xFF272822)
	人物属性:显示(20,20)

	引擎.渲染结束()
end



local function 退出函数()

	return true
end
引擎.置退出函数(退出函数)