#include "delay.h"
void Delay_1us(void)     
{
  asm("nop");
}
void Delay_10us(void)     
{
  asm("nop"); asm("nop");
  asm("nop"); asm("nop");
  asm("nop"); asm("nop");
  asm("nop"); asm("nop");
  asm("nop"); asm("nop");
  asm("nop"); asm("nop");
  asm("nop"); asm("nop");
  asm("nop"); asm("nop");
  asm("nop"); asm("nop");
  asm("nop"); asm("nop");  
  asm("nop"); asm("nop");
  asm("nop"); asm("nop");
  asm("nop"); asm("nop");
  asm("nop"); asm("nop");
  asm("nop"); asm("nop"); 
  asm("nop"); asm("nop");
  asm("nop"); asm("nop");
  asm("nop"); asm("nop");
  asm("nop"); asm("nop");
  asm("nop"); asm("nop"); 
  asm("nop"); asm("nop");
  asm("nop"); asm("nop");
  asm("nop"); asm("nop");
  asm("nop"); asm("nop");
  asm("nop"); asm("nop");
  asm("nop");
  
  asm("nop"); asm("nop");
  asm("nop"); asm("nop");
  asm("nop"); asm("nop");
  asm("nop"); asm("nop");
  asm("nop"); asm("nop");
  asm("nop"); asm("nop");
  asm("nop"); asm("nop");
  asm("nop"); asm("nop");
  asm("nop"); asm("nop");
  asm("nop"); asm("nop");  
  asm("nop"); asm("nop");
  asm("nop"); asm("nop");
  asm("nop"); asm("nop");
  asm("nop"); asm("nop");
  asm("nop"); asm("nop"); 
  asm("nop"); asm("nop");
  asm("nop"); asm("nop");
  asm("nop"); asm("nop");
  asm("nop"); asm("nop");
  asm("nop"); asm("nop"); 
  asm("nop"); asm("nop");
  asm("nop"); asm("nop");
  asm("nop"); asm("nop");
  asm("nop"); asm("nop");
  asm("nop"); asm("nop");
  asm("nop");
}
void Delay_ms(u16 time)
{
  unsigned int i = 0;
  while(time--)
  {
    for(i = 0; i < 1000; i++)
    {
      Delay_1us();
    }
  }
}