--======================================================================--
-- @作者: GGE研究群: 342119466
-- @创建时间:   2018-03-03 02:34:19
-- @Last Modified time: 2019-01-30 20:19:38
--======================================================================--
local 系统类_技能格子 = class()

function 系统类_技能格子:初始化(x,y,ID,注释)
	self.x = x
	self.y = y
	self.ID = ID
	self.注释 = 注释
	self.技能 = nil
	self.小模型 = nil
	self.模型 = nil
	self.事件 = false
	self.焦点 = false
end

function 系统类_技能格子:置技能(技能,小模型,模型)
	if 技能 ~= nil then
		if 技能.名称 ~= nil then
			self.技能 = 技能
			self.技能.模型=模型
			if 小模型 ~= nil then
				self.技能.小模型 = nil
			end
		end
	else
		self.技能 = nil
	end
end

function 系统类_技能格子:显示(x,y,条件)
	if self.技能 ~= nil then
		self.事件 = false
		self.焦点 = false
		if 引擎.场景.正在移动窗口 == false then
			if self.技能.模型:是否选中(x,y) and 条件 == true then
				引擎.场景.按钮焦点 = true
				引擎.场景.禁止关闭 = true
				self.焦点 = true
				self.技能.模型:置高亮()
				if 引擎.鼠标弹起(0) then
					self.事件 = true
				end
			else
				self.技能.模型:取消高亮()
			end
		end
		self.技能.模型:显示(self.x,self.y)
	end
end

function 系统类_技能格子:置坐标(x,y)
	self.x = x
	self.y = y
end

return 系统类_技能格子