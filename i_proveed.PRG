=sys(1037)
set console off
set device to file andres.doc
set printer on
SET PRINTER FONT 'Courier', 12

@ prow()1,13 SAY thisform.f_prov.codigo.value font "MS Sans Serif",15 STYLE "B"
@ prow()+1,85 SAY "Liquidación" font "MS Sans Serif",8 STYLE "B"
@ prow()+1,13 say thisform.f_prov.nombre.value font "MS Sans Serif",8 Style "B"




set printer off
set printer to
Set device to screen
set console on
