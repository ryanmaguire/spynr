function num2wave,det,num,yin,twod=twod
common cal_block,detnum,x,y,lam,array

if n_elements(detnum) eq 0 then detnum = 0

if (n_elements(det) gt 1)      $
     then stop,'Inputs must be scalars - num2wave'

;
;  Load calibration file data
;

if det ne detnum then begin
  file="wavecal"+strtrim(string(det),2)+".dat"
  spawn,"wc -l "+file,str
  print,"Loading calibration file "+file
  openr,lun,file,/get_lun

  len=fix(gettok(str(0)," "))
  in=fltarr(3,len)             ; y, lam, x
  readf,lun,in
  close,lun
  x=in(2,*)
  y=in(0,*)
  lam=in(1,*)
  y=y+16
  ;
  ;  If we're using 2d interpolation find interploation grid
  ;
  if keyword_set(twod) then begin
     triangulate,x,y,tr,b
     array=trigrid(x,y,lam,tr,extra=b,yout=findgen(1023),xout=findgen(1023))
  endif
  detnum=det

  ;plot,x,y,psym=1
  ;for i=0, n_elements(tr)/3-1 do begin
  ;  t=[tr[*,i],tr[0,i]]
  ;  plots,x[t],y[t]
  ;endfor
  ;stop
endif

;
;  If we're using 1d file the closest line and interpolate
;  otherwise retuen the 2D answer
;
if not keyword_set(twod) then begin
   dist_y=abs(yin-y)

   ind=where(dist_y eq min(dist_y))
   lin=lam(ind)
   xin=x(ind)
   srt=sort(xin)
   lin=lin(srt)
   xin=xin(srt)

   result=interpol(lin,xin,num)
   return,result(0)
endif else $
return,array(num,yin)

end
