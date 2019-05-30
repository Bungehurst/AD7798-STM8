///////////////////////////////////////////////////////////////////////////////
//                                                                            /
//                                                      30/May/2019  21:13:08 /
// IAR C/C++ Compiler V1.31.1.20058 [Evaluation] for STM8                     /
// Copyright 2010-2012 IAR Systems AB.                                        /
//                                                                            /
//    Source file  =  E:\Desktop\J19B_4E\USR\main.c                           /
//    Command line =  E:\Desktop\J19B_4E\USR\main.c -e -Ol --no_cse           /
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
//    List file    =  E:\Desktop\J19B_4E\Debug\List\main.s                    /
//                                                                            /
//                                                                            /
///////////////////////////////////////////////////////////////////////////////

        NAME main

        EXTERN AD7798_Init
        EXTERN CLK_HSIPrescalerConfig
        EXTERN Delay_ms
        EXTERN LED_conf
        EXTERN SPI_conf
        EXTERN UART_Config
        EXTERN timer1_Init

        PUBLIC assert_failed
        PUBLIC main

// E:\Desktop\J19B_4E\USR\main.c
//    1 #include "main.h"
//    2 #include "stdio.h"
//    3 #define abs(x) ((x>0)?(x):(-x))

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//    4 int main(void)
//    5 {
//    6   CLK_HSIPrescalerConfig(CLK_PRESCALER_HSIDIV1);
main:
        CLR       A
        CALL      L:CLK_HSIPrescalerConfig
//    7   SPI_conf();
        CALL      L:SPI_conf
//    8   AD7798_Init();
        CALL      L:AD7798_Init
//    9   LED_conf();
        CALL      L:LED_conf
//   10   UART_Config();
        CALL      L:UART_Config
//   11   timer1_Init();
        CALL      L:timer1_Init
//   12   enableInterrupts(); 
        RIM
//   13   while(1)
//   14   {
//   15     
//   16     Delay_ms(1000);
??main_0:
        LDW       X, #0x3e8
        CALL      L:Delay_ms
        JRA       L:??main_0
//   17   }
//   18 }
//   19 
//   20 #ifdef USE_FULL_ASSERT
//   21 
//   22 /**
//   23   * @brief  Reports the name of the source file and the source line number
//   24   *   where the assert_param error has occurred.
//   25   * @param file: pointer to the source file name
//   26   * @param line: assert_param error line source number
//   27   * @retval None
//   28   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//   29 void assert_failed(uint8_t* file, uint32_t line)
//   30 { 
//   31   /* User can add his own implementation to report the file name and line number,
//   32      ex: printf("Wrong parameters value: file %s on line %d\r\n", file, line) */
//   33 
//   34   /* Infinite loop */
//   35   while (1)
assert_failed:
??assert_failed_0:
        JRA       L:??assert_failed_0
//   36   {
//   37   }
//   38 }

        SECTION VREGS:DATA:REORDER:NOROOT(0)

        END
//   39 #endif
// 
// 30 bytes in section .near_func.text
// 
// 30 bytes of CODE memory
//
//Errors: none
//Warnings: none
