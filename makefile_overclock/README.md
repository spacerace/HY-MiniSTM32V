(c) 2018 NS <stecdose@gmail.com>

This is an example project using makefiles for the HY-MiniSTM32V 
(using STM32F103VC T6).

It shows how to overclock your chip.

I've updated ```"CMSIS/system_stm32f10x.c"``` with a new option, ```"SYSCLK_FREQ_128MHz"```.
Now you can choose a system-speed of 128MHz. Flash is configured to use 2WS.
On my board code is still being executed with a WaitState setting of 1, but
this could be change with a small change of temperature or wind on the moon,
so we leave it at 2WS.

The variable ```SystemCoreClock``` is set correctly, so everything should work
out of the box (like SysTick setup, timers, ...)


Project/Debugger configured for SWD via STLINK/V2 (cheap chinese clones work!).
