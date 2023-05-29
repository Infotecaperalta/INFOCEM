clear

vape77=space(30)
ss=0
op=0

DEFINE WINDOW panta2 FROM 18,30 TO 34,85;
TITLE "PADRON DE CLIENTES ALFABETICO " ;
SYSTEM NOGROW FLOAT NOCLOSE; 
COLOR  RGB(0,0,0,192,192,192),,,,,W+/N

DEFINE WINDOW pant1 FROM 18,30 TO 24,85;
TITLE " " ;
SYSTEM NOGROW FLOAT NOCLOSE; 
COLOR  RGB(0,0,0,192,192,192),,,,,W+/N
activate wind pant1

@ 0,1 say " PROCESO PARA OBTENER EL NRO. PROVEEDOR " FONT "MS Sans Serif", 12  STYLE "BU" 

@ 2,3 SAY "Ingrese el Nombre y Apellido: " FONT "MS Sans Serif", 8 STYLE "B" COLOR RGB(0,0,0,192,192,192)

@ 2,26 get vape77 funct "!" font"Courier New" , 9 COLOR RGB(0,0,0,255,255,255),RGB(0,0,0,255,255,255) 

read
if lastkey()=27
   deac wind pant1
   clear
   return
endif
go top 
do while .not.eof()
  IF SUBSTR(VAPE77,1,3)=SUBSTR(NOMBRE,1,3)
    acti wind panta2
    BROW
    deac wind panta2
    exit
  ENDIF
  SKIP
ENDDO
IF EOF()
  DEFINE WINDOW err1 FROM 15,15 TO 19,65;
  TITLE " " ;
  SYSTEM NOGROW FLOAT NOCLOSE; 
  COLOR  RGB(0,0,0,192,192,192),,,,,W+/N
  activate wind err1
  @ 1,1 say " EL PROVEEDOR NO EXISTE "
  au=inkey(0)
  release wind err1
endif
deac wind pant1
f_prov.refresh
return



procedure nada

procedure AfterOp
parameters xop
if xop=.f.
	op=2
else
	op=1
endif
return .t.
