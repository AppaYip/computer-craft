local dirs = {
    "stargate/",
    "helpers"
}

print("Removing files!")

for _, dir in ipairs(dirs) do
    if fs.exists(dir) then
        fs.delete(dir)
        print("Removed directory: " .. dir)
    end
end
print("Uninstall completed.")
