DEFINE WINDOW panta2 FROM 3,10 TO 34,85;
TITLE "PADRON DE PROVEEDORES POR CODIGO " ;
SYSTEM NOGROW FLOAT NOCLOSE; 
COLOR  RGB(0,0,0,192,192,192),,,,,W+/N
use f_prov index xprovnom, xprovloc, xprovpro, xprovcod
reindex
ACTI WIND PANTA2
browse noedit
DEAC WIND PANTA2
close all
