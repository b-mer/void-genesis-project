return function (entity, dt, space)
    local transform = entity.transform
    local player_properties = entity.player_properties
    local physics = entity.physics
    local speed = player_properties.speed

    if love.keyboard.isDown("down") then
        physics.velocity_y = speed * dt 
        physics.velocity_x = physics.velocity_x  * (1 - math.min(physics.friction * 2 * dt, 1))
    end
    if love.keyboard.isDown("up") then
        physics.velocity_y = -speed * dt
        physics.velocity_x = physics.velocity_x  * (1 - math.min(physics.friction * 2 * dt, 1))
    end

    if love.keyboard.isDown("left") then
        physics.velocity_x = -speed * dt
        physics.velocity_y = physics.velocity_y  * (1 - math.min(physics.friction * 2 * dt, 1))
    end
    if love.keyboard.isDown("right") then
        physics.velocity_x = speed * dt
        physics.velocity_y = physics.velocity_y  * (1 - math.min(physics.friction * 2 * dt, 1))
    end

    local mouse_x, mouse_y = love.mouse.getPosition()

---@diagnostic disable-next-line: deprecated
    transform.rot = math.pi/2 - math.atan2(math.floor(mouse_y - transform.y + 0.5), math.floor(mouse_x - transform.x + 0.5))
end
