#include "spi.h"
#include "delay.h"
#include "AD7798.h"
void SPI_conf()
{
  /* PA3 -> SPI_SEL   CS
   * PC5 -> SPI_CLK   SCLK
   * PC6 -> SPI_MOSI  DIN
   * PC7 <- SPI_MISO  DOUT/RDY                                                       
  */
  
  GPIO_Init(GPIOA,(GPIO_Pin_TypeDef)GPIO_PIN_3,GPIO_MODE_OUT_PP_HIGH_FAST);
  GPIO_Init(GPIOC,(GPIO_Pin_TypeDef)GPIO_PIN_7,GPIO_MODE_IN_PU_NO_IT);
  GPIO_Init(GPIOC,(GPIO_Pin_TypeDef)GPIO_PIN_6,GPIO_MODE_OUT_PP_HIGH_FAST);
  GPIO_Init(GPIOC,(GPIO_Pin_TypeDef)GPIO_PIN_5,GPIO_MODE_OUT_PP_HIGH_FAST);
  GPIO_WriteHigh(GPIOA,(GPIO_Pin_TypeDef)GPIO_PIN_3);
}

unsigned char SPI_Write(unsigned char* data,
                        unsigned char bytesNumber)
{
  u8 WriteData = 0;
  for (int j = 0; j < bytesNumber;j++)
  {
    //AD7798_CS_LOW; 
    WriteData = data[j];
    for(int i=0;i<8;i++)
    {
      Delay_10us();
      AD7798_SCLK_LOW ;
      Delay_10us();
      if(WriteData&0x80) AD7798_DIN_HIGH;
      else AD7798_DIN_LOW ;
      WriteData=WriteData<<1;
      Delay_10us();
      AD7798_SCLK_HIGH;
      Delay_10us();
    }  
    //AD7798_CS_HIGH;
  }
  
  return bytesNumber;
}
u32 SPI_Read_TwoBytes(unsigned char regAddress)
{
    u32 receivedData = 0x00000000;	
    u8 ReadData[3] = {0} ;
    u8 data[5] = {0x03, 0x00, 0x00, 0x00, 0x00};
    u8 WriteData = 0;
    data[1] = AD7798_COMM_READ |  AD7798_COMM_ADDR(regAddress); 
    AD7798_CS_LOW;
    for (int j = 0; j < 2;j++)
    {
      WriteData = data[j];
      for(int i=0;i<8;i++)
      {
       Delay_10us();
       AD7798_SCLK_LOW ;
       Delay_10us();
       if(WriteData&0x80) AD7798_DIN_HIGH;
       else AD7798_DIN_LOW ;
       WriteData=WriteData<<1 ;
       Delay_10us();
       AD7798_SCLK_HIGH;
       Delay_10us();
     }  
    }
    //AD7798_DOUT_LOW;
    for(int j=0;j<3;j++)
    {
      for(int i=0;i<8;i++)
     {
       Delay_10us();
       AD7798_SCLK_LOW;
       Delay_10us();
       ReadData[j] = ReadData[j]<<1 ;
       Delay_10us();
       if(AD7798_DOUT) ReadData[j]+=1 ;
       Delay_10us();
       AD7798_SCLK_HIGH;
       Delay_10us();
     }
     //Delay_10us();
     //AD7798_DOUT_HIGH;
    }
    //Delay_10us();
    AD7798_CS_HIGH;
   
    receivedData += (ReadData[0] << 16);
    receivedData += (ReadData[1] << 8);
    receivedData += (ReadData[2] << 0);

    return receivedData;
}
unsigned char SPI_Read(unsigned char* data,
                       unsigned char bytesNumber)
{
  u8 ReadData = 0 ;
  //WaitRDY();
//      for(int i=0;i<8;i++)
//    {
//       Delay_10us();
//       AD7798_SCLK_LOW;
//       Delay_10us();
//       Delay_10us();
//       AD7798_SCLK_HIGH;
//       Delay_10us();
//    }
  for (int j = 0; j < bytesNumber;j++)
  {
    //AD7798_CS_LOW;
    //AD7798_DOUT_LOW;
    for(int i=0;i<8;i++)
    {
       Delay_10us();
       AD7798_SCLK_LOW;
       Delay_10us();
       ReadData = ReadData<<1 ;
       if(AD7798_DOUT) ReadData+=1 ;
       Delay_10us();
       AD7798_SCLK_HIGH;
       Delay_10us();
    }
    data[j] = ReadData;
    AD7798_DOUT_HIGH;
    //AD7798_CS_HIGH;
  }   

  return bytesNumber;                  
}
void WaitRDY(void)
{
  u16 cont = 0;
  while(AD7798_DOUT)
  {
    cont++;
    if(cont>65530)
    {
      AD7798_Init();
      break ;
    }
  }
}