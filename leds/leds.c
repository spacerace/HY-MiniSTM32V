#include "stm32f10x_conf.h"

#include "leds.h"

void led_off(int n) {
	switch(n) {
		case 1:
			GPIO_ResetBits(GPIOB, GPIO_Pin_0);
			break;
		case 2:
			GPIO_ResetBits(GPIOB, GPIO_Pin_1);
			break;
	}
	return;
}

void led_on(int n) {
	switch(n) {
		case 1:
			GPIO_SetBits(GPIOB, GPIO_Pin_0);
			break;
		case 2:
			GPIO_SetBits(GPIOB, GPIO_Pin_1);
			break;
	}
	return;
}

void init_leds(void) {
	GPIO_InitTypeDef GPIO_InitStructure;
	   
//	SystemInit();
	     
//	RCC_APB2PeriphClockCmd(RCC_APB2Periph_GPIOC, ENABLE);
	       
//	GPIO_InitStructure.GPIO_Mode = GPIO_Mode_Out_PP;
//	GPIO_InitStructure.GPIO_Pin = GPIO_Pin_9;
//	GPIO_InitStructure.GPIO_Speed = GPIO_Speed_50MHz;
//	GPIO_Init(GPIOC, &GPIO_InitStructure);
	               
//	GPIO_WriteBit(GPIOC, GPIO_Pin_9, Bit_SET);
	RCC_APB2PeriphClockCmd(RCC_APB2Periph_GPIOB, ENABLE);

	GPIO_InitStructure.GPIO_Mode  = GPIO_Mode_Out_PP;
	GPIO_InitStructure.GPIO_Pin   = GPIO_Pin_0;
	GPIO_InitStructure.GPIO_Speed = GPIO_Speed_50MHz;
	GPIO_Init(GPIOB, &GPIO_InitStructure);

	GPIO_InitStructure.GPIO_Mode  = GPIO_Mode_Out_PP;
	GPIO_InitStructure.GPIO_Pin   = GPIO_Pin_1;
	GPIO_InitStructure.GPIO_Speed = GPIO_Speed_50MHz;
	GPIO_Init(GPIOB, &GPIO_InitStructure);
}
