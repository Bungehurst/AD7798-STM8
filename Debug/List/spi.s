///////////////////////////////////////////////////////////////////////////////
//                                                                            /
//                                                      31/May/2019  19:47:10 /
// IAR C/C++ Compiler V1.31.1.20058 [Evaluation] for STM8                     /
// Copyright 2010-2012 IAR Systems AB.                                        /
//                                                                            /
//    Source file  =  E:\Desktop\J19B_4E\BSP\spi\spi.c                        /
//    Command line =  E:\Desktop\J19B_4E\BSP\spi\spi.c -e -Ol --no_cse        /
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
//    List file    =  E:\Desktop\J19B_4E\Debug\List\spi.s                     /
//                                                                            /
//                                                                            /
///////////////////////////////////////////////////////////////////////////////

        NAME spi

        EXTERN ?b0
        EXTERN ?b10
        EXTERN ?b11
        EXTERN ?b12
        EXTERN ?b13
        EXTERN ?b14
        EXTERN ?b15
        EXTERN ?b8
        EXTERN ?b9
        EXTERN ?epilogue_l2_l3
        EXTERN ?epilogue_l2_w6
        EXTERN ?push_l2
        EXTERN ?push_l3
        EXTERN ?push_w6
        EXTERN ?w0
        EXTERN ?w4
        EXTERN ?w5
        EXTERN ?w6
        EXTERN AD7798_Init
        EXTERN Delay_10us
        EXTERN GPIO_Init
        EXTERN GPIO_WriteHigh
        EXTERN GPIO_WriteLow

        PUBLIC SPI_Read
        PUBLIC SPI_Write
        PUBLIC SPI_conf
        PUBLIC WaitRDY

// E:\Desktop\J19B_4E\BSP\spi\spi.c
//    1 #include "spi.h"
//    2 #include "delay.h"
//    3 #include "AD7798.h"

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//    4 void SPI_conf()
//    5 {
//    6   /* PA3 -> SPI_SEL   CS
//    7    * PC5 -> SPI_CLK   SCLK
//    8    * PC6 -> SPI_MOSI  DIN
//    9    * PC7 <- SPI_MISO  DOUT/RDY                                                       
//   10   */
//   11   
//   12   GPIO_Init(GPIOA,(GPIO_Pin_TypeDef)GPIO_PIN_3,GPIO_MODE_OUT_PP_HIGH_FAST);
SPI_conf:
        MOV       S:?b0, #0xf0
        LD        A, #0x8
        LDW       X, #0x5000
        CALL      L:GPIO_Init
//   13   GPIO_Init(GPIOC,(GPIO_Pin_TypeDef)GPIO_PIN_7,GPIO_MODE_IN_PU_NO_IT);
        MOV       S:?b0, #0x40
        LD        A, #0x80
        LDW       X, #0x500a
        CALL      L:GPIO_Init
//   14   GPIO_Init(GPIOC,(GPIO_Pin_TypeDef)GPIO_PIN_6,GPIO_MODE_OUT_PP_HIGH_FAST);
        MOV       S:?b0, #0xf0
        LD        A, #0x40
        LDW       X, #0x500a
        CALL      L:GPIO_Init
//   15   GPIO_Init(GPIOC,(GPIO_Pin_TypeDef)GPIO_PIN_5,GPIO_MODE_OUT_PP_HIGH_FAST);
        MOV       S:?b0, #0xf0
        LD        A, #0x20
        LDW       X, #0x500a
        CALL      L:GPIO_Init
//   16   GPIO_WriteHigh(GPIOA,(GPIO_Pin_TypeDef)GPIO_PIN_3);
        LD        A, #0x8
        LDW       X, #0x5000
        JP        L:GPIO_WriteHigh
//   17 }
//   18 

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//   19 unsigned char SPI_Write(u8* data,
//   20                         u8 bytesNumber)
//   21 {
SPI_Write:
        CALL      L:?push_l2
        CALL      L:?push_l3
        LDW       S:?w6, X
        LD        S:?b14, A
//   22   u8 WriteData = 0;
        CLR       S:?b15
//   23   AD7798_SCLK_HIGH ;
        LD        A, #0x20
        LDW       X, #0x500a
        CALL      L:GPIO_WriteHigh
//   24   Delay_10us();
        CALL      L:Delay_10us
//   25 
//   26   for (int j = 0; j < bytesNumber;j++)
        CLR       S:?b11
        CLR       S:?b10
        JRA       L:??SPI_Write_0
??SPI_Write_1:
        LDW       X, S:?w5
        INCW      X
        LDW       S:?w5, X
??SPI_Write_0:
        CLRW      X
        EXG       A, XL
        LD        A, S:?b14
        EXG       A, XL
        LDW       S:?w0, X
        LDW       X, S:?w5
        CPW       X, S:?w0
        JRSGE     L:??SPI_Write_2
//   27   {
//   28     WriteData = data[j];
        LDW       X, S:?w5
        ADDW      X, S:?w6
        LD        A, (X)
        LD        S:?b15, A
//   29     for(int i=0;i<8;i++)
        CLR       S:?b9
        CLR       S:?b8
        JRA       L:??SPI_Write_3
//   30     {
//   31       AD7798_SCLK_LOW ;
//   32       if(WriteData&0x80) AD7798_DIN_HIGH;
//   33       else AD7798_DIN_LOW ;
??SPI_Write_4:
        LD        A, #0x40
        LDW       X, #0x500a
        CALL      L:GPIO_WriteLow
//   34       Delay_10us();
??SPI_Write_5:
        CALL      L:Delay_10us
//   35       AD7798_SCLK_HIGH;
        LD        A, #0x20
        LDW       X, #0x500a
        CALL      L:GPIO_WriteHigh
//   36       Delay_10us();
        CALL      L:Delay_10us
//   37       WriteData=WriteData<<1;
        LD        A, S:?b15
        SLL       A
        LD        S:?b15, A
        LDW       X, S:?w4
        INCW      X
        LDW       S:?w4, X
??SPI_Write_3:
        LDW       X, S:?w4
        CPW       X, #0x8
        JRSGE     L:??SPI_Write_1
        LD        A, #0x20
        LDW       X, #0x500a
        CALL      L:GPIO_WriteLow
        LD        A, S:?b15
        AND       A, #0x80
        CP        A, #0x0
        JREQ      L:??SPI_Write_4
        LD        A, #0x40
        LDW       X, #0x500a
        CALL      L:GPIO_WriteHigh
        JRA       L:??SPI_Write_5
//   38     }  
//   39   }
//   40 
//   41   return bytesNumber;
??SPI_Write_2:
        LD        A, S:?b14
        JP        L:?epilogue_l2_l3
//   42 }
//   43 

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//   44 unsigned char SPI_Read(u8* data,
//   45                        u8 bytesNumber)
//   46 {
SPI_Read:
        CALL      L:?push_l2
        CALL      L:?push_w6
        PUSH      S:?b14
        PUSHW     X
        LD        S:?b13, A
//   47   u8 ReadData = 0 ;
        CLR       S:?b12
//   48   u8 bit;
//   49 
//   50   AD7798_SCLK_HIGH;
        LD        A, #0x20
        LDW       X, #0x500a
        CALL      L:GPIO_WriteHigh
//   51   Delay_10us();
        CALL      L:Delay_10us
//   52   for (int j = 0; j < bytesNumber;j++)
        CLR       S:?b11
        CLR       S:?b10
        JRA       L:??SPI_Read_0
//   53   {
//   54     for(int i=0;i<8;i++)
//   55     {
//   56        AD7798_SCLK_LOW;
??SPI_Read_1:
        LD        A, #0x20
        LDW       X, #0x500a
        CALL      L:GPIO_WriteLow
//   57        ReadData = ReadData<<1 ;
        LD        A, S:?b12
        SLL       A
        LD        S:?b12, A
//   58        Delay_10us();
        CALL      L:Delay_10us
//   59        bit = AD7798_DOUT;
        LD        A, L:0x500b
        AND       A, #0x80
        LD        S:?b14, A
//   60        AD7798_SCLK_HIGH;
        LD        A, #0x20
        LDW       X, #0x500a
        CALL      L:GPIO_WriteHigh
//   61        if(bit) ReadData+=1 ;
        TNZ       S:?b14
        JREQ      L:??SPI_Read_2
        LD        A, S:?b12
        ADD       A, #0x1
        LD        S:?b12, A
//   62        Delay_10us();
??SPI_Read_2:
        CALL      L:Delay_10us
//   63        
//   64     }
        LDW       X, S:?w4
        INCW      X
        LDW       S:?w4, X
??SPI_Read_3:
        LDW       X, S:?w4
        CPW       X, #0x8
        JRSLT     L:??SPI_Read_1
//   65     data[j] = ReadData;
        LDW       X, S:?w5
        ADDW      X, (0x1,SP)
        LD        A, S:?b12
        LD        (X), A
        LDW       X, S:?w5
        INCW      X
        LDW       S:?w5, X
??SPI_Read_0:
        CLRW      X
        EXG       A, XL
        LD        A, S:?b13
        EXG       A, XL
        LDW       S:?w0, X
        LDW       X, S:?w5
        CPW       X, S:?w0
        JRSGE     L:??SPI_Read_4
        CLR       S:?b9
        CLR       S:?b8
        JRA       L:??SPI_Read_3
//   66   }   
//   67   return bytesNumber;                  
??SPI_Read_4:
        LD        A, S:?b13
        ADD       SP, #0x2
        POP       S:?b14
        JP        L:?epilogue_l2_w6
//   68 }

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//   69 void WaitRDY(void)
//   70 {
//   71   u16 cont = 0;
WaitRDY:
        CLRW      X
//   72   while(AD7798_DOUT)
??WaitRDY_0:
        BTJF      L:0x500b, #0x7, L:??WaitRDY_1
//   73   {
//   74     cont++;
        INCW      X
//   75     if(cont>65530)
        CPW       X, #0xfffb
        JRC       L:??WaitRDY_0
//   76     {
//   77       AD7798_Init();
        CALL      L:AD7798_Init
//   78       break ;
//   79     }
//   80   }
//   81 }
??WaitRDY_1:
        RET

        SECTION VREGS:DATA:REORDER:NOROOT(0)

        END
// 
// 333 bytes in section .near_func.text
// 
// 333 bytes of CODE memory
//
//Errors: none
//Warnings: none
