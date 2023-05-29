do sets
clear
@ 12,10 SAY "  ACTUALIZANDO ARCHIVOS  " font "MS Sans Serif",20 STYLE "B" COLOR RGB(0,0,0,192,192,192)
USE F_arti
PACK
INDEX ON STR(CODIGO) TO xarticod
INDEX ON detalle TO xartinom
CLEAR
DO LOGO
close data
return    