;**************************************************************************************************************************
;Name:                                                                                                                    ;
; Get_Sinograms.pro                                                                                                       ;
;                                                                                                                         ;
;Purpose:                                                                                                                 ;
; To create the exposure maps and sinograms of the SPINR data.                                                            ;
;                                                                                                                         ;
;Procedures Called:                                                                                                       ;
; getarr.pro, fold.pro                                                                                                    ;
;**************************************************************************************************************************
;*******************************************************User Inputs********************************************************
Flight               = 'Flight3'                              ;The flight for which sinograms will be created.            ;
;**************************************************************************************************************************
dir                  = '../Data/'+Flight+'/'

if Flight ne 'Flight2' and Flight ne 'Flight3' then begin
  print, ''
  print, 'Flight = ',Flight
  print, "Set Flight to either 'Flight2' or 'Flight3'"
  print, ''
  STOP
endif

;Detector 1
    ;Longwave Data
        arr=fold(getarr(dir,1,1235,2000,y_min1,y_max1),2518,5749,0,expose)
        sino = coadd(arr/expose,200,128)
        sinogram = reform(sino,25600)
        save, arr, expose, sino, sinogram, filename = 'array_data_long1_'+Flight+'.sav'
    ;Midwave Data
        arr=fold(getarr(dir,1,1030,1200,y_min1,y_max1),2518,5749,0,expose)
        sino = coadd(arr/expose,200,128)
        sinogram = reform(sino,25600)
        save, arr, expose, sino, sinogram, filename = 'array_data_mid1_'+Flight+'.sav'
    ;Shortwave Data
        arr=fold(getarr(dir,1,912,1029,y_min1,y_max1),2518,5749,0,expose)
        sino = coadd(arr/expose,200,128)
        sinogram = reform(sino,25600)
        save, arr, expose, sino, sinogram, filename = 'array_data_short1_'+Flight+'.sav'
    ;Background Data
        arr=fold(getarr(dir,1,0,900,y_min1,y_max1),2518,5749,0,expose)
        sino = coadd(arr/expose,200,128)
        sinogram = reform(sino,25600)
        save, arr ,expose, sino, sinogram, filename = 'array_data_Background1_'+Flight+'.sav'


;Detector 2
    ;Long Data
        arr       = fold(getarr(dir,2,1235,2000,y_min2,y_max2),2518,5749,500,expose)
        sino      = coadd(arr/expose,200,128)
        sinogram  = reform(sino,25600)
        save, arr, expose, sino, sinogram, filename = 'array_data_long2_'+Flight+'.sav'
    ;Mid Data
        arr       = fold(getarr(dir,2,1030,1200,y_min2,y_max2),2518,5749,500,expose)
        sino      = coadd(arr/expose,200,128)
        sinogram  = reform(sino,25600)
        save, arr, expose, sino, sinogram, filename = 'array_data_mid2_'+Flight+'.sav'
    ;Short Data
        arr       = fold(getarr(dir,2,912,1029,y_min2,y_max2),2518,5749,500,expose)
        sino      = coadd(arr/expose,200,128)
        sinogram  = reform(sino,25600)
        save, arr, expose, sino, sinogram, filename = 'array_data_short2_'+Flight+'.sav'     
    ;Background Data
        arr       = fold(getarr(dir,2,0,900,y_min2,y_max2),2518,5749,500,expose)
        sino      = coadd(arr/expose,200,128)
        sinogram  = reform(sino,25600)
        save, arr, expose, sino, sinogram, filename = 'array_data_Background2_'+Flight+'.sav'

;Detector 3
    ;Long Data
        arr       = fold(getarr(dir,3,1235,2000,y_min3,y_max3),2518,5749,750,expose)
        sino      = coadd(arr/expose,200,128)
        sinogram  = reform(sino,25600)
        save, arr, expose, sino, sinogram, filename = 'array_data_long3_'+Flight+'.sav'
    ;Mid Data
        arr       = fold(getarr(dir,3,1030,1200,y_min3,y_max3),2518,5749,750,expose)
        sino      = coadd(arr/expose,200,128)
        sinogram  = reform(sino,25600)
        save, arr, expose, sino, sinogram, filename = 'array_data_mid3_'+Flight+'.sav'
    ;Short Data
        arr       = fold(getarr(dir,3,912,1029,y_min3,y_max3),2518,5749,750,expose)
        sino      = coadd(arr/expose,200,128)
        sinogram  = reform(sino,25600)
        save, arr, expose, sino, sinogram, filename = 'array_data_short3_'+Flight+'.sav'
    ;Background Data
        arr       = fold(getarr(dir,3,0,900,y_min3,y_max3),2518,5749,750,expose)
        sino      = coadd(arr/expose,200,128)
        sinogram  = reform(sino,25600)
        save, arr, expose, sino, sinogram, filename = 'array_data_Background3_'+Flight+'.sav'
 
;Flight 3's detector 4 is skipped.
if Flight eq 'Flight2' then begin
;Detector 4
    ;Long Data
        arr       = fold(getarr(dir,4,1235,2000,y_min4,y_max4),2518,5749,250,expose)
        sino      = coadd(arr/expose,200,128)
        sinogram  = reform(sino,25600)
        save, arr, expose, sino, sinogram, filename = 'array_data_long4_'+Flight+'.sav'
    ;Mid Data
        arr       = fold(getarr(dir,4,1030,1200,y_min4,y_max4),2518,5749,250,expose)
        sino      = coadd(arr/expose,200,128)
        sinogram  = reform(sino,25600)
        save, arr, expose, sino, sinogram, filename = 'array_data_mid4_'+Flight+'.sav'
    ;Short Data
        arr       = fold(getarr(dir,4,912,1029,y_min4,y_max4),2518,5749,250,expose)
        sino      = coadd(arr/expose,200,128)
        sinogram  = reform(sino,25600)
        save, arr, expose, sino, sinogram, filename = 'array_data_short4_'+Flight+'.sav'
    ;Background Data
        arr       = fold(getarr(dir,4,0,900,y_min4,y_max4),2518,5749,250,expose)
        sino      = coadd(arr/expose,200,128)
        sinogram  = reform(sino,25600)
        save, arr, expose, sino, sinogram, filename = 'array_data_Background4_'+Flight+'.sav'
endif

end
