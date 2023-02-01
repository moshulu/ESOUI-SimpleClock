
SimpleClock = {}
SimpleClock.name = "SimpleClock"

local function ShowClock()
   FooAddonIndicatorLabel:SetHidden(false)
end

local function HideClock()
   FooAddonIndicatorLabel:SetHidden(true)
end

local function clock()
   time = os.date("%a %b %d, %H:%M:%S")   
   FooAddonIndicatorLabel:SetText(time)
   zo_callLater(function () clock() end, 1000)
end

function SimpleClock.OnAddOnLoaded()
   clock()
end
 
SLASH_COMMANDS["/showclock"] = ShowClock
SLASH_COMMANDS['/hideclock'] = HideClock


EVENT_MANAGER:RegisterForEvent(SimpleClock.name, EVENT_ADD_ON_LOADED, SimpleClock.OnAddOnLoaded)
