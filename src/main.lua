-- For Local Lua Debugger vscode extension by tomblind.
if os.getenv("LOCAL_LUA_DEBUGGER_VSCODE") == "1" then
    require("lldebugger").start()
end

-- Get all modules.
local shapeman = require("./shapeman")
local objectman = require("./objectman")

-- Main properties of session.
local main_properties = {
    camera = {
        x = 0,
        y = 0
    }
}

-- To run on load.
function love.load()
    shapeman.init()
end

local degrees = 0

-- Draw all shapes.
local function draw_shapes()
    degrees = degrees + 1
    if degrees > 360 then
        degrees = 1
    end

    shapeman.draw("square", {x=400, y=250, r=100, rot=math.rad(degrees)})
end

-- Main render loop.
function love.draw()
    draw_shapes()
end