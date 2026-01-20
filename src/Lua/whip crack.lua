
---@class player_t
---@field laststate statenum_t

sfxinfo[freeslot("sfx_jtwcr")].caption = "///"

---@param p player_t
addHook("PlayerThink", function(p)

    if p.laststate ~= nil
    and p.realmo.state ~= p.laststate then
        S_StartSound(p.mo, sfx_jtwcr)
    end

    p.laststate = p.realmo.state
end)