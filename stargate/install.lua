local base = "https://raw.githubusercontent.com/AppaYip/computer-craft/main/"

local files = {
    "rednet/enums_actions.lua",
    "rednet/enums_protocols.lua",
    "rednet/registry/handler.lua",
    "rednet/registry/register.lua",
    "rednet/registry/server.lua",
    "rednet/registry/storage.lua",
    "rednet/registry/uninstall.lua",

    "helpers/peripheral.lua",
}

print("Downloading files!")

for _, file in ipairs(files) do
    print("Downloading " .. file)
    
    local url = base .. file
    local result = shell.run("wget", url, file)

    if not result then
        print("Failed to install file: "..file)
    end
end
print("Install completed.")
