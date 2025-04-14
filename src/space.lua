-- Space module.
local space = {
    entities = {},
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
    -- Initalize object manager.
    space.objectman.init()
end

-- Create a new entity in space using given name and clones the given object table.
function space.create_entity(entity_name, object)
    space.entities[entity_name] = copy_table(object)
end

-- Draw all entities in space.
function space.draw_all()
    for entity_name, entity in pairs(space.entities) do
        space.objectman.draw_object(entity, space.camera)
    end
end

return space
