dofile("helpers/require.lua")

local Phelper = require("helpers/peripheral")
local Protocols = require("stargate/enums_protocols")
local GateConfig = require("stargate/server/gateConfig")
local PacketHandler = require("stargate/server/packetHandler")

-- Check For Components
local modem = Phelper.findOrWarn("modem", function(n, p)
    return p.isWireless()
end)

if not modem then return end

local gate = Phelper.findOrWarn("stargate", function (n,p)
    return true
end)

if not gate then return end

local config = GateConfig.loadOrSetup(gate)

print("Loaded gate: ")
print(config.gateName)
print(config.address)

rednet.open(modem.name)

while true do
    local id, packet = rednet.receive(Protocols.global.stargate)

    print("Recieved packet from: " .. id)
    print("Packet: " .. table.serialise(packet))

    return PacketHandler.handle(packet, gate)
end
