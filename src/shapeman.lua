-- Path where shapes are stored.
local shapes_path = "shapes"

-- Shape manager module
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

-- Draw a shape using the given shape and given table of values.
function shapeman.draw(shape_name, values)
    -- Get shape from name.
    local shape = shapeman.shape[shape_name]
    -- Get width and height of screen.
    local width, height = love.graphics.getDimensions()
    -- Gap between each set of x and y values
    local gap = 1
    for i, component in pairs(shape.components) do
        local verticies = {}
        for x = 0, width, gap do
            for y = 0, height, gap do
                if component(x, y, values) then
                    table.insert(verticies, x)
                    table.insert(verticies, y)
                end
            end
        end
        love.graphics.points(verticies)
    end
end

return shapeman
