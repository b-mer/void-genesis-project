return {
    -- Parts of the shape defined by equations.
    components = {
        function(x, y, a)
            return y == math.floor(a.h * math.sin(x / a.w) + 0.5)
        end
    }
}
