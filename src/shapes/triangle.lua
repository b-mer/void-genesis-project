return {
    -- Parts of the shape defined by equations.
    components = {
        function(x, y, transform)
            return math.floor(
                math.abs(y + math.abs(x))
                +
                math.abs(x)
                +
                0.5
            ) == transform.r
        end
    }
}