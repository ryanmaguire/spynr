;-----------------------------------------------------------------------------;  
;    Name:       PSF_Flight_3.pro                                             ;
;-----------------------------------------------------------------------------;
Flight   = 'flight2'                   ;Flight being used.                    ;
;-----------------------------------------------------------------------------;
dir_s    = '../sinograms/'+Flight+'/'  ;Directory for sinograms.              ;
dir_st   = '../starpos/'+Flight+'/'    ;Directory for star positions.         ;

xsino = 200
ysino = 128
star     = ['beta','delta','pi','sigma']
Det      = ['1','2','3','4']
Band     = ['long', 'mid', 'short']
starpath = fltarr(n_elements(starname),xsino,ysino)

for b = 0, n_elements(bandname)-1 do begin
 for d = 0, n_elements(detname)-1 do begin
  restore, dir_s+'array_data_'+Band[b]+Det[d]+'_'+Flight+'.sav'
	for s = 0, n_elements(starname)-1 do begin
	 restore, 'starpos'+'_'+Band[b]+'_'+Det[d]+star[s]+'.sav'
		sigma = fltarr(xsino)
		for i = 0, xsino-1 do begin
		 theta  = i*2*!pi/xsino
		 ctheta = cos(theta)
		 stheta = sin(theta)
		 for j = 0, 7 do begin
		  starpath[s,i,starpos[0]*ctheta+starpos[1]*stheta-center+l-3]$
			= sino[j,starpos[0]*ctheta + starpos[1]*stheta - center+l-3]
				sigma[j] = 

				



