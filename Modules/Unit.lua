
Unit = {}
Unit.__index = Unit

function Unit:new()
  local self = {}

  setmetatable(self, Unit)
  self.uid = "unk"
  self.name = "Unknown"
  self.race = "Unknown"
  self.class = "Unknown"
  self.level  = 0
  self.hp = 0
  self.maxHp = 0
  self.power = 0
  self.maxPower = 0

  return self
end


function Unit:load(uid)
  if ~UnitExists(uid) then
    return false
  end

  self.uid = uid

  self:Update()
end

function Unit:Update()
  local uid = self.uid

  if ~UnitExists(uid) then
    return false
  end

  self.name = UnitName(uid)
  self.race = UnitRace(uid)
  self.class = UnitClass(uid)
  self.level = UnitLevel(uid)
  self.hp = UnitHealth(uid)
  self.maxHp = UnitHealthMax(uid)
  self.power = UnitMana(uid)
  self.maxPower = UnitManaMax(uid)
  self.xp = UnitXP(uid)
  self.xpRequired = UnitXPMax(uid)
  self.isPlayer = UnitIsPlayer(uid)
end
