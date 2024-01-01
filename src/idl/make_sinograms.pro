;-----------------------------------------------------------------------------;
;Name:                                                                        ;
; Get_Sinograms.pro                                                           ;
;-----------------------------------------------------------------------------;
; This program constructs sinograms from the raw data files. It computes raw  ;
; sinograms, coadded sinograms, and reformed one-dimensional sinograms.       ;
;------------------------------User Inputs------------------------------------;
Flight  = 'flight2'  ;Flight for which sinograms will be created.             ;
xdim    = 200        ;Number of pixels in coadded x-axis. Must divide 1000.   ;
ydim    = 128        ;Number of pixels in coadded y-axis. Must divide 1024.   ;
;-----------------------------------------------------------------------------;
dir   = '../data/'+Flight+'/'        ;The directory where the data is.        ;
sdir  = '../sinograms/'+Flight+'/'   ;Directory where sinograms will be saved.;
;-----------------------------------------------------------------------------;

;Make sure Flight is either 'flight2' or 'flight3'
if Flight ne 'flight2' and Flight ne 'flight3' then begin
  print, ''
  print, 'Flight = ',Flight
  print, "Set Flight to either 'flight2' or 'flight3'"
  print, ''
  STOP
endif

B     = ['long','mid','short','background'];Name of the band.
Det   = ['1','2','3','4']                  ;Detector number.
L     = [1235,1030,912,0]                  ;Left endpoint of band.
R     = [2000,1200,1029,900]               ;Right endpoint of band.
T     = 'array_data_'                      ;Title prefix for save files.
n_end = 3                                  ;Number of detectors.
if Flight eq 'flight2' then n_end +=1      ;Flight 2 has 4 detectors.

for n = 1,n_end do begin                  ;Cycle through detectors.
 for k=0,n_elements(B)-1 do begin         ;Cycle through bands.
   ;Extract the sinograms from the data sets
   arr      = fold(getarr(dir,n,L[k],R[k],y_min1,y_max1),2518,5749,0,expose)
   sino     = coadd(arr/expose,xdim,ydim) ;Coadd sinogram to a 200x128 array.
   sinogram = reform(sino,xdim*ydim)      ;Reform sinogram into a vector.
   ;Save the original array, coadded array, and vector.
   save,arr,expose,sino,sinogram,filename=sdir+T+B[k]+det[n-1]+'_'+Flight+'.sav'
 endfor
endfor
end