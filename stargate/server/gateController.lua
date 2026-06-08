local function dial(gate, address)
    if gate.stargateState() ~= "Idle" then
        return false, "Gate busy."
    end

    gate.disconnect()
    gate.openIris()

    gate.dial(address)

    return true
end

local function disconnect(gate)
    gate.disconnect()
    return true
end

return {
    dial = dial,
    disconnect = disconnect
}
