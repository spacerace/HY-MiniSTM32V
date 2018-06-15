#include "bkp.h"

int bkp_read_all(uint16_t bkp_regs[42]) {
	return 0;
}

int bkp_write_all(uint16_t bkp_regs[42]) {
	BKP_WriteBackupRegister(BKP_DR1, bkp_regs[0]);
	BKP_WriteBackupRegister(BKP_DR2, bkp_regs[1]);
	BKP_WriteBackupRegister(BKP_DR3, bkp_regs[2]);
	BKP_WriteBackupRegister(BKP_DR4, bkp_regs[3]);
	BKP_WriteBackupRegister(BKP_DR5, bkp_regs[4]);
	BKP_WriteBackupRegister(BKP_DR6, bkp_regs[5]);
	BKP_WriteBackupRegister(BKP_DR7, bkp_regs[6]);
	BKP_WriteBackupRegister(BKP_DR8, bkp_regs[7]);
	BKP_WriteBackupRegister(BKP_DR9, bkp_regs[8]);
	BKP_WriteBackupRegister(BKP_DR10, bkp_regs[9]);
	BKP_WriteBackupRegister(BKP_DR11, bkp_regs[10]);
	BKP_WriteBackupRegister(BKP_DR12, bkp_regs[11]);
	BKP_WriteBackupRegister(BKP_DR13, bkp_regs[12]);
	BKP_WriteBackupRegister(BKP_DR14, bkp_regs[13]);
	BKP_WriteBackupRegister(BKP_DR15, bkp_regs[14]);
	BKP_WriteBackupRegister(BKP_DR16, bkp_regs[15]);
	BKP_WriteBackupRegister(BKP_DR17, bkp_regs[16]);
	BKP_WriteBackupRegister(BKP_DR18, bkp_regs[17]);
	BKP_WriteBackupRegister(BKP_DR19, bkp_regs[18]);
	BKP_WriteBackupRegister(BKP_DR20, bkp_regs[19]);
	BKP_WriteBackupRegister(BKP_DR21, bkp_regs[20]);
	BKP_WriteBackupRegister(BKP_DR22, bkp_regs[21]);
	BKP_WriteBackupRegister(BKP_DR23, bkp_regs[22]);
	BKP_WriteBackupRegister(BKP_DR24, bkp_regs[23]);
	BKP_WriteBackupRegister(BKP_DR25, bkp_regs[24]);
	BKP_WriteBackupRegister(BKP_DR26, bkp_regs[25]);
	BKP_WriteBackupRegister(BKP_DR27, bkp_regs[26]);
	BKP_WriteBackupRegister(BKP_DR28, bkp_regs[27]);
	BKP_WriteBackupRegister(BKP_DR29, bkp_regs[28]);
	BKP_WriteBackupRegister(BKP_DR30, bkp_regs[29]);	
	BKP_WriteBackupRegister(BKP_DR31, bkp_regs[30]);
	BKP_WriteBackupRegister(BKP_DR32, bkp_regs[31]);
	BKP_WriteBackupRegister(BKP_DR33, bkp_regs[32]);
	BKP_WriteBackupRegister(BKP_DR34, bkp_regs[33]);
	BKP_WriteBackupRegister(BKP_DR35, bkp_regs[34]);
	BKP_WriteBackupRegister(BKP_DR36, bkp_regs[35]);
	BKP_WriteBackupRegister(BKP_DR37, bkp_regs[36]);
	BKP_WriteBackupRegister(BKP_DR38, bkp_regs[37]);
	BKP_WriteBackupRegister(BKP_DR39, bkp_regs[38]);
	BKP_WriteBackupRegister(BKP_DR40, bkp_regs[39]);
	BKP_WriteBackupRegister(BKP_DR41, bkp_regs[40]);
	BKP_WriteBackupRegister(BKP_DR42, bkp_regs[41]);
	
	return 0;
}

void bkp_init(void) {
  	RCC_APB1PeriphClockCmd(RCC_APB1Periph_PWR | RCC_APB1Periph_BKP, ENABLE);		
	return;
}

void bkp_deinit(void) {
  	RCC_APB1PeriphClockCmd(RCC_APB1Periph_PWR | RCC_APB1Periph_BKP, DISABLE);
	BKP_DeInit();
}

//void BKP_WriteBackupRegister(uint16_t BKP_DR, uint16_t Data);
//uint16_t BKP_ReadBackupRegister(uint16_t BKP_DR);

/* after reset access to BKP and RTC is blocked.
 * this function unlocks BKP domain.
 */
int bkp_unlock(void) {
	PWR_BackupAccessCmd(ENABLE);	
	return 0;
}

/* lock BKP domain again */
int bkp_lock(void) {
	PWR_BackupAccessCmd(DISABLE);	
	return 0;
}
