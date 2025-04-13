return {
    -- Parts of the shape defined by equations.
    components = {
        function (x, y, a)
            x = x - a.x
            y = y - a.y

            x = x * math.cos(a.rot) - y * math.sin(a.rot)
            y = x * math.sin(a.rot) + y * math.cos(a.rot)

            x = math.floor(x + 0.5)
            y = math.floor(y + 0.5)
            
            return (
            y == x^2
            )
        end
    }
}