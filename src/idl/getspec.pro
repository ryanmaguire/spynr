function getspec,detnum

print,"Orion data"

center=[501.,501.,541.,531.]
scale=[1.,.9,.91,.88]
frequency=1./1000. *2.*!pi
width=30
detphase=[0,500,250,750]

phase=fltarr(10)
amplitude=fltarr(10)
ystar=fltarr(10)

amplitude(1)=235. *scale(detnum-1)
phase(1)=702.     *frequency

amplitude(2)=212. *scale(detnum-1)
phase(2)=158.     *frequency

amplitude(3)=132. *scale(detnum-1)
phase(3)=360.     *frequency

amplitude(4)=135. *scale(detnum-1)
phase(4)=230.     *frequency
  
amplitude(5)=212. *scale(detnum-1)
phase(5)=985.     *frequency

amplitude(6)=75.  *scale(detnum-1)
phase(6)=415.     *frequency

amplitude(7)=195. *scale(detnum-1)
phase(7)=702.     *frequency

amplitude(8)=155. *scale(detnum-1)
phase(8)=702.     *frequency

amplitude(9)=345. *scale(detnum-1)
phase(9)=740.     *frequency

amplitude(0)=600. *scale(detnum-1)
phase(0)=638.     *frequency

phase=phase+detphase(detnum-1)*frequency

s1=lonarr(900,2,11)

fn='det'+strtrim(string(detnum),2)+'.dat'
spawn,'wc -c '+fn,tmp
num=long(gettok(tmp(0),' '))
n_events=num/6

in = assoc(1,intarr(3))
close,1
openr,1,fn

for i=0l,n_events-1 do begin
 tmp=in(i)
 if (tmp(2) gt 2460) and (tmp(2) lt 5730) and $
          (tmp(0) lt 1023) and (tmp(1) lt 1023) and $
          (tmp(0) gt 0) and (tmp(1) gt 0) then begin
   if (i/10000.) eq fix(i/10000.) then print,detnum,100.*i/n_events
   star=0
   lam=899<(num2wave(detnum,tmp(0),tmp(1))-800)>0
   for j=0,9 do begin
       ystar=center(detnum-1)+amplitude(j)*cos(tmp(2)*frequency-phase(j))
       if (abs(tmp(1)-ystar) le width/2) then s1(lam,0,j)=s1(lam,0,j)+1
       if (abs(tmp(1)-ystar) le width) then begin
          s1(lam,1,j)=s1(lam,1,j)+1
          star=1
       endif
   endfor
   if star eq 0 then s1(lam,1,10)=s1(lam,1,10)+1
 endif
endfor
return,s1
end
