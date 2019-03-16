#include "timer2.h"

volatile uint32_t timer2_ticks = 0;

void tim2_isr(void) {
    TIM_SR(TIM2) &= ~TIM_SR_UIF; /* Clear interrrupt flag. */
    timer2_ticks++;
}

uint32_t timer2_get_ticks(void) {
    return timer2_ticks;
}

uint32_t timer2_get_uptime(void) {
    return (timer2_ticks/100000);
}

    /* f=10kHz : 
    *   PSC=1
    *   72MHz/2/10kHz = 3600 - 1 = 3599
    * f=100kHz = 359
    */
int init_timer2(void) { 
    nvic_enable_irq(NVIC_TIM2_IRQ);
	nvic_set_priority(NVIC_TIM2_IRQ, 1);
 
    rcc_periph_clock_enable(RCC_TIM2);

    /* Set timer start value. */
	TIM_CNT(TIM2) = 1;

	/* Set timer prescaler. 72MHz/2 => 36000 counts per second. */
	TIM_PSC(TIM2) = 1;

	/* if reached irq is generated. */
	TIM_ARR(TIM2) = 359;

	/* interrupt enable. */
	TIM_DIER(TIM2) |= TIM_DIER_UIE;

	/* start timer */
	TIM_CR1(TIM2) |= TIM_CR1_CEN;
    
    
    return 0;
}

