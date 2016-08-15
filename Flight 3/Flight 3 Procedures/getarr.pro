;Name:
; wave2num.pro
;
;Purpose:
; Function used for getarrs.pro to produce sinograms.
;
;Procedures called:
; gettok.pro, wav2num.pro
function getarr,detnum,low,high,full=full

fn='det'+strtrim(string(detnum),2)+'.dat'
spawn,'wc -c '+fn,tmp
num=long(gettok(tmp(0),' '))
if keyword_set(full) then arr=lonarr(6200,1024) else arr=lonarr(6200,256)
n_events=num/6

in = assoc(1,intarr(3))
close,1
openr,1,fn

case detnum of
 1: begin
     for i=0l,n_events-1 do begin
      if fix(i/100000) eq (i/100000.) then print,i,n_events-1
      tmp=in(i)
      if ((tmp(0) ge low) and (tmp(0) le high) and $
          (tmp(1) gt 0) and (tmp(1) lt 1023)) then begin
       if keyword_set(full) then       $
         y=0>((tmp(1)))<1023   $
       else                            $
         y=0>((tmp(1))/4.)<255
       arr(tmp(2),y)=arr(tmp(2),y)+1
      endif
     endfor
    end
 2: begin
     for i=0l,n_events-1 do begin
      if fix(i/100000) eq (i/100000.) then print,i,n_events-1
      tmp=in(i)
      if ((tmp(0) ge low) and (tmp(0) le high) and $
         (tmp(1) gt 0) and (tmp(1) lt 1023)) then begin
    if keyword_set(full) then          $
         y=0>((tmp(1)))<1023   $
       else                            $
         y=0>((tmp(1))/4.)<255
       arr(tmp(2),y)=arr(tmp(2),y)+1
      endif
     endfor
    end
 3: begin
     for i=0l,n_events-1 do begin
      if fix(i/100000) eq (i/100000.) then print,i,n_events-1
      tmp=in(i)
      if ((tmp(0) ge low) and (tmp(0) le high) and $
                (tmp(1) gt 0) and (tmp(1) lt 1023)) then begin
       if keyword_set(full) then          $
          y=0>((tmp(1)))<1023     $
       else                               $
          y=0>((tmp(1))/4.)<255
       arr(tmp(2),y)=arr(tmp(2),y)+1
      endif
     endfor
    end
 4: begin
     for i=0l,n_events-1 do begin
      if fix(i/100000) eq (i/100000.) then print,i,n_events-1
      tmp=in(i)
      if ((tmp(0) ge low) and (tmp(0) le high) and $
         (tmp(1) gt 0) and (tmp(1) lt 1023)) then begin
       if keyword_set(full) then          $
          y=0>((tmp(1)))<1023             $
       else                               $
          y=(0>(tmp(1))/4.)<255
       arr(tmp(2),y)=arr(tmp(2),y)+1
      endif
     endfor
    end
 default: stop,'Error in getarr case statement'
endcase
return,arr
end
