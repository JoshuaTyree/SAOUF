local g = SAO_Globals


UnitFrame = {}
UnitFrame.__index = UnitFrame

---------------------------------------- Initialization & Frame Creation Logic

function UnitFrame:new(uid)
  local self = {}

  -- Create and load the unit
  self.uid = uid
  self.unit = Unit:new()
  self.isUnitLoaded = self.unit:load(uid)
  self.isVisible = false

  -- Set up variables for frames
  self.frame = nil
  self.portrait = nil
  self.health = nil
  self.power = nil
  self.background = nil

  -- Set up variables for frame positioning
  self.strata = FRAME_LEVEL.low

  return self
end


--
-- Create all associated frames (Portrait, Health, Power, etc)
--
function UnitFrame:CreateFrames()
  local u = self.unit, uid = self.uid:capitalize()
  self.frame = CreateFrame("Frame", string.format("SAOUF_%s", uid), UIParent)

  self:CreatePortraitFrame()
  self:CreateHealthBar()
  self:CreatePowerBar()
  self:CreateBuffBar()
end

function UnitFrame:CreatePortraitFrame()
end

function UnitFrame:CreateHealthBar()
end

function UnitFrame:CreatePowerBar()
end

function UnitFrame:CreateBuffBar()
end

---------------------------------------- Visibility & Positioning Logic

--
-- Locks the UnitFrame so it is no longer movable
--
function UnitFrame:Lock()
end

--
-- Unlocks the UnitFrame for movement via drag/drop
--
function UnitFrame:Unlock()
end

--
-- Toggle Visibility of the UnitFrame
--
function UnitFrame:Toggle()
  if ~self.frame or ~self.isUnitLoaded then
    return false
  end

  if self.isVisible then
    self.frame:Hide()
  else
    self.frame:Show()
  end

  self.isVisible = !self.isVisible
end


---------------------------------------- Update & Data Binding Logic

--
-- Gets the appropriate health bar gradient color
--
function UnitFrame:GetHealthGradient()
end


--
-- Gets the appropriate power gradient colro
--
function UnitFrame:GetPowerGradient()
end


--
-- Update the Unit and the associated frames
--
function UnitFrame:Update()
end
