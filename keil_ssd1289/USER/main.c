/* see Doc/
 *
 *
 */

#include "stm32f10x.h"
#include "ssd1289.h"
#include "leds.h"
#include "buttons.h"
#include "random.h"
#include "ssd1289_dotmatrix.h"
#include "ssd1289_7seg.h"

int segment_test(void);

int main(void){
	int i;
	int color;
	
	init_leds();

	ssd1289_init();
	ssd1289_fill(RGB_COL_BLACK);
	ssd1289_textcon_init();
	ssd1289_set_font_color(RGB_COL_YELLOW, RGB_COL_BLACK);
	ssd1289_set_font(FONT_LINUX_8x16);//
	//ssd1289_puts("Hello <<SSD1289>>");	
	
	color = LCD_COLOR(0, 0, 255);
	for(i = 0; i < 5; i++) {
		ssd1289_dotmatrix_digit(i*42, 10, 13, LCD_COLOR(0x1a, 0x2a, 0x3a));
		ssd1289_dotmatrix_digit(i*42, 10, i, color<<=3);
	}
	
	segment_test();
	
	LED1_ON();
	LED2_ON();

	for(;;) {
		
	}

}

int segment_test(void) {
	int x, y, i;
	y = 80;
	i = 0x08;
	for(x = 10; x < 215; x+=27) {
		draw_7segment(x, y, 0xff, LCD_COLOR(0x10, 0, 0));
		segment_putn(x, y, i, LCD_COLOR(0xff, 0, 0));
		i++;
	}
	
	return 0;
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
