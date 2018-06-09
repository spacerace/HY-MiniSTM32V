#ifndef __SSD1289_7S_H__
#define __SSD1289_7S_H__

#include "ssd1289.h"

#define	_H	0
#define _V	1
#define SEGA	0x01
#define SEGB	0x02
#define SEGC	0x04
#define SEGD	0x08
#define SEGE	0x10
#define SEGF	0x20
#define SEGG	0x40
#define SEGDP	0x80														

int segment_putn(int x, int y, int n, uint16_t color);
int draw_7segment(int x, int y, uint8_t data, uint16_t color);

#endif // __SSD1289_7S_H__
