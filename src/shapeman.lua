-- Path where shapes are stored
local shapes_path = "shapes"

local shapeman = {
    shape = {}
}

-- Initialize shape manager
function shapeman.init()
    -- Iterate through each module in the shapes folder and append it to the shape table
    for i, file in ipairs(love.filesystem.getDirectoryItems(shapes_path)) do
        if file ~= "." and file ~= ".." and file:sub(-4) == ".lua" then
            table.insert(shapeman.shape, require(shapes_path.."/"..file:sub(1,-5))    )
        end
    end
end

return shapeman
