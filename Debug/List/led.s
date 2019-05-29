///////////////////////////////////////////////////////////////////////////////
//                                                                            /
//                                                      28/May/2019  16:13:15 /
// IAR C/C++ Compiler V1.31.1.20058 [Evaluation] for STM8                     /
// Copyright 2010-2012 IAR Systems AB.                                        /
//                                                                            /
//    Source file  =  E:\Desktop\J19B_STM8\BSP\led\led.c                      /
//    Command line =  E:\Desktop\J19B_STM8\BSP\led\led.c -e -Ol --no_cse      /
//                    --no_unroll --no_inline --no_code_motion --no_tbaa      /
//                    --no_cross_call --debug --code_model small              /
//                    --data_model medium -o E:\Desktop\J19B_STM8\Debug\Obj\  /
//                    --dlib_config "D:\Program Files (x86)\IAR               /
//                    Systems\Embedded Workbench 6.0                          /
//                    Evaluation\stm8\LIB\dlstm8smf.h" -lcN                   /
//                    E:\Desktop\J19B_STM8\Debug\List\ -lB                    /
//                    E:\Desktop\J19B_STM8\Debug\List\ -I                     /
//                    E:\Desktop\J19B_STM8\Lib\inc\ -I                        /
//                    E:\Desktop\J19B_STM8\BSP\led\ -I                        /
//                    E:\Desktop\J19B_STM8\BSP\uart\ -I                       /
//                    E:\Desktop\J19B_STM8\BSP\AD7798\ -I                     /
//                    E:\Desktop\J19B_STM8\BSP\spi\ -I                        /
//                    E:\Desktop\J19B_STM8\USR\ -I                            /
//                    E:\Desktop\J19B_STM8\BSP\delay\ -I                      /
//                    E:\Desktop\J19B_STM8\BSP\tim1\ --vregs 16               /
//    List file    =  E:\Desktop\J19B_STM8\Debug\List\led.s                   /
//                                                                            /
//                                                                            /
///////////////////////////////////////////////////////////////////////////////

        NAME led

        EXTERN ?b0
        EXTERN GPIO_Init

        PUBLIC LED_conf

// E:\Desktop\J19B_STM8\BSP\led\led.c
//    1 #include "led.h"
//    2 

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//    3 void LED_conf(void)
//    4 {
//    5   GPIO_Init(GPIOB,(GPIO_Pin_TypeDef)GPIO_PIN_5,GPIO_MODE_OUT_PP_HIGH_FAST);
LED_conf:
        MOV       S:?b0, #0xf0
        LD        A, #0x20
        LDW       X, #0x5005
        JP        L:GPIO_Init
//    6   
//    7   
//    8 }

        SECTION VREGS:DATA:REORDER:NOROOT(0)

        END
// 
// 12 bytes in section .near_func.text
// 
// 12 bytes of CODE memory
//
//Errors: none
//Warnings: none
