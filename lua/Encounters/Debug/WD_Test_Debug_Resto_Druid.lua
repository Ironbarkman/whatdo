-- ==
-- == Test each kind of event on Resto Druid (ONLY works with debug enabled)
-- ==
-- Regrowth (Test SPELL_CAST_START)
WD_Addon_Instance:AddBarConfig({
    type = "SPELL_CAST_START",
    spellId = 8936, -- spell id
    --icon=8936, -- ignoring icon will use the same icon as spellId
    timer = 6, -- in seconds
    description = "SPELL_CAST_START",
    debugOnly = true -- only load in debug mode
})
-- Healing Touch (Test destination)
WD_Addon_Instance:AddBarConfig({
    type = "SPELL_AURA_APPLIED",
    spellId = 33763, -- spell id
    destination = "player",
    timer = 6, -- in seconds
    description = "DESTINATION TEST",
    debugOnly = true -- only load in debug mode
})
-- Rejuvenation (Test SPELL_AURA_APPLIED)
WD_Addon_Instance:AddBarConfig({
    type = "SPELL_AURA_APPLIED",
    spellId = 774, -- spell id
    timer = 10, -- in seconds
    description = "SPELL_AURA_APPLIED",
    debugOnly = true -- only load in debug mode
})

-- Lifebloom (Test SPELL_AURA_REFRESH)
WD_Addon_Instance:AddBarConfig({
    type = "SPELL_AURA_REFRESH",
    spellId = 33763, -- spell id
    timer = 10, -- in seconds
    description = "SPELL_AURA_REFRESH",
    debugOnly = true -- only load in debug mode
})
