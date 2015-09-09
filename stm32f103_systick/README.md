## - EXTI, Buttons, LEDs for STM32F1xx / STM32F103_VCT6 / HY-MiniSTM32V -

This code is an example on how to use **SysTick Interrupt** for a 1kHz
interrupt. The Interrupt Service Routine one LED blink, the other LED is
controlled by main() with use of systick_delay() function.

It also implements a delay function, see *main.c* for details.

It was written for the **HY-MiniSTM32V board** and tested on it.
This archive includes and uses the ST standard peripherials lib V3.5.0.

### Hardware connection:
Led 1 is connected to PB0.
Led 2 is connected to PB1.

The full schematic can be found in the root directory of this archive.

### CHANGELOG:
	2015-09-09  created source archive for publishing, clean up
