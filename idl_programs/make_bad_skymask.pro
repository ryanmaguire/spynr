;-----------------------------------------------------------------------------;
; make_bad_skymask.pro                                                        ;
;-----------------------------------------------------------------------------;
; This program creates the vignetting mask associated with the bad T-Matrices ;
; so that a rough approximation of the sky may be made. The only difference   ;
; between this code and make_skymask.pro is that this uses the bad T-Matrices.;
;-----------------------------------Inputs------------------------------------;
flight  = 'flight2'           ;The flight for which to create vignette masks. ;
xdim    = 160                 ;The pixel count of the x-axis of the sky.      ;
ydim    = 160                 ;The pixel count of the y-axis of the sky.      ;
;-----------------------------------------------------------------------------;

if Flight ne 'flight2' and Flight ne 'flight3' then begin
  print, ''
  print, 'Flight = ', Flight
  print, "Flight must be either 'flight2' or 'flight3'"
  print, ''
  STOP
endif

dir_t  = '../bad_t_matrices/'+flight ;The directory for the bad t-matrices.
dir_s  = '../sinograms/'+flight      ;The directory for the sinograms.
dir_m  = '../bad_skymask/'+Flight+'/';The directory for bad vignetting masks.
band   = ['long','mid','short']      ;The names of the bandwidths used.
det    = ['1','2','3','4']           ;The detector numbers.

if Flight eq 'flight3' then begin
  Det  = ['1','2','3']               ;Flight 3 does not have detector 4.
endif

;Create an array to store all of the vigetting masks.
;-----| The array is XDIMxYDIMxBANDSxDETECTORS in size.
skymask = fltarr(xdim,ydim,n_elements(band),n_elements(det))

for i = 0,n_elements(band)-1 do begin    ;Loop through all bands.
  for k = 0,n_elements(det)-1 do begin   ;Loop through all detectors.
    restore, dir_t+'/bad_TM_'+band[i]+Det[k]+'_'+flight+'.sav'
    restore, dir_s+'/array_data_'+band[i]+Det[k]+'_'+flight+'.sav'
    mask = fltarr(n_elements(sinogram))   ;Create an empty vignetting mask.

    ;Create the vignetting mask
    for n = 0,n_elements(sinogram)-1 do begin
      mask[n] = total(TM[*,n])               ;Compute the total sum of the sky.
      print, n, mask[n], max(mask)           ;Print current progress.
    endfor

    skymask = reform(mask,xdim,ydim)
    save, skymask, filename = dir_m+'/bad_skymask_'+Band[i]+Det[k]+'_'+Flight+'.sav'
  endfor
endfor

end