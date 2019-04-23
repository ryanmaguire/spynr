;-----------------------------------------------------------------------------;
; reconstruct_bad_sky.pro                                                     ;
;-----------------------------------------------------------------------------;
; This program uses the maximum entropy method and the bad T-Matrices to      ;
; reconstruct a rough approximation of the sky. This appromxation is used to  ;
; determine the position of stars in the sky so that a PSF may be made for a  ;
; better T-Matrix, and then allow for more accurate reconstruction. The code  ;
; is almost identical to reconstruct_sky.pro, with the exception that         ;
; bad T-Matrices are used and the save files are called bad_sky.              ;
;-----------------------------------Inputs------------------------------------;
xdim   = 160                    ;Number of pixels in x-axis.                  ;
ydim   = 160                    ;Number of pixels in y-axis.                  ;
n_iter = 1000                   ;Number of iterations for reconstruction.     ;
alpha  = 0.00000001             ;Value of the alpha-parameter.                ;
Flight = 'flight2'              ;Flight number (Either 2 or 3).               ;
;-----------------------------------------------------------------------------;
Det    = ['1','2','3','4']              ;Labels for the detectors.            ;
Band   = ['long','mid','short']         ;Labels for the bands.                ;
dir_s  = '../sinograms/'+Flight+'/'     ;Directory for sinograms.             ;
dir_t  = '../bad_t_matrices/'+Flight+'/';Directory for bad T-Matrices.        ;
dir_m  = '../bad_skymask/'+Flight+'/'   ;Directory for the vignetting masks.  ;
dir_sk = '../bad_sky/'+Flight+'/'       ;Directory for reconstructed images.  ;
;-----------------------------------------------------------------------------;

;Input must be either 'flight2' or 'flight3'.
if Flight ne 'flight2' and Flight ne 'flight3' then begin
  print, ''
  print, 'Flight = ', Flight
  print, "Flight must be either 'flight2' or 'flight3'"
  print, ''
  STOP
endif

if Flight eq 'flight3' then begin
  Det = ['1','2','3']             ;Flight 3 does not have detector 4.
endif

nd    = n_elements(det)           ;Number of detectors.
nb    = n_elements(band)          ;Number of bands.
np    = xdim*ydim                 ;Total number of pixels.

for i = 0,nb-1 do begin
  for k = 0,nd-1 do begin
    ;Restore the sinograms, T-Matrix, and vignetting from idl save files.
    restore, dir_s+'array_data_'+Band[i]+Det[k]+'_'+Flight+'.sav'
    restore, dir_t+'bad_TM_'+Band[i]+Det[k]+'_'+Flight+'.sav'
    restore, dir_m+'bad_skymask_'+Band[i]+Det[k]+'_'+Flight+'.sav'

    sky = fltarr(np,n_iter)         ;Create an empty array for the sky.
    sky[*,0] = reform(skymask,np)   ;The initial guess is the vignetting mask.

    for n = 1,n_iter-1 do begin   ;Run the iterative algorithm.
      sky[*,n] = sky[*,(n-1)]*((1-alpha)-alpha*$
        (alog(sky[*,(n-1)]+1)+TM##((TM##sky[*,(n-1)]-sinogram)/(sinogram+1))))
      sky[where(skymask eq 0),n] = 0 ;Zero points in mask are zero in sky.
      ;Check to make sure the current iteration is positive.
      if (min(sky[*,n]) lt 0) then begin
        sky[*,n] = sky[*,(n-1)]
        alpha = 0.5*alpha
      endif
      print, n
    endfor
    ;Save the sky variable in the sky directory.
    save, sky, filename = dir_sk+'/bad_sky_'+Band[i]+Det[k]+'_'+Flight+'.sav'
  endfor
endfor
end