;name:
; Fold.pro
; 
;Purpose:
; Function meant to "Fold" the data from SPINR

function fold,arr,start,stop,offset,expose
s=size(arr)

out=intarr(1000,s(2))
expose=fltarr(1000,s(2))
for i=start,stop do begin
 ind=(i+offset) mod 1000
 out(ind,*)=out(ind,*)+arr(i,*)
 expose(ind,*)=expose(ind,*)+1.
endfor
return,out
end
