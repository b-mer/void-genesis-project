return {
    -- Parts of the shape defined by equations
    components = {
        function(x, y, values)
            return math.abs(x + y) + math.abs(x - y) == values.r
        end
    }
}
