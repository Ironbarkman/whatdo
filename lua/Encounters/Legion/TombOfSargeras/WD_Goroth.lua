-- ==
-- == TOS - Goroth
-- ==

-- Infernal Burning: Hide behind any pillar to avoid damage
WD_Addon_Instance:AddBarConfig({
    type = "SPELL_CAST_START",
    spellId = 233062, -- spell id
    timer = 10, -- in seconds
    description = "|cffff0000HIDE|r |cffffffffbehind any pillar!|r",
    sendChatMeessageSay = "HIDE behind any pillar!"
})

-- Shattering Star: Hide behind 2+ pillars to avoid damage
WD_Addon_Instance:AddBarConfig({
    type = "SPELL_AURA_APPLIED",
    destination = "player", -- ensure that I am the one getting this debuff
    spellId = 233272, -- spell id
    timer = 6, -- in seconds
    description = "|cffff0000HIDE|r |cffffffffbehind 2+ pillars!|r",
    sendChatMeessageSay = "I am HIDING behind 2+ pillars!"
})

-- Crashing Comet: Avoid hitting pillars
WD_Addon_Instance:AddBarConfig({
    type = "SPELL_AURA_APPLIED",
    target = "player", -- ensure that I am the one getting this debuff
    spellId = 232249, -- spell id
    timer = 6, -- in seconds
    description = "|cffff0000AVOID|r |cffffffffpillars!|r",
    sendChatMeessageSay = "I am AVOIDING hitting pillars!"
})