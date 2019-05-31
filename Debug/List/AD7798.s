///////////////////////////////////////////////////////////////////////////////
//                                                                            /
//                                                      31/May/2019  19:47:09 /
// IAR C/C++ Compiler V1.31.1.20058 [Evaluation] for STM8                     /
// Copyright 2010-2012 IAR Systems AB.                                        /
//                                                                            /
//    Source file  =  E:\Desktop\J19B_4E\BSP\AD7798\AD7798.c                  /
//    Command line =  E:\Desktop\J19B_4E\BSP\AD7798\AD7798.c -e -Ol --no_cse  /
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
//    List file    =  E:\Desktop\J19B_4E\Debug\List\AD7798.s                  /
//                                                                            /
//                                                                            /
///////////////////////////////////////////////////////////////////////////////

        NAME AD7798

        EXTERN ?add32_l0_l0_l1
        EXTERN ?and32_l0_l0_l1
        EXTERN ?b0
        EXTERN ?b1
        EXTERN ?b12
        EXTERN ?b3
        EXTERN ?b4
        EXTERN ?b5
        EXTERN ?b8
        EXTERN ?epilogue_l2
        EXTERN ?epilogue_l2_l3
        EXTERN ?mov_l0_l2
        EXTERN ?mov_l0_l3
        EXTERN ?mov_l1_l2
        EXTERN ?mov_l2_l0
        EXTERN ?mov_l3_l0
        EXTERN ?move1616_v_x_y_a
        EXTERN ?mul32_l0_l0_dl
        EXTERN ?or32_l0_l0_l1
        EXTERN ?push_l2
        EXTERN ?push_l3
        EXTERN ?sext32_l0_x
        EXTERN ?sll16_x_x_5
        EXTERN ?sll32_l0_l0_db
        EXTERN ?srl32_l0_l0_db
        EXTERN ?w0
        EXTERN ?w1
        EXTERN ?w2
        EXTERN ?w3
        EXTERN ?w4
        EXTERN ?w5
        EXTERN Delay_10us
        EXTERN Delay_ms
        EXTERN GPIO_WriteHigh
        EXTERN GPIO_WriteLow
        EXTERN SPI_Read
        EXTERN SPI_Write

        PUBLIC AD7798_GetRegisterValue
        PUBLIC AD7798_Init
        PUBLIC AD7798_Ready
        PUBLIC AD7798_Reset
        PUBLIC AD7798_SetChannel
        PUBLIC AD7798_SetCodingMode
        PUBLIC AD7798_SetGain
        PUBLIC AD7798_SetMode
        PUBLIC AD7798_SetReference
        PUBLIC AD7798_SetRegisterValue
        PUBLIC status

// E:\Desktop\J19B_4E\BSP\AD7798\AD7798.c
//    1 /***************************************************************************//**
//    2  *   @file   AD7798.c
//    3  *   @brief  Implementation of AD7798 Driver.
//    4  *   @author 
//    5 ********************************************************************************
//    6  * Copyright 2012(c) Analog Devices, Inc.
//    7  *
//    8  * All rights reserved.
//    9 *******************************************************************************/
//   10 
//   11 /******************************************************************************/
//   12 /* Include Files                                                              */
//   13 /******************************************************************************/
//   14 #include "AD7798.h"
//   15 #include "spi.h"
//   16 #include "main.h"
//   17 /***************************************************************************//**
//   18  * @brief Initializes the AD7799 and checks if the device is present.
//   19  *
//   20  * @param None.
//   21  *
//   22  * @return status - Result of the initialization procedure.
//   23  *                  Example: 1 - if initialization was successful (ID is 0x0B).
//   24  *                           0 - if initialization was unsuccessful.
//   25 *******************************************************************************/

        SECTION `.near.data`:DATA:REORDER:NOROOT(0)
//   26 unsigned char status = 0x1;
status:
        DC8 1

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//   27 void AD7798_Init(void)
//   28 { 
//   29   AD7798_Reset();
AD7798_Init:
        CALL      L:AD7798_Reset
//   30   Delay_ms(1000);
        LDW       X, #0x3e8
        CALL      L:Delay_ms
//   31   while(1)
//   32   {
//   33     if(((AD7798_GetRegisterValue(AD7798_REG_ID, 1) ) & 0x0F) == AD7798_ID)
??AD7798_Init_0:
        MOV       S:?b0, #0x1
        LD        A, #0x4
        CALL      L:AD7798_GetRegisterValue
        LD        A, S:?b3
        AND       A, #0xf
        CP        A, #0x9
        JRNE      L:??AD7798_Init_0
//   34     {
//   35       status=0x1;
        MOV       L:status, #0x1
//   36       break;
//   37     }
//   38   }
//   39   if(status==0x1)
        LD        A, L:status
        CP        A, #0x1
        JRNE      L:??AD7798_Init_1
//   40   {   
//   41     AD7798_SetCodingMode(AD7798_BIPOLAR);
        LD        A, #0x1
        CALL      L:AD7798_SetCodingMode
//   42     AD7798_SetChannel(AD7798_CH_AIN1P_AIN1M);
        CLRW      X
        LDW       S:?w1, X
        LDW       S:?w0, X
        CALL      L:AD7798_SetChannel
//   43     AD7798_SetReference(AD7798_REFDET_ENA);
        LD        A, #0x1
        CALL      L:AD7798_SetReference
//   44     AD7798_SetGain(AD7798_GAIN_1);
        CLRW      X
        LDW       S:?w1, X
        LDW       S:?w0, X
        CALL      L:AD7798_SetGain
//   45     
//   46     AD7798_SetMode(AD7798_MODE_CAL_SYS_ZERO);
        LDW       X, #0x6
        LDW       S:?w1, X
        CLRW      X
        LDW       S:?w0, X
        CALL      L:AD7798_SetMode
//   47     Delay_ms(1000);
        LDW       X, #0x3e8
        CALL      L:Delay_ms
//   48     AD7798_SetMode(AD7798_MODE_SINGLE);
        CLRW      X
        LDW       S:?w0, X
        INCW      X
        LDW       S:?w1, X
        CALL      L:AD7798_SetMode
//   49   }
//   50 }
??AD7798_Init_1:
        RET
//   51 
//   52 /***************************************************************************//**
//   53  * @brief Sends 32 consecutive 1's on SPI in order to reset the part.
//   54  *
//   55  * @param None.
//   56  *
//   57  * @return  None.    
//   58 *******************************************************************************/

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//   59 void AD7798_Reset(void)
//   60 {
AD7798_Reset:
        SUB       SP, #0x5
//   61   u8 dataToSend[5] = {0x03, 0xff, 0xff, 0xff, 0xff};	
        LDW       Y, #`?<Constant {3, 255, 255, 255, 255}>`
        LDW       X, SP
        ADDW      X, #0x1
        PUSHW     X
        LD        A, #0x5
        CALL      L:?move1616_v_x_y_a
        POPW      X
//   62   AD7798_CS_LOW;
        LD        A, #0x8
        LDW       X, #0x5000
        CALL      L:GPIO_WriteLow
//   63   Delay_10us();
        CALL      L:Delay_10us
//   64   SPI_Write(dataToSend,5);
        LD        A, #0x5
        LDW       X, SP
        ADDW      X, #0x1
        CALL      L:SPI_Write
//   65   AD7798_CS_HIGH;
        LD        A, #0x8
        LDW       X, #0x5000
        CALL      L:GPIO_WriteHigh
//   66 }
        ADD       SP, #0x5
        RET
//   67 /***************************************************************************//**
//   68  * @brief Reads the value of the selected register
//   69  *
//   70  * @param regAddress - The address of the register to read.
//   71  * @param size - The size of the register to read.
//   72  *
//   73  * @return data - The value of the selected register register.
//   74 *******************************************************************************/

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//   75 u32 AD7798_GetRegisterValue(unsigned char regAddress, unsigned char size)
//   76 {
AD7798_GetRegisterValue:
        CALL      L:?push_l2
        PUSH      S:?b12
        SUB       SP, #0x5
        LD        S:?b1, A
        MOV       S:?b12, S:?b0
//   77     u32 receivedData = 0x00000000;	
        CLRW      X
        LDW       S:?w5, X
        LDW       S:?w4, X
//   78     u8 data[5] = {0x00, 0x00, 0x00, 0x00, 0x00};
        LDW       Y, #`?<Constant {0, 0, 0, 0, 0}>`
        LDW       X, SP
        ADDW      X, #0x1
        PUSHW     X
        LD        A, #0x5
        CALL      L:?move1616_v_x_y_a
        POPW      X
//   79     data[1] = AD7798_COMM_READ |  AD7798_COMM_ADDR(regAddress); 
        LD        A, S:?b1
        AND       A, #0x7
        SLL       A
        SLL       A
        SLL       A
        OR        A, #0x40
        LD        (0x2,SP), A
//   80     AD7798_CS_LOW;
        LD        A, #0x8
        LDW       X, #0x5000
        CALL      L:GPIO_WriteLow
//   81     asm("nop");
        nop
//   82     SPI_Write(data,2);
        LD        A, #0x2
        LDW       X, SP
        ADDW      X, #0x1
        CALL      L:SPI_Write
//   83     SPI_Read(data,size);
        LD        A, S:?b12
        LDW       X, SP
        ADDW      X, #0x1
        CALL      L:SPI_Read
//   84     AD7798_CS_HIGH;
        LD        A, #0x8
        LDW       X, #0x5000
        CALL      L:GPIO_WriteHigh
//   85     if(size == 1)
        LD        A, S:?b12
        CP        A, #0x1
        JRNE      L:??AD7798_GetRegisterValue_0
//   86     {
//   87       receivedData += (data[0] << 0);
        LD        A, (0x1,SP)
        CLRW      X
        LD        XL, A
        LDW       S:?w1, X
        CLRW      X
        LDW       S:?w0, X
        CALL      L:?mov_l1_l2
        CALL      L:?add32_l0_l0_l1
        CALL      L:?mov_l2_l0
        JRA       L:??AD7798_GetRegisterValue_1
//   88     }
//   89     else if(size == 2)
??AD7798_GetRegisterValue_0:
        LD        A, S:?b12
        CP        A, #0x2
        JRNE      L:??AD7798_GetRegisterValue_2
//   90     {
//   91       receivedData += (data[0] << 8);
        LD        A, (0x1,SP)
        CLRW      X
        LD        XL, A
        CLR       A
        RLWA      X, A
        CALL      L:?sext32_l0_x
        CALL      L:?mov_l1_l2
        CALL      L:?add32_l0_l0_l1
        CALL      L:?mov_l2_l0
//   92       receivedData += (data[1] << 0);
        LD        A, (0x2,SP)
        CLRW      X
        LD        XL, A
        LDW       S:?w1, X
        CLRW      X
        LDW       S:?w0, X
        CALL      L:?mov_l1_l2
        CALL      L:?add32_l0_l0_l1
        CALL      L:?mov_l2_l0
        JRA       L:??AD7798_GetRegisterValue_1
//   93     }
//   94     else if(size == 3)
??AD7798_GetRegisterValue_2:
        LD        A, S:?b12
        CP        A, #0x3
        JRNE      L:??AD7798_GetRegisterValue_1
//   95     {
//   96       receivedData += (data[0] *65536);
        LD        A, (0x1,SP)
        CLRW      X
        LD        XL, A
        LDW       S:?w1, X
        CLRW      X
        LDW       S:?w0, X
        CALL      L:?mul32_l0_l0_dl
        DATA
        DC32      0x10000
        CODE
        CALL      L:?mov_l1_l2
        CALL      L:?add32_l0_l0_l1
        CALL      L:?mov_l2_l0
//   97       receivedData += (data[1] << 8);
        LD        A, (0x2,SP)
        CLRW      X
        LD        XL, A
        CLR       A
        RLWA      X, A
        CALL      L:?sext32_l0_x
        CALL      L:?mov_l1_l2
        CALL      L:?add32_l0_l0_l1
        CALL      L:?mov_l2_l0
//   98       receivedData += (data[2] << 0);
        LD        A, (0x3,SP)
        CLRW      X
        LD        XL, A
        LDW       S:?w1, X
        CLRW      X
        LDW       S:?w0, X
        CALL      L:?mov_l1_l2
        CALL      L:?add32_l0_l0_l1
        CALL      L:?mov_l2_l0
//   99     }
//  100     return receivedData;
??AD7798_GetRegisterValue_1:
        CALL      L:?mov_l0_l2
        ADD       SP, #0x5
        POP       S:?b12
        JP        L:?epilogue_l2
//  101 }
//  102 /***************************************************************************//**
//  103  * @brief Writes the value to the register
//  104  *
//  105  * @param -  regAddress - The address of the register to write to.
//  106  * @param -  regValue - The value to write to the register.
//  107  * @param -  size - The size of the register to write.
//  108  *
//  109  * @return  None.    
//  110 *******************************************************************************/

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  111 void AD7798_SetRegisterValue(unsigned char regAddress,
//  112                              unsigned long regValue, 
//  113                              unsigned char size)
//  114 {
AD7798_SetRegisterValue:
        PUSH      S:?b8
        SUB       SP, #0x5
        LD        S:?b5, A
        MOV       S:?b8, S:?b4
//  115     u8 data[5] = {0x03, 0x00, 0x00, 0x00, 0x00};	
        LDW       Y, #`?<Constant {3, 0, 0, 0, 0}>`
        LDW       X, SP
        ADDW      X, #0x1
        PUSHW     X
        LD        A, #0x5
        CALL      L:?move1616_v_x_y_a
        POPW      X
//  116     data[1] = AD7798_COMM_WRITE |  AD7798_COMM_ADDR(regAddress);
        LD        A, S:?b5
        AND       A, #0x7
        SLL       A
        SLL       A
        SLL       A
        LD        (0x2,SP), A
//  117     if(size == 1)
        LD        A, S:?b8
        CP        A, #0x1
        JRNE      L:??AD7798_SetRegisterValue_0
//  118     {
//  119         data[2] = (unsigned char)regValue;
        LD        A, S:?b3
        LD        (0x3,SP), A
//  120     }
//  121     if(size == 2)
??AD7798_SetRegisterValue_0:
        LD        A, S:?b8
        CP        A, #0x2
        JRNE      L:??AD7798_SetRegisterValue_1
//  122     {
//  123 	data[3] = (unsigned char)((regValue & 0x0000FF) >> 0);
        LD        A, S:?b3
        LD        (0x4,SP), A
//  124         data[2] = (unsigned char)((regValue & 0x00FF00) >> 8);
        LDW       X, S:?w1
        CLR       A
        RRWA      X, A
        LD        A, XL
        LD        (0x3,SP), A
//  125     }
//  126     if(size == 3)
??AD7798_SetRegisterValue_1:
        LD        A, S:?b8
        CP        A, #0x3
        JRNE      L:??AD7798_SetRegisterValue_2
//  127     {
//  128 	data[4] = (unsigned char)((regValue & 0x0000FF) >> 0);
        LD        A, S:?b3
        LD        (0x5,SP), A
//  129 	data[3] = (unsigned char)((regValue & 0x00FF00) >> 8);
        LDW       X, S:?w1
        CLR       A
        RRWA      X, A
        LD        A, XL
        LD        (0x4,SP), A
//  130         data[2] = (unsigned char)((regValue & 0xFF0000) >> 16);
        CALL      L:?srl32_l0_l0_db
        DATA
        DC8       0x10
        CODE
        LD        A, S:?b3
        LD        (0x3,SP), A
//  131     }
//  132     AD7798_CS_LOW;
??AD7798_SetRegisterValue_2:
        LD        A, #0x8
        LDW       X, #0x5000
        CALL      L:GPIO_WriteLow
//  133     Delay_10us();
        CALL      L:Delay_10us
//  134     SPI_Write(data,(1 + size));
        LD        A, S:?b8
        ADD       A, #0x1
        LDW       X, SP
        ADDW      X, #0x1
        CALL      L:SPI_Write
//  135     AD7798_CS_HIGH;
        LD        A, #0x8
        LDW       X, #0x5000
        CALL      L:GPIO_WriteHigh
//  136 }
        ADD       SP, #0x5
        POP       S:?b8
        RET
//  137 /***************************************************************************//**
//  138  * @brief Reads /RDY bit of status reg.
//  139  *
//  140  * @param None.
//  141  *
//  142  * @return rdy	- 0 if RDY is 1.
//  143  *              - 1 if RDY is 0.
//  144 *******************************************************************************/

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  145 unsigned char AD7798_Ready(void)
//  146 {
AD7798_Ready:
        PUSH      S:?b8
//  147     u8 rdy = 0;
        CLR       S:?b8
//  148     rdy = (AD7798_GetRegisterValue(AD7798_REG_STAT,1) & 0x80);   
        MOV       S:?b0, #0x1
        CLR       A
        CALL      L:AD7798_GetRegisterValue
        LD        A, S:?b3
        AND       A, #0x80
        LD        S:?b8, A
//  149     return(!rdy);
        TNZ       S:?b8
        JRNE      L:??AD7798_Ready_0
        LD        A, #0x1
        JRA       L:??AD7798_Ready_1
??AD7798_Ready_0:
        CLR       A
??AD7798_Ready_1:
        POP       S:?b8
        RET
//  150 }
//  151 
//  152 /***************************************************************************//**
//  153  * @brief Sets the operating mode of AD7799.
//  154  *
//  155  * @param mode - Mode of operation.
//  156  *
//  157  * @return  None.    
//  158 *******************************************************************************/

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  159 void AD7798_SetMode(unsigned long mode)
//  160 {
AD7798_SetMode:
        CALL      L:?push_l2
        CALL      L:?push_l3
        CALL      L:?mov_l3_l0
//  161     unsigned long command;
//  162     command = AD7798_GetRegisterValue(AD7798_REG_MODE,2);
        MOV       S:?b0, #0x2
        LD        A, #0x1
        CALL      L:AD7798_GetRegisterValue
        CALL      L:?mov_l2_l0
//  163     command &= ~AD7798_MODE_SEL(0xFF);
        CALL      L:?mov_l0_l2
        LDW       X, #0x1fff
        LDW       S:?w3, X
        CLRW      X
        LDW       S:?w2, X
        CALL      L:?and32_l0_l0_l1
        CALL      L:?mov_l2_l0
//  164     command |= AD7798_MODE_SEL(mode);
        CALL      L:?mov_l0_l3
        LDW       X, #0x7
        LDW       S:?w3, X
        CLRW      X
        LDW       S:?w2, X
        CALL      L:?and32_l0_l0_l1
        CALL      L:?sll32_l0_l0_db
        DATA
        DC8       0xd
        CODE
        CALL      L:?mov_l1_l2
        CALL      L:?or32_l0_l0_l1
        CALL      L:?mov_l2_l0
//  165     AD7798_SetRegisterValue(AD7798_REG_MODE,command,2);
        MOV       S:?b4, #0x2
        CALL      L:?mov_l0_l2
        LD        A, #0x1
        CALL      L:AD7798_SetRegisterValue
//  166 }
        JP        L:?epilogue_l2_l3
//  167 /***************************************************************************//**
//  168  * @brief Selects the channel of AD7799.
//  169  *
//  170  * @param  channel - ADC channel selection.
//  171  *
//  172  * @return  None.    
//  173 *******************************************************************************/

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  174 void AD7798_SetChannel(unsigned long channel)
//  175 {
AD7798_SetChannel:
        CALL      L:?push_l2
        CALL      L:?push_l3
        CALL      L:?mov_l3_l0
//  176     unsigned long command;
//  177     command = AD7798_GetRegisterValue(AD7798_REG_CONF,2);
        MOV       S:?b0, #0x2
        LD        A, #0x2
        CALL      L:AD7798_GetRegisterValue
        CALL      L:?mov_l2_l0
//  178     command &= ~AD7798_CONF_CHAN(0xFF);
        CALL      L:?mov_l0_l2
        LDW       X, #0xfff8
        LDW       S:?w3, X
        CLRW      X
        DECW      X
        LDW       S:?w2, X
        CALL      L:?and32_l0_l0_l1
        CALL      L:?mov_l2_l0
//  179     command |= AD7798_CONF_CHAN(channel);
        CALL      L:?mov_l0_l3
        LDW       X, #0x7
        LDW       S:?w3, X
        CLRW      X
        LDW       S:?w2, X
        CALL      L:?and32_l0_l0_l1
        CALL      L:?mov_l1_l2
        CALL      L:?or32_l0_l0_l1
        CALL      L:?mov_l2_l0
//  180     AD7798_SetRegisterValue(AD7798_REG_CONF,command,2);
        MOV       S:?b4, #0x2
        CALL      L:?mov_l0_l2
        LD        A, #0x2
        CALL      L:AD7798_SetRegisterValue
//  181 }
        JP        L:?epilogue_l2_l3
//  182 
//  183 /***************************************************************************//**
//  184  * @brief  Sets the gain of the In-Amp.
//  185  *
//  186  * @param  gain - Gain.
//  187  *
//  188  * @return  None.    
//  189 *******************************************************************************/

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  190 void AD7798_SetGain(unsigned long gain)
//  191 {
AD7798_SetGain:
        CALL      L:?push_l2
        CALL      L:?push_l3
        CALL      L:?mov_l3_l0
//  192     unsigned long command;
//  193     command = AD7798_GetRegisterValue(AD7798_REG_CONF,2);
        MOV       S:?b0, #0x2
        LD        A, #0x2
        CALL      L:AD7798_GetRegisterValue
        CALL      L:?mov_l2_l0
//  194     command &= ~AD7798_CONF_GAIN(0xFF);
        CALL      L:?mov_l0_l2
        LDW       X, #0xf8ff
        LDW       S:?w3, X
        CLRW      X
        DECW      X
        LDW       S:?w2, X
        CALL      L:?and32_l0_l0_l1
        CALL      L:?mov_l2_l0
//  195     command |= AD7798_CONF_GAIN(gain);
        CALL      L:?mov_l0_l3
        LDW       X, #0x7
        LDW       S:?w3, X
        CLRW      X
        LDW       S:?w2, X
        CALL      L:?and32_l0_l0_l1
        CALL      L:?sll32_l0_l0_db
        DATA
        DC8       0x8
        CODE
        CALL      L:?mov_l1_l2
        CALL      L:?or32_l0_l0_l1
        CALL      L:?mov_l2_l0
//  196     AD7798_SetRegisterValue(AD7798_REG_CONF, command,2);
        MOV       S:?b4, #0x2
        CALL      L:?mov_l0_l2
        LD        A, #0x2
        CALL      L:AD7798_SetRegisterValue
//  197 }
        JP        L:?epilogue_l2_l3
//  198 /***************************************************************************//**
//  199  * @brief Enables or disables the reference detect function.
//  200  *
//  201  * @param state - State of the reference detect function.
//  202  *               Example: 0	- Reference detect disabled.
//  203  *                        1	- Reference detect enabled.
//  204  *
//  205  * @return None.    
//  206 *******************************************************************************/

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  207 void AD7798_SetReference(unsigned char state)
//  208 {
AD7798_SetReference:
        CALL      L:?push_l2
        PUSH      S:?b12
        LD        S:?b12, A
//  209     unsigned long command = 0;
        CLRW      X
        LDW       S:?w5, X
        LDW       S:?w4, X
//  210     command = AD7798_GetRegisterValue(AD7798_REG_CONF,2);
        MOV       S:?b0, #0x2
        LD        A, #0x2
        CALL      L:AD7798_GetRegisterValue
        CALL      L:?mov_l2_l0
//  211     command &= ~AD7798_CONF_REFDET(1);
        CALL      L:?mov_l0_l2
        LDW       X, #0xffdf
        LDW       S:?w3, X
        CLRW      X
        DECW      X
        LDW       S:?w2, X
        CALL      L:?and32_l0_l0_l1
        CALL      L:?mov_l2_l0
//  212     command |= AD7798_CONF_REFDET(state);
        CLRW      X
        EXG       A, XL
        LD        A, S:?b12
        EXG       A, XL
        RLWA      X, A
        AND       A, #0x0
        RLWA      X, A
        AND       A, #0x1
        RLWA      X, A
        CALL      L:?sll16_x_x_5
        CALL      L:?sext32_l0_x
        CALL      L:?mov_l1_l2
        CALL      L:?or32_l0_l0_l1
        CALL      L:?mov_l2_l0
//  213     AD7798_SetRegisterValue(AD7798_REG_CONF,command,2);
        MOV       S:?b4, #0x2
        CALL      L:?mov_l0_l2
        LD        A, #0x2
        CALL      L:AD7798_SetRegisterValue
//  214 }
        POP       S:?b12
        JP        L:?epilogue_l2
//  215 

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  216 void AD7798_SetCodingMode(unsigned char  mode)
//  217 {
AD7798_SetCodingMode:
        CALL      L:?push_l2
        PUSH      S:?b12
        LD        S:?b12, A
//  218     unsigned long command = 0;
        CLRW      X
        LDW       S:?w5, X
        LDW       S:?w4, X
//  219     command = AD7798_GetRegisterValue(AD7798_REG_CONF,2);
        MOV       S:?b0, #0x2
        LD        A, #0x2
        CALL      L:AD7798_GetRegisterValue
        CALL      L:?mov_l2_l0
//  220     if(mode == AD7798_BIPOLAR)
        LD        A, S:?b12
        CP        A, #0x1
        JRNE      L:??AD7798_SetCodingMode_0
//  221       command &= ~AD7798_CONF_UNIPOLAR;
        CALL      L:?mov_l0_l2
        LDW       X, #0xefff
        LDW       S:?w3, X
        CLRW      X
        DECW      X
        LDW       S:?w2, X
        CALL      L:?and32_l0_l0_l1
        CALL      L:?mov_l2_l0
//  222     if(mode == AD7798_UNIPOLAR)
??AD7798_SetCodingMode_0:
        LD        A, S:?b12
        CP        A, #0x2
        JRNE      L:??AD7798_SetCodingMode_1
//  223     command |= AD7798_CONF_UNIPOLAR;
        LDW       X, #0x1000
        LDW       S:?w3, X
        CLRW      X
        LDW       S:?w2, X
        CALL      L:?mov_l0_l2
        CALL      L:?or32_l0_l0_l1
        CALL      L:?mov_l2_l0
//  224     AD7798_SetRegisterValue(AD7798_REG_CONF,command,2);
??AD7798_SetCodingMode_1:
        MOV       S:?b4, #0x2
        CALL      L:?mov_l0_l2
        LD        A, #0x2
        CALL      L:AD7798_SetRegisterValue
//  225 }
        POP       S:?b12
        JP        L:?epilogue_l2

        SECTION VREGS:DATA:REORDER:NOROOT(0)

        SECTION `.near.rodata`:CONST:REORDER:NOROOT(0)
`?<Constant {3, 255, 255, 255, 255}>`:
        DC8 3, 255, 255, 255, 255

        SECTION `.near.rodata`:CONST:REORDER:NOROOT(0)
`?<Constant {0, 0, 0, 0, 0}>`:
        DC8 0, 0, 0, 0, 0

        SECTION `.near.rodata`:CONST:REORDER:NOROOT(0)
`?<Constant {3, 0, 0, 0, 0}>`:
        DC8 3, 0, 0, 0, 0

        END
// 
//   1 byte  in section .near.data
//  15 bytes in section .near.rodata
// 935 bytes in section .near_func.text
// 
// 935 bytes of CODE  memory
//  15 bytes of CONST memory
//   1 byte  of DATA  memory
//
//Errors: none
//Warnings: none
