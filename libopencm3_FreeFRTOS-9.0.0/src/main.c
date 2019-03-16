/* HY-MiniSTM32V libopencm3 FreeRTOS-9.0.0 example
 * 
 * USART1 is configured to 115200,8n1
 * 
 * Licenseing: This is public domain code.
 * (2019 Nils Stec)
 * 
 */

#include <stdio.h>
#include <libopencm3/stm32/rcc.h>
#include "FreeRTOS.h"
#include "task.h"
#include "usart.h"

void print_tasklist(void);

void vT_led(void *p);
void vT_usart(void *p);

int main(void) { 
    rcc_clock_setup_in_hse_8mhz_out_72mhz();
    init_usart1();
    
    /* clear screen + home cursor on terminal */
    usart1_puts("\e[2J\e[0;0H");

    xTaskCreate(vT_led, (const char*) "LED BLINKER", 240, NULL, 0, NULL);
    xTaskCreate(vT_usart, (const char*) "USART1", 240, NULL, 0, NULL);
    
    usart1_puts("created some tasks, starting scheduler...\r\n");
    vTaskStartScheduler();
    
    while (1) {
    }

    return 0;
}

void vT_led(void *p) {
    rcc_periph_clock_enable(RCC_GPIOB);
    
    /* set LED lines to output (LED1=PB0, LED2=PB1) */
    gpio_set_mode(GPIOB, GPIO_MODE_OUTPUT_2_MHZ, GPIO_CNF_OUTPUT_PUSHPULL, GPIO0);
    gpio_set_mode(GPIOB, GPIO_MODE_OUTPUT_2_MHZ, GPIO_CNF_OUTPUT_PUSHPULL, GPIO1);
    gpio_clear(GPIOB, GPIO0);
    gpio_set(GPIOB, GPIO1);
    
    for(;;) {
        gpio_toggle(GPIOB, GPIO0);
        vTaskDelay(500/portTICK_RATE_MS);
    }
}

void vT_usart(void *p) {
    uint16_t c;
    
    printf("FreeRTOS 9.0.0 running on STM32F103VCT6 with libopencm3\r\n\r\n");
    print_tasklist();
    
    for(;;) {
        /* this loop waits for a character from terminal and sends it back. */    
        while (1) {
            usart1_puts("\e[2J\e[0;0H");
            print_tasklist();
            vTaskDelay(1000/portTICK_RATE_MS);
        }        
    }
}

/* uses gen_tasklist, see src/freertos/tasks.c line 4035 */
void print_tasklist(void) {
    uint32_t freeheap, heaptotal, usedheap, n_tasks;
    char *listbuf;
    
    freeheap = xPortGetFreeHeapSize();
    heaptotal = configTOTAL_HEAP_SIZE;
    usedheap = heaptotal - freeheap;  
    
    n_tasks = uxTaskGetNumberOfTasks();
    
    listbuf = (char *)pvPortMalloc(41*n_tasks);
    explicit_bzero(listbuf, 41*n_tasks);
    
    /* gen_tasklist is a combination of vTaskList and vTaskGetRunTimeStats.
     * see src/freertos/tasks.c for details of implementation.
     */
    gen_tasklist(listbuf);
  
    printf("memory statistics:\n");
    printf(" heap=%lubytes used=%lub free=%lub #tasks=%02ld     \n", heaptotal, usedheap, freeheap, n_tasks);   
    printf("uptime=%06lus\n\n", timer2_get_uptime());   
    
    printf("task list:\n");
    printf("NUM        NAME S P STCKb timeAbs_µS  \n"); 
    printf(listbuf);
    vPortFree(listbuf); 
    
    return;
}

void vApplicationStackOverflowHook(xTaskHandle *pxTask, signed char *pcTaskName) {
    printf("ERROR: vApplicationStackOverflowHook(): Task \"%s\" overflowed its stack\r\n", pcTaskName);
}
