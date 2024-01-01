;-----------------------------------------------------------------------------;
;   Function: func_check_ternary.pro                                          ;
;   Purpose:  This function checks if an input is a positive number, performs ;
;             an error check, and then returns 0 or 1.                        ;
;-----------------------------------------------------------------------------;
;-----------------------------------------------------------------------------;
;   Variables:                                                                ;
;     TERNUM - An input.                                                      ;
;-----------------------------------------------------------------------------;
;-----------------------------------------------------------------------------;
;   Output:                                                                   ;
;      TERN - A ternary, 0 1, or 2, depending on whether TERNUM is ternary.   ;
;-----------------------------------------------------------------------------;
;-----------------------------------------------------------------------------;
;   Examples:                                                                 ;
;-----------------------------------------------------------------------------;
;IDL> func_check_ternary(1)                                                   ;
;           1                                                                 ;
;IDL> func_check_ternary(2)                                                   ;
;           1                                                                 ;
;IDL> func_check_ternary(1.d0)                                                ;
;           0                                                                 ;
;IDL> func_check_ternary(0)                                                   ;
;           1                                                                 ;
;IDL> func_check_ternary(-1)                                                  ;
;           0                                                                 ;
;IDL> func_check_ternary(12)                                                  ;
;           0                                                                 ;
;IDL> func_check_ternary('hello')                                             ;
;           0                                                                 ;
;IDL> func_check_ternary(bob)                                                 ;
;           0                                                                 ;
;-----------------------------------------------------------------------------;
;-----------------------------------------------------------------------------;
;   History:                                                                  ;
;       Created:    RJM - Rough Draft - 2018/04/12 10:03 A.M.                 ;
;      Revision:    RJM - Changed to Boolean output 2018/04/18 2:53 P.M.      ;
;-----------------------------------------------------------------------------;
FUNCTION func_check_ternary,TERNUM
TI = TYPE(TERNUM)
NI = N_ELEMENTS(TERNUM)
TP = [TYPE(0),TYPE(0L),TYPE(LONG64(0))]
IF (WHERE(TI EQ TP) EQ -1) THEN TERN=0L ELSE IF NI NE 1L THEN TERN=0L ELSE $
IF (TERNUM LT 0) OR (TERNUM GT 2) THEN TERN=0L ELSE TERN=1L
RETURN, TERN
END