more_monoids = {}

local function bound(min, v, max)
    return math.max(min, math.min(v, max))
end

more_monoids.sunlight_monoid = player_monoids.make_monoid({
    combine = function(sunlight1, sunlight2)
        return math.max(sunlight1, sunlight2)
    end,
    fold = function(t)
        return #t == 0 and 0 or math.max(unpack(t))
    end,
    identity = 0,
    apply = function(sunlight, player)
        player:override_day_night_ratio(bound(0, sunlight, 1))
    end,
    on_change = function() return end,
})
