local main_properties = {
    camera = {
        x = 0,
        y = 0
    }
}

if os.getenv("LOCAL_LUA_DEBUGGER_VSCODE") == "1" then
    require("lldebugger").start()
end

local function draw_shapes()
    return
end

function love.draw()
    draw_shapes()
end