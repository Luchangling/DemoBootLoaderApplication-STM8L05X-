#include "stm8l15x.h"
#include "stm8l15x_conf.h"



#define USART_BUFF_SIZE     136
#define COM   USART3
#define COMCLK  CLK_Peripheral_USART3
#define BaudRate 115200ul

#ifdef _RAISONANCE_
/* needed by memcpy for raisonance */
 #include <string.h>
 extern int __address__FLASH_EraseBlock;
 extern int __size__FLASH_EraseBlock;
 extern int __address__FLASH_ProgramBlock;
 extern int __size__FLASH_ProgramBlock;
#endif /*_RAISONANCE_*/

 #ifdef _RAISONANCE_
/* Call the standard C library: memcpy() or fmemcpy() functions available through 
   the <string.h> to copy the inram function to the RAM destination address */
  MEMCPY(FLASH_EraseBlock,
         (void PointerAttr*)&__address__FLASH_EraseBlock,
         (int)&__size__FLASH_EraseBlock);
  
  MEMCPY(FLASH_ProgramBlock,
         (void PointerAttr*)&__address__FLASH_ProgramBlock,
         (int)&__size__FLASH_ProgramBlock);
  
#endif /*_RAISONANCE_*/
#pragma SRC
//中断向量的重新映射  映射地址从0X9000到0X9080
  __root const long reintvec[]@".intvec"=
       {   0x82008080,0x82009004,0x82009008,0x8200900c, //当应用程序地址不是0x9000时则要相应改掉除第一个0x82008080以外的数值
           0x82009010,0x82009014,0x82009018,0x8200901c,
           0x82009020,0x82009024,0x82009028,0x8200902c,
           0x82009030,0x82009034,0x82009038,0x8200903c,
           0x82009040,0x82009044,0x82009048,0x8200904c,
           0x82009050,0x82009054,0x82009058,0x8200905c,
           0x82009060,0x82009064,0x82009068,0x8200906c,
           0x82009070,0x82009074,0x82009078,0x8200907c,
       };


void UART3_Init(void);

void UserGPIO_Init(void);

void Bee(void);
uint8_t CheckUpdateCommand(void);
uint8_t SoftWareDelay_Ms(uint16_t time);

uint16_t BLOCK_OPERATION=32; //page16  block32  0X9000起始地址块
uint16_t BLOCK_END=0; //结束块



uint8_t Flag=FALSE;
uint8_t Uart_ReciveData[USART_BUFF_SIZE];

uint8_t Size=0;
uint16_t Delay_Count=0;
uint8_t Delay_Time=0;



uint8_t CheckIAPStaus(void);
void JumptoUserMain(void);
void USART_SendByte(uint8_t data);
void SendstringWithEnter(uint8_t *str);
void Update(void);
void SendBuff(uint8_t *Buff,uint8_t Count);

void main(void)
{
 
    CLK_SYSCLKDivConfig(CLK_SYSCLKDiv_2);
    sim();  // disable interrupts 
    UserGPIO_Init();
    UART3_Init(); 
    
  while(1){}
    
   while(Delay_Time<0X10)
   {
     Delay_Count++;
    if(USART_GetFlagStatus(COM, USART_FLAG_RXNE)==SET)
    { 
      Uart_ReciveData[Size] = USART_ReceiveData8(COM); 
      Size++; 
    } 
    if(Delay_Count==0XFFF0)
    {
      Delay_Count=0;
      Delay_Time++;
    }
     if(Size>7) break; //接收到了一定数据 跳出
   }
   if(Delay_Time==0X10) 
  { 
    JumptoUserMain();
  } 
  while(1)
  {
     if(CheckUpdateCommand())
     {
       Update();
     }
     else
     {
       JumptoUserMain();
     }
  }
}

void Update(void)
{
  uint8_t UartSendBuff[7];
  uint8_t GBuffer[FLASH_BLOCK_SIZE];
  uint8_t Index=0;
  uint8_t Crc=0;
  uint8_t ii=0;
  uint8_t len=0;
  //uint8_t jj=0;
  
  FLASH_SetProgrammingTime(FLASH_ProgramTime_Standard);
  FLASH_Unlock(FLASH_MemType_Program);
  Delay_Time=0;
  Delay_Count=0;
  
  while (FLASH_GetFlagStatus(FLASH_FLAG_PUL) == RESET){}
  memset(Uart_ReciveData,0,sizeof(Uart_ReciveData)); 
  
  
  while(Delay_Time<0X10)
   {
    Delay_Count++;
    if(USART_GetFlagStatus(COM, USART_FLAG_RXNE)==SET)
    { 
      Uart_ReciveData[Size] = USART_ReceiveData8(COM); 
      Size++; 
    } 
   if(Delay_Count==0XFFF0)
    {
      Delay_Count=0;
      Delay_Time++;
    }
    if(Size>=USART_BUFF_SIZE) //128+4 bit
    {
        Delay_Count=0;   //接受到数据 处理 同时清空延时标志
        Delay_Time=0;
        Size=0; 
        Crc=0;
        
        for(uint8_t i=0;i<USART_BUFF_SIZE;i++)
        {
          if(Uart_ReciveData[i]==0XAA&&Uart_ReciveData[i+1]==0XAB&&Uart_ReciveData[i+132]==0XDD)
          {
              //++Index;
              len=Uart_ReciveData[i+2];   //写入的Block Bit
               for(uint8_t j=i+3;j<len+4;j++)
             {
                Crc+=Uart_ReciveData[j];
              }
             if(Crc==Uart_ReciveData[i+131])  
             {
                ii=0;
               for(uint8_t j=i+3;j<len+4;j++)
               {
                 GBuffer[ii++]=Uart_ReciveData[j];
               }
                FLASH_ProgramBlock(BLOCK_OPERATION, FLASH_MemType_Program, FLASH_ProgramMode_Standard, GBuffer);
  /* Wait until End of high voltage flag is set*/
                while (FLASH_GetFlagStatus(FLASH_FLAG_HVOFF) == RESET){}
                  //memset(GBuffer,0,sizeof(GBuffer)); 
                  BLOCK_OPERATION++;  //写起始块
                  Crc=0;
                 UartSendBuff[0]=0xAA;
                 UartSendBuff[1]=0xAB;
                 UartSendBuff[2]=0x2A;   //写入成功Cmd
                 UartSendBuff[3]=(BLOCK_OPERATION>>8);
                 UartSendBuff[4]=(BLOCK_OPERATION&0XFF);  //[]
                for(uint8_t j=2;j<5;j++) 
                {
                 Crc+=UartSendBuff[j];
                }
                UartSendBuff[5]=Crc;
                UartSendBuff[6]=0xDD;
                SendBuff(UartSendBuff,7); //
                Crc=0;
                break;
             }
             else  //Error
             {
                 Crc=0;
                 UartSendBuff[0]=0xAA;
                 UartSendBuff[1]=0xAB;
                 UartSendBuff[2]=0x6F;   //错误
                 UartSendBuff[3]=(BLOCK_OPERATION>>8);
                 UartSendBuff[4]=(BLOCK_OPERATION&0XFF);  
                for(uint8_t j=2;j<5;j++) 
                {
                 Crc+=UartSendBuff[j];
                }
                UartSendBuff[5]=Crc;
                UartSendBuff[6]=0xDD;
                SendBuff(UartSendBuff,7);
                //Crc=0;
                for(uint8_t i=BLOCK_OPERATION;i<=BLOCK_END;i++)
                {
                  FLASH_EraseBlock(i, FLASH_MemType_Program);
                  while (FLASH_GetFlagStatus(FLASH_FLAG_HVOFF) == RESET)
                {}
                }
                 FLASH_Lock(FLASH_MemType_Program);
             }
          }
        }         
        //memset(Uart_ReciveData,0,sizeof(Uart_ReciveData));
        //memset(GBuffer,0,sizeof(GBuffer)); 
        if(BLOCK_OPERATION==BLOCK_END)
        {
          //写入结束
          BLOCK_OPERATION=32; //初始化写入位置 0X9000
          FLASH_Lock(FLASH_MemType_Program);
         // SendstringWithEnter("success");
          JumptoUserMain();
        }
    }
 
  if(Delay_Time==0X10) //时间到
  { 
    if(BLOCK_OPERATION==BLOCK_END)
    {
      JumptoUserMain();
    }
    else  //写入Flash不完整 ，擦除
    {
       for(uint8_t i=BLOCK_OPERATION;i<=BLOCK_END;i++)
         {
            FLASH_EraseBlock(i, FLASH_MemType_Program);
            while (FLASH_GetFlagStatus(FLASH_FLAG_HVOFF) == RESET)
            {}
            JumptoUserMain();
          }
    }
  }

   }

}

uint8_t CheckUpdateCommand(void)
{
  uint8_t Crc=0;
  uint8_t Index=0;
  uint8_t i=0;
  uint8_t ReadyBuff[7]={0XAA,0XAB,0X1A,0XA0,0XB0,0X6A,0X1F};//临时上报反馈数据
  for(i=0;i<Size;i++)
  {
    Index++;
    if(Uart_ReciveData[i]==0XAA&&Uart_ReciveData[i+1]==0XAB&&Uart_ReciveData[i+6]==0XDD)
    { 
      Size=0;
      for(uint8_t j=i+2;j<i+5;j++)
      {
        Crc+=Uart_ReciveData[j];
      }
      if(Crc==Uart_ReciveData[5])
      {
        BLOCK_END=BLOCK_OPERATION+(Uart_ReciveData[Index+2]<<8)|Uart_ReciveData[Index+3];//获取最后的Block数          
        memset(Uart_ReciveData,0,sizeof(Uart_ReciveData));
        SendBuff(ReadyBuff,7);//发送准备升级指令
        return TRUE;
      }         
    }
    else return FALSE;
  }
  return FALSE;
}


void UserGPIO_Init(void)
{    
     
     GPIO_Init(GPIOE,GPIO_Pin_6,GPIO_Mode_Out_PP_Low_Slow);    //BEEB
     GPIO_Init(GPIOC,GPIO_Pin_3,GPIO_Mode_Out_PP_Low_Slow);   //CM180 POWER
     //GPIO_Init(GPIOA,GPIO_Pin_3,GPIO_Mode_Out_PP_Low_Slow); //CM180 ON/OFF
     //GPIO_Init(GPIOD,GPIO_Pin_7,GPIO_Mode_In_PU_No_IT);    //ADC
     GPIO_Init(GPIOC,GPIO_Pin_1,GPIO_Mode_In_PU_No_IT);
     GPIO_Init(GPIOB,GPIO_Pin_3,GPIO_Mode_In_PU_No_IT);
}



void Bee(void)
{
   GPIO_SetBits(GPIOE,GPIO_Pin_6);
   Delay(100);
   GPIO_ResetBits(GPIOE,GPIO_Pin_6);
  
}

void UART3_Init(void)
{
  CLK_PeripheralClockConfig(COMCLK,ENABLE);
  GPIO_ExternalPullUpConfig(GPIOG,GPIO_Pin_0|GPIO_Pin_1,ENABLE);
  USART_DeInit(COM);
  USART_Init(COM, (uint32_t)BaudRate,USART_WordLength_8b,USART_StopBits_1,USART_Parity_No,USART_Mode_Tx | USART_Mode_Rx);
  //USART_ITConfig(USART3, USART_IT_RXNE, ENABLE);
  USART_Cmd(COM, ENABLE);	
}



void USART_SendByte(uint8_t data)    //发送一个字节
{
	USART_SendData8(COM,data);
        while (USART_GetFlagStatus(COM, USART_FLAG_TC) == RESET);
}

void SendBuff(uint8_t *Buff,uint8_t Count)          //发送数组
{ 
  for(uint8_t i=0;i<Count;i++)
  {
    USART_SendByte(Buff[i]);
    while (USART_GetFlagStatus(COM, USART_FLAG_TC) == RESET);
  }
  
}


void SendstringWithEnter(uint8_t *str)          //发送字符串
{ 
                uint8_t *p;
		p= str;
	  while(*p)
	{
		 USART_SendByte(*p);
                 while (USART_GetFlagStatus(COM, USART_FLAG_TC) == RESET);
		 p++;
	 }
         USART_SendByte('\r');
         while (USART_GetFlagStatus(COM, USART_FLAG_TC) == RESET);
}

void JumptoUserMain(void)
    {
      asm("LDW X,  SP ");
      asm("LD  A,  $FF");
      asm("LD  XL, A ");
      asm("LDW SP, X ");
      asm("JPF $9000");
 }






uint8_t SoftWareDelay_Ms(uint16_t time)
{
  uint16_t x,y;
  
  for(x=time;x>0;x--)
  {
    for(y=615;y>0;y--);
  }
  return FALSE;
}

#ifdef  USE_FULL_ASSERT

/**
  * @brief  Reports the name of the source file and the source line number
  *   where the assert_param error has occurred.
  * @param  file: pointer to the source file name
  * @param  line: assert_param error line source number
  * @retval None
  */
void assert_failed(uint8_t* file, uint32_t line)
{ 
  /* User can add his own implementation to report the file name and line number,
     ex: printf("Wrong parameters value: file %s on line %d\r\n", file, line) */

  /* Infinite loop */
  while (1)
  {
  }
}
#endif

/**
  * @}
  */

/************************ (C) COPYRIGHT STMicroelectronics *****END OF FILE****/
