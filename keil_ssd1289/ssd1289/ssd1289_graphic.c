#include <math.h>

#include "ssd1289.h"

extern int ssd1289_display_size_x;
extern int ssd1289_display_size_y;

uint16_t rgb888_to_rgb565(uint8_t r, uint8_t g, uint8_t b) {
	uint16_t val;
	r = (r >> 3)&0x1f;
	g = (g >> 2)&0x2f;
	b = (b >> 3)&0x1f;
     
	val = (r << 11);
	val |= (g << 5);
	val |= b;
	
	return val;
}



/* image functions */
int ssd1289_print_image(const tImage *image, uint16_t x_off, uint16_t y_off) {
	int x, y;
	uint32_t datacnt;
	uint16_t data;

	datacnt = 0;
	for(y = 0; y < image->height; y++) {
		for(x = 0; x < image->width; x++) {
			data = image->data[datacnt];
			ssd1289_setpx(x+x_off, y+y_off, data);
			datacnt++;
		}
	}

	return 0;
}


void ssd1289_fill_screen(uint16_t color) {
	int i;
	ssd1289_set_cursor(0,0);
	for(i = 0; i < 76800; i++) LCD_RAM = color;
	return;
}

uint16_t ssd1289_getpx(uint16_t x, uint16_t y) {
	ssd1289_set_cursor(x, y);
	return LCD_RAM;
}

void ssd1289_setpx(uint16_t x, uint16_t y, uint16_t color) {
	//if((x >= ssd1289_display_size_x) || (y >= ssd1289_display_size_y)) return;
	ssd1289_set_cursor(x,y);
	LCD_RAM = color;
	return;
}

/* fucking slow */
void ssd1289_invert_screen() {
	ssd1289_invert_area(0, 0, ssd1289_display_size_x-1, ssd1289_display_size_y-1);
	return;
}

void ssd1289_invert_area(int x1, int y1, int x2, int y2) {
	uint16_t color;
	int x,y;
	
	for(y = y1; y < y2; y++) {
		for(x = x1; x < x2; x++) {
			color = ssd1289_getpx(x,y);
			color ^= 0xffff;
			ssd1289_setpx(x, y, color);
		}
	}	
	
	return;
}

void ssd1289_lineh(int x, int y, int len, uint16_t color) {
	int i;
	
	for(i = 0; i < len; i++) {
		ssd1289_setpx(x+i, y, color);
	}
	
	return;
}

void ssd1289_linev(int x, int y, int len, uint16_t color) {
	int i;
	
	for(i = 0; i < len; i++) {
		ssd1289_setpx(x, y+i, color);
	}
	
	return;
}

void ssd1289_rect(int x1, int y1, int x2, int y2, uint16_t color) {
	ssd1289_lineh(x1, y1, x2-x1, color);	// top line
	ssd1289_lineh(x1, y2, x2-x1+1, color);	// bottom line
	ssd1289_linev(x1, y1, y2-y1, color);	// left line
	ssd1289_linev(x2, y1, y2-y1, color);	// right line	
	return;
}

void ssd1289_fill_rect(int x1, int y1, int x2, int y2, uint16_t color) {
	int lines = y2-y1;
	
	while(lines >= 0) {
		ssd1289_lineh(x1, y2-lines, x2-x1, color);
		lines--;
	}
	
	return;	
}

void ssd1289_line(int x1, int y1, int x2, int y2, uint16_t color) {
	int x, y, dx, dy, Dx, Dy, e, i;

	// lineh and linev are faster than this more complicated line function
	if(y1 == y2)	// horizontal
	{
		ssd1289_lineh(x1, y1, x2-x1, color);
		return;
	}
	
	if(x1 == x2)	// vertical
	{
		ssd1289_linev(x1, y1, y2-y1, color);
		return;
	}
	
	Dx = x2-x1;
	Dy = y2-y1;

	dx = fabs(x2-x1);
	dy = fabs(y2-y1);

	x = x1;
	y = y1;

	if(dy > dx) {
		e = -dy;
		for(i = 0; i < dy; i++) {
			ssd1289_setpx(x, y, color);
			if(Dy >= 0) y++;
			else y--;
			e += 2*dx;
			if(e >= 0) {
				if(Dx >= 0) x++;
				else x--;
				e -= 2*dy;
			}
		}
	}
	else
	{
		e = -dx;
		for(i = 0; i < dx; i++) {
			ssd1289_setpx(x, y, color);
			if(Dx >= 0) x++;
			else x--;
			e += 2*dy;
			if(e >= 0) {
				if(Dy >= 0) y++;
				else y--;
				e -= 2*dx;
			}
		}
	}
}


void ssd1289_circle(int x, int y, int radius, uint16_t color) { 
	int xc = 0; 
	int yc;
	int p;
	yc=radius;
	p = 3 - (radius<<1);
	
	while (xc <= yc){ 
		ssd1289_setpx(x + xc, y + yc, color); 
		ssd1289_setpx(x + xc, y - yc, color); 
		ssd1289_setpx(x - xc, y + yc, color); 
		ssd1289_setpx(x - xc, y - yc, color); 
		ssd1289_setpx(x + yc, y + xc, color); 
		ssd1289_setpx(x + yc, y - xc, color); 
		ssd1289_setpx(x - yc, y + xc, color); 
		ssd1289_setpx(x - yc, y - xc, color); 
		if (p < 0) {
			p += (xc++ << 2) + 6; 
		} else {
			p += ((xc++ - yc--)<<2) + 10; 
		} 
	}
	
	return;
}

void ssd1289_fill_circle(int x, int y, int radius, uint16_t color) {
		ssd1289_ellipse(x, y, radius, radius, color);
}

/********************************************************
 * Draw an ellipse
 * see: "glcd.c" for Nokia 6100 by Hagen Reddmann
 * enhanced version by oog:
 *  print lines just once to avoid XOR-draw mode hazard 
 */
void ssd1289_ellipse(unsigned char x, unsigned char y, unsigned char rx, unsigned char ry, uint16_t color) {


	int16_t aa = rx * rx;
	int16_t bb = ry * ry;
	int32_t er, cr, ir;
	int16_t ys,ye,xs,xe;
	
	// remember last y coordinates
	// avoid double print of lines
	// (no blank lines in XOR mode)
	int16_t ys0, ye0;
	int16_t ysl0, yel0;

	if ((rx == 0) | (ry == 0)) return;
	
	ys0=0; 
	ye0=0;
	ysl0=0; 
	yel0=0;

	
	cr = bb >> 1;
	cr = cr * (rx + rx -1);
	ir = aa >> 1;
	ir = -ir;
	er = 0;
	xs = x;
	xs = xs - rx;
	xe = x;
	xe = xe + rx;
	ys = y;
	ye = y;
	
	
	while(cr >= ir) {
		if(ys!=ys0) {
			//lcd_hline(xs, xe, ys, color);
			//        x1  x2  y
			ssd1289_lineh(xs, ys, (xe-xs), color);
		}
		ys0=ys;
		if(ys != ye) {
			if (ye!=ye0) {
				//lcd_hline(xs, xe, ye, color);
				ssd1289_lineh(xs, ye, (xe-xs), color);
			}
			ye0=ye;
		}
		ys--;
		ye++;
		ir += aa;
		er += ir;
		if (2 * er > cr) {
			er -= cr;
			cr -= bb;
			xs++;
			xe--;
		}
	}
	
	ysl0=ys0;
	yel0=ye0;
	
	cr = aa >> 1;
	cr = cr * (ry + ry -1);
	ir = bb >> 1;
	ir = -ir;
	er = 0;

	xs = x;
	xe = x;
	ys = y;
	ys = ys - ry;
	ye = y;
	ye = ye + ry;
	
	while (ir <= cr) {
		if (((ys!=ys0) && (ys!=ysl0))) {
			//lcd_hline(xs, xe, ys, color);
			//        x1  x2  y
			ssd1289_lineh(xs, ys, (xe-xs), color);
		}
		ys0=ys;
		if (ys != ye) {
			if (((ye!=ye0) && (ye!=yel0))) {
				//lcd_hline(xs, xe, ye, color);
				//        x1  x2  y
				ssd1289_lineh(xs, ye, (xe-xs), color);
			}
			ye0=ye;
		}
		ir += bb;
		er += ir;
		if (2 * er > cr) {
			er -= cr;
			cr -= aa;
			ys++;
			ye--;
		}
		xs--;
		xe++;
		}
}

