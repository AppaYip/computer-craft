local Inventory = require("inventory")

-- Returns whether the slot(nullable) is fuel
local function is_fuel(slot)
    if slot == nil then
        local bool, err = turtle.refuel(0)
        return bool
    end
       
    local currentSlot = turtle.getSelectedSlot()
    turtle.select(slot)
    local bool, err = turtle.refuel(0)

    turtle.select(currentSlot)
    return bool
end


-- Allows for refueling any amount assuming it has the items.
-- Returns true if it refilled to the amount or is max. False if not.
local function refuel(amount)
    local currentFuel = turtle.getFuelLevel()
    
    if currentFuel == "unlimited" or currentFuel == amount then
        return true
    end

    Inventory.inventory_action({}, function ()
        if is_fuel() then
            turtle.refuel()

            if turtle.getFuelLevel() >= amount then
                return true
            end
        end

    end)
end

return {is_fuel = is_fuel, refuel = refuel}
