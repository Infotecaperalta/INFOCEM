select 39
use auxiliar
zap

select 6
use comtrigp index comtpnum SHARED

v_anal='NO'
v_tipo='   NINGUNO     '

do while .t.
  panta2:=savescreen(11,21,16,65)
  setcolor('w+/rb')
  dispbox(11,21,16,65,'         ')
  @11,21 to 16,65
  d1=ctod('')
  d2=dATE()

  do while .t.
    @12,23 say 'Desde Fecha:'get d1 
    read
    if lastkey()=27 .or. lastkey()=18
      exit
    endif
    do while .t.
      @14,23 say 'Hasta Fecha:'get d2 
      read
      if lastkey()=27 .or. lastkey()=18
        exit
      endif
      exit
    enddo
    if lastkey()=18
      loop
    endif
    exit
  enddo
  if lastkey()=27
    setcolor('rb/w')
    restscreen(11,21,15,65,panta2)
    exit
  endif
  
  setcolor('W+/BR,W+/BR')
  @ 22,0 say "                                                                                "
  set color to gr+/br,w+/br
  @ 22,10 SAY "ESC"
  @ 22,64 say "D"
  set color to w+/br,w+/br
  @ 22,14 SAY "Salida"      
  @ 22,54 say "Todos los"
  @ 22,65 say "etalles"
  reg:={}
  nr:={}
  a:={}
  b:={}
  c:={}
  V_CANT=0
  V_MANA=0
  v_comt=0
  v_comm=0
  v_coms=0
  v_como=0
  v_comg=0
  v_comc=0
  v_coma=0
  v_comc=0
  v_comz=0
  v_suel=0
  ce=1

  select 5
  set order to 3
  go top
  set softseek on
  seek d1
  set softseek off
  do while fecana<=d2 .and. .not. eof()
    if fecana<d1 .or. fecana>d2
      select 5
      skip
      loop
    endif
    if factura='NO'
      select 5
      skip
      loop
    endif
    n_nummue=nummue
    na=numana
    select 6
    seek na
    if found()
      v_tipo='Comerc. Trigo  '
      v_comt=v_comt+1
    endif
    if v_tipo='   NINGUNO     '
      select 5
      skip
      loop
    endif
    select 2
    set order to 1
    seek n_nummue
    v_prod=productor
    v_mues=nummue
    v_fecr=fecrec
    v_anal='SI'
    select 5
    V_CANT=v_cant+precio
    V_MANA=V_MANA+1
    v_precio=precio
    select 39
      append blank
      IF NETERR()
        PANTALLA=SAVESCREEN(12,20,14,47)
        @12,20 TO 14,47 DOUBLE
        @13,21 SAY "BASE DE DATOS NO DISPONIBLE"
        INKEY(5)
        RESTSCREEN(12,20,14,47,PANTALLA)
        EXIT
      ENDIF
      replace productor  with v_prod
      replace muestra    with v_mues
      replace tipo       with v_tipo
      replace fecharecib with v_fecr
      replace precios    with v_precio
      commit

      //  aadd(reg," "+v_prod+" ³ "+PADL(v_mues,6,'0')+" ³ "+v_tipo+" ³ "+dtoc(v_fecr)+" ³"+transform(precio,'99.99'))
      
      v_tipo='   NINGUNO     '
      
      // ++limite

    select 5
    skip
  enddo
  LINEAINI="        Listado de Analisis Comercial de Trigo de "+dtoc(d1)+' al '+dtoc(d2)+'      '
  PANTAVE5()
  select 39
  count to valbase
  
  if valbase<>0 //if len(reg)<>0
    do while .t.
      setcolor('b/BG,w+/b')
      select 39
      go top
      dbedit(4,1,20,78,{'Productor','Muestra','Tipo','Fecharecib','Precios'},"ic5")
      //acho:=achoice(6,1,20,78,REG,,"Ic5(a,b,c)")
      if lastkey()=27
        select 5
        exit
      endif
    enddo
  else
    panta:=savescreen(16,19,19,61)
    setcolor('w+/rb')
    dispbox(16,19,19,61,'         ')
    @16,19 to 19,61
    @17,21 say 'No existen muestras analizadas'
    @18,21 say 'de esta especie, en el rango.  '
    setcolor('rb/w')
    @18,53 say 'Aceptar'
    inkey(0)
    restscreen(16,19,19,61,panta)
    setcolor('b/w,b/w')
  endif
  if lastkey()=27
    exit
  endif
enddo
SELECT 6
CLOSE
select 39
close
return




FUNCTION Ic5(a,b,c) 
COL=SETCOLOR()
  DO CASE
    CASE LASTKEY()=27 
      RETURN(0)
    CASE LASTKEY()=100 .or. lastkey()=68
      save screen to panta3
      setcolor('W+/GR+,w+/gr')
      @03,21 TO 15,56 DOUBLE
      @03,30 SAY ' DATOS ESTADISTICOS '
      @04,22 say '                                  '
      @05,22 say '                                  '
      @06,22 say '                                  '
      @05,22 say ' Importe Total      : '+TRANSFORM(V_CANT,"$ 99999.99")
      @06,22 say '                                  '
      @07,22 say ' Muestras Analizadas   : '+TRANSFORM(V_MANA,"9999")+'     '
      @08,22 say '                                  '
      @09,22 say '   Comerc. Trigo       :          '
      @10,22 say '                                  '
      @11,22 say '                                  '
      @12,22 say '                                  '
      @13,22 say '                                  '
      @14,22 say '                                  '
      @09,47 say transform(v_comt,"9999")
      porc=0
      set cursor on
      @11,22 say '  Porcentaje Convenido :'get porc pict '999.99 %' valid porc<=100
      read
      if lastkey()=27
        return
      endif
      resu=(porc*v_cant)/100
      @13,22 say '  Resultado Final      : '+transform(resu,'$ 9999.99')

      pantal:=savescreen(18,60,21,78)
      setcolor('w+/rb,rb/w')
      dispbox(18,60,21,78,'         ')
      @18,60 to 21,78
      @19,61 say 'Imprimir Resumen'
      set wrap on
      @20,61 prompt 'Aceptar'
      @20,70 prompt 'Cancelar'
      menu to selec
      restscreen(18,60,21,78,pantal)
      setcolor('w/n,b/w')
      if selec=1
        *impresora()
        setcolor('w+/rb,rb/w')
        @24,15 say 'º'
        @24,63 say 'º'
        @24,16 say replicate (' ',47)
        @24,22 say 'EPSON LX-300'
        @24,40 SAY 'GSX-190S CITIZEN'
        set wrap on
        @24,22 prompt 'EPSON LX-300'
        @24,40 prompt 'GSX-190S CITIZEN'
        menu to selec
        IF SELEC=1
          IMPporcom2()
        ELSEIF SELEC=2
          Impporcome()
        ELSE
          RETURN
        ENDIF
        pantalla:=savescreen(13,21,16,59)
        setcolor('w+/rb')
        dispbox(13,21,16,59,'         ')
        @13,21 to 16,59
        @14,24 say 'Imprimiendo Resumen de Analisis '
        setcolor('rb/w')
        @15,36 say 'Continuar'
        inkey(3)
        restscreen(13,21,16,59,pantalla)
        restore screen from panta3
      else
        restore screen from panta3
        return
      endif
  ENDCASE
SETCOLOR(COL)
RETURN(2)
