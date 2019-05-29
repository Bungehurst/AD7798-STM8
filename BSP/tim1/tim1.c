#include "tim1.h"
void timer1_Init(void)
{
  CLK_PeripheralClockConfig(CLK_PERIPHERAL_TIMER1, ENABLE);  
  TIM1_DeInit();
  TIM1_TimeBaseInit(15,TIM1_COUNTERMODE_UP,9999,0);

  TIM1_ITConfig(TIM1_IT_UPDATE, DISABLE);
  TIM1_ARRPreloadConfig(ENABLE);
  TIM1_SetCounter(0);
  TIM1_Cmd(ENABLE);
}
