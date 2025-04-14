-- Path where behaviour scripts are stored.
local scripts_path = "scripts"

-- Space module.
local space = {
    entities = {},
    scripts = {},
    camera = {
        x = 0,
        y = 0,
        speed = 300
    },
    -- Get object module for interacting with objects.
    objectman = require("./objectman")
}

-- Copy a table.
local function copy_table(table)
    local new_table = {}
    for index, value in pairs(table) do
        if type(value) == "table" then
            new_table[index] = copy_table(value)
        else
            new_table[index] = value
        end
    end
    return new_table
end

-- Initalize space.
function space.init()
    -- Iterate through each module in the scripts folder and append it to the scripts table
    for i, file in ipairs(love.filesystem.getDirectoryItems(scripts_path)) do
        -- Check if file is a .lua file.
        if file ~= "." and file ~= ".." and file:sub(-4) == ".lua" then
            -- Gets script without .lua
            local script_name = file:sub(1, -5)
            -- Add to list of objects.
            space.scripts[script_name] = require(scripts_path .. "/" .. script_name)
        end
    end
    -- Initalize object manager.
    space.objectman.init()
end

-- Create a new entity in space using given name and clones the given object table, then store scripts.
function space.create_entity(entity_name, object)
    space.entities[entity_name] = copy_table(object)
end

-- Run scripts of a specific entity in space.
function space.run_entity_scripts(entity, dt)
    for i, script_name in ipairs(entity.scripts) do
        space.scripts[script_name](entity, dt)
    end
end

-- Run scripts on all entities in space.
function space.run_all_entity_scripts(dt)
    for entity_name, entity in pairs(space.entities) do
        space.run_entity_scripts(entity, dt)
    end
end

-- Draw all entities in space.
function space.draw_all()
    for entity_name, entity in pairs(space.entities) do
        space.objectman.draw_object(entity, space.camera)
    end
end

return space
