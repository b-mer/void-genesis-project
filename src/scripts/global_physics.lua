return function (entity, dt, space)
    local transform = entity.transform
    local physics = entity.physics

    physics.velocity_x = physics.velocity_x + (space.properties.wind_x / physics.density * dt)
    physics.velocity_y = physics.velocity_y + (space.properties.wind_y / physics.density * dt)

    transform.x = transform.x + physics.velocity_x
    transform.y = transform.y + physics.velocity_y

    if physics.velocity_x ~= 0 then
        physics.velocity_x = physics.velocity_x  * (1 - math.min(physics.friction * dt, 1))
    end
    if physics.velocity_y ~= 0 then
        physics.velocity_y = physics.velocity_y  * (1 - math.min(physics.friction * dt, 1))
    end
end
