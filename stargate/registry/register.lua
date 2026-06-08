local Storage = require("stargate/registery/storage")

local function register(packet)
    if type(packet.name) ~= "string"
        or type(packet.serverId) ~= "number"
        or type(packet.stargateAddress) ~= "string" then
        return {
            success = false,
            error = "Malformed register packet. Received: "
                .. tostring(packet.name) .. ", "
                .. tostring(packet.serverId) .. ", "
                .. tostring(packet.stargateAddress),
            data = nil
        }
    end

    return Storage.add({
        name = packet.name,
        serverId = packet.serverId,
        stargateAddress = packet.stargateAddress
    })
end

local function list()
    return Storage.listNames() -- This follows same return format as seen above.
end

return {
    register = register,
    list = list,
}
