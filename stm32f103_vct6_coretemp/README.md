## - ADC CORE TEMP software for STM32F1xx / STM32F103_VCT6 / HY-MiniSTM32V -

### Brief:
This code is an example on how to use the **ADC** to get **cpu temperature**.
It does not use DMA or interrupts.
It was written for the **HY-MiniSTM32V board** and tested on it.
This archive includes and uses the ST standard peripherials lib V3.5.0.

### Hardware connection:
USART1 is configured to use PA9 for TX, PA10 for RX. On the HY-MiniSTM32V these
are connected to the PL2303 USB-UART-converter.
Temperature sensor is integrated in the MCU.

### Code size / Speed thougts:
The calculation should be very quick on a 72MHz CPU, but maybe generating a
static lookup table for converting between ADC-values and temperature-values
could speed things somehow up.

### USART CONFIGURATION:
Open *usart.c* and go to *usart1_init()*-function. There you will find the 
configuration options for communication.

### USAGE:
look at *main.c* it should be self-explaining.

### CHANGELOG:
	2015-09-07  created source archive for publishing, clean up
