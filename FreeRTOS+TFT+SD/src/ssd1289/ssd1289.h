#ifndef _SSD1289_H_
#define _SSD1289_H_

#include "stm32f10x.h"
#include <inttypes.h>
#include <stdint.h>

#ifndef TRUE
#define TRUE	1
#endif
#ifndef FALSE
#define FALSE	0
#endif

/* LCD geometry */
#define LCD_SIZE_X	240
#define LCD_SIZE_Y	320

/* orientation */
#define O_0     0
#define O_90    1
#define O_180   2
#define O_270   3

/* misc */
#define SSD1289_NOT_FOUND	-123
#define SSD1289_FOUND		0
#define LCD_REG  			(*((volatile unsigned short *) 0x60000000)) // RS = 0
#define LCD_RAM  			(*((volatile unsigned short *) 0x60020000)) // RS = 1
#define SSD1289_ID0			0x1289
#define SSD1289_ID1			0x8989

/* timing */
#define LCD_FSMC_ADDR_SETUP_TIME	9
#define LCD_FSMC_DATA_SETUP_TIME	7

/* datatypes */
typedef struct {
	const uint16_t *data;
	uint16_t width;
	uint16_t height;
} tImage;

/* PUBLIC FUNCTIONS */

// initialization functions
int ssd1289_init();

// misc functions
#define ssd1289_clear()		ssd1289_fill_screen(LCD_CLEAR_COLOR)	// clear() and fill() are the same as fill_screen()
#define ssd1289_fill(color)	ssd1289_fill_screen(color);
void ssd1289_fill_screen(uint16_t color);
void ssd1289_set_cursor(uint16_t x, uint16_t y);			        // set pixel cursor

// pixel functions
void ssd1289_setpx(uint16_t x, uint16_t y, uint16_t color);		    // draw a pixel
uint16_t ssd1289_getpx(uint16_t x, uint16_t y);				        // read a pixel

// backlight functions
void ssd1289_bl_init();			    // initialize backlight
void ssd1289_bl_set(int percent);	// set backlight value
int  ssd1289_bl_get();			    // get backlight value

// color conversion
/* TODO seems to be broken? */
uint16_t rgb888_to_rgb565(uint8_t r, uint8_t g, uint8_t b);		// takes R, G and B, returns color for display
#define LCD_COLOR   rgb888_to_rgb565
#define COLOR565    rgb888_to_rgb565

// graphic functions
void ssd1289_line(int x1, int y1, int x2, int y2, uint16_t color);	// bresenham line, slow, for H/V lines see lineh() and linev()
void ssd1289_lineh(int x, int y, int len, uint16_t color);		// line horizontal, faster than ssd1289_line()
void ssd1289_linev(int x, int y, int len, uint16_t color);		// line vertical, faster than ssd1289_line()
void ssd1289_rect(int x1, int y1, int x2, int y2, uint16_t color);	// rectangle, also called box
void ssd1289_fill_rect(int x1, int y1, int x2, int y2, uint16_t color);	// rectangle filled, also called box_filled
void ssd1289_invert_area(int x1, int y1, int x2, int y2);		// read the pixels of an area and draw them inverted
void ssd1289_invert_screen();						// invert the whole screen
void ssd1289_circle(int x, int y, int radius, uint16_t color);		// draw a circle
void ssd1289_fill_circle(int x, int y, int radius, uint16_t color);
void ssd1289_ellipse(unsigned char x, unsigned char y, unsigned char rx, unsigned char ry, uint16_t color);

// text functions
void ssd1289_textcon_init();		// always call this first, it sets up your console
void ssd1289_set_font(int font);	// call this to change font
void ssd1289_set_font_spacing(uint16_t x, uint16_t y);		// set space between chars
void ssd1289_put_char_at(int x_off, int y_off, uint8_t c);	// print a single char at an exact position
void ssd1289_puts_at(int x_off, int y_off, char *str);		// print a string at an exact position
void ssd1289_putc(char c);						        // print a single char at text cursor position
void ssd1289_puts(char *str);						    // print a string at text cursor position
void ssd1289_set_font_color(int fg, int bg);			// set font color, foreground and background
void ssd1289_get_font_color(int *fg, int *bg);			// get font color, fg and bg
void ssd1289_set_text_fg_color(uint16_t color);			// set foreground color
void ssd1289_set_text_bg_color(uint16_t color);			// set background color
uint16_t ssd1289_get_text_fg_color();					// get foreground color
uint16_t ssd1289_get_text_bg_color();					// get background color
void ssd1289_set_transparency(int trans);				// enable/disable transparency, args can be TRUE or FALSE
void ssd1289_set_text_cursor(int x, int y);				// set text cursor position
void ssd1289_get_text_cursor(int *x, int *y);			// get text cursor position
void ssd1289_inc_cursor();
void ssd1289_inc_cursor_y();
void ssd1289_set_putc_delay(uint16_t ms);
void ssd1289_ignore_control_chars(int cc);

// image functions
int ssd1289_print_image(const tImage *image, uint16_t x_off, uint16_t y_off);	// takes rgb565 image data

// touchscreen related stuff, ADS7843
//#define MINI_CALIB  // if this is set, no text in cal., a mini calibration routine will be used
// big calibration routine needs about 3.5k more than small one. 
// if you're using printf/sprintf anyway, there's not much difference.
#define MINI_CALIB_TEST // no message in test-paint if this is set
void init_ads7843();
int ads7843_calibration(void);
uint16_t ads7843_read_x();
uint16_t ads7843_read_y();
uint32_t ads7843_get_disp_x(uint16_t tx, uint16_t ty);
uint32_t ads7843_get_disp_y(uint16_t tx, uint16_t ty);
int ads7843_is_pressed(void);
void ads7843_set_caldata(int cal_data[3][2], int cal_points[3][2]);
int ads7843_calibration_test_paint();

/* color definitions */
#define RGB_COL_BLACK       0x0000
#define RGB_COL_BLUE        0x001F
#define RGB_COL_GREEN       0x07E0
#define RGB_COL_RED         0xF800
#define RGB_COL_DARK_RED    0x5000
#define RGB_COL_DARKER_RED  0x3000
#define RGB_COL_DARKEST_RED 0x0800
#define RGB_COL_WHITE       0xFFFF
#define RGB_COL_CYAN        0x07FF
#define RGB_COL_MAGENTA     0xF81F
#define RGB_COL_YELLOW  	0xFFE0
#define RGB_COL_GREY    	0xF7DE
#define RGB_COL_OLIVE       0x52A0
#define RGB_COL_ORANGE      0xFAA0
#define LCD_CLEAR_COLOR		RGB_COL_BLACK

#define DOS_COLOR_0     RGB_COL_BLACK
#define DOS_COLOR_1     LCD_COLOR(0,0,170)
#define DOS_COLOR_2     LCD_COLOR(0,170,0)
#define DOS_COLOR_3     LCD_COLOR(0,170,170)
#define DOS_COLOR_4     LCD_COLOR(170,0,0)
#define DOS_COLOR_5     LCD_COLOR(170,0,170)
#define DOS_COLOR_6     LCD_COLOR(170,85,0)
#define DOS_COLOR_7     LCD_COLOR(170,170,170)
#define DOS_COLOR_8     LCD_COLOR(85,85,85)
#define DOS_COLOR_9     LCD_COLOR(85,85,255)
#define DOS_COLOR_10    LCD_COLOR(85,255,85)
#define DOS_COLOR_11    LCD_COLOR(85,255,255)
#define DOS_COLOR_12    LCD_COLOR(255,85,85)
#define DOS_COLOR_13    LCD_COLOR(255,85,255)
#define DOS_COLOR_14    LCD_COLOR(255,255,85)
#define DOS_COLOR_15    LCD_COLOR(255,255,255)

/* fonts */
#define FONT_LINUX_ACORN_8x8	2
#define FONT_LINUX_8x16			3
#define FONT_LINUX_8x8			4
#define FONT_LINUX_PEARL_8x8	5
#define FONT_XGA_8x14           6
#define FONT_XGA_8x16           7

#endif
