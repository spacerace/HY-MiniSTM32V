## - Execution Time Measurement -   
  
This code is an example on how to measure execution time  
It was written for the **HY-MiniSTM32V board** and tested on it.  
This archive includes and uses the ST standard peripherials lib V3.5.0.  
  
### Example output from a 72MHz STM32F103  
`HY-MiniSTM32V STM32F103-VCT6 DWT CYCLE COUNTER EX.
----------------------------------------------------
0 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 
----------------------------------------------------
^^took 291812 cycles.

Different MCU-speeds give different time-per-tick values:
 128MHz   7.8125nS
  72MHz  13.8888nS
  56MHz  17.8571nS
  48MHz  20.8333nS
  36MHz  27.7777nS
  24MHz  41.6666nS
   8MHz 125.0000nS

SystemCoreClock = 72000000Hz
time used in nano-seconds: 4056186
`  
(4056186nS = 4056.186µS = 4.056mS)  
  
### TODO:  
	* floating point calculation  
	* fixed point calculation  
  
### CHANGELOG:  
	2018-06-10  created this project  

  
