-- Path where shapes are stored.
local shapes_path = "shapes"

-- Shape manager module.
local shapeman = {
    shape = {}
}

-- Initialize shape manager.
function shapeman.init()
    -- Iterate through each module in the shapes folder and append it to the shape table.
    for i, file in ipairs(love.filesystem.getDirectoryItems(shapes_path)) do
        -- Check if file is a .lua file.
        if file ~= "." and file ~= ".." and file:sub(-4) == ".lua" then
            -- Gets shape without .lua
            local shape_name = file:sub(1, -5)
            -- Add to list of shapes.
            shapeman.shape[shape_name] = require(shapes_path .. "/" .. shape_name)
        end
    end
end

-- Apply offset and rotation to a point using a given table of values.
local function apply_offset_and_rotation(x, y, values)
    -- Apply offset.
    x = x - values.x
    y = y - values.y

    -- Apply rotation.
    x, y = x * math.cos(values.rot) - y * math.sin(values.rot), x * math.sin(values.rot) + y * math.cos(values.rot)

    -- Round to nearest whole number.
    x = math.floor(x + 0.5)
    y = math.floor(y + 0.5)

    -- Return x and y.
    return x, y
end

-- Draw a shape using the given shape name and given table of values and camera info.
function shapeman.draw(shape_name, transform, camera)
    -- Get shape from shape name.
    local shape = shapeman.shape[shape_name]
    -- Get width and height of screen.
    local width, height = love.graphics.getDimensions()
    -- Gap between each set of x and y transform.
    local gap = 1
    for i, component in pairs(shape.components) do
        -- Table of verticies
        local verticies = {}
        for x = 0, width, gap do
            for y = 0, height, gap do
                -- Apply offset and rotation to point of shape.
                local point_x, point_y = apply_offset_and_rotation(x - camera.x, y - camera.y, transform)
                -- If the point matches equation, add it to the table of verticies.
                if component(point_x, point_y, transform) then
                    table.insert(verticies, x)
                    table.insert(verticies, y)
                end
            end
        end
        -- Draw all verticies.
        love.graphics.points(verticies)
    end
end

return shapeman
