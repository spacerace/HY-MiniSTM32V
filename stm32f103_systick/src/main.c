#include <stdio.h>
#include <string.h>
#include <stdlib.h>

#include "stm32f10x.h"

#define LED1_ON()	GPIO_SetBits(GPIOB , GPIO_Pin_0)
#define LED1_OFF()	GPIO_ResetBits(GPIOB , GPIO_Pin_0)
#define LED2_ON()	GPIO_SetBits(GPIOB , GPIO_Pin_1)
#define LED2_OFF()	GPIO_ResetBits(GPIOB , GPIO_Pin_1)

void init_leds();
void systick_delay(int ticks);

volatile uint32_t systick_counter;

int main(void){
	SystemInit();
	init_leds();

	systick_counter = 0;

	/* 1000 interrupts per second = 1khz */
	SysTick_Config(SystemCoreClock/1000);

	for(;;) {
		LED2_ON();
		systick_delay(1500);
		LED2_OFF();
		systick_delay(1500);
	}

	return 0;
}

/*
 * parameter says how many ticks to wait. With a 1khz interrupt
 * one tick equals 1mS.
 *
 */
void systick_delay(int ticks) {
	uint32_t ticks_start = systick_counter;

	while(systick_counter < (ticks_start + ticks));

	return;
}

void SysTick_Handler() {
	systick_counter++;

	static int led1 = 0;

	if((systick_counter % 100)==0) {	// every 100mS
		led1 = !led1;
		if(led1) LED1_ON();
		else	 LED1_OFF();
	}
}

void init_leds() {
	GPIO_InitTypeDef GPIO_InitStructure;

	RCC_APB2PeriphClockCmd( RCC_APB2Periph_GPIOB, ENABLE);

	// LED1=PB0, LED2=PB1
	GPIO_InitStructure.GPIO_Pin = GPIO_Pin_0 | GPIO_Pin_1;
	GPIO_InitStructure.GPIO_Speed = GPIO_Speed_50MHz;
	GPIO_InitStructure.GPIO_Mode = GPIO_Mode_Out_PP;
	GPIO_Init(GPIOB, &GPIO_InitStructure);

	return;
}


