local base = "https://raw.githubusercontent.com/AppaYip/computer-craft/main/"

local files = {
    "rednet/enums_actions.lua",
    "rednet/enums_protocols.lua",
    "rednet/registery/handler.lua",
    "rednet/registery/register.lua",
    "rednet/registery/server.lua",
    "rednet/registery/storage.lua",

    "helpers/peripheral.lua"
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
