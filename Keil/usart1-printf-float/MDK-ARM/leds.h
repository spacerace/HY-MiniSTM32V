#ifndef __LEDS_H__
#define __LEDS_H__
#include "stm32f10x.h"
//#include "timer.h"
#include "usart.h"
#define LED1_ON()		GPIO_SetBits(GPIOB , GPIO_Pin_0)
#define LED1_OFF()	GPIO_ResetBits(GPIOB , GPIO_Pin_0)
#define LED2_ON()		GPIO_SetBits(GPIOB , GPIO_Pin_1)
#define LED2_OFF()	GPIO_ResetBits(GPIOB , GPIO_Pin_1)

void init_leds(void);


#endif // __LEDS_H__
