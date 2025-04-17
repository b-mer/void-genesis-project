-- For Local Lua Debugger vscode extension by tomblind.
if os.getenv("LOCAL_LUA_DEBUGGER_VSCODE") == "1" then
    require("lldebugger").start()
end

-- Get modules.
local space = require("./space")

-- To run on load.
function love.load()
    love.mouse.setVisible(false)
    space.init()
    space.create_entity("floaty", space.objectman.object.floaty, {transform = {x = 400, y = 200}})
    space.create_entity("player", space.objectman.object.player, {transform = {x = 400, y = 400}})

    space.create_entity("mouse", space.objectman.object.mouse)
end 

-- Main render loop.
function love.draw()
    space.draw_all()
end

-- Main update loop.
function love.update(dt)
    space.run_all_entity_scripts(dt)
end
