WD_Progress_Frame = WD_Helpers_Extend(nil)

function WD_Progress_Frame:Constructor(params)
    self.params = params
    self.timeLeft = 0
    self.timeTotal = 0
    self.frame = nil -- container of icon + progress bar
    self.progressBarFrame = nil -- progress bar (StatusBar)
    self.actionDescriptionTextFrame = nil -- text for what to do
    self.timerTextFrame = nil -- text for progress of time (ex: 1.5)
    self.progressIcon = nil -- icon of the progress bar spell
    
    self:Initialize()
end
function WD_Progress_Frame:Initialize()
    
    local containerFrame = self.params.container.frame
    
    local iconSize = {width = 32, height = 32}
    local progressBarSize = {width = 240, height = 32}
    
    local progressFrame = CreateFrame("Frame", nil, containerFrame)
    progressFrame:Hide()
    progressFrame:SetWidth(progressBarSize.width)
    progressFrame:SetHeight(progressBarSize.height)
    progressFrame:SetPoint("TOPLEFT", 0, self.params.yOffset)
    
    -- Add Icon
    local progressIcon = progressFrame:CreateTexture(nil, "BACKGROUND")
    --t:SetTexture("Interface\\Glues\\CharacterCreate\\UI-CharacterCreate-Factions.blp")
    progressIcon:SetTexture(1.0, 0.0, 0.0, 0.8)
    progressIcon:SetPoint("TOPLEFT", 0, 0)
    progressIcon:SetWidth(32)
    progressIcon:SetHeight(32)
    
    -- Add progress bar
    local progressBarFrame = CreateFrame("StatusBar", nil, progressFrame)
    progressBarFrame:SetStatusBarTexture("Interface\\TargetingFrame\\UI-StatusBar")
    progressBarFrame:SetStatusBarColor(0, 1, 0)
    --progressBarFrame:GetStatusBarTexture():SetHorizTile(false)
    progressBarFrame:SetMinMaxValues(0, 100)
    progressBarFrame:SetValue(100)
    progressBarFrame:SetWidth(progressBarSize.width)
    progressBarFrame:SetHeight(progressBarSize.height)
    progressBarFrame:SetPoint("TOPLEFT", iconSize.width, 0)
    
    -- Add a nice background to our progress
    local progressBarFrameBackground = progressBarFrame:CreateTexture(nil, "BACKGROUND")
    progressBarFrameBackground:SetAllPoints(true)
    progressBarFrameBackground:SetColorTexture(0.8, 0.2, 0.2, 0.2)
    
    -- Add action description
    local actionDescriptionTextFrame = progressBarFrame:CreateFontString(nil, "OVERLAY", "GameFontNormal");
    actionDescriptionTextFrame:SetFont("Fonts\\ARIALN.TTF", 20)
    actionDescriptionTextFrame:SetText("HIDE behind 2+ pillars!")
    actionDescriptionTextFrame:SetTextColor(1, 1, 1, 1)
    actionDescriptionTextFrame:SetPoint("LEFT", 4, 0)
    
    -- Add timer text
    local timerTextFrame = progressBarFrame:CreateFontString(nil, "OVERLAY", "GameFontNormal");
    timerTextFrame:SetFont("Fonts\\ARIALN.TTF", 20)
    timerTextFrame:SetText("0.5")
    timerTextFrame:SetTextColor(1, 1, 1, 1)
    timerTextFrame:SetPoint("RIGHT", -4, 0)
    
    self.progressIcon = progressIcon
    self.actionDescriptionTextFrame = actionDescriptionTextFrame
    self.timerTextFrame = timerTextFrame
    self.frame = progressFrame
    self.progressBarFrame = progressBarFrame
end
function WD_Progress_Frame:Show()
    self.frame:Show()
end
function WD_Progress_Frame:Hide()
    self.frame:Hide()
end
function WD_Progress_Frame:IsFree()
    return self.timeLeft <= 0
end
function WD_Progress_Frame:SetBarConfig(newBarConfig)
    if newBarConfig.timer ~= nil then
        self:SetTimer(newBarConfig.timer)
    end
    self.actionDescriptionTextFrame:SetText(newBarConfig.description)
    
    local icon = newBarConfig.icon
    
    if icon == nil then
        icon = newBarConfig.spellId
    end
    
    local _, _, texturePath = GetSpellInfo(icon)
    self.progressIcon:SetTexture(texturePath)
    
    self:Show()
    self:UpdateProgress()
end
function WD_Progress_Frame:SetTimer(newTime)
    self.timeTotal = newTime
    self.timeLeft = newTime
end
function WD_Progress_Frame:AddTime(newTime)
    self.timeLeft = self.timeLeft + newTime
    self:UpdateProgress()
end
function WD_Progress_Frame:UpdateProgress()
    if (self.timeLeft > 0) then
        local progressValue = (self.timeLeft / self.timeTotal) * 100
        self.timerTextFrame:SetText((("%%.%df"):format(1)):format(self.timeLeft))
        self.progressBarFrame:SetValue(progressValue)
    else
        self:Hide()
    end
end
