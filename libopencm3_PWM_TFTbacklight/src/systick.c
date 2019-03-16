#include <libopencm3/stm32/rcc.h>
#include <libopencm3/stm32/gpio.h>
#include <libopencm3/cm3/nvic.h>
#include <libopencm3/cm3/systick.h>

#include "systick.h"

static volatile uint32_t _ticks_ms = 0;

int _systick_delay(unsigned int ms) {
    uint32_t end = _ticks_ms + ms;
    while(_ticks_ms < end) {
        __asm__("nop");
    }
    
    return 0;
}

void sys_tick_handler(void) {
    _ticks_ms++;
    
    if((_ticks_ms % 333) == 0)
        gpio_toggle(GPIOB, GPIO0);
    
}


void init_systick(void) {
    rcc_periph_clock_enable(RCC_GPIOB);
    gpio_set_mode(GPIOB, GPIO_MODE_OUTPUT_2_MHZ, GPIO_CNF_OUTPUT_PUSHPULL, GPIO0);
    gpio_clear(GPIOB, GPIO0);
    
   /*
    * SysTick timer calculation:
    *   We have configured system clock to 72MHz in main. This sets AHB to
    *   clock to 72MHz.
    *   We use a prescaler of 8 for the systick interrupt.
    * 
    *    clocksource = AHB 72MHz / prescaler 8 = 9MHz
    *    => 9000000 ticks per seconds
    * 
    *    we set a reload value of 9000. This gives a 1mS SysTick interrupt.
    *    1s / 10 = 100mS
    *    => 9000000 / 10 = 9000 ticks for 1mS 
    */

    systick_set_clocksource(STK_CSR_CLKSOURCE_AHB_DIV8);
    systick_set_reload(9000);
    systick_counter_enable();
    nvic_set_priority(NVIC_SYSTICK_IRQ, 0);
    systick_interrupt_enable();
 
    _ticks_ms = 0;
    
    return;
}
