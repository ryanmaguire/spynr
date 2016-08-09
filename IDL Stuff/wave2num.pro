;Name:
; wave2num.pro
;
;Purpose:
; Function used for getarrs.pro to produce sinograms.
;
;Procedures called:
; gettok.pro, interpol.pro

function wave2num,det,lam,y
common cal_block,detnum,in

if n_elements(detnum) eq 0 then detnum = 0

if (n_elements(y) gt 1) or     $
   (n_elements(lam) gt 1) or   $
   (n_elements(det) gt 1)      $
     then stop,'Inputs must be scalars - wave2num'

if det ne detnum then begin
  file="wavecal"+strtrim(string(det),2)+".dat"
  spawn,"wc -l "+file,str
  openr,lun,file,/get_lun

  len=fix(gettok(str(0)," "))
  in=fltarr(3,len)             ; y, lam, x
  readf,lun,in
  close,lun
  detnum=det
endif

dist_y=abs(y-in(0,*))

ind=where(dist_y eq min(dist_y))
lin=in(1,ind)
xin=in(2,ind)
srt=sort(lin)
lin=lin(srt)
xin=xin(srt)

x=interpol(xin,lin,lam)

if n_elements(lam) eq 1 then return,x(0) else return,x
end
