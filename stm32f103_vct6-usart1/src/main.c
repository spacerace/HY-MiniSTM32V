#include <stdio.h>
#include <string.h>
#include <stdlib.h>

#include "stm32f10x.h"
#include "usart.h"

int main(void){
	SystemInit();
	usart1_init();

	uint8_t i = 0;

	for(;;) {
		printf("HY-MiniSTM32V STM32F103-VCT6 (0x%02x)\r\n", i);
		i++;

		// you don't want the big-bloat printf? then use this:	
		//usart1_puts("HY-MiniSTM32V STM32F103-VCT6\r\n");
	}

	return 0;
}
