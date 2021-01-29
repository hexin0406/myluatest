--======================================================================--
--该 文件由GGELUA创建
--
--作者：baidwwy  创建日期：2014-06-06 07:42:41
--======================================================================--

--@说明 超级文本类 可以做聊天框,对话框,提示框,装备显示等,支持多彩文字,超链接,背景色等等功能
local _超级文本 = class()
require("gge函数")--用到 分割字符函数
--@参数 文字对象,每行间隔,限制宽度(自动折行),识别元素符号,换行标识符号
function _超级文本:初始化(文字,行间隔,宽度,回调函数,符号,换行符)
	self.符号 		= 符号 or "#"
	self.宽度 		= 宽度
	self.换行符 	= 换行符 or "->"

	self.回调函数 	= 回调函数
	self.文字宽度 	= 文字:取宽度("A")
	self.文字高度 	= 文字.大小
	self.行间隔 	= 行间隔
	self.文字 		= 文字
	self.元素表 	= {}
	self.显示表 	= {}
	self.数据表 	= {}
	self.背景 		= require("gge精灵类")(0,0,0,0,0)
	self.包围盒 	= require("gge包围盒")(0,0,0,0)	
	self.高度 		= 0
	self.最大宽度 	= 0
	self.鼠标x 		= 0
	self.鼠标y 		= 0
	self.起始值 	= 0
	self.目标值 	= 0
	self.递增值 	= 1

end
--@返回 如果不足限制宽度,则返回当前文本最大宽度
function _超级文本:取宽度()
	return self.最大宽度
end
--@返回 非聊天框模式时,返回当前文本最大高度
function _超级文本:取高度()
	return self.高度-self.行间隔
end
--@参数 限制聊天框的高度
function _超级文本:置聊天框模式(v)
	self.限制高度 = v
	return self
end
--@参数 设置超链接回调函数,如果是类中函数则第一个参数是类的self,第二个参数才是函数
function _超级文本:置回调函数(a,b)
	if b then
	    self.回调函数 = b
	    self.回调函数表 = a
	else
		 self.回调函数 = a
	end
end
--@参数 元素符号,如#1,那么1就是元素符号,#是创建时的元素识别符号.
function _超级文本:添加元素(符号,数据)

	符号 = tostring(符号)
	if(#self.元素表==0)then self.默认颜色 = 数据 end
	table.insert(self.元素表,{符号, 数据})
	table.sort(self.元素表,function (a,b) return #a[1] > #b[1] end)
end
--@参数 如果文字中带有\n会自动换行.
function _超级文本:添加文本(数据)
	local f = string.split(数据,"\n")
	for i,v in ipairs(f) do
		self:格式化文本(v)
	end
end
function _超级文本:清空()
	self.显示表 = {}
	self.数据表 = {}	
	self.高度 = 0
	self.最大宽度 = 0
	self.数量 = nil
	self.起始值 = 0
	self.目标值 = 0
	self.递增值 = 1
end
function _超级文本:格式化文本(数据)--内部使用

	local 字符表 = 分割字符(数据)
	table.insert(self.数据表,字符表)--备份,用于宽度改变时重新生成
	
	local i,x  = 0,0
	local a,b  = 1 ,1
	local 文本宽,最后文本 = 0,''
	local 字符表数量 = #字符表
	local 一段数据 ={}
	一段数据.颜色 = self.默认颜色
	一段数据.x = x
	local 一行数据 ={}
	一行数据.换行符 = "" --"->"
	一行数据.x = 0
	一行数据.y = self.文字高度
	一行数据.ty = 0
	local 是否已换行 = false

	local 当前字符数量,当前颜色 =0,self.默认颜色
	repeat
		i =i + 1
		::Start::
		if(i ==  字符表数量)then --===============段数据到尾结束
			b = i
			if a<=b then
			    一段数据.文本 = table.concat(字符表,nil,a,b)
			    x = x+#一段数据.文本*self.文字宽度 + self.文字:取宽度(一行数据.换行符)
			else
				x = x + 一段数据.动画:取宽度()
				if 一段数据.动画:取高度() >一行数据.y then
				    一行数据.y = 一段数据.动画:取高度()
				    一行数据.ty =一段数据.动画:取高度() - self.文字高度
				end
			end
			table.insert(一行数据,一段数据)
			if 一行数据.居中 then
			    local 宽度 = 0

			    for i,v in ipairs(一行数据) do

			    	if v.动画 then
			    	    宽度 = 宽度 +v.动画:取宽度()
			    	else
			    		宽度 = 宽度 +#v.文本*self.文字宽度
			    	end
			    end

			    一行数据.x = (self.宽度-宽度)/2
			end
			if x>self.最大宽度 then
			    self.最大宽度 = x
			end
			self.高度 = self.高度 + 一行数据.y+self.行间隔
			table.insert(self.显示表,一行数据)
			
		elseif(x+文本宽 >=self.宽度 )then --============段数据折行结束
			b = i-1
			i= i-1
			if a<=b then
			   一段数据.文本 = table.concat(字符表,nil,a,b)
			   if 最后文本 == 一段数据.文本 then
			       一段数据.文本 = ''
			   end
			   最后文本 = 一段数据.文本
			else
				if 一段数据.动画:取高度() >一行数据.y then
				    一行数据.y = 一段数据.动画:取高度()
				    一行数据.ty =一段数据.动画:取高度() - self.文字高度
				end
			end
			table.insert(一行数据,一段数据)
			self.高度 = self.高度 + 一行数据.y+self.行间隔
			table.insert(self.显示表,一行数据)

			文本宽 = 0
			x = #self.换行符*self.文字宽度
			一段数据 ={}
			一段数据.x = x
			一段数据.颜色 = 当前颜色
			一行数据 ={}
			一行数据.x =0
			一行数据.y = self.文字高度
			一行数据.ty = 0
			一行数据.换行符 = self.换行符
			a=i+1--文本开始点

			self.最大宽度 = self.宽度
		elseif  字符表[i+1] == self.符号 or 一段数据.动画  then --段数据结束
			b = i
			if a<=b then
				一段数据.文本 = table.concat(字符表,nil,a,b)
			   if 最后文本 == 一段数据.文本 then
			       一段数据.文本 = ''
			   end
				最后文本 = 一段数据.文本
			    x = x+#一段数据.文本*self.文字宽度 + self.文字:取宽度(一行数据.换行符)
			else
				x = x + 一段数据.动画:取宽度()
				if 一段数据.动画:取高度() >一行数据.y then
				    一行数据.y = 一段数据.动画:取高度()
				    一行数据.ty =一段数据.动画:取高度() - self.文字高度
				end
			end
			table.insert(一行数据,一段数据)
			文本宽 = 0
			一段数据 ={}
			一段数据.x = x
			一段数据.颜色 = 当前颜色
		elseif(字符表[i] == self.符号)then --self.符号"#"
			if(字符表[i+1]=="_")then -- ===========================下划线
				一段数据.下划线 = true
				i = i+1
				a = i+1 --文本开始点
			elseif(字符表[i+1]=="-")then--=========================删除线
				一段数据.删除线 = true
				i = i+1 
				a = i+1--文本开始点
			elseif(字符表[i+1]=="|")then--=========================居中
				一行数据.居中 = true
				i = i+1 
				a = i+1--文本开始点
			elseif(字符表[i+1]=="+")then--========================背景色
				i = i+1
				a = i+1--文本开始点
				一段数据.背景颜色 =nil
				for k,v in ipairs(self.元素表) do--从元素中查找代号
					b = a+#v[1]-1--文本开始点+代号长度
					if(b>字符表数量)then b=字符表数量 end--菊部排错
					--print(table.concat(字符表,nil,a,b))
					if(table.concat(字符表,nil,a,b) == v[1])then
						if(type(v[2]) == "number")then
							一段数据.背景颜色 = v[2]
						elseif(type(v[2]) == "table")then

						end
						a = b+1--文本开始点
						i = b--文本结束点
						break;
					end
				end
				if(not  一段数据.背景颜色) then  
					error("无法找到背景颜色->"..字符表[a])
				end
			elseif(字符表[i+1]=="@")then--==========================碰撞颜色
				i = i+1
				a = i+1--文本开始点
				一段数据.碰撞颜色 =nil
				for k,v in ipairs(self.元素表) do--从元素中查找代号
					b = a+#v[1]-1--文本开始点+代号长度
					if(b>字符表数量)then b=字符表数量 end--菊部排错
					--print(table.concat(字符表,nil,a,b))
					if(table.concat(字符表,nil,a,b) == v[1])then
						if(type(v[2]) == "number")then
							一段数据.碰撞颜色 = v[2]
						elseif(type(v[2]) == "table")then

						end
						a = b+1--文本开始点
						i = b--文本结束点
						break;
					end
				end
				if(not  一段数据.碰撞颜色) then  
					error("无法找到碰撞颜色->"..字符表[a])
				end
			elseif(字符表[i+1]=="[")then--========================回调代号
				i = i+1 
				a = i+1--文本开始点
				一段数据.回调标识 =nil
				for n=a,字符表数量 do
					if(字符表[n] =="]")then--寻找回调菊部
						一段数据.回调标识 = table.concat(字符表,nil,a,n-1)
						--print(一段数据.回调标识)
						a = n+1--文本开始点
						i = n--文本结束点
						break
					end
				end
				if(not  一段数据.回调标识) then  
					error("无法找到回调标识结束符号->" ..字符表[a])
				end
			elseif(字符表[i+1] == self.符号)then --排除##
				i = i+1
				a = i --文本开始点
			else--==================================================-文字颜色或动画图片
				一段数据.颜色 =nil
				a = i+1
				for k,v in ipairs(self.元素表) do
					b = a + #v[1]-1
					if(b>字符表数量)then b=字符表数量 end
					--print(table.concat(字符表,nil,a,b),v[1])
					if(table.concat(字符表,nil,a,b) == v[1])then
						if(type(v[2]) == "number")then
							一段数据.颜色 = v[2]
							当前颜色 = v[2]
						elseif(type(v[2]) == "table")then
							一段数据.动画 = v[2]
						end
						a = b+1--文本开始点
						i = b--文本结束点
						break;
					end
				end
				
				if(not  一段数据.颜色 and not 一段数据.动画) then
					error( "无法找到颜色或未知符号->" ..字符表[a1])
				end
				if(i==字符表数量 or 一段数据.动画) then goto Start end
			end
		else
			文本宽 = #table.concat(字符表,nil,a,i)*self.文字宽度 + self.文字:取宽度(一行数据.换行符)
		end
	until i >=  字符表数量;
	self.数量 = #self.显示表

	if self.限制高度 and self.高度 > self.限制高度 then--聊天框模式
		self.起始值 = self.数量
		self.目标值 = self:计算可显示()
		self.递增值 = -1
	else
		self.起始值 = 1
		self.目标值 = self.数量
		self.递增值 = 1
	end

end

function _超级文本:计算可显示()--内部使用
	local n,r =0,1
	for i=self.数量,1,-1 do
		n=n+self.显示表[i].y+self.行间隔
		if n>self.限制高度 then
		    r=i+1
		    break
		end
	end
	return r
end
--@说明 如果不更新,超链接就不会生效.
function _超级文本:更新(x,y)
	self.鼠标x,self.鼠标y = x,y
end

function _超级文本:显示(x,y)
	if self.数量 then
		local yy = self.递增值 == -1 and self.限制高度 or 0
		for i=self.起始值,self.目标值,self.递增值 do
			if self.显示表[i] then
				local v = self.显示表[i]
				if self.递增值 == -1 then
					yy = yy  - self.行间隔 - v.y
				elseif i~=self.起始值  then
					yy = yy  + self.行间隔 + self.显示表[i-1].y
				end
				local y = y+yy
				--显示换行符
				if(v.换行符~="")then
					self.文字:置颜色(0xFFFFFFFF):显示(x,y+v.y-self.文字高度,v.换行符)
				end

				for k1,v1 in ipairs(v) do
					if(v1.背景颜色)then
						self.背景:置区域(0,0,self.文字:取宽度(v1.文本),self.文字高度)
						self.背景:置颜色(v1.背景颜色):显示(x+v1.x,y+v.ty)
						--self.背景:取包围盒():显示()
					end

					if(v1.下划线)then
						引擎.画线(x+v1.x  ,y+v.y  ,x+v1.x+self.文字:取宽度(v1.文本)  ,y+v.y,v1.颜色)
					end
					if(v1.删除线)then
						引擎.画线(x+v1.x  ,y+v.y-5  ,x+v1.x+self.文字:取宽度(v1.文本)  ,y+v.y-5,v1.颜色)
					end
					self.文字:置颜色(v1.颜色)
					if(v1.回调标识)then
						self.包围盒:置宽高(self.文字:取宽度(v1.文本),self.文字高度)
						self.包围盒:置坐标(x+v1.x,y+v.ty)
						--self.包围盒:显示()
						if(self.包围盒:检查点(self.鼠标x,self.鼠标y))then
							if(v1.碰撞颜色)then
								self.文字:置颜色(v1.碰撞颜色)
							end
							if(not v1.碰撞)then 
								if self.回调函数表 then
								    self.回调函数(self.回调函数表,"碰撞",v1.回调标识)
								else
									self.回调函数("碰撞",v1.回调标识)
								end
								v1.碰撞 =true 
							end
							if 引擎.鼠标弹起(KEY.LBUTTON)then
								if self.回调函数表 then
								    self.回调函数(self.回调函数表,"左键",v1.回调标识)
								else
									self.回调函数("左键",v1.回调标识)
								end
							elseif 引擎.鼠标弹起(KEY.RBUTTON)then
								if self.回调函数表 then
								    self.回调函数(self.回调函数表,"右键",v1.回调标识)
								else
									self.回调函数("右键",v1.回调标识)
								end
								
							end
							self.鼠标x,self.鼠标y = 0,0
						elseif(v1.碰撞)then
							v1.碰撞 = false
							if self.回调函数表 then
								self.回调函数(self.回调函数表,"取消碰撞",v1.回调标识)
							else
								self.回调函数("取消碰撞",v1.回调标识)
							end
						end
					end

					if v1.动画 then
						v1.动画:显示(x+v1.x+v.x,y+(v.y-v1.动画:取高度()))
					else
						self.文字:显示(x+v1.x+v.x ,y+v.ty ,v1.文本)
					end
				end	--for v
			--else
				--print(i,self.目标值,self.递增值)
			end	--if i	
		end --for all
	end --if 数量
end
return _超级文本