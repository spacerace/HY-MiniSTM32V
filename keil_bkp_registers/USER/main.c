/* see Doc/readme.txt
 *
 *
 */

#include "stm32f10x.h"
#include "usart.h"
#include "leds.h"
#include "bkp.h"
#include <stdio.h>
#include <stdint.h>

int main(void){
	uint16_t dr1;
	uint16_t buf[42];
	int i;
	
	init_leds();
	usart1_init();
	bkp_init();
	
	LED1_ON();
	
	printf(" \r\n---- Keil MDK bkp register demo ----\r\n");
	printf("     STM32F103 @ %luMHz\r\n\r\n",(uint32_t)(SystemCoreClock/1000000));
	
	bkp_unlock();
	dr1 = BKP_ReadBackupRegister(BKP_DR1);
	bkp_lock();
	printf("BKP_DR1 = 0x%04x\r\n", dr1);
	
	if(dr1 != 0xA55A) {
		printf(" cold boot, DR1 is empty.\r\n");
		printf(" writing 0xA55A to DR1, filling DR2-DR42 with 0x5A5A.\r\n");
		printf(" press reset to see warm boot.\r\n");
		
		bkp_unlock();

		BKP_WriteBackupRegister(BKP_DR1, 0xA55A);	// write DR1 with magic

		buf[0] = BKP_ReadBackupRegister(BKP_DR1);	// get DR1 into buffer
		for(i = 1; i < 42; i++) {					// fill rest of buffer (DR2-DR42)
			buf[i] = 0x5A5A;
		}

		bkp_write_all(buf);						// write buffer to BKP registers

		bkp_lock();

	} else {
		printf(" warm boot, DR1 is not empty.\r\n");
	}
	
	
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
