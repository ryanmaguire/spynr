;Name:
; Getarrs.pro
; 
;Purpose:
; To create the exposure maps and sinograms of the SPINR data.
; 
;Calling Sequence:
; getarrs, arr1, arr2, arr3, arr4, expose1, expose2, expose3, expose4
; 
;Outputs:
; arr1, arr2, arr3, arr4 - Sinograms of SPINR data
; expose1, expose2, expose3, expose4 - Exposure maps
;
;Procedures Called:
; getarr.pro, fold.pro, wave2num.pro (Implicitely)
;
; Get longwave data
;

;arr1=fold(getarr(1,1235,2000,y_min1,y_max1),2518,5749,0,expose1)
;arr2=fold(getarr(2,1235,2000,y_min2,y_max2),2518,5749,500,expose2)
;arr3=fold(getarr(3,1235,2000,y_min3,y_max3),2518,5749,750,expose3)
;arr4=fold(getarr(4,1235,2000,y_min4,y_max4),2518,5749,250,expose4)
;
; Get midwave data
;

arr1=fold(getarr(1,1030,1200,y_min1,y_max1),2518,5749,0,expose1)
arr2=fold(getarr(2,1030,1200,y_min2,y_max2),2518,5749,500,expose2)
arr3=fold(getarr(3,1030,1200,y_min3,y_max3),2518,5749,750,expose3)
arr4=fold(getarr(4,1030,1200,y_min4,y_max4),2518,5749,250,expose4)
;
; Get shortwave data
;

;arr1=fold(getarr(1,912,1029,y_min1,y_max1),2518,5749,0,expose1)
;arr2=fold(getarr(2,912,1029,y_min2,y_max2),2518,5749,500,expose2)
;arr3=fold(getarr(3,912,1029,y_min3,y_max3),2518,5749,750,expose3)
;arr4=fold(getarr(4,912,1029,y_min4,y_max4),2518,5749,250,expose4)
;
; Get background data
;

;arr1=fold(getarr(1,0,900,y_min1,y_max1),2518,5749,0,expose1)
;arr2=fold(getarr(2,0,900,y_min2,y_max2),2518,5749,500,expose2)
;arr3=fold(getarr(3,0,900,y_min3,y_max3),2518,5749,750,expose3)
;arr4=fold(getarr(4,0,900,y_min4,y_max4),2518,5749,250,expose4)

;y_min=y_min1<y_min2<y_min3<y_min4
;y_max=y_max1>y_max2>y_max3>y_max4

;mask1=expose1*0
;mask2=expose2*0
;mask3=expose3*0
;mask4=expose4*0
;
;mask1(*,y_min1:y_max1)=1
;mask2(*,y_min2:y_max2)=1
;mask3(*,y_min3:y_max3)=1
;mask4(*,y_min4:y_max4)=1

;expose=expose1*mask1+expose2*mask3+expose3*mask3+expose4*mask4
;arr=arr1+arr2+arr3+arr4
;
;arr=arr(*,y_min:y_max)
;expose=expose(*,y_min:y_max)
;w=where(expose eq 0,cnt)
;if cnt gt 0 then expose(w)=.00001
;

save,arr1,arr2,arr3,arr4,expose1,expose2,expose3,expose4,file="array_data.idl"

end
