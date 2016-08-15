;Name:
; wave2num.pro
;
;Purpose:
; Function used for getarrs.pro to produce sinograms.
;
;Procedures called:
; gettok.pro, wav2num.pro
function getarr,detnum,low,high,y_min,y_max

fn='det'+strtrim(string(detnum),2)+'.dat'
spawn,'wc -c '+fn,tmp
num=long(gettok(tmp(0),' '))
arr=lonarr(6200,500)
n_events=num/6

in = assoc(1,intarr(3))
close,1
openr,1,fn

case detnum of
 1: begin
     y_min=+40.26+100
     y_max=245*.927+40.26+100               ; Detector does not fill image to the top of Y
     for i=0l,n_events-1 do begin
      tmp=in(i)
      if ((tmp(0) ge low) and (tmp(0) le high) and (tmp(1) gt 0) and (tmp(1) lt 1023)) then begin
       y=tmp(1)/4.*.927+40.26+100
       arr(tmp(2),y)=arr(tmp(2),y)+1
      endif
     endfor
    end
 2: begin
     y_min=+.98+100
     y_max=255*1.01+.98+100
     for i=0l,n_events-1 do begin
      tmp=in(i)
      if ((tmp(0) ge low) and (tmp(0) le high) and (tmp(1) gt 0) and (tmp(1) lt 1023)) then begin
       y=tmp(1)/4.*1.01+.98+100
       arr(tmp(2),y)=arr(tmp(2),y)+1
      endif
     endfor
    end
 3: begin
     y_min=100
     y_max=255+100
     for i=0l,n_events-1 do begin
      tmp=in(i)
      if ((tmp(0) ge low) and (tmp(0) le high) and (tmp(1) gt 0) and (tmp(1) lt 1023)) then begin
       y=tmp(1)/4.+100
       arr(tmp(2),y)=arr(tmp(2),y)+1
      endif
     endfor
    end
 4: begin
     y_min=-13.75+100
     y_max=255*1.049-13.75+100
     for i=0l,n_events-1 do begin
      tmp=in(i)
      if ((tmp(0) ge low) and (tmp(0) le high) and (tmp(1) gt 0) and (tmp(1) lt 1023)) then begin
       y=tmp(1)/4.*1.049-13.75+100
       arr(tmp(2),y)=arr(tmp(2),y)+1
      endif
     endfor
    end
 default: stop,'Error in getarr case statement'
endcase
return,arr
end
