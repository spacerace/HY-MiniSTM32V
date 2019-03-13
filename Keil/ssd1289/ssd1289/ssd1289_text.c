/* 
 * (c) 2017 Nils Stec <stecdose@gmail.com>
 * 
 * Fonts are taken from linux's source code.
 * simple text console written by Nils Stec.
 * 
 * TODO:
 * 	- font spacing
 * 
 * 
 */

#include <stdio.h>

#include "ssd1289.h"

#include "fonts/linux_acorn_8x8.h"
#include "fonts/linux_8x16.h"
#include "fonts/linux_8x8.h"
#include "fonts/linux_pearl_8x8.h"

static struct simple_textcon {
	int char_transparent_bg;
	uint16_t char_fg;
	uint16_t char_bg;
	uint16_t font_size_x;
	uint16_t font_size_y;
	int char_spacing_x;
	int char_spacing_y;
	uint8_t *font_data;
	int cursor_x;
	int cursor_y;
	uint16_t putc_delay;
} con;


/* this is os dependant code. replace delay function with proper
 * delay function for your platform. If you use FreeRTOS dont change it.
 */
void ssd1289_set_putc_delay(uint16_t ms) {
	con.putc_delay = ms;
	return;
}

void ssd1289_set_font_spacing(uint16_t x, uint16_t y) {
	con.char_spacing_x = x;
	con.char_spacing_y = y;
	return;
}

void ssd1289_set_text_fg_color(uint16_t color) {
	con.char_fg = color;
	return;
}
void ssd1289_set_text_bg_color(uint16_t color) {
	con.char_bg = color;
	return;
}
uint16_t ssd1289_get_text_fg_color() {
	return con.char_fg;
}
uint16_t ssd1289_get_text_bg_color() {
	return con.char_bg;
}
void ssd1289_set_transparency(int trans) {
	if((trans == TRUE) || (trans == FALSE)) {
		con.char_transparent_bg = trans;
	}
	return;
}


void ssd1289_textcon_init() {
	con.char_transparent_bg = FALSE;
	con.char_fg = 0xffff;
	con.char_bg = 0x0000;
	
	ssd1289_set_font(FONT_LINUX_8x16);
	
	con.cursor_x = 0;
	con.cursor_y = 0;
	
	con.putc_delay = 0;
	return;
}

void ssd1289_set_font(int font) {
	switch(font) {
		case FONT_LINUX_ACORN_8x8:
			con.font_data = (uint8_t *)&fontdata_acorn_8x8;
			con.font_size_x = 8;
			con.font_size_y = 8;			
			con.char_spacing_x = 0;
			con.char_spacing_y = 1;
			break;			
		case FONT_LINUX_8x16:
			con.font_data = (uint8_t *)&fontdata_8x16;
			con.font_size_x = 8;
			con.font_size_y = 16;			
			con.char_spacing_x = 1;
			con.char_spacing_y = 1;
			break;	
		case FONT_LINUX_8x8:
			con.font_data = (uint8_t *)&fontdata_linux_8x8;
			con.font_size_x = 8;
			con.font_size_y = 8;			
			con.char_spacing_x = 0;
			con.char_spacing_y = 1;
			break;	
		case FONT_LINUX_PEARL_8x8:
			con.font_data = (uint8_t *)&fontdata_pearl_8x8;
			con.font_size_x = 8;
			con.font_size_y = 8;			
			con.char_spacing_x = 0;
			con.char_spacing_y = 1;
			break;
	}
	return;
}

void ssd1289_set_font_color(int fg, int bg) {
	con.char_fg = fg;
	con.char_bg = bg;	
	return;
}

void ssd1289_get_font_color(int *fg, int *bg) {
	*fg = con.char_fg;
	*bg = con.char_bg;
	return;
}

void ssd1289_set_text_cursor(int x, int y) {
	con.cursor_x = x;
	con.cursor_y = y;
	return;
}

void ssd1289_get_text_cursor(int *x, int *y) {
	*x = con.cursor_x;
	*y = con.cursor_y;
	return;
}

void ssd1289_inc_cursor() {
	con.cursor_x++;
	return;
}

void ssd1289_inc_cursor_y() {
	con.cursor_y++;
	con.cursor_x = 0;
	return;		

}

void ssd1289_put_char_at(int x_off, int y_off, uint8_t c) {
	int x, y;
	int offset_in_charset;
	int transparent = con.char_transparent_bg;
	uint8_t line_data;
	uint16_t fg = con.char_fg;
	uint16_t bg = con.char_bg;
	uint16_t size_x = con.font_size_x;
	uint16_t size_y = con.font_size_y;
	

	
	offset_in_charset =  c * con.font_size_y;
	
	
	for(y = 0; y < size_y; y++) {
		line_data = con.font_data[offset_in_charset+y];
		for(x = 0; x < size_x; x++) {
			if((line_data>>x) & 0x01) {
				ssd1289_setpx(x_off+size_x-x, y_off+y, fg);
			} else {
				if(transparent == FALSE) {
					ssd1289_setpx(x_off+size_x-x, y_off+y, bg);
				}
			}
		}
		
	}
	
	return;
}

void ssd1289_puts_at(int x_off, int y_off, char *str) {
	int charcount = 0;
	
	while(*str != '\0') {
		ssd1289_put_char_at(x_off+(charcount*con.font_size_x), y_off, *str);
		str++;
		charcount++;
	}
	return;	
}

void ssd1289_puts(char *str) {
	while(*str != '\0') {
		ssd1289_putc(*str);
		str++;
	}
	return;
}

void ssd1289_putc(char c) {
	int cursor_x = con.cursor_x;
	int cursor_y = con.cursor_y;
	int font_size_x = con.font_size_x;
	int font_size_y = con.font_size_y;
	int spacing_x = con.char_spacing_x;
	int spacing_y = con.char_spacing_y;
	int y_off;
	int x_off = (cursor_x * font_size_x)+(cursor_x * spacing_x);
	
	if(c == '\n') {
			con.cursor_y++;
			con.cursor_x = 0;
			return;
	}
	if(c == '\r') {
			con.cursor_x = 0;
			return;
	}
	
	if(x_off >= (241-font_size_x)) {
		x_off = 0;
		con.cursor_x = 0;
		con.cursor_y++;				// increment global cursor
		cursor_y = con.cursor_y;	// copy global to local cursor
	}
	
	
	y_off = (cursor_y * font_size_y)+(cursor_y * spacing_y);
	
	ssd1289_put_char_at(x_off, y_off, c);	
	
	con.cursor_x++;
	
	/* TODO implement delay */
//	vTaskDelay(con.putc_delay);

}
