local base = "https://raw.githubusercontent.com/AppaYip/computer-craft/main/rednet/"

local files = {
    "enums_actions.lua",
    "enums_protocols.lua",
    "registery/handler.lua",
    "registery/register.lua",
    "registery/server.lua",
    "registery/storage.lua",

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
