

def get_raw_data(getarr,dir,detnum,low,high,y_min,y_max,full=False):
    fn = dir+'det'+strtrim(str(detnum),2)+'.dat'
    spawn,'wc -c '+fn,tmp
    num = int(gettok(tmp(0),' '))
    if full:
        arr = lonarr(6200,1024)
    else:
        arr = lonarr(6200,256)

    n_events = num/6

    in = assoc(1,intarr(3))
    close,1
    openr,1,fn

    if (detnum == 1):
        y_min=0>((0*.87+95.)/4.)<255
        y_max=0>((250*4.*.87+95.)/4.)<255
        for i in range(n_events):
            if fix(i/1000) eq (i/1000.) then print,i,n_events-1
            tmp=in(i)
            if ((tmp(0) ge wave2num(dir,detnum,high,tmp(1))) and
                (tmp(0) le wave2num(dir,detnum,low,tmp(1))) and 
                (tmp(0) gt 0) and
                (tmp(0) lt 1023) and
                (tmp(1) gt 0) and (tmp(1) lt 1023)):
                if full:
                    y = 0>((tmp(1)))<1023
                else:
                    y=0>((tmp(1))/4.)<255

                arr(tmp(2),y)=arr(tmp(2),y)+1

    elif (detnum == 2):
        y_min=0>((36*4*.97+46.)/4.)<255
        y_max=0>((255*4*.97+46.)/4.)<255
        for i in range(n_events):
            if fix(i/1000) eq (i/1000.) then print,i,n_events-1
            tmp=in(i)
            if ((tmp(0) ge wave2num(dir,detnum,high,tmp(1))) and
                (tmp(0) le wave2num(dir,detnum,low,tmp(1))) and
                (tmp(0) gt 0) and
                (tmp(0) lt 1023) and
                (tmp(1) gt 0) and
                (tmp(1) lt 1023)):
                if full:
                    y=0>((tmp(1)))<1023
                else:
                    y=0>((tmp(1))/4.)<255

                arr(tmp(2),y)=arr(tmp(2),y)+1

    elif (detnum == 3):
        y_min=0>((9*4*.95+16.)/4.)<255
        y_max=0>((253*4*.95+16.)/4.)<255
        for i in range(n_events):
            if fix(i/1000) eq (i/1000.) then print,i,n_events-1
            tmp=in(i)
            if ((tmp(0) ge wave2num(dir,detnum,high,tmp(1))) and
                (tmp(0) le wave2num(dir,detnum,low,tmp(1))) and
                (tmp(0) gt 0) and
                (tmp(0) lt 1023) and
                (tmp(1) gt 0) and
                (tmp(1) lt 1023)):
                if full:
                    y=0>((tmp(1)))<1023
                else:
                    y=0>((tmp(1))/4.)<255

                arr(tmp(2),y)=arr(tmp(2),y)+1

    elif (detnum == 4):
        y_min=(0>(14*4)/4.)<255
        y_max=(0>(255*4)/4.)<255
        for i in range(n_events):
            if fix(i/1000) eq (i/1000.) then print,i,n_events-1
            tmp=in(i)
            if ((tmp(0) ge wave2num(dir,detnum,high,tmp(1))) and
                (tmp(0) le wave2num(dir,detnum,low,tmp(1))) and
                (tmp(0) gt 0) and
                (tmp(0) lt 1023) and
                (tmp(1) gt 0) and
                (tmp(1) lt 1023)):
            if full:
                y=0>((tmp(1)))<1023
            else:
                y=(0>(tmp(1))/4.)<255

            arr(tmp(2),y)=arr(tmp(2),y)+1

    else:
        raise ValueError('Error in getarr case statement')

    return arr


class GetSinograms(object)
    def __init__(flight,dir="../data/"):
        if (flight != 'flight2') and (flight != 'flight3'):
            raise ValueError("Flight shoulde be 2 or 3.")

        # Detector 1 Longwave Data
        arr = fold(getarr(dir,1,1235,2000,y_min1,y_max1),2518,5749,0,expose)
        sino = coadd(arr/expose,200,128)
        sinogram = reform(sino,25600)

        self.array_data_long_1_arr = arr
        self.array_data_long_1_sino = sino
        self.array_data_long_1_expose = expose
        self.array_data_long_1_sinogram = sinogram

        # Detector 1 Midwave Data
        arr = fold(getarr(dir,1,1030,1200,y_min1,y_max1),2518,5749,0,expose)
        sino = coadd(arr/expose,200,128)
        sinogram = reform(sino,25600)

        self.array_data_mid_1_arr = arr
        self.array_data_mid_1_sino = sino
        self.array_data_mid_1_expose = expose
        self.array_data_mid_1_sinogram = sinogram

        # Detector 1 Shortwave Data
        arr = fold(getarr(dir,1,912,1029,y_min1,y_max1),2518,5749,0,expose)
        sino = coadd(arr/expose,200,128)
        sinogram = reform(sino,25600)

        self.array_data_short_1_arr = arr
        self.array_data_short_1_sino = sino
        self.array_data_short_1_expose = expose
        self.array_data_short_1_sinogram = sinogram

        # Detector 1 Background Data
        arr = fold(getarr(dir,1,0,900,y_min1,y_max1),2518,5749,0,expose)
        sino = coadd(arr/expose,200,128)
        sinogram = reform(sino,25600)

        self.array_data_background_1_arr = arr
        self.array_data_background_1_sino = sino
        self.array_data_background_1_expose = expose
        self.array_data_background_1_sinogram = sinogram


        # Detector 2 Long Data
        arr = fold(getarr(dir,2,1235,2000,y_min2,y_max2),2518,5749,500,expose)
        sino = coadd(arr/expose,200,128)
        sinogram = reform(sino,25600)

        self.array_data_long_2_arr = arr
        self.array_data_long_2_sino = sino
        self.array_data_long_2_expose = expose
        self.array_data_long_2_sinogram = sinogram

        # Detector 2 Mid Data
        arr = fold(getarr(dir,2,1030,1200,y_min2,y_max2),2518,5749,500,expose)
        sino = coadd(arr/expose,200,128)
        sinogram = reform(sino,25600)

        self.array_data_mid_2_arr = arr
        self.array_data_mid_2_sino = sino
        self.array_data_mid_2_expose = expose
        self.array_data_mid_2_sinogram = sinogram

        # Detector 2 Short Data
        arr = fold(getarr(dir,2,912,1029,y_min2,y_max2),2518,5749,500,expose)
        sino = coadd(arr/expose,200,128)
        sinogram  = reform(sino,25600)

        self.array_data_short_2_arr = arr
        self.array_data_short_2_sino = sino
        self.array_data_short_2_expose = expose
        self.array_data_short_2_sinogram = sinogram

        # Detector 2 Background Data
        arr = fold(getarr(dir,2,0,900,y_min2,y_max2),2518,5749,500,expose)
        sino = coadd(arr/expose,200,128)
        sinogram = reform(sino,25600)

        self.array_data_background_2_arr = arr
        self.array_data_background_2_sino = sino
        self.array_data_background_2_expose = expose
        self.array_data_background_2_sinogram = sinogram

        # Detector 3 Long Data
        arr = fold(getarr(dir,3,1235,2000,y_min3,y_max3),2518,5749,750,expose)
        sino = coadd(arr/expose,200,128)
        sinogram = reform(sino,25600)

        self.array_data_long_3_arr = arr
        self.array_data_long_3_sino = sino
        self.array_data_long_3_expose = expose
        self.array_data_long_3_sinogram = sinogram

        # Detector 3 Mid Data
        arr = fold(getarr(dir,3,1030,1200,y_min3,y_max3),2518,5749,750,expose)
        sino = coadd(arr/expose,200,128)
        sinogram = reform(sino,25600)

        self.array_data_mid_3_arr = arr
        self.array_data_mid_3_sino = sino
        self.array_data_mid_3_expose = expose
        self.array_data_mid_3_sinogram = sinogram

        # Detector 3 Short Data
        arr = fold(getarr(dir,3,912,1029,y_min3,y_max3),2518,5749,750,expose)
        sino = coadd(arr/expose,200,128)
        sinogram = reform(sino,25600)

        self.array_data_short_3_arr = arr
        self.array_data_short_3_sino = sino
        self.array_data_short_3_expose = expose
        self.array_data_short_3_sinogram = sinogram

        # Detector 3 Background Data
        arr = fold(getarr(dir,3,0,900,y_min3,y_max3),2518,5749,750,expose)
        sino = coadd(arr/expose,200,128)
        sinogram = reform(sino,25600)

        self.array_data_background_3_arr = arr
        self.array_data_background_3_sino = sino
        self.array_data_background_3_expose = expose
        self.array_data_background_3_sinogram = sinogram
 
        # Flight 3's detector 4 is skipped.
        if (flight == 'flight2'):
            # Detector 4 Long Data
            arr = fold(getarr(dir,4,1235,2000,y_min4,y_max4),2518,5749,250,expose)
            sino = coadd(arr/expose,200,128)
            sinogram = reform(sino,25600)

            self.array_data_long_4_arr = arr
            self.array_data_long_4_sino = sino
            self.array_data_long_4_expose = expose
            self.array_data_long_4_sinogram = sinogram

            # Detector 4 Mid Data
            arr = fold(getarr(dir,4,1030,1200,y_min4,y_max4),2518,5749,250,expose)
            sino = coadd(arr/expose,200,128)
            sinogram = reform(sino,25600)

            self.array_data_mid_4_arr = arr
            self.array_data_mid_4_sino = sino
            self.array_data_mid_4_expose = expose
            self.array_data_mid_4_sinogram = sinogram

            # Detector 4 Short Data
            arr = fold(getarr(dir,4,912,1029,y_min4,y_max4),2518,5749,250,expose)
            sino = coadd(arr/expose,200,128)
            sinogram = reform(sino,25600)

            self.array_data_short_4_arr = arr
            self.array_data_short_4_sino = sino
            self.array_data_short_4_expose = expose
            self.array_data_short_4_sinogram = sinogram

            # Detector 4 Background Data
            arr = fold(getarr(dir,4,0,900,y_min4,y_max4),2518,5749,250,expose)
            sino = coadd(arr/expose,200,128)
            sinogram = reform(sino,25600)

            self.array_data_background_4_arr = arr
            self.array_data_background_4_sino = sino
            self.array_data_background_4_expose = expose
            self.array_data_background_4_sinogram = sinogram
