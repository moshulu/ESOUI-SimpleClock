local localization_strings = {
  SIMPLECLOCK_VISIBLE = "Видимый",
  SIMPLECLOCK_VISIBLE_TOOLTIP = "Показывает или скрывает часы.",
  SIMPLECLOCK_FONT = "Шрифт",
  SIMPLECLOCK_FONTSIZE = "Размер шрифта",
  SIMPLECLOCK_FONTCOLOR = "Цвет шрифта",
  SIMPLECLOCK_CLOCKFORMAT = "Формат часов",
  SIMPLECLOCK_CLOCKFORMAT_TOOLTIP = [[
  Код  Пример        Описание
  %a	 -  Ср    -     Сокращенное название дня недели
  %A	 -  Среда -  Полное название дня недели
  %b	 -  Сен     -    Сокращенное название месяца
  %B	 -  Сентябрь  - Полное название месяца
  %c	 -  09/16/98 23:48:10  - Дата и время
  %d	 -  16     -     День месяца
  %H	 -  23     -     Часы в 24-часовом формате
  %I	 -  11     -     Часы в 12-часовом формате
  %j	 -  259    -     День года
  %m	 -  09     -     Месяц
  %M	 -  48     -     Минуты
  %p	 -  pm     -     Либо "AM", либо "PM"
  %S	 -  10     -     Секунды
  %U	 -  37     -     Номер недели (первое воскресенье первой недели)
  %w	 -  3      -     День недели
  %W	 -  37     -     Номер недели (первый понедельник первой недели)
  %x	 -  09/16/98  -  Дата
  %X	 -  23:48:10  -  Время
  %y	 -  98     -     Двухзначный год
  %Y	 -  1998    -    Полный год
  %z	 -  -0400   -    Смещение относительно UTC в часовом поясе (1 минута = 1, 1 час = 100)
  %Z	 -  Eastern Daylight Time  -  Название или сокращение часового пояса *
  %%	 -    %     -    Символ %
  ]],
}

for stringId, stringValue in pairs(localization_strings) do
  ZO_CreateStringId(stringId, stringValue)
  SafeAddVersion(stringId, 1)
end
