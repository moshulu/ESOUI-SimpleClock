local localization_strings = {
  SIMPLECLOCK_VISIBLE = "Visible",
  SIMPLECLOCK_VISIBLE_TOOLTIP = "Affiche ou masque l'horloge.",
  SIMPLECLOCK_FONT = "Police",
  SIMPLECLOCK_FONTSIZE = "Taille de Police",
  SIMPLECLOCK_FONTCOLOR = "Couleur de Police",
  SIMPLECLOCK_CLOCKFORMAT = "Format d'Horloge",
  SIMPLECLOCK_CLOCKFORMAT_TOOLTIP = [[
  Code  Exemple        Description
  %a	 -  Mer.    -    Le nom du jour abrégé
  %A	 -  Wednesday -  Le nom du jour complet
  %b	 -  Sep     -    Le nom du mois abrégé
  %B	 -  September  - Le nom du mois complet
  %c	 -  09/16/98 23:48:10  - La date et l'heure
  %d	 -  16     -     Le jour du mois
  %H	 -  23     -     L'heure, avec 24h
  %I	 -  11     -     L'heure, avec 12h
  %j	 -  259    -     Le jour de l'année
  %m	 -  09     -     Le mois
  %M	 -  48     -     La minute
  %p	 -  pm     -     "AM" ou "PM"
  %S	 -  10     -     La seconde
  %U	 -  37     -     Le nombre de semaine (le premier dimanche est le premier jour de la première semaine)
  %w	 -  3      -     Le jour de la semaine
  %W	 -  37     -     Nombre de semaine (le premier lundi est le premier jour de la première semaine)
  %x	 -  09/16/98  -  La date
  %X	 -  23:48:10  -  L'heure
  %y	 -  98     -     L'année à deux chiffres
  %Y	 -  1998    -    L'année complète
  %z	 -  -0400   -    La difference du temps universel (1 minute = 1, 1 horaire = 100)
  %Z	 -  Heure normale d'Europe centrale  -  Nom de fuseau horaire
  %%	 -    %     -    Le % caractère
  ]],
}

for stringId, stringValue in pairs(localization_strings) do
  ZO_CreateStringId(stringId, stringValue)
  SafeAddVersion(stringId, 1)
end
