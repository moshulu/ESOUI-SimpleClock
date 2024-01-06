local localization_strings = {
  SIMPLECLOCK_VISIBLE = "Visível",
  SIMPLECLOCK_VISIBLE_TOOLTIP = "Mostra ou oculta o relógio.",
  SIMPLECLOCK_FONT = "Fonte",
  SIMPLECLOCK_FONTSIZE = "Tamanho da fonte",
  SIMPLECLOCK_FONTCOLOR = "Cor da fonte",
  SIMPLECLOCK_CLOCKFORMAT = "Formato do relógio",
  SIMPLECLOCK_CLOCKFORMAT_TOOLTIP = [[
  Código  Exemplo        Descrição
  %a	 -  Qua    -     Nome abreviado do dia da semana
  %A	 -  Quarta-feira -  Nome completo do dia da semana
  %b	 -  Set     -    Nome abreviado do mês
  %B	 -  Setembro  - Nome completo do mês
  %c	 -  16/09/98 23:48:10  - Data e hora
  %d	 -  16     -     Dia do mês
  %H	 -  23     -     Hora, usando o formato de 24 horas
  %I	 -  11     -     Hora, usando o formato de 12 horas
  %j	 -  259    -     Dia do ano
  %m	 -  09     -     Mês
  %M	 -  48     -     Minuto
  %p	 -  pm     -     "AM" ou "PM"
  %S	 -  10     -     Segundo
  %U	 -  37     -     Número da semana (primeiro domingo como o primeiro dia da semana um)
  %w	 -  3      -     Dia da semana
  %W	 -  37     -     Número da semana (primeira segunda-feira como o primeiro dia da semana um)
  %x	 -  16/09/98  -  Data
  %X	 -  23:48:10  -  Hora
  %y	 -  98     -     Ano com dois dígitos
  %Y	 -  1998    -    Ano completo
  %z	 -  -0400   -    Deslocamento do horário em relação ao UTC no fuso horário (1 minuto = 1, 1 hora = 100)
  %Z	 -  Eastern Daylight Time  -  Nome ou abreviação do fuso horário *
  %%	 -    %     -    O caractere %
  ]],
}

for stringId, stringValue in pairs(localization_strings) do
  ZO_CreateStringId(stringId, stringValue)
  SafeAddVersion(stringId, 1)
end
