/* HY-MiniSTM32V libopencm3 USART1 example
 * 
 * USART1 is configured to 115200,8n1
 * 
 * Licenseing: This is public domain code.
 * (2019 Nils Stec)
 * 
 */

#include <stdio.h>
#include <libopencm3/stm32/rcc.h>

#include "usart.h"

int main(void) {
    char c;
    char buffer[81];
    
    /* set system clock */
    rcc_clock_setup_in_hse_8mhz_out_72mhz();

    /* see usart.c for details. 115200,8n1 */
    init_usart1();
    
    /* clear screen + home cursor on terminal */
    usart1_puts("\e[2J\e[0;0H");
    
    snprintf(buffer, 81, "this is snprintf printed by usart1_puts() 0x%08X\n\n", 0xDEADBEEF);
    usart1_puts(buffer);
    
    printf("printf works too %X\n\n", 0x1234);
    
    
    /* this loop waits for a character from terminal and sends it back.
     */    
    while (1) {
        c = usart_recv_blocking(USART1);
        usart_send_blocking(USART1, c);
    }

    return 0;
}

