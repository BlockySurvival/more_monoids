local function remove_empty(t)
    local t2 = {}
    for _, v in pairs(t) do
        if v and v ~= "" then
            table.insert(t2, v)
        end
    end

end

more_monoids.player_tag_monoid = player_monoids.make_monoid({
    -- concatinative, with '\n' as the separator
    combine = function(tag1, tag2)
        return table.concat(remove_empty({tag1, tag2}), "\n")
    end,
    fold = function(t)
        return table.concat(remove_empty(t), "\n")
    end,
    identity = "",
    apply = function(tag, player)
        player:set_nametag_attributes({text=tag})
    end,
})
