#include <stdio.h>
#include <string.h>
#include <stdlib.h>

#include "stm32f10x.h"
#include "usart.h"
#include "i2c.h"

extern char* itoa (int value, char* buffer, int base);

int main(void){
	SystemInit();
	usart1_init();
	i2c_init();

	char buf[4];
	uint8_t data = 0xF0;
	
	write_pcf8574(0x4e, data);
	
	for(;;) {	
		data = read_pcf8574(0x4e);
		
		itoa(data, buf, 16);
		usart1_puts("pcf8574 value = 0x");
		usart1_puts(buf);
		usart1_puts("\r\n");
	}

	return 0;
}
