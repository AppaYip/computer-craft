local filename = "stargate.json"

local function default()
    return {
        version = 1,
        gateName = "",
        author = "",
        address = "",
        computerId = os.getComputerID()
    }
end


local function save(data)
    local file = fs.open(filename, "w")
    file.write(textutils.serializeJSON(data))
    file.close()
end

local function load()
    if not fs.exists(filename) then
        return nil
    end
    
    local file = fs.open(filename, "r")
    local data = file.readAll()
    file.close()
    return textutils.unserializeJSON(data)
end


local function setup(gate)
    local config = default()

    print("Please enter stargate named: ")
    config.gateName = read()

    print("Please enter your name: ")
    config.author = read()

    config.address = gate.address
    config.computerId = os.getComputerID()

    save(config)

    return config
end


local function loadOrSetup(gate)
    local config = load()

    if config then
        return config
    end
    
    return setup(gate)
end

return {
    load = load,
    save = save,
    loadOrSetup = loadOrSetup
}
