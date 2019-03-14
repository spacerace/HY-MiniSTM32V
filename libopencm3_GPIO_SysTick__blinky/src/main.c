/* HY-MiniSTM32V libopencm3 example
 * 
 * This code sets up SysTick and blinks a LED
 * 
 * Licenseing: This is public domain code.
 * (2019 Nils Stec)
 * 
 */

#include <libopencm3/stm32/rcc.h>
#include <libopencm3/stm32/gpio.h>
#include <libopencm3/cm3/nvic.h>
#include <libopencm3/cm3/systick.h>

void init_systick(void);

/* this function gets periodically called.
 * here we simply toggle PB0 (onboard LED)
 */
void sys_tick_handler(void) {
    gpio_toggle(GPIOB, GPIO0);
}


int main(void) {
    /* set system clock */
    rcc_clock_setup_in_hse_8mhz_out_72mhz();
    
    /* enable GPIOB clock */
    rcc_periph_clock_enable(RCC_GPIOB);
    
    /* set PB0 to output */
    gpio_set_mode(GPIOB, GPIO_MODE_OUTPUT_2_MHZ, GPIO_CNF_OUTPUT_PUSHPULL, GPIO0);

    /* this function sets up SysTick interrupt */
    init_systick();
    
    while (1) {
        ;
    }

    return 0;
}


void init_systick(void) {
   /*
    * SysTick timer calculation:
    *   We have configured system clock to 72MHz in main. This sets AHB to
    *   clock to 72MHz.
    *   We use a prescaler of 8 for the systick interrupt.
    * 
    *    clocksource = AHB 72MHz / prescaler 8 = 9MHz
    *    1 timer tick = 111.1nS (1s/9MHz)
    * 
    *    we set a reload value of 900000. This gives a 100mS SysTick interrupt.
    *    111.1ns * 900000 = 0.1s = 100mS 
    */

    systick_set_clocksource(STK_CSR_CLKSOURCE_AHB_DIV8);
    systick_set_reload(900000);
    systick_counter_enable();
    nvic_set_priority(NVIC_SYSTICK_IRQ, 0);
    systick_interrupt_enable();
    
    return;
}
