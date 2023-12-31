local localization_strings = {
  SIMPLECLOCK_VISIBLE = "Sichtbar",
  SIMPLECLOCK_VISIBLE_TOOLTIP = "Zeigt die Uhr an oder blendet sie aus.",
  SIMPLECLOCK_FONT = "Schriftart",
  SIMPLECLOCK_FONTSIZE = "Schriftgröße",
  SIMPLECLOCK_FONTCOLOR = "Schriftfarbe",
  SIMPLECLOCK_CLOCKFORMAT = "Uhrformat",
  SIMPLECLOCK_CLOCKFORMAT_TOOLTIP = [[
  Code  Beispiel        Beschreibung
  %a	 -  Mi    -     Abgekürzter Wochentagsname
  %A	 -  Mittwoch -  Voller Wochentagsname
  %b	 -  Sep     -    Abgekürzter Monatsname
  %B	 -  September  - Vollständiger Monatsname
  %c	 -  16.09.98 23:48:10  - Datum und Uhrzeit
  %d	 -  16     -     Tag des Monats
  %H	 -  23     -     Stunde im 24-Stunden-Format
  %I	 -  11     -     Stunde im 12-Stunden-Format
  %j	 -  259    -     Tag des Jahres
  %m	 -  09     -     Monat
  %M	 -  48     -     Minute
  %p	 -  pm     -     Entweder "AM" oder "PM"
  %S	 -  10     -     Sekunde
  %U	 -  37     -     Wochennummer (erster Sonntag als erster Tag der ersten Woche)
  %w	 -  3      -     Wochentag
  %W	 -  37     -     Wochennummer (erster Montag als erster Tag der ersten Woche)
  %x	 -  16.09.98  -  Datum
  %X	 -  23:48:10  -  Uhrzeit
  %y	 -  98     -     Jahr zweistellig
  %Y	 -  1998    -    Vollständiges Jahr
  %z	 -  -0400   -    ISO 8601 Abweichung von UTC in Zeitzonen (1 Minute = 1, 1 Stunde = 100)
  %Z	 -  Mitteleuropäische Sommerzeit  -  Zeitzonenname oder Abkürzung *
  %%	 -    %     -    Das % Zeichen
  ]],
}

for stringId, stringValue in pairs(localization_strings) do
  ZO_CreateStringId(stringId, stringValue)
  SafeAddVersion(stringId, 1)
end
