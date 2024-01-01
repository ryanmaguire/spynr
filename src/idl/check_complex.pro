;-----------------------------------------------------------------------------;
;   Function: func_check_complex.pro                                          ;
;   Purpose:  This function checks if an input is complex valued or not.      ;
;-----------------------------------------------------------------------------;
;-----------------------------------------------------------------------------;
;   Variables:                                                                ;
;     COMPNUM - An input, array, string, etc.                                 ;
;-----------------------------------------------------------------------------;
;-----------------------------------------------------------------------------;
;   Output:                                                                   ;
;       BOOLE - A Boolean, 0 or 1, depending on whether COMPNUM is complex.   ;
;-----------------------------------------------------------------------------;
;-----------------------------------------------------------------------------;
;   Examples:                                                                 ;
;-----------------------------------------------------------------------------;
;IDL> func_check_complex(dcomplex(0.d0,findgen(100)))                         ;
;       1                                                                     ;
;IDL> func_check_complex(bob)                                                 ;
;       0                                                                     ;
;IDL> func_check_complex("Hello World!")                                      ;
;       0                                                                     ;
;IDL> func_check_complex(findgen(100))                                        ;
;       0                                                                     ;
;-----------------------------------------------------------------------------;
;-----------------------------------------------------------------------------;
;   History:                                                                  ;
;       Created:    RJM - Rough Draft - 2018/04/18 12:45 A.M.                 ;
;-----------------------------------------------------------------------------;
FUNCTION func_check_complex,COMPNUM
TI = TYPE(COMPNUM)
TC = [TYPE(COMPLEX(0)),TYPE(DCOMPLEX(0))]
IF (WHERE(TI EQ TC) EQ -1) THEN BOOLE=0L ELSE BOOLE=1L
RETURN, BOOLE
END