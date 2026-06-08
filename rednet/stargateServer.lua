local Phelper = require("peripheral")

local modem = Phelper.findOrWarn("modem", function(n, p)
    return p.isWireless()
end)

if not modem then
    return
end

rednet.open(modem.name)

while true do
    local msg = rednet.receive()
    
end
