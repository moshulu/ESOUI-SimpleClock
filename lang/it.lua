local localization_strings = {
  SIMPLECLOCK_VISIBLE = "Visibile",
  SIMPLECLOCK_VISIBLE_TOOLTIP = "Mostra o nasconde l'orologio.",
  SIMPLECLOCK_FONT = "Carattere",
  SIMPLECLOCK_FONTSIZE = "Dimensione del carattere",
  SIMPLECLOCK_FONTCOLOR = "Colore del carattere",
  SIMPLECLOCK_CLOCKFORMAT = "Formato dell'orologio",
  SIMPLECLOCK_CLOCKFORMAT_TOOLTIP = [[
  Codice  Esempio        Descrizione
  %a	 -  Mer    -     Nome abbreviato del giorno della settimana
  %A	 -  Mercoledì -  Nome completo del giorno della settimana
  %b	 -  Set     -    Nome abbreviato del mese
  %B	 -  Settembre  - Nome completo del mese
  %c	 -  16/09/98 23:48:10  - Data e ora
  %d	 -  16     -     Giorno del mese
  %H	 -  23     -     Ora, formato a 24 ore
  %I	 -  11     -     Ora, formato a 12 ore
  %j	 -  259    -     Giorno dell'anno
  %m	 -  09     -     Mese
  %M	 -  48     -     Minuto
  %p	 -  pm     -     "AM" o "PM"
  %S	 -  10     -     Secondo
  %U	 -  37     -     Numero della settimana (prima domenica come primo giorno della prima settimana)
  %w	 -  3      -     Giorno della settimana
  %W	 -  37     -     Numero della settimana (primo lunedì come primo giorno della prima settimana)
  %x	 -  16/09/98  -  Data
  %X	 -  23:48:10  -  Ora
  %y	 -  98     -     Anno a due cifre
  %Y	 -  1998    -    Anno completo
  %z	 -  -0400   -    Offset ISO 8601 rispetto all'UTC nel fuso orario (1 minuto = 1, 1 ora = 100)
  %Z	 -  Eastern Daylight Time  -  Nome o abbreviazione del fuso orario *
  %%	 -    %     -    Il carattere %
  ]],
}

for stringId, stringValue in pairs(localization_strings) do
  ZO_CreateStringId(stringId, stringValue)
  SafeAddVersion(stringId, 1)
end
