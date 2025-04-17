return function (entity, dt, space)
    entity.transform.x = love.mouse.getX()
    entity.transform.y = love.mouse.getY()
end