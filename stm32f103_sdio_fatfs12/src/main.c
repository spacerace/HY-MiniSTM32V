/*
 * 
 * Author: Nils Stec, stecdose@gmail.com
 * Date 2016-07-12
 *      2016-07-14
 * 
 */

#include <stdio.h>
#include <string.h>
#include <stdlib.h>

#include "stm32f10x.h"
#include "usart.h"
#include "sdio_sd.h"
#include "ff.h"

extern void SD_LowLevel_Init(void);
void cat_file(char *filename);
int list_dir(char *path);

FATFS FatFs;

int main(void){
    int res;
    
	SystemInit();
	usart1_init();

    /* clear screen */
    usart1_puts("\e[2J");
    /* home cursor */
    usart1_puts("\e[0;0H");    
    
 	usart1_puts("sd card test program for stm32f103\r\n");
	usart1_puts("using sdio interface and elm chan's fatfs 1.2\r\n");
    
    /* init sdio interface + card */
	SD_LowLevel_Init();
	if(SD_Detect() == SD_PRESENT)	{
		usart1_puts("sd card detected, mounting ... ");
	} else {
		usart1_puts("waiting for mmc/sd ...");
		while(SD_Detect()!=SD_PRESENT);
		usart1_puts("thanks, mounting card ... ");
	}
	
	/* mount default device */
	res = f_mount(&FatFs, "", 0);
	if(res != 0) {
        usart1_puts("error mounting sd card!\r\n");
        for(;;);
    }
	usart1_puts("ok.\r\n");
	
    /* show file ABOUT.TXT from card's root dir */
	usart1_puts("content of about.txt:\r\n");
	cat_file("about.txt");
	
    /* show the contents of a directory */
	list_dir("/");
	
	for(;;) {
        
	}
	
		
	return 0;
}


/* cat - concentate
 * displays a file
 */
void cat_file(char *filename) {
	FIL f;
	char line[82];
	FRESULT r = f_open(&f, filename, FA_READ);
	if(r) {
 		usart1_puts("couldn't open ");
        usart1_puts(filename);
        usart1_puts(" for reading data...\r\n");
        return;
	}
	
 	while(f_gets(line, sizeof line, &f)) {
        usart1_puts(line);
    }
	
	f_close(&f);	
	return;
}


int list_dir(char *path) {
    int ret;
    DIR dir;
    static FILINFO fno;
    
    ret = f_opendir(&dir, path);
    if(ret != FR_OK) {
        usart1_puts("error while opening directory '");
        usart1_puts(path);
        usart1_puts("\r\n");
        return -1;
    }
    
    usart1_puts("content of directory '");
    usart1_puts(path);
    usart1_puts("':\r\n");
    
    for(;;) {
        ret = f_readdir(&dir, &fno);
        if((ret != FR_OK) || (fno.fname[0] == 0)) {     /* break on error or end of directory */
            break;            
        }
        
        usart1_puts(" ");
        usart1_puts(fno.fname);
        usart1_puts("\r\n");
    }
    
    
	return 0;
}



// /* this function creates files
//  * first F_APPEND.TXT will be opened for appending and text written to it
//  * second F_CRALW.TXT will be opened, overwritten if exisiting, text written to it
//  * third F_CRALW.TXT will be overwritten, text written to it
//  * in between the files will be displayed
//  * 
//  */
// void create_file() {
// 	FIL f;
// 	FRESULT r;
// 
//         printf("###############################################################\r\n");
//         printf("#### test: opening file for write (appending data)            #\r\n");
// 	r = f_open(&f, "F_APPEND.TXT", FA_WRITE | FA_OPEN_APPEND);
// 	if(r) {
// 		printf("couldn't open F_APPEND.TXT for appending data...\r\n");
// 	}
// 	f_printf(&f, "data %d 0x%x\r\n", 22, 0x33);
// 	printf("wrote some data to F_APPEND.TXT\r\n");
// 	r = f_close(&f);
// 	printf("result of close: %d (0 means good!)\r\n", r);
// 	printf("content of F_APPEND.TXT:\r\n");
// 	cat_file("F_APPEND.TXT");
// 	
//         printf("###############################################################\r\n");
//         printf("#### test: opening file for write (always create new)         #\r\n");
// 	printf("####       i will open it twice and write the same to it      #\r\n");
// 	printf("####       after this i will concentate the file. there only  #\r\n");
// 	printf("####       should be one line displayed.                      #\r\n");
// 	r = f_open(&f, "F_CRALW.TXT", FA_WRITE | FA_CREATE_ALWAYS);
// 	if(r) {
// 		printf("couldn't open F_CRALW.TXT for writing...\r\n");
// 	}
// 	f_printf(&f, "TESTFILE FR_CRALW.TXT CREATED. THIS IS ITS CONTENT...\r\n");
// 	printf("wrote some data to F_CRALW.TXT\r\n");
// 	r = f_close(&f);
// 	printf("result of close: %d (0 means good!)\r\n", r);
// 	
// 	printf("opening file F_CRALW.TXT for writing data A SECOND TIME, last created file WILL be overwritten!\r\n");
// 	r = f_open(&f, "F_CRALW.TXT", FA_WRITE | FA_CREATE_ALWAYS);
// 	if(r) {
// 		printf("couldn't open F_CRALW.TXT for writing...\r\n");
// 	}
// 	f_printf(&f, "TESTFILE FR_CRALW.TXT CREATED. THIS IS ITS CONTENT...\r\n");
// 	printf("wrote some data to F_CRALW.TXT\r\n");
// 	r = f_close(&f);
// 	printf("result of close: %d (0 means good!)\r\n", r);
// 	printf("content of F_CRALW.TXT:\r\n");
// 	cat_file("F_CRALW.TXT");
// 
// 	return;
// }
