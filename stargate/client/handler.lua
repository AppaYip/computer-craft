local Protocols = require("stargate.enums_protocols")

local function fetchStargates()
    rednet.broadcast({
        action = "list",
    }, Protocols.global.stargate)
end


return {
    fetchStargates = fetchStargates,
}
