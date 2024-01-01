;**************************************************************************************************************************
;                                                                                                                         ;
;    Name:       Skymask                                                                                                  ;
;                                                                                                                         ;
;    Author:     Ryan Maguire                                                                                             ;
;                                                                                                                         ;
;    History:    Created 4/6/2017                                                                                         ;
;                                                                                                                         ;
;    Function:   Create Vignetting masks.                                                                                 ;
;                                                                                                                         ;
;    INPUTS:     'Tmatrixi.sav' A save file of the ith T matrix, 'array_datai.sav', the save file of the ith sinogram.    ;
;                                                                                                                         ;
;    OUTPUTS:    skymask[*,*,n], the nth mask.                                                                            ;
;                                                                                                                         ;
;**************************************************************************************************************************
Det_Name      = ['1','2','3','4']                                     ;Labels for the detectors.                          ;
Band_Name     = ['long','mid','short']                                ;Names of the bands of light.                       ;
;*******************************************************User Inputs********************************************************
xdim          = 160                                           ;Number of pixels in the x-direction.                       ;
ydim          = 160                                           ;Number of pixels in the y-direction.                       ;
n_iter        = 3000                                          ;Number of iterations to be performed during reconstruction.;                                                        ;
alpha         = 0.00001                                       ;Value of the alpha parameter in reconstruction.            ;
Flight        = 'Flight2'                                     ;Flight number (Either 2 or 3).                             ;
;**************************************************************************************************************************
Dat_Dir       = '../Sinograms/'+Flight+'/'                    ;Directory where the sinograms are located.                 ;
T_Dir         = '../T_Matrices/'+Flight+'/'                   ;Directory where the T Matrices are located.                ;
sky           = fltarr(xdim,ydim,N)                           ;Create array to start all reconstructed sky images.        ;
m             = n_elements(Det_Name)*n_elements(Band_Name)    ;Number of data sets available.                             ;
;-------------------------------------------------------------------------------------------------------------------------;

restore, '../Sky/'+Flight+'/skymask.sav'

for i = 0,m-1 do begin
	restore, Dat_Dir+'array_data_'+Band_Name[i mod n_elements(Band_Name)]+Det_Name[i/n_elements(Det_Name)]+Flight+'_.sav'
	restore, T_dir+'Tmatrix_'+Band_Name[i mod n_elements(Band_Name)]+Det_Name[i/n_elements(Det_Name)]+Flight+'_.sav'
	
	skyset = fltarr(25600,n_iter)
	mask = skymask[*,*,i-1]
	skyset[*,0] = mask

	for n = 1,n_iter-1 do begin
	  skyset[*,n] = skyset[*,(n-1)]*((1-alpha)-alpha*(alog(skyset[*,(n-1)]+1)+TMatrix##((TM##skyset[*,(n-1)]-sinogram)/(sinogram+1))))
		skyset[where(mask eq 0),n] = 0
		print, n, min(skyset[*,n]), max(skyset[*,n])
		if (min(skyset[*,n]) lt 0) then begin
			skyset[*,n] = skyset[*,(n-1)]
			alpha = 0.5*alpha
		endif
	endfor

	sky[*,*,i-1] = reform(skyset[*,n_iter-1],160,160)
	save, skyset, filename = 'sky'+n2s(i)+'.sav'
	save, sky, filename = 'sky.sav'
	
endfor

save, sky, filename = 'sky.sav'

end
