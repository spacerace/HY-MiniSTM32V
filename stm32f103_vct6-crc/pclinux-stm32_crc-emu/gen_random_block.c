#include <stdio.h>
#include <stdlib.h>
#include <time.h>
#include <inttypes.h>

static uint32_t len = 32;
static uint32_t columns = 8;

int main() {
	uint32_t row, column, lcount = 0;

	srand(time(NULL));

	printf("uint32_t data_block[%d] = {\n", len);
	for(row = 0; row < (len/columns); row++) {
		printf("\t");
		for(column = 0; column < columns; column++) {
			if(lcount == (len-1)) printf("0x%08x", rand());
			else printf("0x%08x, ", rand());
			lcount++;
		}
		printf("\n");
	}
	printf("};\n");

	return 0;
}
