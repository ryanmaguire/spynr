;****************************************************************************
;   
;    Name:       Coadd.pro
;
;    Author:     Timothy Cook
;
;    Function:   Resizes sinograms so that they are compatible with the T-Matrices.
;
;    INPUTS:     arrayi (The ith sinogram created via the getarrays.pro routine), xdim, ydim
;
;    OUTPUTS:    Resized Sinograms.
;
;******************************************************************************

function coadd, array, xdim, ydim, rss=rss

old_dims=size(array)

;if old_dims[0] lt 1 or old_dims[0] gt 2 then stop,'1 or 2 dimensions only.'

if keyword_set(rss) then in=array^2 else in=array

case old_dims[0] of

    1: begin

        if old_dims[1] mod xdim ne 0 then stop,'New dimension must be even factor, ',old_dims[1],xdim

        scale=old_dims[1]/xdim
        co=rebin(array,xdim)*0.
        for i=0.,xdim-1 do co[i]=total(in[i*scale:(i+1)*scale-1])

    end

    2: begin

        if old_dims[1] mod xdim ne 0 or old_dims[2] mod ydim ne 0 then stop,'New dimensions must be even factors, ',old_dims[1:2],xdim,ydim

        scale_x=old_dims[1]/xdim
        scale_y=old_dims[2]/ydim
        co=rebin(array,xdim,ydim)*0.
        for i=0.,xdim-1 do for j=0.,ydim-1 do co[i,j]=total(in[i*scale_x:(i+1)*scale_x-1,j*scale_y:(j+1)*scale_y-1])

    end

    else: stop,'1 or 2 dimensions only. Program stopped at coadd.pro'

endcase

if keyword_set(rss) then co=sqrt(co)

return, co

end
