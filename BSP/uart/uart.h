#ifndef __UART_H
#define __UART_H
#include "stm8s.h"
#include "stm8s_clk.h"
//#include "stdio.h"

void UART_Config(void);
void UART_send_string(uint8_t *Buffer) ;
#endif