;-----------------------------------------------------------------------------;
;   Function: func_check_pos_real.pro                                         ;
;   Purpose:  This function checks if an input is a positive number, performs ;
;             an error check, and then returns 0 or 1.                        ;
;-----------------------------------------------------------------------------;
;-----------------------------------------------------------------------------;
;   Variables:                                                                ;
;    POSNUM - An input.                                                       ;
;-----------------------------------------------------------------------------;
;-----------------------------------------------------------------------------;
;   Output:                                                                   ;
;     BOOLE - A Boolean, 0 or 1, depending on whether IN is a positive number.;
;-----------------------------------------------------------------------------;
;-----------------------------------------------------------------------------;
;   Examples:                                                                 ;
;-----------------------------------------------------------------------------;
;IDL> func_check_pos_real(findgen(10)+1)                                      ;
;           0                                                                 ;
;IDL> func_check_pos_real(11.d0)                                              ;
;           1                                                                 ;
;IDL> func_check_pos_real(0.d0)                                               ;
;           0                                                                 ;
;IDL> func_check_pos_real(0L)                                                 ;
;           0                                                                 ;
;IDL> func_check_pos_real(-2)                                                 ;
;           0                                                                 ;
;IDL> func_check_pos_real('Hello World!')                                     ;
;           0                                                                 ;
;IDL> func_check_pos_real(bob)                                                ;
;           0                                                                 ;
;-----------------------------------------------------------------------------;
;-----------------------------------------------------------------------------;
;   History:                                                                  ;
;       Created:    RJM - Rough Draft - 2018/04/12 10:03 A.M.                 ;
;      Revision:    RJM - Changed to Boolean output 2018/04/18 2:53 P.M.      ;
;-----------------------------------------------------------------------------;
FUNCTION func_check_pos_real,POSNUM
TI = TYPE(POSNUM)
NI = N_ELEMENTS(POSNUM)
TP = [TYPE(0),TYPE(0L),TYPE(LONG64(0)),TYPE(0.0),TYPE(0.d0)]
IF (WHERE(TI EQ TP) EQ -1) THEN BOOLE=0L ELSE $
IF NI NE 1 THEN BOOLE=0L ELSE IF POSNUM LE 0L THEN BOOLE=0L ELSE BOOLE=1L
RETURN, BOOLE
END