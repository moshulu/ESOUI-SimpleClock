
-- This is the version that is shown ingame! Use "SimpleClock - Copy" for filming.

SimpleClock = {}
SimpleClock.name = "SimpleClock"
local savedVariables

-- Create a reversed font table for easy lookup later called revFontTable. This will have the key as "Medium" instead of "MEDIUM_FONT", etc.
local fontTable = {
   ["MEDIUM_FONT"]="Medium",
   ["BOLD_FONT"]="Bold",
   ["CHAT_FONT"]="Chat",
   ["GAMEPAD_LIGHT_FONT"]="Gamepad Light",
   ["GAMEPAD_MEDIUM_FONT"]="Gamepad Medium",
   ["GAMEPAD_BOLD_FONT"]="Gamepad Bold",
   ["ANTIQUE_FONT"]="Antique",
   ["HANDWRITTEN_FONT"]="Handwritten",
   ["STONE_TABLET_FONT"]="Stone Tablet"
}

local function ShowClock()
   SimpleClockLabel:SetHidden(false)
   savedVariables.visible = true
end

local function HideClock()
   SimpleClockLabel:SetHidden(true)
   savedVariables.visible = false
end

-- Function to iterate through characters of the string and handle special characters
local function iterateCharacters(str)
   local i = 1
   local constructed_str = ""
   while i <= #str do
      -- Get the UTF-8 char code (UTF-8 digit)
      local charCode = string.byte(str, i)

      -- Determine the number of bytes in the UTF-8 character
      local charSize = 1
      if charCode >= 192 and charCode < 224 then
            charSize = 2
      elseif charCode >= 224 and charCode < 240 then
            charSize = 3
      end

      -- Since ESO has not supported utf characters greater than 128 bytes (and thus not provided proper support for utf.codes()), 
      -- we must handle that ourselves with their respective slash codes.
      -- The following is a manual (!) translation of special characters in the french language that os.date might produce.
      -- This isn't an issue for localized strings (such as in lang/fr.lua) because it seems the encoding is already utf-8. The os.date 
      -- encoding seems to not be in utf-8 automatically.
      -- I am not proud of this!
      local utf8Char = ""
      if charCode == 233 then
         utf8Char = "\195\169"
      elseif charCode == 232 then
         utf8Char = "\195\168"
      elseif charCode == 192 then
         utf8Char = "\195\128"
      elseif charCode == 194 then
         utf8Char = "\195\130"
      elseif charCode == 196 then
         utf8Char = "\195\132"
      elseif charCode == 198 then
         utf8Char = "\195\134"
      elseif charCode == 199 then
         utf8Char = "\195\135"
      elseif charCode == 200 then
         utf8Char = "\195\136"
      elseif charCode == 201 then
         utf8Char = "\195\137"
      elseif charCode == 202 then
         utf8Char = "\195\138"
      elseif charCode == 203 then
         utf8Char = "\195\139"
      elseif charCode == 203 then
         utf8Char = "\195\142"
      elseif charCode == 207 then
         utf8Char = "\195\143"
      elseif charCode == 212 then
         utf8Char = "\195\148"
      elseif charCode == 338 then
         utf8Char = "\197\146"
      elseif charCode == 217 then
         utf8Char = "\195\153"
      elseif charCode == 219 then
         utf8Char = "\195\155"
      elseif charCode == 220 then
         utf8Char = "\195\156"
      elseif charCode == 224 then
         utf8Char = "\195\160"
      elseif charCode == 228 then
         utf8Char = "\195\164"
      elseif charCode == 230 then
         utf8Char = "\195\166"
      elseif charCode == 231 then
         utf8Char = "\195\167"
      elseif charCode == 234 then
         utf8Char = "\195\170"
      elseif charCode == 235 then
         utf8Char = "\195\171"
      elseif charCode == 238 then
         utf8Char = "\195\174"
      elseif charCode == 239 then
         utf8Char = "\195\175"
      elseif charCode == 244 then
         utf8Char = "\195\180"
      elseif charCode == 339 then
         utf8Char = "\197\147"
      elseif charCode == 249 then
         utf8Char = "\195\185"
      elseif charCode == 251 then
         utf8Char = "\195\187"
      elseif charCode == 252 then
         utf8Char = "\195\188"
      else
         utf8Char = string.sub(str, i, i + charSize - 1)
         
      end -- end if/elseif/else block

      -- add the utf8Char to the constructed_str and go to the next char
      constructed_str = constructed_str .. utf8Char
      i = i + 1 

   end -- end while loop
   return constructed_str
end

-- Function to determine if a string is empty or nil
local function isempty(s)
   return s == nil or s == ''
 end

local function clock()
   local time = ""
   if isempty(savedVariables.clockFormat) then
      time = tostring(os.date("%a %B %d, %H:%M:%S"))
   else
      time = tostring(os.date(savedVariables.clockFormat))
   end

   SimpleClockLabel:SetText(iterateCharacters(time))
   zo_callLater(function () clock() end, 1000)
end

local function getVisibility()
   return savedVariables.visible
end

local function setVisibility(v)
   if(v == true) then
      ShowClock()
   else
      HideClock()
   end
end

local function getFontSize()
   return savedVariables.fontSize
end

local function setFontSize(v)

   local value = v

   local case = {
      [27] = function ()
         value = 26
      end,
      [29] = function()
         value = 28
      end,
      [31] = function ()
         value = 30
      end,
      [33] = function()
         value = 32
      end,
      [35] = function ()
         value = 34
      end,
      [37] = function()
         value = 36
      end,
      [38] = function ()
         value = 36
      end,
      [39] = function()
         value = 40
      end
   }

   if case[value] then
      case[value]()
   end

   SimpleClockLabel:SetFont("$(" .. savedVariables.font .. ")|$(KB_" .. value .. ")|soft-shadow-thick")
   savedVariables.fontSize = value

end

local function getFontChoices()
   local fontChoices = {}
   for k,v in pairs(fontTable) do
      fontChoices[#fontChoices+1] = v
   end
   return fontChoices
end

local function getFont()
   local sv_font = savedVariables.font
   return fontTable[sv_font]
end

local function setFont(font)

      for k,v in pairs(fontTable) do
         if v == font then
            savedVariables.font = k
            SimpleClockLabel:SetFont("$("..k..")|$(KB_" .. getFontSize() .. ")|soft-shadow-thick")
         end
      end

   
end

local function getFontColor()
   return savedVariables.fontColor.r,savedVariables.fontColor.g,savedVariables.fontColor.b,savedVariables.fontColor.a
end

local function setFontColor(r,g,b,a)
   SimpleClockLabel:SetColor(r,g,b,a)
   savedVariables.fontColor.r = r
   savedVariables.fontColor.g = g
   savedVariables.fontColor.b = b
   savedVariables.fontColor.a = a
end

local function getClockFormat()
   return savedVariables.clockFormat
end

local function setClockFormat(clockFormat)
   savedVariables.clockFormat = clockFormat
end

local function initializeSimpleClockAddon()
   setVisibility(savedVariables.visible)
   setFont(savedVariables.font)
   setFontSize(savedVariables.fontSize)
   setFontColor(savedVariables.fontColor.r,savedVariables.fontColor.g,savedVariables.fontColor.b,savedVariables.fontColor.a)
   setClockFormat(savedVariables.clockFormat)
   local fontChoices = getFontChoices()

   local LAM = LibAddonMenu2
   local panelName = "SimpleClockOptions"

   local panelData = {
      type = "panel",
      name = "SimpleClock",
      author = "@moshulu"
   }

   local optionsData = {
      [1] = {
         type = "checkbox",
         name = GetString(SIMPLECLOCK_VISIBLE),
         tooltip = GetString(SIMPLECLOCK_VISIBLE_TOOLTIP),
         getFunc = function() return getVisibility() end,
         setFunc = function(value) setVisibility(value) end
      },
      [2] = {
         type = "dropdown",
         name = GetString(SIMPLECLOCK_FONT),
         choices = fontChoices,
         getFunc = function() return getFont() end,
         setFunc = function(value) setFont(value) end
      },
      [3] = {
         type = "slider",
         name = GetString(SIMPLECLOCK_FONTSIZE),
         getFunc = function() return getFontSize() end,
         setFunc = function(value) setFontSize(value) end,
         min = 8,
         max = 40
      },
      [4] = {
         type = "colorpicker",
         name = GetString(SIMPLECLOCK_FONTCOLOR),
         getFunc = function() return getFontColor() end,
         setFunc = function(r,g,b,a) setFontColor(r,g,b,a) end
      },
      [5] = {
         type = "editbox",
         name = GetString(SIMPLECLOCK_CLOCKFORMAT),
         tooltip = GetString(SIMPLECLOCK_CLOCKFORMAT_TOOLTIP),
         getFunc = function() return getClockFormat() end,
         setFunc = function(clockFormat) setClockFormat(clockFormat) end
      }
   }

   local panel = LAM:RegisterAddonPanel(panelName, panelData)
   LAM:RegisterOptionControls(panelName, optionsData)
end

function SimpleClock.OnAddOnLoaded(event, name)
   if name ~= "SimpleClock" then return end
   EVENT_MANAGER:UnregisterForEvent("SimpleClock", EVENT_ADD_ON_LOADED)

   local defaults = {
      fontSize = 24,
      font = "Medium",
      fontColor = {
         r = 255,
         g = 255,
         b = 255,
         a = 255
      },
      visible = true,
      clockFormat = "%a %B %d, %H:%M:%S"
   }
   savedVariables = ZO_SavedVars:NewAccountWide('SimpleClockVars', 3, nil, defaults)

   initializeSimpleClockAddon()
   clock()
end
 
SLASH_COMMANDS["/showclock"] = ShowClock
SLASH_COMMANDS['/hideclock'] = HideClock

EVENT_MANAGER:RegisterForEvent(SimpleClock.name, EVENT_ADD_ON_LOADED, SimpleClock.OnAddOnLoaded)
