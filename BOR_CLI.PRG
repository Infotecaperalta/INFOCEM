do sets
clear
w_numero=0
ss=0
op=0
DEFINE WINDOW borra1 FROM 2,10 TO 15,70;
TITLE " " ;
SYSTEM NOGROW FLOAT CLOSE; 
COLOR  RGB(0,0,0,192,192,192),,,,,W+/N
activate wind borra1
*do reloj

clear

@ 0,4 say "PROCESO PARA BORRAR UN CLIENTE" FONT "MS Sans Serif", 15  STYLE "BU" 
@ 4,7 say "Ingrese Nro. de Código:" FONT "MS Sans Serif", 8 STYLE "B" COLOR RGB(0,0,0,192,192,192)
@ 4,28 get w_numero function"!" font"Courier New" , 9 COLOR RGB(0,0,0,255,255,255),RGB(0,0,0,255,255,255) 

@ 8,1 to 8,60
@ 9,5 GET ss PICTURE  "@*HT Confirmar" FONT "Times New Roman", 10 style "B" size 2,14 COLOR RGB(0,0,0,255,255,255),RGB(0,0,0,255,255,255) valid AfterOp(.t.)
@ 9,43 GET ss PICTURE  "@*HT Salir" FONT "Times New Roman", 10 style "B" size 2,14 COLOR RGB(0,0,0,255,255,255),RGB(0,0,0,255,255,255) valid AfterOp(.f.)

read
do case 
   	case op=1
		use f_clie exclu
		go top 
		ss=str(w_numero)
		do while .not.eof()
			if w_numero=codigo
       	   		delete          
		    endif
			skip
		enddo
		pack
		close all
		use f_clie
		index on str(codigo) to fclie1
		index on nombre to fclie2
		close database          
endcase
deac wind borra1
clear
do logo
return


procedure AfterOp
parameters xop
if xop=.f.
	op=2
else
	op=1
	bus_prox=.t.
endif
return .t.
