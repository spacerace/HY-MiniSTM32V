#include <stdio.h>
#include <stdio.h>
#include <string.h>
#include "sdio_sd.h"
#include "ff.h"

unsigned long int get_filesize(char *file) {
    FRESULT fr;
    FILINFO fno;

    fr = f_stat(file, &fno);
    if(fr != FR_OK) {
        ff_error_msg(fr);
        return 0;
    }

    return fno.fsize;
}

