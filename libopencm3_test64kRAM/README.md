# HY-MiniSTM32V 16k additional RAM?
Some STM32 devices have more RAM/Flash than advertised in datasheets. For example a lot of those bluepills ship with a 128k flash STM32F103C8T6, which is a 64k device.  
I tested the HY-MiniSTM32V's STM32F103VCT6 for more RAM and it has almost 16k more.  
Normal RAM goes up to 0x2000BFFF. This test program tests your chip for memory above this location.  
My two chips are working up to 0x2000FFFC. Whenever I try to read or write a location above this address, the chip freezes.  
  
This example uses USART1 to communicate with 115200,8n1 baud. USART1 is connected to an onboard PL2303 (right USB plug).  
libopencm3 provides some examples for the neccessary syscall (`_write()`) in their documentation, see `src/usart.c` comments
for details.  
# Requirements
You will need a suitable arm-gcc for building and texane's st-link utility for flashing.  
If you're using ARM's official gcc distribution everything will be fine.
  
libopencm3 is included in this archive.  

# Compiling
```
$ make
```
This will build libopencm3 and the demo-code. It will generate an ELF, a BIN and a HEX binary,
as well as listing and map files.

# libopencm3
There is a "static" copy of libopencm3 in `src/` unlike other examples and tutorials on the internet,
which use a git submodule to allow automatic updating of libopencm3.  
I prefer *not* to update a project's library once it is working, as it could break things.  
Once you're done and your device is running the working firmware you really should keep a exact copy
of your sourcecode.  
Updating is a good thing, but only if you know what you're doing and in this case, only if needed.  
  
I have removed a lot of stuff from libopencm3's source directory which targets other MCUs.

# Licensing
libopencm3 is GNU LGPL v3.  
Makefile and usart-/demo-code written by me is 'public domain'.  

