;*******************************************************************************
;   
;    Name:       Getarr.pro
;
;    Author:     Timothy Cook
;
;    Function:   Function used by getarrays.pro for constructing sinograms.
;
;*******************************************************************************
function getarr,dir,detnum,low,high,y_min,y_max,full=full

fn = dir+'det'+strtrim(string(detnum),2)+'.dat'
spawn,'wc -c '+fn,tmp
num = long(gettok(tmp(0),' '))
if keyword_set(full) then arr=lonarr(6200,1024) else arr=lonarr(6200,256)
n_events=num/6

in  = assoc(1,intarr(3))
close,1
openr,1,fn

case detnum of
 1: begin
     y_min=0>((0*.87+95.)/4.)<255
     y_max=0>((250*4.*.87+95.)/4.)<255
     for i=0l,n_events-1 do begin
      if fix(i/1000) eq (i/1000.) then print,i,n_events-1
      tmp=in(i)
      if ((tmp(0) ge wave2num(dir,detnum,high,tmp(1))) and (tmp(0) le wave2num(dir,detnum,low,tmp(1))) and $
                                                   (tmp(0) gt 0) and (tmp(0) lt 1023) and $
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
     y_min=0>((36*4*.97+46.)/4.)<255
     y_max=0>((255*4*.97+46.)/4.)<255
     for i=0l,n_events-1 do begin
      if fix(i/1000) eq (i/1000.) then print,i,n_events-1
      tmp=in(i)
      if ((tmp(0) ge wave2num(dir,detnum,high,tmp(1))) and (tmp(0) le wave2num(dir,detnum,low,tmp(1))) and $
                                                   (tmp(0) gt 0) and (tmp(0) lt 1023) and $
                                                   (tmp(1) gt 0) and (tmp(1) lt 1023)) then begin
    if keyword_set(full) then  $
         y=0>((tmp(1)))<1023   $
       else                    $
         y=0>((tmp(1))/4.)<255
       arr(tmp(2),y)=arr(tmp(2),y)+1
      endif
     endfor
    end
 3: begin
     y_min=0>((9*4*.95+16.)/4.)<255
     y_max=0>((253*4*.95+16.)/4.)<255
     for i=0l,n_events-1 do begin
      if fix(i/1000) eq (i/1000.) then print,i,n_events-1
      tmp=in(i)
      if ((tmp(0) ge wave2num(dir,detnum,high,tmp(1))) and (tmp(0) le wave2num(dir,detnum,low,tmp(1))) and $
                                                   (tmp(0) gt 0) and (tmp(0) lt 1023) and $
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
     y_min=(0>(14*4)/4.)<255
     y_max=(0>(255*4)/4.)<255
     for i=0l,n_events-1 do begin
      if fix(i/1000) eq (i/1000.) then print,i,n_events-1
      tmp=in(i)
      if ((tmp(0) ge wave2num(dir,detnum,high,tmp(1))) and (tmp(0) le wave2num(dir,detnum,low,tmp(1))) and $
                                                   (tmp(0) gt 0) and (tmp(0) lt 1023) and $
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
