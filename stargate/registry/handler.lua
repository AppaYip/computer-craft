local Actions = require("stargate/enums_actions")
local Registry = require("stargate/registry/register")

local function handle(packet)
    if packet.action == Actions.registeryServer.register then
        return Registry.register(packet)
    elseif packet.action == Actions.registeryServer.list then
        return Registry.list()
    end

    return {
        success = false,
        error = "Unknown action: "..tostring(packet.action)
    }
end

return { handle = handle }
