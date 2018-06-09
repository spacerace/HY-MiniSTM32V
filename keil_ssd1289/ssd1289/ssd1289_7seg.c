#include "ssd1289_7seg.h"

static int draw_segment(int hv, int x, int y, uint16_t color);
static const uint16_t segh[5] = { 0x3FFC, 0x7FFE, 0xFFFF, 0x7FFE, 0x3FFC };
static const uint8_t segv[20] = { 0x04, 0x0e, 0x1f, 0x1f, 0x1f, 0x1f, 0x1f, \
                                  0x1f, 0x1f, 0x1f, 0x1f, 0x1f, 0x1f, 0x1f, \
                                  0x1f, 0x1f, 0x1f, 0x1f, 0x0e, 0x04 };								

int segment_putn(int x, int y, int n, uint16_t color) {
	uint8_t data;
	switch(n) {
		case 0: data = SEGA|SEGB|SEGC|SEGD|SEGE|SEGF; break;
		case 1:	data = SEGB|SEGC; break;
		case 2:	data = SEGA|SEGB|SEGG|SEGE|SEGD; break;
		case 3:	data = SEGA|SEGB|SEGC|SEGD|SEGG; break;
		case 4:	data = SEGF|SEGG|SEGB|SEGC; break;
		case 5:	data = SEGA|SEGF|SEGG|SEGC|SEGD; break;
		case 6:	data = SEGA|SEGF|SEGG|SEGC|SEGD|SEGE; break;
		case 7:	data = SEGA|SEGB|SEGC; break;
		case 8:	data = SEGA|SEGB|SEGC|SEGD|SEGE|SEGF|SEGG; break;
		case 9:	data = SEGA|SEGB|SEGC|SEGD|SEGF|SEGG; break;
		case 0x0A: data = SEGA|SEGB|SEGC|SEGE|SEGF|SEGG; break;
		case 0x0B: data = SEGC|SEGD|SEGE|SEGF|SEGG; break;
		case 0x0C: data = SEGA|SEGD|SEGE|SEGF; break;
		case 0xD: data = SEGB|SEGC|SEGD|SEGE|SEGG; break;
		case 0xE: data = SEGA|SEGD|SEGE|SEGF|SEGG; break;
		case 0xF: data = SEGA|SEGE|SEGF|SEGG; break;
		default:
			return -1;
	}
	draw_7segment(x, y, data, color);
	
	return 0;
	
}

int draw_7segment(int x, int y, uint8_t data, uint16_t color) {
	if(data & SEGA) draw_segment(_H, x+3+1, y+0, color);		// A
	if(data & SEGB) draw_segment(_V, x+17+2, y+4, color);		// B
	if(data & SEGC) draw_segment(_V, x+17+2, y+27, color);	// C
	if(data & SEGD) draw_segment(_H, x+3+1, y+46, color);		// D
	if(data & SEGE) draw_segment(_V, x+0, y+27, color);		// E
	if(data & SEGF) draw_segment(_V, x+0, y+4, color);		// F
	if(data & SEGG) draw_segment(_H, x+3+1, y+23, color);		// G
//	if(data & SEGDP) draw_dp
	return 0;
}

static int draw_segment(int hv, int x, int y, uint16_t color) {
	int line, bit;
	
	switch(hv) {
		case _H:
			for(line = 0; line < 5; line++) {
				for(bit = 0; bit < 16; bit++) {
					if(segh[line] & (1<<bit)) {
						ssd1289_setpx(x+bit, y+line, color);
					}
				}
			}
			break;
		case _V:
			for(line = 0; line < 20; line++) {
				for(bit = 0; bit < 5; bit++) {
					if(segv[line] & (1<<bit)) {
						ssd1289_setpx(x+bit, y+line, color);
					}
				}
			}
			break;
	}
	return 0;
}
