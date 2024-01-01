;*******************************************************************************
;   
;    Name:       Skymask
;
;    Author:     Ryan Maguire
;
;    History:    Created 4/6/2017
;
;    Function:   Create Vignetting masks.
;
;    INPUTS:     'Tmatrixi.sav' A save file of the ith T matrix, 'array_datai.sav', the save file of the ith sinogram.
;
;    OUTPUTS:    skymask[*,*,n], the nth mask.
;
;**********************************************************************************


skymask = fltarr(160,160,12)

for i = 1,12 do begin
	restore, 'Tmatrix'+n2s(i)+'.sav'
	restore, 'array_data'+n2s(i)+'.sav'

	Tmatrix = fltarr(n_elements(sinogram),n_elements(sinogram))
	for n=0l, n_elements(T.index)-1 do Tmatrix(T.index(n))=T.value(n)
	
	mask = fltarr(n_elements(sinogram))

	for n = 0,n_elements(sinogram)-1 do begin
		newsky = intarr(n_elements(sinogram))
		newsky(n) = 1
		newsino = Tmatrix##newsky
		mask(n) = total(newsino)
		print, n, mask(n), max(mask)
	endfor
	
	skymask[*,*,i-1] = reform(mask,160,160)

endfor

save, skymask, filename = 'skymask.sav'

end
