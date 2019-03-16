/* HY-MiniSTM32V libopencm3 example
 * 
 * PWM on PB5 (TIM3_CH2 / backlight)
 *
 * Licenseing: This is public domain code.
 * (2019 Nils Stec)
 *
 */

#include <libopencm3/stm32/rcc.h>
#include <libopencm3/stm32/gpio.h>
#include <libopencm3/cm3/nvic.h>
#include <libopencm3/cm3/systick.h>
#include <libopencm3/stm32/timer.h>

#include "systick.h"

void init_pwm_backlight(void);

void set_backlight_pwm(uint16_t val) {
    // we can use library function or directly write to register
    // latter saves some space and time
    // timer_set_oc_value(TIM3, TIM_OC2, val);
    TIM_CCR2(TIM3) = val;
}

int main(void) {
    /* set system clock */
    rcc_clock_setup_in_hse_8mhz_out_72mhz();
    
    /* flash LED1, see systick.c */
    init_systick();

    init_pwm_backlight();

    /* directly set PWM register */
    TIM_CCR2(TIM3) = 0x3ff; // backlight full on

    int i;
    while (1) {
            for(i = 0; i < 100; i++) {
                    TIM_CCR2(TIM3) = i*10;
                   _systick_delay(10);
            }
            for(; i >= 0; i--) {
                    TIM_CCR2(TIM3) = i*10;
                    _systick_delay(10);
            }
    }

    return 0;
}


void init_pwm_backlight(void) {
	rcc_periph_clock_enable(RCC_GPIOB);
	rcc_periph_clock_enable(RCC_AFIO);
	rcc_periph_clock_enable(RCC_TIM3);

    // pin modes, alternate function
	gpio_set_mode(GPIOB, GPIO_MODE_OUTPUT_50_MHZ, GPIO_CNF_OUTPUT_ALTFN_PUSHPULL, GPIO5);   // backlight
    
    /* TIM3_CH2 is alternate function on PB5
     * see RM CD00171190, chapter 9.3.7 table 44 for remap TIM3_CH2 to PB5
     */
    AFIO_MAPR |= AFIO_MAPR_TIM3_REMAP_PARTIAL_REMAP;

	timer_reset(TIM3);

    // timer mode: no divider (72MHz), edge aligned, upcounting
	timer_set_mode(TIM3, TIM_CR1_CKD_CK_INT, TIM_CR1_CMS_EDGE, TIM_CR1_DIR_UP);
    
    // timer speed vor prescaler = 72MHz
    // nach prescaler = 1MHz
    timer_set_prescaler(TIM3, 71);
    
    // 1khz PWM
    timer_set_period(TIM3, 999);
    
    // channel 2, PWM mode 1 (output high if CNT > CCR1)
	timer_set_oc_mode(TIM3, TIM_OC2, TIM_OCM_PWM1);
    timer_enable_preload(TIM3);  
	timer_enable_oc_output(TIM3, TIM_OC2);
	timer_enable_oc_preload(TIM3, TIM_OC2);

    // turn backlight off
    timer_set_oc_value(TIM3, TIM_OC2, 0);
    
	timer_enable_counter(TIM3);

    return;
}



