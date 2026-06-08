local base = "https://raw.githubusercontent.com/AppaYip/computer-craft/main/"

local files = {
    "stargate/server/install.lua",
    "stargate/server/uninstall.lua",

    "stargate/enums_actions.lua",
    "stargate/enums_protocols.lua",

    "stargate/server/gateConfig.lua",
    "stargate/server/gateLogic.lua",

    "stargate/server/stargateServer.lua",
    "stargate/server/packetHandler.lua",

    "helpers/require.lua",
    "helpers/peripheral.lua",
}

print("Downloading files!")

for _, file in ipairs(files) do
    print("Downloading " .. file)
    
    local url = base .. file
    local result = shell.run("wget", url, file)

    if not result then
        printError("Failed to install file: " .. file)
    end
end
print("Install completed.")
