dofile("helpers/require.lua")

local Handler = require("stargate/client/handler")


local Phelper = require("helpers/peripheral")
local modem = Phelper.findOrWarn("modem", function(n, p)
    return p.isWireless()
end)
if not modem then return end

rednet.open(modem.name)


while True do

end
