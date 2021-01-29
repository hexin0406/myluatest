local 输入框类 = class()


function 输入框类:销毁()

  self.文字=nil
  self.光标=nil
  self.包围盒=nil
  self.颜色=nil
  self.内容=nil



end

function 输入框类:初始化(文字,颜色,宽度,高度,id)
	self.文字 = 文字
	self.光标 = require("gge精灵类").创建(0,0,0,2,高度)
	self.包围盒 = require ("gge包围盒").创建(0,0,宽度,高度)
	self.闪烁间隔 = 0.6
	self.计时 = 0
	self.光标可视 = true
	self.颜色 = 颜色
    self.宽度=宽度
	self.内容 = {}
	self.长度 = 0
	self.显示内容= ""
	self.退格时间 = 0.5
	self.退格速度 = 0.03
	self.退格计时 = 0
	self.退格计时1 = 0
	self.长度=0
	self.id=id
	self.密码模式=false
	self.密码文本=""
 local 字符 =  ""






end
function 输入框类:置密码模式(v)
 self.密码模式=v
end
function 输入框类:置光标颜色(v)
	self.光标:置颜色(v)
	return self
end
function 输入框类:置提示文本(v)

end
function 输入框类:置默认文本(v)

end
function 输入框类:置文本(v)

	local 字符 =  v
	if self.长度<self.宽度 then
		--self.时间 = 时间


		if #字符>2 then
			分割字符(字符,self.内容)--分割并加入
		else
			table.insert(self.内容,字符)
		end
		self:生成文本()
	end
	 self.长度 = self.文字:取宽度(self.显示内容)

	 --print(长度)

end
function 输入框类:清空()
	self.内容 = {}
	self:生成文本()
end
function 输入框类:取文本()



	return  self.显示内容
end


function 输入框类:获取焦点()
 if self.包围盒:检查点(鼠标.x,鼠标.y) then

     return true
    else
     return false

 	 end


 end


function 输入框类:更新(dt)
	self.计时 = self.计时 +dt
	if self.计时 >= self.闪烁间隔 then
		self.计时  = 0
	    self.光标可视 = not self.光标可视
	end

    if self.包围盒:检查点(鼠标.x,鼠标.y)  and 引擎.鼠标弹起(KEY.LBUTTON) then
          输入框判断=self.id


    end

    if self.包围盒:检查点(鼠标.x,鼠标.y) ==false  then

        return 0

     end


	local 时间,字符 = 引擎.取输入字符()
	if self.长度==nil then self.长度=0 end
	--if 字符==nil then return 0 end
	if 时间 ~= 0 and 时间 ~= 字符输入时间 and self.长度<self.宽度  then
		--self.时间 = 时间
		字符输入时间=时间

		if #字符>2 then
			分割字符(字符,self.内容)--分割并加入
		else
			table.insert(self.内容,字符)
		end
		self:生成文本()
	end

	if 引擎.按键按下(KEY.BACKSPACE) then--退格
		if #self.内容 >0 then
		    table.remove(self.内容)
		    self:生成文本()
		end
	end
	if 引擎.按键按住(KEY.BACKSPACE) then--一直按住退格
		if #self.内容 >0 then
		    self.退格计时 = self.退格计时 + dt
		    if self.退格计时 > self.退格时间 then
		    	self.退格计时1 = self.退格计时1 + dt
		    	if self.退格计时1>self.退格速度 then
		    		self.退格计时1 = 0
			        table.remove(self.内容)
			        self:生成文本()
		    	end
		    end
		end
	end
	 if 引擎.按键弹起(KEY.BACKSPACE) then self.退格计时 = 0 end
end
function 输入框类:生成文本()
    self.光标可视 = true
    self.显示内容 = table.concat(self.内容)
    self.长度 = self.文字:取文本宽度(self.显示内容)
    self:生成密码文本()
    --print(#self.显示内容)
end
function 输入框类:生成密码文本()
	--if self.内容=="" then return 0 end
   --print(string.len(self.内容))
    self.密码文本=""
    for n=1,string.len(self.显示内容) do

     self.密码文本=self.密码文本.."*"

     end
end

function 输入框类:显示(x,y)
	self.包围盒:置坐标(x,y)


	if self.光标可视 and  输入框判断==self.id  then
	   --print(x,self.长度,y)
	   if self.长度==nil then self.长度=0 end
	    self.光标:显示(x+self.长度,y)
	end

   if self.密码模式==false then
	 self.文字:置颜色(self.颜色):显示(x,y,self.显示内容)

    else
     self.文字:置颜色(self.颜色):显示(x,y,self.密码文本)
	 end
end


return 输入框类