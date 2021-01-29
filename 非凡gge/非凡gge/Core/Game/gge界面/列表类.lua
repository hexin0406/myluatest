--=========================================================================
local GUI列表类 = class(require("gge界面/基类"))

function GUI列表类:初始化(标记,x,y,宽度,高度)
    self._内容         = {}
    self._选中行       = 0
    self._焦点行       = 0
    self._选中时间     = 0 --双击
    self._文字         = require("gge文字类")()
    self._文字高度     = self._文字:取高度()

    self._px           = x or 0
    self._py           = y or 0
    self._宽度         = 宽度 or 200
    self._高度         = 高度 or 200
    self._类型         = '列表'
    self._行距         = 1
    self._行高度       = self._文字高度 + self._行距 -- 一行占用高度
    self._选中精灵     = require("gge精灵类")(0,0,0,self._宽度,self._文字高度):置颜色(0x80808080)
    self._焦点精灵     = require("gge精灵类")(0,0,0,self._宽度,self._文字高度):置颜色(0x80008000)
    self._可显示数     = math.floor(self._高度 /self._行高度 ) -- 最多可显示数量
    self._起始显示     = 1 --滚动后,起始显示的位置
    self._包围盒:置宽高(self._宽度,self._高度)
    self._选中精灵可见 = false
    self._焦点精灵可见 = false
    self._显示数       = 0
end
function GUI列表类:置宽高(w,h)
    self._宽度     = w or self._宽度
    self._高度     = h or self._高度
    self._可显示数 = math.floor(self._高度 /self._行高度 ) -- 最多可显示数量
    self._显示数   = self._可显示数
    self._选中精灵:置区域(0,0,self._宽度)
    self._焦点精灵:置区域(0,0,self._宽度)
    self._包围盒:置宽高(self._宽度,self._高度)
    return self
end
function GUI列表类:取选中精灵()
    return self._选中精灵
end
function GUI列表类:取焦点精灵()
    return self._焦点精灵
end
function GUI列表类:置选中精灵(v)
    self._选中精灵 = v
end
function GUI列表类:置焦点精灵(v)
    self._焦点精灵 = v
end
function GUI列表类:置行距(v)
    self._行距     = v
    self._行高度   = self._文字高度 + self._行距 -- 一行占用高度
    self._可显示数 = math.floor(self._高度 /self._行高度 ) -- 最多可显示数量
    return self
end
function GUI列表类:置居中(v)
    self._居中     = v
end
function GUI列表类:置颜色(i,颜色)
    if self._内容[i] then
        self._内容[i].颜色 = 颜色
    end
end
function GUI列表类:置内容(i,内容)
    if self._内容[i] and type(内容)=='table' and 内容.列表 =="true" then
        self._内容[i] = 内容
        if self._居中 then
            self._内容[i].居中 = math.floor((self._宽度-self._文字:取宽度(self._内容[i].内容))/2)
        end
    end
    return self
end
function GUI列表类:置文本(i,文本)
    if self._内容[i] then
        self._内容[i].内容 = 文本
        if self._居中 then
            self._内容[i].居中 = math.floor((self._宽度-self._文字:取宽度(self._内容[i].内容))/2)
        end
    end
    return self
end
function GUI列表类:置附加(i,附加)
    if self._内容[i] then
        self._内容[i].附加 = 附加
    end
end
function GUI列表类:置文字(v)
    self._文字     = v
    self._文字高度 = self._文字:取高度()
    self._行高度   = self._文字高度 + self._行距
end
function GUI列表类:置偏移(i,x,y)--鼠标按下效果
    if self._内容[i] then
        self._内容[i].x = x or 0
        self._内容[i].y = y or 0
    end
end
function GUI列表类:添加(内容,颜色,附加,x,y)
    local t = {}
    t.颜色  = 颜色 or 0xFFFFFFFF
    t.内容  = 内容 or ''
    t.附加  = 附加
    t.居中  = 0
    t.x     = x or 0
    t.y     = y or 0
    t.列表  = "true"
    if self._居中 then
        t.居中 = math.floor((self._宽度-self._文字:取宽度(t.内容))/2)
    end
    table.insert(self._内容,t)
    self._显示数 = #self._内容
    if self._显示数 > self._可显示数 then self._显示数 = self._可显示数 end
    return #self._内容
end
function GUI列表类:添加内容(内容)
    if type(内容)=='table' and 内容.列表 =="true" then
        if self._居中 then
            内容.居中 = math.floor((self._宽度-self._文字:取宽度(内容.内容))/2)
        end
        table.insert(self._内容,内容)
        self._显示数 = #self._内容
        if self._显示数 > self._可显示数 then self._显示数 = self._可显示数 end
    end
    return #self._内容
end
function GUI列表类:删除(i)
    if self._显示数 > 0 then
        table.remove(self._内容,i)
        self._显示数 = #self._内容
        if self._显示数 == 0 then
            self:清空()
            return
        end
        if i > self._显示数 then self:置选中行(self._显示数) end
        if self._显示数 > self._可显示数 then self._显示数 = self._可显示数 end
        if self._起始显示+self._可显示数>#self._内容 then--末尾
            self._起始显示 = self._起始显示 -1
            self:_更新位置()
        end
        self:发送消息("选中项目",self._选中行)
    end
end
function GUI列表类:取内容(i)
    return self._内容[i]
end
function GUI列表类:取文本(i)
    return self._内容[i] and self._内容[i].内容
end
function GUI列表类:取颜色(i)
    return self._内容[i] and self._内容[i].颜色
end
function GUI列表类:取附加(i)
    return self._内容[i] and self._内容[i].附加
end
function GUI列表类:取行数()
    return #self._内容
end
function GUI列表类:清空()
    self._内容         = {}
    self._显示数       = 0
    self._选中行       = 0
    self._焦点行       = 0
    self._起始显示     = 1
    self._选中精灵可见 = false
    self._焦点精灵可见 = false
end
function GUI列表类:遍历显示行()
    local 起始 = self._起始显示-1
    local 目标 = self._起始显示+self._显示数-1
    return function ()
        if 起始<目标 then
            起始=起始+1
            return 起始
        end
    end
end
function GUI列表类:_显示(x,y)
    if self._选中精灵可见 then self._选中精灵:显示(self._x,self._y) end
    if self._焦点精灵可见 then self._焦点精灵:显示(self._x,self._y) end

    --for i=self._起始显示,self._起始显示+self._显示数-1 do
    for i in self:遍历显示行() do
        if self._内容[i] then
            x = self._x+self._内容[i].x+self._内容[i].居中
            y = self._y+self._内容[i].y+(i-self._起始显示)*self._行高度
            self._文字:置颜色(self._内容[i].颜色):显示(x,y,self._内容[i].内容)
            if self.子显示 then self:子显示(i,x,y) end
        end
    end
    if self._调试 then self._包围盒:显示() end
end
function GUI列表类:滚动百分比(v)
    if #self._内容>self._可显示数 then
        self._起始显示 = math.floor(v/100*(#self._内容-self._可显示数+1))
        self:_更新位置()
        return true
    end
end
function GUI列表类:关联滑块(v)
    v:置关联(self)
    self._关联 = v
end
function GUI列表类:_置同步(列表)--多列表
    self._焦点精灵可见 = 列表._焦点精灵可见
    self._选中精灵可见 = 列表._选中精灵可见
    self._起始显示     = 列表._起始显示
    self._选中行       = 列表._选中行
    self._焦点精灵:置中心(列表._焦点精灵:取中心())
    self._选中精灵:置中心(列表._选中精灵:取中心())
end
function GUI列表类:取选中行()
    return self._选中行
end
function GUI列表类:取焦点行()
    return self._焦点行
end
function GUI列表类:取起始行()
    return self._起始显示
end
function GUI列表类:置选中行(i)
    if self._内容[i] then
        if i<self._起始显示 or i>self._起始显示+self._可显示数 then
            self._起始显示 = i
        end
        self._选中行 = i
        self:_更新位置()
    end
end
function GUI列表类:_取当前项(x,y)
    --local x,y = 引擎.取鼠标坐标()
    if self:检查点(x,y) then
        local i = math.ceil((y-self._y)/self._行高度)
        if self._内容[i] and i <= self._显示数 then
            return i
        end
    end
end
function GUI列表类:_更新位置()
    if self._起始显示 >#self._内容-self._可显示数 then
        self._起始显示 = #self._内容-self._可显示数 + 1
    end
    if self._起始显示 <1 then
        self._起始显示 = 1
    end
    if self._选中行 >= self._起始显示 and self._选中行 < self._起始显示+self._可显示数 then
        self._选中精灵可见 = true
        self._选中精灵:置中心(0,-(self._选中行-self._起始显示)*self._行高度)
    else
        self._选中精灵可见 = false
    end
    self:发送消息("位置改变",self._起始显示)
end
function GUI列表类:_消息事件(类型,参数)
    if self:发送消息("消息事件",类型,参数) then
        return true
    end
    local x,y,滚动值 = unpack(参数)
    if 类型 == '窗口移动' then
        self._x,self._y = x+self._px,y+self._py
        self._包围盒:置坐标(self._x,self._y)
    elseif 类型 ==  '鼠标移动' then
        if not 参数.左键按住 and not 参数.碰撞 and self:检查点(x,y) then
            local i = self:_取当前项(x,y)
            if i then
                if self._焦点行 ~= (i+self._起始显示-1) then
                    self._焦点行 = i+self._起始显示-1
                    self._焦点精灵可见 = true
                    y = (i-1)*self._行高度
                    self._焦点精灵:置中心(0,-y)
                    self:_子消息事件("碰撞事件",self._焦点行,self._x,self._y+y)
                    self:发送消息("碰撞事件",self._焦点行,self._x,self._y+y)
                end
                return true
            end
        end
        if self._焦点精灵可见 then
            self:发送消息('取消碰撞',self._焦点行)
            self._焦点精灵可见 = false
            self._焦点行 = 0
        end
    elseif 类型 ==  '左键按下' then
        if self:检查点(x,y) then
            self:发送消息(类型,x,y)
            local i = self:_取当前项(x,y)
            --self._选中精灵可见 = false
            if i then
                self._选中精灵可见 = true
                if os.clock()-self._选中时间<0.4 and self._选中行==i+self._起始显示-1 then
                    self:_子消息事件("双击项目",self._选中行)
                    self:发送消息("双击项目",self._选中行)
                else
                    self._选中时间 = os.clock()
                    self._选中行 = i+self._起始显示-1

                    self._选中精灵:置中心(0,-(i-1)*self._行高度)
                    self:_子消息事件("选中项目",self._选中行)
                    self:发送消息("选中项目",self._选中行)
                end
            end
            return true
        end
    elseif 类型 ==  '左键弹起' then
        --self:发送消息(类型,x,y)
        if self:检查点(x,y) then
            local i = self:_取当前项(x,y)
            if i then
                self:发送消息(类型,x,y,self._选中行)
            end
            return true
        end
    elseif 类型 == '鼠标滚动' then
        if self:检查点(x,y) then
            if #self._内容 > self._可显示数 and 滚动值~=0 then
                self._起始显示 = self._起始显示 - 滚动值
                self:_更新位置()
                if self._关联 then
                    self._关联:置位置(math.floor(self._起始显示/(#self._内容-self._可显示数)*100),true)
                end
            end
            return true
        end
    elseif 类型 ==  '右键按下' or 类型 ==  '右键弹起' then
        if self:检查点(x,y) then
            self:发送消息(类型,x,y,self._焦点行)
            return true
        end
    else
        return self:发送消息(类型,unpack(参数))
    end
end

return GUI列表类