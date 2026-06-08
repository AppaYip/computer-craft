local registryServer = {
    register = "register",
    list = "list"
}

local gateServer = {
    ping = "ping",
    dial = "dial",
    disconnect = "disconnect",
    status = "status"
}

local client = {

}

return {
    registryServer = registryServer,
    gateServer = gateServer,
    client = client
}
