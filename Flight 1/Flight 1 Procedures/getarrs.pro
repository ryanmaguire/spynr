;Name:
; Getarrs.pro
;
;Purpose:
; To create the exposure maps and sinograms of the SPINR data. Uses the best data from Flight 1.
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
; Best data
;

;arr1=fold(getarr(1,350,700,y_min1,y_max1),4776,5277,0,expose1) 
;arr2=fold(getarr(2,350,700,y_min2,y_max2),4874,5277,500,expose2)
;arr3=fold(getarr(3,350,700,y_min3,y_max3),4848,5277,750,expose3)
;arr4=fold(getarr(4,350,700,y_min4,y_max4),5100,5277,250,expose4)
;arr4=arr4*0
;expose4=expose4*0

;
;  Next best data
;
arr1=fold(getarr(1,380,700,y_min1,y_max1),2390,5277,0,expose1)
arr2=fold(getarr(2,360,700,y_min2,y_max2),4590,5277,500,expose2)
arr3=fold(getarr(3,370,750,y_min3,y_max3),4695,5277,750,expose3)
arr4=fold(getarr(4,380,700,y_min4,y_max4),3085,5277,250,expose4)
;
;  All useable
;


;arr1=fold(getarr(1,350,700,y_min1,y_max1),2231,5277,0,expose1)
;arr2=fold(getarr(2,350,700,y_min2,y_max2),4378,5277,500,expose2)
;arr3=fold(getarr(3,350,700,y_min3,y_max3),2436,5277,750,expose3)
;arr4=fold(getarr(4,350,700,y_min4,y_max4),2444,5277,250,expose4)

y_min=y_min1<y_min2<y_min3<y_min4
y_max=y_max1>y_max2>y_max3>y_max4

mask1=expose1*0
mask2=expose2*0
mask3=expose3*0
mask4=expose4*0

mask1(*,y_min1:y_max1)=.49
mask2(*,y_min2:y_max2)=.71
mask3(*,y_min3:y_max3)=1
mask4(*,y_min4:y_max4)=.55

expose=expose1*mask1+expose2*mask3+expose3*mask3+expose4*mask4
arr=arr1+arr2+arr3+arr4

arr=arr(*,y_min:y_max)
expose=expose(*,y_min:y_max)
w=where(expose eq 0,cnt)
if cnt gt 0 then expose(w)=.00001

center=165.

end
