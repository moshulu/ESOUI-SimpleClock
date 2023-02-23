
SimpleClock = {}
SimpleClock.name = "SimpleClock"

local savedVariables

local function ShowClock()
   SimpleClockLabel:SetHidden(false)
end

local function HideClock()
   SimpleClockLabel:SetHidden(true)
end

local function clock()
   time = os.date("%a %b %d, %H:%M:%S")
   SimpleClockLabel:SetText(time)
   zo_callLater(function () clock() end, 1000)
end

local function getFontSize()
   d("getfontsize")
   d(savedVariables.fontSize)
   return savedVariables.fontSize
end

local function setFontSize(v)
   d("setfontsize")
   d(savedVariables.fontSize)
   local value = v

   local case = {
     [27] = function ()
         value = 26
     end,
     [29] = function ()
         value = 28
      end,
      [31] = function ()
         value = 30
      end,
      [33] = function ()
         value = 32
      end,
      [35] = function ()
         value = 34
      end,
      [37] = function ()
         value = 36
      end,
      [38] = function ()
         value = 36
      end,
      [39] = function ()
         value = 40
      end,
   }

  if case[value] then
     case[value]()
  end

   SimpleClockLabel:SetFont("$(".. savedVariables.font .. ")|$(KB_" .. value .. ")|soft-shadow-thick")
   savedVariables.fontSize = value
end

local function setFont(font)
   SimpleClockLabel:SetFont("$(".. font .. ")|$(KB_" .. getFontSize() .. ")|soft-shadow-thick")
   savedVariables.font = font
end

local function getFont()
   return savedVariables.font
end

local function getFontColor()
   return savedVariables.fontColor.r, savedVariables.fontColor.g, savedVariables.fontColor.b, savedVariables.fontColor.a
end

local function setFontColor(r, g, b, a)
   SimpleClockLabel:SetColor(r,g,b,a)
   savedVariables.fontColor.r = r
   savedVariables.fontColor.g = g
   savedVariables.fontColor.b = b
   savedVariables.fontColor.a = a
end

local function initializeSimpleClockAddon()

   setFontSize(savedVariables.fontSize)
   setFont(savedVariables.font)
   setFontColor(
      savedVariables.fontColor.r,
      savedVariables.fontColor.g,
      savedVariables.fontColor.b,
      savedVariables.fontColor.a
   )

   local LAM = LibAddonMenu2
   local panelName = "SimpleClockOptions"
   
   local panelData = {
      type = "panel",
      name = "SimpleClock",
      author = "@moshulu",
   }
   
   local optionsData = {
         [1] = {
            type = "dropdown",
            name = "Font",
            tooltip = "The font of the clock.",
            choices = {
            "MEDIUM_FONT",
            "BOLD_FONT",
            "CHAT_FONT",
            "GAMEPAD_LIGHT_FONT",
            "GAMEPAD_MEDIUM_FONT",
            "GAMEPAD_BOLD_FONT",
            "ANTIQUE_FONT",
            "HANDWRITTEN_FONT",
            "STONE_TABLET_FONT"
         },
            getFunc = function() return getFont() end,
            setFunc = function(value) setFont(value) end,
      },
      [2] = {
           type = "slider",
           name = "Font size",
           tooltip = "The font size of the clock",
           getFunc = function() return getFontSize() end,
           setFunc = function(value) setFontSize(value) end,
           min = 8,
           max = 40
      },
      [3] = {
           type = "colorpicker",
           name = "Font color",
           tooltip = "The color of the font of the clock.",
           getFunc = function() return getFontColor() end,
           setFunc = function(r,g,b,a) setFontColor(r, g, b, a) end
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
      font = "GAMEPAD_LIGHT_FONT",
      fontColor = {
         r = 255,
         g = 255,
         b = 255,
         a = 255,
      }
   }
   savedVariables = ZO_SavedVars:NewAccountWide("SimpleClockVars", 3, nil, defaults)

   initializeSimpleClockAddon()
   clock()
end
 
SLASH_COMMANDS["/showclock"] = ShowClock
SLASH_COMMANDS['/hideclock'] = HideClock

EVENT_MANAGER:RegisterForEvent(SimpleClock.name, EVENT_ADD_ON_LOADED, SimpleClock.OnAddOnLoaded)
