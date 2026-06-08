local function dial(gate, address)
    if gate.stargateState() ~= "Idle" then
        return false, "Gate busy."
    end

    gate.disconnect()
    gate.openIris()

    local ok, error = pcall(function ()
        gate.dial(address)
    end)

    if not ok then
        return false, error
    end

    return true
end


local function disconnect(gate)
    gate.disconnect()
    return true
end

local function getStatus(gate)
    return {
        state = gate.stargateState(),
        iris = gate.irisState(),
        energy = gate.energyAvailable(),
        address = gate.remoteAddress()
    }
end

return {
    dial = dial,
    disconnect = disconnect,
    getStatus = getStatus
}
