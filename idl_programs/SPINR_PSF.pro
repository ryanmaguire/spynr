;*******************************************************************************
;   
;    Name:       PSF_Flight_3.pro
;
;    Author:     Ryan Maguire
;
;    History:    Created 6/21/2017
;
;    Function:   Compute PSF's of sinograms.
;
;
;**********************************************************************************

xsino = 200
ysino = 128
starname = ['beta','delta','pi','sigma']
detname = ['1','2','3']
bandname = ['long', 'mid', 'short']
starpath = fltarr(n_elements(starname),xsino,ysino)

for i = 0, n_elements(bandname)-1 do begin
	for j = 0, n_elements(detname)-1 do begin
		restore, bandname[i]+'_'+detname[j]+'.sav'
		for k = 0, n_elements(starname)-1 do begin
			restore, 'starpos'+'_'+bandname[i]+'_'+detname[j]+starname[k]+'.sav'
			sigma = fltarr(xsino)
			for j = 1, xsino-1 do begin
				for l = 0, 7 do begin
					starpath[k,j,starpos[0]*cos(j*pi/100) + starpos[1]*sin(j*pi/100) - center+l-3] = sino[j,starpos[0]*cos(j*pi/100) + starpos[1]*sin(j*pi/100) - center+l-3]
				sigma[j] = 

				



