#include "main.h"
#include "stdio.h"
#define abs(x) ((x>0)?(x):(-x))
int main(void)
{
  CLK_HSIPrescalerConfig(CLK_PRESCALER_HSIDIV1);
  SPI_conf();
  AD7798_Init();
  LED_conf();
  UART_Config();
  timer1_Init();
  enableInterrupts(); 
  while(1)
  {
    Delay_ms(1000);
  }
}

#ifdef USE_FULL_ASSERT

/**
  * @brief  Reports the name of the source file and the source line number
  *   where the assert_param error has occurred.
  * @param file: pointer to the source file name
  * @param line: assert_param error line source number
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
