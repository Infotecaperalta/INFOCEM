do sets
clear
@ 12,10 SAY "  ACTUALIZANDO ARCHIVOS  " font "MS Sans Serif",20 STYLE "B" COLOR RGB(0,0,0,192,192,192)
USE F_prov
PACK
INDEX ON STR(CODIGO) TO xprovcod
INDEX ON NOMBRE TO xprovnom
index on localidad to xprovloc
index on provincia to xprovpro
CLEAR
DO LOGO
close data
return    