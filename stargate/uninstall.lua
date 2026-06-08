local dirs = {
    "rednet/registery",
    "rednet",
    "helpers"
}

print("Removing files!")

for _, dir in ipairs(dirs) do
    if fs.exists(dir) and #fs.list(dir) == 0 then
        fs.delete(dir)
        print("Removed empty directory: " .. dir)
    end
end
print("Uninstall completed.")
