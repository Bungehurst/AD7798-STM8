#include "led.h"

void LED_conf(void)
{
  GPIO_Init(GPIOB,(GPIO_Pin_TypeDef)GPIO_PIN_5,GPIO_MODE_OUT_PP_HIGH_FAST);
  
  
}