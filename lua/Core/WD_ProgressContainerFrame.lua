WD_Progress_Container_Frame = WD_Helpers_Extend(nil)

function WD_Progress_Container_Frame:Constructor(params)
    self.params = params

    self.frame = nil -- Holds container of all the bars
    self.background = nil -- Background of the container
    self.lockFrameText = nil -- "/wd to lock frame" text

    self:AddFrame()
end

function WD_Progress_Container_Frame:AddFrame()
    local progressContainerSize = {width = (32 + 240), height = 34 * 4}
    
    -- Container frame for all progress bars
    local frame = CreateFrame("Frame", "WD_Progress_Container_Frame_Instance", UIParent)
    frame:SetFrameStrata("FULLSCREEN_DIALOG")-- coarse order in which UI frames are composited onto the screen
    frame:SetWidth(progressContainerSize.width)
    frame:SetHeight(progressContainerSize.height)
    frame:SetAlpha(1.0)
    frame:SetPoint("CENTER", 0, 0)
    frame:SetMovable(true)
    frame:SetUserPlaced(true)
    frame:EnableMouse(true)
    frame:RegisterForDrag("LeftButton")
    frame:SetScript("OnDragStart", frame.StartMoving)
    frame:SetScript("OnDragStop", frame.StopMovingOrSizing)
    
    -- Add background
    local background = frame:CreateTexture(nil, "BACKGROUND")
    background:SetColorTexture(0.0,0.0, 0.0, 0.5)
    background:SetPoint("TOPLEFT", 0, 0)
    background:SetWidth(progressContainerSize.width)
    background:SetHeight(progressContainerSize.height)

    -- Movable text frame
    local lockFrameText = frame:CreateFontString(nil, "OVERLAY", "GameFontNormal");
    lockFrameText:SetFont("Fonts\\ARIALN.TTF", 20)
    lockFrameText:SetText("Type '|cff00ffff/wd lock|cffffffff' to lock")
    lockFrameText:SetTextColor(1, 1, 1, 1)
    lockFrameText:SetPoint("CENTER", 0, 0)
    
    self.frame = frame
    self.background = background
    self.lockFrameText=lockFrameText

    if WD_cookie.locked then
        self:Lock()
    end
end

function WD_Progress_Container_Frame:Lock()
    self.frame:EnableMouse(false)
    WD_cookie.locked=true
    self.background:Hide()
    self.lockFrameText:Hide()
end
function WD_Progress_Container_Frame:Unlock()
    self.frame:EnableMouse(true)
    WD_cookie.locked=false
    self.background:Show()
    self.lockFrameText:Show()
end
function WD_Progress_Container_Frame:Reset()
    self:Unlock()
    self.lockFrameText:SetPoint("CENTER", 0, 0)

end