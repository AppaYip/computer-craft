local Actions = require("stargate/enums_actions")
local Controller = require("stargate/server/gateController")

local function success(data)
    return {
        success = true,
        error = nil,
        data = data
    }
end


local function failure(error)
    return {
        success = false,
        error = error,
        data = nil
    }
end


local function ping(packet, gate)
    return success(nil)
end


local function status(packet, gate)
    local info = Controller.getStatus(gate)
    return success(info)
end


local function dial(packet, gate)
    local ok, error = Controller.dial(
        gate,
        packet.address
    )

    if not ok then
        return failure(error)
    end

    return success(nil)
end

local function disconnect(packet, gate)
    Controller.disconnect(gate)
    return success(nil)
end


local handlers = {
    [Actions.gateServer.ping] = ping,
    [Actions.gateServer.status] = status,
    [Actions.gateServer.dial] = dial,
    [Actions.gateServer.disconnect] = disconnect
}

local function handle(packet, gate)
    if type(packet) ~= "table" then
        return failure("Malformed Packet. Expected a table, recieved: ".. tostring(packet))
    end

    local handler = handlers[packet.action]
    
    if not handler then 
        return failure(
            "Malformed Packet. Unknown action:" .. tostring(packet.action)
        )
    end
    
    return handler(packet, gate)
end

return {
    handle = handle
}
