/* HY-MiniSTM32V libopencm3 ADC1 polling example
 * 
 * converts PA0 and PA1 (ADC123_IN0 and ADC123_IN1).
 * 
 * results are sent out via USART1 
 * (connected to onboard PL2303 USB2Serial)
 * USART1 is configured to 115200,8n1
 * 
 * derived from libopencm3 examples.
 * 
 * Licenseing: This is public domain code.
 * (2019 Nils Stec)
 *
 */

#include <stdio.h>
#include <libopencm3/stm32/rcc.h>
#include <libopencm3/stm32/adc.h>
#include <libopencm3/stm32/gpio.h>
#include "usart.h"
#include "adc.h"


int main(void) {
    char str[81];
    uint16_t ch0, ch1;

    /* set system clock */
    rcc_clock_setup_in_hse_8mhz_out_72mhz();

    /* init usart1 to 115200,8n1 (see usart.c) */
    usart1_init();
    
    usart1_puts("\e[2J");   // clear screen on terminal
    usart1_puts("\e[0;0H"); // home cursor
    usart1_puts("Hello from libopencm3 ADC demo on HY-MiniSTM32V\r\n\r\n");

    /* init ADC1 */
    init_ADC1();
    
    while (1) {
            ch0 = readADC1(0);
            ch1 = readADC1(1);
            
            snprintf(str, 81, "\rCH0=0x%04x CH1=0x%04x", ch0, ch1);
            usart1_puts(str);
    }

    return 0;
}

