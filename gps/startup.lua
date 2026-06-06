local filename = "coords.txt"
local coords = {}

-- Write coords to file on first start --
if not fs.exists(filename) then
    print("GPS setup")
    print("Eneter the X coordinate:")
    local x = tonumber(read())

    print("Enter the Y coordinate:")
    local y = tonumber(read())

    print("Enter the Z coordinate:")
    local z = tonumber(read())

    -- Make sure these are valid numbers

    if not x or not y or not z then
        error("Invalid coordinates!")
    end

    coords = {
        x = x,
        y = y,
        z = z
    }

    local file = fs.open(filename, "w")
    file.write(textutils.serialise(coords))
    file.close()
    print("Coordinates saved!")
else
    -- Load existing coordinates
    local file = fs.open(filename, "r")
    coords = textutils.unserialise(file.readAll())
    file.close()

    if not coords then
        error("Failed to load coordinate file!")
    end
end

print(string.format(
    "Starting GPS at (%d, %d, %d)",
    coords.x,
    coords.y,
    coords.z
))

shell.run(
    "gps", "host",
    coords.x,
    coords.y,
    coords.z
)
