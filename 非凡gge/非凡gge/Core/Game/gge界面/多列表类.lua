--=========================================================================
local 引擎        = require("gge引擎")
local GUI列表类   = require("gge界面/列表类")
local GUI多列表类 = class(require("gge界面/基类"))
--=========================================================================
function GUI多列表类:初始化(标记,x,y,宽度,高度)
    self._px   = x or 0
    self._py   = y or 0
    self._宽度 = 宽度 or 200
    self._高度 = 高度 or 200
    self._类型 = '多列表'
    self._列宽 = 0
    self._列数 = 0
    self._列项 = {}
end
function GUI多列表类:置选中精灵(vv,i)
    if i then
        if self._列项[i] then
            self._列项[i]:置选中精灵(vv)
            return true
        end
    else
        for i,v in ipairs(self._列项) do
            v:置选中精灵(vv)
        end
    end
end
function GUI多列表类:置焦点精灵(...)
    for i,v in ipairs(self._列项) do
        v:置焦点精灵(...)
    end
end
function GUI多列表类:添加列(宽度,名称)
    local 列表 = GUI列表类.创建(名称,self._列宽+self._px,self._py,宽度,self._高度)
        :置坐标(self._列宽+self._x,self._y)
    列表.发送消息     = function (this,t,a,...)
        if self.消息事件 then
            if t == '碰撞事件' then
                if self._焦点行 ~= a then
                    self._焦点行 = a
                    return self:消息事件(t,a,...)
                end
            elseif t == '取消碰撞' then
                if a>0 and self._当前列==this then
                    local x,y = 引擎.取鼠标坐标()
                    for i,v in ipairs(self._列项) do
                        if v:检查点(x,y) then
                            if v:_取当前项(x,y)==a then--如果光标在其它列
                                return
                            else
                                break
                            end
                        end
                    end
                    self._焦点行 = 0
                    return self:消息事件(t,a,...)
                end
            else
                return self:消息事件(t,a,...)
            end
        end
    end
    列表.子显示 = function (this,h,...)
        if self.子显示 then self:子显示(h,this._列位置,...) end
    end
    table.insert(self._列项,列表)
    self._列宽   = self._列宽 + 宽度
    self._列数   = #self._列项
    列表._列位置 = self._列数
    return self
end
function GUI多列表类:添加行(...)
    local id,t = 0,{...}
    for i=1,#t do
        if self._列项[i] then
            if type(t[i]) == 'table' then
                id = self._列项[i]:添加(unpack(t[i]))
            else
                id = self._列项[i]:添加(t[i])
            end
        end
    end
    return id
end
function GUI多列表类:删除行(id)
    for i,v in ipairs(self._列项) do
        v:删除(id)
    end
end
function GUI多列表类:取行数()
    if self._列项[1] then
        return self._列项[1]:取行数()
    end
    return 0
end
function GUI多列表类:取文本(h,l)
    return self._列项[l]:取文本(h)
end
function GUI多列表类:置文本(h,l,t)
    if self._列项[l] then
        self._列项[l]:置文本(h,t)
    end
    return self
end
function GUI多列表类:取选中行()
    return self._列项[1]:取选中行()
end
function GUI多列表类:置行距(...)
    for i,v in ipairs(self._列项) do
        v:置行距(...)
    end
    return self
end
function GUI多列表类:置居中(l,...)
    if l>0 then
        self._列项[l]:置居中(...)
    else
        for i,v in ipairs(self._列项) do
            v:置居中(...)
        end
    end
    return self
end
-- function GUI多列表类:置行距(l,...)
--     if l>0 then
--         self._列项[l]:置行距(...)
--     else
--         for i,v in ipairs(self._列项) do
--             v:置行距(...)
--         end
--     end
-- end
function GUI多列表类:置颜色(h,l,...)
    if l>0 then
        self._列项[l]:置颜色(h,...)
    else
        for i,v in ipairs(self._列项) do
            v:置颜色(h,...)
        end
    end
    return self
end
function GUI多列表类:置偏移(...)
    for i,v in ipairs(self._列项) do
        v:置偏移(...)
    end
    return self
end
function GUI多列表类:置选中行(...)
    for i,v in ipairs(self._列项) do
        v:置选中行(...)
    end
    return self
end
function GUI多列表类:清空()
    for i,v in ipairs(self._列项) do
        v:清空()
    end
    return self
end
function GUI多列表类:清空列()
    self._列宽 = 0
    self._列数 = 0
    self._列项 = {}
    return self
end
function GUI多列表类:滚动百分比(vv)
    local r
    for i,v in ipairs(self._列项) do
        r = v:滚动百分比(vv)
    end
    return r
end
function GUI多列表类:关联滑块(v)
    v:置关联(self)
    self._关联 = v
    return self
end
-- function GUI多列表类:_子显示(...)
--  if self.子显示 then self:子显示(...) end
-- end
function GUI多列表类:_显示()
    for i,v in ipairs(self._列项) do
        if self._调试 then v._包围盒:显示() end
        v:_显示()
    end
    if self._调试 then self._包围盒:显示(0xFFFFFF00) end
end
function GUI多列表类:_消息事件(类型,...)
    if self:发送消息("消息事件",类型,...) then
        return true
    end
    if 类型 == '窗口移动' then
        local x,y = unpack(...)
        self._x,self._y = x+self._px,y+self._py
        self._包围盒:置坐标(self._x,self._y)
    end
    local r
    for i,v in ipairs(self._列项) do
        r = v:_消息事件(类型,...)
        if 类型 ~= '窗口移动' and v:检查点(引擎.取鼠标坐标()) then
            self._当前列 = v
            for ii,vv in ipairs(self._列项) do
                vv:_置同步(v)
            end
            break
        elseif r then
            return true
        end
    end
    return r
end

return GUI多列表类