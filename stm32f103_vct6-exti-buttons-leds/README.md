## - EXTI, Buttons, LEDs for STM32F1xx / STM32F103_VCT6 / HY-MiniSTM32V -

This code is an example on how to use **buttons** and **leds** on GPIOs.
One button is connected to an **external interrupt**, the other is read
by **polling**.
It was written for the **HY-MiniSTM32V board** and tested on it.
This archive includes and uses the ST standard peripherials lib V3.5.0.

### Hardware connection:
USART1 is configured to use PA9 for TX, PA10 for RX. On the HY-MiniSTM32V 
these are connected to the PL2303 USB-UART-converter.

Led 1 is connected to PB0.
Led 2 is connected to PB1.

Button A is connected to PC13.
Button B is connected to PB2.

Button A is low active, uses a pullup resistor.
Button B is high active, uses a pulldown resistor.

The full schematic can be found in the root directory of this archive.

### CONFIGURATION:
Open *usart.c* and go to *usart1_init()*-function. There you will find the 
configuration options for communication.

Everything else is within *main.c*.

### CHANGELOG:
	2015-09-07  created source archive for publishing, clean up
