local loaded = {}

function require(path)
    if not path:match("%.lua$") then
        path = path .. ".lua"
    end

    if loaded[path] then
        return loaded[path]
    end

    if not fs.exists(path) then
        error("Module not found: " .. path)
    end

    loaded[path] = dofile(path)
    return loaded[path]
end
