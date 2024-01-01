;*******************************************************************************
;   
;    Name:       n2s.pro
;
;    Author:     Chris Mendillo
;
;    Function:   Converts a number into a string.
;
;    INPUTS:     A number
;
;    OUTPUTS:    The same number in string format.
;
;**********************************************************************************

function n2s, num, format=format

str=strcompress(string(FORMAT=format,num),/remove_all)


return,str
end
