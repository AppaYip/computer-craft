local Phelper = require("peripheral")
local Protocols = require("enums_protocols")

local servername = "Stargate_main"

local modem = Phelper.findOrWarn("modem", function(n, p)
    return p.isWireless()
end)

if not modem then
    return
end

rednet.open(modem.name)
rednet.host(Protocols.global.stargate, servername)

print("Stargate Server Started!")
print("Listening for lookups at: "..servername)
print("Listening on protocol: "..Protocols.global.stargate)

while true do
    local id, packet = rednet.receive(Protocols.global.stargate)

    local result = handler.handle(packet)

    rednet.send(id, result)
end
