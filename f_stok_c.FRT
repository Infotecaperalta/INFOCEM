   J   !                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              Arial                          �ORIENTATION=0
PAPERSIZE=9
PAPERLENGTH=2970
PAPERWIDTH=2100
COPIES=1
DEFAULTSOURCE=7
PRINTQUALITY=-2
COLOR=2
DUPLEX=1
TTOPTION=3
COLLATE=0
              DATE()                         Arial                          "@I"                           Arial                          ,"Informe - Existencia de Articulos x C�digo"                    "@I"                           Arial                          "C�digo"                       CODIGO                                                        Arial                          "999999"                       "@I"                           Arial                          	"Detalle"                      DETALLE                        Arial                          "@I"                           Arial                          
"Cantidad"                     CANTIDAD                                                      Arial                          "99999"                        "@I"                           Arial                          "Rubro"                        NOMRUBRO                       Arial                          "@I"                           Arial                                                         "Marca"                        NOMMARCA                       Arial                          "Page " + ALLTRIM(STR(_PAGENO))                                 Arial                          Arial                          Arial                          Arial                          Arial                          Arial                          dataenvironment                YTop = 0
Left = 0
Width = 0
Height = 0
DataSource = .NULL.
Name = "Dataenvironment"
        cursor                         ?Alias = "f_stok"
CursorSource = f_stok.dbf
Name = "cursor1"
                            