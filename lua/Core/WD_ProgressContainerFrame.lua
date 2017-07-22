WD_Progress_Container_Frame = WD_Helpers_Extend(nil)

function WD_Progress_Container_Frame:Constructor(params)
    self.params = params
    
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
    background:SetColorTexture(0.0,0.0, 0.0, 0.1)
    background:SetPoint("TOPLEFT", 0, 0)
    background:SetWidth(progressContainerSize.width)
    background:SetHeight(progressContainerSize.height)
    
    self.frame = frame
end
