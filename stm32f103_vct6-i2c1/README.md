## - I2C software for STM32F1xx / STM32F103_VCT6 / HY-MiniSTM32V -

### Brief:

This code is an example on how to use **I2C1** together with a PCF8574.
It does not use DMA or interrupts.
It was written for the **HY-MiniSTM32V board** and tested on it.
This archive includes and uses the ST standard peripherials lib V3.5.0.

### Hardware connections:
The PCF8574 is connected to PB8=SCL, PB9=SDA. PullUp-Resistors of ca. 4.7k
to VCC are also connected to SDA and SCL.
The address pins are all 1, so address in this example is 0x4E.

### CONFIGURATION:
Open *i2c.c* and go to *i2c_init()*-function. There you will find the 
configuration options, it is self-explaining.

### USAGE:
First call *i2c_init()* for proper initialization, after that you can see
on the read/write_pcf8574-example-functions how to use the i2c-interface.

### TODO:
	* IRQ
	* DMA PCF8574 for input/output purposes, MMIO-like would be nice.

### CHANGELOG:
	2015-09-07  created source archive for publishing, clean up
