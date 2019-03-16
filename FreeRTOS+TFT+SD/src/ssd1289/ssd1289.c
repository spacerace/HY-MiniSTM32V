/*
 * ssd1289 driver for stm32f10x (v0.2)
 *
 * see global README.md for more information.
 */

#include "ssd1289.h"

/* private functions, only needed inside this driver */
static void ssd1289_init_gpio();
static void ssd1289_init_fsmc();
static void ssd1289_controller_init();
static void ssd1289_write_reg(uint8_t reg_addr, uint16_t reg_value);
static uint16_t ssd1289_read_reg(uint8_t reg_addr);

/* global variables, needed by driver, can be used by user */
int ssd1289_display_size_x;
int ssd1289_display_size_y;
int ssd1289_orientation;
static int bl;

int set_orientation(int angle);

int set_orientation(int angle) {
	switch(angle) {
		case 0:
			ssd1289_orientation = 0;
			ssd1289_display_size_x = 240;
			ssd1289_display_size_y = 320;
			break;
		case 90:
			ssd1289_orientation = 90;
		 	ssd1289_display_size_x = 320;
			ssd1289_display_size_y = 240;
			break;
		default:
			return -1;
	}
	return 0;
}

int ssd1289_init() {
	uint16_t lcd_id;

	ssd1289_init_gpio();
	ssd1289_init_fsmc();

	/* debugging helper... read register 0x00, display will return an ID */
	lcd_id = ssd1289_read_reg(0x00);

	if((lcd_id == SSD1289_ID0) || (lcd_id == SSD1289_ID1)) {
		ssd1289_controller_init();
		ssd1289_bl_init();
		ssd1289_bl_set(100);
		set_orientation(90);
		return SSD1289_FOUND;
	}

	return SSD1289_NOT_FOUND;
}

/* set x/y registers, a "pixel-cursor" */
void ssd1289_set_cursor(uint16_t x, uint16_t y) {
	ssd1289_write_reg(0x4e, x);
	ssd1289_write_reg(0x4f, y);

	LCD_REG = 0x22;		/* set register for RAM, next access to LCD_RAM is pixel data */

	return;
}

static void ssd1289_init_gpio() {
	GPIO_InitTypeDef GPIO_InitStructure;

	RCC_APB2PeriphClockCmd(RCC_APB2Periph_GPIOD,ENABLE);
	RCC_APB2PeriphClockCmd(RCC_APB2Periph_GPIOE,ENABLE);

	GPIO_InitStructure.GPIO_Pin = GPIO_Pin_0 |
								  GPIO_Pin_1 |
								  GPIO_Pin_4 |
								  GPIO_Pin_5 |
								  GPIO_Pin_7 |
								  GPIO_Pin_8 |
								  GPIO_Pin_9 |
								  GPIO_Pin_10 |
                                  GPIO_Pin_11 |
                                  GPIO_Pin_14 |
                                  GPIO_Pin_15;
	GPIO_InitStructure.GPIO_Mode = GPIO_Mode_AF_PP;
	GPIO_InitStructure.GPIO_Speed = GPIO_Speed_50MHz;
	GPIO_Init(GPIOD, &GPIO_InitStructure);

	GPIO_InitStructure.GPIO_Pin = GPIO_Pin_3 |
								  GPIO_Pin_7 |
								  GPIO_Pin_8 |
								  GPIO_Pin_9 |
                                  GPIO_Pin_10 |
                                  GPIO_Pin_11 |
                                  GPIO_Pin_12 |
                                  GPIO_Pin_13 |
                                  GPIO_Pin_14 |
                                  GPIO_Pin_15;
	GPIO_InitStructure.GPIO_Mode = GPIO_Mode_AF_PP;
	GPIO_InitStructure.GPIO_Speed = GPIO_Speed_50MHz;
	GPIO_Init(GPIOE, &GPIO_InitStructure);

	return;
}

static void ssd1289_init_fsmc() {
	FSMC_NORSRAMInitTypeDef        FSMC_NORSRAMInitStructure;
	FSMC_NORSRAMTimingInitTypeDef  FSMC_NORSRAMTimingInitStructure;

	RCC_AHBPeriphClockCmd(RCC_AHBPeriph_FSMC, ENABLE);

	FSMC_NORSRAMTimingInitStructure.FSMC_AddressSetupTime = LCD_FSMC_ADDR_SETUP_TIME;
	FSMC_NORSRAMTimingInitStructure.FSMC_AddressHoldTime = 1;
	FSMC_NORSRAMTimingInitStructure.FSMC_DataSetupTime = LCD_FSMC_DATA_SETUP_TIME;
	FSMC_NORSRAMTimingInitStructure.FSMC_BusTurnAroundDuration = 0;
	FSMC_NORSRAMTimingInitStructure.FSMC_CLKDivision = 0;
	FSMC_NORSRAMTimingInitStructure.FSMC_DataLatency = 0;
	FSMC_NORSRAMTimingInitStructure.FSMC_AccessMode = FSMC_AccessMode_A;

	FSMC_NORSRAMInitStructure.FSMC_Bank = FSMC_Bank1_NORSRAM1;
	FSMC_NORSRAMInitStructure.FSMC_DataAddressMux = FSMC_DataAddressMux_Disable;
	FSMC_NORSRAMInitStructure.FSMC_MemoryType = FSMC_MemoryType_SRAM;
	FSMC_NORSRAMInitStructure.FSMC_MemoryDataWidth = FSMC_MemoryDataWidth_16b;
	FSMC_NORSRAMInitStructure.FSMC_BurstAccessMode = FSMC_BurstAccessMode_Disable;
	FSMC_NORSRAMInitStructure.FSMC_AsynchronousWait = FSMC_AsynchronousWait_Disable;
	FSMC_NORSRAMInitStructure.FSMC_WaitSignalPolarity = FSMC_WaitSignalPolarity_Low;
	FSMC_NORSRAMInitStructure.FSMC_WrapMode = FSMC_WrapMode_Disable;
	FSMC_NORSRAMInitStructure.FSMC_WaitSignalActive = FSMC_WaitSignalActive_BeforeWaitState;
	FSMC_NORSRAMInitStructure.FSMC_WriteOperation = FSMC_WriteOperation_Enable;
	FSMC_NORSRAMInitStructure.FSMC_WaitSignal = FSMC_WaitSignal_Disable;
	FSMC_NORSRAMInitStructure.FSMC_ExtendedMode = FSMC_ExtendedMode_Disable;
	FSMC_NORSRAMInitStructure.FSMC_WriteBurst = FSMC_WriteBurst_Disable;
	FSMC_NORSRAMInitStructure.FSMC_ReadWriteTimingStruct = &FSMC_NORSRAMTimingInitStructure;
	FSMC_NORSRAMInitStructure.FSMC_WriteTimingStruct = &FSMC_NORSRAMTimingInitStructure;

	FSMC_NORSRAMInit(&FSMC_NORSRAMInitStructure);

	FSMC_NORSRAMCmd(FSMC_Bank1_NORSRAM1, ENABLE);

	return;
}

#define REG_DRVOUTCTRL	0x0001	// driver output control

#define DRVOUTCTRL_SM	0x0400	// scanning order gate driver, 0=interlaced, 1=not interlaced
#define DRVOUTCTRL_RL	0x4000	// shift direction source driver
#define DRVOUTCTRL_REV	0x0200

static void ssd1289_controller_init() {
	int i;
	const static uint16_t init_data[45][2] = {
		                    // REGISTER           | value description
		{ 0x0007, 0x0021 },	// display control    |
		{ 0x0000, 0x0001 },	// oscillation start  |
		{ 0x0007, 0x0023 },	// display control
		{ 0x0010, 0x0000 }, // sleep mode
		{ 0x0007, 0x0033 }, // display control

#define AM	0x0008
#define ID0	0x0010
#define ID1	0x0020

		{ 0x0011, 0x6800 },	// entry mode			//

		{ 0x0002, 0x0600 },	// lcd drive ac ctrl
		{ 0x0012, 0x6CEB },	// opt access speed 3
		{ 0x0003, 0xA8A4 },	// power control 1
		{ 0x000C, 0x0000 },	// power control 2
		{ 0x000D, 0x080C },	// power control 3
		{ 0x000E, 0x2B00 }, // power control 4
		{ 0x001E, 0x00B0 }, // power control 5
		{ 0x0001, 0x2B3F }, // driver output ctrl	// portrait

		//{ 0x0001, 0x293F }, // driver output ctrl	// ?landscape

		{ 0x0005, 0x0000 }, // compare register 1
		{ 0x0006, 0x0000 }, // compare register 2
		{ 0x0016, 0xEF1C }, // horizontal porch
		{ 0x0017, 0x0103 },	// vertical porch
		{ 0x000B, 0x0000 }, // frame cycle control
		{ 0x000F, 0x0000 },	// gate scan start position
		{ 0x0041, 0x0000 },	// vertical scroll control 1
		{ 0x0042, 0x0000 },	// vertical scroll control 2
		{ 0x0048, 0x0000 }, // first window start
		{ 0x0049, 0x013F }, // first window end
		{ 0x004A, 0x0000 }, // second window start
		{ 0x004B, 0x0000 }, // second window end
		{ 0x0044, 0xEF00 }, // h ram address position
		{ 0x0045, 0x0000 }, // v ram address position
		{ 0x0046, 0x013F }, // v ram end position
		{ 0x0030, 0x0707 }, // gamma control 1
		{ 0x0031, 0x0204 }, // gamma control 2
		{ 0x0032, 0x0204 }, // gamma control 3
		{ 0x0033, 0x0502 }, // gamma control 4
		{ 0x0034, 0x0507 }, // gamma control 5
		{ 0x0035, 0x0204 }, // gamma control 6
		{ 0x0036, 0x0204 }, // gamma control 7
		{ 0x0037, 0x0502 }, // gamma control 8
		{ 0x003A, 0x0302 }, // gamma control 9
		{ 0x002F, 0x12BE }, // optimize access speed 2
		{ 0x003B, 0x0302 }, // gamma control 10
		{ 0x0023, 0x0000 }, // ram write data mask 1
		{ 0x0024, 0x0000 }, // ram write data mask 2
		{ 0x0025, 0x8000 }, // frame frequency
		{ 0x004e, 0x0000 },	// X-counter
		{ 0x004f, 0x0000 },	// Y-counter

	};

	for(i = 0; i < 44; i ++) {
		ssd1289_write_reg(init_data[i][0], init_data[i][1]);
	}

	return;
}

/* read directly from display memory */
static uint16_t ssd1289_read_reg(uint8_t reg_addr) {
	LCD_REG = reg_addr;

	return LCD_RAM;
}

/* write directly to display memory */
static void ssd1289_write_reg(uint8_t reg_addr, uint16_t reg_value) {
	LCD_REG = reg_addr;
	LCD_RAM = reg_value;

	return;
}

/* set backlight, put in 0 to 100 */
void ssd1289_bl_set(int percent) {
	TIM_OCInitTypeDef oc_bl;

	oc_bl.TIM_OCMode = TIM_OCMode_PWM1;
	oc_bl.TIM_OutputState = TIM_OutputState_Enable;
	oc_bl.TIM_Pulse = percent*10;
	oc_bl.TIM_OCPolarity = TIM_OCPolarity_High;
	TIM_OC2Init(TIM3, &oc_bl);

	bl = percent;

	return;
}

int ssd1289_bl_get() {
	return bl;
}

int ssd1289_bl_inc() {
    bl++;
    if(bl == 101)
        bl = 0;
    ssd1289_bl_set(bl);
	return bl;
}



/* backlight initialization */
void ssd1289_bl_init() {
	GPIO_InitTypeDef GPIO_InitData;
	TIM_TimeBaseInitTypeDef TimeBase_InitData;

	const uint16_t period = (uint16_t) (SystemCoreClock / 1000000) - 1;

	/* enable clock for GPIO, PWM pin and TIM3 */
	RCC_APB2PeriphClockCmd(RCC_APB2Periph_GPIOB | RCC_APB2Periph_AFIO, ENABLE);
	RCC_APB1PeriphClockCmd(RCC_APB1Periph_TIM3, ENABLE);

	/* configure PWM pin */
	GPIO_InitData.GPIO_Pin = GPIO_Pin_5;
	GPIO_InitData.GPIO_Mode = GPIO_Mode_AF_PP;
	GPIO_InitData.GPIO_Speed = GPIO_Speed_50MHz;
	GPIO_Init(GPIOB, &GPIO_InitData);
	GPIO_PinRemapConfig(GPIO_PartialRemap_TIM3, ENABLE);

	/* setup PWM */
	TimeBase_InitData.TIM_ClockDivision = 0;
	TimeBase_InitData.TIM_CounterMode = TIM_CounterMode_Up;
	TimeBase_InitData.TIM_RepetitionCounter = 0;
	TimeBase_InitData.TIM_Prescaler = period;
	TimeBase_InitData.TIM_Period = 999;
	TIM_TimeBaseInit(TIM3, &TimeBase_InitData);

	TIM_OC2PreloadConfig(TIM3, TIM_OCPreload_Enable);
	TIM_ARRPreloadConfig(TIM3, ENABLE);
	TIM_Cmd(TIM3, ENABLE);

	return;
}

