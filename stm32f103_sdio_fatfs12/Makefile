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
	-mthumb -lm

LDSCRIPT=ld/stm32_rom.ld
LDFLAGS	= --gc-sections,-T$(LDSCRIPT),-no-startup,-nostdlib,-lnosys
OCFLAGS	= -Obinary
ODFLAGS	= -S
OUTPUT_DIR = output
TARGET  = $(OUTPUT_DIR)/main

INCLUDE = -I./src/fw_lib/include \
	  -I./src/include \
	  -I./src/fw_lib/extra_added/ \
	  -I./src/mmc-sd/ \
	  -I./src/mmc-sd/fatfs12a/

SRCS = 	./src/system_stm32f10x.c \
	./src/stm32f10x_it.c \
	./src/newlib_stubs.c \
	./src/fw_lib/core_cm3.c \
	./src/fw_lib/stm32f10x_rcc.c \
	./src/fw_lib/stm32f10x_tim.c \
	./src/fw_lib/stm32f10x_gpio.c \
	./src/fw_lib/stm32f10x_usart.c \
	./src/fw_lib/stm32f10x_exti.c \
	./src/fw_lib/stm32f10x_sdio.c \
	./src/fw_lib/stm32f10x_dma.c \
	./src/fw_lib/extra_added/stm32f10x_systick.c \
	./src/fw_lib/misc.c \
	./src/mmc-sd/sdio_sd.c \
	./src/mmc-sd/fatfs12a/diskio.c \
	./src/mmc-sd/fatfs12a/ff.c \
	./src/printf.c \
	./src/main.c \
	./src/usart.c

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
	@$(CC) -mcpu=cortex-m3 -mthumb -Wl,$(LDFLAGS),-o$(TARGET).elf,-Map,$(TARGET).map ./src/startup.o $(OBJS)

%.o: %.c
	@echo "  CC $<"
	@$(CC) $(INCLUDE) $(CFLAGS)  $< -o $*.o

%.o: %.S
	@echo "  CC $<"
	@$(CC) $(INCLUDE) $(CFLAGS)  $< -o $*.o

st-flash:
	st-flash write output/main.bin 0x8000000
