--======================================================================--
--======================================================================--
local __astart = require "astart"

--======================================================================--
local Astart = class()

--@参数 坐标宽度,坐标高度,文件路径(可空),文件大小(如果文件参数为指针)
function Astart:初始化(宽度,高度,文件,大小)
	self.宽度 	= 宽度
	self.高度 	= 高度
    self.开放表={}
 -- print(宽度,高度,文件,大小,99)
  for n=1,self.宽度 do

    for i=1,self.高度 do


     self.开放表[#self.开放表+1]={x=n,y=i,移除=false}


       end


     end
  --print(宽度,高度,文件,大小,11)
  -- print(#self.开放表,999)


	self.as 	= __astart(宽度,高度,文件 or "",大小 or 0)

	local t = getmetatable(self)
	t.__tostring = function (a,b)

  --设置开放表



		return "Astart"

	end
end
--@返回 返回指定坐标的状态
function Astart:检查点(x,y)

	--print(x,y)
	if x >= self.宽度 or x <=0 then
	    return false
	end
	if y >= self.高度 or y <=0  then
	    return false
	end
	return self.as:CheckPoint(x,y)
end
--@说明 设置指定坐标的状态
function Astart:置状态(x,y,v)
	if x>0 and x<=self.宽度 and y>0 and y<=self.高度 then
	    self.as:SetPoint(x,y,v)
	end
end
--@参数 当前XY,目标XY
--@返回 返回查找到的路径表(2层为{x=xx,y=xx})
function Astart:xyza(x,y)
 for n=1,#self.通行表 do



   if self.通行表[n].x==x and self.通行表[n].y==y then

      return n


     end



    end

 return 0

 end
function Astart:取移动路径(中心点,目标点)

-- print(中心点,目标点)

 --向上起步
 self.重复路径={[1]={},[2]={},[3]={},[4]={},[5]={},[6]={},[7]={},[8]={}}
 self.上={[1]={x=self.通行表[中心点].x,y=self.通行表[中心点].y}}

 self.停止寻找=false
 while(self.停止寻找==false) do
   --计算出上四个方向与目标点的距离
   self.距离和={}
    self.临时移动表={
   [1]={x=self.上[#self.上].x,y=self.上[#self.上].y-1}  --上
  ,[2]={x=self.上[#self.上].x,y=self.上[#self.上].y+1}  --下
  ,[3]={x=self.上[#self.上].x-1,y=self.上[#self.上].y}  --左
  ,[4]={x=self.上[#self.上].x+1,y=self.上[#self.上].y}  --右
 -- ,[5]={x=self.上[#self.上].x-1,y=self.上[#self.上].y-1}  --左上
  -- ,[6]={x=self.上[#self.上].x-1,y=self.上[#self.上].y+1}  --左下
  -- ,[7]={x=self.上[#self.上].x+1,y=self.上[#self.上].y-1}  --左上
  -- ,[8]={x=self.上[#self.上].x+1,y=self.上[#self.上].y+1}  --左下

 }
  for n=1,4 do

     if self:检查点(self.临时移动表[n].x,self.临时移动表[n].y) then  --表示可通行

       --计算有误重复路径
       self.距离和[n]=取两点距离a(self.临时移动表[n].x,self.临时移动表[n].y,self.通行表[目标点].x,self.通行表[目标点].y)
       print("比对序号"..n)

        for i=1,#self.重复路径[n] do
         print(self.重复路径[n][i].x,self.临时移动表[n].x,self.重复路径[n][i].y,self.临时移动表[n].y,self.通行表[目标点].x,self.通行表[目标点].y )
         if self.重复路径[n][i].x==self.临时移动表[n].x and self.重复路径[n][i].y==self.临时移动表[n].y then

             self.距离和[n]=0
             print("重复的路径")

           end


          end

         self.重复路径[n][#self.重复路径[n]+1]={x=self.临时移动表[n].x,y=self.临时移动表[n].y}



      else
        self.距离和[n]=0
        print("不可通行的路径")


       end


     end
     table.print(self.距离和)
   self.最终路径=取数组最小值(self.距离和,0)
   if self.最终路径==0 then --找不到可用路径 寻路结束
      self.停止寻找=true
      print("找不到可用路径")
      --self.上={}

    else

      self.上[#self.上+1]={x=self.临时移动表[self.最终路径].x,y=self.临时移动表[self.最终路径].y}
      if  self.临时移动表[self.最终路径].x==self.通行表[目标点].x and self.临时移动表[self.最终路径].y==self.通行表[目标点].y then


         self.停止寻找=true
         print("到达目的")

        end



     end







end
table.print(self.上)

 print(#self.上,99)

  end
function Astart:取路径(x,y,x1,y1)

  --检查表
  self.中心点=0
  self.目标点=0
  self.通行表={}
  for n=1,#self.开放表 do

   if self:检查点(self.开放表[n].x,self.开放表[n].y)==false then

      self.开放表[n].移除=true

    else

      self.通行表[#self.通行表+1]={x=self.开放表[n].x,y=self.开放表[n].y}

     end

   if self.开放表[n].x==x and self.开放表[n].y==y then

      self.中心点=#self.通行表

    elseif self.开放表[n].x==x1 and self.开放表[n].y==y1 then
      self.目标点=#self.通行表


     end



    end




 --self.最优路径=self:取移动路径(self.中心点,self.目标点)
 --if 1==1 then return self.上 end

	if 1==1 then return self.as:GetPath(x,y,x1,y1) end

	self.路径1=self.as:GetPath(x,y,x1,y1)
	self.路径2={}
	self.中断节点=0
	self.更改节点=2
	for n=1,#self.路径1 do

     if n>self.中断节点 then --小于则表明该点已经重新生成

         if n+3<#self.路径1 then

               self.中间格子=n+1
               self.终点格子=n+2
               self.目标格子=n+3
               self.临时角度=取两点角度a(self.路径1[n].x*20,self.路径1[n].y*20,self.路径1[self.中间格子].x*20,self.路径1[self.中间格子].y*20)
               self.临时方向=角度算方向(self.临时角度)
               self.临时角度=取两点角度a(self.路径1[n].x*20,self.路径1[n].y*20,self.路径1[self.终点格子].x*20,self.路径1[self.终点格子].y*20)
               self.临时方向1=角度算方向(self.临时角度)
               self.临时角度=取两点角度a(self.路径1[n].x*20,self.路径1[n].y*20,self.路径1[self.目标格子].x*20,self.路径1[self.目标格子].y*20)
               self.临时方向2=角度算方向(self.临时角度)

               if self.临时方向2~=self.临时方向 and self.临时方向2==self.临时方向1 then

                  self.临时路径=self.as:GetPath(self.路径1[n].x*20,self.路径1[n].y*20,self.路径1[self.目标格子].x*20,self.路径1[self.目标格子].y*20)
                  self.路径2[#self.路径2+1]=self.路径1[n]

                  for i=1,#self.临时路径 do

                      self.路径2[#self.路径2+1]=self.临时路径[i]

                  	 end

                   self.中断节点=n+4

                else

                 self.路径2[#self.路径2+1]=self.路径1[n]


               	 end

            else

             self.路径2[#self.路径2+1]=self.路径1[n]



             end





     	 end


	 end


	 return self.路径2
end


function Astart:取路径1(x,y,x1,y1)

  if 1==1 then return self.as:GetPath(x,y,x1,y1) end

  self.路径1=self.as:GetPath(x,y,x1,y1)
  self.路径2={}
  self.中断节点=0
  self.更改节点=2
  for n=1,#self.路径1 do

     if n>self.中断节点 then --小于则表明该点已经重新生成

         if n+3<#self.路径1 then

               self.中间格子=n+1
               self.终点格子=n+2
               self.目标格子=n+3
               self.临时角度=取两点角度a(self.路径1[n].x*20,self.路径1[n].y*20,self.路径1[self.中间格子].x*20,self.路径1[self.中间格子].y*20)
               self.临时方向=角度算方向(self.临时角度)
               self.临时角度=取两点角度a(self.路径1[n].x*20,self.路径1[n].y*20,self.路径1[self.终点格子].x*20,self.路径1[self.终点格子].y*20)
               self.临时方向1=角度算方向(self.临时角度)
               self.临时角度=取两点角度a(self.路径1[n].x*20,self.路径1[n].y*20,self.路径1[self.目标格子].x*20,self.路径1[self.目标格子].y*20)
               self.临时方向2=角度算方向(self.临时角度)

               if self.临时方向2~=self.临时方向 and self.临时方向2==self.临时方向1 then

                  self.临时路径=self.as:GetPath(self.路径1[n].x*20,self.路径1[n].y*20,self.路径1[self.目标格子].x*20,self.路径1[self.目标格子].y*20)
                  self.路径2[#self.路径2+1]=self.路径1[n]

                  for i=1,#self.临时路径 do

                      self.路径2[#self.路径2+1]=self.临时路径[i]

                     end

                   self.中断节点=n+4

                else

                 self.路径2[#self.路径2+1]=self.路径1[n]


                 end

            else

             self.路径2[#self.路径2+1]=self.路径1[n]



             end





       end


   end


   return self.路径2
end









function Astart:取随机点()

	self.随机点={x=取随机数(1,self.宽度),y=取随机数(1,self.高度)}

	while(self:检查点(self.随机点.x,self.随机点.y))==false do
        self.随机点={x=取随机数(1,self.宽度),y=取随机数(1,self.高度)}
     end
     --print(self:检查点(self.随机点.x,self.随机点.y))
     return self.随机点
end
return Astart