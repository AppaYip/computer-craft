dofile("helpers/require.lua")

local Phelper = require("helpers/peripheral")
local Protocols = require("stargate/enums_protocols")
local Handler = require("stargate/registry/handler")

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

    print("Recieved packet from " .. id)
    print(textutils.serialise(packet))

    local ok, result = pcall(Handler.handle, packet)
    if not ok then
        rednet.send(id, {
            success = false,
            error = "Internal Server Error! Please contact Appa",
            data = nil
        })
    end

    rednet.send(id, result)
end
