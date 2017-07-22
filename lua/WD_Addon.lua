WD_Addon = WD_Helpers_Extend(nil)

function WD_Addon:Constructor()
    self.options = {
        totalProgressBars = 4
    }
    
    self.progressFrames = {}-- Contains all progress frames that we can update
    self.eventFrames = {}-- Holds all wow event listeners. EX: UNIT_SPELL_CAST_START
    self.barConfigsToLoad = {}-- All bar configs will first be queued and then loaded depending on state (ex: don't load debug if not in debug mode)
    self.barConfigs = {-- Holds encounter information for when we need to trigger things
        SPELL_CAST_START = {},
        SPELL_AURA_APPLIED = {},
        SPELL_AURA_REFRESH = {}
    }
    
    self.eventParser = WD_EventParser()

end
-- Called when addon is loaded
function WD_Addon:AddonLoaded()
    if (WD_cookie == nil) then
        WD_cookie = {}
    end
    
    self:LoadBarConfigs()
    self:CreateProgressFrames()
    self:BindAnimationEvents()
    self:BindBaseEvents()
    
    print("|cffff00ff** WhatDo v0.2a Loaded! |cffffffff[Created By: Ironbarkman of Area 52]")
end
function WD_Addon:CreateProgressFrames()
    local progressContainerFrame = WD_Progress_Container_Frame()
    self.progressContainerFrame = progressContainerFrame
    
    -- Create 4 progress bars that we'll use
    for i = 1, self.options.totalProgressBars do
        local progressFrame = WD_Progress_Frame({
            container = progressContainerFrame,
            yOffset = -(i - 1) * 34
        })
        table.insert(self.progressFrames, progressFrame)
    end
end

function WD_Addon:BindAnimationEvents()
    -- Global timer that we use for progress bars
    local EventFrame_OnUpdate = CreateFrame("Frame")
    EventFrame_OnUpdate:SetScript("OnUpdate",
        function(_, elapsed)
            for i = 1, self.options.totalProgressBars do
                self.progressFrames[i]:AddTime(-elapsed)
            end
        
        end)
    self.eventFrames.OnUpdate = EventFrame_OnUpdate

end

-- Register various events that we can bind to (ex: Boss starts to cast something = UNIT_SPELL_CAST_START)
function WD_Addon:BindBaseEvents()
    local EventFrame_COMBAT_LOG_EVENT_UNFILTERED = CreateFrame("Frame")
    EventFrame_COMBAT_LOG_EVENT_UNFILTERED:RegisterEvent("COMBAT_LOG_EVENT_UNFILTERED")
    EventFrame_COMBAT_LOG_EVENT_UNFILTERED:SetScript("OnEvent",
        function(_, _, ...)
            self.eventParser:DisplayBarConfigs_COMBAT_LOG_EVENT_UNFILTERED(self, self.barConfigs, ...)
        end)
    self.eventFrames.COMBAT_LOG_EVENT_UNFILTERED = EventFrame_COMBAT_LOG_EVENT_UNFILTERED
end
function WD_Addon:DisplayBarConfig(barConfig)
    if barConfig.sendChatMeessageSay~=nil then
        SendChatMessage(barConfig.sendChatMeessageSay.." [WhatDo]","SAY")
    end

    local freeProgressFrame = self:FindFreeProgressFrame()-- Find a frame that's not visible
    if freeProgressFrame ~= nil then
        freeProgressFrame:SetBarConfig(barConfig)
    end
end
function WD_Addon:FindFreeProgressFrame()
    for i = 1, self.options.totalProgressBars do
        if self.progressFrames[i]:IsFree() then
            return self.progressFrames[i]
        end
    end
    
    return nil
end

function WD_Addon:AddBarConfig(barConfig)
    table.insert(self.barConfigsToLoad, barConfig)
end
function WD_Addon:LoadBarConfigs()
    for i = 1, #self.barConfigsToLoad do
        local barConfig = self.barConfigsToLoad[i]
        
        if barConfig.debugOnly ~= true or barConfig.debugOnly and WD_cookie.debug then
            table.insert(self.barConfigs[barConfig.type], barConfig)
        end
    end
end

-- Bind to /wd command
SLASH_WHATDO1 = "/wd";
function SlashCmdList.WHATDO(msg)
    print("WhatDo has no options menu yet...", msg);
end

-- Load addon
WD_Addon_Instance = WD_Addon()
local frame = CreateFrame("FRAME"); -- Need a frame to respond to events
frame:RegisterEvent("ADDON_LOADED"); -- Fired when saved variables are loaded
frame:RegisterEvent("PLAYER_LOGOUT"); -- Fired when about to log out
frame:SetScript("OnEvent", function(self, event, arg1)
    if event == "ADDON_LOADED" and arg1 == "WhatDo" then
        WD_Addon_Instance:AddonLoaded()
    end
end);
