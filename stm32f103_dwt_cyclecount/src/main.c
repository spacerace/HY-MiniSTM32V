#include <stdio.h>
#include <string.h>
#include <stdlib.h>

#include "stm32f10x.h"
#include "usart.h"

void dwt_enable();
void dwt_enable_cycle_cnt();
void dwt_disable_cycle_cnt();
uint32_t dwt_get_cycle_cnt();
void dwt_reset_cycle_cnt();

volatile uint32_t *DWT_CONTROL = (uint32_t *)0xE0001000;
volatile uint32_t *DWT_CYCCNT = (uint32_t *)0xE0001004; 
volatile uint32_t *DEMCR = (uint32_t *)0xE000EDFC;

void do_something_for_some_cycles(void) {
        int i;
        for(i = 0; i < 16; i++) {
            printf("%d ", i);
        }
        printf("\r\n");
        return;
}

int main(void){
	usart1_init();

	printf("HY-MiniSTM32V STM32F103-VCT6 DWT CYCLE COUNTER EX.\r\n");
    printf("----------------------------------------------------\r\n");
    
    uint32_t start, end, diff, time = 0;
    
    dwt_enable();               // first ENABLE DWT
    dwt_reset_cycle_cnt();      // second reset cycle counter
    dwt_enable_cycle_cnt();     // third start counting
    
    start = dwt_get_cycle_cnt();    // get count in the beginning
    do_something_for_some_cycles();
    end = dwt_get_cycle_cnt();      // get count in the end
    diff = end-start;
    
    printf("----------------------------------------------------\r\n");
    printf("^^took %lu cycles.\r\n\r\n", diff);
    printf("Different MCU-speeds give different time-per-tick values:\r\n");
    printf(" 128MHz   7.8125nS\r\n");
    printf("  72MHz  13.8888nS\r\n");
    printf("  56MHz  17.8571nS\r\n");
    printf("  48MHz  20.8333nS\r\n");
    printf("  36MHz  27.7777nS\r\n");
    printf("  24MHz  41.6666nS\r\n");
    printf("   8MHz 125.0000nS\r\n\r\n");
    
    // we do not use floating point math, we're using fixed comma math.
    printf("SystemCoreClock = %luHz\r\n", SystemCoreClock);
    switch(SystemCoreClock) {
        case 128000000:
                time = diff * 78;
                time /= 10;
            break;
        case 72000000:
                time = diff * 139;
                time /= 10;
            break;
        case 56000000:
                time = diff * 179;
                time /= 10;
            break;
        case 48000000:
                time = diff * 201;
                time /= 10;
            break;
        case 36000000:
                time = diff * 277;
                time /= 10;
            break;
        case 24000000:
                time = diff * 417;
                time /= 10;
            break;
        case 8000000:
                time = diff * 125;
                // this multiplier is with comma zero.
                // so no need for fixed comma math,
                // no comma at all.
            break;
    }
    printf("time used in nano-seconds: %lu\r\n", time);
    
    
    
    for(;;) {

	}

	return 0;
}


void dwt_enable() {
    *DEMCR = *DEMCR | 0x01000000;
}

void dwt_enable_cycle_cnt() {
    *DWT_CONTROL = 0x40000001;
}

void dwt_disable_cycle_cnt() {
    *DWT_CONTROL = 0x40000000;
}

uint32_t dwt_get_cycle_cnt() {
    return *DWT_CYCCNT;
}

void dwt_reset_cycle_cnt() {
    *DWT_CYCCNT = 0;
}


