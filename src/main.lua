-- For Local Lua Debugger vscode extension by tomblind.
if os.getenv("LOCAL_LUA_DEBUGGER_VSCODE") == "1" then
    require("lldebugger").start()
end

-- Get modules.
local space = require("./space")

-- To run on load.
function love.load()
    space.init()
    space.create_entity("floaty", space.objectman.object.floaty)
end 

-- Main render loop.
function love.draw()
    space.draw_all()
end

-- Main update loop.
function love.update(dt)
    if love.keyboard.isDown("down") then
        space.camera.y = space.camera.y - (space.camera.speed * dt)
    end
    if love.keyboard.isDown("up") then
        space.camera.y = space.camera.y + (space.camera.speed * dt)
    end

    if love.keyboard.isDown("left") then
        space.camera.x = space.camera.x + (space.camera.speed * dt)
    end
    if love.keyboard.isDown("right") then
        space.camera.x = space.camera.x - (space.camera.speed * dt)
    end
end
