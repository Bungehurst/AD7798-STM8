#include "uart.h"
/**
  * @brief  UART1 and UART3 Configuration for multi processor communication
  * @param  None
  * @retval None
  */
void UART_Config(void)
{
  /* TX EN & RX EN OF RS422*/
  GPIO_Init(GPIOA,(GPIO_Pin_TypeDef)(GPIO_PIN_1|GPIO_PIN_2),GPIO_MODE_OUT_PP_LOW_SLOW);
  //GPIO_WriteHigh(GPIOA,(GPIO_Pin_TypeDef)GPIO_PIN_1);
  GPIO_WriteLow(GPIOA,(GPIO_Pin_TypeDef)GPIO_PIN_1);//tx dis
  GPIO_WriteLow(GPIOA,(GPIO_Pin_TypeDef)GPIO_PIN_2);//rx en
  
  UART1_DeInit();
  UART1_Init((uint32_t)115200, UART1_WORDLENGTH_8D, UART1_STOPBITS_1, UART1_PARITY_NO,
              UART1_SYNCMODE_CLOCK_DISABLE, UART1_MODE_TXRX_ENABLE);
  UART1_ITConfig(UART1_IT_RXNE_OR, ENABLE);
  UART1_ITConfig(UART1_IT_TXE, DISABLE);   
  UART1_Cmd(ENABLE);
}