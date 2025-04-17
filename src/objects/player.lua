return {
    shape = "triangle",
    transform = {
        r = 20,
        x = 0,
        y = 0
    },
    player_properties = {
        acceleration = 100,
        max_speed = 5,
    },
    scripts = {
        "player",
        'global_physics'
    },
    physics = {
        friction = 0.9,
        rot_friction = 1,
        density = 1
    },
    visible = true
}
