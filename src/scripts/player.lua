return function (entity, dt)
    local transform = entity.transform
    local player_properties = entity.player_properties
    local speed = player_properties.speed

    if love.keyboard.isDown("down") then
        transform.y = transform.y + (speed * dt)
    end
    if love.keyboard.isDown("up") then
        transform.y = transform.y - (speed * dt)
    end

    if love.keyboard.isDown("left") then
        transform.x = transform.x - (speed * dt)
    end
    if love.keyboard.isDown("right") then
        transform.x = transform.x + (speed * dt)
    end
end
