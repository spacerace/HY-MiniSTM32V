/*
 * 
 * 
 * 
 */

#include <libopencm3/stm32/rcc.h>
#include <libopencm3/stm32/gpio.h>
#include <libopencm3/stm32/usart.h>

#include "usart.h"

void usart1_puts(char *s) {
    while(*s) {
        usart_send_blocking(USART1, *s);
        s++;
    }
    return;
}

uint8_t usart1_getc(void) {
    return usart_recv_blocking(USART1);
}

void usart1_putc(uint8_t c) {
    usart_send_blocking(USART1, c);
    return;    
}

void usart1_init(void) {
    /* enable clock, USART1 is on GPIOA */
    rcc_periph_clock_enable(RCC_GPIOA);
    rcc_periph_clock_enable(RCC_USART1);
    
    /* setup TX pin (PA9) */
    gpio_set_mode(GPIOA, GPIO_MODE_OUTPUT_50_MHZ, GPIO_CNF_OUTPUT_ALTFN_PUSHPULL, GPIO9);
    
    /* setup RX pin (PA10) */
    gpio_set_mode(GPIOA, GPIO_MODE_INPUT, GPIO_CNF_INPUT_FLOAT, GPIO10);
    
	/* Setup USART parameters. */
	usart_set_baudrate(USART1, 115200);
	usart_set_databits(USART1, 8);
	usart_set_stopbits(USART1, USART_STOPBITS_1);
	usart_set_mode(USART1, USART_MODE_TX_RX);
	usart_set_parity(USART1, USART_PARITY_NONE);
	usart_set_flow_control(USART1, USART_FLOWCONTROL_NONE);

    /* enable USART */
    usart_enable(USART1);

    return;
}
