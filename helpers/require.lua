local loaded = {}

function require(path)
    path = path .. ".lua"

    if loaded[path] then
        return loaded[path]
    end

    loaded[path] = dofile(path)
    return loaded[path]
end
