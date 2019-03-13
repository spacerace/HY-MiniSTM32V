#ifndef __RANDOM_H__
#define __RANDOM_H__

#include <inttypes.h>
#include <stdint.h>

extern uint32_t random_xorshift32(void);
extern uint32_t random_kiss32(void);

#endif // __RANDOM_H__
