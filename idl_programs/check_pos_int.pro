;-------------------------------------------------------------------;
;   Function:                                                       ;
;       check_pos_int.pro                                           ;
;   Purpose:                                                        ;
;       Check in an input is a positive integer.                    ;
;   Variables:                                                      ;
;       POS:                                                        ;
;           Any valid input (String, int, long, float, etc.)        ;
;   Output:                                                         ;
;       POUT:                                                       ;
;           A Boolean, 0 or 1, depending on whether POS is a        ;
;           positive integer.                                       ;
;   Notes:                                                          ;
;       Some notes                                                  ;
;   References:                                                     ;
;       Some references.                                            ;
;   Examples:                                                       ;
;       IDL> check_boole(1)                                         ;
;               1                                                   ;
;       IDL> check_boole(2)                                         ;
;               0                                                   ;
;       IDL> check_boole(0)                                         ;
;               1                                                   ;
;       IDL> check_boole(0.d0)                                      ;
;               0                                                   ;
;       IDL> check_boole('bob')                                     ;
;               0                                                   ;
;       IDL> check_boole(bob)                                       ;
;               0                                                   ;
;   History:                                                        ;
;       Created:    RJM - Rough Draft - 2018/04/12 10:03 A.M.       ;
;      Revision:    RJM - Syntax Revision 2018/04/18 2:53 P.M.      ;
;-------------------------------------------------------------------;
FUNCTION check_pos_int,POS
TI = TYPE(POS)
NI = N_ELEMENTS(POS)
TP = [TYPE(0),TYPE(0L),TYPE(LONG64(0))]
IF (WHERE(TI EQ TP) EQ -1) THEN POUT=0L ELSE $
IF NI NE 1 THEN POUT=0L $
ELSE IF POS LE 0L THEN POUT=0L $
ELSE POUT=1L
RETURN, POUT
END