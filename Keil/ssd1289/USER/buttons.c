/* not thread safe, but may work for simple user input...
 */

#include "buttons.h"
#include "leds.h"
#include "stm32f10x.h"
#include "stm32f10x_exti.h"

static int btna_state;
static int btna_lock;

/* button A is connected to interrupt line EXTI13 */
int btna_hit(void) {
		int temp = btna_state;
		btna_state = 0;
		return temp;
}

void btna_enable(void) {
	btna_lock = 0;
}

void btna_disable(void) {
	btna_lock = 1;
}

void btna_clr_status(void) {
	btna_state = 0;
}

void btna_set_state(void) {
	btna_state = 1;
}

void btna_wait(void) {
	btna_lock = 0;
	while(!btna_hit()) {
	//	asm("nop");
	}
	btna_lock = 1;
	return;
}

/* as button B is not connected to an interrupt line, this functions
 * blocks. Maybe useful for GUI thread ("press button to continue...").
 */
int btnb_hit(void) {
	return 0;
}

void btnb_wait(void) {
	btnb_hit();
}

/* button A is connected to EXTI_Line13 */
void EXTI15_10_IRQHandler(void) {
	if(EXTI_GetITStatus(EXTI_Line13) != RESET) {
		EXTI_ClearITPendingBit(EXTI_Line13);
		if(!btna_lock) btna_state = 1;
	}

	return;
}

void init_buttons(void) {
	GPIO_InitTypeDef GPIO_InitStructure;
	NVIC_InitTypeDef NVIC_InitStructure;
	EXTI_InitTypeDef EXTI_InitStructure;

	RCC_APB2PeriphClockCmd(RCC_APB2Periph_GPIOB | RCC_APB2Periph_GPIOC | RCC_APB2Periph_GPIOE, ENABLE);
	
	// GPIO configuration
	// A=PC13, B=PB2, C=PE0
	GPIO_InitStructure.GPIO_Pin = GPIO_Pin_2;
	GPIO_InitStructure.GPIO_Speed = GPIO_Speed_50MHz;
	GPIO_InitStructure.GPIO_Mode = GPIO_Mode_IN_FLOATING;
	GPIO_Init(GPIOB, &GPIO_InitStructure);

	GPIO_InitStructure.GPIO_Pin = GPIO_Pin_13;
	GPIO_InitStructure.GPIO_Speed = GPIO_Speed_50MHz;
	GPIO_InitStructure.GPIO_Mode = GPIO_Mode_IN_FLOATING;
	GPIO_Init(GPIOC, &GPIO_InitStructure);
	
	GPIO_InitStructure.GPIO_Pin = GPIO_Pin_0;
	GPIO_InitStructure.GPIO_Speed = GPIO_Speed_50MHz;
	GPIO_InitStructure.GPIO_Mode = GPIO_Mode_IN_FLOATING;
	GPIO_Init(GPIOE, &GPIO_InitStructure);
		

	// interrupt configuration
	NVIC_PriorityGroupConfig(NVIC_PriorityGroup_1);

	NVIC_InitStructure.NVIC_IRQChannel = EXTI15_10_IRQn;
	NVIC_InitStructure.NVIC_IRQChannelPreemptionPriority = 1;
	NVIC_InitStructure.NVIC_IRQChannelSubPriority = 1;
	NVIC_InitStructure.NVIC_IRQChannelCmd = ENABLE;
	NVIC_Init(&NVIC_InitStructure);

	RCC_APB2PeriphClockCmd(RCC_APB2Periph_AFIO, ENABLE);

	GPIO_EXTILineConfig(GPIO_PortSourceGPIOC, GPIO_PinSource13);

	EXTI_ClearITPendingBit(EXTI_Line13);

	EXTI_InitStructure.EXTI_Mode = EXTI_Mode_Interrupt;
	EXTI_InitStructure.EXTI_Trigger = EXTI_Trigger_Falling;
	EXTI_InitStructure.EXTI_Line = EXTI_Line13;
	EXTI_InitStructure.EXTI_LineCmd = ENABLE;
	EXTI_Init(&EXTI_InitStructure);

	btna_state = 0;
	btna_lock = 1;

	return;
}

