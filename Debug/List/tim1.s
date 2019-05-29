///////////////////////////////////////////////////////////////////////////////
//                                                                            /
//                                                      28/May/2019  16:25:29 /
// IAR C/C++ Compiler V1.31.1.20058 [Evaluation] for STM8                     /
// Copyright 2010-2012 IAR Systems AB.                                        /
//                                                                            /
//    Source file  =  E:\Desktop\J19B_STM8\BSP\tim1\tim1.c                    /
//    Command line =  E:\Desktop\J19B_STM8\BSP\tim1\tim1.c -e -Ol --no_cse    /
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
//    List file    =  E:\Desktop\J19B_STM8\Debug\List\tim1.s                  /
//                                                                            /
//                                                                            /
///////////////////////////////////////////////////////////////////////////////

        NAME tim1

        EXTERN ?b0
        EXTERN CLK_PeripheralClockConfig
        EXTERN TIM1_ARRPreloadConfig
        EXTERN TIM1_Cmd
        EXTERN TIM1_DeInit
        EXTERN TIM1_ITConfig
        EXTERN TIM1_SetCounter
        EXTERN TIM1_TimeBaseInit

        PUBLIC timer1_Init

// E:\Desktop\J19B_STM8\BSP\tim1\tim1.c
//    1 #include "tim1.h"

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//    2 void timer1_Init(void)
//    3 {
//    4   CLK_PeripheralClockConfig(CLK_PERIPHERAL_TIMER1, ENABLE);  
timer1_Init:
        MOV       S:?b0, #0x1
        LD        A, #0x7
        CALL      L:CLK_PeripheralClockConfig
//    5   TIM1_DeInit();
        CALL      L:TIM1_DeInit
//    6   TIM1_TimeBaseInit(15,TIM1_COUNTERMODE_UP,9999,0);
        CLR       S:?b0
        LDW       Y, #0x270f
        CLR       A
        LDW       X, #0xf
        CALL      L:TIM1_TimeBaseInit
//    7 
//    8   TIM1_ITConfig(TIM1_IT_UPDATE, DISABLE);
        CLR       S:?b0
        LD        A, #0x1
        CALL      L:TIM1_ITConfig
//    9   TIM1_ARRPreloadConfig(ENABLE);
        LD        A, #0x1
        CALL      L:TIM1_ARRPreloadConfig
//   10   TIM1_SetCounter(0);
        CLRW      X
        CALL      L:TIM1_SetCounter
//   11   TIM1_Cmd(ENABLE);
        LD        A, #0x1
        JP        L:TIM1_Cmd
//   12 }

        SECTION VREGS:DATA:REORDER:NOROOT(0)

        END
// 
// 46 bytes in section .near_func.text
// 
// 46 bytes of CODE memory
//
//Errors: none
//Warnings: none
