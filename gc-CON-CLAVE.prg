PUBLIC habili
habili=1
set date to british

if date()>ctod("31/12/2013")

  delete file c:\windows\men_cli.fll
  quit

else

  IF .NOT. FILE ("C:\WINDOWS\MEN_CLI.FLL")
    COPY FILE MEN_CLI.FLL TO C:\WINDOWS\MEN_CLI.FLL
  ELSE
    *SET DEFAULT TO G:\infogest
    SET TALK OFF
    SET SAFETY OFF
    SET MULTILOCKS ON
    SET CONFIRM ON
    SET DELETED ON
    set exclusive off
    SET DECIMALS TO 4
    CLEAR
    CLEAR ALL
    CLOSE ALL
    
    
    IF .NOT. FILE("C:\WINDOWS\MEN_CLI.FLL")
      do form comercial
      read events
    ELSE
      if date()=>ctod("30/11/2013")
        IF FILE("C:\WINDOWS\SYSTEM\NOUSANP.DBF")
          USE C:\WINDOWS\SYSTEM\NOUSANP
          IF ALLTRIM(NOUSANP.DESCRIP)="TLPECQMFF413"
            do form comercial
            read events     
          ELSE
            public clav
            CLAV=SPACE(30)
            do form clave
            READ EVENTS
          ENDIF
        ELSE
          create table C:\WINDOWS\SYSTEM\NOUSANP(LACLAV D,DESCRIP C(30))
          set multilock on
          SELE NOUSANP         
          append blank
          replace NOUSANP.LACLAV   with DATE() 
          lSuccess=CURSORSETPROP("Buffering", 5, "NOUSANP")
          =tableupdate(.t.)
          CLOSE TABLES
        ENDIF
        public clav
        CLAV=SPACE(30)
        do form clave
        READ EVENTS
      else
        IF FILE("C:\WINDOWS\SYSTEM\NOUSANP.DBF")
          USE C:\WINDOWS\SYSTEM\NOUSANP
          IF ALLTRIM(NOUSANP.DESCRIP)="TLPECQMFF413" 
            *************************************************** programa nuevo **********************************************
            DO CASE
              CASE DATE()<CTOD("02/09/2013")
                do form comercial
                read events     
               
              CASE DATE()>CTOD("01/09/2013") .AND. DATE()<CTOD("02/11/2013")
                IF ALLTRIM(NOUSANP.ALQUILO1)="HDLF1C618"
                  do form comercial
                  read events     
                ELSE    
                  public clav
                  CLAV=SPACE(30)
                  do form claveBI-1
                  READ EVENTS
                ENDIF
              CASE DATE()>CTOD("01/11/2013") .AND. DATE()<CTOD("02/01/2014")
                IF ALLTRIM(NOUSANP.ALQUILO2)="EPLCDTEDPYLVDTIFDOLACTAI3022"
                  do form comercial
                  read events     
                ELSE    
                  public clav
                  CLAV=SPACE(30)
                  do form claveBI-2
                  READ EVENTS
                ENDIF
              CASE DATE()>CTOD("01/01/2014") .AND. DATE()<CTOD("02/03/2014")
                IF ALLTRIM(NOUSANP.ALQUILO3)="TMTCYTRTCJ219A"
                  do form comercial
                  read events     
                ELSE    
                  public clav
                  CLAV=SPACE(30)
                  do form claveBI-3
                  READ EVENTS
                ENDIF
              
              CASE DATE()>CTOD("01/03/2014") .AND. DATE()<CTOD("02/05/2014")
                IF ALLTRIM(NOUSANP.ALQUILO4)="SPYCMYAEEHDTAJTDYFMTETDESJ219B"
                  do form comercial
                  read events     
                ELSE    
                  public clav
                  CLAV=SPACE(30)
                  do form claveBI-4
                  READ EVENTS
                ENDIF
              
              CASE DATE()>CTOD("01/05/2014") .AND. DATE()<CTOD("02/07/2014")
                IF ALLTRIM(NOUSANP.ALQUILO5)="NMASYDDCNPTSQTTDTDYJL1914"
                  do form comercial
                  read events     
                ELSE    
                  public clav
                  CLAV=SPACE(30)
                  do form claveBI-5
                  READ EVENTS
                ENDIF
              
              CASE DATE()>CTOD("01/07/2014") .AND. DATE()<CTOD("02/09/2014")
                IF ALLTRIM(NOUSANP.ALQUILO6)="YDCCITIDPYTIRDOI3022"
                  do form comercial
                  read events     
                ELSE    
                  public clav
                  CLAV=SPACE(30)
                  do form claveBI-6
                  READ EVENTS
                ENDIF
              
              CASE DATE()>CTOD("01/09/2014") .AND. DATE()<CTOD("02/11/2014")
                IF ALLTRIM(NOUSANP.ALQUILO7)="YDCCITIDPYTIRDOI3022"
                  do form comercial
                  read events     
                ELSE    
                  public clav
                  CLAV=SPACE(30)
                  do form claveBI-7
                  READ EVENTS
                ENDIF
              
              CASE DATE()>CTOD("01/11/2014") .AND. DATE()<CTOD("02/01/2015")
                IF ALLTRIM(NOUSANP.ALQUILO8)="YDCCITIDPYTIRDOI3022"
                  do form comercial
                  read events     
                ELSE    
                  public clav
                  CLAV=SPACE(30)
                  do form claveBI-8
                  READ EVENTS
                ENDIF
              
              CASE DATE()>CTOD("01/01/2015") .AND. DATE()<CTOD("02/03/2015")
                IF ALLTRIM(NOUSANP.ALQUILO9)="YDCCITIDPYTIRDOI3022"
                  do form comercial
                  read events     
                ELSE    
                  public clav
                  CLAV=SPACE(30)
                  do form claveBI-9
                  READ EVENTS
                ENDIF
              
              CASE DATE()>CTOD("01/03/2015") .AND. DATE()<CTOD("02/05/2015")
                IF ALLTRIM(NOUSANP.ALQUILO10)="YDCCITIDPYTIRDOI3022"
                  do form comercial
                  read events     
                ELSE    
                  public clav
                  CLAV=SPACE(30)
                  do form claveBI-10
                  READ EVENTS
                ENDIF
              
              CASE DATE()>CTOD("01/05/2015") .AND. DATE()<CTOD("02/07/2015")
                IF ALLTRIM(NOUSANP.ALQUILO11)="YDCCITIDPYTIRDOI3022"
                  do form comercial
                  read events     
                ELSE    
                  public clav
                  CLAV=SPACE(30)
                  do form claveBI-11
                  READ EVENTS
                ENDIF
              CASE DATE()>CTOD("01/05/2015") .AND. DATE()<CTOD("02/07/2015")
                IF ALLTRIM(NOUSANP.ALQUILO12)="YDCCITIDPYTIRDOI3022"
                  do form comercial
                  read events     
                ELSE    
                  public clav
                  CLAV=SPACE(30)
                  do form claveBI-12
                  READ EVENTS
                ENDIF
              
            ENDCASE
     
          ELSE
            public clav
            CLAV=SPACE(30)
            do form clave
            READ EVENTS
          ENDIF
        ELSE
          create table C:\WINDOWS\SYSTEM\NOUSANP(LACLAV D,DESCRIP C(30),ALQUILO1 C(30),ALQUILO2 C(30),ALQUILO3 C(30),ALQUILO4 C(30),ALQUILO5 C(30),ALQUILO6 C(30),ALQUILO7 C(30),ALQUILO8 C(30),ALQUILO9 C(30),ALQUILO10 C(30),ALQUILO11 C(30),ALQUILO12 C(30))
          set multilock on
          SELE NOUSANP         
          append blank
          replace NOUSANP.LACLAV   with DATE() 
          lSuccess=CURSORSETPROP("Buffering", 5, "NOUSANP")
          =tableupdate(.t.)
          CLOSE TABLES
        ENDIF
        public clav
        CLAV=SPACE(30)
        do form clave
        READ EVENTS
      Endif  
      do form comercial
      read events
    endif
    public salir
  ENDIF

endif  
