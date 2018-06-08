/* see Doc/readme.txt
 *
 *
 */

#include "stm32f10x.h"
#include "timer.h"
#include "usart.h"

#define LED1_ON()		GPIO_SetBits(GPIOB , GPIO_Pin_0)
#define LED1_OFF()	GPIO_ResetBits(GPIOB , GPIO_Pin_0)
#define LED2_ON()		GPIO_SetBits(GPIOB , GPIO_Pin_1)
#define LED2_OFF()	GPIO_ResetBits(GPIOB , GPIO_Pin_1)

void init_leds(void);
void init_mco(void);

int main(void){
	init_leds();
	setup_tim2irq();
	init_mco();
	usart1_init();
	
	usart1_puts("If you can read this, everything is configured right.\r\n");
	usart1_puts("STM32F103 overclocked to 128MHz.\r\n");
	for(;;) {
	
	}
}

void init_mco(void) {
	GPIO_InitTypeDef GPIO_InitStructure;

	RCC_APB2PeriphClockCmd(RCC_APB2Periph_GPIOA, ENABLE);

	GPIO_InitStructure.GPIO_Pin = GPIO_Pin_8;
	GPIO_InitStructure.GPIO_Mode = GPIO_Mode_AF_PP;
	GPIO_InitStructure.GPIO_Speed = GPIO_Speed_50MHz;

	GPIO_Init(GPIOA, &GPIO_InitStructure);


	RCC_MCOConfig(RCC_MCO_HSE);

	
	return;
}


void init_leds(void) {
	GPIO_InitTypeDef GPIO_InitStructure;

	RCC_APB2PeriphClockCmd( RCC_APB2Periph_GPIOB, ENABLE);

	// LED1=PB0, LED2=PB1
	GPIO_InitStructure.GPIO_Pin = GPIO_Pin_0 | GPIO_Pin_1;
	GPIO_InitStructure.GPIO_Speed = GPIO_Speed_50MHz;
	GPIO_InitStructure.GPIO_Mode = GPIO_Mode_Out_PP;
	GPIO_Init(GPIOB, &GPIO_InitStructure);

	return;
}



#ifdef  USE_FULL_ASSERT

/**
  * @brief  Reports the name of the source file and the source line number
  *   where the assert_param error has occurred.
  * @param  file: pointer to the source file name
  * @param  line: assert_param error line source number
  * @retval None
  */
void assert_failed(uint8_t* file, uint32_t line)
{ 
  /* User can add his own implementation to report the file name and line number,
     ex: printf("Wrong parameters value: file %s on line %d\r\n", file, line) */

  /* Infinite loop */
  while (1)
  {
  }
}
#endif

/*********************************************************************************************************
      END FILE
*********************************************************************************************************/
