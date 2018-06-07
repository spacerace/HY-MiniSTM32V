# SSD1289 Driver for STM32F1xx

This is a driver for SSD1289 displays for use with STM32F103 devices.

(c) 2018 NS <stecdose@gmail.com>

This is an example project for Keil for the HY-MiniSTM32V (using STM32F103VC T6).

It shows how to control onboard LEDs.

Project/Debugger configured for SWD via STLINK/V2 (cheap chinese clones work!).



# Screenshots

TBD

# Technical description:
The mcu communicates via FSMC with your display, mode is 16bit 8080-bus.
Display color format is RGB565. This means a 16bit color value is
encoded like this:
<B00-B04> RED
<B05-B10> GREEN
<B11-B15> BLUE

The display will be mapped into memory at a base of 0x60000000.
The RS (register select) line used by my hardware-setup is FSMC_A19,
this means we get an offset of 0x00020000.
All the bus-stuff is done by the chip's FSMC, so reading/writing
to 0x60000000 means access to the registers, r/w to 0x60020000
means access to the RAM. We don't have to deal with A19/RS by ourself.

# Provided graphics and text functions
This would be too long for a generic README file, so please refer
to src/include/ssd1289.h for now. I will write a function-documentation
page (hopefully) soon.
Everything should be self-explaining.
You should also see src/main.c for an example on how to use it.

I have implemented a small console, that does automatically wrap-around
to next line. Just set cursor to a position (ex. 0/0) and write strings
to output.
There is a printf-function for use with this driver. See printf.c for
more information.

All graphic and text functions can be used at any time after normal
initialization. For example, if you use the text console you can
also write a string over it to specific x/y-pointed position without
interfering with the text console. Also graphic functions can be used
like this. After this you can go on with text-output as nothing has
happened in between.

# 4 different fonts taken from linux kernel
I took 4 different fonts from Linux Kernel. They are really nice and
good to read on this display.

# Will fonts created by glcdFontCreator be supported?
This is a great tool, written by "Ape", to convert system fonts
to includeable headers.
These fonts have a different layout in memory. I used these before and
i will support them again. Sorry for not having this released by now.

# FreeRTOS, FatFS, MMC/SD-cards, ADS7841 touchscreen
This driver was written in a FreeRTOS environment/template. It can be
used standalone also. MMC/SD support works in the original template,
but I have not tried it up to now within this project.
Touchscreen code is not done now. Not usable.

# code-/data-size:
This library was never meant to be very fast or extremly small, but
it seems I am going this way...
The whole demo library+demo-program (incl. a small raw picture) takes
just ~35kB of code space.
RAM usage needs to be estimated, but i think it won't be more than 1k.

The driver itself = ~660bytes
The graphics part = ~720bytes
The text part is much bigger, because of the fonts.
With all 4 fonts included it takes ~10.750bytes

In demo code main.c includes a small image (Amiga Workbench Floppy).
This picture takes 18200bytes.
The font sizes are:
Linux 8x8	2k
Linux 8x16	4k
Acorn 8x8	2k
Pearl 8x8	2k

I didn't try, but I estimate the smallest possible configuration to be:
- driver  660b
- gfx     720b
- 8x8fnt 2048b
---------------
         3428b - NOT EVEN 3.5k
         
# Speed issues
The connection type used by my display is 8080-bus. This isn't the 
slowest - but on an 72MHz STM32 you can see the whole screen updating.
I assume there are a few spots in code to improve speed, but there
can't be done much.
It is fast enough when only changing a few parts of the screen (ex.:
you won't see flickering while updating a small clock-string), but
a fill_screen takes a lot. Maybe 1/5th of a second.

# Hardware connections:
controller: STM32F103VCT6, lcd: HY32D
(you'll find a circuit diagram in the source tree)

LCD Pin		STM32F10x AF 	STM32F103VCT6 Pin
-------------------------------------------------------
LCD_BLight	TIM3_CH3		PB0

LCD_RD		FSMC_NOE		PD4
LCD_WR		FSMC_NWE		PD5
LCD_CS		FSMC_NE1		PD7
LCD_RS		FSMC_A19		PE3

LCD_DB0		FSMC_D0			PD14
LCD_DB1		FSMC_D1			PD15
LCD_DB2		FSMC_D2			PD0
LCD_DB3		FSMC_D3			PD1
LCD_DB4		FSMC_D4			PE7
LCD_DB5		FSMC_D5			PE8
LCD_DB6		FSMC_D6			PE9
LCD_DB7		FSMC_D7			PE10
LCD_DB10	FSMC_D8			PE11
LCD_DB11	FSMC_D9			PE12
LCD_DB12	FSMC_D10		PE13
LCD_DB13	FSMC_D11		PE14
LCD_DB14	FSMC_D12		PE15
LCD_DB15	FSMC_D13		PD8
LCD_DB16 	FSMC_D14		PD9
LCD_DB17	FSMC_D15		PD10

# Authors
(c) 2015, 2017, 2018 Nils Stec <stecdose@gmail.com>
(c) 2010 poweravr from powermcu.com has written: 
bresenham line drawing function,
parts of initialization routine

# Changelog
2015 august	created first version of this driver
2015 august	added pwm backlight control
2015 august	added graphic functions
2015 august	added text functions + linux 8x16-font
2017 jan	first comments appeared...
2017 feb	worked on text functions
2017 march	replaced scrappy text functions
2017 march	1st planned release
2018 march  finally getting a release done...


# TODO TODO TODO 
- comment cryptic init routine, makes easier to adapt to other displays
  this job is almost done, but you still need the datasheet for SSD1289
  to understand what's going on.
- circle, pie, ...
- helper function to support animations
- add support for image formats: PNG, JPG, GIF for animations
- examples + photos + videos
- font converter
- image converter
- ads7843 touchscreen code is not working


