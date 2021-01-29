-- @作者: baidwwy
-- @邮箱:  313738139@qq.com
-- @创建时间:   2015-04-04 16:55:06
-- @最后修改来自: baidwwy
-- @Last Modified time: 2017-06-15 09:50:00

--游戏出错时会调用 __gge.traceback ,如果想让游戏继续运行,请删除__gge.traceback函数
-- local _print = print
-- function print( ... )
-- 	local t = {...}
-- 	for i=1,table.maxn(t) do
-- 		t[i] = tostring(t[i])
-- 	end
-- 	_print(table.maxn(t)==0 and "nil" or (table.concat( t, "\t").." "))
-- end

local errored--只显示一次
		__gge.traceback = function (msg)
		if not errored then
			if 引擎.是否运行 and 引擎.是否运行() then
				function 更新函数(dt,x,y)--帧率,鼠标x,鼠标y
					if 引擎.场景 == nil then
						return
					end
					引擎.场景.dt = dt
					引擎.场景:更新(dt,x,y)
					引擎.场景.回收速度 = 引擎.场景.回收速度 + 1
					if 引擎.场景.回收速度 == 10000 then -- 2000回收一次
						collectgarbage("collect")
					end
				end

				function 渲染函数(dt,x,y)
					引擎.渲染开始()
					引擎.渲染清除(0xFF808080)

					引擎.场景:显示(dt,x,y)

					引擎.渲染结束()
				end
			  -- 引擎作者 = tostring("引擎作者：沈明".."\n".."\n".."封装作者：baidwwy".."\n".."\n".."游戏作者：仙古轩".."\n".."\n".."\n".."点击右键返回游戏界面")
			    --loadstring()
			   -- loadstring(string.format(脚本, 引擎.宽度-20,(引擎.宽度-450)/2,引擎.高度-300))()
			    __gge.messagebox("遇到BUG了！(请截图BUG并上传论坛或者官方群@作者)\n"..msg)
			    if 引擎.场景.场景.人物 ~= nil then
				    __gge.messagebox("系统已经帮你保存了备份了存档！(备份存档在存根目录，使用提取出来即可使用)")
				    引擎.场景.储存游戏数据(1,true)
				end
			else
				__gge.messagebox(tostring(msg),"致命的错误",16)
				更新函数,渲染函数 = nil,nil
				循环函数 = nil
				if 引擎 then 引擎.关闭() end
			end
			errored = true
		end
	end--]]
--运行一个函数,如果函数内有错误,游戏也不崩溃
__gge.pcall = function (fun,...)
	local ret = {pcall(fun,...)}
	if ret[1] and ret[2] then
	    return unpack(ret, 2)
	end
end
