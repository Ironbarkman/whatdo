WD_EventParser = WD_Helpers_Extend(nil)

-- Redestributes various events and figures out what bar configs apply to each event
function WD_EventParser:Constructor()
    -- re-used variables
    self.barConfig = nil
    self.match = false
    self.spellId = nil
    self.spellName = nil
end
function WD_EventParser:DisplayBarConfigs_COMBAT_LOG_EVENT_UNFILTERED(wdAddon, barConfigs, timestamp, event, hideCaster, sourceGUID, sourceName, sourceFlags, sourceRaidFlags, destGUID, destName, destFlags, destRaidFlags, ...)

    if event == "SPELL_CAST_START" then
        self:DisplayBarConfigs_SPELL_CAST_START(wdAddon, barConfigs.SPELL_CAST_START, sourceGUID, destGUID, ...)
    elseif event == "SPELL_AURA_APPLIED" then
        self:DisplayBarConfigs_SPELL_AURA_APPLIED(wdAddon, barConfigs.SPELL_AURA_APPLIED, sourceGUID, destGUID, ...)
    elseif event == "SPELL_AURA_REFRESH" then
        
        self:DisplayBarConfigs_SPELL_AURA_REFRESH(wdAddon, barConfigs.SPELL_AURA_REFRESH, sourceGUID, destGUID, ...)
    end

    
end
function WD_EventParser:DisplayBarConfigs_SPELL_CAST_START(wdAddon, barConfigs, sourceGUID, destGUID, ...)
    self.spellId = ...
    
    for i = 1, #barConfigs do
        self.barConfig = barConfigs[i]
        self.match = true
        
        if self.barConfig.spellId ~= nil and self.barConfig.spellId ~= self.spellId then
            self.match = false
        end
        
        if self.match then
            wdAddon:DisplayBarConfig(self.barConfig)
        end
    end
end
function WD_EventParser:DisplayBarConfigs_SPELL_AURA_APPLIED(wdAddon, barConfigs, sourceGUID, destGUID, ...)
    self.spellId = ...
    
    for i = 1, #barConfigs do
        self.barConfig = barConfigs[i]
        self.match = true
        
        if self.barConfig.spellId ~= nil and self.barConfig.spellId ~= self.spellId then
            self.match = false
        end
        
        if self.barConfig.destination ~= nil and UnitGUID(self.barConfig.destination) ~= destGUID then
            self.match = false
        end
        
        if self.barConfig.notDestination ~= nil and UnitGUID(self.barConfig.notDestination) == destGUID then
            self.match = false
        end
        
        if self.match then
            wdAddon:DisplayBarConfig(self.barConfig)
        end
    end
end
function WD_EventParser:DisplayBarConfigs_SPELL_AURA_REFRESH(wdAddon, barConfigs, sourceGUID, destGUID, ...)
    self.spellId = ...
    
    for i = 1, #barConfigs do
        self.barConfig = barConfigs[i]
        self.match = true
        
        if self.barConfig.spellId ~= nil and self.barConfig.spellId ~= self.spellId then
            self.match = false
        end
        
        if self.barConfig.destination ~= nil and UnitGUID(self.barConfig.destination) ~= destGUID then
            self.match = false
        end
        
        if self.barConfig.notDestination ~= nil and UnitGUID(self.barConfig.notDestination) == destGUID then
            self.match = false
        end
        
        if self.match then
            wdAddon:DisplayBarConfig(self.barConfig)
        end
    end
end
