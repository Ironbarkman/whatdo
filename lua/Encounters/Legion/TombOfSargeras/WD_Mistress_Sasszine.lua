-- ==
-- == TOS - Mistress Sassz'ine
-- ==


-- Hydra Shot: soak (in line) on me
WD_Addon_Instance:AddBarConfig({
    type = "SPELL_AURA_APPLIED",
    destination = "player",
    spellId = 230139, -- spell id
    timer = 6, -- in seconds
    description = "|cffff0000POSITION|r |cfffffffffor hydra shot!|r",
    sendChatMeessageSay = "SOAK my hydra shot!"
})

-- Hydra Shot: soak (in line) not on me
WD_Addon_Instance:AddBarConfig({
    type = "SPELL_AURA_APPLIED",
    notDestination = "player",
    spellId = 230139, -- spell id
    timer = 6, -- in seconds
    description = "|cffff0000SOAK|r |cffffffffhydra shot!|r",
    sendChatMeessageSay = "SOAKING hydra shot!"
})
