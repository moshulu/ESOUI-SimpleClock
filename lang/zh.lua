local localization_strings = {
  SIMPLECLOCK_VISIBLE = "可见",
  SIMPLECLOCK_VISIBLE_TOOLTIP = "显示或隐藏时钟。",
  SIMPLECLOCK_FONT = "字体",
  SIMPLECLOCK_FONTSIZE = "字体大小",
  SIMPLECLOCK_FONTCOLOR = "字体颜色",
  SIMPLECLOCK_CLOCKFORMAT = "时钟格式",
  SIMPLECLOCK_CLOCKFORMAT_TOOLTIP = [[
  代码  示例        描述
  %a	 -  周三    -     缩写的星期几名称
  %A	 -  星期三 -  完整的星期几名称
  %b	 -  九月     -    缩写的月份名称
  %B	 -  九月  - 完整的月份名称
  %c	 -  09/16/98 23:48:10  - 日期和时间
  %d	 -  16     -     月份中的日期
  %H	 -  23     -     使用24小时制的小时
  %I	 -  11     -     使用12小时制的小时
  %j	 -  259    -     年份中的第几天
  %m	 -  09     -     月份
  %M	 -  48     -     分钟
  %p	 -  下午     -     "上午"或"下午"
  %S	 -  10     -     秒钟
  %U	 -  37     -     周数（以星期日作为第一周的第一天）
  %w	 -  3      -     星期几
  %W	 -  37     -     周数（以星期一作为第一周的第一天）
  %x	 -  09/16/98  -  日期
  %X	 -  23:48:10  -  时间
  %y	 -  98     -     两位数的年份
  %Y	 -  1998    -    完整的年份
  %z	 -  -0400   -    时区相对于UTC的ISO 8601偏移量（1分钟=1，1小时=100）
  %Z	 -  东部夏令时  -  时区名称或缩写 *
  %%	 -    %     -    百分号字符
  ]],
}

for stringId, stringValue in pairs(localization_strings) do
  ZO_CreateStringId(stringId, stringValue)
  SafeAddVersion(stringId, 1)
end
