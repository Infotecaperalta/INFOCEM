*-----------------------------
* MiLib.prg
* Archivo de procedimientos
*-----------------------------

*-----------------------------------------------------------------------------
* FUNCTION Buscar(tcBusca, tcCursor)
*-----------------------------------------------------------------------------
* Funcion que recibe una cadena a buscar y retorna un cursor "tcCursor"
* con todas las coincidencias de las palabras
*-----------------------------------------------------------------------------
FUNCTION Buscar(tcBusca, tcCursor)
*-----------------------------------------------------------------------------
  LOCAL lnPalabras, lnI
  *-- Cadena a buscar
  tcBusca = ALLTRIM(tcBusca)

  *-- Nombre del cursor de resultados
  IF EMPTY(tcCursor)
    tcCursor = "MiCursor"
  ENDIF

  *-- Cursor que guarda las palabras separados
  CREATE CURSOR CursorNomb (Cadena c(40))
  INSERT INTO CursorNomb (Cadena) VALUES (tcBusca)

  *-- Cadena a buscar con un espacio al final
  lnPalabras = ALINES(laArray, CHRTRAN(tcBusca, " ", CHR(13)))
  FOR lnI = 1 TO lnPalabras
    INSERT INTO CursorNomb (Cadena) VALUES (laArray(lnI))
    *-- Si tiene mas de 4 caracteres
    IF LEN(laArray(lnI)) > 4
      INSERT INTO CursorNomb (Cadena) VALUES (SUBS(laArray(lnI),1,4))
    ENDIF
  ENDFOR

  SELECT FALLECIDOS.*, 1 AS Hit ;
    FROM FALLECIDOS,CursorNomb ;
    INTO CURSOR CursorCoinc ;
    WHERE FALLECIDOS.Nombre LIKE "%" + ALLTRIM(CursorNomb.Cadena) + "%"

  SELECT Legajo, Nombre, SUM(Hit) AS Hits ;
    FROM CursorCoinc ;
    INTO CURSOR (tcCursor) ;
    GROUP BY Legajo, Nombre ORDER BY Hits DESC, Nombre ASC

  *-- Cierro los cursores temporales
  USE IN CursorNomb
  USE IN CursorCoinc

  IF EOF(tcCursor)
    RETURN(.F.)
  ELSE
    RETURN(.T.)
  ENDIF
ENDFUNC
*-----------------------------------------------------------------------------
