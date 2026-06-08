local base = "https://raw.githubusercontent.com/AppaYip/computer-craft/main/"

local files = {
    "stargate/install.lua",
    "stargate/uninstall.lua",

    "stargate/enums_actions.lua",
    "stargate/enums_protocols.lua",

    "stargate/registry/handler.lua",
    "stargate/registry/register.lua",
    "stargate/registry/server.lua",
    "stargate/registry/storage.lua",

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
