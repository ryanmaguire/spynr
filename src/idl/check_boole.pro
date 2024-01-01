;-----------------------------------------------------------------------------;
;   Function: func_check_boole.pro                                            ;
;   Purpose:  This function checks if an input is a positive number, performs ;
;             an error check, and then returns 0 or 1.                        ;
;-----------------------------------------------------------------------------;
;-----------------------------------------------------------------------------;
;   Variables:                                                                ;
;       BOONUM - An input.                                                    ;
;-----------------------------------------------------------------------------;
;-----------------------------------------------------------------------------;
;   Output:                                                                   ;
;        BOOLE - A Boolean, 0 or 1, depending on whether BOONUM is Boolean.   ;
;-----------------------------------------------------------------------------;
;-----------------------------------------------------------------------------;
;   Examples:                                                                 ;
;-----------------------------------------------------------------------------;
;IDL> func_check_boole(1)                                                     ;
;           1                                                                 ;
;IDL> func_check_boole(2)                                                     ;
;           0                                                                 ;
;IDL> func_check_boole(0)                                                     ;
;           1                                                                 ;
;IDL> func_check_boole(0.d0)                                                  ;
;           0                                                                 ;
;IDL> func_check_boole('bob')                                                 ;
;           0                                                                 ;
;IDL> func_check_boole(bob)                                                   ;
;           0                                                                 ;
;-----------------------------------------------------------------------------;
;-----------------------------------------------------------------------------;
;   History:                                                                  ;
;       Created:    RJM - Rough Draft - 2018/04/12 10:03 A.M.                 ;
;      Revision:    RJM - Changed to Boolean output 2018/04/18 2:53 P.M.      ;
;-----------------------------------------------------------------------------;
FUNCTION func_check_boole,BOONUM
TI = TYPE(BOONUM)
NI = N_ELEMENTS(BOONUM)
TP = [TYPE(0),TYPE(0L),TYPE(LONG64(0))]
IF (WHERE(TI EQ TP) EQ -1) THEN BOOLE=0L ELSE IF NI NE 1L THEN BOOLE=0L ELSE $
IF (BOONUM LT 0) OR (BOONUM GT 1) THEN BOOLE=0L ELSE BOOLE=1L
RETURN, BOOLE
END