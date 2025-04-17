return function (entity, dt, space)
    local transform = entity.transform
    local player_properties = entity.player_properties
    local physics = entity.physics
    local acceleration = player_properties.acceleration
    local max_speed = player_properties.max_speed
    local camera = space.camera

    if love.keyboard.isDown("down") then
        physics.velocity_y = math.min(physics.velocity_y + acceleration * dt, max_speed)
        physics.velocity_x = physics.velocity_x  * (1 - math.min(physics.friction * 2 * dt, 1))
    end
    if love.keyboard.isDown("up") then
        physics.velocity_y = math.max(physics.velocity_y - acceleration * dt, -max_speed)
        physics.velocity_x = physics.velocity_x  * (1 - math.min(physics.friction * 2 * dt, 1))
    end

    if love.keyboard.isDown("left") then
        physics.velocity_x = math.max(physics.velocity_x - acceleration * dt, -max_speed)
        physics.velocity_y = physics.velocity_y  * (1 - math.min(physics.friction * 2 * dt, 1))
    end
    if love.keyboard.isDown("right") then
        physics.velocity_x =  math.min(physics.velocity_x + acceleration * dt, max_speed)
        physics.velocity_y = physics.velocity_y  * (1 - math.min(physics.friction * 2 * dt, 1))
    end

    -- camera.x = camera.x + (transform.x - love.graphics.getWidth() / 2 / camera.acceleration) * dt
    -- camera.y = camera.y + (transform.y - love.graphics.getHeight() / 2 / camera.acceleration) * dt




    camera.x = camera.x - (camera.x - (transform.x - love.graphics.getWidth() / 2)) * math.min(dt*camera.acceleration, camera.max_speed)
    camera.y = camera.y - (camera.y - (transform.y - love.graphics.getHeight() / 2)) * math.min(dt*camera.acceleration, camera.max_speed)


    local mouse_x = love.mouse.getX() + space.camera.x
    local mouse_y = love.mouse.getY() + space.camera.y

---@diagnostic disable-next-line: deprecated
    physics.velocity_rot = (math.pi/2 - math.atan2(math.floor(mouse_y - transform.y + 0.5), math.floor(mouse_x - transform.x + 0.5)) - transform.rot) * 10 * dt
    --physics.velocity_rot = math.pi/2 - math.atan2(math.floor(mouse_y - transform.y + 0.5), math.floor(mouse_x - transform.x + 0.5))
end
