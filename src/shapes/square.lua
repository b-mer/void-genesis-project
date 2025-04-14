return {
    -- Parts of the shape defined by equations.
    components = {
        function(x, y, transform)
            return math.abs(x + y) + math.abs(x - y) == transform.r
        end
    }
}
