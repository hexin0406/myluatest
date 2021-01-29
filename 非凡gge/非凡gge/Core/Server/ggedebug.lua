-- @作者: baidwwy
-- @邮箱:  313738139@qq.com
-- @创建时间:   2015-03-29 06:29:00
-- @最后修改来自: baidwwy
-- @Last Modified time: 2019-07-20 18:35:01
local errored--只显示一次
local _print = print
function __gge.traceback(msg)
	--print(错误日志)
	--if 错误日志==nil then 错误日志="" end
	if not errored then
	  -- print(tostring(msg).."..//按F4或双击此行可转到错误代码页。//")

	    --print("---------------------------------以下为可能错误的方---------------------------------")
	  --错误日志=错误日志.."#换行符"..测试时间(os.time())..":"..msg
	  --错误数目=错误数目+1


		--print(调试模式,错误日志)
		-- if 调试模式 then
			_print(tostring(msg).."..//按F4或双击此行可转到错误代码页。//")
			_print("---------------------------------以下为可能错误的方---------------------------------")
			_print(debug.traceback())

		 -- end

	  -- print(错误日志)
	end
end
