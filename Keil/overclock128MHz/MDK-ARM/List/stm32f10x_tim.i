#line 1 "..\\Libraries\\STM32F10x_StdPeriph_Driver\\src\\stm32f10x_tim.c"


















  

 
#line 1 "..\\Libraries\\STM32F10x_StdPeriph_Driver\\inc\\stm32f10x_tim.h"



















  

 







 
#line 1 "..\\Libraries\\CMSIS\\CM3\\DeviceSupport\\ST\\STM32F10x\\stm32f10x.h"























 



 



 
    






  


 
  


 


         
        
         
        

        
         
         



















 










 









            
#line 106 "..\\Libraries\\CMSIS\\CM3\\DeviceSupport\\ST\\STM32F10x\\stm32f10x.h"





 






 
#line 125 "..\\Libraries\\CMSIS\\CM3\\DeviceSupport\\ST\\STM32F10x\\stm32f10x.h"



 



 



 
#line 144 "..\\Libraries\\CMSIS\\CM3\\DeviceSupport\\ST\\STM32F10x\\stm32f10x.h"




 
typedef enum IRQn
{
 
  NonMaskableInt_IRQn         = -14,     
  MemoryManagement_IRQn       = -12,     
  BusFault_IRQn               = -11,     
  UsageFault_IRQn             = -10,     
  SVCall_IRQn                 = -5,      
  DebugMonitor_IRQn           = -4,      
  PendSV_IRQn                 = -2,      
  SysTick_IRQn                = -1,      

 
  WWDG_IRQn                   = 0,       
  PVD_IRQn                    = 1,       
  TAMPER_IRQn                 = 2,       
  RTC_IRQn                    = 3,       
  FLASH_IRQn                  = 4,       
  RCC_IRQn                    = 5,       
  EXTI0_IRQn                  = 6,       
  EXTI1_IRQn                  = 7,       
  EXTI2_IRQn                  = 8,       
  EXTI3_IRQn                  = 9,       
  EXTI4_IRQn                  = 10,      
  DMA1_Channel1_IRQn          = 11,      
  DMA1_Channel2_IRQn          = 12,      
  DMA1_Channel3_IRQn          = 13,      
  DMA1_Channel4_IRQn          = 14,      
  DMA1_Channel5_IRQn          = 15,      
  DMA1_Channel6_IRQn          = 16,      
  DMA1_Channel7_IRQn          = 17,      

#line 203 "..\\Libraries\\CMSIS\\CM3\\DeviceSupport\\ST\\STM32F10x\\stm32f10x.h"

#line 224 "..\\Libraries\\CMSIS\\CM3\\DeviceSupport\\ST\\STM32F10x\\stm32f10x.h"

#line 252 "..\\Libraries\\CMSIS\\CM3\\DeviceSupport\\ST\\STM32F10x\\stm32f10x.h"

#line 278 "..\\Libraries\\CMSIS\\CM3\\DeviceSupport\\ST\\STM32F10x\\stm32f10x.h"


  ADC1_2_IRQn                 = 18,      
  USB_HP_CAN1_TX_IRQn         = 19,      
  USB_LP_CAN1_RX0_IRQn        = 20,      
  CAN1_RX1_IRQn               = 21,      
  CAN1_SCE_IRQn               = 22,      
  EXTI9_5_IRQn                = 23,      
  TIM1_BRK_IRQn               = 24,      
  TIM1_UP_IRQn                = 25,      
  TIM1_TRG_COM_IRQn           = 26,      
  TIM1_CC_IRQn                = 27,      
  TIM2_IRQn                   = 28,      
  TIM3_IRQn                   = 29,      
  TIM4_IRQn                   = 30,      
  I2C1_EV_IRQn                = 31,      
  I2C1_ER_IRQn                = 32,      
  I2C2_EV_IRQn                = 33,      
  I2C2_ER_IRQn                = 34,      
  SPI1_IRQn                   = 35,      
  SPI2_IRQn                   = 36,      
  USART1_IRQn                 = 37,      
  USART2_IRQn                 = 38,      
  USART3_IRQn                 = 39,      
  EXTI15_10_IRQn              = 40,      
  RTCAlarm_IRQn               = 41,      
  USBWakeUp_IRQn              = 42,      
  TIM8_BRK_IRQn               = 43,      
  TIM8_UP_IRQn                = 44,      
  TIM8_TRG_COM_IRQn           = 45,      
  TIM8_CC_IRQn                = 46,      
  ADC3_IRQn                   = 47,      
  FSMC_IRQn                   = 48,      
  SDIO_IRQn                   = 49,      
  TIM5_IRQn                   = 50,      
  SPI3_IRQn                   = 51,      
  UART4_IRQn                  = 52,      
  UART5_IRQn                  = 53,      
  TIM6_IRQn                   = 54,      
  TIM7_IRQn                   = 55,      
  DMA2_Channel1_IRQn          = 56,      
  DMA2_Channel2_IRQn          = 57,      
  DMA2_Channel3_IRQn          = 58,      
  DMA2_Channel4_5_IRQn        = 59       


#line 364 "..\\Libraries\\CMSIS\\CM3\\DeviceSupport\\ST\\STM32F10x\\stm32f10x.h"

#line 409 "..\\Libraries\\CMSIS\\CM3\\DeviceSupport\\ST\\STM32F10x\\stm32f10x.h"

#line 455 "..\\Libraries\\CMSIS\\CM3\\DeviceSupport\\ST\\STM32F10x\\stm32f10x.h"
} IRQn_Type;



 

#line 1 "..\\Libraries\\CMSIS\\CM3\\CoreSupport\\core_cm3.h"
 




















 





































 

 
 
 
 
 
 
 
 








 











#line 1 "C:\\Documents and Settings\\XP Virtual PC\\Desktop\\keil\\ARM\\ARMCC\\Bin\\..\\include\\stdint.h"
 
 





 









     
#line 27 "C:\\Documents and Settings\\XP Virtual PC\\Desktop\\keil\\ARM\\ARMCC\\Bin\\..\\include\\stdint.h"
     











#line 46 "C:\\Documents and Settings\\XP Virtual PC\\Desktop\\keil\\ARM\\ARMCC\\Bin\\..\\include\\stdint.h"





 

     

     
typedef   signed          char int8_t;
typedef   signed short     int int16_t;
typedef   signed           int int32_t;
typedef   signed       __int64 int64_t;

     
typedef unsigned          char uint8_t;
typedef unsigned short     int uint16_t;
typedef unsigned           int uint32_t;
typedef unsigned       __int64 uint64_t;

     

     
     
typedef   signed          char int_least8_t;
typedef   signed short     int int_least16_t;
typedef   signed           int int_least32_t;
typedef   signed       __int64 int_least64_t;

     
typedef unsigned          char uint_least8_t;
typedef unsigned short     int uint_least16_t;
typedef unsigned           int uint_least32_t;
typedef unsigned       __int64 uint_least64_t;

     

     
typedef   signed           int int_fast8_t;
typedef   signed           int int_fast16_t;
typedef   signed           int int_fast32_t;
typedef   signed       __int64 int_fast64_t;

     
typedef unsigned           int uint_fast8_t;
typedef unsigned           int uint_fast16_t;
typedef unsigned           int uint_fast32_t;
typedef unsigned       __int64 uint_fast64_t;

     




typedef   signed           int intptr_t;
typedef unsigned           int uintptr_t;


     
typedef   signed     long long intmax_t;
typedef unsigned     long long uintmax_t;




     

     





     





     





     

     





     





     





     

     





     





     





     

     






     






     






     

     


     


     


     

     
#line 216 "C:\\Documents and Settings\\XP Virtual PC\\Desktop\\keil\\ARM\\ARMCC\\Bin\\..\\include\\stdint.h"

     



     






     
    
 



#line 241 "C:\\Documents and Settings\\XP Virtual PC\\Desktop\\keil\\ARM\\ARMCC\\Bin\\..\\include\\stdint.h"

     







     










     











#line 305 "C:\\Documents and Settings\\XP Virtual PC\\Desktop\\keil\\ARM\\ARMCC\\Bin\\..\\include\\stdint.h"






 
#line 91 "..\\Libraries\\CMSIS\\CM3\\CoreSupport\\core_cm3.h"

















 

#line 117 "..\\Libraries\\CMSIS\\CM3\\CoreSupport\\core_cm3.h"





 


 





 
typedef struct
{
  volatile uint32_t ISER[8];                       
       uint32_t RESERVED0[24];                                   
  volatile uint32_t ICER[8];                       
       uint32_t RSERVED1[24];                                    
  volatile uint32_t ISPR[8];                       
       uint32_t RESERVED2[24];                                   
  volatile uint32_t ICPR[8];                       
       uint32_t RESERVED3[24];                                   
  volatile uint32_t IABR[8];                       
       uint32_t RESERVED4[56];                                   
  volatile uint8_t  IP[240];                       
       uint32_t RESERVED5[644];                                  
  volatile  uint32_t STIR;                          
}  NVIC_Type;                                               
   





 
typedef struct
{
  volatile const  uint32_t CPUID;                         
  volatile uint32_t ICSR;                          
  volatile uint32_t VTOR;                          
  volatile uint32_t AIRCR;                         
  volatile uint32_t SCR;                           
  volatile uint32_t CCR;                           
  volatile uint8_t  SHP[12];                       
  volatile uint32_t SHCSR;                         
  volatile uint32_t CFSR;                          
  volatile uint32_t HFSR;                          
  volatile uint32_t DFSR;                          
  volatile uint32_t MMFAR;                         
  volatile uint32_t BFAR;                          
  volatile uint32_t AFSR;                          
  volatile const  uint32_t PFR[2];                        
  volatile const  uint32_t DFR;                           
  volatile const  uint32_t ADR;                           
  volatile const  uint32_t MMFR[4];                       
  volatile const  uint32_t ISAR[5];                       
} SCB_Type;                                                

 












 






























 






 





















 









 


















 
































                                     









 









 









 














   





 
typedef struct
{
  volatile uint32_t CTRL;                          
  volatile uint32_t LOAD;                          
  volatile uint32_t VAL;                           
  volatile const  uint32_t CALIB;                         
} SysTick_Type;

 












 



 



 








   





 
typedef struct
{
  volatile  union  
  {
    volatile  uint8_t    u8;                        
    volatile  uint16_t   u16;                       
    volatile  uint32_t   u32;                       
  }  PORT [32];                                
       uint32_t RESERVED0[864];                                 
  volatile uint32_t TER;                           
       uint32_t RESERVED1[15];                                  
  volatile uint32_t TPR;                           
       uint32_t RESERVED2[15];                                  
  volatile uint32_t TCR;                           
       uint32_t RESERVED3[29];                                  
  volatile uint32_t IWR;                           
  volatile uint32_t IRR;                           
  volatile uint32_t IMCR;                          
       uint32_t RESERVED4[43];                                  
  volatile uint32_t LAR;                           
  volatile uint32_t LSR;                           
       uint32_t RESERVED5[6];                                   
  volatile const  uint32_t PID4;                          
  volatile const  uint32_t PID5;                          
  volatile const  uint32_t PID6;                          
  volatile const  uint32_t PID7;                          
  volatile const  uint32_t PID0;                          
  volatile const  uint32_t PID1;                          
  volatile const  uint32_t PID2;                          
  volatile const  uint32_t PID3;                          
  volatile const  uint32_t CID0;                          
  volatile const  uint32_t CID1;                          
  volatile const  uint32_t CID2;                          
  volatile const  uint32_t CID3;                          
} ITM_Type;                                                

 



 
























 



 



 



 








   





 
typedef struct
{
       uint32_t RESERVED0;
  volatile const  uint32_t ICTR;                          



       uint32_t RESERVED1;

} InterruptType_Type;

 



 








   


#line 614 "..\\Libraries\\CMSIS\\CM3\\CoreSupport\\core_cm3.h"





 
typedef struct
{
  volatile uint32_t DHCSR;                         
  volatile  uint32_t DCRSR;                         
  volatile uint32_t DCRDR;                         
  volatile uint32_t DEMCR;                         
} CoreDebug_Type;

 




































 






 






































   


 
#line 721 "..\\Libraries\\CMSIS\\CM3\\CoreSupport\\core_cm3.h"

#line 728 "..\\Libraries\\CMSIS\\CM3\\CoreSupport\\core_cm3.h"






   




 





#line 758 "..\\Libraries\\CMSIS\\CM3\\CoreSupport\\core_cm3.h"


 


 




#line 783 "..\\Libraries\\CMSIS\\CM3\\CoreSupport\\core_cm3.h"


 
 
 
 








 
extern uint32_t __get_PSP(void);








 
extern void __set_PSP(uint32_t topOfProcStack);








 
extern uint32_t __get_MSP(void);








 
extern void __set_MSP(uint32_t topOfMainStack);








 
extern uint32_t __REV16(uint16_t value);








 
extern int32_t __REVSH(int16_t value);


#line 933 "..\\Libraries\\CMSIS\\CM3\\CoreSupport\\core_cm3.h"





 








 
static __inline uint32_t  __get_BASEPRI(void)
{
  register uint32_t __regBasePri         __asm("basepri");
  return(__regBasePri);
}







 
static __inline void __set_BASEPRI(uint32_t basePri)
{
  register uint32_t __regBasePri         __asm("basepri");
  __regBasePri = (basePri & 0xff);
}







 
static __inline uint32_t __get_PRIMASK(void)
{
  register uint32_t __regPriMask         __asm("primask");
  return(__regPriMask);
}







 
static __inline void __set_PRIMASK(uint32_t priMask)
{
  register uint32_t __regPriMask         __asm("primask");
  __regPriMask = (priMask);
}







 
static __inline uint32_t __get_FAULTMASK(void)
{
  register uint32_t __regFaultMask       __asm("faultmask");
  return(__regFaultMask);
}







 
static __inline void __set_FAULTMASK(uint32_t faultMask)
{
  register uint32_t __regFaultMask       __asm("faultmask");
  __regFaultMask = (faultMask & 1);
}







 
static __inline uint32_t __get_CONTROL(void)
{
  register uint32_t __regControl         __asm("control");
  return(__regControl);
}







 
static __inline void __set_CONTROL(uint32_t control)
{
  register uint32_t __regControl         __asm("control");
  __regControl = control;
}





#line 1445 "..\\Libraries\\CMSIS\\CM3\\CoreSupport\\core_cm3.h"







 
 

 











 
static __inline void NVIC_SetPriorityGrouping(uint32_t PriorityGroup)
{
  uint32_t reg_value;
  uint32_t PriorityGroupTmp = (PriorityGroup & 0x07);                          
  
  reg_value  =  ((SCB_Type *) ((0xE000E000) + 0x0D00))->AIRCR;                                                    
  reg_value &= ~((0xFFFFul << 16) | (7ul << 8));              
  reg_value  =  (reg_value                       |
                (0x5FA << 16) | 
                (PriorityGroupTmp << 8));                                      
  ((SCB_Type *) ((0xE000E000) + 0x0D00))->AIRCR =  reg_value;
}








 
static __inline uint32_t NVIC_GetPriorityGrouping(void)
{
  return ((((SCB_Type *) ((0xE000E000) + 0x0D00))->AIRCR & (7ul << 8)) >> 8);    
}








 
static __inline void NVIC_EnableIRQ(IRQn_Type IRQn)
{
  ((NVIC_Type *) ((0xE000E000) + 0x0100))->ISER[((uint32_t)(IRQn) >> 5)] = (1 << ((uint32_t)(IRQn) & 0x1F));  
}








 
static __inline void NVIC_DisableIRQ(IRQn_Type IRQn)
{
  ((NVIC_Type *) ((0xE000E000) + 0x0100))->ICER[((uint32_t)(IRQn) >> 5)] = (1 << ((uint32_t)(IRQn) & 0x1F));  
}









 
static __inline uint32_t NVIC_GetPendingIRQ(IRQn_Type IRQn)
{
  return((uint32_t) ((((NVIC_Type *) ((0xE000E000) + 0x0100))->ISPR[(uint32_t)(IRQn) >> 5] & (1 << ((uint32_t)(IRQn) & 0x1F)))?1:0));  
}








 
static __inline void NVIC_SetPendingIRQ(IRQn_Type IRQn)
{
  ((NVIC_Type *) ((0xE000E000) + 0x0100))->ISPR[((uint32_t)(IRQn) >> 5)] = (1 << ((uint32_t)(IRQn) & 0x1F));  
}








 
static __inline void NVIC_ClearPendingIRQ(IRQn_Type IRQn)
{
  ((NVIC_Type *) ((0xE000E000) + 0x0100))->ICPR[((uint32_t)(IRQn) >> 5)] = (1 << ((uint32_t)(IRQn) & 0x1F));  
}









 
static __inline uint32_t NVIC_GetActive(IRQn_Type IRQn)
{
  return((uint32_t)((((NVIC_Type *) ((0xE000E000) + 0x0100))->IABR[(uint32_t)(IRQn) >> 5] & (1 << ((uint32_t)(IRQn) & 0x1F)))?1:0));  
}












 
static __inline void NVIC_SetPriority(IRQn_Type IRQn, uint32_t priority)
{
  if(IRQn < 0) {
    ((SCB_Type *) ((0xE000E000) + 0x0D00))->SHP[((uint32_t)(IRQn) & 0xF)-4] = ((priority << (8 - 4)) & 0xff); }  
  else {
    ((NVIC_Type *) ((0xE000E000) + 0x0100))->IP[(uint32_t)(IRQn)] = ((priority << (8 - 4)) & 0xff);    }         
}















 
static __inline uint32_t NVIC_GetPriority(IRQn_Type IRQn)
{

  if(IRQn < 0) {
    return((uint32_t)(((SCB_Type *) ((0xE000E000) + 0x0D00))->SHP[((uint32_t)(IRQn) & 0xF)-4] >> (8 - 4)));  }  
  else {
    return((uint32_t)(((NVIC_Type *) ((0xE000E000) + 0x0100))->IP[(uint32_t)(IRQn)]           >> (8 - 4)));  }  
}
















 
static __inline uint32_t NVIC_EncodePriority (uint32_t PriorityGroup, uint32_t PreemptPriority, uint32_t SubPriority)
{
  uint32_t PriorityGroupTmp = (PriorityGroup & 0x07);           
  uint32_t PreemptPriorityBits;
  uint32_t SubPriorityBits;

  PreemptPriorityBits = ((7 - PriorityGroupTmp) > 4) ? 4 : 7 - PriorityGroupTmp;
  SubPriorityBits     = ((PriorityGroupTmp + 4) < 7) ? 0 : PriorityGroupTmp - 7 + 4;
 
  return (
           ((PreemptPriority & ((1 << (PreemptPriorityBits)) - 1)) << SubPriorityBits) |
           ((SubPriority     & ((1 << (SubPriorityBits    )) - 1)))
         );
}
















 
static __inline void NVIC_DecodePriority (uint32_t Priority, uint32_t PriorityGroup, uint32_t* pPreemptPriority, uint32_t* pSubPriority)
{
  uint32_t PriorityGroupTmp = (PriorityGroup & 0x07);           
  uint32_t PreemptPriorityBits;
  uint32_t SubPriorityBits;

  PreemptPriorityBits = ((7 - PriorityGroupTmp) > 4) ? 4 : 7 - PriorityGroupTmp;
  SubPriorityBits     = ((PriorityGroupTmp + 4) < 7) ? 0 : PriorityGroupTmp - 7 + 4;
  
  *pPreemptPriority = (Priority >> SubPriorityBits) & ((1 << (PreemptPriorityBits)) - 1);
  *pSubPriority     = (Priority                   ) & ((1 << (SubPriorityBits    )) - 1);
}



 












 
static __inline uint32_t SysTick_Config(uint32_t ticks)
{ 
  if (ticks > (0xFFFFFFul << 0))  return (1);             
                                                               
  ((SysTick_Type *) ((0xE000E000) + 0x0010))->LOAD  = (ticks & (0xFFFFFFul << 0)) - 1;       
  NVIC_SetPriority (SysTick_IRQn, (1<<4) - 1);   
  ((SysTick_Type *) ((0xE000E000) + 0x0010))->VAL   = 0;                                           
  ((SysTick_Type *) ((0xE000E000) + 0x0010))->CTRL  = (1ul << 2) | 
                   (1ul << 1)   | 
                   (1ul << 0);                     
  return (0);                                                   
}






 





 
static __inline void NVIC_SystemReset(void)
{
  ((SCB_Type *) ((0xE000E000) + 0x0D00))->AIRCR  = ((0x5FA << 16)      | 
                 (((SCB_Type *) ((0xE000E000) + 0x0D00))->AIRCR & (7ul << 8)) | 
                 (1ul << 2));                    
  __dsb(0);                                                                    
  while(1);                                                     
}

   



 






 
 

extern volatile int ITM_RxBuffer;                     












 
static __inline uint32_t ITM_SendChar (uint32_t ch)
{
  if ((((CoreDebug_Type *) (0xE000EDF0))->DEMCR & (1ul << 24))  &&       
      (((ITM_Type *) (0xE0000000))->TCR & (1ul << 0))                  &&       
      (((ITM_Type *) (0xE0000000))->TER & (1ul << 0)        )                    )      
  {
    while (((ITM_Type *) (0xE0000000))->PORT[0].u32 == 0);
    ((ITM_Type *) (0xE0000000))->PORT[0].u8 = (uint8_t) ch;
  }  
  return (ch);
}










 
static __inline int ITM_ReceiveChar (void) {
  int ch = -1;                                

  if (ITM_RxBuffer != 0x5AA55AA5) {
    ch = ITM_RxBuffer;
    ITM_RxBuffer = 0x5AA55AA5;        
  }
  
  return (ch); 
}









 
static __inline int ITM_CheckChar (void) {

  if (ITM_RxBuffer == 0x5AA55AA5) {
    return (0);                                  
  } else {
    return (1);                                  
  }
}

   






   



 
#line 462 "..\\Libraries\\CMSIS\\CM3\\DeviceSupport\\ST\\STM32F10x\\stm32f10x.h"
#line 1 "..\\Libraries\\CMSIS\\CM3\\DeviceSupport\\ST\\STM32F10x\\system_stm32f10x.h"


















 



 



   
  


 









 



 




 

extern uint32_t SystemCoreClock;           



 



 



 



 



 



 
  
extern void SystemInit(void);
extern void SystemCoreClockUpdate(void);


 









 
  


   
 
#line 463 "..\\Libraries\\CMSIS\\CM3\\DeviceSupport\\ST\\STM32F10x\\stm32f10x.h"
#line 464 "..\\Libraries\\CMSIS\\CM3\\DeviceSupport\\ST\\STM32F10x\\stm32f10x.h"



   

 
typedef int32_t  s32;
typedef int16_t s16;
typedef int8_t  s8;

typedef const int32_t sc32;   
typedef const int16_t sc16;   
typedef const int8_t sc8;    

typedef volatile int32_t  vs32;
typedef volatile int16_t  vs16;
typedef volatile int8_t   vs8;

typedef volatile const int32_t vsc32;   
typedef volatile const int16_t vsc16;   
typedef volatile const int8_t vsc8;    

typedef uint32_t  u32;
typedef uint16_t u16;
typedef uint8_t  u8;

typedef const uint32_t uc32;   
typedef const uint16_t uc16;   
typedef const uint8_t uc8;    

typedef volatile uint32_t  vu32;
typedef volatile uint16_t vu16;
typedef volatile uint8_t  vu8;

typedef volatile const uint32_t vuc32;   
typedef volatile const uint16_t vuc16;   
typedef volatile const uint8_t vuc8;    

typedef enum {RESET = 0, SET = !RESET} FlagStatus, ITStatus;

typedef enum {DISABLE = 0, ENABLE = !DISABLE} FunctionalState;


typedef enum {ERROR = 0, SUCCESS = !ERROR} ErrorStatus;

 





 



    



 

typedef struct
{
  volatile uint32_t SR;
  volatile uint32_t CR1;
  volatile uint32_t CR2;
  volatile uint32_t SMPR1;
  volatile uint32_t SMPR2;
  volatile uint32_t JOFR1;
  volatile uint32_t JOFR2;
  volatile uint32_t JOFR3;
  volatile uint32_t JOFR4;
  volatile uint32_t HTR;
  volatile uint32_t LTR;
  volatile uint32_t SQR1;
  volatile uint32_t SQR2;
  volatile uint32_t SQR3;
  volatile uint32_t JSQR;
  volatile uint32_t JDR1;
  volatile uint32_t JDR2;
  volatile uint32_t JDR3;
  volatile uint32_t JDR4;
  volatile uint32_t DR;
} ADC_TypeDef;



 

typedef struct
{
  uint32_t  RESERVED0;
  volatile uint16_t DR1;
  uint16_t  RESERVED1;
  volatile uint16_t DR2;
  uint16_t  RESERVED2;
  volatile uint16_t DR3;
  uint16_t  RESERVED3;
  volatile uint16_t DR4;
  uint16_t  RESERVED4;
  volatile uint16_t DR5;
  uint16_t  RESERVED5;
  volatile uint16_t DR6;
  uint16_t  RESERVED6;
  volatile uint16_t DR7;
  uint16_t  RESERVED7;
  volatile uint16_t DR8;
  uint16_t  RESERVED8;
  volatile uint16_t DR9;
  uint16_t  RESERVED9;
  volatile uint16_t DR10;
  uint16_t  RESERVED10; 
  volatile uint16_t RTCCR;
  uint16_t  RESERVED11;
  volatile uint16_t CR;
  uint16_t  RESERVED12;
  volatile uint16_t CSR;
  uint16_t  RESERVED13[5];
  volatile uint16_t DR11;
  uint16_t  RESERVED14;
  volatile uint16_t DR12;
  uint16_t  RESERVED15;
  volatile uint16_t DR13;
  uint16_t  RESERVED16;
  volatile uint16_t DR14;
  uint16_t  RESERVED17;
  volatile uint16_t DR15;
  uint16_t  RESERVED18;
  volatile uint16_t DR16;
  uint16_t  RESERVED19;
  volatile uint16_t DR17;
  uint16_t  RESERVED20;
  volatile uint16_t DR18;
  uint16_t  RESERVED21;
  volatile uint16_t DR19;
  uint16_t  RESERVED22;
  volatile uint16_t DR20;
  uint16_t  RESERVED23;
  volatile uint16_t DR21;
  uint16_t  RESERVED24;
  volatile uint16_t DR22;
  uint16_t  RESERVED25;
  volatile uint16_t DR23;
  uint16_t  RESERVED26;
  volatile uint16_t DR24;
  uint16_t  RESERVED27;
  volatile uint16_t DR25;
  uint16_t  RESERVED28;
  volatile uint16_t DR26;
  uint16_t  RESERVED29;
  volatile uint16_t DR27;
  uint16_t  RESERVED30;
  volatile uint16_t DR28;
  uint16_t  RESERVED31;
  volatile uint16_t DR29;
  uint16_t  RESERVED32;
  volatile uint16_t DR30;
  uint16_t  RESERVED33; 
  volatile uint16_t DR31;
  uint16_t  RESERVED34;
  volatile uint16_t DR32;
  uint16_t  RESERVED35;
  volatile uint16_t DR33;
  uint16_t  RESERVED36;
  volatile uint16_t DR34;
  uint16_t  RESERVED37;
  volatile uint16_t DR35;
  uint16_t  RESERVED38;
  volatile uint16_t DR36;
  uint16_t  RESERVED39;
  volatile uint16_t DR37;
  uint16_t  RESERVED40;
  volatile uint16_t DR38;
  uint16_t  RESERVED41;
  volatile uint16_t DR39;
  uint16_t  RESERVED42;
  volatile uint16_t DR40;
  uint16_t  RESERVED43;
  volatile uint16_t DR41;
  uint16_t  RESERVED44;
  volatile uint16_t DR42;
  uint16_t  RESERVED45;    
} BKP_TypeDef;
  


 

typedef struct
{
  volatile uint32_t TIR;
  volatile uint32_t TDTR;
  volatile uint32_t TDLR;
  volatile uint32_t TDHR;
} CAN_TxMailBox_TypeDef;



 
  
typedef struct
{
  volatile uint32_t RIR;
  volatile uint32_t RDTR;
  volatile uint32_t RDLR;
  volatile uint32_t RDHR;
} CAN_FIFOMailBox_TypeDef;



 
  
typedef struct
{
  volatile uint32_t FR1;
  volatile uint32_t FR2;
} CAN_FilterRegister_TypeDef;



 
  
typedef struct
{
  volatile uint32_t MCR;
  volatile uint32_t MSR;
  volatile uint32_t TSR;
  volatile uint32_t RF0R;
  volatile uint32_t RF1R;
  volatile uint32_t IER;
  volatile uint32_t ESR;
  volatile uint32_t BTR;
  uint32_t  RESERVED0[88];
  CAN_TxMailBox_TypeDef sTxMailBox[3];
  CAN_FIFOMailBox_TypeDef sFIFOMailBox[2];
  uint32_t  RESERVED1[12];
  volatile uint32_t FMR;
  volatile uint32_t FM1R;
  uint32_t  RESERVED2;
  volatile uint32_t FS1R;
  uint32_t  RESERVED3;
  volatile uint32_t FFA1R;
  uint32_t  RESERVED4;
  volatile uint32_t FA1R;
  uint32_t  RESERVED5[8];

  CAN_FilterRegister_TypeDef sFilterRegister[14];



} CAN_TypeDef;



 
typedef struct
{
  volatile uint32_t CFGR;
  volatile uint32_t OAR;
  volatile uint32_t PRES;
  volatile uint32_t ESR;
  volatile uint32_t CSR;
  volatile uint32_t TXD;
  volatile uint32_t RXD;  
} CEC_TypeDef;



 

typedef struct
{
  volatile uint32_t DR;
  volatile uint8_t  IDR;
  uint8_t   RESERVED0;
  uint16_t  RESERVED1;
  volatile uint32_t CR;
} CRC_TypeDef;



 

typedef struct
{
  volatile uint32_t CR;
  volatile uint32_t SWTRIGR;
  volatile uint32_t DHR12R1;
  volatile uint32_t DHR12L1;
  volatile uint32_t DHR8R1;
  volatile uint32_t DHR12R2;
  volatile uint32_t DHR12L2;
  volatile uint32_t DHR8R2;
  volatile uint32_t DHR12RD;
  volatile uint32_t DHR12LD;
  volatile uint32_t DHR8RD;
  volatile uint32_t DOR1;
  volatile uint32_t DOR2;



} DAC_TypeDef;



 

typedef struct
{
  volatile uint32_t IDCODE;
  volatile uint32_t CR;	
}DBGMCU_TypeDef;



 

typedef struct
{
  volatile uint32_t CCR;
  volatile uint32_t CNDTR;
  volatile uint32_t CPAR;
  volatile uint32_t CMAR;
} DMA_Channel_TypeDef;

typedef struct
{
  volatile uint32_t ISR;
  volatile uint32_t IFCR;
} DMA_TypeDef;



 

typedef struct
{
  volatile uint32_t MACCR;
  volatile uint32_t MACFFR;
  volatile uint32_t MACHTHR;
  volatile uint32_t MACHTLR;
  volatile uint32_t MACMIIAR;
  volatile uint32_t MACMIIDR;
  volatile uint32_t MACFCR;
  volatile uint32_t MACVLANTR;              
       uint32_t RESERVED0[2];
  volatile uint32_t MACRWUFFR;              
  volatile uint32_t MACPMTCSR;
       uint32_t RESERVED1[2];
  volatile uint32_t MACSR;                  
  volatile uint32_t MACIMR;
  volatile uint32_t MACA0HR;
  volatile uint32_t MACA0LR;
  volatile uint32_t MACA1HR;
  volatile uint32_t MACA1LR;
  volatile uint32_t MACA2HR;
  volatile uint32_t MACA2LR;
  volatile uint32_t MACA3HR;
  volatile uint32_t MACA3LR;                
       uint32_t RESERVED2[40];
  volatile uint32_t MMCCR;                  
  volatile uint32_t MMCRIR;
  volatile uint32_t MMCTIR;
  volatile uint32_t MMCRIMR;
  volatile uint32_t MMCTIMR;                
       uint32_t RESERVED3[14];
  volatile uint32_t MMCTGFSCCR;             
  volatile uint32_t MMCTGFMSCCR;
       uint32_t RESERVED4[5];
  volatile uint32_t MMCTGFCR;
       uint32_t RESERVED5[10];
  volatile uint32_t MMCRFCECR;
  volatile uint32_t MMCRFAECR;
       uint32_t RESERVED6[10];
  volatile uint32_t MMCRGUFCR;
       uint32_t RESERVED7[334];
  volatile uint32_t PTPTSCR;
  volatile uint32_t PTPSSIR;
  volatile uint32_t PTPTSHR;
  volatile uint32_t PTPTSLR;
  volatile uint32_t PTPTSHUR;
  volatile uint32_t PTPTSLUR;
  volatile uint32_t PTPTSAR;
  volatile uint32_t PTPTTHR;
  volatile uint32_t PTPTTLR;
       uint32_t RESERVED8[567];
  volatile uint32_t DMABMR;
  volatile uint32_t DMATPDR;
  volatile uint32_t DMARPDR;
  volatile uint32_t DMARDLAR;
  volatile uint32_t DMATDLAR;
  volatile uint32_t DMASR;
  volatile uint32_t DMAOMR;
  volatile uint32_t DMAIER;
  volatile uint32_t DMAMFBOCR;
       uint32_t RESERVED9[9];
  volatile uint32_t DMACHTDR;
  volatile uint32_t DMACHRDR;
  volatile uint32_t DMACHTBAR;
  volatile uint32_t DMACHRBAR;
} ETH_TypeDef;



 

typedef struct
{
  volatile uint32_t IMR;
  volatile uint32_t EMR;
  volatile uint32_t RTSR;
  volatile uint32_t FTSR;
  volatile uint32_t SWIER;
  volatile uint32_t PR;
} EXTI_TypeDef;



 

typedef struct
{
  volatile uint32_t ACR;
  volatile uint32_t KEYR;
  volatile uint32_t OPTKEYR;
  volatile uint32_t SR;
  volatile uint32_t CR;
  volatile uint32_t AR;
  volatile uint32_t RESERVED;
  volatile uint32_t OBR;
  volatile uint32_t WRPR;
#line 903 "..\\Libraries\\CMSIS\\CM3\\DeviceSupport\\ST\\STM32F10x\\stm32f10x.h"
} FLASH_TypeDef;



 
  
typedef struct
{
  volatile uint16_t RDP;
  volatile uint16_t USER;
  volatile uint16_t Data0;
  volatile uint16_t Data1;
  volatile uint16_t WRP0;
  volatile uint16_t WRP1;
  volatile uint16_t WRP2;
  volatile uint16_t WRP3;
} OB_TypeDef;



 

typedef struct
{
  volatile uint32_t BTCR[8];   
} FSMC_Bank1_TypeDef; 



 
  
typedef struct
{
  volatile uint32_t BWTR[7];
} FSMC_Bank1E_TypeDef;



 
  
typedef struct
{
  volatile uint32_t PCR2;
  volatile uint32_t SR2;
  volatile uint32_t PMEM2;
  volatile uint32_t PATT2;
  uint32_t  RESERVED0;   
  volatile uint32_t ECCR2; 
} FSMC_Bank2_TypeDef;  



 
  
typedef struct
{
  volatile uint32_t PCR3;
  volatile uint32_t SR3;
  volatile uint32_t PMEM3;
  volatile uint32_t PATT3;
  uint32_t  RESERVED0;   
  volatile uint32_t ECCR3; 
} FSMC_Bank3_TypeDef; 



 
  
typedef struct
{
  volatile uint32_t PCR4;
  volatile uint32_t SR4;
  volatile uint32_t PMEM4;
  volatile uint32_t PATT4;
  volatile uint32_t PIO4; 
} FSMC_Bank4_TypeDef; 



 

typedef struct
{
  volatile uint32_t CRL;
  volatile uint32_t CRH;
  volatile uint32_t IDR;
  volatile uint32_t ODR;
  volatile uint32_t BSRR;
  volatile uint32_t BRR;
  volatile uint32_t LCKR;
} GPIO_TypeDef;



 

typedef struct
{
  volatile uint32_t EVCR;
  volatile uint32_t MAPR;
  volatile uint32_t EXTICR[4];
  uint32_t RESERVED0;
  volatile uint32_t MAPR2;  
} AFIO_TypeDef;


 

typedef struct
{
  volatile uint16_t CR1;
  uint16_t  RESERVED0;
  volatile uint16_t CR2;
  uint16_t  RESERVED1;
  volatile uint16_t OAR1;
  uint16_t  RESERVED2;
  volatile uint16_t OAR2;
  uint16_t  RESERVED3;
  volatile uint16_t DR;
  uint16_t  RESERVED4;
  volatile uint16_t SR1;
  uint16_t  RESERVED5;
  volatile uint16_t SR2;
  uint16_t  RESERVED6;
  volatile uint16_t CCR;
  uint16_t  RESERVED7;
  volatile uint16_t TRISE;
  uint16_t  RESERVED8;
} I2C_TypeDef;



 

typedef struct
{
  volatile uint32_t KR;
  volatile uint32_t PR;
  volatile uint32_t RLR;
  volatile uint32_t SR;
} IWDG_TypeDef;



 

typedef struct
{
  volatile uint32_t CR;
  volatile uint32_t CSR;
} PWR_TypeDef;



 

typedef struct
{
  volatile uint32_t CR;
  volatile uint32_t CFGR;
  volatile uint32_t CIR;
  volatile uint32_t APB2RSTR;
  volatile uint32_t APB1RSTR;
  volatile uint32_t AHBENR;
  volatile uint32_t APB2ENR;
  volatile uint32_t APB1ENR;
  volatile uint32_t BDCR;
  volatile uint32_t CSR;










} RCC_TypeDef;



 

typedef struct
{
  volatile uint16_t CRH;
  uint16_t  RESERVED0;
  volatile uint16_t CRL;
  uint16_t  RESERVED1;
  volatile uint16_t PRLH;
  uint16_t  RESERVED2;
  volatile uint16_t PRLL;
  uint16_t  RESERVED3;
  volatile uint16_t DIVH;
  uint16_t  RESERVED4;
  volatile uint16_t DIVL;
  uint16_t  RESERVED5;
  volatile uint16_t CNTH;
  uint16_t  RESERVED6;
  volatile uint16_t CNTL;
  uint16_t  RESERVED7;
  volatile uint16_t ALRH;
  uint16_t  RESERVED8;
  volatile uint16_t ALRL;
  uint16_t  RESERVED9;
} RTC_TypeDef;



 

typedef struct
{
  volatile uint32_t POWER;
  volatile uint32_t CLKCR;
  volatile uint32_t ARG;
  volatile uint32_t CMD;
  volatile const uint32_t RESPCMD;
  volatile const uint32_t RESP1;
  volatile const uint32_t RESP2;
  volatile const uint32_t RESP3;
  volatile const uint32_t RESP4;
  volatile uint32_t DTIMER;
  volatile uint32_t DLEN;
  volatile uint32_t DCTRL;
  volatile const uint32_t DCOUNT;
  volatile const uint32_t STA;
  volatile uint32_t ICR;
  volatile uint32_t MASK;
  uint32_t  RESERVED0[2];
  volatile const uint32_t FIFOCNT;
  uint32_t  RESERVED1[13];
  volatile uint32_t FIFO;
} SDIO_TypeDef;



 

typedef struct
{
  volatile uint16_t CR1;
  uint16_t  RESERVED0;
  volatile uint16_t CR2;
  uint16_t  RESERVED1;
  volatile uint16_t SR;
  uint16_t  RESERVED2;
  volatile uint16_t DR;
  uint16_t  RESERVED3;
  volatile uint16_t CRCPR;
  uint16_t  RESERVED4;
  volatile uint16_t RXCRCR;
  uint16_t  RESERVED5;
  volatile uint16_t TXCRCR;
  uint16_t  RESERVED6;
  volatile uint16_t I2SCFGR;
  uint16_t  RESERVED7;
  volatile uint16_t I2SPR;
  uint16_t  RESERVED8;  
} SPI_TypeDef;



 

typedef struct
{
  volatile uint16_t CR1;
  uint16_t  RESERVED0;
  volatile uint16_t CR2;
  uint16_t  RESERVED1;
  volatile uint16_t SMCR;
  uint16_t  RESERVED2;
  volatile uint16_t DIER;
  uint16_t  RESERVED3;
  volatile uint16_t SR;
  uint16_t  RESERVED4;
  volatile uint16_t EGR;
  uint16_t  RESERVED5;
  volatile uint16_t CCMR1;
  uint16_t  RESERVED6;
  volatile uint16_t CCMR2;
  uint16_t  RESERVED7;
  volatile uint16_t CCER;
  uint16_t  RESERVED8;
  volatile uint16_t CNT;
  uint16_t  RESERVED9;
  volatile uint16_t PSC;
  uint16_t  RESERVED10;
  volatile uint16_t ARR;
  uint16_t  RESERVED11;
  volatile uint16_t RCR;
  uint16_t  RESERVED12;
  volatile uint16_t CCR1;
  uint16_t  RESERVED13;
  volatile uint16_t CCR2;
  uint16_t  RESERVED14;
  volatile uint16_t CCR3;
  uint16_t  RESERVED15;
  volatile uint16_t CCR4;
  uint16_t  RESERVED16;
  volatile uint16_t BDTR;
  uint16_t  RESERVED17;
  volatile uint16_t DCR;
  uint16_t  RESERVED18;
  volatile uint16_t DMAR;
  uint16_t  RESERVED19;
} TIM_TypeDef;



 
 
typedef struct
{
  volatile uint16_t SR;
  uint16_t  RESERVED0;
  volatile uint16_t DR;
  uint16_t  RESERVED1;
  volatile uint16_t BRR;
  uint16_t  RESERVED2;
  volatile uint16_t CR1;
  uint16_t  RESERVED3;
  volatile uint16_t CR2;
  uint16_t  RESERVED4;
  volatile uint16_t CR3;
  uint16_t  RESERVED5;
  volatile uint16_t GTPR;
  uint16_t  RESERVED6;
} USART_TypeDef;



 

typedef struct
{
  volatile uint32_t CR;
  volatile uint32_t CFR;
  volatile uint32_t SR;
} WWDG_TypeDef;



 
  


 











 




#line 1295 "..\\Libraries\\CMSIS\\CM3\\DeviceSupport\\ST\\STM32F10x\\stm32f10x.h"

#line 1318 "..\\Libraries\\CMSIS\\CM3\\DeviceSupport\\ST\\STM32F10x\\stm32f10x.h"



#line 1337 "..\\Libraries\\CMSIS\\CM3\\DeviceSupport\\ST\\STM32F10x\\stm32f10x.h"




















 
  


   

#line 1437 "..\\Libraries\\CMSIS\\CM3\\DeviceSupport\\ST\\STM32F10x\\stm32f10x.h"



 



 
  
  

 
    
 
 
 

 
 
 
 
 

 



 



 


 
 
 
 
 

 











 
#line 1498 "..\\Libraries\\CMSIS\\CM3\\DeviceSupport\\ST\\STM32F10x\\stm32f10x.h"




 





 
 
 
 
 

 


 


 


 


 


 


 


 


 


 


 


 


 


 


 


 


 


 


 


 


 


 


 


 


 


 


 


 


 


 


 


 


 


 


 


 


 


 


 


 


 


 


 





 



 






 
 
 
 
 

 
#line 1674 "..\\Libraries\\CMSIS\\CM3\\DeviceSupport\\ST\\STM32F10x\\stm32f10x.h"

#line 1681 "..\\Libraries\\CMSIS\\CM3\\DeviceSupport\\ST\\STM32F10x\\stm32f10x.h"

 
 








 








 






#line 1717 "..\\Libraries\\CMSIS\\CM3\\DeviceSupport\\ST\\STM32F10x\\stm32f10x.h"

 











 











 













 






#line 1833 "..\\Libraries\\CMSIS\\CM3\\DeviceSupport\\ST\\STM32F10x\\stm32f10x.h"




#line 1853 "..\\Libraries\\CMSIS\\CM3\\DeviceSupport\\ST\\STM32F10x\\stm32f10x.h"

 





#line 1866 "..\\Libraries\\CMSIS\\CM3\\DeviceSupport\\ST\\STM32F10x\\stm32f10x.h"

 
#line 1885 "..\\Libraries\\CMSIS\\CM3\\DeviceSupport\\ST\\STM32F10x\\stm32f10x.h"

#line 1894 "..\\Libraries\\CMSIS\\CM3\\DeviceSupport\\ST\\STM32F10x\\stm32f10x.h"

 
#line 1902 "..\\Libraries\\CMSIS\\CM3\\DeviceSupport\\ST\\STM32F10x\\stm32f10x.h"



















#line 1927 "..\\Libraries\\CMSIS\\CM3\\DeviceSupport\\ST\\STM32F10x\\stm32f10x.h"












 













#line 1959 "..\\Libraries\\CMSIS\\CM3\\DeviceSupport\\ST\\STM32F10x\\stm32f10x.h"





#line 1973 "..\\Libraries\\CMSIS\\CM3\\DeviceSupport\\ST\\STM32F10x\\stm32f10x.h"

#line 1980 "..\\Libraries\\CMSIS\\CM3\\DeviceSupport\\ST\\STM32F10x\\stm32f10x.h"

#line 1990 "..\\Libraries\\CMSIS\\CM3\\DeviceSupport\\ST\\STM32F10x\\stm32f10x.h"











 


















#line 2026 "..\\Libraries\\CMSIS\\CM3\\DeviceSupport\\ST\\STM32F10x\\stm32f10x.h"

 
#line 2034 "..\\Libraries\\CMSIS\\CM3\\DeviceSupport\\ST\\STM32F10x\\stm32f10x.h"



















#line 2059 "..\\Libraries\\CMSIS\\CM3\\DeviceSupport\\ST\\STM32F10x\\stm32f10x.h"












 













#line 2091 "..\\Libraries\\CMSIS\\CM3\\DeviceSupport\\ST\\STM32F10x\\stm32f10x.h"





#line 2105 "..\\Libraries\\CMSIS\\CM3\\DeviceSupport\\ST\\STM32F10x\\stm32f10x.h"

#line 2112 "..\\Libraries\\CMSIS\\CM3\\DeviceSupport\\ST\\STM32F10x\\stm32f10x.h"

#line 2122 "..\\Libraries\\CMSIS\\CM3\\DeviceSupport\\ST\\STM32F10x\\stm32f10x.h"











 








 








   
#line 2161 "..\\Libraries\\CMSIS\\CM3\\DeviceSupport\\ST\\STM32F10x\\stm32f10x.h"

#line 2256 "..\\Libraries\\CMSIS\\CM3\\DeviceSupport\\ST\\STM32F10x\\stm32f10x.h"

#line 2283 "..\\Libraries\\CMSIS\\CM3\\DeviceSupport\\ST\\STM32F10x\\stm32f10x.h"
 
 
 
 
 
 

 




































































 




































































 
#line 2445 "..\\Libraries\\CMSIS\\CM3\\DeviceSupport\\ST\\STM32F10x\\stm32f10x.h"

 
#line 2463 "..\\Libraries\\CMSIS\\CM3\\DeviceSupport\\ST\\STM32F10x\\stm32f10x.h"

 
#line 2481 "..\\Libraries\\CMSIS\\CM3\\DeviceSupport\\ST\\STM32F10x\\stm32f10x.h"

#line 2498 "..\\Libraries\\CMSIS\\CM3\\DeviceSupport\\ST\\STM32F10x\\stm32f10x.h"

 
#line 2516 "..\\Libraries\\CMSIS\\CM3\\DeviceSupport\\ST\\STM32F10x\\stm32f10x.h"

 
#line 2535 "..\\Libraries\\CMSIS\\CM3\\DeviceSupport\\ST\\STM32F10x\\stm32f10x.h"

 

 






 
#line 2562 "..\\Libraries\\CMSIS\\CM3\\DeviceSupport\\ST\\STM32F10x\\stm32f10x.h"






 








 









 








 








 









 










 




#line 2637 "..\\Libraries\\CMSIS\\CM3\\DeviceSupport\\ST\\STM32F10x\\stm32f10x.h"

 










#line 2668 "..\\Libraries\\CMSIS\\CM3\\DeviceSupport\\ST\\STM32F10x\\stm32f10x.h"

 





 
#line 2683 "..\\Libraries\\CMSIS\\CM3\\DeviceSupport\\ST\\STM32F10x\\stm32f10x.h"

 
#line 2692 "..\\Libraries\\CMSIS\\CM3\\DeviceSupport\\ST\\STM32F10x\\stm32f10x.h"

   
#line 2701 "..\\Libraries\\CMSIS\\CM3\\DeviceSupport\\ST\\STM32F10x\\stm32f10x.h"

 
#line 2710 "..\\Libraries\\CMSIS\\CM3\\DeviceSupport\\ST\\STM32F10x\\stm32f10x.h"

 





 
#line 2725 "..\\Libraries\\CMSIS\\CM3\\DeviceSupport\\ST\\STM32F10x\\stm32f10x.h"

 
#line 2734 "..\\Libraries\\CMSIS\\CM3\\DeviceSupport\\ST\\STM32F10x\\stm32f10x.h"

   
#line 2743 "..\\Libraries\\CMSIS\\CM3\\DeviceSupport\\ST\\STM32F10x\\stm32f10x.h"

 
#line 2752 "..\\Libraries\\CMSIS\\CM3\\DeviceSupport\\ST\\STM32F10x\\stm32f10x.h"

 





 
#line 2767 "..\\Libraries\\CMSIS\\CM3\\DeviceSupport\\ST\\STM32F10x\\stm32f10x.h"

 
#line 2776 "..\\Libraries\\CMSIS\\CM3\\DeviceSupport\\ST\\STM32F10x\\stm32f10x.h"

   
#line 2785 "..\\Libraries\\CMSIS\\CM3\\DeviceSupport\\ST\\STM32F10x\\stm32f10x.h"

 
#line 2794 "..\\Libraries\\CMSIS\\CM3\\DeviceSupport\\ST\\STM32F10x\\stm32f10x.h"

 





 
#line 2809 "..\\Libraries\\CMSIS\\CM3\\DeviceSupport\\ST\\STM32F10x\\stm32f10x.h"

 
#line 2818 "..\\Libraries\\CMSIS\\CM3\\DeviceSupport\\ST\\STM32F10x\\stm32f10x.h"

   
#line 2827 "..\\Libraries\\CMSIS\\CM3\\DeviceSupport\\ST\\STM32F10x\\stm32f10x.h"

 
#line 2836 "..\\Libraries\\CMSIS\\CM3\\DeviceSupport\\ST\\STM32F10x\\stm32f10x.h"

#line 2845 "..\\Libraries\\CMSIS\\CM3\\DeviceSupport\\ST\\STM32F10x\\stm32f10x.h"

#line 2854 "..\\Libraries\\CMSIS\\CM3\\DeviceSupport\\ST\\STM32F10x\\stm32f10x.h"

#line 2864 "..\\Libraries\\CMSIS\\CM3\\DeviceSupport\\ST\\STM32F10x\\stm32f10x.h"

 
 
 
 
 

 





 


 


 




 
 
 
 
 

 
#line 2928 "..\\Libraries\\CMSIS\\CM3\\DeviceSupport\\ST\\STM32F10x\\stm32f10x.h"

 
#line 2963 "..\\Libraries\\CMSIS\\CM3\\DeviceSupport\\ST\\STM32F10x\\stm32f10x.h"

 
#line 2998 "..\\Libraries\\CMSIS\\CM3\\DeviceSupport\\ST\\STM32F10x\\stm32f10x.h"

 
#line 3033 "..\\Libraries\\CMSIS\\CM3\\DeviceSupport\\ST\\STM32F10x\\stm32f10x.h"

 
#line 3068 "..\\Libraries\\CMSIS\\CM3\\DeviceSupport\\ST\\STM32F10x\\stm32f10x.h"

 





 





 





 





 





 





 





 





 






 
#line 3135 "..\\Libraries\\CMSIS\\CM3\\DeviceSupport\\ST\\STM32F10x\\stm32f10x.h"

 



 









 
#line 3159 "..\\Libraries\\CMSIS\\CM3\\DeviceSupport\\ST\\STM32F10x\\stm32f10x.h"




 




 
#line 3175 "..\\Libraries\\CMSIS\\CM3\\DeviceSupport\\ST\\STM32F10x\\stm32f10x.h"

 





 
#line 3197 "..\\Libraries\\CMSIS\\CM3\\DeviceSupport\\ST\\STM32F10x\\stm32f10x.h"

 
 





 
#line 3212 "..\\Libraries\\CMSIS\\CM3\\DeviceSupport\\ST\\STM32F10x\\stm32f10x.h"
 
#line 3219 "..\\Libraries\\CMSIS\\CM3\\DeviceSupport\\ST\\STM32F10x\\stm32f10x.h"

 




 






 


 


 


 
 
 
 
 

 
#line 3268 "..\\Libraries\\CMSIS\\CM3\\DeviceSupport\\ST\\STM32F10x\\stm32f10x.h"

 
#line 3290 "..\\Libraries\\CMSIS\\CM3\\DeviceSupport\\ST\\STM32F10x\\stm32f10x.h"

 
#line 3312 "..\\Libraries\\CMSIS\\CM3\\DeviceSupport\\ST\\STM32F10x\\stm32f10x.h"

 
#line 3334 "..\\Libraries\\CMSIS\\CM3\\DeviceSupport\\ST\\STM32F10x\\stm32f10x.h"

 
#line 3356 "..\\Libraries\\CMSIS\\CM3\\DeviceSupport\\ST\\STM32F10x\\stm32f10x.h"

 
#line 3378 "..\\Libraries\\CMSIS\\CM3\\DeviceSupport\\ST\\STM32F10x\\stm32f10x.h"

 
 
 
 
 

 
#line 3414 "..\\Libraries\\CMSIS\\CM3\\DeviceSupport\\ST\\STM32F10x\\stm32f10x.h"

 
#line 3444 "..\\Libraries\\CMSIS\\CM3\\DeviceSupport\\ST\\STM32F10x\\stm32f10x.h"

 
#line 3454 "..\\Libraries\\CMSIS\\CM3\\DeviceSupport\\ST\\STM32F10x\\stm32f10x.h"















 
#line 3478 "..\\Libraries\\CMSIS\\CM3\\DeviceSupport\\ST\\STM32F10x\\stm32f10x.h"















 
#line 3502 "..\\Libraries\\CMSIS\\CM3\\DeviceSupport\\ST\\STM32F10x\\stm32f10x.h"















 
#line 3526 "..\\Libraries\\CMSIS\\CM3\\DeviceSupport\\ST\\STM32F10x\\stm32f10x.h"















 
#line 3550 "..\\Libraries\\CMSIS\\CM3\\DeviceSupport\\ST\\STM32F10x\\stm32f10x.h"















 
#line 3574 "..\\Libraries\\CMSIS\\CM3\\DeviceSupport\\ST\\STM32F10x\\stm32f10x.h"















 
#line 3598 "..\\Libraries\\CMSIS\\CM3\\DeviceSupport\\ST\\STM32F10x\\stm32f10x.h"















 


 


 


 


 


 


 


 


 


 



 


 


 



 


 


 


 



 


 


 


 


 
 
 
 
 

 






 
#line 3699 "..\\Libraries\\CMSIS\\CM3\\DeviceSupport\\ST\\STM32F10x\\stm32f10x.h"

#line 3708 "..\\Libraries\\CMSIS\\CM3\\DeviceSupport\\ST\\STM32F10x\\stm32f10x.h"















  
 
#line 3731 "..\\Libraries\\CMSIS\\CM3\\DeviceSupport\\ST\\STM32F10x\\stm32f10x.h"


















 








































 


















































 


 


 


 


 


 


 
#line 3866 "..\\Libraries\\CMSIS\\CM3\\DeviceSupport\\ST\\STM32F10x\\stm32f10x.h"

#line 3873 "..\\Libraries\\CMSIS\\CM3\\DeviceSupport\\ST\\STM32F10x\\stm32f10x.h"

#line 3880 "..\\Libraries\\CMSIS\\CM3\\DeviceSupport\\ST\\STM32F10x\\stm32f10x.h"

#line 3887 "..\\Libraries\\CMSIS\\CM3\\DeviceSupport\\ST\\STM32F10x\\stm32f10x.h"







 
#line 3901 "..\\Libraries\\CMSIS\\CM3\\DeviceSupport\\ST\\STM32F10x\\stm32f10x.h"

#line 3908 "..\\Libraries\\CMSIS\\CM3\\DeviceSupport\\ST\\STM32F10x\\stm32f10x.h"

#line 3915 "..\\Libraries\\CMSIS\\CM3\\DeviceSupport\\ST\\STM32F10x\\stm32f10x.h"

#line 3922 "..\\Libraries\\CMSIS\\CM3\\DeviceSupport\\ST\\STM32F10x\\stm32f10x.h"

#line 3929 "..\\Libraries\\CMSIS\\CM3\\DeviceSupport\\ST\\STM32F10x\\stm32f10x.h"

#line 3936 "..\\Libraries\\CMSIS\\CM3\\DeviceSupport\\ST\\STM32F10x\\stm32f10x.h"

 
#line 3944 "..\\Libraries\\CMSIS\\CM3\\DeviceSupport\\ST\\STM32F10x\\stm32f10x.h"

#line 3951 "..\\Libraries\\CMSIS\\CM3\\DeviceSupport\\ST\\STM32F10x\\stm32f10x.h"

#line 3958 "..\\Libraries\\CMSIS\\CM3\\DeviceSupport\\ST\\STM32F10x\\stm32f10x.h"

#line 3965 "..\\Libraries\\CMSIS\\CM3\\DeviceSupport\\ST\\STM32F10x\\stm32f10x.h"

#line 3972 "..\\Libraries\\CMSIS\\CM3\\DeviceSupport\\ST\\STM32F10x\\stm32f10x.h"

#line 3979 "..\\Libraries\\CMSIS\\CM3\\DeviceSupport\\ST\\STM32F10x\\stm32f10x.h"

 
#line 3987 "..\\Libraries\\CMSIS\\CM3\\DeviceSupport\\ST\\STM32F10x\\stm32f10x.h"

#line 3994 "..\\Libraries\\CMSIS\\CM3\\DeviceSupport\\ST\\STM32F10x\\stm32f10x.h"

#line 4001 "..\\Libraries\\CMSIS\\CM3\\DeviceSupport\\ST\\STM32F10x\\stm32f10x.h"

#line 4008 "..\\Libraries\\CMSIS\\CM3\\DeviceSupport\\ST\\STM32F10x\\stm32f10x.h"





 


 


 


 


 



 
 
 
 
 

 









































 



 


 


 


 


 


 


 



 



 



 


 


 



 
 
 
 
 
 





 






 


 
#line 4150 "..\\Libraries\\CMSIS\\CM3\\DeviceSupport\\ST\\STM32F10x\\stm32f10x.h"

 
#line 4160 "..\\Libraries\\CMSIS\\CM3\\DeviceSupport\\ST\\STM32F10x\\stm32f10x.h"

 


 


 
 
 
 
 

 
















 









#line 4208 "..\\Libraries\\CMSIS\\CM3\\DeviceSupport\\ST\\STM32F10x\\stm32f10x.h"

 

























 
#line 4251 "..\\Libraries\\CMSIS\\CM3\\DeviceSupport\\ST\\STM32F10x\\stm32f10x.h"

 
#line 4265 "..\\Libraries\\CMSIS\\CM3\\DeviceSupport\\ST\\STM32F10x\\stm32f10x.h"

 
#line 4275 "..\\Libraries\\CMSIS\\CM3\\DeviceSupport\\ST\\STM32F10x\\stm32f10x.h"

 




























 





















 




























 





















 
#line 4394 "..\\Libraries\\CMSIS\\CM3\\DeviceSupport\\ST\\STM32F10x\\stm32f10x.h"

 


 


 


 


 


 


 


 


 
#line 4429 "..\\Libraries\\CMSIS\\CM3\\DeviceSupport\\ST\\STM32F10x\\stm32f10x.h"





#line 4440 "..\\Libraries\\CMSIS\\CM3\\DeviceSupport\\ST\\STM32F10x\\stm32f10x.h"

 
#line 4448 "..\\Libraries\\CMSIS\\CM3\\DeviceSupport\\ST\\STM32F10x\\stm32f10x.h"

#line 4455 "..\\Libraries\\CMSIS\\CM3\\DeviceSupport\\ST\\STM32F10x\\stm32f10x.h"

 


 
 
 
 
 

 




 
#line 4477 "..\\Libraries\\CMSIS\\CM3\\DeviceSupport\\ST\\STM32F10x\\stm32f10x.h"

 


 


 


 


 


 


 


 


 
 
 
 
 

 


 





 


 



 
 
 
 
 

 
#line 4539 "..\\Libraries\\CMSIS\\CM3\\DeviceSupport\\ST\\STM32F10x\\stm32f10x.h"



 
#line 4551 "..\\Libraries\\CMSIS\\CM3\\DeviceSupport\\ST\\STM32F10x\\stm32f10x.h"







 


 
 
 
 
 

 











#line 4589 "..\\Libraries\\CMSIS\\CM3\\DeviceSupport\\ST\\STM32F10x\\stm32f10x.h"

 











#line 4612 "..\\Libraries\\CMSIS\\CM3\\DeviceSupport\\ST\\STM32F10x\\stm32f10x.h"

 











#line 4635 "..\\Libraries\\CMSIS\\CM3\\DeviceSupport\\ST\\STM32F10x\\stm32f10x.h"

 











#line 4658 "..\\Libraries\\CMSIS\\CM3\\DeviceSupport\\ST\\STM32F10x\\stm32f10x.h"

 








































 








































 








































 








































 


































 


































 


































 


































 



























 



























 



























 
#line 5055 "..\\Libraries\\CMSIS\\CM3\\DeviceSupport\\ST\\STM32F10x\\stm32f10x.h"

 
#line 5064 "..\\Libraries\\CMSIS\\CM3\\DeviceSupport\\ST\\STM32F10x\\stm32f10x.h"

 
#line 5073 "..\\Libraries\\CMSIS\\CM3\\DeviceSupport\\ST\\STM32F10x\\stm32f10x.h"

 
#line 5084 "..\\Libraries\\CMSIS\\CM3\\DeviceSupport\\ST\\STM32F10x\\stm32f10x.h"

#line 5094 "..\\Libraries\\CMSIS\\CM3\\DeviceSupport\\ST\\STM32F10x\\stm32f10x.h"

#line 5104 "..\\Libraries\\CMSIS\\CM3\\DeviceSupport\\ST\\STM32F10x\\stm32f10x.h"

#line 5114 "..\\Libraries\\CMSIS\\CM3\\DeviceSupport\\ST\\STM32F10x\\stm32f10x.h"

 
#line 5125 "..\\Libraries\\CMSIS\\CM3\\DeviceSupport\\ST\\STM32F10x\\stm32f10x.h"

#line 5135 "..\\Libraries\\CMSIS\\CM3\\DeviceSupport\\ST\\STM32F10x\\stm32f10x.h"

#line 5145 "..\\Libraries\\CMSIS\\CM3\\DeviceSupport\\ST\\STM32F10x\\stm32f10x.h"

#line 5155 "..\\Libraries\\CMSIS\\CM3\\DeviceSupport\\ST\\STM32F10x\\stm32f10x.h"

 
#line 5166 "..\\Libraries\\CMSIS\\CM3\\DeviceSupport\\ST\\STM32F10x\\stm32f10x.h"

#line 5176 "..\\Libraries\\CMSIS\\CM3\\DeviceSupport\\ST\\STM32F10x\\stm32f10x.h"

#line 5186 "..\\Libraries\\CMSIS\\CM3\\DeviceSupport\\ST\\STM32F10x\\stm32f10x.h"

#line 5196 "..\\Libraries\\CMSIS\\CM3\\DeviceSupport\\ST\\STM32F10x\\stm32f10x.h"

 
#line 5207 "..\\Libraries\\CMSIS\\CM3\\DeviceSupport\\ST\\STM32F10x\\stm32f10x.h"

#line 5217 "..\\Libraries\\CMSIS\\CM3\\DeviceSupport\\ST\\STM32F10x\\stm32f10x.h"

#line 5227 "..\\Libraries\\CMSIS\\CM3\\DeviceSupport\\ST\\STM32F10x\\stm32f10x.h"

#line 5237 "..\\Libraries\\CMSIS\\CM3\\DeviceSupport\\ST\\STM32F10x\\stm32f10x.h"

 
#line 5248 "..\\Libraries\\CMSIS\\CM3\\DeviceSupport\\ST\\STM32F10x\\stm32f10x.h"

#line 5258 "..\\Libraries\\CMSIS\\CM3\\DeviceSupport\\ST\\STM32F10x\\stm32f10x.h"

#line 5268 "..\\Libraries\\CMSIS\\CM3\\DeviceSupport\\ST\\STM32F10x\\stm32f10x.h"

#line 5278 "..\\Libraries\\CMSIS\\CM3\\DeviceSupport\\ST\\STM32F10x\\stm32f10x.h"

 
#line 5289 "..\\Libraries\\CMSIS\\CM3\\DeviceSupport\\ST\\STM32F10x\\stm32f10x.h"

#line 5299 "..\\Libraries\\CMSIS\\CM3\\DeviceSupport\\ST\\STM32F10x\\stm32f10x.h"

#line 5309 "..\\Libraries\\CMSIS\\CM3\\DeviceSupport\\ST\\STM32F10x\\stm32f10x.h"

#line 5319 "..\\Libraries\\CMSIS\\CM3\\DeviceSupport\\ST\\STM32F10x\\stm32f10x.h"

 
#line 5330 "..\\Libraries\\CMSIS\\CM3\\DeviceSupport\\ST\\STM32F10x\\stm32f10x.h"

#line 5340 "..\\Libraries\\CMSIS\\CM3\\DeviceSupport\\ST\\STM32F10x\\stm32f10x.h"

#line 5350 "..\\Libraries\\CMSIS\\CM3\\DeviceSupport\\ST\\STM32F10x\\stm32f10x.h"

#line 5360 "..\\Libraries\\CMSIS\\CM3\\DeviceSupport\\ST\\STM32F10x\\stm32f10x.h"

 


 


 
 
 
 
 

 




 












 


 






#line 5408 "..\\Libraries\\CMSIS\\CM3\\DeviceSupport\\ST\\STM32F10x\\stm32f10x.h"

 


 


 


 


 


 


 


 


 
















 


 
#line 5478 "..\\Libraries\\CMSIS\\CM3\\DeviceSupport\\ST\\STM32F10x\\stm32f10x.h"

 
#line 5493 "..\\Libraries\\CMSIS\\CM3\\DeviceSupport\\ST\\STM32F10x\\stm32f10x.h"

 
#line 5519 "..\\Libraries\\CMSIS\\CM3\\DeviceSupport\\ST\\STM32F10x\\stm32f10x.h"

 


 


 
 
 
 
 

 
 























 























 























 























 























 























 























 























 
 
#line 5740 "..\\Libraries\\CMSIS\\CM3\\DeviceSupport\\ST\\STM32F10x\\stm32f10x.h"

 
#line 5752 "..\\Libraries\\CMSIS\\CM3\\DeviceSupport\\ST\\STM32F10x\\stm32f10x.h"

 






 
#line 5769 "..\\Libraries\\CMSIS\\CM3\\DeviceSupport\\ST\\STM32F10x\\stm32f10x.h"



     


 
 


 


 


 


 


 


 


 


 

 


 


 


 


 


 


 


 


 

 


 


 


 


 


 


 


 


 


 


 


 


 


 


 


 


 

 


 


 


 


 


 


 


 


 

 


#line 5913 "..\\Libraries\\CMSIS\\CM3\\DeviceSupport\\ST\\STM32F10x\\stm32f10x.h"



 


#line 5925 "..\\Libraries\\CMSIS\\CM3\\DeviceSupport\\ST\\STM32F10x\\stm32f10x.h"



 


#line 5937 "..\\Libraries\\CMSIS\\CM3\\DeviceSupport\\ST\\STM32F10x\\stm32f10x.h"



 


#line 5949 "..\\Libraries\\CMSIS\\CM3\\DeviceSupport\\ST\\STM32F10x\\stm32f10x.h"



 


#line 5961 "..\\Libraries\\CMSIS\\CM3\\DeviceSupport\\ST\\STM32F10x\\stm32f10x.h"



 


#line 5973 "..\\Libraries\\CMSIS\\CM3\\DeviceSupport\\ST\\STM32F10x\\stm32f10x.h"



 


#line 5985 "..\\Libraries\\CMSIS\\CM3\\DeviceSupport\\ST\\STM32F10x\\stm32f10x.h"



 


#line 5997 "..\\Libraries\\CMSIS\\CM3\\DeviceSupport\\ST\\STM32F10x\\stm32f10x.h"



 

 


#line 6011 "..\\Libraries\\CMSIS\\CM3\\DeviceSupport\\ST\\STM32F10x\\stm32f10x.h"



 


#line 6023 "..\\Libraries\\CMSIS\\CM3\\DeviceSupport\\ST\\STM32F10x\\stm32f10x.h"



 


#line 6035 "..\\Libraries\\CMSIS\\CM3\\DeviceSupport\\ST\\STM32F10x\\stm32f10x.h"



 


#line 6047 "..\\Libraries\\CMSIS\\CM3\\DeviceSupport\\ST\\STM32F10x\\stm32f10x.h"



 


#line 6059 "..\\Libraries\\CMSIS\\CM3\\DeviceSupport\\ST\\STM32F10x\\stm32f10x.h"



 


#line 6071 "..\\Libraries\\CMSIS\\CM3\\DeviceSupport\\ST\\STM32F10x\\stm32f10x.h"



 


#line 6083 "..\\Libraries\\CMSIS\\CM3\\DeviceSupport\\ST\\STM32F10x\\stm32f10x.h"



 


#line 6095 "..\\Libraries\\CMSIS\\CM3\\DeviceSupport\\ST\\STM32F10x\\stm32f10x.h"



 


#line 6107 "..\\Libraries\\CMSIS\\CM3\\DeviceSupport\\ST\\STM32F10x\\stm32f10x.h"



 


#line 6119 "..\\Libraries\\CMSIS\\CM3\\DeviceSupport\\ST\\STM32F10x\\stm32f10x.h"



 


#line 6131 "..\\Libraries\\CMSIS\\CM3\\DeviceSupport\\ST\\STM32F10x\\stm32f10x.h"



 


#line 6143 "..\\Libraries\\CMSIS\\CM3\\DeviceSupport\\ST\\STM32F10x\\stm32f10x.h"



 


#line 6155 "..\\Libraries\\CMSIS\\CM3\\DeviceSupport\\ST\\STM32F10x\\stm32f10x.h"



 


#line 6167 "..\\Libraries\\CMSIS\\CM3\\DeviceSupport\\ST\\STM32F10x\\stm32f10x.h"



 


#line 6179 "..\\Libraries\\CMSIS\\CM3\\DeviceSupport\\ST\\STM32F10x\\stm32f10x.h"



 


#line 6191 "..\\Libraries\\CMSIS\\CM3\\DeviceSupport\\ST\\STM32F10x\\stm32f10x.h"



 
 
 
 
 

 
 
#line 6211 "..\\Libraries\\CMSIS\\CM3\\DeviceSupport\\ST\\STM32F10x\\stm32f10x.h"

 
#line 6222 "..\\Libraries\\CMSIS\\CM3\\DeviceSupport\\ST\\STM32F10x\\stm32f10x.h"

 
#line 6240 "..\\Libraries\\CMSIS\\CM3\\DeviceSupport\\ST\\STM32F10x\\stm32f10x.h"











 





 





 
#line 6278 "..\\Libraries\\CMSIS\\CM3\\DeviceSupport\\ST\\STM32F10x\\stm32f10x.h"

 












 
#line 6299 "..\\Libraries\\CMSIS\\CM3\\DeviceSupport\\ST\\STM32F10x\\stm32f10x.h"

 
 






 




 





 





 






 




 





 





 






   




 





 





 





 




 





 





 





 




 





 





 
 


 
#line 6439 "..\\Libraries\\CMSIS\\CM3\\DeviceSupport\\ST\\STM32F10x\\stm32f10x.h"

 
#line 6456 "..\\Libraries\\CMSIS\\CM3\\DeviceSupport\\ST\\STM32F10x\\stm32f10x.h"

 
#line 6473 "..\\Libraries\\CMSIS\\CM3\\DeviceSupport\\ST\\STM32F10x\\stm32f10x.h"

 
#line 6490 "..\\Libraries\\CMSIS\\CM3\\DeviceSupport\\ST\\STM32F10x\\stm32f10x.h"

 
#line 6524 "..\\Libraries\\CMSIS\\CM3\\DeviceSupport\\ST\\STM32F10x\\stm32f10x.h"

 
#line 6558 "..\\Libraries\\CMSIS\\CM3\\DeviceSupport\\ST\\STM32F10x\\stm32f10x.h"

 
#line 6592 "..\\Libraries\\CMSIS\\CM3\\DeviceSupport\\ST\\STM32F10x\\stm32f10x.h"

 
#line 6626 "..\\Libraries\\CMSIS\\CM3\\DeviceSupport\\ST\\STM32F10x\\stm32f10x.h"

 
#line 6660 "..\\Libraries\\CMSIS\\CM3\\DeviceSupport\\ST\\STM32F10x\\stm32f10x.h"

 
#line 6694 "..\\Libraries\\CMSIS\\CM3\\DeviceSupport\\ST\\STM32F10x\\stm32f10x.h"

 
#line 6728 "..\\Libraries\\CMSIS\\CM3\\DeviceSupport\\ST\\STM32F10x\\stm32f10x.h"

 
#line 6762 "..\\Libraries\\CMSIS\\CM3\\DeviceSupport\\ST\\STM32F10x\\stm32f10x.h"

 
#line 6796 "..\\Libraries\\CMSIS\\CM3\\DeviceSupport\\ST\\STM32F10x\\stm32f10x.h"

 
#line 6830 "..\\Libraries\\CMSIS\\CM3\\DeviceSupport\\ST\\STM32F10x\\stm32f10x.h"

 
#line 6864 "..\\Libraries\\CMSIS\\CM3\\DeviceSupport\\ST\\STM32F10x\\stm32f10x.h"

 
#line 6898 "..\\Libraries\\CMSIS\\CM3\\DeviceSupport\\ST\\STM32F10x\\stm32f10x.h"

 
#line 6932 "..\\Libraries\\CMSIS\\CM3\\DeviceSupport\\ST\\STM32F10x\\stm32f10x.h"

 
#line 6966 "..\\Libraries\\CMSIS\\CM3\\DeviceSupport\\ST\\STM32F10x\\stm32f10x.h"

 
#line 7000 "..\\Libraries\\CMSIS\\CM3\\DeviceSupport\\ST\\STM32F10x\\stm32f10x.h"

 
#line 7034 "..\\Libraries\\CMSIS\\CM3\\DeviceSupport\\ST\\STM32F10x\\stm32f10x.h"

 
#line 7068 "..\\Libraries\\CMSIS\\CM3\\DeviceSupport\\ST\\STM32F10x\\stm32f10x.h"

 
#line 7102 "..\\Libraries\\CMSIS\\CM3\\DeviceSupport\\ST\\STM32F10x\\stm32f10x.h"

 
#line 7136 "..\\Libraries\\CMSIS\\CM3\\DeviceSupport\\ST\\STM32F10x\\stm32f10x.h"

 
#line 7170 "..\\Libraries\\CMSIS\\CM3\\DeviceSupport\\ST\\STM32F10x\\stm32f10x.h"

 
#line 7204 "..\\Libraries\\CMSIS\\CM3\\DeviceSupport\\ST\\STM32F10x\\stm32f10x.h"

 
#line 7238 "..\\Libraries\\CMSIS\\CM3\\DeviceSupport\\ST\\STM32F10x\\stm32f10x.h"

 
#line 7272 "..\\Libraries\\CMSIS\\CM3\\DeviceSupport\\ST\\STM32F10x\\stm32f10x.h"

 
#line 7306 "..\\Libraries\\CMSIS\\CM3\\DeviceSupport\\ST\\STM32F10x\\stm32f10x.h"

 
#line 7340 "..\\Libraries\\CMSIS\\CM3\\DeviceSupport\\ST\\STM32F10x\\stm32f10x.h"

 
#line 7374 "..\\Libraries\\CMSIS\\CM3\\DeviceSupport\\ST\\STM32F10x\\stm32f10x.h"

 
#line 7408 "..\\Libraries\\CMSIS\\CM3\\DeviceSupport\\ST\\STM32F10x\\stm32f10x.h"

 
#line 7442 "..\\Libraries\\CMSIS\\CM3\\DeviceSupport\\ST\\STM32F10x\\stm32f10x.h"

 
 
 
 
 

 









#line 7469 "..\\Libraries\\CMSIS\\CM3\\DeviceSupport\\ST\\STM32F10x\\stm32f10x.h"

 
#line 7477 "..\\Libraries\\CMSIS\\CM3\\DeviceSupport\\ST\\STM32F10x\\stm32f10x.h"

 
#line 7487 "..\\Libraries\\CMSIS\\CM3\\DeviceSupport\\ST\\STM32F10x\\stm32f10x.h"

 


 


 


 


 





















 




 
 
 
 
 

 
#line 7548 "..\\Libraries\\CMSIS\\CM3\\DeviceSupport\\ST\\STM32F10x\\stm32f10x.h"

 
#line 7557 "..\\Libraries\\CMSIS\\CM3\\DeviceSupport\\ST\\STM32F10x\\stm32f10x.h"







 



#line 7578 "..\\Libraries\\CMSIS\\CM3\\DeviceSupport\\ST\\STM32F10x\\stm32f10x.h"



 



 


 
#line 7603 "..\\Libraries\\CMSIS\\CM3\\DeviceSupport\\ST\\STM32F10x\\stm32f10x.h"

 
#line 7613 "..\\Libraries\\CMSIS\\CM3\\DeviceSupport\\ST\\STM32F10x\\stm32f10x.h"

 




 


 
 
 
 
 

 
#line 7639 "..\\Libraries\\CMSIS\\CM3\\DeviceSupport\\ST\\STM32F10x\\stm32f10x.h"

 


 



 
#line 7663 "..\\Libraries\\CMSIS\\CM3\\DeviceSupport\\ST\\STM32F10x\\stm32f10x.h"

 
#line 7672 "..\\Libraries\\CMSIS\\CM3\\DeviceSupport\\ST\\STM32F10x\\stm32f10x.h"







 
#line 7692 "..\\Libraries\\CMSIS\\CM3\\DeviceSupport\\ST\\STM32F10x\\stm32f10x.h"

 
#line 7703 "..\\Libraries\\CMSIS\\CM3\\DeviceSupport\\ST\\STM32F10x\\stm32f10x.h"



 
 
 
 
 

 


#line 7732 "..\\Libraries\\CMSIS\\CM3\\DeviceSupport\\ST\\STM32F10x\\stm32f10x.h"

 









#line 7766 "..\\Libraries\\CMSIS\\CM3\\DeviceSupport\\ST\\STM32F10x\\stm32f10x.h"

 
 
 
 
 

 









 


 


 





 
#line 7806 "..\\Libraries\\CMSIS\\CM3\\DeviceSupport\\ST\\STM32F10x\\stm32f10x.h"

 


 









 


 

 



 



 



 



 



 



 



 



#line 8270 "..\\Libraries\\CMSIS\\CM3\\DeviceSupport\\ST\\STM32F10x\\stm32f10x.h"



 

 

  

#line 1 "..\\USER\\stm32f10x_conf.h"


















  

 



 
 
 
 
 
 
 
 
 
 
 
 
 
#line 1 "..\\Libraries\\STM32F10x_StdPeriph_Driver\\inc\\stm32f10x_gpio.h"



















  

 







 
#line 1 "..\\Libraries\\CMSIS\\CM3\\DeviceSupport\\ST\\STM32F10x\\stm32f10x.h"























 



 



 
    
#line 8310 "..\\Libraries\\CMSIS\\CM3\\DeviceSupport\\ST\\STM32F10x\\stm32f10x.h"



 

  

 

 
#line 32 "..\\Libraries\\STM32F10x_StdPeriph_Driver\\inc\\stm32f10x_gpio.h"



 



 



 

#line 52 "..\\Libraries\\STM32F10x_StdPeriph_Driver\\inc\\stm32f10x_gpio.h"
                                     


 

typedef enum
{ 
  GPIO_Speed_10MHz = 1,
  GPIO_Speed_2MHz, 
  GPIO_Speed_50MHz
}GPIOSpeed_TypeDef;





 

typedef enum
{ GPIO_Mode_AIN = 0x0,
  GPIO_Mode_IN_FLOATING = 0x04,
  GPIO_Mode_IPD = 0x28,
  GPIO_Mode_IPU = 0x48,
  GPIO_Mode_Out_OD = 0x14,
  GPIO_Mode_Out_PP = 0x10,
  GPIO_Mode_AF_OD = 0x1C,
  GPIO_Mode_AF_PP = 0x18
}GPIOMode_TypeDef;








 

typedef struct
{
  uint16_t GPIO_Pin;             
 

  GPIOSpeed_TypeDef GPIO_Speed;  
 

  GPIOMode_TypeDef GPIO_Mode;    
 
}GPIO_InitTypeDef;




 

typedef enum
{ Bit_RESET = 0,
  Bit_SET
}BitAction;





 



 



 

#line 143 "..\\Libraries\\STM32F10x_StdPeriph_Driver\\inc\\stm32f10x_gpio.h"



#line 162 "..\\Libraries\\STM32F10x_StdPeriph_Driver\\inc\\stm32f10x_gpio.h"



 



 

#line 203 "..\\Libraries\\STM32F10x_StdPeriph_Driver\\inc\\stm32f10x_gpio.h"







#line 216 "..\\Libraries\\STM32F10x_StdPeriph_Driver\\inc\\stm32f10x_gpio.h"






#line 244 "..\\Libraries\\STM32F10x_StdPeriph_Driver\\inc\\stm32f10x_gpio.h"
                              


  



 

#line 265 "..\\Libraries\\STM32F10x_StdPeriph_Driver\\inc\\stm32f10x_gpio.h"

#line 273 "..\\Libraries\\STM32F10x_StdPeriph_Driver\\inc\\stm32f10x_gpio.h"



 



 

#line 298 "..\\Libraries\\STM32F10x_StdPeriph_Driver\\inc\\stm32f10x_gpio.h"

#line 315 "..\\Libraries\\STM32F10x_StdPeriph_Driver\\inc\\stm32f10x_gpio.h"



 



  








                                                 


 



 



 



 

void GPIO_DeInit(GPIO_TypeDef* GPIOx);
void GPIO_AFIODeInit(void);
void GPIO_Init(GPIO_TypeDef* GPIOx, GPIO_InitTypeDef* GPIO_InitStruct);
void GPIO_StructInit(GPIO_InitTypeDef* GPIO_InitStruct);
uint8_t GPIO_ReadInputDataBit(GPIO_TypeDef* GPIOx, uint16_t GPIO_Pin);
uint16_t GPIO_ReadInputData(GPIO_TypeDef* GPIOx);
uint8_t GPIO_ReadOutputDataBit(GPIO_TypeDef* GPIOx, uint16_t GPIO_Pin);
uint16_t GPIO_ReadOutputData(GPIO_TypeDef* GPIOx);
void GPIO_SetBits(GPIO_TypeDef* GPIOx, uint16_t GPIO_Pin);
void GPIO_ResetBits(GPIO_TypeDef* GPIOx, uint16_t GPIO_Pin);
void GPIO_WriteBit(GPIO_TypeDef* GPIOx, uint16_t GPIO_Pin, BitAction BitVal);
void GPIO_Write(GPIO_TypeDef* GPIOx, uint16_t PortVal);
void GPIO_PinLockConfig(GPIO_TypeDef* GPIOx, uint16_t GPIO_Pin);
void GPIO_EventOutputConfig(uint8_t GPIO_PortSource, uint8_t GPIO_PinSource);
void GPIO_EventOutputCmd(FunctionalState NewState);
void GPIO_PinRemapConfig(uint32_t GPIO_Remap, FunctionalState NewState);
void GPIO_EXTILineConfig(uint8_t GPIO_PortSource, uint8_t GPIO_PinSource);
void GPIO_ETH_MediaInterfaceConfig(uint32_t GPIO_ETH_MediaInterface);








 



 



 

 
#line 39 "..\\USER\\stm32f10x_conf.h"
 
 
 
#line 1 "..\\Libraries\\STM32F10x_StdPeriph_Driver\\inc\\stm32f10x_rcc.h"



















  

 







 
#line 32 "..\\Libraries\\STM32F10x_StdPeriph_Driver\\inc\\stm32f10x_rcc.h"



 



 



 

typedef struct
{
  uint32_t SYSCLK_Frequency;   
  uint32_t HCLK_Frequency;     
  uint32_t PCLK1_Frequency;    
  uint32_t PCLK2_Frequency;    
  uint32_t ADCCLK_Frequency;   
}RCC_ClocksTypeDef;



 



 



 









  



 



#line 93 "..\\Libraries\\STM32F10x_StdPeriph_Driver\\inc\\stm32f10x_rcc.h"



  



 
#line 125 "..\\Libraries\\STM32F10x_StdPeriph_Driver\\inc\\stm32f10x_rcc.h"

#line 140 "..\\Libraries\\STM32F10x_StdPeriph_Driver\\inc\\stm32f10x_rcc.h"


 



 
#line 174 "..\\Libraries\\STM32F10x_StdPeriph_Driver\\inc\\stm32f10x_rcc.h"


 




 
#line 195 "..\\Libraries\\STM32F10x_StdPeriph_Driver\\inc\\stm32f10x_rcc.h"


 

#line 282 "..\\Libraries\\STM32F10x_StdPeriph_Driver\\inc\\stm32f10x_rcc.h"




 

#line 294 "..\\Libraries\\STM32F10x_StdPeriph_Driver\\inc\\stm32f10x_rcc.h"


 



 

#line 316 "..\\Libraries\\STM32F10x_StdPeriph_Driver\\inc\\stm32f10x_rcc.h"


  



 

#line 332 "..\\Libraries\\STM32F10x_StdPeriph_Driver\\inc\\stm32f10x_rcc.h"


 



 

#line 346 "..\\Libraries\\STM32F10x_StdPeriph_Driver\\inc\\stm32f10x_rcc.h"

#line 363 "..\\Libraries\\STM32F10x_StdPeriph_Driver\\inc\\stm32f10x_rcc.h"




 




 








 
#line 395 "..\\Libraries\\STM32F10x_StdPeriph_Driver\\inc\\stm32f10x_rcc.h"


#line 422 "..\\Libraries\\STM32F10x_StdPeriph_Driver\\inc\\stm32f10x_rcc.h"
  



 

#line 434 "..\\Libraries\\STM32F10x_StdPeriph_Driver\\inc\\stm32f10x_rcc.h"


 



 








 



 

#line 461 "..\\Libraries\\STM32F10x_StdPeriph_Driver\\inc\\stm32f10x_rcc.h"


 



 







#line 488 "..\\Libraries\\STM32F10x_StdPeriph_Driver\\inc\\stm32f10x_rcc.h"


 



 

#line 517 "..\\Libraries\\STM32F10x_StdPeriph_Driver\\inc\\stm32f10x_rcc.h"




  



 

#line 552 "..\\Libraries\\STM32F10x_StdPeriph_Driver\\inc\\stm32f10x_rcc.h"
 




 



 







#line 585 "..\\Libraries\\STM32F10x_StdPeriph_Driver\\inc\\stm32f10x_rcc.h"



 



 

#line 605 "..\\Libraries\\STM32F10x_StdPeriph_Driver\\inc\\stm32f10x_rcc.h"

#line 624 "..\\Libraries\\STM32F10x_StdPeriph_Driver\\inc\\stm32f10x_rcc.h"




 



 



 



 



 

void RCC_DeInit(void);
void RCC_HSEConfig(uint32_t RCC_HSE);
ErrorStatus RCC_WaitForHSEStartUp(void);
void RCC_AdjustHSICalibrationValue(uint8_t HSICalibrationValue);
void RCC_HSICmd(FunctionalState NewState);
void RCC_PLLConfig(uint32_t RCC_PLLSource, uint32_t RCC_PLLMul);
void RCC_PLLCmd(FunctionalState NewState);





#line 665 "..\\Libraries\\STM32F10x_StdPeriph_Driver\\inc\\stm32f10x_rcc.h"

void RCC_SYSCLKConfig(uint32_t RCC_SYSCLKSource);
uint8_t RCC_GetSYSCLKSource(void);
void RCC_HCLKConfig(uint32_t RCC_SYSCLK);
void RCC_PCLK1Config(uint32_t RCC_HCLK);
void RCC_PCLK2Config(uint32_t RCC_HCLK);
void RCC_ITConfig(uint8_t RCC_IT, FunctionalState NewState);


 void RCC_USBCLKConfig(uint32_t RCC_USBCLKSource);




void RCC_ADCCLKConfig(uint32_t RCC_PCLK2);






void RCC_LSEConfig(uint8_t RCC_LSE);
void RCC_LSICmd(FunctionalState NewState);
void RCC_RTCCLKConfig(uint32_t RCC_RTCCLKSource);
void RCC_RTCCLKCmd(FunctionalState NewState);
void RCC_GetClocksFreq(RCC_ClocksTypeDef* RCC_Clocks);
void RCC_AHBPeriphClockCmd(uint32_t RCC_AHBPeriph, FunctionalState NewState);
void RCC_APB2PeriphClockCmd(uint32_t RCC_APB2Periph, FunctionalState NewState);
void RCC_APB1PeriphClockCmd(uint32_t RCC_APB1Periph, FunctionalState NewState);





void RCC_APB2PeriphResetCmd(uint32_t RCC_APB2Periph, FunctionalState NewState);
void RCC_APB1PeriphResetCmd(uint32_t RCC_APB1Periph, FunctionalState NewState);
void RCC_BackupResetCmd(FunctionalState NewState);
void RCC_ClockSecuritySystemCmd(FunctionalState NewState);
void RCC_MCOConfig(uint8_t RCC_MCO);
FlagStatus RCC_GetFlagStatus(uint8_t RCC_FLAG);
void RCC_ClearFlag(void);
ITStatus RCC_GetITStatus(uint8_t RCC_IT);
void RCC_ClearITPendingBit(uint8_t RCC_IT);








 



 



  

 
#line 43 "..\\USER\\stm32f10x_conf.h"
 
 
 
 
 
 
#line 1 "..\\Libraries\\STM32F10x_StdPeriph_Driver\\inc\\misc.h"



















  

 







 
#line 32 "..\\Libraries\\STM32F10x_StdPeriph_Driver\\inc\\misc.h"



 



 



 



 

typedef struct
{
  uint8_t NVIC_IRQChannel;                    


 

  uint8_t NVIC_IRQChannelPreemptionPriority;  

 

  uint8_t NVIC_IRQChannelSubPriority;         

 

  FunctionalState NVIC_IRQChannelCmd;         

    
} NVIC_InitTypeDef;
 


 



 
























 



 



 



 







 



 

#line 132 "..\\Libraries\\STM32F10x_StdPeriph_Driver\\inc\\misc.h"


 



 

#line 150 "..\\Libraries\\STM32F10x_StdPeriph_Driver\\inc\\misc.h"















 



 







 



 



 



 



 

void NVIC_PriorityGroupConfig(uint32_t NVIC_PriorityGroup);
void NVIC_Init(NVIC_InitTypeDef* NVIC_InitStruct);
void NVIC_SetVectorTable(uint32_t NVIC_VectTab, uint32_t Offset);
void NVIC_SystemLPConfig(uint8_t LowPowerMode, FunctionalState NewState);
void SysTick_CLKSourceConfig(uint32_t SysTick_CLKSource);









 



 



 

 
#line 50 "..\\USER\\stm32f10x_conf.h"

 
 

 
 

 
#line 74 "..\\USER\\stm32f10x_conf.h"



 
#line 8281 "..\\Libraries\\CMSIS\\CM3\\DeviceSupport\\ST\\STM32F10x\\stm32f10x.h"




 

















 









 

  

 

 
#line 32 "..\\Libraries\\STM32F10x_StdPeriph_Driver\\inc\\stm32f10x_tim.h"



 



  



  




 

typedef struct
{
  uint16_t TIM_Prescaler;         
 

  uint16_t TIM_CounterMode;       
 

  uint16_t TIM_Period;            

  

  uint16_t TIM_ClockDivision;     
 

  uint8_t TIM_RepetitionCounter;  






 
} TIM_TimeBaseInitTypeDef;       



 

typedef struct
{
  uint16_t TIM_OCMode;        
 

  uint16_t TIM_OutputState;   
 

  uint16_t TIM_OutputNState;  

 

  uint16_t TIM_Pulse;         
 

  uint16_t TIM_OCPolarity;    
 

  uint16_t TIM_OCNPolarity;   

 

  uint16_t TIM_OCIdleState;   

 

  uint16_t TIM_OCNIdleState;  

 
} TIM_OCInitTypeDef;



 

typedef struct
{

  uint16_t TIM_Channel;      
 

  uint16_t TIM_ICPolarity;   
 

  uint16_t TIM_ICSelection;  
 

  uint16_t TIM_ICPrescaler;  
 

  uint16_t TIM_ICFilter;     
 
} TIM_ICInitTypeDef;




 

typedef struct
{

  uint16_t TIM_OSSRState;        
 

  uint16_t TIM_OSSIState;        
 

  uint16_t TIM_LOCKLevel;        
  

  uint16_t TIM_DeadTime;         

 

  uint16_t TIM_Break;            
 

  uint16_t TIM_BreakPolarity;    
 

  uint16_t TIM_AutomaticOutput;  
 
} TIM_BDTRInitTypeDef;



 

#line 185 "..\\Libraries\\STM32F10x_StdPeriph_Driver\\inc\\stm32f10x_tim.h"

 



 






 
#line 204 "..\\Libraries\\STM32F10x_StdPeriph_Driver\\inc\\stm32f10x_tim.h"
									                                 
 
#line 215 "..\\Libraries\\STM32F10x_StdPeriph_Driver\\inc\\stm32f10x_tim.h"

                                             
#line 224 "..\\Libraries\\STM32F10x_StdPeriph_Driver\\inc\\stm32f10x_tim.h"

 
#line 235 "..\\Libraries\\STM32F10x_StdPeriph_Driver\\inc\\stm32f10x_tim.h"

 
#line 248 "..\\Libraries\\STM32F10x_StdPeriph_Driver\\inc\\stm32f10x_tim.h"

                                         
#line 265 "..\\Libraries\\STM32F10x_StdPeriph_Driver\\inc\\stm32f10x_tim.h"

 
#line 278 "..\\Libraries\\STM32F10x_StdPeriph_Driver\\inc\\stm32f10x_tim.h"
                                                                                                                                                                                                                          


  



 

#line 307 "..\\Libraries\\STM32F10x_StdPeriph_Driver\\inc\\stm32f10x_tim.h"


 



 







  



 

#line 340 "..\\Libraries\\STM32F10x_StdPeriph_Driver\\inc\\stm32f10x_tim.h"


  



 

#line 354 "..\\Libraries\\STM32F10x_StdPeriph_Driver\\inc\\stm32f10x_tim.h"


 



 

#line 372 "..\\Libraries\\STM32F10x_StdPeriph_Driver\\inc\\stm32f10x_tim.h"


  



 







 



 
  






 



 







  



 







  



 







  



 







  



 







  



 







  



 







  



 

#line 496 "..\\Libraries\\STM32F10x_StdPeriph_Driver\\inc\\stm32f10x_tim.h"


  



 







 



 







  



 







  



 







  



 

#line 560 "..\\Libraries\\STM32F10x_StdPeriph_Driver\\inc\\stm32f10x_tim.h"


  



 

#line 576 "..\\Libraries\\STM32F10x_StdPeriph_Driver\\inc\\stm32f10x_tim.h"


  



 

#line 592 "..\\Libraries\\STM32F10x_StdPeriph_Driver\\inc\\stm32f10x_tim.h"


  



 

#line 609 "..\\Libraries\\STM32F10x_StdPeriph_Driver\\inc\\stm32f10x_tim.h"

#line 618 "..\\Libraries\\STM32F10x_StdPeriph_Driver\\inc\\stm32f10x_tim.h"


  



 

#line 664 "..\\Libraries\\STM32F10x_StdPeriph_Driver\\inc\\stm32f10x_tim.h"


  



 

#line 708 "..\\Libraries\\STM32F10x_StdPeriph_Driver\\inc\\stm32f10x_tim.h"


  



 

#line 724 "..\\Libraries\\STM32F10x_StdPeriph_Driver\\inc\\stm32f10x_tim.h"



  



 

#line 741 "..\\Libraries\\STM32F10x_StdPeriph_Driver\\inc\\stm32f10x_tim.h"


  



 

#line 769 "..\\Libraries\\STM32F10x_StdPeriph_Driver\\inc\\stm32f10x_tim.h"


  



 

#line 783 "..\\Libraries\\STM32F10x_StdPeriph_Driver\\inc\\stm32f10x_tim.h"


  



  






 



 







  



 







  



 

#line 832 "..\\Libraries\\STM32F10x_StdPeriph_Driver\\inc\\stm32f10x_tim.h"


  




 

#line 850 "..\\Libraries\\STM32F10x_StdPeriph_Driver\\inc\\stm32f10x_tim.h"



  



 

#line 865 "..\\Libraries\\STM32F10x_StdPeriph_Driver\\inc\\stm32f10x_tim.h"


  



 







  



 





                                     


  



 







  



 

#line 926 "..\\Libraries\\STM32F10x_StdPeriph_Driver\\inc\\stm32f10x_tim.h"


  



 

#line 942 "..\\Libraries\\STM32F10x_StdPeriph_Driver\\inc\\stm32f10x_tim.h"


  



 







  



 

#line 986 "..\\Libraries\\STM32F10x_StdPeriph_Driver\\inc\\stm32f10x_tim.h"
                               
                               



  



 




  



 




  



 



 



  



 

void TIM_DeInit(TIM_TypeDef* TIMx);
void TIM_TimeBaseInit(TIM_TypeDef* TIMx, TIM_TimeBaseInitTypeDef* TIM_TimeBaseInitStruct);
void TIM_OC1Init(TIM_TypeDef* TIMx, TIM_OCInitTypeDef* TIM_OCInitStruct);
void TIM_OC2Init(TIM_TypeDef* TIMx, TIM_OCInitTypeDef* TIM_OCInitStruct);
void TIM_OC3Init(TIM_TypeDef* TIMx, TIM_OCInitTypeDef* TIM_OCInitStruct);
void TIM_OC4Init(TIM_TypeDef* TIMx, TIM_OCInitTypeDef* TIM_OCInitStruct);
void TIM_ICInit(TIM_TypeDef* TIMx, TIM_ICInitTypeDef* TIM_ICInitStruct);
void TIM_PWMIConfig(TIM_TypeDef* TIMx, TIM_ICInitTypeDef* TIM_ICInitStruct);
void TIM_BDTRConfig(TIM_TypeDef* TIMx, TIM_BDTRInitTypeDef *TIM_BDTRInitStruct);
void TIM_TimeBaseStructInit(TIM_TimeBaseInitTypeDef* TIM_TimeBaseInitStruct);
void TIM_OCStructInit(TIM_OCInitTypeDef* TIM_OCInitStruct);
void TIM_ICStructInit(TIM_ICInitTypeDef* TIM_ICInitStruct);
void TIM_BDTRStructInit(TIM_BDTRInitTypeDef* TIM_BDTRInitStruct);
void TIM_Cmd(TIM_TypeDef* TIMx, FunctionalState NewState);
void TIM_CtrlPWMOutputs(TIM_TypeDef* TIMx, FunctionalState NewState);
void TIM_ITConfig(TIM_TypeDef* TIMx, uint16_t TIM_IT, FunctionalState NewState);
void TIM_GenerateEvent(TIM_TypeDef* TIMx, uint16_t TIM_EventSource);
void TIM_DMAConfig(TIM_TypeDef* TIMx, uint16_t TIM_DMABase, uint16_t TIM_DMABurstLength);
void TIM_DMACmd(TIM_TypeDef* TIMx, uint16_t TIM_DMASource, FunctionalState NewState);
void TIM_InternalClockConfig(TIM_TypeDef* TIMx);
void TIM_ITRxExternalClockConfig(TIM_TypeDef* TIMx, uint16_t TIM_InputTriggerSource);
void TIM_TIxExternalClockConfig(TIM_TypeDef* TIMx, uint16_t TIM_TIxExternalCLKSource,
                                uint16_t TIM_ICPolarity, uint16_t ICFilter);
void TIM_ETRClockMode1Config(TIM_TypeDef* TIMx, uint16_t TIM_ExtTRGPrescaler, uint16_t TIM_ExtTRGPolarity,
                             uint16_t ExtTRGFilter);
void TIM_ETRClockMode2Config(TIM_TypeDef* TIMx, uint16_t TIM_ExtTRGPrescaler, 
                             uint16_t TIM_ExtTRGPolarity, uint16_t ExtTRGFilter);
void TIM_ETRConfig(TIM_TypeDef* TIMx, uint16_t TIM_ExtTRGPrescaler, uint16_t TIM_ExtTRGPolarity,
                   uint16_t ExtTRGFilter);
void TIM_PrescalerConfig(TIM_TypeDef* TIMx, uint16_t Prescaler, uint16_t TIM_PSCReloadMode);
void TIM_CounterModeConfig(TIM_TypeDef* TIMx, uint16_t TIM_CounterMode);
void TIM_SelectInputTrigger(TIM_TypeDef* TIMx, uint16_t TIM_InputTriggerSource);
void TIM_EncoderInterfaceConfig(TIM_TypeDef* TIMx, uint16_t TIM_EncoderMode,
                                uint16_t TIM_IC1Polarity, uint16_t TIM_IC2Polarity);
void TIM_ForcedOC1Config(TIM_TypeDef* TIMx, uint16_t TIM_ForcedAction);
void TIM_ForcedOC2Config(TIM_TypeDef* TIMx, uint16_t TIM_ForcedAction);
void TIM_ForcedOC3Config(TIM_TypeDef* TIMx, uint16_t TIM_ForcedAction);
void TIM_ForcedOC4Config(TIM_TypeDef* TIMx, uint16_t TIM_ForcedAction);
void TIM_ARRPreloadConfig(TIM_TypeDef* TIMx, FunctionalState NewState);
void TIM_SelectCOM(TIM_TypeDef* TIMx, FunctionalState NewState);
void TIM_SelectCCDMA(TIM_TypeDef* TIMx, FunctionalState NewState);
void TIM_CCPreloadControl(TIM_TypeDef* TIMx, FunctionalState NewState);
void TIM_OC1PreloadConfig(TIM_TypeDef* TIMx, uint16_t TIM_OCPreload);
void TIM_OC2PreloadConfig(TIM_TypeDef* TIMx, uint16_t TIM_OCPreload);
void TIM_OC3PreloadConfig(TIM_TypeDef* TIMx, uint16_t TIM_OCPreload);
void TIM_OC4PreloadConfig(TIM_TypeDef* TIMx, uint16_t TIM_OCPreload);
void TIM_OC1FastConfig(TIM_TypeDef* TIMx, uint16_t TIM_OCFast);
void TIM_OC2FastConfig(TIM_TypeDef* TIMx, uint16_t TIM_OCFast);
void TIM_OC3FastConfig(TIM_TypeDef* TIMx, uint16_t TIM_OCFast);
void TIM_OC4FastConfig(TIM_TypeDef* TIMx, uint16_t TIM_OCFast);
void TIM_ClearOC1Ref(TIM_TypeDef* TIMx, uint16_t TIM_OCClear);
void TIM_ClearOC2Ref(TIM_TypeDef* TIMx, uint16_t TIM_OCClear);
void TIM_ClearOC3Ref(TIM_TypeDef* TIMx, uint16_t TIM_OCClear);
void TIM_ClearOC4Ref(TIM_TypeDef* TIMx, uint16_t TIM_OCClear);
void TIM_OC1PolarityConfig(TIM_TypeDef* TIMx, uint16_t TIM_OCPolarity);
void TIM_OC1NPolarityConfig(TIM_TypeDef* TIMx, uint16_t TIM_OCNPolarity);
void TIM_OC2PolarityConfig(TIM_TypeDef* TIMx, uint16_t TIM_OCPolarity);
void TIM_OC2NPolarityConfig(TIM_TypeDef* TIMx, uint16_t TIM_OCNPolarity);
void TIM_OC3PolarityConfig(TIM_TypeDef* TIMx, uint16_t TIM_OCPolarity);
void TIM_OC3NPolarityConfig(TIM_TypeDef* TIMx, uint16_t TIM_OCNPolarity);
void TIM_OC4PolarityConfig(TIM_TypeDef* TIMx, uint16_t TIM_OCPolarity);
void TIM_CCxCmd(TIM_TypeDef* TIMx, uint16_t TIM_Channel, uint16_t TIM_CCx);
void TIM_CCxNCmd(TIM_TypeDef* TIMx, uint16_t TIM_Channel, uint16_t TIM_CCxN);
void TIM_SelectOCxM(TIM_TypeDef* TIMx, uint16_t TIM_Channel, uint16_t TIM_OCMode);
void TIM_UpdateDisableConfig(TIM_TypeDef* TIMx, FunctionalState NewState);
void TIM_UpdateRequestConfig(TIM_TypeDef* TIMx, uint16_t TIM_UpdateSource);
void TIM_SelectHallSensor(TIM_TypeDef* TIMx, FunctionalState NewState);
void TIM_SelectOnePulseMode(TIM_TypeDef* TIMx, uint16_t TIM_OPMode);
void TIM_SelectOutputTrigger(TIM_TypeDef* TIMx, uint16_t TIM_TRGOSource);
void TIM_SelectSlaveMode(TIM_TypeDef* TIMx, uint16_t TIM_SlaveMode);
void TIM_SelectMasterSlaveMode(TIM_TypeDef* TIMx, uint16_t TIM_MasterSlaveMode);
void TIM_SetCounter(TIM_TypeDef* TIMx, uint16_t Counter);
void TIM_SetAutoreload(TIM_TypeDef* TIMx, uint16_t Autoreload);
void TIM_SetCompare1(TIM_TypeDef* TIMx, uint16_t Compare1);
void TIM_SetCompare2(TIM_TypeDef* TIMx, uint16_t Compare2);
void TIM_SetCompare3(TIM_TypeDef* TIMx, uint16_t Compare3);
void TIM_SetCompare4(TIM_TypeDef* TIMx, uint16_t Compare4);
void TIM_SetIC1Prescaler(TIM_TypeDef* TIMx, uint16_t TIM_ICPSC);
void TIM_SetIC2Prescaler(TIM_TypeDef* TIMx, uint16_t TIM_ICPSC);
void TIM_SetIC3Prescaler(TIM_TypeDef* TIMx, uint16_t TIM_ICPSC);
void TIM_SetIC4Prescaler(TIM_TypeDef* TIMx, uint16_t TIM_ICPSC);
void TIM_SetClockDivision(TIM_TypeDef* TIMx, uint16_t TIM_CKD);
uint16_t TIM_GetCapture1(TIM_TypeDef* TIMx);
uint16_t TIM_GetCapture2(TIM_TypeDef* TIMx);
uint16_t TIM_GetCapture3(TIM_TypeDef* TIMx);
uint16_t TIM_GetCapture4(TIM_TypeDef* TIMx);
uint16_t TIM_GetCounter(TIM_TypeDef* TIMx);
uint16_t TIM_GetPrescaler(TIM_TypeDef* TIMx);
FlagStatus TIM_GetFlagStatus(TIM_TypeDef* TIMx, uint16_t TIM_FLAG);
void TIM_ClearFlag(TIM_TypeDef* TIMx, uint16_t TIM_FLAG);
ITStatus TIM_GetITStatus(TIM_TypeDef* TIMx, uint16_t TIM_IT);
void TIM_ClearITPendingBit(TIM_TypeDef* TIMx, uint16_t TIM_IT);








  



  



 

 
#line 23 "..\\Libraries\\STM32F10x_StdPeriph_Driver\\src\\stm32f10x_tim.c"
#line 24 "..\\Libraries\\STM32F10x_StdPeriph_Driver\\src\\stm32f10x_tim.c"



 




 



 



 



 

 







 



 



 



 



 



 

static void TI1_Config(TIM_TypeDef* TIMx, uint16_t TIM_ICPolarity, uint16_t TIM_ICSelection,
                       uint16_t TIM_ICFilter);
static void TI2_Config(TIM_TypeDef* TIMx, uint16_t TIM_ICPolarity, uint16_t TIM_ICSelection,
                       uint16_t TIM_ICFilter);
static void TI3_Config(TIM_TypeDef* TIMx, uint16_t TIM_ICPolarity, uint16_t TIM_ICSelection,
                       uint16_t TIM_ICFilter);
static void TI4_Config(TIM_TypeDef* TIMx, uint16_t TIM_ICPolarity, uint16_t TIM_ICSelection,
                       uint16_t TIM_ICFilter);


 



 



 



 



 



 



 



 





 
void TIM_DeInit(TIM_TypeDef* TIMx)
{
   
  ((void)0); 
 
  if (TIMx == ((TIM_TypeDef *) ((((uint32_t)0x40000000) + 0x10000) + 0x2C00)))
  {
    RCC_APB2PeriphResetCmd(((uint32_t)0x00000800), ENABLE);
    RCC_APB2PeriphResetCmd(((uint32_t)0x00000800), DISABLE);  
  }     
  else if (TIMx == ((TIM_TypeDef *) (((uint32_t)0x40000000) + 0x0000)))
  {
    RCC_APB1PeriphResetCmd(((uint32_t)0x00000001), ENABLE);
    RCC_APB1PeriphResetCmd(((uint32_t)0x00000001), DISABLE);
  }
  else if (TIMx == ((TIM_TypeDef *) (((uint32_t)0x40000000) + 0x0400)))
  {
    RCC_APB1PeriphResetCmd(((uint32_t)0x00000002), ENABLE);
    RCC_APB1PeriphResetCmd(((uint32_t)0x00000002), DISABLE);
  }
  else if (TIMx == ((TIM_TypeDef *) (((uint32_t)0x40000000) + 0x0800)))
  {
    RCC_APB1PeriphResetCmd(((uint32_t)0x00000004), ENABLE);
    RCC_APB1PeriphResetCmd(((uint32_t)0x00000004), DISABLE);
  } 
  else if (TIMx == ((TIM_TypeDef *) (((uint32_t)0x40000000) + 0x0C00)))
  {
    RCC_APB1PeriphResetCmd(((uint32_t)0x00000008), ENABLE);
    RCC_APB1PeriphResetCmd(((uint32_t)0x00000008), DISABLE);
  } 
  else if (TIMx == ((TIM_TypeDef *) (((uint32_t)0x40000000) + 0x1000)))
  {
    RCC_APB1PeriphResetCmd(((uint32_t)0x00000010), ENABLE);
    RCC_APB1PeriphResetCmd(((uint32_t)0x00000010), DISABLE);
  } 
  else if (TIMx == ((TIM_TypeDef *) (((uint32_t)0x40000000) + 0x1400)))
  {
    RCC_APB1PeriphResetCmd(((uint32_t)0x00000020), ENABLE);
    RCC_APB1PeriphResetCmd(((uint32_t)0x00000020), DISABLE);
  } 
  else if (TIMx == ((TIM_TypeDef *) ((((uint32_t)0x40000000) + 0x10000) + 0x3400)))
  {
    RCC_APB2PeriphResetCmd(((uint32_t)0x00002000), ENABLE);
    RCC_APB2PeriphResetCmd(((uint32_t)0x00002000), DISABLE);
  }
  else if (TIMx == ((TIM_TypeDef *) ((((uint32_t)0x40000000) + 0x10000) + 0x4C00)))
  {      
    RCC_APB2PeriphResetCmd(((uint32_t)0x00080000), ENABLE);
    RCC_APB2PeriphResetCmd(((uint32_t)0x00080000), DISABLE);  
   }  
  else if (TIMx == ((TIM_TypeDef *) ((((uint32_t)0x40000000) + 0x10000) + 0x5000)))
  {      
    RCC_APB2PeriphResetCmd(((uint32_t)0x00100000), ENABLE);
    RCC_APB2PeriphResetCmd(((uint32_t)0x00100000), DISABLE);  
  }  
  else if (TIMx == ((TIM_TypeDef *) ((((uint32_t)0x40000000) + 0x10000) + 0x5400))) 
  {     
    RCC_APB2PeriphResetCmd(((uint32_t)0x00200000), ENABLE);
    RCC_APB2PeriphResetCmd(((uint32_t)0x00200000), DISABLE);  
  }  
  else if (TIMx == ((TIM_TypeDef *) (((uint32_t)0x40000000) + 0x1800)))
  {      
    RCC_APB1PeriphResetCmd(((uint32_t)0x00000040), ENABLE);
    RCC_APB1PeriphResetCmd(((uint32_t)0x00000040), DISABLE);  
  }  
  else if (TIMx == ((TIM_TypeDef *) (((uint32_t)0x40000000) + 0x1C00))) 
  {       
    RCC_APB1PeriphResetCmd(((uint32_t)0x00000080), ENABLE);
    RCC_APB1PeriphResetCmd(((uint32_t)0x00000080), DISABLE);  
  }
  else if (TIMx == ((TIM_TypeDef *) (((uint32_t)0x40000000) + 0x2000))) 
  {       
    RCC_APB1PeriphResetCmd(((uint32_t)0x00000100), ENABLE);
    RCC_APB1PeriphResetCmd(((uint32_t)0x00000100), DISABLE);  
  }        
  else if (TIMx == ((TIM_TypeDef *) ((((uint32_t)0x40000000) + 0x10000) + 0x4000)))
  {
    RCC_APB2PeriphResetCmd(((uint32_t)0x00010000), ENABLE);
    RCC_APB2PeriphResetCmd(((uint32_t)0x00010000), DISABLE);
  } 
  else if (TIMx == ((TIM_TypeDef *) ((((uint32_t)0x40000000) + 0x10000) + 0x4400)))
  {
    RCC_APB2PeriphResetCmd(((uint32_t)0x00020000), ENABLE);
    RCC_APB2PeriphResetCmd(((uint32_t)0x00020000), DISABLE);
  } 
  else
  {
    if (TIMx == ((TIM_TypeDef *) ((((uint32_t)0x40000000) + 0x10000) + 0x4800)))
    {
      RCC_APB2PeriphResetCmd(((uint32_t)0x00040000), ENABLE);
      RCC_APB2PeriphResetCmd(((uint32_t)0x00040000), DISABLE);
    }  
  }
}








 
void TIM_TimeBaseInit(TIM_TypeDef* TIMx, TIM_TimeBaseInitTypeDef* TIM_TimeBaseInitStruct)
{
  uint16_t tmpcr1 = 0;

   
  ((void)0); 
  ((void)0);
  ((void)0);

  tmpcr1 = TIMx->CR1;  

  if((TIMx == ((TIM_TypeDef *) ((((uint32_t)0x40000000) + 0x10000) + 0x2C00))) || (TIMx == ((TIM_TypeDef *) ((((uint32_t)0x40000000) + 0x10000) + 0x3400)))|| (TIMx == ((TIM_TypeDef *) (((uint32_t)0x40000000) + 0x0000))) || (TIMx == ((TIM_TypeDef *) (((uint32_t)0x40000000) + 0x0400)))||
     (TIMx == ((TIM_TypeDef *) (((uint32_t)0x40000000) + 0x0800))) || (TIMx == ((TIM_TypeDef *) (((uint32_t)0x40000000) + 0x0C00)))) 
  {
     
    tmpcr1 &= (uint16_t)(~((uint16_t)(((uint16_t)0x0010) | ((uint16_t)0x0060))));
    tmpcr1 |= (uint32_t)TIM_TimeBaseInitStruct->TIM_CounterMode;
  }
 
  if((TIMx != ((TIM_TypeDef *) (((uint32_t)0x40000000) + 0x1000))) && (TIMx != ((TIM_TypeDef *) (((uint32_t)0x40000000) + 0x1400))))
  {
     
    tmpcr1 &= (uint16_t)(~((uint16_t)((uint16_t)0x0300)));
    tmpcr1 |= (uint32_t)TIM_TimeBaseInitStruct->TIM_ClockDivision;
  }

  TIMx->CR1 = tmpcr1;

   
  TIMx->ARR = TIM_TimeBaseInitStruct->TIM_Period ;
 
   
  TIMx->PSC = TIM_TimeBaseInitStruct->TIM_Prescaler;
    
  if ((TIMx == ((TIM_TypeDef *) ((((uint32_t)0x40000000) + 0x10000) + 0x2C00))) || (TIMx == ((TIM_TypeDef *) ((((uint32_t)0x40000000) + 0x10000) + 0x3400)))|| (TIMx == ((TIM_TypeDef *) ((((uint32_t)0x40000000) + 0x10000) + 0x4000)))|| (TIMx == ((TIM_TypeDef *) ((((uint32_t)0x40000000) + 0x10000) + 0x4400))) || (TIMx == ((TIM_TypeDef *) ((((uint32_t)0x40000000) + 0x10000) + 0x4800))))  
  {
     
    TIMx->RCR = TIM_TimeBaseInitStruct->TIM_RepetitionCounter;
  }

  
 
  TIMx->EGR = ((uint16_t)0x0001);           
}








 
void TIM_OC1Init(TIM_TypeDef* TIMx, TIM_OCInitTypeDef* TIM_OCInitStruct)
{
  uint16_t tmpccmrx = 0, tmpccer = 0, tmpcr2 = 0;
   
   
  ((void)0);
  ((void)0);
  ((void)0);
  ((void)0);   
  
  TIMx->CCER &= (uint16_t)(~(uint16_t)((uint16_t)0x0001));
   
  tmpccer = TIMx->CCER;
   
  tmpcr2 =  TIMx->CR2;
  
   
  tmpccmrx = TIMx->CCMR1;
    
   
  tmpccmrx &= (uint16_t)(~((uint16_t)((uint16_t)0x0070)));
  tmpccmrx &= (uint16_t)(~((uint16_t)((uint16_t)0x0003)));

   
  tmpccmrx |= TIM_OCInitStruct->TIM_OCMode;
  
   
  tmpccer &= (uint16_t)(~((uint16_t)((uint16_t)0x0002)));
   
  tmpccer |= TIM_OCInitStruct->TIM_OCPolarity;
  
   
  tmpccer |= TIM_OCInitStruct->TIM_OutputState;
    
  if((TIMx == ((TIM_TypeDef *) ((((uint32_t)0x40000000) + 0x10000) + 0x2C00))) || (TIMx == ((TIM_TypeDef *) ((((uint32_t)0x40000000) + 0x10000) + 0x3400)))|| (TIMx == ((TIM_TypeDef *) ((((uint32_t)0x40000000) + 0x10000) + 0x4000)))||
     (TIMx == ((TIM_TypeDef *) ((((uint32_t)0x40000000) + 0x10000) + 0x4400)))|| (TIMx == ((TIM_TypeDef *) ((((uint32_t)0x40000000) + 0x10000) + 0x4800))))
  {
    ((void)0);
    ((void)0);
    ((void)0);
    ((void)0);
    
     
    tmpccer &= (uint16_t)(~((uint16_t)((uint16_t)0x0008)));
     
    tmpccer |= TIM_OCInitStruct->TIM_OCNPolarity;
    
     
    tmpccer &= (uint16_t)(~((uint16_t)((uint16_t)0x0004)));    
     
    tmpccer |= TIM_OCInitStruct->TIM_OutputNState;
    
     
    tmpcr2 &= (uint16_t)(~((uint16_t)((uint16_t)0x0100)));
    tmpcr2 &= (uint16_t)(~((uint16_t)((uint16_t)0x0200)));
    
     
    tmpcr2 |= TIM_OCInitStruct->TIM_OCIdleState;
     
    tmpcr2 |= TIM_OCInitStruct->TIM_OCNIdleState;
  }
   
  TIMx->CR2 = tmpcr2;
  
   
  TIMx->CCMR1 = tmpccmrx;

   
  TIMx->CCR1 = TIM_OCInitStruct->TIM_Pulse; 
 
   
  TIMx->CCER = tmpccer;
}









 
void TIM_OC2Init(TIM_TypeDef* TIMx, TIM_OCInitTypeDef* TIM_OCInitStruct)
{
  uint16_t tmpccmrx = 0, tmpccer = 0, tmpcr2 = 0;
   
   
  ((void)0); 
  ((void)0);
  ((void)0);
  ((void)0);   
    
  TIMx->CCER &= (uint16_t)(~((uint16_t)((uint16_t)0x0010)));
  
     
  tmpccer = TIMx->CCER;
   
  tmpcr2 =  TIMx->CR2;
  
   
  tmpccmrx = TIMx->CCMR1;
    
   
  tmpccmrx &= (uint16_t)(~((uint16_t)((uint16_t)0x7000)));
  tmpccmrx &= (uint16_t)(~((uint16_t)((uint16_t)0x0300)));
  
   
  tmpccmrx |= (uint16_t)(TIM_OCInitStruct->TIM_OCMode << 8);
  
   
  tmpccer &= (uint16_t)(~((uint16_t)((uint16_t)0x0020)));
   
  tmpccer |= (uint16_t)(TIM_OCInitStruct->TIM_OCPolarity << 4);
  
   
  tmpccer |= (uint16_t)(TIM_OCInitStruct->TIM_OutputState << 4);
    
  if((TIMx == ((TIM_TypeDef *) ((((uint32_t)0x40000000) + 0x10000) + 0x2C00))) || (TIMx == ((TIM_TypeDef *) ((((uint32_t)0x40000000) + 0x10000) + 0x3400))))
  {
    ((void)0);
    ((void)0);
    ((void)0);
    ((void)0);
    
     
    tmpccer &= (uint16_t)(~((uint16_t)((uint16_t)0x0080)));
     
    tmpccer |= (uint16_t)(TIM_OCInitStruct->TIM_OCNPolarity << 4);
    
     
    tmpccer &= (uint16_t)(~((uint16_t)((uint16_t)0x0040)));    
     
    tmpccer |= (uint16_t)(TIM_OCInitStruct->TIM_OutputNState << 4);
    
     
    tmpcr2 &= (uint16_t)(~((uint16_t)((uint16_t)0x0400)));
    tmpcr2 &= (uint16_t)(~((uint16_t)((uint16_t)0x0800)));
    
     
    tmpcr2 |= (uint16_t)(TIM_OCInitStruct->TIM_OCIdleState << 2);
     
    tmpcr2 |= (uint16_t)(TIM_OCInitStruct->TIM_OCNIdleState << 2);
  }
   
  TIMx->CR2 = tmpcr2;
  
   
  TIMx->CCMR1 = tmpccmrx;

   
  TIMx->CCR2 = TIM_OCInitStruct->TIM_Pulse;
  
   
  TIMx->CCER = tmpccer;
}








 
void TIM_OC3Init(TIM_TypeDef* TIMx, TIM_OCInitTypeDef* TIM_OCInitStruct)
{
  uint16_t tmpccmrx = 0, tmpccer = 0, tmpcr2 = 0;
   
   
  ((void)0); 
  ((void)0);
  ((void)0);
  ((void)0);   
   
  TIMx->CCER &= (uint16_t)(~((uint16_t)((uint16_t)0x0100)));
  
   
  tmpccer = TIMx->CCER;
   
  tmpcr2 =  TIMx->CR2;
  
   
  tmpccmrx = TIMx->CCMR2;
    
   
  tmpccmrx &= (uint16_t)(~((uint16_t)((uint16_t)0x0070)));
  tmpccmrx &= (uint16_t)(~((uint16_t)((uint16_t)0x0003)));  
   
  tmpccmrx |= TIM_OCInitStruct->TIM_OCMode;
  
   
  tmpccer &= (uint16_t)(~((uint16_t)((uint16_t)0x0200)));
   
  tmpccer |= (uint16_t)(TIM_OCInitStruct->TIM_OCPolarity << 8);
  
   
  tmpccer |= (uint16_t)(TIM_OCInitStruct->TIM_OutputState << 8);
    
  if((TIMx == ((TIM_TypeDef *) ((((uint32_t)0x40000000) + 0x10000) + 0x2C00))) || (TIMx == ((TIM_TypeDef *) ((((uint32_t)0x40000000) + 0x10000) + 0x3400))))
  {
    ((void)0);
    ((void)0);
    ((void)0);
    ((void)0);
    
     
    tmpccer &= (uint16_t)(~((uint16_t)((uint16_t)0x0800)));
     
    tmpccer |= (uint16_t)(TIM_OCInitStruct->TIM_OCNPolarity << 8);
     
    tmpccer &= (uint16_t)(~((uint16_t)((uint16_t)0x0400)));
    
     
    tmpccer |= (uint16_t)(TIM_OCInitStruct->TIM_OutputNState << 8);
     
    tmpcr2 &= (uint16_t)(~((uint16_t)((uint16_t)0x1000)));
    tmpcr2 &= (uint16_t)(~((uint16_t)((uint16_t)0x2000)));
     
    tmpcr2 |= (uint16_t)(TIM_OCInitStruct->TIM_OCIdleState << 4);
     
    tmpcr2 |= (uint16_t)(TIM_OCInitStruct->TIM_OCNIdleState << 4);
  }
   
  TIMx->CR2 = tmpcr2;
  
   
  TIMx->CCMR2 = tmpccmrx;

   
  TIMx->CCR3 = TIM_OCInitStruct->TIM_Pulse;
  
   
  TIMx->CCER = tmpccer;
}








 
void TIM_OC4Init(TIM_TypeDef* TIMx, TIM_OCInitTypeDef* TIM_OCInitStruct)
{
  uint16_t tmpccmrx = 0, tmpccer = 0, tmpcr2 = 0;
   
   
  ((void)0); 
  ((void)0);
  ((void)0);
  ((void)0);   
   
  TIMx->CCER &= (uint16_t)(~((uint16_t)((uint16_t)0x1000)));
  
   
  tmpccer = TIMx->CCER;
   
  tmpcr2 =  TIMx->CR2;
  
   
  tmpccmrx = TIMx->CCMR2;
    
   
  tmpccmrx &= (uint16_t)(~((uint16_t)((uint16_t)0x7000)));
  tmpccmrx &= (uint16_t)(~((uint16_t)((uint16_t)0x0300)));
  
   
  tmpccmrx |= (uint16_t)(TIM_OCInitStruct->TIM_OCMode << 8);
  
   
  tmpccer &= (uint16_t)(~((uint16_t)((uint16_t)0x2000)));
   
  tmpccer |= (uint16_t)(TIM_OCInitStruct->TIM_OCPolarity << 12);
  
   
  tmpccer |= (uint16_t)(TIM_OCInitStruct->TIM_OutputState << 12);
    
  if((TIMx == ((TIM_TypeDef *) ((((uint32_t)0x40000000) + 0x10000) + 0x2C00))) || (TIMx == ((TIM_TypeDef *) ((((uint32_t)0x40000000) + 0x10000) + 0x3400))))
  {
    ((void)0);
     
    tmpcr2 &= (uint16_t)(~((uint16_t)((uint16_t)0x4000)));
     
    tmpcr2 |= (uint16_t)(TIM_OCInitStruct->TIM_OCIdleState << 6);
  }
   
  TIMx->CR2 = tmpcr2;
  
     
  TIMx->CCMR2 = tmpccmrx;

   
  TIMx->CCR4 = TIM_OCInitStruct->TIM_Pulse;
  
   
  TIMx->CCER = tmpccer;
}








 
void TIM_ICInit(TIM_TypeDef* TIMx, TIM_ICInitTypeDef* TIM_ICInitStruct)
{
   
  ((void)0);  
  ((void)0);
  ((void)0);
  ((void)0);
  
  if((TIMx == ((TIM_TypeDef *) ((((uint32_t)0x40000000) + 0x10000) + 0x2C00))) || (TIMx == ((TIM_TypeDef *) ((((uint32_t)0x40000000) + 0x10000) + 0x3400))) || (TIMx == ((TIM_TypeDef *) (((uint32_t)0x40000000) + 0x0000))) || (TIMx == ((TIM_TypeDef *) (((uint32_t)0x40000000) + 0x0400))) ||
     (TIMx == ((TIM_TypeDef *) (((uint32_t)0x40000000) + 0x0800))) ||(TIMx == ((TIM_TypeDef *) (((uint32_t)0x40000000) + 0x0C00))))
  {
    ((void)0);
  }
  else
  {
    ((void)0);
  }
  if (TIM_ICInitStruct->TIM_Channel == ((uint16_t)0x0000))
  {
    ((void)0);
     
    TI1_Config(TIMx, TIM_ICInitStruct->TIM_ICPolarity,
               TIM_ICInitStruct->TIM_ICSelection,
               TIM_ICInitStruct->TIM_ICFilter);
     
    TIM_SetIC1Prescaler(TIMx, TIM_ICInitStruct->TIM_ICPrescaler);
  }
  else if (TIM_ICInitStruct->TIM_Channel == ((uint16_t)0x0004))
  {
    ((void)0);
     
    TI2_Config(TIMx, TIM_ICInitStruct->TIM_ICPolarity,
               TIM_ICInitStruct->TIM_ICSelection,
               TIM_ICInitStruct->TIM_ICFilter);
     
    TIM_SetIC2Prescaler(TIMx, TIM_ICInitStruct->TIM_ICPrescaler);
  }
  else if (TIM_ICInitStruct->TIM_Channel == ((uint16_t)0x0008))
  {
    ((void)0);
     
    TI3_Config(TIMx,  TIM_ICInitStruct->TIM_ICPolarity,
               TIM_ICInitStruct->TIM_ICSelection,
               TIM_ICInitStruct->TIM_ICFilter);
     
    TIM_SetIC3Prescaler(TIMx, TIM_ICInitStruct->TIM_ICPrescaler);
  }
  else
  {
    ((void)0);
     
    TI4_Config(TIMx, TIM_ICInitStruct->TIM_ICPolarity,
               TIM_ICInitStruct->TIM_ICSelection,
               TIM_ICInitStruct->TIM_ICFilter);
     
    TIM_SetIC4Prescaler(TIMx, TIM_ICInitStruct->TIM_ICPrescaler);
  }
}








 
void TIM_PWMIConfig(TIM_TypeDef* TIMx, TIM_ICInitTypeDef* TIM_ICInitStruct)
{
  uint16_t icoppositepolarity = ((uint16_t)0x0000);
  uint16_t icoppositeselection = ((uint16_t)0x0001);
   
  ((void)0);
   
  if (TIM_ICInitStruct->TIM_ICPolarity == ((uint16_t)0x0000))
  {
    icoppositepolarity = ((uint16_t)0x0002);
  }
  else
  {
    icoppositepolarity = ((uint16_t)0x0000);
  }
   
  if (TIM_ICInitStruct->TIM_ICSelection == ((uint16_t)0x0001))
  {
    icoppositeselection = ((uint16_t)0x0002);
  }
  else
  {
    icoppositeselection = ((uint16_t)0x0001);
  }
  if (TIM_ICInitStruct->TIM_Channel == ((uint16_t)0x0000))
  {
     
    TI1_Config(TIMx, TIM_ICInitStruct->TIM_ICPolarity, TIM_ICInitStruct->TIM_ICSelection,
               TIM_ICInitStruct->TIM_ICFilter);
     
    TIM_SetIC1Prescaler(TIMx, TIM_ICInitStruct->TIM_ICPrescaler);
     
    TI2_Config(TIMx, icoppositepolarity, icoppositeselection, TIM_ICInitStruct->TIM_ICFilter);
     
    TIM_SetIC2Prescaler(TIMx, TIM_ICInitStruct->TIM_ICPrescaler);
  }
  else
  { 
     
    TI2_Config(TIMx, TIM_ICInitStruct->TIM_ICPolarity, TIM_ICInitStruct->TIM_ICSelection,
               TIM_ICInitStruct->TIM_ICFilter);
     
    TIM_SetIC2Prescaler(TIMx, TIM_ICInitStruct->TIM_ICPrescaler);
     
    TI1_Config(TIMx, icoppositepolarity, icoppositeselection, TIM_ICInitStruct->TIM_ICFilter);
     
    TIM_SetIC1Prescaler(TIMx, TIM_ICInitStruct->TIM_ICPrescaler);
  }
}








 
void TIM_BDTRConfig(TIM_TypeDef* TIMx, TIM_BDTRInitTypeDef *TIM_BDTRInitStruct)
{
   
  ((void)0);
  ((void)0);
  ((void)0);
  ((void)0);
  ((void)0);
  ((void)0);
  ((void)0);
  
 
  TIMx->BDTR = (uint32_t)TIM_BDTRInitStruct->TIM_OSSRState | TIM_BDTRInitStruct->TIM_OSSIState |
             TIM_BDTRInitStruct->TIM_LOCKLevel | TIM_BDTRInitStruct->TIM_DeadTime |
             TIM_BDTRInitStruct->TIM_Break | TIM_BDTRInitStruct->TIM_BreakPolarity |
             TIM_BDTRInitStruct->TIM_AutomaticOutput;
}






 
void TIM_TimeBaseStructInit(TIM_TimeBaseInitTypeDef* TIM_TimeBaseInitStruct)
{
   
  TIM_TimeBaseInitStruct->TIM_Period = 0xFFFF;
  TIM_TimeBaseInitStruct->TIM_Prescaler = 0x0000;
  TIM_TimeBaseInitStruct->TIM_ClockDivision = ((uint16_t)0x0000);
  TIM_TimeBaseInitStruct->TIM_CounterMode = ((uint16_t)0x0000);
  TIM_TimeBaseInitStruct->TIM_RepetitionCounter = 0x0000;
}






 
void TIM_OCStructInit(TIM_OCInitTypeDef* TIM_OCInitStruct)
{
   
  TIM_OCInitStruct->TIM_OCMode = ((uint16_t)0x0000);
  TIM_OCInitStruct->TIM_OutputState = ((uint16_t)0x0000);
  TIM_OCInitStruct->TIM_OutputNState = ((uint16_t)0x0000);
  TIM_OCInitStruct->TIM_Pulse = 0x0000;
  TIM_OCInitStruct->TIM_OCPolarity = ((uint16_t)0x0000);
  TIM_OCInitStruct->TIM_OCNPolarity = ((uint16_t)0x0000);
  TIM_OCInitStruct->TIM_OCIdleState = ((uint16_t)0x0000);
  TIM_OCInitStruct->TIM_OCNIdleState = ((uint16_t)0x0000);
}






 
void TIM_ICStructInit(TIM_ICInitTypeDef* TIM_ICInitStruct)
{
   
  TIM_ICInitStruct->TIM_Channel = ((uint16_t)0x0000);
  TIM_ICInitStruct->TIM_ICPolarity = ((uint16_t)0x0000);
  TIM_ICInitStruct->TIM_ICSelection = ((uint16_t)0x0001);
  TIM_ICInitStruct->TIM_ICPrescaler = ((uint16_t)0x0000);
  TIM_ICInitStruct->TIM_ICFilter = 0x00;
}






 
void TIM_BDTRStructInit(TIM_BDTRInitTypeDef* TIM_BDTRInitStruct)
{
   
  TIM_BDTRInitStruct->TIM_OSSRState = ((uint16_t)0x0000);
  TIM_BDTRInitStruct->TIM_OSSIState = ((uint16_t)0x0000);
  TIM_BDTRInitStruct->TIM_LOCKLevel = ((uint16_t)0x0000);
  TIM_BDTRInitStruct->TIM_DeadTime = 0x00;
  TIM_BDTRInitStruct->TIM_Break = ((uint16_t)0x0000);
  TIM_BDTRInitStruct->TIM_BreakPolarity = ((uint16_t)0x0000);
  TIM_BDTRInitStruct->TIM_AutomaticOutput = ((uint16_t)0x0000);
}







 
void TIM_Cmd(TIM_TypeDef* TIMx, FunctionalState NewState)
{
   
  ((void)0);
  ((void)0);
  
  if (NewState != DISABLE)
  {
     
    TIMx->CR1 |= ((uint16_t)0x0001);
  }
  else
  {
     
    TIMx->CR1 &= (uint16_t)(~((uint16_t)((uint16_t)0x0001)));
  }
}







 
void TIM_CtrlPWMOutputs(TIM_TypeDef* TIMx, FunctionalState NewState)
{
   
  ((void)0);
  ((void)0);
  if (NewState != DISABLE)
  {
     
    TIMx->BDTR |= ((uint16_t)0x8000);
  }
  else
  {
     
    TIMx->BDTR &= (uint16_t)(~((uint16_t)((uint16_t)0x8000)));
  }  
}
























 
void TIM_ITConfig(TIM_TypeDef* TIMx, uint16_t TIM_IT, FunctionalState NewState)
{  
   
  ((void)0);
  ((void)0);
  ((void)0);
  
  if (NewState != DISABLE)
  {
     
    TIMx->DIER |= TIM_IT;
  }
  else
  {
     
    TIMx->DIER &= (uint16_t)~TIM_IT;
  }
}


















 
void TIM_GenerateEvent(TIM_TypeDef* TIMx, uint16_t TIM_EventSource)
{ 
   
  ((void)0);
  ((void)0);
  
   
  TIMx->EGR = TIM_EventSource;
}


















 
void TIM_DMAConfig(TIM_TypeDef* TIMx, uint16_t TIM_DMABase, uint16_t TIM_DMABurstLength)
{
   
  ((void)0);
  ((void)0);
  ((void)0);
   
  TIMx->DCR = TIM_DMABase | TIM_DMABurstLength;
}

















 
void TIM_DMACmd(TIM_TypeDef* TIMx, uint16_t TIM_DMASource, FunctionalState NewState)
{ 
   
  ((void)0);
  ((void)0);
  ((void)0);
  
  if (NewState != DISABLE)
  {
     
    TIMx->DIER |= TIM_DMASource; 
  }
  else
  {
     
    TIMx->DIER &= (uint16_t)~TIM_DMASource;
  }
}






 
void TIM_InternalClockConfig(TIM_TypeDef* TIMx)
{
   
  ((void)0);
   
  TIMx->SMCR &=  (uint16_t)(~((uint16_t)((uint16_t)0x0007)));
}











 
void TIM_ITRxExternalClockConfig(TIM_TypeDef* TIMx, uint16_t TIM_InputTriggerSource)
{
   
  ((void)0);
  ((void)0);
   
  TIM_SelectInputTrigger(TIMx, TIM_InputTriggerSource);
   
  TIMx->SMCR |= ((uint16_t)0x0007);
}
















 
void TIM_TIxExternalClockConfig(TIM_TypeDef* TIMx, uint16_t TIM_TIxExternalCLKSource,
                                uint16_t TIM_ICPolarity, uint16_t ICFilter)
{
   
  ((void)0);
  ((void)0);
  ((void)0);
  ((void)0);
   
  if (TIM_TIxExternalCLKSource == ((uint16_t)0x0060))
  {
    TI2_Config(TIMx, TIM_ICPolarity, ((uint16_t)0x0001), ICFilter);
  }
  else
  {
    TI1_Config(TIMx, TIM_ICPolarity, ((uint16_t)0x0001), ICFilter);
  }
   
  TIM_SelectInputTrigger(TIMx, TIM_TIxExternalCLKSource);
   
  TIMx->SMCR |= ((uint16_t)0x0007);
}

















 
void TIM_ETRClockMode1Config(TIM_TypeDef* TIMx, uint16_t TIM_ExtTRGPrescaler, uint16_t TIM_ExtTRGPolarity,
                             uint16_t ExtTRGFilter)
{
  uint16_t tmpsmcr = 0;
   
  ((void)0);
  ((void)0);
  ((void)0);
  ((void)0);
   
  TIM_ETRConfig(TIMx, TIM_ExtTRGPrescaler, TIM_ExtTRGPolarity, ExtTRGFilter);
  
   
  tmpsmcr = TIMx->SMCR;
   
  tmpsmcr &= (uint16_t)(~((uint16_t)((uint16_t)0x0007)));
   
  tmpsmcr |= ((uint16_t)0x0007);
   
  tmpsmcr &= (uint16_t)(~((uint16_t)((uint16_t)0x0070)));
  tmpsmcr |= ((uint16_t)0x0070);
   
  TIMx->SMCR = tmpsmcr;
}

















 
void TIM_ETRClockMode2Config(TIM_TypeDef* TIMx, uint16_t TIM_ExtTRGPrescaler, 
                             uint16_t TIM_ExtTRGPolarity, uint16_t ExtTRGFilter)
{
   
  ((void)0);
  ((void)0);
  ((void)0);
  ((void)0);
   
  TIM_ETRConfig(TIMx, TIM_ExtTRGPrescaler, TIM_ExtTRGPolarity, ExtTRGFilter);
   
  TIMx->SMCR |= ((uint16_t)0x4000);
}

















 
void TIM_ETRConfig(TIM_TypeDef* TIMx, uint16_t TIM_ExtTRGPrescaler, uint16_t TIM_ExtTRGPolarity,
                   uint16_t ExtTRGFilter)
{
  uint16_t tmpsmcr = 0;
   
  ((void)0);
  ((void)0);
  ((void)0);
  ((void)0);
  tmpsmcr = TIMx->SMCR;
   
  tmpsmcr &= ((uint16_t)0x00FF);
   
  tmpsmcr |= (uint16_t)(TIM_ExtTRGPrescaler | (uint16_t)(TIM_ExtTRGPolarity | (uint16_t)(ExtTRGFilter << (uint16_t)8)));
   
  TIMx->SMCR = tmpsmcr;
}










 
void TIM_PrescalerConfig(TIM_TypeDef* TIMx, uint16_t Prescaler, uint16_t TIM_PSCReloadMode)
{
   
  ((void)0);
  ((void)0);
   
  TIMx->PSC = Prescaler;
   
  TIMx->EGR = TIM_PSCReloadMode;
}












 
void TIM_CounterModeConfig(TIM_TypeDef* TIMx, uint16_t TIM_CounterMode)
{
  uint16_t tmpcr1 = 0;
   
  ((void)0);
  ((void)0);
  tmpcr1 = TIMx->CR1;
   
  tmpcr1 &= (uint16_t)(~((uint16_t)(((uint16_t)0x0010) | ((uint16_t)0x0060))));
   
  tmpcr1 |= TIM_CounterMode;
   
  TIMx->CR1 = tmpcr1;
}















 
void TIM_SelectInputTrigger(TIM_TypeDef* TIMx, uint16_t TIM_InputTriggerSource)
{
  uint16_t tmpsmcr = 0;
   
  ((void)0);
  ((void)0);
   
  tmpsmcr = TIMx->SMCR;
   
  tmpsmcr &= (uint16_t)(~((uint16_t)((uint16_t)0x0070)));
   
  tmpsmcr |= TIM_InputTriggerSource;
   
  TIMx->SMCR = tmpsmcr;
}



















 
void TIM_EncoderInterfaceConfig(TIM_TypeDef* TIMx, uint16_t TIM_EncoderMode,
                                uint16_t TIM_IC1Polarity, uint16_t TIM_IC2Polarity)
{
  uint16_t tmpsmcr = 0;
  uint16_t tmpccmr1 = 0;
  uint16_t tmpccer = 0;
    
   
  ((void)0);
  ((void)0);
  ((void)0);
  ((void)0);

   
  tmpsmcr = TIMx->SMCR;
  
   
  tmpccmr1 = TIMx->CCMR1;
  
   
  tmpccer = TIMx->CCER;
  
   
  tmpsmcr &= (uint16_t)(~((uint16_t)((uint16_t)0x0007)));
  tmpsmcr |= TIM_EncoderMode;
  
   
  tmpccmr1 &= (uint16_t)(((uint16_t)~((uint16_t)((uint16_t)0x0003))) & (uint16_t)(~((uint16_t)((uint16_t)0x0300))));
  tmpccmr1 |= ((uint16_t)0x0001) | ((uint16_t)0x0100);
  
   
  tmpccer &= (uint16_t)(((uint16_t)~((uint16_t)((uint16_t)0x0002))) & ((uint16_t)~((uint16_t)((uint16_t)0x0020))));
  tmpccer |= (uint16_t)(TIM_IC1Polarity | (uint16_t)(TIM_IC2Polarity << (uint16_t)4));
  
   
  TIMx->SMCR = tmpsmcr;
   
  TIMx->CCMR1 = tmpccmr1;
   
  TIMx->CCER = tmpccer;
}









 
void TIM_ForcedOC1Config(TIM_TypeDef* TIMx, uint16_t TIM_ForcedAction)
{
  uint16_t tmpccmr1 = 0;
   
  ((void)0);
  ((void)0);
  tmpccmr1 = TIMx->CCMR1;
   
  tmpccmr1 &= (uint16_t)~((uint16_t)((uint16_t)0x0070));
   
  tmpccmr1 |= TIM_ForcedAction;
   
  TIMx->CCMR1 = tmpccmr1;
}









 
void TIM_ForcedOC2Config(TIM_TypeDef* TIMx, uint16_t TIM_ForcedAction)
{
  uint16_t tmpccmr1 = 0;
   
  ((void)0);
  ((void)0);
  tmpccmr1 = TIMx->CCMR1;
   
  tmpccmr1 &= (uint16_t)~((uint16_t)((uint16_t)0x7000));
   
  tmpccmr1 |= (uint16_t)(TIM_ForcedAction << 8);
   
  TIMx->CCMR1 = tmpccmr1;
}









 
void TIM_ForcedOC3Config(TIM_TypeDef* TIMx, uint16_t TIM_ForcedAction)
{
  uint16_t tmpccmr2 = 0;
   
  ((void)0);
  ((void)0);
  tmpccmr2 = TIMx->CCMR2;
   
  tmpccmr2 &= (uint16_t)~((uint16_t)((uint16_t)0x0070));
   
  tmpccmr2 |= TIM_ForcedAction;
   
  TIMx->CCMR2 = tmpccmr2;
}









 
void TIM_ForcedOC4Config(TIM_TypeDef* TIMx, uint16_t TIM_ForcedAction)
{
  uint16_t tmpccmr2 = 0;
   
  ((void)0);
  ((void)0);
  tmpccmr2 = TIMx->CCMR2;
   
  tmpccmr2 &= (uint16_t)~((uint16_t)((uint16_t)0x7000));
   
  tmpccmr2 |= (uint16_t)(TIM_ForcedAction << 8);
   
  TIMx->CCMR2 = tmpccmr2;
}







 
void TIM_ARRPreloadConfig(TIM_TypeDef* TIMx, FunctionalState NewState)
{
   
  ((void)0);
  ((void)0);
  if (NewState != DISABLE)
  {
     
    TIMx->CR1 |= ((uint16_t)0x0080);
  }
  else
  {
     
    TIMx->CR1 &= (uint16_t)~((uint16_t)((uint16_t)0x0080));
  }
}







 
void TIM_SelectCOM(TIM_TypeDef* TIMx, FunctionalState NewState)
{
   
  ((void)0);
  ((void)0);
  if (NewState != DISABLE)
  {
     
    TIMx->CR2 |= ((uint16_t)0x0004);
  }
  else
  {
     
    TIMx->CR2 &= (uint16_t)~((uint16_t)((uint16_t)0x0004));
  }
}








 
void TIM_SelectCCDMA(TIM_TypeDef* TIMx, FunctionalState NewState)
{
   
  ((void)0);
  ((void)0);
  if (NewState != DISABLE)
  {
     
    TIMx->CR2 |= ((uint16_t)0x0008);
  }
  else
  {
     
    TIMx->CR2 &= (uint16_t)~((uint16_t)((uint16_t)0x0008));
  }
}








 
void TIM_CCPreloadControl(TIM_TypeDef* TIMx, FunctionalState NewState)
{ 
   
  ((void)0);
  ((void)0);
  if (NewState != DISABLE)
  {
     
    TIMx->CR2 |= ((uint16_t)0x0001);
  }
  else
  {
     
    TIMx->CR2 &= (uint16_t)~((uint16_t)((uint16_t)0x0001));
  }
}









 
void TIM_OC1PreloadConfig(TIM_TypeDef* TIMx, uint16_t TIM_OCPreload)
{
  uint16_t tmpccmr1 = 0;
   
  ((void)0);
  ((void)0);
  tmpccmr1 = TIMx->CCMR1;
   
  tmpccmr1 &= (uint16_t)~((uint16_t)((uint16_t)0x0008));
   
  tmpccmr1 |= TIM_OCPreload;
   
  TIMx->CCMR1 = tmpccmr1;
}










 
void TIM_OC2PreloadConfig(TIM_TypeDef* TIMx, uint16_t TIM_OCPreload)
{
  uint16_t tmpccmr1 = 0;
   
  ((void)0);
  ((void)0);
  tmpccmr1 = TIMx->CCMR1;
   
  tmpccmr1 &= (uint16_t)~((uint16_t)((uint16_t)0x0800));
   
  tmpccmr1 |= (uint16_t)(TIM_OCPreload << 8);
   
  TIMx->CCMR1 = tmpccmr1;
}









 
void TIM_OC3PreloadConfig(TIM_TypeDef* TIMx, uint16_t TIM_OCPreload)
{
  uint16_t tmpccmr2 = 0;
   
  ((void)0);
  ((void)0);
  tmpccmr2 = TIMx->CCMR2;
   
  tmpccmr2 &= (uint16_t)~((uint16_t)((uint16_t)0x0008));
   
  tmpccmr2 |= TIM_OCPreload;
   
  TIMx->CCMR2 = tmpccmr2;
}









 
void TIM_OC4PreloadConfig(TIM_TypeDef* TIMx, uint16_t TIM_OCPreload)
{
  uint16_t tmpccmr2 = 0;
   
  ((void)0);
  ((void)0);
  tmpccmr2 = TIMx->CCMR2;
   
  tmpccmr2 &= (uint16_t)~((uint16_t)((uint16_t)0x0800));
   
  tmpccmr2 |= (uint16_t)(TIM_OCPreload << 8);
   
  TIMx->CCMR2 = tmpccmr2;
}









 
void TIM_OC1FastConfig(TIM_TypeDef* TIMx, uint16_t TIM_OCFast)
{
  uint16_t tmpccmr1 = 0;
   
  ((void)0);
  ((void)0);
   
  tmpccmr1 = TIMx->CCMR1;
   
  tmpccmr1 &= (uint16_t)~((uint16_t)((uint16_t)0x0004));
   
  tmpccmr1 |= TIM_OCFast;
   
  TIMx->CCMR1 = tmpccmr1;
}










 
void TIM_OC2FastConfig(TIM_TypeDef* TIMx, uint16_t TIM_OCFast)
{
  uint16_t tmpccmr1 = 0;
   
  ((void)0);
  ((void)0);
   
  tmpccmr1 = TIMx->CCMR1;
   
  tmpccmr1 &= (uint16_t)~((uint16_t)((uint16_t)0x0400));
   
  tmpccmr1 |= (uint16_t)(TIM_OCFast << 8);
   
  TIMx->CCMR1 = tmpccmr1;
}









 
void TIM_OC3FastConfig(TIM_TypeDef* TIMx, uint16_t TIM_OCFast)
{
  uint16_t tmpccmr2 = 0;
   
  ((void)0);
  ((void)0);
   
  tmpccmr2 = TIMx->CCMR2;
   
  tmpccmr2 &= (uint16_t)~((uint16_t)((uint16_t)0x0004));
   
  tmpccmr2 |= TIM_OCFast;
   
  TIMx->CCMR2 = tmpccmr2;
}









 
void TIM_OC4FastConfig(TIM_TypeDef* TIMx, uint16_t TIM_OCFast)
{
  uint16_t tmpccmr2 = 0;
   
  ((void)0);
  ((void)0);
   
  tmpccmr2 = TIMx->CCMR2;
   
  tmpccmr2 &= (uint16_t)~((uint16_t)((uint16_t)0x0400));
   
  tmpccmr2 |= (uint16_t)(TIM_OCFast << 8);
   
  TIMx->CCMR2 = tmpccmr2;
}









 
void TIM_ClearOC1Ref(TIM_TypeDef* TIMx, uint16_t TIM_OCClear)
{
  uint16_t tmpccmr1 = 0;
   
  ((void)0);
  ((void)0);

  tmpccmr1 = TIMx->CCMR1;

   
  tmpccmr1 &= (uint16_t)~((uint16_t)((uint16_t)0x0080));
   
  tmpccmr1 |= TIM_OCClear;
   
  TIMx->CCMR1 = tmpccmr1;
}









 
void TIM_ClearOC2Ref(TIM_TypeDef* TIMx, uint16_t TIM_OCClear)
{
  uint16_t tmpccmr1 = 0;
   
  ((void)0);
  ((void)0);
  tmpccmr1 = TIMx->CCMR1;
   
  tmpccmr1 &= (uint16_t)~((uint16_t)((uint16_t)0x8000));
   
  tmpccmr1 |= (uint16_t)(TIM_OCClear << 8);
   
  TIMx->CCMR1 = tmpccmr1;
}









 
void TIM_ClearOC3Ref(TIM_TypeDef* TIMx, uint16_t TIM_OCClear)
{
  uint16_t tmpccmr2 = 0;
   
  ((void)0);
  ((void)0);
  tmpccmr2 = TIMx->CCMR2;
   
  tmpccmr2 &= (uint16_t)~((uint16_t)((uint16_t)0x0080));
   
  tmpccmr2 |= TIM_OCClear;
   
  TIMx->CCMR2 = tmpccmr2;
}









 
void TIM_ClearOC4Ref(TIM_TypeDef* TIMx, uint16_t TIM_OCClear)
{
  uint16_t tmpccmr2 = 0;
   
  ((void)0);
  ((void)0);
  tmpccmr2 = TIMx->CCMR2;
   
  tmpccmr2 &= (uint16_t)~((uint16_t)((uint16_t)0x8000));
   
  tmpccmr2 |= (uint16_t)(TIM_OCClear << 8);
   
  TIMx->CCMR2 = tmpccmr2;
}









 
void TIM_OC1PolarityConfig(TIM_TypeDef* TIMx, uint16_t TIM_OCPolarity)
{
  uint16_t tmpccer = 0;
   
  ((void)0);
  ((void)0);
  tmpccer = TIMx->CCER;
   
  tmpccer &= (uint16_t)~((uint16_t)((uint16_t)0x0002));
  tmpccer |= TIM_OCPolarity;
   
  TIMx->CCER = tmpccer;
}









 
void TIM_OC1NPolarityConfig(TIM_TypeDef* TIMx, uint16_t TIM_OCNPolarity)
{
  uint16_t tmpccer = 0;
   
  ((void)0);
  ((void)0);
   
  tmpccer = TIMx->CCER;
   
  tmpccer &= (uint16_t)~((uint16_t)((uint16_t)0x0008));
  tmpccer |= TIM_OCNPolarity;
   
  TIMx->CCER = tmpccer;
}









 
void TIM_OC2PolarityConfig(TIM_TypeDef* TIMx, uint16_t TIM_OCPolarity)
{
  uint16_t tmpccer = 0;
   
  ((void)0);
  ((void)0);
  tmpccer = TIMx->CCER;
   
  tmpccer &= (uint16_t)~((uint16_t)((uint16_t)0x0020));
  tmpccer |= (uint16_t)(TIM_OCPolarity << 4);
   
  TIMx->CCER = tmpccer;
}









 
void TIM_OC2NPolarityConfig(TIM_TypeDef* TIMx, uint16_t TIM_OCNPolarity)
{
  uint16_t tmpccer = 0;
   
  ((void)0);
  ((void)0);
  
  tmpccer = TIMx->CCER;
   
  tmpccer &= (uint16_t)~((uint16_t)((uint16_t)0x0080));
  tmpccer |= (uint16_t)(TIM_OCNPolarity << 4);
   
  TIMx->CCER = tmpccer;
}









 
void TIM_OC3PolarityConfig(TIM_TypeDef* TIMx, uint16_t TIM_OCPolarity)
{
  uint16_t tmpccer = 0;
   
  ((void)0);
  ((void)0);
  tmpccer = TIMx->CCER;
   
  tmpccer &= (uint16_t)~((uint16_t)((uint16_t)0x0200));
  tmpccer |= (uint16_t)(TIM_OCPolarity << 8);
   
  TIMx->CCER = tmpccer;
}









 
void TIM_OC3NPolarityConfig(TIM_TypeDef* TIMx, uint16_t TIM_OCNPolarity)
{
  uint16_t tmpccer = 0;
 
   
  ((void)0);
  ((void)0);
    
  tmpccer = TIMx->CCER;
   
  tmpccer &= (uint16_t)~((uint16_t)((uint16_t)0x0800));
  tmpccer |= (uint16_t)(TIM_OCNPolarity << 8);
   
  TIMx->CCER = tmpccer;
}









 
void TIM_OC4PolarityConfig(TIM_TypeDef* TIMx, uint16_t TIM_OCPolarity)
{
  uint16_t tmpccer = 0;
   
  ((void)0);
  ((void)0);
  tmpccer = TIMx->CCER;
   
  tmpccer &= (uint16_t)~((uint16_t)((uint16_t)0x2000));
  tmpccer |= (uint16_t)(TIM_OCPolarity << 12);
   
  TIMx->CCER = tmpccer;
}













 
void TIM_CCxCmd(TIM_TypeDef* TIMx, uint16_t TIM_Channel, uint16_t TIM_CCx)
{
  uint16_t tmp = 0;

   
  ((void)0);
  ((void)0);
  ((void)0);

  tmp = ((uint16_t)0x0001) << TIM_Channel;

   
  TIMx->CCER &= (uint16_t)~ tmp;

    
  TIMx->CCER |=  (uint16_t)(TIM_CCx << TIM_Channel);
}












 
void TIM_CCxNCmd(TIM_TypeDef* TIMx, uint16_t TIM_Channel, uint16_t TIM_CCxN)
{
  uint16_t tmp = 0;

   
  ((void)0);
  ((void)0);
  ((void)0);

  tmp = ((uint16_t)0x0004) << TIM_Channel;

   
  TIMx->CCER &= (uint16_t) ~tmp;

    
  TIMx->CCER |=  (uint16_t)(TIM_CCxN << TIM_Channel);
}























 
void TIM_SelectOCxM(TIM_TypeDef* TIMx, uint16_t TIM_Channel, uint16_t TIM_OCMode)
{
  uint32_t tmp = 0;
  uint16_t tmp1 = 0;

   
  ((void)0);
  ((void)0);
  ((void)0);

  tmp = (uint32_t) TIMx;
  tmp += ((uint16_t)0x0018);

  tmp1 = ((uint16_t)0x0001) << (uint16_t)TIM_Channel;

   
  TIMx->CCER &= (uint16_t) ~tmp1;

  if((TIM_Channel == ((uint16_t)0x0000)) ||(TIM_Channel == ((uint16_t)0x0008)))
  {
    tmp += (TIM_Channel>>1);

     
    *(volatile uint32_t *) tmp &= (uint32_t)~((uint32_t)((uint16_t)0x0070));
   
     
    *(volatile uint32_t *) tmp |= TIM_OCMode;
  }
  else
  {
    tmp += (uint16_t)(TIM_Channel - (uint16_t)4)>> (uint16_t)1;

     
    *(volatile uint32_t *) tmp &= (uint32_t)~((uint32_t)((uint16_t)0x7000));
    
     
    *(volatile uint32_t *) tmp |= (uint16_t)(TIM_OCMode << 8);
  }
}







 
void TIM_UpdateDisableConfig(TIM_TypeDef* TIMx, FunctionalState NewState)
{
   
  ((void)0);
  ((void)0);
  if (NewState != DISABLE)
  {
     
    TIMx->CR1 |= ((uint16_t)0x0002);
  }
  else
  {
     
    TIMx->CR1 &= (uint16_t)~((uint16_t)((uint16_t)0x0002));
  }
}











 
void TIM_UpdateRequestConfig(TIM_TypeDef* TIMx, uint16_t TIM_UpdateSource)
{
   
  ((void)0);
  ((void)0);
  if (TIM_UpdateSource != ((uint16_t)0x0000))
  {
     
    TIMx->CR1 |= ((uint16_t)0x0004);
  }
  else
  {
     
    TIMx->CR1 &= (uint16_t)~((uint16_t)((uint16_t)0x0004));
  }
}







 
void TIM_SelectHallSensor(TIM_TypeDef* TIMx, FunctionalState NewState)
{
   
  ((void)0);
  ((void)0);
  if (NewState != DISABLE)
  {
     
    TIMx->CR2 |= ((uint16_t)0x0080);
  }
  else
  {
     
    TIMx->CR2 &= (uint16_t)~((uint16_t)((uint16_t)0x0080));
  }
}









 
void TIM_SelectOnePulseMode(TIM_TypeDef* TIMx, uint16_t TIM_OPMode)
{
   
  ((void)0);
  ((void)0);
   
  TIMx->CR1 &= (uint16_t)~((uint16_t)((uint16_t)0x0008));
   
  TIMx->CR1 |= TIM_OPMode;
}





















 
void TIM_SelectOutputTrigger(TIM_TypeDef* TIMx, uint16_t TIM_TRGOSource)
{
   
  ((void)0);
  ((void)0);
   
  TIMx->CR2 &= (uint16_t)~((uint16_t)((uint16_t)0x0070));
   
  TIMx->CR2 |=  TIM_TRGOSource;
}












 
void TIM_SelectSlaveMode(TIM_TypeDef* TIMx, uint16_t TIM_SlaveMode)
{
   
  ((void)0);
  ((void)0);
  
  TIMx->SMCR &= (uint16_t)~((uint16_t)((uint16_t)0x0007));
   
  TIMx->SMCR |= TIM_SlaveMode;
}










 
void TIM_SelectMasterSlaveMode(TIM_TypeDef* TIMx, uint16_t TIM_MasterSlaveMode)
{
   
  ((void)0);
  ((void)0);
   
  TIMx->SMCR &= (uint16_t)~((uint16_t)((uint16_t)0x0080));
  
   
  TIMx->SMCR |= TIM_MasterSlaveMode;
}






 
void TIM_SetCounter(TIM_TypeDef* TIMx, uint16_t Counter)
{
   
  ((void)0);
   
  TIMx->CNT = Counter;
}






 
void TIM_SetAutoreload(TIM_TypeDef* TIMx, uint16_t Autoreload)
{
   
  ((void)0);
   
  TIMx->ARR = Autoreload;
}






 
void TIM_SetCompare1(TIM_TypeDef* TIMx, uint16_t Compare1)
{
   
  ((void)0);
   
  TIMx->CCR1 = Compare1;
}






 
void TIM_SetCompare2(TIM_TypeDef* TIMx, uint16_t Compare2)
{
   
  ((void)0);
   
  TIMx->CCR2 = Compare2;
}






 
void TIM_SetCompare3(TIM_TypeDef* TIMx, uint16_t Compare3)
{
   
  ((void)0);
   
  TIMx->CCR3 = Compare3;
}






 
void TIM_SetCompare4(TIM_TypeDef* TIMx, uint16_t Compare4)
{
   
  ((void)0);
   
  TIMx->CCR4 = Compare4;
}











 
void TIM_SetIC1Prescaler(TIM_TypeDef* TIMx, uint16_t TIM_ICPSC)
{
   
  ((void)0);
  ((void)0);
   
  TIMx->CCMR1 &= (uint16_t)~((uint16_t)((uint16_t)0x000C));
   
  TIMx->CCMR1 |= TIM_ICPSC;
}











 
void TIM_SetIC2Prescaler(TIM_TypeDef* TIMx, uint16_t TIM_ICPSC)
{
   
  ((void)0);
  ((void)0);
   
  TIMx->CCMR1 &= (uint16_t)~((uint16_t)((uint16_t)0x0C00));
   
  TIMx->CCMR1 |= (uint16_t)(TIM_ICPSC << 8);
}











 
void TIM_SetIC3Prescaler(TIM_TypeDef* TIMx, uint16_t TIM_ICPSC)
{
   
  ((void)0);
  ((void)0);
   
  TIMx->CCMR2 &= (uint16_t)~((uint16_t)((uint16_t)0x000C));
   
  TIMx->CCMR2 |= TIM_ICPSC;
}











 
void TIM_SetIC4Prescaler(TIM_TypeDef* TIMx, uint16_t TIM_ICPSC)
{  
   
  ((void)0);
  ((void)0);
   
  TIMx->CCMR2 &= (uint16_t)~((uint16_t)((uint16_t)0x0C00));
   
  TIMx->CCMR2 |= (uint16_t)(TIM_ICPSC << 8);
}











 
void TIM_SetClockDivision(TIM_TypeDef* TIMx, uint16_t TIM_CKD)
{
   
  ((void)0);
  ((void)0);
   
  TIMx->CR1 &= (uint16_t)~((uint16_t)((uint16_t)0x0300));
   
  TIMx->CR1 |= TIM_CKD;
}





 
uint16_t TIM_GetCapture1(TIM_TypeDef* TIMx)
{
   
  ((void)0);
   
  return TIMx->CCR1;
}





 
uint16_t TIM_GetCapture2(TIM_TypeDef* TIMx)
{
   
  ((void)0);
   
  return TIMx->CCR2;
}





 
uint16_t TIM_GetCapture3(TIM_TypeDef* TIMx)
{
   
  ((void)0); 
   
  return TIMx->CCR3;
}





 
uint16_t TIM_GetCapture4(TIM_TypeDef* TIMx)
{
   
  ((void)0);
   
  return TIMx->CCR4;
}





 
uint16_t TIM_GetCounter(TIM_TypeDef* TIMx)
{
   
  ((void)0);
   
  return TIMx->CNT;
}





 
uint16_t TIM_GetPrescaler(TIM_TypeDef* TIMx)
{
   
  ((void)0);
   
  return TIMx->PSC;
}


























 
FlagStatus TIM_GetFlagStatus(TIM_TypeDef* TIMx, uint16_t TIM_FLAG)
{ 
  ITStatus bitstatus = RESET;  
   
  ((void)0);
  ((void)0);
  
  if ((TIMx->SR & TIM_FLAG) != (uint16_t)RESET)
  {
    bitstatus = SET;
  }
  else
  {
    bitstatus = RESET;
  }
  return bitstatus;
}


























 
void TIM_ClearFlag(TIM_TypeDef* TIMx, uint16_t TIM_FLAG)
{  
   
  ((void)0);
  ((void)0);
   
   
  TIMx->SR = (uint16_t)~TIM_FLAG;
}






















 
ITStatus TIM_GetITStatus(TIM_TypeDef* TIMx, uint16_t TIM_IT)
{
  ITStatus bitstatus = RESET;  
  uint16_t itstatus = 0x0, itenable = 0x0;
   
  ((void)0);
  ((void)0);
   
  itstatus = TIMx->SR & TIM_IT;
  
  itenable = TIMx->DIER & TIM_IT;
  if ((itstatus != (uint16_t)RESET) && (itenable != (uint16_t)RESET))
  {
    bitstatus = SET;
  }
  else
  {
    bitstatus = RESET;
  }
  return bitstatus;
}






















 
void TIM_ClearITPendingBit(TIM_TypeDef* TIMx, uint16_t TIM_IT)
{
   
  ((void)0);
  ((void)0);
   
  TIMx->SR = (uint16_t)~TIM_IT;
}
















 
static void TI1_Config(TIM_TypeDef* TIMx, uint16_t TIM_ICPolarity, uint16_t TIM_ICSelection,
                       uint16_t TIM_ICFilter)
{
  uint16_t tmpccmr1 = 0, tmpccer = 0;
   
  TIMx->CCER &= (uint16_t)~((uint16_t)((uint16_t)0x0001));
  tmpccmr1 = TIMx->CCMR1;
  tmpccer = TIMx->CCER;
   
  tmpccmr1 &= (uint16_t)(((uint16_t)~((uint16_t)((uint16_t)0x0003))) & ((uint16_t)~((uint16_t)((uint16_t)0x00F0))));
  tmpccmr1 |= (uint16_t)(TIM_ICSelection | (uint16_t)(TIM_ICFilter << (uint16_t)4));
  
  if((TIMx == ((TIM_TypeDef *) ((((uint32_t)0x40000000) + 0x10000) + 0x2C00))) || (TIMx == ((TIM_TypeDef *) ((((uint32_t)0x40000000) + 0x10000) + 0x3400))) || (TIMx == ((TIM_TypeDef *) (((uint32_t)0x40000000) + 0x0000))) || (TIMx == ((TIM_TypeDef *) (((uint32_t)0x40000000) + 0x0400))) ||
     (TIMx == ((TIM_TypeDef *) (((uint32_t)0x40000000) + 0x0800))) ||(TIMx == ((TIM_TypeDef *) (((uint32_t)0x40000000) + 0x0C00))))
  {
     
    tmpccer &= (uint16_t)~((uint16_t)(((uint16_t)0x0002)));
    tmpccer |= (uint16_t)(TIM_ICPolarity | (uint16_t)((uint16_t)0x0001));
  }
  else
  {
     
    tmpccer &= (uint16_t)~((uint16_t)(((uint16_t)0x0002) | ((uint16_t)0x0008)));
    tmpccer |= (uint16_t)(TIM_ICPolarity | (uint16_t)((uint16_t)0x0001));
  }

   
  TIMx->CCMR1 = tmpccmr1;
  TIMx->CCER = tmpccer;
}
















 
static void TI2_Config(TIM_TypeDef* TIMx, uint16_t TIM_ICPolarity, uint16_t TIM_ICSelection,
                       uint16_t TIM_ICFilter)
{
  uint16_t tmpccmr1 = 0, tmpccer = 0, tmp = 0;
   
  TIMx->CCER &= (uint16_t)~((uint16_t)((uint16_t)0x0010));
  tmpccmr1 = TIMx->CCMR1;
  tmpccer = TIMx->CCER;
  tmp = (uint16_t)(TIM_ICPolarity << 4);
   
  tmpccmr1 &= (uint16_t)(((uint16_t)~((uint16_t)((uint16_t)0x0300))) & ((uint16_t)~((uint16_t)((uint16_t)0xF000))));
  tmpccmr1 |= (uint16_t)(TIM_ICFilter << 12);
  tmpccmr1 |= (uint16_t)(TIM_ICSelection << 8);
  
  if((TIMx == ((TIM_TypeDef *) ((((uint32_t)0x40000000) + 0x10000) + 0x2C00))) || (TIMx == ((TIM_TypeDef *) ((((uint32_t)0x40000000) + 0x10000) + 0x3400))) || (TIMx == ((TIM_TypeDef *) (((uint32_t)0x40000000) + 0x0000))) || (TIMx == ((TIM_TypeDef *) (((uint32_t)0x40000000) + 0x0400))) ||
     (TIMx == ((TIM_TypeDef *) (((uint32_t)0x40000000) + 0x0800))) ||(TIMx == ((TIM_TypeDef *) (((uint32_t)0x40000000) + 0x0C00))))
  {
     
    tmpccer &= (uint16_t)~((uint16_t)(((uint16_t)0x0020)));
    tmpccer |=  (uint16_t)(tmp | (uint16_t)((uint16_t)0x0010));
  }
  else
  {
     
    tmpccer &= (uint16_t)~((uint16_t)(((uint16_t)0x0020) | ((uint16_t)0x0080)));
    tmpccer |= (uint16_t)(TIM_ICPolarity | (uint16_t)((uint16_t)0x0010));
  }
  
   
  TIMx->CCMR1 = tmpccmr1 ;
  TIMx->CCER = tmpccer;
}
















 
static void TI3_Config(TIM_TypeDef* TIMx, uint16_t TIM_ICPolarity, uint16_t TIM_ICSelection,
                       uint16_t TIM_ICFilter)
{
  uint16_t tmpccmr2 = 0, tmpccer = 0, tmp = 0;
   
  TIMx->CCER &= (uint16_t)~((uint16_t)((uint16_t)0x0100));
  tmpccmr2 = TIMx->CCMR2;
  tmpccer = TIMx->CCER;
  tmp = (uint16_t)(TIM_ICPolarity << 8);
   
  tmpccmr2 &= (uint16_t)(((uint16_t)~((uint16_t)((uint16_t)0x0003))) & ((uint16_t)~((uint16_t)((uint16_t)0x00F0))));
  tmpccmr2 |= (uint16_t)(TIM_ICSelection | (uint16_t)(TIM_ICFilter << (uint16_t)4));
    
  if((TIMx == ((TIM_TypeDef *) ((((uint32_t)0x40000000) + 0x10000) + 0x2C00))) || (TIMx == ((TIM_TypeDef *) ((((uint32_t)0x40000000) + 0x10000) + 0x3400))) || (TIMx == ((TIM_TypeDef *) (((uint32_t)0x40000000) + 0x0000))) || (TIMx == ((TIM_TypeDef *) (((uint32_t)0x40000000) + 0x0400))) ||
     (TIMx == ((TIM_TypeDef *) (((uint32_t)0x40000000) + 0x0800))) ||(TIMx == ((TIM_TypeDef *) (((uint32_t)0x40000000) + 0x0C00))))
  {
     
    tmpccer &= (uint16_t)~((uint16_t)(((uint16_t)0x0200)));
    tmpccer |= (uint16_t)(tmp | (uint16_t)((uint16_t)0x0100));
  }
  else
  {
     
    tmpccer &= (uint16_t)~((uint16_t)(((uint16_t)0x0200) | ((uint16_t)0x0800)));
    tmpccer |= (uint16_t)(TIM_ICPolarity | (uint16_t)((uint16_t)0x0100));
  }
  
   
  TIMx->CCMR2 = tmpccmr2;
  TIMx->CCER = tmpccer;
}
















 
static void TI4_Config(TIM_TypeDef* TIMx, uint16_t TIM_ICPolarity, uint16_t TIM_ICSelection,
                       uint16_t TIM_ICFilter)
{
  uint16_t tmpccmr2 = 0, tmpccer = 0, tmp = 0;

    
  TIMx->CCER &= (uint16_t)~((uint16_t)((uint16_t)0x1000));
  tmpccmr2 = TIMx->CCMR2;
  tmpccer = TIMx->CCER;
  tmp = (uint16_t)(TIM_ICPolarity << 12);
   
  tmpccmr2 &= (uint16_t)((uint16_t)(~(uint16_t)((uint16_t)0x0300)) & ((uint16_t)~((uint16_t)((uint16_t)0xF000))));
  tmpccmr2 |= (uint16_t)(TIM_ICSelection << 8);
  tmpccmr2 |= (uint16_t)(TIM_ICFilter << 12);
  
  if((TIMx == ((TIM_TypeDef *) ((((uint32_t)0x40000000) + 0x10000) + 0x2C00))) || (TIMx == ((TIM_TypeDef *) ((((uint32_t)0x40000000) + 0x10000) + 0x3400))) || (TIMx == ((TIM_TypeDef *) (((uint32_t)0x40000000) + 0x0000))) || (TIMx == ((TIM_TypeDef *) (((uint32_t)0x40000000) + 0x0400))) ||
     (TIMx == ((TIM_TypeDef *) (((uint32_t)0x40000000) + 0x0800))) ||(TIMx == ((TIM_TypeDef *) (((uint32_t)0x40000000) + 0x0C00))))
  {
     
    tmpccer &= (uint16_t)~((uint16_t)(((uint16_t)0x2000)));
    tmpccer |= (uint16_t)(tmp | (uint16_t)((uint16_t)0x1000));
  }
  else
  {
     
    tmpccer &= (uint16_t)~((uint16_t)(((uint16_t)0x0200) | ((uint16_t)0x8000)));
    tmpccer |= (uint16_t)(TIM_ICPolarity | (uint16_t)((uint16_t)0x1000));
  }
   
  TIMx->CCMR2 = tmpccmr2;
  TIMx->CCER = tmpccer;
}



 



 



 

 
