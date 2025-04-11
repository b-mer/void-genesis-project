local shapeman = require("./shapeman")
local objectman = require("./objectman")

-- Main properties of session
local main_properties = {
    camera = {
        x = 0,
        y = 0
    }
}

-- For Local Lua Debugger vscode extension by tomblind
if os.getenv("LOCAL_LUA_DEBUGGER_VSCODE") == "1" then
    require("lldebugger").start()
end

function love.load()
    shapeman.init()
end

-- Draw all shapes
local function draw_shapes()
    return
end

-- Main render loop
function love.draw()
    draw_shapes()
end