#include "stm32f10x.h"
#include "leds.h"

/* 
 * LED control functions are located in leds.h, they are just defines.
 */


/*	LED1	PB0
 *	LED2	PB1
 */
void init_leds(void) {
	GPIO_InitTypeDef GPIO_LED;

	RCC_APB2PeriphClockCmd(RCC_APB2Periph_GPIOB, ENABLE);

	GPIO_LED.GPIO_Pin = GPIO_Pin_0 | GPIO_Pin_1;
	GPIO_LED.GPIO_Speed = GPIO_Speed_50MHz;
	GPIO_LED.GPIO_Mode = GPIO_Mode_Out_PP;

	GPIO_Init(GPIOB, &GPIO_LED);

	return;
}

