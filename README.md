# SPINR-MAST
## Sinogram and Exposure
To create the sinograms and exposure maps you will need several IDL procedures and the data from the flight under consideration. The data from flight 1 can be found [Here](Flight 1/Flight 1 Data/). Flight 2 is [Here](Flight 2/Flight 2 Data/) and flight 3 [Here](Flight 3/Flight 3 Data/). The procedures for flight 1 are [Here](Flight 1/Flight 1 Procedures/), flight 2 [Here](Flight 2/Procedures/), and flight 3 [Here](Flight 3/Flight 3 Procedures/). All of the flights use [these](IDL Stuff/) procedures as well.

For brevity we will only show how to make the sinograms and exposure maps for the second flight, as the process is the same for all 3 flights.

For convenience place the IDL procedures in a single folder with the data for flight 2, or ensure that the data and procedures are included in your path.
You will need:

* interpol.pro
* gettok.pro
* wav2num.pro
* fold.pro
* getarr.pro
* getarrs.pro

Compile getarrs.pro and run. Please note you are not running getarr.pro, but getarrs.pro. This will take some time to finish. When the procedure has finished do:
* tvscl, arr1
* tvscl, arr2
* tvscl, arr3
* tvscl, arr4

This will give you the four sinograms. In a similar manner you can obtain the exposure maps.

## Getting the Spectra
