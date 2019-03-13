#ifndef __BKP_H__
#define __BKP_H__

#include <stdint.h>

#include "stm32f10x.h"
#include "stm32f10x_bkp.h"

int bkp_read_all(uint16_t bkp_regs[42]);
int bkp_write_all(uint16_t bkp_regs[42]);
void bkp_init(void);
void bkp_deinit(void);
int bkp_unlock(void);
int bkp_lock(void);


#endif // __BKP_H__
