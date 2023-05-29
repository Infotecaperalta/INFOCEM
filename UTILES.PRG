@ 12,15 SAY " ACTUALIZANDO ARCHIVOS " FONT 'Courier',24 STYLE "B" COLOR RGB(128,0,0,0,255,255) 




do sets
SELECT 1
USE TARIFAS INDEX TARIFAS
SELECT 2
USE USUARIOS INDEX USU-NUM.IDX,USU-NOM.IDX,USU-NUM1.IDX,MANZA.IDX,MANZA1.IDX,EMISION.IDX
SET ORDER TO 1
* **** Bucle Principal
=SetKey()

CLEAR
w_cod1=space(15)
w_cod2=space(15)
w_cod3=space(15)
w_cod4=space(15)
w_apell=space(30)
w_domi=space(30)
w_ubi=space(30)
w_lote=space(6)
w_manza=space(6)
w_nro=0
store 0 to w_ban,des1,des2,des3,des4,met1,met2,met3,met4
gx_buttpress=0
ss=1
op=1
encont=.f.


DEFINE WINDOW p1 FROM 0,0 TO 26,77;
TITLE " " ;
SYSTEM NOGROW FLOAT CLOSE; 
COLOR  RGB(0,0,0,192,192,192),,,,,W+/N
activate wind p1
		
do while .t.
	clear
	bus_prox=.f.

	@ 0,17 say "INGRESO DE CONTRIBUYENTES" FONT "MS Sans Serif", 15  STYLE "BU" 
	@ 4,3 say "Nro. de USUARIO:" FONT "MS Sans Serif", 8 STYLE "B" COLOR RGB(0,0,0,192,192,192)

	@ 4,33 SAY "NOMBRE:"FONT "MS Sans Serif", 8 STYLE "B" COLOR RGB(0,0,0,192,192,192)
	@ 6,3 SAY "DOMICILIO:"FONT "MS Sans Serif", 8 STYLE "B" COLOR RGB(0,0,0,192,192,192)
	@ 6,55 SAY "LOTE:"FONT "MS Sans Serif", 8 STYLE "B" COLOR RGB(0,0,0,192,192,192)
	@ 8,3 SAY "UBICACION:"FONT "MS Sans Serif", 8 STYLE "B" COLOR RGB(0,0,0,192,192,192)
	@ 8,55 say "MANZANA:"FONT "MS Sans Serif", 8 STYLE "B" COLOR RGB(0,0,0,192,192,192)
	@ 10,3 SAY "METROS 1:"FONT "MS Sans Serif", 8 STYLE "B" COLOR RGB(0,0,0,192,192,192)
	@ 10,27 SAY "METROS 2:"FONT "MS Sans Serif", 8 STYLE "B" COLOR RGB(0,0,0,192,192,192)
	@ 10,49 SAY "DTO. 1:"FONT "MS Sans Serif", 8 STYLE "B" COLOR RGB(0,0,0,192,192,192)
	@ 10,62 SAY "DTO. 2:"FONT "MS Sans Serif", 8 STYLE "B" COLOR RGB(0,0,0,192,192,192)
	@ 12,3 SAY "METROS 3:"FONT "MS Sans Serif", 8 STYLE "B" COLOR RGB(0,0,0,192,192,192)
	@ 12,27 SAY "METROS 4:"FONT "MS Sans Serif", 8 STYLE "B" COLOR RGB(0,0,0,192,192,192)
	@ 12,49 SAY "DTO. 3:"FONT "MS Sans Serif", 8 STYLE "B" COLOR RGB(0,0,0,192,192,192)
	@ 12,62 SAY "DTO. 4:"FONT "MS Sans Serif", 8 STYLE "B" COLOR RGB(0,0,0,192,192,192)
	@ 14,3 say "CODIGO 1:"FONT "MS Sans Serif", 8 STYLE "B" COLOR RGB(0,0,0,192,192,192)
	@ 14,46 say "CODIGO 2:"FONT "MS Sans Serif", 8 STYLE "B" COLOR RGB(0,0,0,192,192,192)
	@ 16,3 say "CODIGO 3:"FONT "MS Sans Serif", 8 STYLE "B" COLOR RGB(0,0,0,192,192,192)
	@ 16,46 say "CODIGO 4:"FONT "MS Sans Serif", 8 STYLE "B" COLOR RGB(0,0,0,192,192,192)
	@ 18,3 say "LUGAR DE PAGO:" FONT "MS Sans Serif", 8 STYLE "B" COLOR RGB(0,0,0,192,192,192)
	@ 19,15 say "Los códigos estan ordenados de acuerdo a la posición en tarifas F1 para <AYUDA> " FONT "MS Sans Serif", 5 STYLE "B" COLOR RGB(0,0,192)
	@ 20,15 say "En ubicación indicar las calles ordenadas según frente 1,2,3,4     " FONT "MS Sans Serif", 5 STYLE "B" COLOR RGB(0,0,192)
	@ 21,0 to 21,77

	@ 4,18 get w_nro function"!" font"Courier New" , 9 COLOR RGB(0,0,0,255,255,255),RGB(0,0,0,255,255,255) valid Lectura()
	@ 4,43 get w_apell function "!"  font"Courier New" , 9 COLOR RGB(0,0,0,255,255,255),RGB(0,0,0,255,255,255)
  	@ 6,18 get w_domi function "!" font"Courier New" , 9 COLOR RGB(0,0,0,255,255,255),RGB(0,0,0,255,255,255)
  	@ 6,67 get w_lote function "!"font"Courier New" , 9 COLOR RGB(0,0,0,255,255,255),RGB(0,0,0,255,255,255) 
  	@ 8,18 get w_ubi function "!"font"Courier New" , 9 COLOR RGB(0,0,0,255,255,255),RGB(0,0,0,255,255,255)
  	@ 8,67 get w_manza function "!"font"Courier New" , 9 COLOR RGB(0,0,0,255,255,255),RGB(0,0,0,255,255,255)
  	@ 10,18 get met1 picture"99999.99"font"Courier New" , 9 COLOR RGB(0,0,0,255,255,255),RGB(0,0,0,255,255,255)
  	@ 10,38 get met2 picture"99999.99"font"Courier New" , 9 COLOR RGB(0,0,0,255,255,255),RGB(0,0,0,255,255,255)
  	@ 10,58 get des1 picture"99"font"Courier New" , 9 COLOR RGB(0,0,0,255,255,255),RGB(0,0,0,255,255,255) 
  	@ 10,71 get des2 picture"99"font"Courier New" , 9 COLOR RGB(0,0,0,255,255,255),RGB(0,0,0,255,255,255)
  	@ 12,18 get met3 picture"99999.99"font"Courier New" , 9 COLOR RGB(0,0,0,255,255,255),RGB(0,0,0,255,255,255) 
  	@ 12,38 get met4 picture"99999.99"font"Courier New" , 9 COLOR RGB(0,0,0,255,255,255),RGB(0,0,0,255,255,255) 
  	@ 12,58 get des3 picture"99"font"Courier New" , 9 COLOR RGB(0,0,0,255,255,255),RGB(0,0,0,255,255,255) 
  	@ 12,71 get des4 picture"99"font"Courier New" , 9 COLOR RGB(0,0,0,255,255,255),RGB(0,0,0,255,255,255) 
  	@ 14,18 get w_cod1 function "!"font"Courier New" , 9 COLOR RGB(0,0,0,255,255,255),RGB(0,0,0,255,255,255) 
  	@ 14,58 get w_cod2 function "!"font"Courier New" , 9 COLOR RGB(0,0,0,255,255,255),RGB(0,0,0,255,255,255) 
  	@ 16,18 get w_cod3 function "!"font"Courier New" , 9 COLOR RGB(0,0,0,255,255,255),RGB(0,0,0,255,255,255) 
  	@ 16,58 get w_cod4 function "!" font"Courier New" , 9 COLOR RGB(0,0,0,255,255,255),RGB(0,0,0,255,255,255) 
	@ 18,18 get w_ban picture"99" font"Courier New" , 9 COLOR RGB(0,0,0,255,255,255),RGB(0,0,0,255,255,255) 

    @ 22,5 GET ss PICTURE  "@*HT Confirmar" FONT "Times New Roman", 10 style "B" size 2,14 COLOR RGB(0,0,0,255,255,255),RGB(0,0,0,255,255,255) valid AfterOp(.t.)
    @ 22,16 GET ss PICTURE  "@*HT Salir" FONT "Times New Roman", 10 style "B" size 2,14 COLOR RGB(0,0,0,255,255,255),RGB(0,0,0,255,255,255) valid AfterOp(.f.)

    @ 22, 27 GET GX_buttpress PICTURE  "@*HT Primero " SIZE 2,14 FONT "MS Sans Serif", 8 STYLE"B" VALID IrA( 1 )
    @ 22, 38 GET GX_buttpress PICTURE  "@*HT Anterior" SIZE 2,14 FONT "MS Sans Serif", 8 STYLE"B" VALID IrA( 2 )
    @ 22, 49 GET GX_buttpress PICTURE  "@*HT Proximo " SIZE 2,14 FONT "MS Sans Serif", 8 STYLE"B" VALID IrA( 3 )
    @ 22, 60 GET GX_buttpress PICTURE  "@*HT Ultimo  " SIZE 2,14 FONT "MS Sans Serif", 8 STYLE"B" VALID IrA( 4 )

  	read
	if lastkey()=27
    	exit
	endif
	
	do case 
    	case op=1
    		sele 2
  * **** Si no existia registro lo crea
			if .not. encont
    			append blank
			endif
			replace usuario with w_nro  
			replace nombre with w_apell 
			replace domicilio with w_domi
			replace ubicacion with w_ubi
			replace lote with w_lote
			replace manzana with w_manza
			replace metros1 with met1
			replace metros2 with met2
			replace metros3 with met3
			replace metros4 with met4
			replace codigo1 with w_cod1
			replace codigo2 with w_cod2
			replace codigo3 with w_cod3
			replace codigo4 with w_cod4
			replace descue1 with des1
			replace descue2 with des2
			replace descue3 with des3
			replace descue4 with des4 
			replace banco with w_ban

			if bus_prox=.t.
				=Borro()
				w_nro=0
			endif
		case op=2
			exit
	endcase
enddo 
set order to 0
close database
deac wind p1
on key
do logo
return


procedure Lectura
sele 2
seek str(w_NRO)
encont = .F.
* **** Si encontro clave edita descripcion
if found ()
    encont = .T.
    w_apell=nombre
    w_domi=domicilio
    w_ubi=ubicacion
    w_lote=lote
    w_manza=manzana
    met1=metros1
    met2=metros2
    met3=metros3
    met4=metros4
    w_cod1=codigo1
    w_cod2=codigo2
    w_cod3=codigo3
    w_cod4=codigo4
    des1=descue1
    des2=descue2
    des3=descue3
    des4=descue4
    w_ban=banco
else
	=Borro()
endif
show gets
return .t.


procedure AfterOp
parameters xop
if xop=.f.
	op=2
else
	op=1
	bus_prox=.t.
endif
return .t.



procedure IrA
parameters xreg
=Borro()
sele 2 
set order to 1
do case 
	case xreg=1
		go top
	case xreg=2
		if !bof()
			skip -1
		endif
	case xreg=3
		if !eof()
			skip 
		endif
	case xreg=4
		go bott
endcase
w_nro=usuario
=Lectura()
return .t.


procedure Borro
	w_cod1=space(15)
	w_cod2=space(15)
	w_cod3=space(15)
	w_cod4=space(15)
	w_apell=space(30)
	w_domi=space(30)
	w_ubi=space(30)
	w_lote=space(6)
	w_manza=space(6)
	store 0 to w_ban,des1,des2,des3,des4,met1,met2,met3,met4
	gx_buttpress=0
	ss=1
	op=1


procedure SetKey
on key label ESC do nada
on key label F1 do Ayuda with VARREAD()


procedure nada


procedure Ayuda
parameters xfield
on key
do case
	case xfield="W_BAN"
		SELECT 1
     	define window panta7 from 0,0 to 24,79
     	activate window panta7
     	brow
     	deac window panta7
endcase
=Setkey()

