#ifndef __SSD1289_DOTMATRIX_H__
#define __SSD1289_DOTMATRIX_H__

#include "ssd1289.h"

int ssd1289_dotmatrix_pixel(int x, int y, uint16_t color);
int ssd1289_dotmatrix(int x, int y, const uint8_t *data, uint16_t color);
int ssd1289_dotmatrix_digit(int x, int y, int n, uint16_t color);

#endif // __SSD1289_DOTMATRIX_H__
