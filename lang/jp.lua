local localization_strings = {
  SIMPLECLOCK_VISIBLE = "表示",
  SIMPLECLOCK_VISIBLE_TOOLTIP = "時計を表示または非表示にします。",
  SIMPLECLOCK_FONT = "フォント",
  SIMPLECLOCK_FONTSIZE = "フォントサイズ",
  SIMPLECLOCK_FONTCOLOR = "フォントの色",
  SIMPLECLOCK_CLOCKFORMAT = "時計の形式",
  SIMPLECLOCK_CLOCKFORMAT_TOOLTIP = [[
  コード  例        説明
  %a	 -  水    -     曜日の省略形
  %A	 -  水曜日 -  曜日の完全な名称
  %b	 -  9月     -    月の省略形
  %B	 -  9月  - 月の完全な名称
  %c	 -  09/16/98 23:48:10  - 日付と時刻
  %d	 -  16     -     月の日付
  %H	 -  23     -     24時間制の時
  %I	 -  11     -     12時間制の時
  %j	 -  259    -     年の通算日
  %m	 -  09     -     月
  %M	 -  48     -     分
  %p	 -  午後     -     "AM"または"PM"
  %S	 -  10     -     秒
  %U	 -  37     -     週番号（最初の日曜日を週の最初の日とする）
  %w	 -  3      -     曜日
  %W	 -  37     -     週番号（最初の月曜日を週の最初の日とする）
  %x	 -  09/16/98  -  日付
  %X	 -  23:48:10  -  時刻
  %y	 -  98     -     2桁の年
  %Y	 -  1998    -    完全な年
  %z	 -  -0400   -    タイムゾーンのUTCからのISO 8601オフセット（1分 = 1、1時間 = 100）
  %Z	 -  東部夏時間  -  タイムゾーンの名前または略語 *
  %%	 -    %     -    %文字
  ]],
}

for stringId, stringValue in pairs(localization_strings) do
  ZO_CreateStringId(stringId, stringValue)
  SafeAddVersion(stringId, 1)
end
