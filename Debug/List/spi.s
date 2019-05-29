///////////////////////////////////////////////////////////////////////////////
//                                                                            /
//                                                      29/May/2019  13:11:06 /
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

        EXTERN ?add32_l0_l0_l1
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
        EXTERN ?epilogue_w4
        EXTERN ?mov_l0_l2
        EXTERN ?mov_l1_l2
        EXTERN ?mov_l2_l0
        EXTERN ?move1616_v_x_y_a
        EXTERN ?push_l2
        EXTERN ?push_l3
        EXTERN ?push_w4
        EXTERN ?sext32_l0_x
        EXTERN ?w0
        EXTERN ?w1
        EXTERN ?w4
        EXTERN ?w5
        EXTERN ?w6
        EXTERN ?w7
        EXTERN AD7798_Init
        EXTERN Delay_10us
        EXTERN GPIO_Init
        EXTERN GPIO_ReadInputPin
        EXTERN GPIO_WriteHigh
        EXTERN GPIO_WriteLow

        PUBLIC SPI_Read
        PUBLIC SPI_Read_TwoBytes
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
//   19 unsigned char SPI_Write(unsigned char* data,
//   20                         unsigned char bytesNumber)
//   21 {
SPI_Write:
        CALL      L:?push_l2
        CALL      L:?push_l3
        LDW       S:?w6, X
        LD        S:?b14, A
//   22   u8 WriteData = 0;
        CLR       S:?b15
//   23   for (int j = 0; j < bytesNumber;j++)
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
//   24   {
//   25     //AD7798_CS_LOW; 
//   26     WriteData = data[j];
        LDW       X, S:?w5
        ADDW      X, S:?w6
        LD        A, (X)
        LD        S:?b15, A
//   27     for(int i=0;i<8;i++)
        CLR       S:?b9
        CLR       S:?b8
        JRA       L:??SPI_Write_3
//   28     {
//   29       Delay_10us();
//   30       AD7798_SCLK_LOW ;
//   31       Delay_10us();
//   32       if(WriteData&0x80) AD7798_DIN_HIGH;
//   33       else AD7798_DIN_LOW ;
??SPI_Write_4:
        LD        A, #0x40
        LDW       X, #0x500a
        CALL      L:GPIO_WriteLow
//   34       WriteData=WriteData<<1;
??SPI_Write_5:
        LD        A, S:?b15
        SLL       A
        LD        S:?b15, A
//   35       Delay_10us();
        CALL      L:Delay_10us
//   36       AD7798_SCLK_HIGH;
        LD        A, #0x20
        LDW       X, #0x500a
        CALL      L:GPIO_WriteHigh
//   37       Delay_10us();
        CALL      L:Delay_10us
        LDW       X, S:?w4
        INCW      X
        LDW       S:?w4, X
??SPI_Write_3:
        LDW       X, S:?w4
        CPW       X, #0x8
        JRSGE     L:??SPI_Write_1
        CALL      L:Delay_10us
        LD        A, #0x20
        LDW       X, #0x500a
        CALL      L:GPIO_WriteLow
        CALL      L:Delay_10us
        LD        A, S:?b15
        AND       A, #0x80
        CP        A, #0x0
        JREQ      L:??SPI_Write_4
        LD        A, #0x40
        LDW       X, #0x500a
        CALL      L:GPIO_WriteHigh
        JRA       L:??SPI_Write_5
//   38     }  
//   39     //AD7798_CS_HIGH;
//   40   }
//   41   
//   42   return bytesNumber;
??SPI_Write_2:
        LD        A, S:?b14
        JP        L:?epilogue_l2_l3
//   43 }

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//   44 u32 SPI_Read_TwoBytes(unsigned char regAddress)
//   45 {
SPI_Read_TwoBytes:
        CALL      L:?push_l2
        CALL      L:?push_l3
        SUB       SP, #0xa
        LD        S:?b0, A
//   46     u32 receivedData = 0x00000000;	
        CLRW      X
        LDW       S:?w5, X
        LDW       S:?w4, X
//   47     u8 ReadData[3] = {0} ;
        LDW       Y, #`?<Constant {0}>`
        LDW       X, SP
        ADDW      X, #0x3
        PUSHW     X
        LD        A, #0x3
        CALL      L:?move1616_v_x_y_a
        POPW      X
//   48     u8 data[5] = {0x03, 0x00, 0x00, 0x00, 0x00};
        LDW       Y, #`?<Constant {3, 0, 0, 0, 0}>`
        LDW       X, SP
        ADDW      X, #0x6
        PUSHW     X
        LD        A, #0x5
        CALL      L:?move1616_v_x_y_a
        POPW      X
//   49     u8 WriteData = 0;
        CLR       S:?b14
//   50     data[1] = AD7798_COMM_READ |  AD7798_COMM_ADDR(regAddress); 
        LD        A, S:?b0
        AND       A, #0x7
        SLL       A
        SLL       A
        SLL       A
        OR        A, #0x40
        LD        (0x7,SP), A
//   51     AD7798_CS_LOW;
        LD        A, #0x8
        LDW       X, #0x5000
        CALL      L:GPIO_WriteLow
//   52     for (int j = 0; j < 2;j++)
        CLRW      X
        LDW       (0x1,SP), X
        JRA       L:??SPI_Read_TwoBytes_0
??SPI_Read_TwoBytes_1:
        LDW       X, (0x1,SP)
        INCW      X
        LDW       (0x1,SP), X
??SPI_Read_TwoBytes_0:
        LDW       X, (0x1,SP)
        CPW       X, #0x2
        JRSGE     L:??SPI_Read_TwoBytes_2
//   53     {
//   54       WriteData = data[j];
        LDW       X, SP
        ADDW      X, #0x6
        ADDW      X, (0x1,SP)
        LD        A, (X)
        LD        S:?b14, A
//   55       for(int i=0;i<8;i++)
        CLR       S:?b13
        CLR       S:?b12
        JRA       L:??SPI_Read_TwoBytes_3
//   56       {
//   57        Delay_10us();
//   58        AD7798_SCLK_LOW ;
//   59        Delay_10us();
//   60        if(WriteData&0x80) AD7798_DIN_HIGH;
//   61        else AD7798_DIN_LOW ;
??SPI_Read_TwoBytes_4:
        LD        A, #0x40
        LDW       X, #0x500a
        CALL      L:GPIO_WriteLow
//   62        WriteData=WriteData<<1 ;
??SPI_Read_TwoBytes_5:
        LD        A, S:?b14
        SLL       A
        LD        S:?b14, A
//   63        Delay_10us();
        CALL      L:Delay_10us
//   64        AD7798_SCLK_HIGH;
        LD        A, #0x20
        LDW       X, #0x500a
        CALL      L:GPIO_WriteHigh
//   65        Delay_10us();
        CALL      L:Delay_10us
        LDW       X, S:?w6
        INCW      X
        LDW       S:?w6, X
??SPI_Read_TwoBytes_3:
        LDW       X, S:?w6
        CPW       X, #0x8
        JRSGE     L:??SPI_Read_TwoBytes_1
        CALL      L:Delay_10us
        LD        A, #0x20
        LDW       X, #0x500a
        CALL      L:GPIO_WriteLow
        CALL      L:Delay_10us
        LD        A, S:?b14
        AND       A, #0x80
        CP        A, #0x0
        JREQ      L:??SPI_Read_TwoBytes_4
        LD        A, #0x40
        LDW       X, #0x500a
        CALL      L:GPIO_WriteHigh
        JRA       L:??SPI_Read_TwoBytes_5
//   66      }  
//   67     }
//   68     //AD7798_DOUT_LOW;
//   69     for(int j=0;j<3;j++)
??SPI_Read_TwoBytes_2:
        CLR       S:?b15
        CLR       S:?b14
        JRA       L:??SPI_Read_TwoBytes_6
//   70     {
//   71       for(int i=0;i<8;i++)
//   72      {
//   73        Delay_10us();
??SPI_Read_TwoBytes_7:
        CALL      L:Delay_10us
//   74        AD7798_SCLK_LOW;
        LD        A, #0x20
        LDW       X, #0x500a
        CALL      L:GPIO_WriteLow
//   75        Delay_10us();
        CALL      L:Delay_10us
//   76        ReadData[j] = ReadData[j]<<1 ;
        LDW       X, SP
        ADDW      X, #0x3
        ADDW      X, S:?w7
        LD        A, (X)
        SLL       A
        LDW       X, SP
        ADDW      X, #0x3
        ADDW      X, S:?w7
        LD        (X), A
//   77        Delay_10us();
        CALL      L:Delay_10us
//   78        if(AD7798_DOUT) ReadData[j]+=1 ;
        LD        A, #0x80
        LDW       X, #0x500a
        CALL      L:GPIO_ReadInputPin
        CP        A, #0x0
        JREQ      L:??SPI_Read_TwoBytes_8
        LDW       X, SP
        ADDW      X, #0x3
        ADDW      X, S:?w7
        LD        A, (X)
        ADD       A, #0x1
        LDW       X, SP
        ADDW      X, #0x3
        ADDW      X, S:?w7
        LD        (X), A
//   79        Delay_10us();
??SPI_Read_TwoBytes_8:
        CALL      L:Delay_10us
//   80        AD7798_SCLK_HIGH;
        LD        A, #0x20
        LDW       X, #0x500a
        CALL      L:GPIO_WriteHigh
//   81        Delay_10us();
        CALL      L:Delay_10us
//   82      }
        LDW       X, S:?w6
        INCW      X
        LDW       S:?w6, X
??SPI_Read_TwoBytes_9:
        LDW       X, S:?w6
        CPW       X, #0x8
        JRSLT     L:??SPI_Read_TwoBytes_7
        LDW       X, S:?w7
        INCW      X
        LDW       S:?w7, X
??SPI_Read_TwoBytes_6:
        LDW       X, S:?w7
        CPW       X, #0x3
        JRSGE     L:??SPI_Read_TwoBytes_10
        CLR       S:?b13
        CLR       S:?b12
        JRA       L:??SPI_Read_TwoBytes_9
//   83      //Delay_10us();
//   84      //AD7798_DOUT_HIGH;
//   85     }
//   86     //Delay_10us();
//   87     AD7798_CS_HIGH;
??SPI_Read_TwoBytes_10:
        LD        A, #0x8
        LDW       X, #0x5000
        CALL      L:GPIO_WriteHigh
//   88    
//   89     receivedData += (ReadData[0] << 16);
//   90     receivedData += (ReadData[1] << 8);
        LD        A, (0x4,SP)
        CLRW      X
        LD        XL, A
        CLR       A
        RLWA      X, A
        CALL      L:?sext32_l0_x
        CALL      L:?mov_l1_l2
        CALL      L:?add32_l0_l0_l1
        CALL      L:?mov_l2_l0
//   91     receivedData += (ReadData[2] << 0);
        LD        A, (0x5,SP)
        CLRW      X
        LD        XL, A
        LDW       S:?w1, X
        CLRW      X
        LDW       S:?w0, X
        CALL      L:?mov_l1_l2
        CALL      L:?add32_l0_l0_l1
        CALL      L:?mov_l2_l0
//   92 
//   93     return receivedData;
        CALL      L:?mov_l0_l2
        ADD       SP, #0xa
        JP        L:?epilogue_l2_l3
//   94 }

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//   95 unsigned char SPI_Read(unsigned char* data,
//   96                        unsigned char bytesNumber)
//   97 {
SPI_Read:
        CALL      L:?push_l2
        CALL      L:?push_l3
        LDW       S:?w6, X
        LD        S:?b14, A
//   98   u8 ReadData = 0 ;
        CLR       S:?b15
//   99   //WaitRDY();
//  100 //      for(int i=0;i<8;i++)
//  101 //    {
//  102 //       Delay_10us();
//  103 //       AD7798_SCLK_LOW;
//  104 //       Delay_10us();
//  105 //       Delay_10us();
//  106 //       AD7798_SCLK_HIGH;
//  107 //       Delay_10us();
//  108 //    }
//  109   for (int j = 0; j < bytesNumber;j++)
        CLR       S:?b11
        CLR       S:?b10
        JRA       L:??SPI_Read_0
//  110   {
//  111     //AD7798_CS_LOW;
//  112     //AD7798_DOUT_LOW;
//  113     for(int i=0;i<8;i++)
//  114     {
//  115        Delay_10us();
??SPI_Read_1:
        CALL      L:Delay_10us
//  116        AD7798_SCLK_LOW;
        LD        A, #0x20
        LDW       X, #0x500a
        CALL      L:GPIO_WriteLow
//  117        Delay_10us();
        CALL      L:Delay_10us
//  118        ReadData = ReadData<<1 ;
        LD        A, S:?b15
        SLL       A
        LD        S:?b15, A
//  119        if(AD7798_DOUT) ReadData+=1 ;
        LD        A, #0x80
        LDW       X, #0x500a
        CALL      L:GPIO_ReadInputPin
        CP        A, #0x0
        JREQ      L:??SPI_Read_2
        LD        A, S:?b15
        ADD       A, #0x1
        LD        S:?b15, A
//  120        Delay_10us();
??SPI_Read_2:
        CALL      L:Delay_10us
//  121        AD7798_SCLK_HIGH;
        LD        A, #0x20
        LDW       X, #0x500a
        CALL      L:GPIO_WriteHigh
//  122        Delay_10us();
        CALL      L:Delay_10us
//  123     }
        LDW       X, S:?w4
        INCW      X
        LDW       S:?w4, X
??SPI_Read_3:
        LDW       X, S:?w4
        CPW       X, #0x8
        JRSLT     L:??SPI_Read_1
//  124     data[j] = ReadData;
        LDW       X, S:?w5
        ADDW      X, S:?w6
        LD        A, S:?b15
        LD        (X), A
//  125     AD7798_DOUT_HIGH;
        LD        A, #0x80
        LDW       X, #0x500a
        CALL      L:GPIO_WriteHigh
        LDW       X, S:?w5
        INCW      X
        LDW       S:?w5, X
??SPI_Read_0:
        CLRW      X
        EXG       A, XL
        LD        A, S:?b14
        EXG       A, XL
        LDW       S:?w0, X
        LDW       X, S:?w5
        CPW       X, S:?w0
        JRSGE     L:??SPI_Read_4
        CLR       S:?b9
        CLR       S:?b8
        JRA       L:??SPI_Read_3
//  126     //AD7798_CS_HIGH;
//  127   }   
//  128 
//  129   return bytesNumber;                  
??SPI_Read_4:
        LD        A, S:?b14
        JP        L:?epilogue_l2_l3
//  130 }

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  131 void WaitRDY(void)
//  132 {
WaitRDY:
        CALL      L:?push_w4
//  133   u16 cont = 0;
        CLR       S:?b9
        CLR       S:?b8
//  134   while(AD7798_DOUT)
??WaitRDY_0:
        LD        A, #0x80
        LDW       X, #0x500a
        CALL      L:GPIO_ReadInputPin
        CP        A, #0x0
        JREQ      L:??WaitRDY_1
//  135   {
//  136     cont++;
        LDW       X, S:?w4
        INCW      X
        LDW       S:?w4, X
//  137     if(cont>65530)
        LDW       X, S:?w4
        CPW       X, #0xfffb
        JRC       L:??WaitRDY_0
//  138     {
//  139       AD7798_Init();
        CALL      L:AD7798_Init
//  140       break ;
//  141     }
//  142   }
//  143 }
??WaitRDY_1:
        JP        L:?epilogue_w4

        SECTION VREGS:DATA:REORDER:NOROOT(0)

        SECTION `.near.rodata`:CONST:REORDER:NOROOT(0)
`?<Constant {0}>`:
        DC8 0, 0, 0

        SECTION `.near.rodata`:CONST:REORDER:NOROOT(0)
`?<Constant {3, 0, 0, 0, 0}>`:
        DC8 3, 0, 0, 0, 0

        END
// 
//   8 bytes in section .near.rodata
// 687 bytes in section .near_func.text
// 
// 687 bytes of CODE  memory
//   8 bytes of CONST memory
//
//Errors: none
//Warnings: 1
