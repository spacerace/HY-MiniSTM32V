/* simple ADS7843 driver for STM32F103
 *
 *
 */
#include <stdio.h>
#include "ssd1289.h"

#include "leds.h"

#define ADS7843_BIT_PD0     0x01
#define ADS7843_BIT_PD1     0x02
#define ADS7843_BIT_SERDFR  0x04    // 1 = single ended, 0 = differential
#define ADS7843_MODE        0x08    // 1 = 12bit, 0 = 8bit
#define ADS7843_A0          0x10
#define ADS7843_A1          0x20
#define ADS7843_A2          0x40
#define ADS7843_START       0x80

#define CMD_CHX             (ADS7843_START|ADS7843_A0)
#define CMD_CHY             (ADS7843_START|ADS7843_A0|ADS7843_A2)
#define CMD_POWERDOWN       (ADS7843_START)

#define ads7843_disable()   GPIO_SetBits(GPIOA,GPIO_Pin_4)
#define ads7843_enable()    GPIO_ResetBits(GPIOA,GPIO_Pin_4)
static void ads7843_cmd(uint8_t cmd);
static uint16_t ads7843_read();

volatile static int32_t calibration_data[3][2];
volatile static int32_t calibration_points[3][2];
volatile static struct calibration_coeff {
    float a;
    float b;
    float c;
    float d;
    float e;
    float f;
} coeff;

void ads7843_set_predefined_caldata(void);
void ads7843_set_predefined_caldata(void) {
    int cal_points[3][2] = { 
                                   { 40,  40},
                                   {279, 120},
                                   {159, 199} 
                                 };
                                 
    int cal_data[3][2] =   { 
                                   {0x2f4, 0x321}, 
                                   {0xd4d, 0x802},
                                   {0x83f, 0xcea} 
                                 };
    
    ads7843_set_caldata(cal_data, cal_points);
    
}

void init_ads7843() {
    GPIO_InitTypeDef GPIO_InitStructure;
    SPI_InitTypeDef  SPI_InitStructure;

    calibration_data[0][0] = -1;
    calibration_data[0][1] = -1;
    calibration_data[1][0] = -1;
    calibration_data[1][1] = -1;
    calibration_data[2][0] = -1;
    calibration_data[2][1] = -1;

    calibration_points[0][0] = -1;
    calibration_points[0][1] = -1;
    calibration_points[1][0] = -1;
    calibration_points[1][1] = -1;
    calibration_points[2][0] = -1;
    calibration_points[2][1] = -1;


    RCC_APB2PeriphClockCmd(RCC_APB2Periph_GPIOA | RCC_APB2Periph_GPIOB | RCC_APB2Periph_GPIOD, ENABLE);

    // Miso, Mosi, Clock
    GPIO_InitStructure.GPIO_Pin = GPIO_Pin_5  | GPIO_Pin_6 | GPIO_Pin_7; 
    GPIO_InitStructure.GPIO_Mode = GPIO_Mode_AF_PP;
    GPIO_InitStructure.GPIO_Speed = GPIO_Speed_50MHz;
    GPIO_Init(GPIOA, &GPIO_InitStructure); 

    // ChipSelect
    GPIO_InitStructure.GPIO_Pin =  GPIO_Pin_4;
    GPIO_InitStructure.GPIO_Mode = GPIO_Mode_Out_PP;
    GPIO_InitStructure.GPIO_Speed = GPIO_Speed_50MHz;
    GPIO_Init(GPIOA, &GPIO_InitStructure);

    // Touchpad Interrupt Pin
    GPIO_InitStructure.GPIO_Pin =  GPIO_Pin_6;
    GPIO_InitStructure.GPIO_Mode = GPIO_Mode_IPU;
    GPIO_InitStructure.GPIO_Speed = GPIO_Speed_50MHz;
    GPIO_Init(GPIOB, &GPIO_InitStructure);    

    ads7843_disable();	// disable ads7843

    RCC_APB2PeriphClockCmd(RCC_APB2Periph_SPI1, ENABLE);

    SPI_Cmd(SPI1, DISABLE); 
    SPI_InitStructure.SPI_Direction = SPI_Direction_2Lines_FullDuplex;
    SPI_InitStructure.SPI_Mode = SPI_Mode_Master;
    SPI_InitStructure.SPI_DataSize = SPI_DataSize_8b;
    SPI_InitStructure.SPI_CPOL = SPI_CPOL_Low;
    SPI_InitStructure.SPI_CPHA = SPI_CPHA_1Edge;
    SPI_InitStructure.SPI_NSS = SPI_NSS_Soft;
    SPI_InitStructure.SPI_BaudRatePrescaler = SPI_BaudRatePrescaler_256;
    SPI_InitStructure.SPI_FirstBit = SPI_FirstBit_MSB;
    SPI_InitStructure.SPI_CRCPolynomial = 7;
    SPI_Init(SPI1, &SPI_InitStructure);
    SPI_Cmd(SPI1, ENABLE);

    //init_ads7843_irq();
    
    // here we set predefined calibration data...
    ads7843_set_predefined_caldata();

    return;
}

int ads7843_is_pressed(void) {
    return !GPIO_ReadInputDataBit(GPIOB,GPIO_Pin_6);
}

void ads7843_set_caldata(int cal_data[3][2], int cal_points[3][2]) {
    int i;

    for(i = 0; i < 3; i++) {
        calibration_data[i][0] = cal_data[i][0];
        calibration_data[i][1] = cal_data[i][1];
        calibration_points[i][0] = cal_points[i][0];
        calibration_points[i][1] = cal_points[i][1];
    }

    int32_t xd1 = (int32_t)calibration_points[0][0];
    int32_t xd2 = (int32_t)calibration_points[1][0];
    int32_t xd3 = (int32_t)calibration_points[2][0];
    int32_t yd1 = (int32_t)calibration_points[0][1];
    int32_t yd2 = (int32_t)calibration_points[1][1];
    int32_t yd3 = (int32_t)calibration_points[2][1];
    int32_t xt1 = (int32_t)calibration_data[0][0];
    int32_t xt2 = (int32_t)calibration_data[1][0];
    int32_t xt3 = (int32_t)calibration_data[2][0];
    int32_t yt1 = (int32_t)calibration_data[0][1];
    int32_t yt2 = (int32_t)calibration_data[1][1];
    int32_t yt3 = (int32_t)calibration_data[2][1];

    int32_t a1 = xd1*(yt2-yt3) + xd2*(yt3-yt1) + xd3*(yt1-yt2);
    int32_t a2 = xt1*(yt2-yt3) + xt2*(yt3-yt1) + xt3*(yt1-yt2);
    float a = ((float)a1 / (float)a2);

    int32_t b1 = a*(xt3-xt2) + xd2 - xd3;
    int32_t b2 = yt2-yt3;
    float b = ((float)b1 / (float)b2);

    float c = (xd3 - a*xt3 - b*yt3);

    int32_t d1 = yd1*(yt2-yt3) + yd2*(yt3-yt1) + yd3*(yt1-yt2);
    int32_t d2 = xt1*(yt2-yt3) + xt2*(yt3-yt1) + xt3*(yt1-yt2);
    float d = ((float)d1 / (float)d2);

    int32_t e1 = d*(xt3-xt2) + yd2 - yd3;
    int32_t e2 = yt2-yt3;
    float e = ((float)e1 / (float)e2);

    float f = ((float)yd3 - d*((float)xt3) - e*((float)yt3));

    coeff.a = a;
    coeff.b = b;
    coeff.c = c;
    coeff.d = d;
    coeff.e = e;
    coeff.f = f;

//     printf("\r\n");
//     printf("cal points 1=%03ld/%03ld 2=%03ld/%03ld 3=%03ld/%03ld\r\n", xd1, yd1, xd2, yd2, xd3, yd3);
//     printf("cal tsdata 1=%03lx/%03lx 2=%03lx/%03lx 3=%03lx/%03lx\r\n", xt1, yt1, xt2, yt2, xt3, yt3);
//     printf("cal equ1   a1=%ld,a2=%ld,b1=%ld,b2=%ld,c=%f\r\n", a1, a2, b1, b2, c);
//     printf("cal equ2   d1=%ld,d2=%ld,e1=%ld,e2=%ld,f=%f\r\n", d1, d2, e1, e2, f);
//     printf("cal coeff1 a=%f,b=%f,c=%f,d=%f,e=%f,f=%f\r\n", a, b, c, d, e, f);
//     printf("cal coeff2 a=%f,b=%f,c=%f,d=%f,e=%f,f=%f\r\n", coeff.a, coeff.b, coeff.c, coeff.d, coeff.e, coeff.f);

    return;
}

/* calculation of display coordinates from touch coordinates is done like
 * described in microchip/atmel application note AN8091/AVR341.
 */
uint32_t ads7843_get_disp_x(uint16_t tx, uint16_t ty) {
    float _xd = (coeff.a*tx + coeff.b*ty + coeff.c)*1.0;
    return (uint32_t)_xd;
}

uint32_t ads7843_get_disp_y(uint16_t tx, uint16_t ty) {
    float _yd = (coeff.d*tx + coeff.e*ty + coeff.f)*1.0;
    return (uint32_t)_yd;
}

/* ads7843_read_x + ads7843_read_y return the direct touchscreen coordinate,
 * not the effective display coordinate. After calibration data is set,
 * user wants to use ads7843_get_disp_x/ads7843_get_disp_y to get touch-
 * coordinates.
 */
uint16_t ads7843_read_x() {
    int i, j, x;

    // throw aways first reading
    if(ads7843_is_pressed()) {
        ads7843_enable();
        ads7843_cmd(CMD_CHX);
        x = ads7843_read();
        ads7843_disable();
    }

    x = 0;
    j = 0;
    for(i = 0; i < 64; i++) {
        if(ads7843_is_pressed()) {
            ads7843_enable();
            ads7843_cmd(CMD_CHX);
            x += ads7843_read();
            ads7843_disable();
            j++;
        }
    }
    x /= (j+1);

    return x;
}

uint16_t ads7843_read_y() {
	int i, j, y;

    // throw aways first reading
    if(ads7843_is_pressed()) {
        ads7843_enable();
        ads7843_cmd(CMD_CHY);
        y = ads7843_read();
        ads7843_disable();
    }

    y = 0;
    j = 0;
    for(i = 0; i < 64; i++) {
        if(ads7843_is_pressed()) {
            ads7843_enable();
            ads7843_cmd(CMD_CHY);
            y += ads7843_read();
            ads7843_disable();
            j++;
        }
    }
    y /= (j+1);

	return y;
}

static void ads7843_cmd(uint8_t command) {
	while(SPI_I2S_GetFlagStatus(SPI1, SPI_I2S_FLAG_TXE) == RESET);
	SPI_I2S_SendData(SPI1, command);
	while(SPI_I2S_GetFlagStatus(SPI1, SPI_I2S_FLAG_RXNE) == RESET);
	SPI_I2S_ReceiveData(SPI1);
}

static uint16_t ads7843_read() {
	uint16_t buf, temp; 
	
	while(SPI_I2S_GetFlagStatus(SPI1, SPI_I2S_FLAG_TXE) == RESET);
	SPI_I2S_SendData(SPI1,0x0000);
	while (SPI_I2S_GetFlagStatus(SPI1, SPI_I2S_FLAG_RXNE) == RESET);
	temp = SPI_I2S_ReceiveData(SPI1);
	buf = temp<<8;
//     systick_delay(1);
	while(SPI_I2S_GetFlagStatus(SPI1, SPI_I2S_FLAG_TXE) == RESET);
	SPI_I2S_SendData(SPI1,0x0000);
	while(SPI_I2S_GetFlagStatus(SPI1, SPI_I2S_FLAG_RXNE) == RESET);
	temp = SPI_I2S_ReceiveData(SPI1);
	
	buf |= temp; 
	buf >>= 3; 
	buf &= 0xfff; 
	
	return buf;	
}

// void init_ads7843_irq() {
// 	EXTI_InitTypeDef EXTI_InitStructure;
// 	NVIC_InitTypeDef NVIC_InitStructure; 
// 
// 
// 	NVIC_PriorityGroupConfig(NVIC_PriorityGroup_1);
// 	
// 	NVIC_InitStructure.NVIC_IRQChannel = EXTI9_5_IRQn;	 
// 	NVIC_InitStructure.NVIC_IRQChannelPreemptionPriority = 1;
// 	NVIC_InitStructure.NVIC_IRQChannelSubPriority = 1;	  
// 	NVIC_InitStructure.NVIC_IRQChannelCmd = ENABLE;
// 	NVIC_Init(&NVIC_InitStructure);	
// 	
// 	RCC_APB2PeriphClockCmd(RCC_APB2Periph_AFIO, ENABLE); 
// 
// 	GPIO_EXTILineConfig(GPIO_PortSourceGPIOB, GPIO_PinSource6);
// 	EXTI_ClearITPendingBit(EXTI_Line6);
// 
// 	EXTI_InitStructure.EXTI_Mode = EXTI_Mode_Interrupt;
// 	EXTI_InitStructure.EXTI_Trigger = EXTI_Trigger_Falling;
// 	EXTI_InitStructure.EXTI_Line = EXTI_Line6;
// 	EXTI_InitStructure.EXTI_LineCmd = ENABLE;
// 	EXTI_Init(&EXTI_InitStructure);
// 	
// 	return;
// }
// 
// void EXTI9_5_IRQHandler(void) {
//     static int led = 0;
// 
//     if(EXTI_GetITStatus(EXTI_Line6) != RESET) {
//         EXTI_ClearITPendingBit(EXTI_Line6);
//         if(led) {
//             led = 0;
//             LED1_OFF();
//         } else {
//             led = 1;
//             LED1_ON();
//         }
//     }
// //     ssd1289_bl_inc();
//     return;
// }
