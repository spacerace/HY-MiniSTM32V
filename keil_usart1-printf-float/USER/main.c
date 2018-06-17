/* see Doc/readme.txt
 *
 * output in terminal:
 
 * ---- Keil MDK printf demo ----
 *     STM32F103 @ 72MHz
 * float (4b) = 0.123457
 * double (8b) = 1.234567890123
 *
 */

#include "stm32f10x.h"
#include "usart.h"
#include "leds.h"
#include <stdio.h>

int main(void){
	float f;
	double d;
	
	init_leds();
	usart1_init();
	LED1_ON();
	
	printf(" \r\n---- Keil MDK printf demo ----\r\n");
	printf("     STM32F103 @ %luMHz\r\n\r\n",(uint32_t)(SystemCoreClock/1000000));
	
	f=0.123456789;
	d=1.234567890123;
	
	printf("float (%db) = %f\r\n", sizeof(f), f);
	printf("double (%db) = %.12f\r\n", sizeof(d), d);
	
	
	LED2_ON();
	
	for(;;) {
	
	}
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
