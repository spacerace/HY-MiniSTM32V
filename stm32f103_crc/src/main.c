#include "stm32f10x.h"
#include "usart.h"

uint32_t data_block[32] = {
	0x6dc73e75, 0x1dc8bf2b, 0x1b287242, 0x6c2db1b0, 0x169603a1, 0x055b52fc, 0x2e764106, 0x3cb365ec,
	0x567eb08a, 0x11b43992, 0x4b9d002b, 0x2c77484f, 0x1bb44214, 0x7843bfd1, 0x303483d8, 0x59cc6f1a,
	0x65679287, 0x7302dec7, 0x4496f809, 0x02c78a59, 0x5616b5c5, 0x0d49fe74, 0x329658df, 0x5cbc0308,
	0x64fd9cf0, 0x7ff9f408, 0x7a86deac, 0x5f79d723, 0x41e37238, 0x0f87998f, 0x7ee64682, 0x2faab0ad
};



int main(void){
	SystemInit();
	usart1_init();

	// enable clock for CRC unit
	RCC_AHBPeriphClockCmd(RCC_AHBPeriph_CRC, ENABLE);

	unsigned int data = 0x12345678;
	unsigned int result = CRC_CalcCRC(data);

	printf("single word crc calculation:\r\n");
	printf("  data   = 0x%08x\r\n", (unsigned int)data);
	printf("  result = 0x%08x\r\n", (unsigned int)result);

	CRC_ResetDR();

	int len_datablock = sizeof(data_block);
	result = CRC_CalcBlockCRC(data_block, len_datablock);

	printf("block crc calculation (%d bytes):\r\n", len_datablock);
	printf("  data block can be found in source.\r\n");
	printf("  result = 0x%08x\r\n", result);

	for(;;) {
	}

	return 0;
}
