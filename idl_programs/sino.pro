restore, 'sino_1000.idl'
array = arr1_1000/exp1_1000
sino = coadd(array,200,128)
save, sino, filename = 'short_1.sav'
array = arr2_1000/exp2_1000
sino = coadd(array,200,128)
save, sino, filename = 'short_2.sav'
array = arr3_1000/exp3_1000
sino = coadd(array,200,128)
save, sino, filename = 'short_3.sav'

print, 1

restore, 'sino_1100.idl'
array = arr1_1100/exp1_1100
sino = coadd(array,200,128)
save, sino, filename = 'mid_1.sav'
array = arr2_1100/exp2_1100
sino = coadd(array,200,128)
save, sino, filename = 'mid_2.sav'
array = arr3_1100/exp3_1100
sino = coadd(array,200,128)
save, sino, filename = 'mid_3.sav'

print, 2

restore, 'sino_1300.idl'
array = arr1_1300/exp1_1300
sino = coadd(array,200,128)
save, sino, filename = 'long_1.sav'
array = arr2_1300/exp2_1300
sino = coadd(array,200,128)
save, sino, filename = 'long_2.sav'
array = arr3_1300/exp3_1300
sino = coadd(array,200,128)
save, sino, filename = 'long_3.sav'

print, 3
end
