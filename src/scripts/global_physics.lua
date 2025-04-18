return function (entity, dt, space)
    local transform = entity.transform
    local physics = entity.physics

    local physics_speed = 50

    
    physics.velocity_x = physics.velocity_x + (space.properties.wind_x / physics.density * dt)
    physics.velocity_y = physics.velocity_y + (space.properties.wind_y / physics.density * dt)
    physics.velocity_rot = physics.velocity_rot + (space.properties.wind_rot / physics.density * dt)

    if entity.collidable == true then
        for entity_name, collided_entity in pairs(space.check_collisions(entity)) do
            if collided_entity.collidable == true then
                collided_entity.physics.velocity_x, physics.velocity_x = physics.velocity_x + physics.velocity_rot, collided_entity.physics.velocity_x + collided_entity.physics.velocity_rot
                collided_entity.physics.velocity_y, physics.velocity_y = physics.velocity_y + physics.velocity_rot, collided_entity.physics.velocity_y + collided_entity.physics.velocity_rot

                collided_entity.physics.velocity_x, physics.velocity_x = collided_entity.physics.velocity_x + physics.bounce * dt, physics.velocity_x + collided_entity.physics.bounce * dt
                collided_entity.physics.velocity_y, physics.velocity_y = collided_entity.physics.velocity_y + physics.bounce * dt, physics.velocity_y + collided_entity.physics.bounce * dt

                collided_entity.physics.velocity_rot = math.min(collided_entity.physics.velocity_rot + math.abs((physics.velocity_x + physics.velocity_y)) * 1 * dt, 0.1)
                physics.velocity_rot = math.min(physics.velocity_rot + math.abs((collided_entity.physics.velocity_x + collided_entity.physics.velocity_y)) * 1 * dt, 0.1)

                -- collided_entity.physics.velocity_x = collided_entity.physics.velocity_x
                -- collided_entity.physics.velocity_y = collided_entity.physics.velocity_y

                -- physics.velocity_x = physics.velocity_x
                -- physics.velocity_y = physics.velocity_y
            end
        end
    end


    transform.x = transform.x + physics.velocity_x * physics_speed * dt
    transform.y = transform.y + physics.velocity_y * physics_speed * dt
    transform.rot = transform.rot + physics.velocity_rot * physics_speed * dt

    if physics.velocity_x ~= 0 then
        physics.velocity_x = physics.velocity_x  * (1 - math.min(physics.friction * dt, 1))
    end
    if physics.velocity_y ~= 0 then
        physics.velocity_y = physics.velocity_y  * (1 - math.min(physics.friction * dt, 1))
    end
    if physics.velocity_rot ~= 0 then
        physics.velocity_rot = physics.velocity_rot * (1 - math.min(physics.rot_friction * dt, 1))
    end
end
