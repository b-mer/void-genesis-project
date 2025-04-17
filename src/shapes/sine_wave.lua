return {
    -- Parts of the shape defined by equations.
    components = {
        function(x, y, transform)
            return y == math.floor(transform.h * math.sin(x / transform.w) + 0.5)
        end
    }
}
