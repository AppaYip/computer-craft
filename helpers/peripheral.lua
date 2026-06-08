-- Attempts to find a peripheral With provided name. Returns true if success
local function findOrWarn(type, filter)
    filter = filter or function() return true end
    local foundName
    
    local p = peripheral.find(type, function(name, p) 
        if not filter or filter(name, p) then
            foundName = name -- This is freaky but it works
            return true
        end
    end)

    if not p then
        printError("Could not find peripheral of type: " .. type)
        return nil
    end

    return {
        name = foundName,
        peripheral = p
    }
end

return {findOrWarn = findOrWarn}
