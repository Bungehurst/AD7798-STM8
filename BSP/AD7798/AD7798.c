/***************************************************************************//**
 *   @file   AD7798.c
 *   @brief  Implementation of AD7798 Driver.
 *   @author 
********************************************************************************
 * Copyright 2012(c) Analog Devices, Inc.
 *
 * All rights reserved.
*******************************************************************************/

/******************************************************************************/
/* Include Files                                                              */
/******************************************************************************/
#include "AD7798.h"
#include "spi.h"
#include "main.h"
/***************************************************************************//**
 * @brief Initializes the AD7799 and checks if the device is present.
 *
 * @param None.
 *
 * @return status - Result of the initialization procedure.
 *                  Example: 1 - if initialization was successful (ID is 0x0B).
 *                           0 - if initialization was unsuccessful.
*******************************************************************************/
unsigned char status = 0x1;
void AD7798_Init(void)
{ 
  AD7798_Reset();
  Delay_ms(1000);
  while(1)
  {
    if(((AD7798_GetRegisterValue(AD7798_REG_ID, 1) ) & 0x0F) == AD7798_ID)
    {
      status=0x1;
      break;
    }
  }
  if(status==0x1)
  {   
    AD7798_SetCodingMode(AD7798_BIPOLAR);
    AD7798_SetChannel(AD7798_CH_AIN1P_AIN1M);
    AD7798_SetReference(AD7798_REFDET_ENA);
    AD7798_SetGain(AD7798_GAIN_1);
    
    AD7798_SetMode(AD7798_MODE_CAL_SYS_ZERO);
    Delay_ms(1000);
    AD7798_SetMode(AD7798_MODE_SINGLE);
  }
}

/***************************************************************************//**
 * @brief Sends 32 consecutive 1's on SPI in order to reset the part.
 *
 * @param None.
 *
 * @return  None.    
*******************************************************************************/
void AD7798_Reset(void)
{
  u8 dataToSend[5] = {0x03, 0xff, 0xff, 0xff, 0xff};	
  AD7798_CS_LOW;
  Delay_10us();
  SPI_Write(dataToSend,5);
  AD7798_CS_HIGH;
}
/***************************************************************************//**
 * @brief Reads the value of the selected register
 *
 * @param regAddress - The address of the register to read.
 * @param size - The size of the register to read.
 *
 * @return data - The value of the selected register register.
*******************************************************************************/
u32 AD7798_GetRegisterValue(unsigned char regAddress, unsigned char size)
{
    u32 receivedData = 0x00000000;	
    u8 data[5] = {0x00, 0x00, 0x00, 0x00, 0x00};
    data[1] = AD7798_COMM_READ |  AD7798_COMM_ADDR(regAddress); 
    AD7798_CS_LOW;
    asm("nop");
    SPI_Write(data,2);
    SPI_Read(data,size);
    AD7798_CS_HIGH;
    if(size == 1)
    {
      receivedData += (data[0] << 0);
    }
    else if(size == 2)
    {
      receivedData += (data[0] << 8);
      receivedData += (data[1] << 0);
    }
    else if(size == 3)
    {
      receivedData += (data[0] *65536);
      receivedData += (data[1] << 8);
      receivedData += (data[2] << 0);
    }
    return receivedData;
}
/***************************************************************************//**
 * @brief Writes the value to the register
 *
 * @param -  regAddress - The address of the register to write to.
 * @param -  regValue - The value to write to the register.
 * @param -  size - The size of the register to write.
 *
 * @return  None.    
*******************************************************************************/
void AD7798_SetRegisterValue(unsigned char regAddress,
                             unsigned long regValue, 
                             unsigned char size)
{
    u8 data[5] = {0x03, 0x00, 0x00, 0x00, 0x00};	
    data[1] = AD7798_COMM_WRITE |  AD7798_COMM_ADDR(regAddress);
    if(size == 1)
    {
        data[2] = (unsigned char)regValue;
    }
    if(size == 2)
    {
	data[3] = (unsigned char)((regValue & 0x0000FF) >> 0);
        data[2] = (unsigned char)((regValue & 0x00FF00) >> 8);
    }
    if(size == 3)
    {
	data[4] = (unsigned char)((regValue & 0x0000FF) >> 0);
	data[3] = (unsigned char)((regValue & 0x00FF00) >> 8);
        data[2] = (unsigned char)((regValue & 0xFF0000) >> 16);
    }
    AD7798_CS_LOW;
    Delay_10us();
    SPI_Write(data,(1 + size));
    AD7798_CS_HIGH;
}
/***************************************************************************//**
 * @brief Reads /RDY bit of status reg.
 *
 * @param None.
 *
 * @return rdy	- 0 if RDY is 1.
 *              - 1 if RDY is 0.
*******************************************************************************/
unsigned char AD7798_Ready(void)
{
    u8 rdy = 0;
    rdy = (AD7798_GetRegisterValue(AD7798_REG_STAT,1) & 0x80);   
    return(!rdy);
}

/***************************************************************************//**
 * @brief Sets the operating mode of AD7799.
 *
 * @param mode - Mode of operation.
 *
 * @return  None.    
*******************************************************************************/
void AD7798_SetMode(unsigned long mode)
{
    unsigned long command;
    command = AD7798_GetRegisterValue(AD7798_REG_MODE,2);
    command &= ~AD7798_MODE_SEL(0xFF);
    command |= AD7798_MODE_SEL(mode);
    AD7798_SetRegisterValue(AD7798_REG_MODE,command,2);
}
/***************************************************************************//**
 * @brief Selects the channel of AD7799.
 *
 * @param  channel - ADC channel selection.
 *
 * @return  None.    
*******************************************************************************/
void AD7798_SetChannel(unsigned long channel)
{
    unsigned long command;
    command = AD7798_GetRegisterValue(AD7798_REG_CONF,2);
    command &= ~AD7798_CONF_CHAN(0xFF);
    command |= AD7798_CONF_CHAN(channel);
    AD7798_SetRegisterValue(AD7798_REG_CONF,command,2);
}

/***************************************************************************//**
 * @brief  Sets the gain of the In-Amp.
 *
 * @param  gain - Gain.
 *
 * @return  None.    
*******************************************************************************/
void AD7798_SetGain(unsigned long gain)
{
    unsigned long command;
    command = AD7798_GetRegisterValue(AD7798_REG_CONF,2);
    command &= ~AD7798_CONF_GAIN(0xFF);
    command |= AD7798_CONF_GAIN(gain);
    AD7798_SetRegisterValue(AD7798_REG_CONF, command,2);
}
/***************************************************************************//**
 * @brief Enables or disables the reference detect function.
 *
 * @param state - State of the reference detect function.
 *               Example: 0	- Reference detect disabled.
 *                        1	- Reference detect enabled.
 *
 * @return None.    
*******************************************************************************/
void AD7798_SetReference(unsigned char state)
{
    unsigned long command = 0;
    command = AD7798_GetRegisterValue(AD7798_REG_CONF,2);
    command &= ~AD7798_CONF_REFDET(1);
    command |= AD7798_CONF_REFDET(state);
    AD7798_SetRegisterValue(AD7798_REG_CONF,command,2);
}

void AD7798_SetCodingMode(unsigned char  mode)
{
    unsigned long command = 0;
    command = AD7798_GetRegisterValue(AD7798_REG_CONF,2);
    if(mode == AD7798_BIPOLAR)
      command &= ~AD7798_CONF_UNIPOLAR;
    if(mode == AD7798_UNIPOLAR)
    command |= AD7798_CONF_UNIPOLAR;
    AD7798_SetRegisterValue(AD7798_REG_CONF,command,2);
}
