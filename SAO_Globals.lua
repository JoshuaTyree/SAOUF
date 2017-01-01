SAO_Globals = {

  bars = {
    texture = "",
    bgTexture = "",
    colors = {
      ["high"] = {
        start = { r = 128, g = 176, b = 78 },
        stop = { r = 154, g = 197, b = 15 }
      },
      ["med"] = {
        start = { r = 171, g = 159, b = 50 },
        stop = { r = 211, g = 199, b = 75 }
      },
      ["low"] = {
        start = { r = 155, g = 44, b = 54 },
        stop = { r = 206, g = 40, b = 54 }
      }
    }


  }

}

--
-- Easy Enumeration for Frame Strata Levels
--

FRAME_LEVEL = {
  background = "BACKGROUND",
  low = "LOW",
  medium = "MEDIUM",
  high = "HIGH",
  dialog = "DIALOG",
  fullscreen = "FULLSCREEN",
  fullscreenDialog = "FULLSCREEN_DIALOG",
  tooltip = "TOOLTIP"
}


ANCHOR = {
  top = "TOP",
  left = "LEFT",
  right = "RIGHT",
  bottom = "BOTTOM",
  center = "CENTER",
  topLeft = "TOPLEFT",
  topRight = "TOPRIGHT",
  bottomLeft = "BOTTOMLEFT",
  bottomRight = "BOTTOMRIGHT"
}

INVENTORY_SLOTS = {
  ammo = 0,
  head = 1,
  neck = 2,
  shoulder = 3,
  body = 4,
  chest = 5,
  waist = 6,
  legs = 7,
  feed = 8,
  wrist = 9,
  hand = 10,
  finger1 = 11,
  finger2 = 12,
  trinket1 = 13,
  trinket2 = 14,
  back = 15,
  mainhand = 16,
  offhand = 17,
  ranged = 18,
  tabard = 19
}

POWER_TYPES = {
  mana = 0,
  rage = 1,
  focus = 2,
  energy = 3,
  combo = 4,
}

UNIT_TYPES = {
  player = "player",
  target = "target",
  targetOfTarget = "targettarget",
  focus = "focus",
  mouseover = "mouseover"
}

--
-- Generates a color value for a hex string
--
function ColorValue(hex)
  return string.format("|cff%s", hex)
end

--
-- Generate a Hex Value for RGB Table
--
function HexColor(rgb)
  local hexadecimal = '0X'

	for key, value in pairs(rgb) do
		local hex = ''
		while(value > 0)do
			local index = math.fmod(value, 16) + 1
			value = math.floor(value / 16)
			hex = string.sub('0123456789ABCDEF', index, index) .. hex
		end

		if(string.len(hex) == 0)then
			hex = '00'
		elseif(string.len(hex) == 1)then
			hex = '0' .. hex
		end

		hexadecimal = hexadecimal .. hex
	end

	return hexadecimal
end


--
-- Generate an RGB Table from Hex Value
--
function RgbColor(hex)
  hex = hex:gsub("#","")
  if(string.len(hex) == 3) then
      return tonumber("0x"..hex:sub(1,1)) * 17, tonumber("0x"..hex:sub(2,2)) * 17, tonumber("0x"..hex:sub(3,3)) * 17
  elseif(string.len(hex) == 6) then
      return tonumber("0x"..hex:sub(1,2)), tonumber("0x"..hex:sub(3,4)), tonumber("0x"..hex:sub(5,6))
  end
end


--
-- Createa "capitalize" method for the string namespace
--
string.capitalize = function(s)
  return string.gsub(s, "(%w)([%w]*)",
      function (first, rest)
        return string.upper(first) .. rest
      end,
    1)
end
