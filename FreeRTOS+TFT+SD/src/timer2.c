#include "stm32f10x.h"
#include "timer2.h"
#include "ssd1289.h"

uint32_t timer2_uptime = 0;
volatile uint32_t timer2_ticks = 0;

void TIM2_IRQHandler(void){
 
    TIM_ClearITPendingBit(TIM2, TIM_IT_Update);
    
    timer2_ticks++;
    if((timer2_ticks % 100000)==0) {
        timer2_uptime++;
    }
}

uint32_t timer2_get_ticks(void) {
    return timer2_ticks;
}

uint32_t timer2_get_uptime(void) {
    return timer2_uptime;
}


int init_timer2(void) {
    TIM_TimeBaseInitTypeDef TIM_TimeBase_InitStructure;
    NVIC_InitTypeDef NVIC_InitStructure;
 
    RCC_APB1PeriphClockCmd(RCC_APB1Periph_TIM2, ENABLE);
   
    TIM_TimeBase_InitStructure.TIM_ClockDivision = TIM_CKD_DIV1;
    TIM_TimeBase_InitStructure.TIM_CounterMode = TIM_CounterMode_Up;
    /* 1999 = 500mS
    *  999 = 250mS
    */
  
    /* f=10kHz : 
    *   PSC=1
    *   72MHz/2/10kHz = 3600 - 1 = 3599
    * f=100kHz = 359
    */
    TIM_TimeBase_InitStructure.TIM_Period = 359;
    TIM_TimeBase_InitStructure.TIM_Prescaler = 1;
    TIM_TimeBaseInit(TIM2, &TIM_TimeBase_InitStructure);
 
    TIM_ITConfig(TIM2, TIM_IT_Update, ENABLE);
 
    NVIC_InitStructure.NVIC_IRQChannel = TIM2_IRQn;
    NVIC_InitStructure.NVIC_IRQChannelCmd = ENABLE;
    NVIC_InitStructure.NVIC_IRQChannelPreemptionPriority = 0x0F;
    NVIC_InitStructure.NVIC_IRQChannelSubPriority = 0x0F;
    NVIC_Init(&NVIC_InitStructure);
 
    TIM_Cmd(TIM2, ENABLE);
 
    return 0;
}

