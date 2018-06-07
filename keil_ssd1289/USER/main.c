/* see Doc/
 *
 *
 */

#include "stm32f10x.h"
#include "ssd1289.h"
#include "leds.h"
#include "buttons.h"
#include "random.h"

int main(void){
	init_leds();

	ssd1289_init();
	ssd1289_fill(RGB_COL_BLACK);
	ssd1289_textcon_init();
	ssd1289_set_font_color(RGB_COL_YELLOW, RGB_COL_BLACK);
	ssd1289_set_font(FONT_LINUX_8x8);
	ssd1289_puts("Hello <<SSD1289>>");	
	
	LED1_ON();
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
