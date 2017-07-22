-- ==
-- == TOS - Harjatan
-- ==

-- Aqueous Burst: Drop outside of group
WD_Addon_Instance:AddBarConfig({
    type = "SPELL_AURA_APPLIED",
    destination = "player", -- ensure that I am the one getting this debuff
    spellId = 231729, -- spell id
    timer = 6, -- in seconds
    description = "|cffff0000DROP|r |cffffffffpool outside!|r",
    sendChatMeessageSay = "I am DROPPING ".. GetSpellLink(231768) .."!"
})

-- Frosty Discharge: Stack back up
WD_Addon_Instance:AddBarConfig({
    type = "SPELL_CAST_START",
    spellId = 232174, -- spell id
    timer = 5, -- in seconds
    description = "|cffff0000STACK|r |cffffffffin front of boss!|r",
    sendChatMeessageSay = "STACK back up in front of boss!"
})

-- Draw In: Spread out
WD_Addon_Instance:AddBarConfig({
    type = "SPELL_AURA_APPLIED",
    spellId = 232061, -- spell id
    timer = 10, -- in seconds
    description = "|cffff0000MOVE|r |cffffffffaway from boss!|r",
    sendChatMeessageSay = "MOVE away from boss!"
})
