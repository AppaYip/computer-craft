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

local gate = Phelper.findOrWarn("stargate", function(n, p)
    return type(p.stargateState) == "function"
end)

if not gate then return end

local config = GateConfig.loadOrSetup(gate.peripheral)

print("Loaded gate: ")
print(config.gateName)
print(config.address)

rednet.open(modem.name)

while true do
    local id, packet = rednet.receive(Protocols.global.stargate)

    print("Recieved packet from: " .. id)
    print("Packet: " .. textutils.serialise(packet))

    local ok, response = pcall(
        PacketHandler.handle,
        packet,
        gate.peripheral
    )
    if not ok then
        response = {
            success = false,
            error = "Internal Server Error: " .. tostring(response)
        }
    end

    rednet.send(id, response, Protocols.global.stargate)
end
