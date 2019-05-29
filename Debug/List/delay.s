///////////////////////////////////////////////////////////////////////////////
//                                                                            /
//                                                      29/May/2019  09:27:06 /
// IAR C/C++ Compiler V1.31.1.20058 [Evaluation] for STM8                     /
// Copyright 2010-2012 IAR Systems AB.                                        /
//                                                                            /
//    Source file  =  E:\Desktop\J19B_4E\BSP\delay\delay.c                    /
//    Command line =  E:\Desktop\J19B_4E\BSP\delay\delay.c -e -Ol --no_cse    /
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
//    List file    =  E:\Desktop\J19B_4E\Debug\List\delay.s                   /
//                                                                            /
//                                                                            /
///////////////////////////////////////////////////////////////////////////////

        NAME delay

        PUBLIC Delay_10us
        PUBLIC Delay_1us
        PUBLIC Delay_ms

// E:\Desktop\J19B_4E\BSP\delay\delay.c
//    1 #include "delay.h"

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//    2 void Delay_1us(void)     
//    3 {
//    4   asm("nop");
Delay_1us:
        nop
//    5 }
        RET

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//    6 void Delay_10us(void)     
//    7 {
//    8   asm("nop"); asm("nop");
Delay_10us:
        nop
        nop
//    9   asm("nop"); asm("nop");
        nop
        nop
//   10   asm("nop"); asm("nop");
        nop
        nop
//   11   asm("nop"); asm("nop");
        nop
        nop
//   12   asm("nop"); asm("nop");
        nop
        nop
//   13   asm("nop"); asm("nop");
        nop
        nop
//   14   asm("nop"); asm("nop");
        nop
        nop
//   15   asm("nop"); asm("nop");
        nop
        nop
//   16   asm("nop"); asm("nop");
        nop
        nop
//   17   asm("nop"); asm("nop");  
        nop
        nop
//   18   asm("nop"); asm("nop");
        nop
        nop
//   19   asm("nop"); asm("nop");
        nop
        nop
//   20   asm("nop"); asm("nop");
        nop
        nop
//   21   asm("nop"); asm("nop");
        nop
        nop
//   22   asm("nop"); asm("nop"); 
        nop
        nop
//   23   asm("nop"); asm("nop");
        nop
        nop
//   24   asm("nop"); asm("nop");
        nop
        nop
//   25   asm("nop"); asm("nop");
        nop
        nop
//   26   asm("nop"); asm("nop");
        nop
        nop
//   27   asm("nop"); asm("nop"); 
        nop
        nop
//   28   asm("nop"); asm("nop");
        nop
        nop
//   29   asm("nop"); asm("nop");
        nop
        nop
//   30   asm("nop"); asm("nop");
        nop
        nop
//   31   asm("nop"); asm("nop");
        nop
        nop
//   32   asm("nop"); asm("nop");
        nop
        nop
//   33   asm("nop");
        nop
//   34   
//   35   asm("nop"); asm("nop");
        nop
        nop
//   36   asm("nop"); asm("nop");
        nop
        nop
//   37   asm("nop"); asm("nop");
        nop
        nop
//   38   asm("nop"); asm("nop");
        nop
        nop
//   39   asm("nop"); asm("nop");
        nop
        nop
//   40   asm("nop"); asm("nop");
        nop
        nop
//   41   asm("nop"); asm("nop");
        nop
        nop
//   42   asm("nop"); asm("nop");
        nop
        nop
//   43   asm("nop"); asm("nop");
        nop
        nop
//   44   asm("nop"); asm("nop");  
        nop
        nop
//   45   asm("nop"); asm("nop");
        nop
        nop
//   46   asm("nop"); asm("nop");
        nop
        nop
//   47   asm("nop"); asm("nop");
        nop
        nop
//   48   asm("nop"); asm("nop");
        nop
        nop
//   49   asm("nop"); asm("nop"); 
        nop
        nop
//   50   asm("nop"); asm("nop");
        nop
        nop
//   51   asm("nop"); asm("nop");
        nop
        nop
//   52   asm("nop"); asm("nop");
        nop
        nop
//   53   asm("nop"); asm("nop");
        nop
        nop
//   54   asm("nop"); asm("nop"); 
        nop
        nop
//   55   asm("nop"); asm("nop");
        nop
        nop
//   56   asm("nop"); asm("nop");
        nop
        nop
//   57   asm("nop"); asm("nop");
        nop
        nop
//   58   asm("nop"); asm("nop");
        nop
        nop
//   59   asm("nop"); asm("nop");
        nop
        nop
//   60   asm("nop");
        nop
//   61 }
        RET

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//   62 void Delay_ms(u16 time)
//   63 {
//   64   unsigned int i = 0;
Delay_ms:
        CLRW      Y
//   65   while(time--)
??Delay_ms_0:
        LDW       Y, X
        LDW       X, Y
        DECW      X
        TNZW      Y
        JREQ      L:??Delay_ms_1
//   66   {
//   67     for(i = 0; i < 1000; i++)
        CLRW      Y
??Delay_ms_2:
        CPW       Y, #0x3e8
        JRNC      L:??Delay_ms_0
//   68     {
//   69       Delay_1us();
        CALL      L:Delay_1us
//   70     }
        INCW      Y
        JRA       L:??Delay_ms_2
//   71   }
//   72 }
??Delay_ms_1:
        RET

        SECTION VREGS:DATA:REORDER:NOROOT(0)

        END
// 
// 131 bytes in section .near_func.text
// 
// 131 bytes of CODE memory
//
//Errors: none
//Warnings: none
