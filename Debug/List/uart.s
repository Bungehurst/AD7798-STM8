///////////////////////////////////////////////////////////////////////////////
//                                                                            /
//                                                      30/May/2019  20:41:55 /
// IAR C/C++ Compiler V1.31.1.20058 [Evaluation] for STM8                     /
// Copyright 2010-2012 IAR Systems AB.                                        /
//                                                                            /
//    Source file  =  E:\Desktop\J19B_4E\BSP\uart\uart.c                      /
//    Command line =  E:\Desktop\J19B_4E\BSP\uart\uart.c -e -Ol --no_cse      /
//                    --no_unroll --no_inline --no_code_motion --no_tbaa      /
//                    --no_cross_call --debug --code_model small              /
//                    --data_model medium -o E:\Desktop\J19B_4E\Debug\Obj\    /
//                    --dlib_config "D:\Program Files (x86)\IAR               /
//                    Systems\Embedded Workbench 6.0                          /
//                    Evaluation\stm8\LIB\dlstm8smf.h" -lcN                   /
//                    E:\Desktop\J19B_4E\Debug\List\ -lB                      /
//                    E:\Desktop\J19B_4E\Debug\List\ -I                       /
//                    E:\Desktop\J19B_4E\Lib\inc\ -I                          /
//                    E:\Desktop\J19B_4E\BSP\led\ -I                          /
//                    E:\Desktop\J19B_4E\BSP\uart\ -I                         /
//                    E:\Desktop\J19B_4E\BSP\AD7798\ -I                       /
//                    E:\Desktop\J19B_4E\BSP\spi\ -I E:\Desktop\J19B_4E\USR\  /
//                    -I E:\Desktop\J19B_4E\BSP\delay\ -I                     /
//                    E:\Desktop\J19B_4E\BSP\tim1\ --vregs 16                 /
//    List file    =  E:\Desktop\J19B_4E\Debug\List\uart.s                    /
//                                                                            /
//                                                                            /
///////////////////////////////////////////////////////////////////////////////

        NAME uart

        EXTERN ?b0
        EXTERN ?b4
        EXTERN ?b5
        EXTERN ?b6
        EXTERN ?b7
        EXTERN ?w0
        EXTERN ?w1
        EXTERN GPIO_Init
        EXTERN GPIO_WriteLow
        EXTERN UART1_Cmd
        EXTERN UART1_DeInit
        EXTERN UART1_ITConfig
        EXTERN UART1_Init

        PUBLIC UART_Config

// E:\Desktop\J19B_4E\BSP\uart\uart.c
//    1 #include "uart.h"
//    2 /**
//    3   * @brief  UART1 and UART3 Configuration for multi processor communication
//    4   * @param  None
//    5   * @retval None
//    6   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//    7 void UART_Config(void)
//    8 {
//    9   /* TX EN & RX EN OF RS422*/
//   10   GPIO_Init(GPIOA,(GPIO_Pin_TypeDef)(GPIO_PIN_1|GPIO_PIN_2),GPIO_MODE_OUT_PP_LOW_SLOW);
UART_Config:
        MOV       S:?b0, #0xc0
        LD        A, #0x6
        LDW       X, #0x5000
        CALL      L:GPIO_Init
//   11   //GPIO_WriteHigh(GPIOA,(GPIO_Pin_TypeDef)GPIO_PIN_1);
//   12   GPIO_WriteLow(GPIOA,(GPIO_Pin_TypeDef)GPIO_PIN_1);//tx dis
        LD        A, #0x2
        LDW       X, #0x5000
        CALL      L:GPIO_WriteLow
//   13   GPIO_WriteLow(GPIOA,(GPIO_Pin_TypeDef)GPIO_PIN_2);//rx en
        LD        A, #0x4
        LDW       X, #0x5000
        CALL      L:GPIO_WriteLow
//   14   
//   15   UART1_DeInit();
        CALL      L:UART1_DeInit
//   16   UART1_Init((uint32_t)115200, UART1_WORDLENGTH_8D, UART1_STOPBITS_1, UART1_PARITY_NO,
//   17               UART1_SYNCMODE_CLOCK_DISABLE, UART1_MODE_TXRX_ENABLE);
        MOV       S:?b7, #0xc
        MOV       S:?b6, #0x80
        CLR       S:?b5
        CLR       S:?b4
        CLR       A
        LDW       X, #0xc200
        LDW       S:?w1, X
        CLRW      X
        INCW      X
        LDW       S:?w0, X
        CALL      L:UART1_Init
//   18   UART1_ITConfig(UART1_IT_RXNE_OR, ENABLE);
        LD        A, #0x1
        LDW       X, #0x205
        CALL      L:UART1_ITConfig
//   19   UART1_ITConfig(UART1_IT_TXE, DISABLE);   
        CLR       A
        LDW       X, #0x277
        CALL      L:UART1_ITConfig
//   20   UART1_Cmd(ENABLE);
        LD        A, #0x1
        JP        L:UART1_Cmd
//   21 }

        SECTION VREGS:DATA:REORDER:NOROOT(0)

        END
// 
// 76 bytes in section .near_func.text
// 
// 76 bytes of CODE memory
//
//Errors: none
//Warnings: none
