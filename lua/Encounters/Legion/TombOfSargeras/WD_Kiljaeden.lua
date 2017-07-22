-- ==
-- == TOS - Kil'jaeden
-- ==

-- Rupturing Singularity: move towards the Rupturing Singularity
WD_Addon_Instance:AddBarConfig({
    type = "SPELL_CAST_START",
    spellId = 235059, -- spell id
    timer = 9.7, -- in seconds
    description = "|cffff0000MOVE|r |cfffffffftowards explosion!|r",
    sendChatMeessageSay = "MOVE towards "..GetSpellLink(235059).."!"
})

-- Armageddon: soak armageddon
WD_Addon_Instance:AddBarConfig({
    type = "SPELL_CAST_START",
    spellId = 240910, -- spell id
    timer = 8, -- in seconds
    description = "|cffff0000SOAK|r |cffffffffarmageddon!|r",
    sendChatMeessageSay = "Get ready to SOAK "..GetSpellLink(240910).."!"
})

-- Focused Dreadflame: line and spread
WD_Addon_Instance:AddBarConfig({
    type = "SPELL_CAST_START",
    spellId = 238502, -- spell id
    timer = 7, -- in seconds
    description = "|cffff0000SOAK|r |cffffffffin line!|r",
    sendChatMeessageSay = "SOAK "..GetSpellLink(238502).." in spreaded line!"
})

-- Darkness of a Thousand Souls: line and spread
WD_Addon_Instance:AddBarConfig({
    type = "SPELL_CAST_START",
    spellId = 238999, -- spell id
    timer = 9, -- in seconds
    description = "|cffff0000MOVE|r |cffffffffto rift!|r",
    sendChatMeessageSay = "MOVE close to "..GetSpellLink(243982).."!"
})

-- Felclaws: don't take any stacks if not tank
WD_Addon_Instance:AddBarConfig({
    type = "SPELL_AURA_APPLIED",
    destination = "player", -- ensure that I am the one getting this debuff
    spellId = 245509,-- 239932, -- spell id
    timer = 5, -- in seconds
    description = "|cffff0000MOVE|r |cffffffffbehind boss!|r",
    sendChatMeessageSay = "OUCH I just took damage from "..GetSpellLink(245509).."!"
})

-- Felclaws: don't take any stacks if not tank (ANOTHER STACK)
WD_Addon_Instance:AddBarConfig({
    type = "SPELL_AURA_REFRESH",
    destination = "player", -- ensure that I am the one getting this debuff
    spellId = 245509,-- 239932, -- spell id
    timer = 5, -- in seconds
    description = "|cffff0000MOVE|r |cffffffffbehind boss!!!|r",
    sendChatMeessageSay = "OUCH I just took damage from "..GetSpellLink(245509).." AGAIN!"
})

--[[
-- Illidan's Sightless Gaze: show progress of it
WD_Addon_Instance:AddBarConfig({
    type = "SPELL_AURA_REFRESH",
    destination = "player", -- ensure that I am the one getting this debuff
    spellId = 241721, -- spell id
    timer = 20, -- in seconds
    description = "|cffff0000MOVE|r |cffffffffbehind boss!!!|r"
})

--]]