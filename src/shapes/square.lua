return {
    -- Parts of the shape defined by equations
    components = {
        function (a) return math.abs(a.x + a.y) + math.abs(a.x - a.y) == a.r  end
    }
}