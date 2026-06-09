-- Preserves a slot when running a function
local function preserve_slot(func, ...)
    local oldSlot = turtle.getSelectedSlot()

    local bool, error = pcall(func, ...)

    turtle.select(oldSlot)

    return bool, error
end


-- Loops through the turtle's inventory and calls a function at each slot.
-- Example inventory_action({starting = 1, ending = 16, increment = 1}, print, "hello")
local function inventory_action(range, func, ...)
    local args = {...}

    return preserve_slot(function() 
        for i = range.starting or 1, 
                range.ending or 16,
                range.increment or 1 do    

            turtle.select(i)
            local result = func(i, table.unpack(args)) 

            if result ~= nil then
                return result
            end
        end
    end)
end

return {inventory_action = inventory_action, preserve_slot = preserve_slot}
