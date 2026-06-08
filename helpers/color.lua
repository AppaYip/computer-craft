-- Preserves terminal text color
local function preserve_color(func, ...)
    local oldColor = term.getTextColor()
    local bool, error = pcall(func, ...)

    term.setTextColor(oldColor)
    return bool, error
end


return { preserve_color = preserve_color }
