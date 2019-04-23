;*******************************************************************************
;   
;    Name:       Getarr.pro
;
;    Author:     Timothy Cook
;
;    Function:   Function used by getarrays.pro for constructing sinograms.
;
;**********************************************************************************

function getarr,dir,detnum,low,high,full=full

fn  =dir+'det'+strtrim(string(detnum),2)+'.dat'
SPAWN,'wc -c '+fn,tmp
num = LONG(gettok(tmp(0),' '))
if keyword_set(full) then arr=lonarr(6200,1024) else arr=lonarr(6200,256)
n_events = num/6
W1       = wave2num(dir,detnum,high,tmp(1)))
W2       = wave2num(dir,detnum,low,tmp(1)))
in       = assoc(1,intarr(3))
close,1
openr,1,fn
FOR i=0L,n_events-1 DO BEGIN
    IF LONG(i/1000) EQ (i/1000.d0) THEN PRINT,i,n_events-1
    tmp=in(i)
    IF (tmp(0) GE W1) AND (tmp(0) LE W2) AND (tmp(0) GT 0) $
    AND (tmp(0) LT 1023) AND (tmp(1) GT 0) $
    AND (tmp(1) LT 1023)) THEN BEGIN
        IF KEYWORD_SET(full) THEN y=0>tmp(1)<1023 $
        ELSE y=0>(tmp(1)/4.d0)<255
        arr(tmp(2),y)=arr(tmp(2),y)+1
    ENDIF
ENDFOR
RETURN,arr
END