-- Path where objects are stored.
local objects_path = "objects"

-- Get shape manager module for drawing objects.
local shapeman = require("./shapeman")

-- Object manager module.
local objectman = {
    object = {}
}

-- Initialize shape manager.
function objectman.init()
    -- Iterate through each module in the objects folder and append it to the object table.
    for i, file in ipairs(love.filesystem.getDirectoryItems(objects_path)) do
        -- Check if file is a .lua file.
        if file ~= "." and file ~= ".." and file:sub(-4) == ".lua" then
            -- Gets object without .lua
            local object_name = file:sub(1, -5)
            -- Add to list of objects.
            objectman.object[object_name] = require(objects_path .. "/" .. object_name)
        end
    end
    -- Initalize shape manager as well.
    shapeman.init()
end

-- Draw an object.
function objectman.draw_object(object, camera)
    if object.visible then
        shapeman.draw(object.shape, object.transform, camera)
    end
end

return objectman
