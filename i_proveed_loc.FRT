   c   !                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        RESERVED2  MM         Arial   RESERVED3  MQ         8  !  WINSPOOL HP DeskJet 660C LPT1:                         �HP DeskJet 660C                  7� �� 	     d   ,  ,                                                                             HP DeskJet 660C                                                 LPT1                                                                                                                                     ��	                                                 ,,                 �DRIVER=WINSPOOL
DEVICE=HP DeskJet 660C
OUTPUT=LPT1:
ORIENTATION=1
PAPERSIZE=9
COPIES=1
DEFAULTSOURCE=1
PRINTQUALITY=300
COLOR=2
DUPLEX=1
YRESOLUTION=300
TTOPTION=1
COLLATE=0
         "@I"                           Arial                          "C�digo"                       CODIGO_A                                                      Arial                          "@L 999,999"                   "@I"                           Arial                          "Nombre"                       NOMBRE                         Arial                          "@I"                           Arial                          "Domicilio"                    	DOMICILIO                      Arial                          "@I"                           Arial                          
"Tel�fono"                     TE                             Arial                          "@I"                           Arial                          "Localidad"                    	LOCALIDAD                      Arial                          "@I"                           Arial                          "Provincia"                    DESC_A                         Arial                          "@I"                           Arial                          "CUIT"                         CUIT                           Arial                          "@I"                           Arial                          "Cond. IVA"                    DESC_B                         Arial                          !"P�gina " + ALLTRIM(STR(_PAGENO))                               Arial                          Arial                          "PROVEEDORES POR CODIGO"       Arial                          Arial                          Arial                          Arial                          Arial                          dataenvironment                JLeft = 1
Top = 220
Width = 520
Height = 200
Name = "Dataenvironment"
                       cursor                         iAlias = "proveed_cod"
Order = ""
Database = datos.dbc
CursorSource = "proveed_cod"
Name = "cursor1"
                   