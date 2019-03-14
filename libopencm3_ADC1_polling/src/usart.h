#ifndef __USART_H__
#define __USART_H__

#include <inttypes.h>

void usart1_puts(char *s);
void usart1_init(void);
uint8_t usart1_getc(void);
void usart1_putc(uint8_t c);

#endif // __USART_H__
