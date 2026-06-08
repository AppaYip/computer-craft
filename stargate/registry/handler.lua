local Actions = require("stargate/enums_actions")
local Registery = require("stargate/registry/register")

function handle(packet)
    if packet.action == Actions.serverMain.register then
        return Registery.register(packet)
    elseif packet.action == Actions.serverMain.list then
        return Registery.list()
    end

    return {
        success = false,
        error = "Unknown action: "..tostring(packet.action)
    }
end

return { handle = handle }
