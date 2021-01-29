游戏提示类 = class()


function 游戏提示类:初始化()
self.背景={}

self.提示文本={}
self.提示时间={}

self.提示总数=0
self.角色相关字体=文字类("C:/Windows/Fonts/simsun.ttc",14)
self.超丰富文本=require("丰富文本类")(370,100)
self.超丰富文本:添加元素("w",0xFFFFFFFF)
self.超丰富文本:添加元素("h",0xFF000000)
self.超丰富文本:添加元素("y",0xFFFFFF00)
self.超丰富文本:添加元素("r",0xFFFF0000)
self.超丰富文本:添加元素("g",0xFF00FF00)
self.是否清空=false
self.字符大小=0



for n=1,9 do


	 self.背景[n]=图像类("imge/006/"..n..".png")





	 end

end


function 游戏提示类:更新(dt)

end

function 游戏提示类:加入提示(q)
 --print(q)
   self.提示总数=self.提示总数+1

   self.提示文本[self.提示总数]=q

  self.提示时间[self.提示总数]=引擎:取时间戳()


end




function 游戏提示类:显示(q,w,e,x,y)

if(q==1)then --游戏内的系统提示
       self.超丰富文本:清空()
       for a=1,self.提示总数 do

            if(self.提示文本[a]~=nil)then

		       self.超丰富文本:添加文本(self.提示文本[a])
		   end


       	  end
	   self.是否清空=true
	   self.临时高度=0

	    for a=1,self.提示总数 do
	         w=50

		     e=1
		     x=10

		     if(self.提示文本[a]~=nil)then
		       self.是否清空=false
		       self.临时长度=string.len(self.提示文本[a])
		       e=1
		       --self.超丰富文本:添加文本(self.提示文本[a])

			  y=50-(self.临时高度*23)
                   --y=200+(self.临时高度*15)
			 --x=150+(self.临时高度*20)

			  self.临时高度=self.临时高度+1

			   self.背景[1]:显示(x,y)

	               self.背景[2]:显示(x+(w+1)*8,y)
	               self.背景[3]:显示(x,y+(e+1)*8)
	               self.背景[4]:显示(x+(w+1)*8,y+(e+1)*8)

			  for n=1,w do

	                    self.背景[5]:显示(x+n*8,y)
	                    self.背景[6]:显示(x+n*8,y+(e+1)*8)

	                   end

			  for n=1,e do


	                    self.背景[7]:显示(x,y+n*8)
	                    self.背景[8]:显示(x+(w+1)*8,y+n*8)

		              for i=1,w do


	                         self.背景[9]:显示(x+i*8,y+n*8)


	                          end


	                   end

			 --丰富文本_显示(self.角色相关字体,x+20,y+2,self.提示文本[a],false ,鼠标.x,鼠标.y,对白处理)


			 self.超丰富文本:清空(x+20,y+2)
			  if(self.提示文本[a]~=nil)then

		          self.超丰富文本:添加文本(self.提示文本[a])
		           self.超丰富文本:显示(x+20,y+4+e)

		         end

			    if(引擎:取时间戳()-self.提示时间[a]>=3000)then

				    self.提示文本[a]=nil







				    end



			   end




		 end



	   if(self.是否清空)then

		  self.提示总数=0



		 end




	else    --其它类型的提示

	 self.背景[1]:显示(x,y)

	 self.背景[2]:显示(x+(w+1)*8,y)
	 self.背景[3]:显示(x,y+(e+1)*8)
	 self.背景[4]:显示(x+(w+1)*8,y+(e+1)*8)

	 for n=1,w do

	       self.背景[5]:显示(x+n*8,y)
	        self.背景[6]:显示(x+n*8,y+(e+1)*8)

	       end

	 for n=1,e do


	       self.背景[7]:显示(x,y+n*8)
	        self.背景[8]:显示(x+(w+1)*8,y+n*8)

		    for i=1,w do


	              self.背景[9]:显示(x+i*8,y+n*8)


	              end


	       end








	 end




end

return  游戏提示类