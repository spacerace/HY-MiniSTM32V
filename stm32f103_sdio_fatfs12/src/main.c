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

extern int printf_(const char *format, ...);
extern void SD_LowLevel_Init(void);

FATFS FatFs;


/* cat - concentate
 * displays a file
 */
void cat_file(char *filename) {
	FIL f;
	char line[82];
	FRESULT r = f_open(&f, filename, FA_READ);
	if(r) {
		printf("couldn't open %s for reading data...\r\n", filename);
	}
	
	while(f_gets(line, sizeof line, &f)) printf(line);
	
	f_close(&f);	
	return;
}


/* this function creates files
 * first F_APPEND.TXT will be opened for appending and text written to it
 * second F_CRALW.TXT will be opened, overwritten if exisiting, text written to it
 * third F_CRALW.TXT will be overwritten, text written to it
 * in between the files will be displayed
 * 
 */
void create_file() {
	FIL f;
	FRESULT r;

        printf("###############################################################\r\n");
        printf("#### test: opening file for write (appending data)            #\r\n");
	r = f_open(&f, "F_APPEND.TXT", FA_WRITE | FA_OPEN_APPEND);
	if(r) {
		printf("couldn't open F_APPEND.TXT for appending data...\r\n");
	}
	f_printf(&f, "data %d 0x%x\r\n", 22, 0x33);
	printf("wrote some data to F_APPEND.TXT\r\n");
	r = f_close(&f);
	printf("result of close: %d (0 means good!)\r\n", r);
	printf("content of F_APPEND.TXT:\r\n");
	cat_file("F_APPEND.TXT");
	
        printf("###############################################################\r\n");
        printf("#### test: opening file for write (always create new)         #\r\n");
	printf("####       i will open it twice and write the same to it      #\r\n");
	printf("####       after this i will concentate the file. there only  #\r\n");
	printf("####       should be one line displayed.                      #\r\n");
	r = f_open(&f, "F_CRALW.TXT", FA_WRITE | FA_CREATE_ALWAYS);
	if(r) {
		printf("couldn't open F_CRALW.TXT for writing...\r\n");
	}
	f_printf(&f, "TESTFILE FR_CRALW.TXT CREATED. THIS IS ITS CONTENT...\r\n");
	printf("wrote some data to F_CRALW.TXT\r\n");
	r = f_close(&f);
	printf("result of close: %d (0 means good!)\r\n", r);
	
	printf("opening file F_CRALW.TXT for writing data A SECOND TIME, last created file WILL be overwritten!\r\n");
	r = f_open(&f, "F_CRALW.TXT", FA_WRITE | FA_CREATE_ALWAYS);
	if(r) {
		printf("couldn't open F_CRALW.TXT for writing...\r\n");
	}
	f_printf(&f, "TESTFILE FR_CRALW.TXT CREATED. THIS IS ITS CONTENT...\r\n");
	printf("wrote some data to F_CRALW.TXT\r\n");
	r = f_close(&f);
	printf("result of close: %d (0 means good!)\r\n", r);
	printf("content of F_CRALW.TXT:\r\n");
	cat_file("F_CRALW.TXT");

	return;
}

FRESULT list_dir(char *path) {
	FRESULT r;
	DIR dir;
	UINT i;
	
	static FILINFO fno;
	
	r = f_opendir(&dir, path);
	if(r == FR_OK) {
		for(;;) {
			r = f_readdir(&dir, &fno);
			if(r != FR_OK || fno.fname[0] == 0) break;	// stop on error or end of directory
			
			if(fno.fattrib & AM_DIR) {
		                i = strlen(path);
				sprintf(&path[i], "/%s", fno.fname);
				printf("%s\r\n", fno.fname);
				r = list_dir(path);                    /* Enter the directory */
				if (r != FR_OK) break;
				path[i] = 0;
			} else {
				printf("%s/%s\r\n", path, fno.fname);
			}
		}
		f_closedir(&dir);
	}
	return 0;
}

int main(void){
	SystemInit();
	usart1_init();
	
	printf("\r\n>>>\r\n>>>\r\nmmc/sd card test program for stm32f103 using sdio interface and elm chan's fatfs 1.2\r\n  test program made by nils stec 07/2016 <stecdose@gmail.com>\r\n");
	
	SD_LowLevel_Init();
	if(SD_Detect() == SD_PRESENT)	{
		printf("sd card detected, mounting ... ");
	} else {
		printf("waiting for mmc/sd .. .. .. ");
		while(SD_Detect()!=SD_PRESENT);
		printf("thanks, mounting card ... ");
	}
	
	f_mount(&FatFs, "", 0);		// mount default drive
	
	printf("ok.\r\n");
	
	printf("content of about.txt:\r\n------------------------\r\n");
	cat_file("about.txt");
	printf("\r\n------------------------\r\n");
	
	printf("creating some files...\r\n");
	create_file();
	
	
	list_dir("/");
	
	for(;;) {
	}
		
	return 0;
}


