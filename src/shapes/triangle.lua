return {
    -- Parts of the shape defined by equations.
    components = {
        function(x, y, transform)
            return (
                math.abs(y + math.abs(x))
                +
                math.abs(x)
            ) == transform.r
        end
    }
}