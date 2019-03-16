/*
 * Date:  2019-03
 * 
 */

#include <stdio.h>
#include <string.h>
#include <stdlib.h>

#include "stm32f10x.h"

#include "FreeRTOS.h"
#include "task.h"

#include "usart.h"
#include "leds.h"
#include "timer2.h"

#include "ssd1289.h"

#include "sdio_sd.h"
#include "ff.h"

void vT_led(void *p);
void vT_usart(void *p);
void vT_TFT(void *p);

void print_tasklist(void);

FATFS FatFs;

int main(void){
    int ret;
    
    /* setup clocks etc */
	SystemInit();
	
    /* setup serial console on USART1 */
    usart1_init();
    
    /* clear screen on USART1 (terminal program on PC) */
    usart1_puts("\e[2J");
    /* home cursor */
    usart1_puts("\e[0;0H");

    /* LEDs will be used by a task */
 	init_leds();
    
    /* timer2 is used for gathering statistics by FreeRTOS, task running time etc.
     * see:
     * In a production system this is usually not needed. You can disable it
     * by undefining ...... in FreeRTOS_config.h
     * After this you can remove this call to init_timer2().
     */
    init_timer2();
    
    /* init SD/MMC card */
    SD_LowLevel_Init();
	if(SD_Detect() == SD_PRESENT)	{
		usart1_puts("SD+MMC: sd card detected, mounting ... ");
        ret = f_mount(&FatFs, "", 0);	// mount default drive
        if(ret != 0) {
            usart1_puts("\r\n");
            usart1_puts("ERROR IN FAT!\r\n");
        } else {
            usart1_puts("[OK]\r\n");
        }
	} else {
		usart1_puts("sd/mmc driver initialized, but no sdcard found.\r\n");
	}

	
 	xTaskCreate(vT_TFT,    (const char*) "TFT",   120, NULL, 0, NULL);
	xTaskCreate(vT_led,    (const char*) "leds",   120, NULL, 0, NULL);
    xTaskCreate(vT_usart, (const char*) "usart", 240, NULL, 0, NULL);
    
    usart1_puts("created some tasks, starting scheduler...\r\n");
    
  	vTaskStartScheduler();

    
	for(;;) {
		
	}
		
	return 0;
}

void vT_TFT(void *p) {
    /* init TFT and text output functions */
    ssd1289_init();
    ssd1289_bl_set(50);
 	ssd1289_fill(RGB_COL_BLACK);
    ssd1289_textcon_init();
    ssd1289_set_font(FONT_XGA_8x16);
    ssd1289_set_font_color(RGB_COL_YELLOW, RGB_COL_BLACK);       
    
    ssd1289_puts("printed from a seperate thread");
    
 	for(;;) {
        vTaskDelay(500 / portTICK_RATE_MS);
	}   
}

void vT_usart(void *p) {
    for(;;) {
        /* clear screen on terminal */
        usart1_puts("\e[2J");
        /* home cursor */
        usart1_puts("\e[0;0H");
       
        print_tasklist();
        
        vTaskDelay(333/portTICK_RATE_MS);
    }
}


void vT_led(void *p) {
	for(;;) {
        LED1_OFF();
		vTaskDelay(500 / portTICK_RATE_MS);
        LED1_ON();
        vTaskDelay(500 / portTICK_RATE_MS);
	}
}

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
  
    printf("heap=%lub used=%lub free=%lub #tasks=%02ld   \r\n", heaptotal, usedheap, freeheap, n_tasks);   
    printf("up=%06lus\r\n", timer2_get_uptime());   
    
    printf("NUM        NAME S P STCKb timeAbs_µS  \r\n"); 
    printf(listbuf);
    vPortFree(listbuf); 
    
    return;
}


void vApplicationStackOverflowHook(xTaskHandle *pxTask, signed char *pcTaskName) {
    printf("ERROR: vApplicationStackOverflowHook(): Task \"%s\" overflowed its stack\r\n", pcTaskName);
//  fflush(stdout);
// 	assert(false);
}


