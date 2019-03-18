/* HY-MiniSTM32V test for "hidden" RAM
 * 
 * ram = 0x20000000, LENGTH = 48K
 * 48k = 49152bytes = C000 bytes 
 * ranges from 0x20000000 to 0x2000BFFF
 * start of "hidden" ram 0x2000C000
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
    char buffer[81];
    uint32_t address, misses = 0;
    volatile uint32_t *dptr;    
    
    rcc_clock_setup_in_hse_8mhz_out_72mhz();
    
    init_usart1();    
    usart1_puts("\e[2J\e[0;0H");        // clear screen + home cursor on terminal
    
    /* turn off TFT backlight on my dev-board */
    rcc_periph_clock_enable(RCC_GPIOB);  
    gpio_set_mode(GPIOB, GPIO_MODE_OUTPUT_2_MHZ, GPIO_CNF_OUTPUT_PUSHPULL, GPIO5);
    gpio_clear(GPIOB, GPIO5); 

    usart1_puts("  testing address 0x");
    usart1_puts("\e[s");                // tell terminal to save cursor position

    for(address = 0x2000C000; address <= 0x2000FFFC; address++) {
        snprintf(buffer, 81, "%08lX", address);
        usart1_puts(buffer);
        usart1_puts("\e[u");            // go to saved cursor position for next address to print
        
        dptr = (volatile uint32_t *)address;
        *dptr = 0xA5A5A5A5;
        if(*dptr != 0xA5A5A5A5)
            misses++;
    }
    
    snprintf(buffer, 81, "\r\n\r\n [ misses = %lu ]   \r\n", misses);
    usart1_puts(buffer);

    while (1) {
        
    }

    return 0;
}
