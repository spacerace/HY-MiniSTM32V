/*
 * https://my.st.com/public/STe2ecommunities/mcu/Lists/cortex_mx_stm32/Flat.aspx?RootFolder=https%3a%2f%2fmy.st.com%2fpublic%2fSTe2ecommunities%2fmcu%2fLists%2fcortex_mx_stm32%2fCC%2b%2b%20Example%20for%20CRC%20Calculation&FolderCTID=0x01200200770978C69A1141439FE559EB459D7580009C4E14902C3CDE46A77F0FFD06506F5B&currentviews=4120
 *
 *  TODO add block calculation
 */

#include <stdio.h>
#include <stdlib.h>
#include <stdint.h>
#include <inttypes.h>

uint32_t crc32(uint32_t crc, uint32_t data);

uint32_t data_block[32] = {
	0x6dc73e75, 0x1dc8bf2b, 0x1b287242, 0x6c2db1b0, 0x169603a1, 0x055b52fc, 0x2e764106, 0x3cb365ec,
	0x567eb08a, 0x11b43992, 0x4b9d002b, 0x2c77484f, 0x1bb44214, 0x7843bfd1, 0x303483d8, 0x59cc6f1a,
	0x65679287, 0x7302dec7, 0x4496f809, 0x02c78a59, 0x5616b5c5, 0x0d49fe74, 0x329658df, 0x5cbc0308,
	0x64fd9cf0, 0x7ff9f408, 0x7a86deac, 0x5f79d723, 0x41e37238, 0x0f87998f, 0x7ee64682, 0x2faab0ad
};


int main(int argc, char **argv) {
	if(argc != 3) {
		printf("usage: %s <32bit hex value crc> <32bit hex value data>\n", argv[0]);
		printf("          crc value 0xFFFFFFFF means no calculation was before.\n");
		exit(-1);
	}

	uint32_t crc  = (uint32_t)strtoul( argv[1], NULL, 16 );
	uint32_t data = (uint32_t)strtoul( argv[2], NULL, 16 );

	printf("crc  = 0x%08x\n", crc);
	printf("data = 0x%08x\n", data);

	printf("result = 0x%08x\n", crc32(crc, data));

	return 0;
}

uint32_t crc32(uint32_t crc, uint32_t data) {
	int i;

	crc = crc ^ data;

	for(i=0; i<32; i++)
		if (crc & 0x80000000) crc = (crc << 1) ^ 0x04C11DB7; // Polynomial used in STM32
		else                  crc = (crc << 1);

	return(crc);
}
