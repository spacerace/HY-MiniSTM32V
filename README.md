## HY-MiniSTM32V project examples
  
This archive includes a few example projects for the **HY-MiniSTM32V board**.  
This board ships with some Keil Examples which are very buggy and mostly  
unusable.
The makefile-examples in this archive are all IDE-independet, 
they just use gcc/make.

ssd1289+ads7843 TFT and Touchscreen examples are located in a different  
repository. See [here](https://github.com/spacerace/ssd1289).
  
### Included Example Projects (makefile):  
	* Overclocking to 128MHz
	* DWT CycleCounter
	* USART1 with/without printf, with/without interrupts
	* I2C1 with PCF8574
	* CPU temperature reading via ADC
	* CRC calculation (+emulation in C)
	* EXTI, Buttons, LEDs
	* SysTick Interrupt, delay and time measurement
	* SDIO + Elm Chan's FatFS

### Included Example Projects (Keil):
	* Battery backed backup registers (RTC)
	* Blinky
	* Overclocking to 128MHz
	* SSD1289 320x240px TFT Display
	* USART1 + printf + floating point numbers

### Changelog:
	2019-03-13	moved TFT+touch into own project
	2019-03-01	reworked sd-card example
	2018-06-15	bkp registers
	2018-06-15	printf double float
	2018-06-11	dwt cycle counter
	2018-06-09	7segment + dotmatrix
	2018-06-08	overclock to 128MHz
	2018-06-07	SSD1289
	2018-06-07	keil blinky
	2016-07-14	elm chan's fatfs v0.12a
	2016-07-07	ads7843
	2016-07-07	leds
	2015-09-09	Systick delay
	2015-09-08	I2C
	2015-09-07	CRC
	2015-09-07	EXTI-Buttons-LEDs
	2015-09-07	ADC cpu temp example
	2015-09-07	I2C example
	2015-09-07	initial commit, USART1 ex, README-files

