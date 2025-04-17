-- For Local Lua Debugger vscode extension by tomblind.
if os.getenv("LOCAL_LUA_DEBUGGER_VSCODE") == "1" then
    require("lldebugger").start()
end

-- Get modules.
local space = require("./space")

-- To run on load.
function love.load()
    space.init()
    space.create_entity("floaty", space.objectman.object.floaty, {transform = {x = 500, y = 500}})
    space.create_entity("player", space.objectman.object.player)
end 

-- Main render loop.
function love.draw()
    space.draw_all()
end

-- Main update loop.
function love.update(dt)
    space.run_all_entity_scripts(dt)
end
