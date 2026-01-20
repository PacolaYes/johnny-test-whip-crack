
---@class mobj_t
---@field laststate statenum_t?
---@field whip_delay tic_t?

local WHIP_DELAY = TICRATE/2
sfxinfo[freeslot("sfx_jtwcr")].caption = "Whip Crack" -- we REALLY need captions for this.

---@param mo mobj_t
local function handleWhipCrack(mo)
    if not (mo and mo.valid) then return end

    if mo.laststate ~= nil
    and mo.state ~= mo.laststate
    and not mo.whip_delay then
        S_StartSound(mo, sfx_jtwcr)
        mo.whip_delay = WHIP_DELAY
    end

    mo.laststate = mo.state
    mo.whip_delay = $ and $-1 or 0
end

---@param p player_t
addHook("PlayerThink", function(p)
    searchBlockmap("objects", function(_, mo) -- cuz we hate MF_NOBLOCKMAP objects
        if p.realmo == mo then return end

        handleWhipCrack(mo)
    end, p.realmo, p.realmo.x - 512*FU, p.realmo.x + 512*FU, p.realmo.y - 512*FU, p.realmo.y + 512*FU)

    handleWhipCrack(p.realmo)
end)