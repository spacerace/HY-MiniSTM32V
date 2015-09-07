## - USART1 software for STM32F1xx / STM32F103_VCT6 / HY-MiniSTM32V -

### Brief:
This code is an example on how to use **USART1** with or without **printf**.
It does not use DMA or interrupts.
It was written for the **HY-MiniSTM32V board** and tested on it.
This archive includes and uses the ST standard peripherials lib V3.5.0.

### Code size comparison:
If you decide to use printf/sprintf/scanf/...-family of functions
you will need a few kilobytes.

This example code was compiled first time without using printf, one time with:

	1. without printf  text=1488 bytes, data=20 bytes, bss=512bytes
	2. with printf     text=23816 bytes, data=2224 bytes, bss=572bytes

this is a increase by: text = 22328 bytes, data = 204 bytes, bss  = 60 bytes


### CONFIGURATION:
Open *usart.c* and go to *usart1_init()*-function. There you will find the 
configuration options, it is self-explaining.

### USAGE:
First call *usart1_init()* for proper initialization, after that you can use
the other functions:

`	* void usart1_putc(char c)	/* send single character */

	* void usart1_puts(char *str)   /* send a string */

	* uint8_t usart1_getc()		/* get a character */`

### TODO:
	* fix scanf support

### CHANGELOG:
	2015-09-07  created source archive for publishing, clean up
