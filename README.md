## HY-MiniSTM32V project examples
  
This archive includes a few example projects for the **HY-MiniSTM32V board**.  
This board ships with some Keil Examples which are very buggy and mostly  
unusable.
The makefile-examples in this archive are all IDE-independet, 
they just use gcc/make.  

libopencm3 examples are also included.  
Until now most examples use SPL 3.5.0.  

ssd1289+ads7843 TFT and Touchscreen examples are located in a different  
repository. See [here](https://github.com/spacerace/ssd1289).
  
### Included Example Projects (makefile, SPL):  
	* Overclocking to 128MHz
	* DWT CycleCounter
	* USART1 with/without printf, with/without interrupts
	* I2C1 with PCF8574
	* CPU temperature reading via ADC
	* CRC calculation (+emulation in C)
	* EXTI, Buttons, LEDs
	* SysTick Interrupt, delay and time measurement
	* SDIO + Elm Chan's FatFS

### Included Example Projects (makefile, libopencm3):
	* SysTick + GPIO (blinky)
	* USART1
	* ADC1 polling

### Included Example Projects (Keil, SPL):
	* Battery backed backup registers (RTC)
	* Blinky
	* Overclocking to 128MHz
	* SSD1289 320x240px TFT Display
	* USART1 + printf + floating point numbers

