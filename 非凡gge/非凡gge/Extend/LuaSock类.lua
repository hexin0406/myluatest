--@DLL名称 socket.dll
--======================================================================--
--该 文件由GGELUA创建
--
--作者：baidwwy  创建日期：2014-06-23 00:13:26
--======================================================================--
require("socket.core")
local _socket = socket
socket = nil
local LuaSocket = class()


function LuaSocket:初始化()
	self.sock = _socket.tcp()
	self.client = {}
	self.conn = 0
end


function LuaSocket:更新(dt)
	if self.type == 1 then
		local client = self.sock:accept()
		if client then
			self.conn = self.conn+1
			self.client[self.conn] = client
			self.client[self.conn]:settimeout(0)
			if self.连接进入 then self.连接进入(self.conn) end
		end
	  	for i, client in pairs(self.client) do
	        local recvt, sendt, status = _socket.select({client}, nil, 0)
	        if #recvt > 0 then
	            local data,status,data2 = client:receive()
	            if status ~= "closed" then
	                if data or data2 then
	                    if self.数据到达 then self.数据到达(i,data or data2) end
	                end
	            else
	                table.remove(self.client, i) 
	                client:close() 
	                if self.连接断开 then self.连接断开(i) end
	            end
	        end      
	    end
	elseif self.type == 0 then
		local recvt, sendt, status = _socket.select({self.sock}, nil, 0)
		 if #recvt > 0 then
			local data,status,data2 = self.sock:receive()
	        if status ~= "closed" then
	            if data or data2 then
	                if self.数据到达 then self.数据到达(data or data2) end
	            end
	        else
	        	if self.连接断开 then self.连接断开() end
	        	self.sock:close()
	        	self.type = nil
	        end
		end
	end	


end
function LuaSocket:发送(id,t)
	if self.type == 1 then
	    return self.client[id]:send(t.."\r\n")
	else
		return self.sock:send(id.."\r\n")
	end
end
function LuaSocket:绑定(地址,端口,连接数)
	--self.sock:setoption("reuseaddr", true)
	self.type = 1
	local res, err = self.sock:bind(地址,端口)
	if not res then return nil end
	res, err = self.sock:listen(连接数)
	if res then
	    self.sock:settimeout(0)
	end
	return res==1
end
function LuaSocket:连接(地址,端口)
	self.type = 0
	local res, err = self.sock:connect(地址,端口)
	if res then
	    self.sock:settimeout(0)
	end
	return res==1
end
function LuaSocket:关闭()
	return self.sock:close()
end
function LuaSocket:取连接信息()
	--self.sock:getpeername(),
	return self.sock:getsockname()
end
function LuaSocket:取连接数()
	return #self.client
end
function LuaSocket:置数据到达(v)
	self.数据到达 = v
end
function LuaSocket:置连接断开(v)
	self.连接断开 = v
end
function LuaSocket:置连接进入(v)
	self.连接进入 = v
end
return LuaSocket