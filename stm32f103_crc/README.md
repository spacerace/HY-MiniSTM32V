## - CRC software for STM32F1xx / STM32F103_VCT6 / HY-MiniSTM32V -

This code is an example on how to use **CRC engine** on STM32.
It was written for the **HY-MiniSTM32V board** and tested on it.
This archive includes and uses the ST standard peripherials lib V3.5.0.

### Hardware connection:
USART1 is configured to use PA9 for TX, PA10 for RX. On the HY-MiniSTM32V these
are connected to the PL2303 USB-UART-converter.

### CONFIGURATION:
Open *usart.c* and go to *usart1_init()*-function. There you will find the 
configuration options, it is self-explaining.

### CHANGELOG:
	2015-09-07  created source archive for publishing, clean up
