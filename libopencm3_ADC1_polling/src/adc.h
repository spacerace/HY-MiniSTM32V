#ifndef __ADC_H__
#define __ADC_H__

#include <inttypes.h>

int init_ADC1(void);
uint16_t readADC1(uint8_t channel);


#endif // __ADC_H__
