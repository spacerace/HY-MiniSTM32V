#ifndef _I2C_H_
#define _I2C_H_

#include "stm32f10x_conf.h"

void i2c_init();

void write_pcf8574(uint8_t addr, uint8_t data);
uint8_t read_pcf8574(uint8_t addr);

#endif // _I2C_H_