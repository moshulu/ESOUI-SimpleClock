local localization_strings = {
  SIMPLECLOCK_VISIBLE = "Visible",
  SIMPLECLOCK_VISIBLE_TOOLTIP = "Muestra u oculta el reloj.",
  SIMPLECLOCK_FONT = "Fuente",
  SIMPLECLOCK_FONTSIZE = "Tamaño de fuente",
  SIMPLECLOCK_FONTCOLOR = "Color de fuente",
  SIMPLECLOCK_CLOCKFORMAT = "Formato de reloj",
  SIMPLECLOCK_CLOCKFORMAT_TOOLTIP = [[
  Código  Ejemplo        Descripción
  %a	 -  Mié   -     Nombre abreviado del día de la semana
  %A	 -  Miércoles -  Nombre completo del día de la semana
  %b	 -  Sep     -    Nombre abreviado del mes
  %B	 -  Septiembre  - Nombre completo del mes
  %c	 -  09/16/98 23:48:10  - Fecha y hora
  %d	 -  16     -     Día del mes
  %H	 -  23     -     Hora en formato de 24 horas
  %I	 -  11     -     Hora en formato de 12 horas
  %j	 -  259    -     Día del año
  %m	 -  09     -     Mes
  %M	 -  48     -     Minuto
  %p	 -  pm     -     "AM" o "PM"
  %S	 -  10     -     Segundo
  %U	 -  37     -     Número de semana (primer domingo como primer día de la semana uno)
  %w	 -  3      -     Día de la semana
  %W	 -  37     -     Número de semana (primer lunes como primer día de la semana uno)
  %x	 -  09/16/98  -  Fecha
  %X	 -  23:48:10  -  Hora
  %y	 -  98     -     Año de dos dígitos
  %Y	 -  1998    -    Año completo
  %z	 -  -0400   -    Desplazamiento de la zona horaria respecto a UTC en formato ISO 8601 (1 minuto = 1, 1 hora = 100)
  %Z	 -  Eastern Daylight Time  -  Nombre o abreviatura de la zona horaria *
  %%	 -    %     -    El carácter %
  ]],
}

for stringId, stringValue in pairs(localization_strings) do
  ZO_CreateStringId(stringId, stringValue)
  SafeAddVersion(stringId, 1)
end
