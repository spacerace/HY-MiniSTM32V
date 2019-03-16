#ifndef __USART_H__
#define __USART_H__

#include <errno.h>
#include <unistd.h>
#include <stdio.h>
#include <inttypes.h>
#include <libopencm3/stm32/usart.h>
#include <libopencm3/stm32/rcc.h>
#include <libopencm3/stm32/gpio.h>

void init_usart1(void);
void usart1_puts(char *s);

#endif // __USART_H__
