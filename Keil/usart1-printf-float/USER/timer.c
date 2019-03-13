#include "timer.h"
#include "stm32f10x_tim.h"
static uint32_t ticks;

void TIM2_IRQHandler(void) {  
  if(TIM_GetITStatus(TIM2, TIM_IT_Update) != RESET) {
		ticks++;
    TIM_ClearITPendingBit(TIM2, TIM_IT_Update);
		if((ticks % 1000) == 0) {
			GPIOB->ODR ^= GPIO_Pin_1;
		} 
  }
}

void setup_tim2irq(void) {
	TIM_TimeBaseInitTypeDef TIM_TimeBase_InitStructure;
	NVIC_InitTypeDef NVIC_InitStructure;
	
	uint16_t psc;
	
	ticks = 0;
	
	RCC_APB1PeriphClockCmd(RCC_APB1Periph_TIM2, ENABLE);	// 36mhz? 
	
	psc = (uint16_t) 64000 - 1;					// with 72MHz sysclk: 36000-1
																			//     128MHz sysclk: 64000-1
	
	TIM_TimeBase_InitStructure.TIM_Prescaler = psc;
	TIM_TimeBase_InitStructure.TIM_ClockDivision = TIM_CKD_DIV1;	// nach psc = 1khz
	TIM_TimeBase_InitStructure.TIM_CounterMode = TIM_CounterMode_Up;
	TIM_TimeBase_InitStructure.TIM_Period = 1;	/// 1000 = 1hz,	20=50hz
	TIM_TimeBaseInit(TIM2, &TIM_TimeBase_InitStructure);
	TIM_PrescalerConfig(TIM2, psc, TIM_PSCReloadMode_Immediate);
	
	NVIC_InitStructure.NVIC_IRQChannel = TIM2_IRQn;
	NVIC_InitStructure.NVIC_IRQChannelPreemptionPriority = 1;
	NVIC_Init(&NVIC_InitStructure);
	
	TIM_ITConfig(TIM2, TIM_IT_Update, ENABLE);
	TIM_ClearFlag(TIM2, TIM_FLAG_Update);
	
  // Enable and set TIM2 Interrupt to the lowest priority
  // Enable the TIM1 global Interrupt
  NVIC_InitStructure.NVIC_IRQChannel = TIM2_IRQn;
  NVIC_InitStructure.NVIC_IRQChannelPreemptionPriority = 0x00;
  NVIC_InitStructure.NVIC_IRQChannelSubPriority = 0x01;
  NVIC_InitStructure.NVIC_IRQChannelCmd = ENABLE;
  NVIC_Init(&NVIC_InitStructure);

  TIM_Cmd(TIM2, ENABLE);
  TIM_ClearITPendingBit(TIM2,TIM_IT_Update);	
	
}
