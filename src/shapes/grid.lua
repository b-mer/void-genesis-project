return {
    -- Parts of the shape defined by equations.
    components = {
        function(x, y, transform)
            return math.floor(math.sin(x / transform.w ) * math.cos(y / transform.h)) == 0
        end
    }
}
