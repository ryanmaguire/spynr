detname = ['1','2','3']
bandname = ['long', 'mid', 'short']

for i = 0, n_elements(bandname)-1 do begin
	for j = 0, n_elements(detname)-1 do begin
		restore, bandname[i]+'_'+detname[j]+'.sav'
		tv, bytscl(sino)
		wait, 1
		print, j
	endfor
endfor
end
