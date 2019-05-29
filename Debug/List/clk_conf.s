///////////////////////////////////////////////////////////////////////////////
//                                                                            /
//                                                      05/Mar/2019  20:30:16 /
// IAR C/C++ Compiler V1.31.1.20058 [Evaluation] for STM8                     /
// Copyright 2010-2012 IAR Systems AB.                                        /
//                                                                            /
//    Source file  =  C:\Users\lun55\Desktop\J19B_STM8\USR\clk_conf.c         /
//    Command line =  C:\Users\lun55\Desktop\J19B_STM8\USR\clk_conf.c -e -Ol  /
//                    --no_cse --no_unroll --no_inline --no_code_motion       /
//                    --no_tbaa --no_cross_call --debug --code_model small    /
//                    --data_model medium -o C:\Users\lun55\Desktop\J19B_STM8 /
//                    \Debug\Obj\ --dlib_config "D:\Program Files (x86)\IAR   /
//                    Systems\Embedded Workbench 6.0                          /
//                    Evaluation\stm8\LIB\dlstm8smf.h" -lcN                   /
//                    C:\Users\lun55\Desktop\J19B_STM8\Debug\List\ -lB        /
//                    C:\Users\lun55\Desktop\J19B_STM8\Debug\List\ --vregs 16 /
//    List file    =  C:\Users\lun55\Desktop\J19B_STM8\Debug\List\clk_conf.s  /
//                                                                            /
//                                                                            /
///////////////////////////////////////////////////////////////////////////////

        NAME clk_conf

CLK_CKDIVR EQU 20678
CLK_CKDIVR_bit EQU 20678
        PUBLIC Clk_conf
        PUBWEAK _A_CLK_CKDIVR
_A_CLK_CKDIVR EQU 20678

// C:\Users\lun55\Desktop\J19B_STM8\USR\clk_conf.c
//    1 #include "clk_conf.h"
//    2 

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//    3 void Clk_conf(void)
//    4 {
//    5   CLK_CKDIVR&= (uint8_t)(~0x18);    /*时钟复位*/
Clk_conf:
        LD        A, L:0x50c6
        AND       A, #0xe7
        LD        L:0x50c6, A
//    6   CLK_CKDIVR|= (uint8_t)0x00;       /*设置时钟为内部16M高速时钟*/
        LD        A, L:0x50c6
        LD        L:0x50c6, A
//    7   
//    8 }
        RET
        REQUIRE _A_CLK_CKDIVR

        SECTION VREGS:DATA:REORDER:NOROOT(0)

        END
// 
//  1 byte  in section .near.noinit
// 15 bytes in section .near_func.text
// 
// 15 bytes of CODE memory
//  0 bytes of DATA memory (+ 1 byte shared)
//
//Errors: none
//Warnings: none
