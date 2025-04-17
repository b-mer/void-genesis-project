-- DEFAULT OBJECT PROPERTIES
return {
    shape = "square",
    transform = {
        -- r defines radius or overall size in relevant shapes.
        r = 10,
        -- Translate x.
        x = 0,
        -- Translate y.
        y = 0,
        -- Rotation.
        rot = 0,
        -- h defines height in relevant shapes.
        h = 1,
        -- w defines width in relevant shapes.
        w = 1
    },
    -- Most of these properties do not function without a script that handles physics!
    physics = {
        velocity_x = 0,
        velocity_y = 0,
        velocity_rot = 0,
        friction = 1,
        rot_friction = 1,
        -- This affects movement by additional forces such as wind.
        density = 1,
        -- If collision should be enabled or not.
        collision = true
    },
    visible = true,
    collidable = true,
    -- If object is drawn independent of camera position.
    independent_of_camera = false
}
