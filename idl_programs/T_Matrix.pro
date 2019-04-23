n=25600
Flight = 2
restore, 'Labels.sav'
restore, 'Center'+n2s(Flight)+'.sav'
for k = 0,n_elements(center)-1 do begin
	TM = fltarr(n,n)
	for i = 0,n-1 do begin
		for j = 0, n-1 do begin
			x = (j mod 160)-80
			y = floor(j/160) - 80
			t = i mod 200
			omega = !pi/100
			theta = t*omega	
			z = (floor(i/200)-center[k])
			projx = x*(cos(theta)^2)+y*sin(theta)*cos(theta)
			projy = x*sin(theta)*cos(theta)+y*(sin(theta)^2)
			XYSKY = [projx,projy]
			zx = z*cos(theta)
			zy = z*sin(theta)
			ZSKY = [zx,zy]
			if (norm(XYSKY-ZSKY) lt 0.5) then TM[i,j] = 1
		endfor
		print, k, i
	endfor
	n = floor(k/3)
	m = k mod 3
	save, TM, filename = bandname[n]+'_'+detname[m]+'_TM.sav'
endfor
end
