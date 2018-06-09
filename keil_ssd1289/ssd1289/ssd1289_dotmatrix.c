#include "ssd1289_dotmatrix.h"

//static const uint8_t pixel_data[8] = { 0x18, 0x3c, 0x7e, 0xff, 0xff, 0x7e, 0x3c, 0x18 };
static const uint8_t pixel_data[8] = { 0x3c, 0x7e, 0xff, 0xff, 0xff, 0xff, 0x7e, 0x3c };
static const uint8_t charset_numbers[14][7] = {
        { 0x0e, 0x11, 0x11, 0x11, 0x11, 0x11, 0x0e },   // 0
        { 0x02, 0x06, 0x0A, 0x02, 0x02, 0x02, 0x02 },   // 1
        { 0x0e, 0x11, 0x11, 0x02, 0x04, 0x08, 0x1f },   // 2
        { 0x0e, 0x11, 0x01, 0x06, 0x01, 0x11, 0x0e },   // 3
        { 0x02, 0x06, 0x0a, 0x12, 0x1f, 0x02, 0x02 },   // 4
        { 0x1f, 0x10, 0x1e, 0x01, 0x01, 0x11, 0x0e },   // 5
        { 0x0e, 0x11, 0x10, 0x1e, 0x11, 0x11, 0x0e },   // 6
        { 0x1f, 0x01, 0x02, 0x04, 0x04, 0x04, 0x04 },   // 7
        { 0x0e, 0x11, 0x11, 0x0e, 0x11, 0x11, 0x0e },   // 8
        { 0x0e, 0x11, 0x11, 0x0f, 0x01, 0x11, 0x0e },   // 9
        { 0x00, 0x00, 0x04, 0x00, 0x04, 0x00, 0x00 },   // :
        { 0x00, 0x00, 0x0e, 0x01, 0x0f, 0x11, 0x0f },   // a
        { 0x00, 0x0a, 0x1f, 0x1f, 0x0e, 0x04, 0x00 },		// heart
				{ 0x1f, 0x1f, 0x1f, 0x1f, 0x1f, 0x1f, 0x1f },		// all pixels on
};



int ssd1289_dotmatrix_digit(int x, int y, int n, uint16_t color) {
			ssd1289_dotmatrix(x, y, charset_numbers[n], color);

			return 0;
}

int ssd1289_dotmatrix(int x, int y, const uint8_t *data, uint16_t color) {
			int line, bit;
			int spacing = 0;
	
			for(line = 0; line < 7; line++) {
						for(bit = 5; bit >= 0; bit--) {
								if(data[line] & (1<<(5-bit))) {
											ssd1289_dotmatrix_pixel(x+(bit*(8+spacing)), y+(line*(8+spacing)), color);
								}
						}
			}
			return 0;
}

int ssd1289_dotmatrix_pixel(int x, int y, uint16_t color) {
		int line, bit;
	
		for(line = 0; line < 8; line++) {
				for(bit = 0; bit < 8; bit++) {
						if(pixel_data[line] & (1<<bit)) {
								ssd1289_setpx(x+bit, y+line, color);
						}
				}
		}
		return 0;
}
