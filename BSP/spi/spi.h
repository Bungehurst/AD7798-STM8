#ifndef __SPI_H
#define __SPI_H
#include "stm8s.h"

  /* PA3 -> SPI_SEL   CS
   * PC5 -> SPI_CLK   SCLK
   * PC6 -> SPI_MOSI  DIN
   * PC7 <- SPI_MISO  DOUT/RDY                                                       
  */

#define AD7798_CS_LOW  GPIO_WriteLow(GPIOA,(GPIO_Pin_TypeDef)GPIO_PIN_3)
#define AD7798_CS_HIGH GPIO_WriteHigh(GPIOA,(GPIO_Pin_TypeDef)GPIO_PIN_3)

#define AD7798_DIN_LOW  GPIO_WriteLow(GPIOC,(GPIO_Pin_TypeDef)GPIO_PIN_6)
#define AD7798_DIN_HIGH GPIO_WriteHigh(GPIOC,(GPIO_Pin_TypeDef)GPIO_PIN_6)

#define AD7798_SCLK_LOW  GPIO_WriteLow(GPIOC,(GPIO_Pin_TypeDef)GPIO_PIN_5)
#define AD7798_SCLK_HIGH GPIO_WriteHigh(GPIOC,(GPIO_Pin_TypeDef)GPIO_PIN_5)

#define AD7798_DOUT_LOW  GPIO_WriteLow(GPIOC,(GPIO_Pin_TypeDef)GPIO_PIN_7)
#define AD7798_DOUT_HIGH GPIO_WriteHigh(GPIOC,(GPIO_Pin_TypeDef)GPIO_PIN_7)

#define AD7798_DOUT (GPIOC->IDR & 0x80)
void SPI_conf();
void WaitRDY();
unsigned char SPI_Write(u8* data,
                        u8 bytesNumber);
unsigned char SPI_Read(u8* data,
                        u8 bytesNumber);
//u32 SPI_Read_TwoBytes(u8 regAddress);

#endif
