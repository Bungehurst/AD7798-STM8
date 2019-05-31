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

unsigned char SPI_Write(u8* data,
                        u8 bytesNumber)
{
  u8 WriteData = 0;
  AD7798_SCLK_HIGH ;
  Delay_10us();

  for (int j = 0; j < bytesNumber;j++)
  {
    WriteData = data[j];
    for(int i=0;i<8;i++)
    {
      AD7798_SCLK_LOW ;
      if(WriteData&0x80) AD7798_DIN_HIGH;
      else AD7798_DIN_LOW ;
      Delay_10us();
      AD7798_SCLK_HIGH;
      Delay_10us();
      WriteData=WriteData<<1;
    }  
  }

  return bytesNumber;
}

unsigned char SPI_Read(u8* data,
                       u8 bytesNumber)
{
  u8 ReadData = 0 ;
  u8 bit;

  AD7798_SCLK_HIGH;
  Delay_10us();
  for (int j = 0; j < bytesNumber;j++)
  {
    for(int i=0;i<8;i++)
    {
       AD7798_SCLK_LOW;
       ReadData = ReadData<<1 ;
       Delay_10us();
       bit = AD7798_DOUT;
       AD7798_SCLK_HIGH;
       if(bit) ReadData+=1 ;
       Delay_10us();
       
    }
    data[j] = ReadData;
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
