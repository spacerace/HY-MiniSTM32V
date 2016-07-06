/* Description: LED driver for onboard LEDs
 *
 * Platform:    HY-MiniSTM32V dev-board 
 *              STM32F103VCT6
 *
 * Compiler:    gcc-arm
 *
 * Date:        2014/12
 *              2015/01
 * stecdose@gmail.com (nils stec)
 */

#ifndef __LEDS_H__
#define __LEDS_H__

extern void leds_on(int n);
extern void leds_off(int n);
extern void init_leds(void);
#endif // __LEDS_H__
