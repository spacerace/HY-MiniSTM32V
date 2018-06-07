/* Description: LED driver for onboard LEDs
 *
 * Platform:    HY-MiniSTM32V dev-board 
 *              STM32F103VCT6
 *
 * Compiler:    gcc-arm
 *
 * Date:        2014/12
 *              2015/01
 *		        2015/04
 * 		        2017/01
 *
 * * (c) Nils Stec * *
 *
 */

#ifndef __LEDS_H__
#define __LEDS_H__

#define LED1_ON()	GPIO_SetBits(GPIOB , GPIO_Pin_0)
#define LED1_OFF()	GPIO_ResetBits(GPIOB , GPIO_Pin_0)
#define LED2_ON()	GPIO_SetBits(GPIOB , GPIO_Pin_1)
#define LED2_OFF()	GPIO_ResetBits(GPIOB , GPIO_Pin_1)

/*	LED1	PB0
 *	LED2	PB1
 */

extern void init_leds(void);


#endif
