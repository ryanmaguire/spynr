import numpy as np

def coadd(array, xdim, ydim, rss=rss):
    n_pts = np.size(array)
    ndims = array.ndim


    if (ndims < 1) or (ndims > 2):
        raise IndexError("One of Two dimensions, Only.")

    if rss:
        in_val = array*array
    else:
        in_val = array

    if (ndims == 1):
        if ((n_pts % xdim) != 0):
            raise IndexError("New dimension must be divisible by old.")
        else:
            scale = n_pts/xdim
            co = rebin(array, xdim)*0.0
            for i in range(xdim):
                co[i] = np.sum(in_val[i*scale:(i+1)*scale-1])

    else:
        if ((array.shape[0] % xdim) != 0):
            raise IndexError("New xdim must divide old")
        else if ((array.shape[1] % ydim) != 0):
            raise IndexError("New ydim must divide old.")
        else:
            scale_x = array.shape[0]/xdim
            scale_y = array.shape[1]/ydim
            co = rebin(array, xdim, ydim)*0.0
            for i in range(xdim):
                for j in range(ydim):
                    co[i,j] = np.sum(in[i*scale_x:(i+1)*scale_x-1,j*scale_y:(j+1)*scale_y-1])

    if rss:
        co = np.sqrt(co)

    return co

def fold(arr, start, stop, offset, expose):
    s = arr.shape[1]

    out = intarr(1000,s(2))
    expose=fltarr(1000,s(2))
    for i in range(start, stop):
        ind = ((i+offset) % 1000)
        out(ind,*)=out(ind,*)+arr(i,*)
        expose(ind,*)=expose(ind,*)+1.

    return out
