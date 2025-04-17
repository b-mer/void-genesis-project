return function (entity, dt, space)
    if math.deg(entity.transform.rot) == 360 then
        entity.transform.rot = math.rad(0)
    else
        entity.transform.rot = entity.transform.rot + math.rad(100 * dt)
    end
end
