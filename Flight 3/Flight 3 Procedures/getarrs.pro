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
;  get first data
;

;arr1=fold(getarr(1,194*2,354*2,/full),2160,5790,0,exp1)
;arr2=fold(getarr(2,205*2,356*2,/full),2460,5790,500,exp2)
;arr3=fold(getarr(3,211*2,345*2,/full),2160,5790,750,exp3)


;
; Get all the data - don't fold
;
;arr1=getarr(1,1,1022,/full)
;arr2=getarr(2,1,1022,/full)
;arr3=getarr(3,1,1022,/full)

;
;Get data for tomography
;

det_off=indgen(106)+3970

;gar=getarr(1,2,288,/full)
gar=getarr(1,100,288,/full)
arr1a_1300=fold(gar,2160,2350,0,exp1a_1300)
arr1b_1300=fold(gar,2750,3420,0,exp1b_1300)
arr1c_1300=fold(gar,3910,5790,0,exp1c_1300)
arr1_1300=arr1a_1300+arr1b_1300+arr1c_1300
exp1_1300=exp1a_1300+exp1b_1300+exp1c_1300
exp1_1300((det_off+0) mod 1000,*)=exp1_1300((det_off+0) mod 1000,*) - 1

gar=getarr(1,372,558,/full)
arr1a_1100=fold(gar,2160,2350,0,exp1a_1100)
arr1b_1100=fold(gar,2750,3420,0,exp1b_1100)
arr1c_1100=fold(gar,3910,5790,0,exp1c_1100)
arr1_1100=arr1a_1100+arr1b_1100+arr1c_1100
exp1_1100=exp1a_1100+exp1b_1100+exp1c_1100
exp1_1100((det_off+0) mod 1000,*)=exp1_1100((det_off+0) mod 1000,*) - 1

gar=getarr(1,559,708,/full)
arr1a_1000=fold(gar,2160,2350,0,exp1a_1000)
arr1b_1000=fold(gar,2750,3420,0,exp1b_1000)
arr1c_1000=fold(gar,3910,5790,0,exp1c_1000)
arr1_1000=arr1a_1000+arr1b_1000+arr1c_1000
exp1_1000=exp1a_1000+exp1b_1000+exp1c_1000
exp1_1000((det_off+0) mod 1000,*)=exp1_1000((det_off+0) mod 1000,*) - 1

gar=getarr(1,709,1022,/full)
arr1a_900=fold(gar,2160,2350,0,exp1a_900)
arr1b_900=fold(gar,2750,3420,0,exp1b_900)
arr1c_900=fold(gar,3910,5790,0,exp1c_900)
arr1_900=arr1a_900+arr1b_900+arr1c_900
exp1_900=exp1a_900+exp1b_900+exp1c_900
exp1_900((det_off+0) mod 1000,*)=exp1_900((det_off+0) mod 1000,*) - 1




gar=getarr(2,2,246,/full)
arr2a_1300=fold(gar,2460,2930,500,exp2a_1300)
arr2b_1300=fold(gar,3420,5790,500,exp2b_1300)
arr2_1300=arr2a_1300+arr2b_1300
exp2_1300=exp2a_1300+exp2b_1300
exp2_1300((det_off+500) mod 1000,*)=exp2_1300((det_off+500) mod 1000,*) - 1

gar=getarr(2,390,502,/full)
arr2a_1100=fold(gar,2460,2930,500,exp2a_1100)
arr2b_1100=fold(gar,3420,5790,500,exp2b_1100)
arr2_1100=arr2a_1100+arr2b_1100
exp2_1100=exp2a_1100+exp2b_1100
exp2_1100((det_off+500) mod 1000,*)=exp2_1100((det_off+500) mod 1000,*) - 1

gar=getarr(2,503,700,/full)
arr2a_1000=fold(gar,2460,2930,500,exp2a_1000)
arr2b_1000=fold(gar,3420,5790,500,exp2b_1000)
arr2_1000=arr2a_1000+arr2b_1000
exp2_1000=exp2a_1000+exp2b_1000
exp2_1000((det_off+500) mod 1000,*)=exp2_1000((det_off+500) mod 1000,*) - 1

gar=getarr(2,701,1022,/full)
arr2a_900=fold(gar,2460,2930,500,exp2a_900)
arr2b_900=fold(gar,3420,5790,500,exp2b_900)
arr2_900=arr2a_900+arr2b_900
exp2_900=exp2a_900+exp2b_900
exp2_900((det_off+500) mod 1000,*)=exp2_900((det_off+500) mod 1000,*) - 1




gar=getarr(3,2,258,/full)
arr3a_1300=fold(gar,2160,3130,750,exp3a_1300)
arr3b_1300=fold(gar,3520,5790,750,exp3b_1300)
arr3_1300=arr3a_1300+arr3b_1300
exp3_1300=exp3a_1300+exp3b_1300
;arr3_1300(*,610:698)=0
;exp3_1300(*,610:698)=0
exp3_1300((det_off+750) mod 1000,*)=exp3_1300((det_off+750) mod 1000,*) - 1

gar=getarr(3,432,532,/full)
arr3a_1100=fold(gar,2160,3130,750,exp3a_1100)
arr3b_1100=fold(gar,3520,5790,750,exp3b_1100)
arr3_1100=arr3a_1100+arr3b_1100
exp3_1100=exp3a_1100+exp3b_1100
exp3_1100((det_off+750) mod 1000,*)=exp3_1100((det_off+750) mod 1000,*) - 1
arr3_1100(*,610:698)=0
exp3_1100(*,610:698)=0

gar=getarr(3,533,700,/full)
arr3a_1000=fold(gar,2160,3130,750,exp3a_1000)
arr3b_1000=fold(gar,3520,5790,750,exp3b_1000)
arr3_1000=arr3a_1000+arr3b_1000
exp3_1000=exp3a_1000+exp3b_1000
exp3_1000((det_off+750) mod 1000,*)=exp3_1000((det_off+750) mod 1000,*) - 1
;arr3_1000(*,610:698)=0
;exp3_1000(*,610:698)=0

gar=getarr(3,701,1022,/full)
arr3a_900=fold(gar,2160,3130,750,exp3a_900)
arr3b_900=fold(gar,3520,5790,750,exp3b_900)
arr3_900=arr3a_900+arr3b_900
exp3_900=exp3a_900+exp3b_900
exp3_900((det_off+750) mod 1000,*)=exp3_900((det_off+750) mod 1000,*) - 1
;arr3_900(*,610:698)=0
;exp3_900(*,610:698)=0


save,arr1_1300,arr2_1300,arr3_1300,exp1_1300,exp2_1300,exp3_1300,file="sino_1300.idl"
save,arr1_1100,arr2_1100,arr3_1100,exp1_1100,exp2_1100,exp3_1100,file="sino_1100.idl"
save,arr1_1000,arr2_1000,arr3_1000,exp1_1000,exp2_1000,exp3_1000,file="sino_1000.idl"
save,arr1_900, arr2_900, arr3_900, exp1_900, exp2_900, exp3_900, file="sino_900.idl"

end
