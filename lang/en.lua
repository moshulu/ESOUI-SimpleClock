local localization_strings = {
  SIMPLECLOCK_VISIBLE = "Visible",
  SIMPLECLOCK_VISIBLE_TOOLTIP = "Shows or hides the clock.",
  SIMPLECLOCK_FONT = "Font",
  SIMPLECLOCK_FONTSIZE = "Font size",
  SIMPLECLOCK_FONTCOLOR = "Font color",
  SIMPLECLOCK_CLOCKFORMAT = "Clock format",
  SIMPLECLOCK_CLOCKFORMAT_TOOLTIP = [[
  Code  Example        Description
  %a	 -  Wed    -     Abbreviated weekday name
  %A	 -  Wednesday -  Full weekday name
  %b	 -  Sep     -    Abbreviated month name
  %B	 -  September  - Full month name
  %c	 -  09/16/98 23:48:10  - Date and time
  %d	 -  16     -     Day of the month
  %H	 -  23     -     Hour, using 24-hour clock
  %I	 -  11     -     Hour, using 12-hour clock
  %j	 -  259    -     Day of year
  %m	 -  09     -     Month
  %M	 -  48     -     Minute
  %p	 -  pm     -     Either "AM" or "PM"
  %S	 -  10     -     Second
  %U	 -  37     -     Week number (first Sunday as the first day of week one)
  %w	 -  3      -     Weekday
  %W	 -  37     -     Week number (first Monday as the first day of week one)
  %x	 -  09/16/98  -  Date
  %X	 -  23:48:10  -  Time
  %y	 -  98     -     Two-digit year
  %Y	 -  1998    -    Full year
  %z	 -  -0400   -    ISO 8601 offset from UTC in timezone (1 minute = 1, 1 hour = 100)
  %Z	 -  Eastern Daylight Time  -  Timezone name or abbreviation *
  %%	 -    %     -    The % character
  ]],
}

for stringId, stringValue in pairs(localization_strings) do
  ZO_CreateStringId(stringId, stringValue)
  SafeAddVersion(stringId, 1)
end
