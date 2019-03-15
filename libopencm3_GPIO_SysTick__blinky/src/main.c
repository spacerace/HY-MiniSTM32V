/* HY-MiniSTM32V libopencm3 example
 * 
 * This code sets up SysTick and blinks LED1 (PB0).
 * onboard buttons KEYA and KEYB are set up and
 * will be read continously. 
 * one button sets, the other clears LED2
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
    
    /* enable GPIOB and GPIOC clock */
    rcc_periph_clock_enable(RCC_GPIOB);
    rcc_periph_clock_enable(RCC_GPIOC);
    
    /* set LED lines to output (LED1=PB0, LED2=PB1) */
    gpio_set_mode(GPIOB, GPIO_MODE_OUTPUT_2_MHZ, GPIO_CNF_OUTPUT_PUSHPULL, GPIO0);
    gpio_set_mode(GPIOB, GPIO_MODE_OUTPUT_2_MHZ, GPIO_CNF_OUTPUT_PUSHPULL, GPIO1);
    
    /* turn off both LEDs */
    gpio_clear(GPIOB, GPIO0);
    gpio_clear(GPIOB, GPIO1);
    
    /* set BUTTON lines to input (KEYA=PC13, KEYB=PB2) 
     * KEYA = low active
     * KEYB = high active
     */
    gpio_set_mode(GPIOC, GPIO_MODE_INPUT, GPIO_CNF_INPUT_FLOAT, GPIO13);
    gpio_set_mode(GPIOB, GPIO_MODE_INPUT, GPIO_CNF_INPUT_FLOAT, GPIO2);
    
    /* this function sets up SysTick interrupt */
    init_systick();
    
    while (1) {
        if(gpio_get(GPIOB, GPIO2)) {    // this one is high active
            gpio_set(GPIOB, GPIO1);
        }
        
        if(!gpio_get(GPIOC, GPIO13)) {   // this one is low active
            gpio_clear(GPIOB, GPIO1);
        }
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
    *    => 9000000 ticks per seconds
    * 
    *    we set a reload value of 900000. This gives a 100mS SysTick interrupt.
    *    1s / 10 = 100mS
    *    => 9000000 / 10 = 900000 ticks for 100mS 
    */

    systick_set_clocksource(STK_CSR_CLKSOURCE_AHB_DIV8);
    systick_set_reload(900000);
    systick_counter_enable();
    nvic_set_priority(NVIC_SYSTICK_IRQ, 0);
    systick_interrupt_enable();
    
    return;
}
