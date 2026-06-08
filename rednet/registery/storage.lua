local fileName = "stargates.json"

local function loadDefault()
    return { stargates = {} }
end


function getAll()
    if not fs.exists(fileName) then
        return loadDefault()
    end

    local file = fs.open(fileName, "r")
    local content = file.readAll()
    file.close()

    local data = textutils.unserializeJSON(content)
    if type(data) ~= "table" then
        return loadDefault()
    end

    return data
end


local function findByName(name, data)
    for _, gate in ipairs(data.stargates) do
        if gate.name == name then
            return gate
        end
    end

    return nil
end


function save(data)
    local file = fs.open(fileName, "w")
    file.write(textutils.serializeJSON(data))
    file.close()
end


function add(gatePacket)
    local data = getAll()

    if findByName(gatePacket.name, data) then
        return {
            success = false, 
            error = "Stargate name already exists: " .. gatePacket.name,
            data = nil
        }
    end

    table.insert(data.stargates, {
        name = gatePacket.name,
        serverId = gatePacket.serverId,
        stargateAddress = gatePacket.stargateAddress
    })

    save(data)
    return {
        success = true,
        error =  nil,
        data = nil,
    }
end


local function listNames()
    local data = getAll()
    local list = {}

    for _, gate in ipairs(data.stargates) do
        table.insert(list, {
            name = gate.name,
            id = gate.serverId
        })
    end

    return {
        success = true,
        error = nil,
        data = list
    }
end


return {
    getAll = getAll,
    save = save,
    add = add,
    listNames = listNames,
    findByName = findByName
}
