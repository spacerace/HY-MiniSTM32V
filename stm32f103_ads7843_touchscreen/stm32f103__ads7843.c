#define CH_X	0x90
#define CH_Y	0xD0

void ads7843_init();
uint16_t ads7843_read_x();
uint16_t ads7843_read_y();

uint16_t ads7843_read();
uint16_t ads7843_cmd();
void ads7843_cs_clr();
void ads7843_cs_set();


void test_tp() {
	ads7843_init();
	lcd_con_puts("TouchScreenTest\n\n");
	
	char temp[32];
	for(;;) {
		sprintf(temp, "\r%05d %05d", ads7843_read_x(), ads7843_read_y());
		lcd_con_puts(temp);
		
	}
	
}



int ads7843_read_x() {
	int x;
	ads7843_cs_clr();
	ads7843_cmd(CH_X);
	x = ads7843_read();
	ads7843_cs_set();
	
	return x;
}

int ads7843_read_y() {
	int y;
	ads7843_cs_clr();
	ads7843_cmd(CH_Y);
	y = ads7843_read();
	ads7843_cs_set();
	
	return y;
}

void ads7843_cs_clr() {
	GPIO_ResetBits(GPIOA,GPIO_Pin_4);
}

void ads7843_cs_set() {
	GPIO_SetBits(GPIOA,GPIO_Pin_4);
}


void ads7843_cmd(uint8_t command) {
	while(SPI_I2S_GetFlagStatus(SPI1, SPI_I2S_FLAG_TXE) == RESET); 
	SPI_I2S_SendData(SPI1, command); 
	while(SPI_I2S_GetFlagStatus(SPI1, SPI_I2S_FLAG_RXNE) == RESET); 
	SPI_I2S_ReceiveData(SPI1); 	
}

uint16_t ads7843_read() {
	uint16_t buf,temp; 
	
	while (SPI_I2S_GetFlagStatus(SPI1, SPI_I2S_FLAG_TXE) == RESET); 
	SPI_I2S_SendData(SPI1,0x0000); 
	while (SPI_I2S_GetFlagStatus(SPI1, SPI_I2S_FLAG_RXNE) == RESET); 
	temp = SPI_I2S_ReceiveData(SPI1); 
	buf = temp<<8; 
	while (SPI_I2S_GetFlagStatus(SPI1, SPI_I2S_FLAG_TXE) == RESET); 
	SPI_I2S_SendData(SPI1,0x0000); 
	while (SPI_I2S_GetFlagStatus(SPI1, SPI_I2S_FLAG_RXNE) == RESET); 
	temp = SPI_I2S_ReceiveData(SPI1); 
	
	buf |= temp; 
	buf >>= 3; 
	buf &= 0xfff; 
	
	return buf;	
}

void ads7843_init() {
	GPIO_InitTypeDef GPIO_InitStructure;
	SPI_InitTypeDef  SPI_InitStructure;

	RCC_APB2PeriphClockCmd(RCC_APB2Periph_SPI1, ENABLE);
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
	GPIO_InitStructure.GPIO_Pin =  GPIO_Pin_6 ;
	GPIO_InitStructure.GPIO_Mode = GPIO_Mode_IPU ;
	GPIO_InitStructure.GPIO_Speed = GPIO_Speed_50MHz;
	GPIO_Init(GPIOB, &GPIO_InitStructure);
  
	ads7843_cs_set();	// disable ads7843
	
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
}
