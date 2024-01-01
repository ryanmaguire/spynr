;-----------------------------------------------------------------------------;
; make_bad_t.pro                                                              ;
;-----------------------------------------------------------------------------;
; This programs makes a rough estimate of the T-Matrix for reconstruction. It ;
; serves to create a reconstruction of the sky that can be used to find the   ;
; location of various stars in the sky. These locations can then be used to   ;
; create a PSF of that can be incorporated into the T-Matrix for a better     ;
; reconstruction.                                                             ;
;-----------------------------------Inputs------------------------------------;
Flight = 'flight3'                       ;The flight being used.              ;
x_sino = 200                             ;Number of pixels in sinogram x-axis.;
x_dim  = 160                             ;Number of pixels in x-axis of sky.  ;
y_dim  = 160                             ;Number of pixels in y-axis of sky.  ;
;-----------------------------------------------------------------------------;
dir_c  = '../centers/'                   ;Directory for the center variable.  ;
dir_t  = '../bad_t_matrices/'+Flight+'/' ;Directory for bad T-Matrices.       ;
;-----------------------------------------------------------------------------;

;Input must be either 'flight2' or 'flight3'.
if Flight ne 'flight2' and Flight ne 'flight3' then begin
  print, ''
  print, 'Flight = ', Flight
  print, "Flight must be either 'flight2' or 'flight3'"
  print, ''
  STOP
endif

restore, dir_c+'center_'+Flight+'.sav'      ;Restore center variable.
n      = x_dim*y_dim                        ;The number of pixels in the sky.   
ell   = n_elements(Center)                  ;Number of T-Matrices to make.
omega = 2*!dpi/x_sino                       ;Frequency of rotation.
for k = 0, ell-1 do begin
  TM  = fltarr(n,n)                         ;Create empty T-Matrix
  for i = 0,n-1 do begin
    theta     = (i mod x_sino)*omega        ;Angle of rotation.
    z         = (floor(i/x_sino)-center[k]) ;Set central pixel as midpoint.
    ctheta    = cos(theta)                  ;Cosine of rotation angle.
    stheta    = sin(theta)                  ;Sine of rotation angle.
    zx        = z*cos(theta)                ;Sinogram x-coordinate.
    zy        = z*sin(theta)                ;Sinogram y-coordinate.
    ZSKY = [zx,zy]                          ;Sinogram position.
    for j = 0, n-1 do begin
      x     = (j mod x_dim)-x_dim/2.d0      ;x-coordinate of sky.                 
      y     = floor(j/y_dim) - y_dim/2.d0   ;y-coordinate of sky.
      projx = x*(ctheta^2)+y*stheta*ctheta  ;x-projection onto z.
      projy = x*stheta*ctheta+y*(stheta^2)  ;y-projection onto z.
      XYSKY = [projx,projy]                 ;sky-projection onto z.
    if (norm(XYSKY-ZSKY) lt 1) then TM[i,j] = 1
    endfor
  print, k, i
  endfor
save, TM, filename = dir_t+'bad_TM_'+n2s(Center[k])+'.sav'
endfor
end