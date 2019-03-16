#ifndef __TIMER2_H__
#define __TIMER2_H__

#include <stdint.h>

int init_timer2(void);
uint32_t timer2_get_uptime(void);
uint32_t timer2_get_ticks(void);

#endif // __TIMER2_H__
