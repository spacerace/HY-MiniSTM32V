CROSS_COMPILE=arm-none-eabi-
CC=$(CROSS_COMPILE)gcc
LD=$(CROSS_COMPILE)ld
AR=$(CROSS_COMPILE)ar
AS=$(CROSS_COMPILE)as
OC=$(CROSS_COMPILE)objcopy
OD=$(CROSS_COMPILE)objdump
SZ=$(CROSS_COMPILE)size

CFLAGS= -c -fno-common \
	-ffunction-sections \
	-fdata-sections \
	-Os \
	-mcpu=cortex-m3 -Wall \
	-mthumb

LDSCRIPT=stm32_rom.ld
LDFLAGS	=--gc-sections,-T$(LDSCRIPT),-no-startup,-nostdlib,-lnosys
OCFLAGS	=-Obinary
ODFLAGS	=-S
OUTPUT_DIR = output
TARGET  = $(OUTPUT_DIR)/main

INCLUDE = -I./src/fw_lib/include -I./src/fw_lib/extra_added/ \
	  -I./src/ssd1289 -I./src/fonts/ \
	  -I./src/freertos/include/ \
	  -I./src/mmc \
	  -I./src/fatfs/ \
	  -I./src/

SRCS = 	./src/fw_lib/system_stm32f10x.c \
	./src/stm32f10x_it.c \
	./src/fw_lib/core_cm3.c \
	./src/fw_lib/stm32f10x_rcc.c \
	./src/fw_lib/stm32f10x_spi.c \
	./src/fw_lib/stm32f10x_fsmc.c \
	./src/fw_lib/stm32f10x_adc.c \
	./src/fw_lib/stm32f10x_tim.c \
	./src/fw_lib/stm32f10x_exti.c \
	./src/fw_lib/stm32f10x_sdio.c \
	./src/fw_lib/stm32f10x_dma.c \
	./src/fw_lib/stm32f10x_gpio.c \
	./src/fw_lib/stm32f10x_usart.c \
	./src/fw_lib/extra_added/stm32f10x_systick.c \
	./src/fw_lib/misc.c \
	./src/newlib_syscalls.c \
	./src/freertos/croutine.c \
	./src/freertos/event_groups.c \
	./src/freertos/heap_4.c \
	./src/freertos/list.c \
	./src/freertos/port.c \
	./src/freertos/queue.c \
	./src/freertos/tasks.c \
	./src/freertos/timers.c \
	./src/ssd1289/ssd1289.c \
	./src/ssd1289/ssd1289_graphic.c \
	./src/ssd1289/ssd1289_text.c \
	./src/usart.c \
	./src/timer2.c \
	./src/leds.c \
	./src/mmc/sdio_sd.c \
	./src/mmc/diskio.c \
	./src/fatfs/ff_lib.c \
	./src/fatfs/ff.c \
	./src/main.c
	
	

OBJS=$(SRCS:.c=.o)

.PHONY : clean all

all: $(TARGET).bin  $(TARGET).list
	$(SZ) $(TARGET).elf

clean:
	-find . -name '*.o'   -exec rm {} \;
	-find . -name '*.elf' -exec rm {} \;
	-find . -name '*.lst' -exec rm {} \;
	-find . -name '*.out' -exec rm {} \;
	-find . -name '*.bin' -exec rm {} \;
	-find . -name '*.map' -exec rm {} \;

$(TARGET).list: $(TARGET).elf
	$(OD) $(ODFLAGS) $< > $(TARGET).lst

$(TARGET).bin: $(TARGET).elf
	$(OC) $(OCFLAGS) $(TARGET).elf $(TARGET).bin

$(TARGET).elf: $(OBJS) ./src/startup.o
	@$(CC) -mcpu=cortex-m3 -mthumb -specs=nano.specs -lm -lc -lnosys -Wl,$(LDFLAGS),-o$(TARGET).elf,-Map,$(TARGET).map ./src/startup.o $(OBJS)

%.o: %.c
	@echo "  CC $<"
	@$(CC) $(INCLUDE) $(CFLAGS)  $< -o $*.o

%.o: %.S
	@echo "  CC $<"
	@$(CC) $(INCLUDE) $(CFLAGS)  $< -o $*.o

flash:
	st-flash write $(TARGET).bin 0x8000000
sizes:
	arm-none-eabi-size `find . -name "*.o"`
