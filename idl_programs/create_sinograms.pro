;-------------------------------------------------------------------;
;   Function:                                                       ;
;       make_sinograms                                              ;
;   Purpose:                                                        ;
;       Create sinograms from a given set of raw data. This         ;
;       function is particularly designed for SPINR data.           ;
;       the SPINR sounding rocket experiment.                       ;
;   Variables:                                                      ;
;       DAT:                                                        ;
;           Data set that sinograms will be constructed from.       ;
;       XDIM:                                                       ;
;           The number of pixels in the coadded x-axis. This is     ;
;           the number of pixels that will appear in the x-axis     ;
;           of the final sinogram after coadding has been done.     ;
;           This value must divide the number of pixels in the      ;
;           original data set.                                      ;
;       YDIM:                                                       ;
;           The number of pixels in the coadded y-axis. This is     ;
;           the number of pixels that will appear in the y-axis     ;
;           of the final sinogram after coadding has been done.     ;
;           This value must divide the number of pixels in the      ;
;           original data set.                                      ;
;   Outputs:                                                        ;
;       SINO:                                                       ;
;           An array that is XDIMxYDIM in size containing the       ;
;           sinogram for data selected.                             ;
;   Calls:                                                          ;
;       check_pos_real:                                             ;
;           Function used to check if an input is a positive        ;
;           real number (Int, Long, Float, or Double).              ;
;       getarr:                                                     ;
;           Does stuff.                                             ;
;       fold:                                                       ;
;           Does stuff.                                             ;
;       coadd:                                                      ;
;           Does stuff.                                             ;
;   Notes:                                                          ;
;       Some notes                                                  ;
;   References:                                                     ;
;       Some references.                                            ;
;   Examples:                                                       ;
;       Some Examples.                                              ;
;   History:                                                        ;
;       Created: RJM - 2018/05/22 2:14 P.M.                         ;
;-------------------------------------------------------------------;
FUNCTION make_sinograms,DAT,XDIM,YDIM,L,R,SINOGRAM=SINOGRAM
    ON_ERROR,2

    IF TYPE(DAT) NE TYPE("Hi!") THEN MESSAGE, "DAT must be a string."
    ermes = "must be a positive integer."
    IF ~check_pos_real(XDIM) THEN MESSAGE, "XDIM "+ermes
    IF ~check_pos_real(YDIM) THEN MESSAGE, "YDIM "+ermes
    XDIM = LONG(XDIM)
    YDIM = LONG(YDIM)

    ; Extract the sinograms from the raw data set.
    arr  = fold(getarr(dir,n,L,R),2518,5749,0,expose)

    ; Coadd the raw sinogram into one that is XDIMxYDIM in size.
    SINO = coadd(arr/expose,xdim,ydim)

    ; If the SINOGRAM keyword is set, reform into a vector.
    IF KEYWORD_SET(SINOGRAM) THEN SINOGRAM=REFORM(sino,xdim*ydim)
    RETURN, SINO
END