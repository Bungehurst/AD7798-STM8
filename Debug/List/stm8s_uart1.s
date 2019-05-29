///////////////////////////////////////////////////////////////////////////////
//                                                                            /
//                                                      28/May/2019  16:13:16 /
// IAR C/C++ Compiler V1.31.1.20058 [Evaluation] for STM8                     /
// Copyright 2010-2012 IAR Systems AB.                                        /
//                                                                            /
//    Source file  =  E:\Desktop\J19B_STM8\Lib\src\stm8s_uart1.c              /
//    Command line =  E:\Desktop\J19B_STM8\Lib\src\stm8s_uart1.c -e -Ol       /
//                    --no_cse --no_unroll --no_inline --no_code_motion       /
//                    --no_tbaa --no_cross_call --debug --code_model small    /
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
//    List file    =  E:\Desktop\J19B_STM8\Debug\List\stm8s_uart1.s           /
//                                                                            /
//                                                                            /
///////////////////////////////////////////////////////////////////////////////

        NAME stm8s_uart1

        EXTERN ?b0
        EXTERN ?b1
        EXTERN ?b10
        EXTERN ?b2
        EXTERN ?b3
        EXTERN ?b4
        EXTERN ?b5
        EXTERN ?b6
        EXTERN ?b7
        EXTERN ?b8
        EXTERN ?b9
        EXTERN ?epilogue_l2_l3
        EXTERN ?epilogue_w4
        EXTERN ?load32_dbsp_l0
        EXTERN ?load32_l0_dbsp
        EXTERN ?mov_l0_l2
        EXTERN ?mov_l0_l3
        EXTERN ?mov_l1_l0
        EXTERN ?mov_l1_l2
        EXTERN ?mov_l1_l3
        EXTERN ?mov_l2_l0
        EXTERN ?mov_l3_l0
        EXTERN ?mul32_l0_l0_dl
        EXTERN ?push_l2
        EXTERN ?push_l3
        EXTERN ?push_w4
        EXTERN ?sll16_x_x_a
        EXTERN ?sll32_l0_l0_db
        EXTERN ?srl16_x_x_4
        EXTERN ?sub32_l0_l0_l1
        EXTERN ?udiv32_l0_l0_dl
        EXTERN ?udiv32_l0_l0_l1
        EXTERN ?w0
        EXTERN ?w1
        EXTERN ?w4
        EXTERN ?w5
        EXTERN ?w6
        EXTERN ?w7
        EXTERN CLK_GetClockFreq
        EXTERN assert_failed

        PUBLIC UART1_ClearFlag
        PUBLIC UART1_ClearITPendingBit
        PUBLIC UART1_Cmd
        PUBLIC UART1_DeInit
        PUBLIC UART1_GetFlagStatus
        PUBLIC UART1_GetITStatus
        PUBLIC UART1_HalfDuplexCmd
        PUBLIC UART1_ITConfig
        PUBLIC UART1_Init
        PUBLIC UART1_IrDACmd
        PUBLIC UART1_IrDAConfig
        PUBLIC UART1_LINBreakDetectionConfig
        PUBLIC UART1_LINCmd
        PUBLIC UART1_ReceiveData8
        PUBLIC UART1_ReceiveData9
        PUBLIC UART1_ReceiverWakeUpCmd
        PUBLIC UART1_SendBreak
        PUBLIC UART1_SendData8
        PUBLIC UART1_SendData9
        PUBLIC UART1_SetAddress
        PUBLIC UART1_SetGuardTime
        PUBLIC UART1_SetPrescaler
        PUBLIC UART1_SmartCardCmd
        PUBLIC UART1_SmartCardNACKCmd
        PUBLIC UART1_WakeUpConfig

// E:\Desktop\J19B_STM8\Lib\src\stm8s_uart1.c
//    1 /**
//    2   ********************************************************************************
//    3   * @file    stm8s_uart1.c
//    4   * @author  MCD Application Team
//    5   * @version V2.2.0
//    6   * @date    30-September-2014
//    7   * @brief   This file contains all the functions for the UART1 peripheral.
//    8    ******************************************************************************
//    9   * @attention
//   10   *
//   11   * <h2><center>&copy; COPYRIGHT 2014 STMicroelectronics</center></h2>
//   12   *
//   13   * Licensed under MCD-ST Liberty SW License Agreement V2, (the "License");
//   14   * You may not use this file except in compliance with the License.
//   15   * You may obtain a copy of the License at:
//   16   *
//   17   *        http://www.st.com/software_license_agreement_liberty_v2
//   18   *
//   19   * Unless required by applicable law or agreed to in writing, software 
//   20   * distributed under the License is distributed on an "AS IS" BASIS, 
//   21   * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
//   22   * See the License for the specific language governing permissions and
//   23   * limitations under the License.
//   24   *
//   25   ******************************************************************************
//   26   */
//   27 
//   28 /* Includes ------------------------------------------------------------------*/
//   29 #include "stm8s_uart1.h"
//   30 
//   31 /** @addtogroup STM8S_StdPeriph_Driver
//   32   * @{
//   33   */
//   34 
//   35 /* Private typedef -----------------------------------------------------------*/
//   36 /* Private define ------------------------------------------------------------*/
//   37 /* Private macro -------------------------------------------------------------*/
//   38 /* Private variables ---------------------------------------------------------*/
//   39 /* Private function prototypes -----------------------------------------------*/
//   40 /* Private functions ---------------------------------------------------------*/
//   41 /* Public functions ----------------------------------------------------------*/
//   42 
//   43 /** @}
//   44   * @addtogroup UART1_Public_Functions
//   45   * @{
//   46   */
//   47 
//   48 /**
//   49   * @brief  Deinitializes the UART peripheral.
//   50   * @param  None
//   51   * @retval None
//   52 	*/

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//   53 void UART1_DeInit(void)
//   54 {
//   55   /* Clear the Idle Line Detected bit in the status register by a read
//   56   to the UART1_SR register followed by a Read to the UART1_DR register */
//   57   (void)UART1->SR;
UART1_DeInit:
        LD        A, L:0x5230
        LD        S:?b0, A
//   58   (void)UART1->DR;
        LD        A, L:0x5231
//   59   
//   60   UART1->BRR2 = UART1_BRR2_RESET_VALUE;  /* Set UART1_BRR2 to reset value 0x00 */
        MOV       L:0x5233, #0x0
//   61   UART1->BRR1 = UART1_BRR1_RESET_VALUE;  /* Set UART1_BRR1 to reset value 0x00 */
        MOV       L:0x5232, #0x0
//   62   
//   63   UART1->CR1 = UART1_CR1_RESET_VALUE;  /* Set UART1_CR1 to reset value 0x00 */
        MOV       L:0x5234, #0x0
//   64   UART1->CR2 = UART1_CR2_RESET_VALUE;  /* Set UART1_CR2 to reset value 0x00 */
        MOV       L:0x5235, #0x0
//   65   UART1->CR3 = UART1_CR3_RESET_VALUE;  /* Set UART1_CR3 to reset value 0x00 */
        MOV       L:0x5236, #0x0
//   66   UART1->CR4 = UART1_CR4_RESET_VALUE;  /* Set UART1_CR4 to reset value 0x00 */
        MOV       L:0x5237, #0x0
//   67   UART1->CR5 = UART1_CR5_RESET_VALUE;  /* Set UART1_CR5 to reset value 0x00 */
        MOV       L:0x5238, #0x0
//   68   
//   69   UART1->GTR = UART1_GTR_RESET_VALUE;
        MOV       L:0x5239, #0x0
//   70   UART1->PSCR = UART1_PSCR_RESET_VALUE;
        MOV       L:0x523a, #0x0
//   71 }
        RET
//   72 
//   73 /**
//   74   * @brief  Initializes the UART1 according to the specified parameters.
//   75   * @note   Configure in Push Pull or Open Drain mode the Tx pin by setting the
//   76   *         correct I/O Port register according the product package and line
//   77   *         configuration
//   78   * @param  BaudRate: The baudrate.
//   79   * @param  WordLength : This parameter can be any of the 
//   80   *         @ref UART1_WordLength_TypeDef enumeration.
//   81   * @param  StopBits: This parameter can be any of the 
//   82   *         @ref UART1_StopBits_TypeDef enumeration.
//   83   * @param  Parity: This parameter can be any of the 
//   84   *         @ref UART1_Parity_TypeDef enumeration.
//   85   * @param  SyncMode: This parameter can be any of the 
//   86   *         @ref UART1_SyncMode_TypeDef values.
//   87   * @param  Mode: This parameter can be any of the @ref UART1_Mode_TypeDef values
//   88   * @retval None
//   89   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//   90 void UART1_Init(uint32_t BaudRate, UART1_WordLength_TypeDef WordLength, 
//   91                 UART1_StopBits_TypeDef StopBits, UART1_Parity_TypeDef Parity, 
//   92                 UART1_SyncMode_TypeDef SyncMode, UART1_Mode_TypeDef Mode)
//   93 {
UART1_Init:
        CALL      L:?push_l2
        CALL      L:?push_l3
        PUSH      A
        PUSH      S:?b4
        PUSH      S:?b5
        PUSH      S:?b6
        PUSH      S:?b7
        SUB       SP, #0x4
        CALL      L:?mov_l2_l0
//   94   uint32_t BaudRate_Mantissa = 0, BaudRate_Mantissa100 = 0;
        LDW       X, #0x0
        LDW       (0x1,SP), X
        LDW       X, #0x0
        LDW       (0x3,SP), X
        CLRW      X
        LDW       S:?w7, X
        LDW       S:?w6, X
//   95   
//   96   /* Check the parameters */
//   97   assert_param(IS_UART1_BAUDRATE_OK(BaudRate));
        LDW       X, S:?w4
        CPW       X, #0x9
        JRNE      L:??UART1_Init_0
        LDW       X, S:?w5
        CPW       X, #0x8969
??UART1_Init_0:
        JRC       L:??UART1_Init_1
        LDW       X, #0x61
        LDW       S:?w1, X
        CLRW      X
        LDW       S:?w0, X
        LDW       X, #`?<Constant "E:\\\\Desktop\\\\J19B_STM8\\\\...">`
        CALL      L:assert_failed
//   98   assert_param(IS_UART1_WORDLENGTH_OK(WordLength));
??UART1_Init_1:
        TNZ       (0x9,SP)
        JREQ      L:??UART1_Init_2
        LD        A, (0x9,SP)
        CP        A, #0x10
        JREQ      L:??UART1_Init_2
        LDW       X, #0x62
        LDW       S:?w1, X
        CLRW      X
        LDW       S:?w0, X
        LDW       X, #`?<Constant "E:\\\\Desktop\\\\J19B_STM8\\\\...">`
        CALL      L:assert_failed
//   99   assert_param(IS_UART1_STOPBITS_OK(StopBits));
??UART1_Init_2:
        TNZ       (0x8,SP)
        JREQ      L:??UART1_Init_3
        LD        A, (0x8,SP)
        CP        A, #0x10
        JREQ      L:??UART1_Init_3
        LD        A, (0x8,SP)
        CP        A, #0x20
        JREQ      L:??UART1_Init_3
        LD        A, (0x8,SP)
        CP        A, #0x30
        JREQ      L:??UART1_Init_3
        LDW       X, #0x63
        LDW       S:?w1, X
        CLRW      X
        LDW       S:?w0, X
        LDW       X, #`?<Constant "E:\\\\Desktop\\\\J19B_STM8\\\\...">`
        CALL      L:assert_failed
//  100   assert_param(IS_UART1_PARITY_OK(Parity));
??UART1_Init_3:
        TNZ       (0x7,SP)
        JREQ      L:??UART1_Init_4
        LD        A, (0x7,SP)
        CP        A, #0x4
        JREQ      L:??UART1_Init_4
        LD        A, (0x7,SP)
        CP        A, #0x6
        JREQ      L:??UART1_Init_4
        LDW       X, #0x64
        LDW       S:?w1, X
        CLRW      X
        LDW       S:?w0, X
        LDW       X, #`?<Constant "E:\\\\Desktop\\\\J19B_STM8\\\\...">`
        CALL      L:assert_failed
//  101   assert_param(IS_UART1_MODE_OK((uint8_t)Mode));
??UART1_Init_4:
        LD        A, (0x5,SP)
        CP        A, #0x8
        JREQ      L:??UART1_Init_5
        LD        A, (0x5,SP)
        CP        A, #0x40
        JREQ      L:??UART1_Init_5
        LD        A, (0x5,SP)
        CP        A, #0x4
        JREQ      L:??UART1_Init_5
        LD        A, (0x5,SP)
        CP        A, #0x80
        JREQ      L:??UART1_Init_5
        LD        A, (0x5,SP)
        CP        A, #0xc
        JREQ      L:??UART1_Init_5
        LD        A, (0x5,SP)
        CP        A, #0xc
        JREQ      L:??UART1_Init_5
        LD        A, (0x5,SP)
        CP        A, #0x44
        JREQ      L:??UART1_Init_5
        LD        A, (0x5,SP)
        CP        A, #0xc0
        JREQ      L:??UART1_Init_5
        LD        A, (0x5,SP)
        CP        A, #0x88
        JREQ      L:??UART1_Init_5
        LDW       X, #0x65
        LDW       S:?w1, X
        CLRW      X
        LDW       S:?w0, X
        LDW       X, #`?<Constant "E:\\\\Desktop\\\\J19B_STM8\\\\...">`
        CALL      L:assert_failed
//  102   assert_param(IS_UART1_SYNCMODE_OK((uint8_t)SyncMode));
??UART1_Init_5:
        LD        A, (0x6,SP)
        AND       A, #0x88
        CP        A, #0x88
        JREQ      L:??UART1_Init_6
        LD        A, (0x6,SP)
        AND       A, #0x44
        CP        A, #0x44
        JREQ      L:??UART1_Init_6
        LD        A, (0x6,SP)
        AND       A, #0x22
        CP        A, #0x22
        JREQ      L:??UART1_Init_6
        LD        A, (0x6,SP)
        AND       A, #0x11
        CP        A, #0x11
        JRNE      L:??UART1_Init_7
??UART1_Init_6:
        LDW       X, #0x66
        LDW       S:?w1, X
        CLRW      X
        LDW       S:?w0, X
        LDW       X, #`?<Constant "E:\\\\Desktop\\\\J19B_STM8\\\\...">`
        CALL      L:assert_failed
//  103   
//  104   /* Clear the word length bit */
//  105   UART1->CR1 &= (uint8_t)(~UART1_CR1_M);  
??UART1_Init_7:
        BRES      L:0x5234, #0x4
//  106   
//  107   /* Set the word length bit according to UART1_WordLength value */
//  108   UART1->CR1 |= (uint8_t)WordLength;
        LD        A, (0x9,SP)
        OR        A, L:0x5234
        LD        L:0x5234, A
//  109   
//  110   /* Clear the STOP bits */
//  111   UART1->CR3 &= (uint8_t)(~UART1_CR3_STOP);  
        LD        A, L:0x5236
        AND       A, #0xcf
        LD        L:0x5236, A
//  112   /* Set the STOP bits number according to UART1_StopBits value  */
//  113   UART1->CR3 |= (uint8_t)StopBits;  
        LD        A, (0x8,SP)
        OR        A, L:0x5236
        LD        L:0x5236, A
//  114   
//  115   /* Clear the Parity Control bit */
//  116   UART1->CR1 &= (uint8_t)(~(UART1_CR1_PCEN | UART1_CR1_PS  ));  
        LD        A, L:0x5234
        AND       A, #0xf9
        LD        L:0x5234, A
//  117   /* Set the Parity Control bit to UART1_Parity value */
//  118   UART1->CR1 |= (uint8_t)Parity;  
        LD        A, (0x7,SP)
        OR        A, L:0x5234
        LD        L:0x5234, A
//  119   
//  120   /* Clear the LSB mantissa of UART1DIV  */
//  121   UART1->BRR1 &= (uint8_t)(~UART1_BRR1_DIVM);  
        LD        A, L:0x5232
        LD        (0x1,SP), A
        MOV       L:0x5232, #0x0
//  122   /* Clear the MSB mantissa of UART1DIV  */
//  123   UART1->BRR2 &= (uint8_t)(~UART1_BRR2_DIVM);  
        LD        A, L:0x5233
        AND       A, #0xf
        LD        L:0x5233, A
//  124   /* Clear the Fraction bits of UART1DIV */
//  125   UART1->BRR2 &= (uint8_t)(~UART1_BRR2_DIVF);  
        LD        A, L:0x5233
        AND       A, #0xf0
        LD        L:0x5233, A
//  126   
//  127   /* Set the UART1 BaudRates in BRR1 and BRR2 registers according to UART1_BaudRate value */
//  128   BaudRate_Mantissa    = ((uint32_t)CLK_GetClockFreq() / (BaudRate << 4));
        CALL      L:?mov_l0_l2
        CALL      L:?sll32_l0_l0_db
        DATA
        DC8       0x4
        CODE
        CALL      L:?mov_l3_l0
        CALL      L:CLK_GetClockFreq
        CALL      L:?mov_l1_l3
        CALL      L:?udiv32_l0_l0_l1
        CALL      L:?load32_dbsp_l0
        DATA
        DC8       0x1
        CODE
//  129   BaudRate_Mantissa100 = (((uint32_t)CLK_GetClockFreq() * 100) / (BaudRate << 4));
        CALL      L:?mov_l0_l2
        CALL      L:?sll32_l0_l0_db
        DATA
        DC8       0x4
        CODE
        CALL      L:?mov_l2_l0
        CALL      L:CLK_GetClockFreq
        CALL      L:?mul32_l0_l0_dl
        DATA
        DC32      0x64
        CODE
        CALL      L:?mov_l1_l2
        CALL      L:?udiv32_l0_l0_l1
        CALL      L:?mov_l3_l0
//  130   /* Set the fraction of UART1DIV  */
//  131   UART1->BRR2 |= (uint8_t)((uint8_t)(((BaudRate_Mantissa100 - (BaudRate_Mantissa * 100)) << 4) / 100) & (uint8_t)0x0F); 
        CALL      L:?load32_l0_dbsp
        DATA
        DC8       0x1
        CODE
        CALL      L:?mul32_l0_l0_dl
        DATA
        DC32      0x64
        CODE
        CALL      L:?mov_l1_l0
        CALL      L:?mov_l0_l3
        CALL      L:?sub32_l0_l0_l1
        CALL      L:?sll32_l0_l0_db
        DATA
        DC8       0x4
        CODE
        CALL      L:?udiv32_l0_l0_dl
        DATA
        DC32      0x64
        CODE
        LD        A, S:?b3
        AND       A, #0xf
        OR        A, L:0x5233
        LD        L:0x5233, A
//  132   /* Set the MSB mantissa of UART1DIV  */
//  133   UART1->BRR2 |= (uint8_t)((BaudRate_Mantissa >> 4) & (uint8_t)0xF0); 
        LDW       X, (0x3,SP)
        CALL      L:?srl16_x_x_4
        LD        A, XL
        AND       A, #0xf0
        OR        A, L:0x5233
        LD        L:0x5233, A
//  134   /* Set the LSB mantissa of UART1DIV  */
//  135   UART1->BRR1 |= (uint8_t)BaudRate_Mantissa;           
        LDW       X, (0x3,SP)
        LD        A, XL
        OR        A, L:0x5232
        LD        L:0x5232, A
//  136   
//  137   /* Disable the Transmitter and Receiver before setting the LBCL, CPOL and CPHA bits */
//  138   UART1->CR2 &= (uint8_t)~(UART1_CR2_TEN | UART1_CR2_REN); 
        LD        A, L:0x5235
        AND       A, #0xf3
        LD        L:0x5235, A
//  139   /* Clear the Clock Polarity, lock Phase, Last Bit Clock pulse */
//  140   UART1->CR3 &= (uint8_t)~(UART1_CR3_CPOL | UART1_CR3_CPHA | UART1_CR3_LBCL); 
        LD        A, L:0x5236
        AND       A, #0xf8
        LD        L:0x5236, A
//  141   /* Set the Clock Polarity, lock Phase, Last Bit Clock pulse */
//  142   UART1->CR3 |= (uint8_t)((uint8_t)SyncMode & (uint8_t)(UART1_CR3_CPOL | 
//  143                                                         UART1_CR3_CPHA | UART1_CR3_LBCL));  
        LD        A, (0x6,SP)
        AND       A, #0x7
        OR        A, L:0x5236
        LD        L:0x5236, A
//  144   
//  145   if ((uint8_t)(Mode & UART1_MODE_TX_ENABLE))
        LD        A, (0x5,SP)
        AND       A, #0x4
        CP        A, #0x0
        JREQ      L:??UART1_Init_8
//  146   {
//  147     /* Set the Transmitter Enable bit */
//  148     UART1->CR2 |= (uint8_t)UART1_CR2_TEN;  
        BSET      L:0x5235, #0x3
        JRA       L:??UART1_Init_9
//  149   }
//  150   else
//  151   {
//  152     /* Clear the Transmitter Disable bit */
//  153     UART1->CR2 &= (uint8_t)(~UART1_CR2_TEN);  
??UART1_Init_8:
        BRES      L:0x5235, #0x3
//  154   }
//  155   if ((uint8_t)(Mode & UART1_MODE_RX_ENABLE))
??UART1_Init_9:
        LD        A, (0x5,SP)
        AND       A, #0x8
        CP        A, #0x0
        JREQ      L:??UART1_Init_10
//  156   {
//  157     /* Set the Receiver Enable bit */
//  158     UART1->CR2 |= (uint8_t)UART1_CR2_REN;  
        BSET      L:0x5235, #0x2
        JRA       L:??UART1_Init_11
//  159   }
//  160   else
//  161   {
//  162     /* Clear the Receiver Disable bit */
//  163     UART1->CR2 &= (uint8_t)(~UART1_CR2_REN);  
??UART1_Init_10:
        BRES      L:0x5235, #0x2
//  164   }
//  165   /* Set the Clock Enable bit, lock Polarity, lock Phase and Last Bit Clock 
//  166   pulse bits according to UART1_Mode value */
//  167   if ((uint8_t)(SyncMode & UART1_SYNCMODE_CLOCK_DISABLE))
??UART1_Init_11:
        LD        A, (0x6,SP)
        AND       A, #0x80
        CP        A, #0x0
        JREQ      L:??UART1_Init_12
//  168   {
//  169     /* Clear the Clock Enable bit */
//  170     UART1->CR3 &= (uint8_t)(~UART1_CR3_CKEN); 
        BRES      L:0x5236, #0x3
        JRA       L:??UART1_Init_13
//  171   }
//  172   else
//  173   {
//  174     UART1->CR3 |= (uint8_t)((uint8_t)SyncMode & UART1_CR3_CKEN);
??UART1_Init_12:
        LD        A, (0x6,SP)
        AND       A, #0x8
        OR        A, L:0x5236
        LD        L:0x5236, A
//  175   }
//  176 }
??UART1_Init_13:
        ADD       SP, #0x9
        JP        L:?epilogue_l2_l3
//  177 
//  178 /**
//  179   * @brief  Enable the UART1 peripheral.
//  180   * @param  NewState : The new state of the UART Communication.
//  181   *         This parameter can be any of the @ref FunctionalState enumeration.
//  182   * @retval None
//  183   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  184 void UART1_Cmd(FunctionalState NewState)
//  185 {
//  186   if (NewState != DISABLE)
UART1_Cmd:
        TNZ       A
        JREQ      L:??UART1_Cmd_0
//  187   {
//  188     /* UART1 Enable */
//  189     UART1->CR1 &= (uint8_t)(~UART1_CR1_UARTD); 
        BRES      L:0x5234, #0x5
        RET
//  190   }
//  191   else
//  192   {
//  193     /* UART Disable */
//  194     UART1->CR1 |= UART1_CR1_UARTD;  
??UART1_Cmd_0:
        BSET      L:0x5234, #0x5
//  195   }
//  196 }
        RET
//  197 
//  198 /**
//  199   * @brief  Enables or disables the specified USART interrupts.
//  200   * @param  UART1_IT specifies the USART interrupt sources to be enabled or disabled.
//  201   *         This parameter can be one of the following values:
//  202   *         - UART1_IT_TXE:  Transmit Data Register empty interrupt
//  203   *         - UART1_IT_TC:   Transmission complete interrupt
//  204   *         - UART1_IT_RXNE_OR: Receive Data register not empty and Overrun interrupt
//  205   *         - UART1_IT_IDLE: Idle line detection interrupt
//  206   *         - USRT1_IT_ERR:  Error interrupt
//  207   * @param  NewState new state of the specified USART interrupts.
//  208   *         This parameter can be: ENABLE or DISABLE.
//  209   * @retval None
//  210   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  211 void UART1_ITConfig(UART1_IT_TypeDef UART1_IT, FunctionalState NewState)
//  212 {
UART1_ITConfig:
        CALL      L:?push_w4
        PUSH      S:?b10
        LDW       S:?w4, X
        LD        S:?b10, A
//  213   uint8_t uartreg = 0, itpos = 0x00;
        CLR       S:?b1
        CLR       S:?b0
//  214   
//  215   /* Check the parameters */
//  216   assert_param(IS_UART1_CONFIG_IT_OK(UART1_IT));
        LDW       X, S:?w4
        CPW       X, #0x100
        JREQ      L:??UART1_ITConfig_0
        LDW       X, S:?w4
        CPW       X, #0x277
        JREQ      L:??UART1_ITConfig_0
        LDW       X, S:?w4
        CPW       X, #0x266
        JREQ      L:??UART1_ITConfig_0
        LDW       X, S:?w4
        CPW       X, #0x205
        JREQ      L:??UART1_ITConfig_0
        LDW       X, S:?w4
        CPW       X, #0x244
        JREQ      L:??UART1_ITConfig_0
        LDW       X, S:?w4
        CPW       X, #0x346
        JREQ      L:??UART1_ITConfig_0
        LDW       X, #0xd8
        LDW       S:?w1, X
        CLRW      X
        LDW       S:?w0, X
        LDW       X, #`?<Constant "E:\\\\Desktop\\\\J19B_STM8\\\\...">`
        CALL      L:assert_failed
//  217   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
??UART1_ITConfig_0:
        TNZ       S:?b10
        JREQ      L:??UART1_ITConfig_1
        LD        A, S:?b10
        CP        A, #0x1
        JREQ      L:??UART1_ITConfig_1
        LDW       X, #0xd9
        LDW       S:?w1, X
        CLRW      X
        LDW       S:?w0, X
        LDW       X, #`?<Constant "E:\\\\Desktop\\\\J19B_STM8\\\\...">`
        CALL      L:assert_failed
//  218   
//  219   /* Get the UART1 register index */
//  220   uartreg = (uint8_t)((uint16_t)UART1_IT >> 0x08);
??UART1_ITConfig_1:
        LDW       X, S:?w4
        CLR       A
        RRWA      X, A
        EXG       A, XL
        LD        S:?b1, A
        EXG       A, XL
//  221   /* Get the UART1 IT index */
//  222   itpos = (uint8_t)((uint8_t)1 << (uint8_t)((uint8_t)UART1_IT & (uint8_t)0x0F));
        LD        A, S:?b9
        AND       A, #0xf
        CLRW      X
        INCW      X
        CALL      L:?sll16_x_x_a
        EXG       A, XL
        LD        S:?b0, A
        EXG       A, XL
//  223   
//  224   if (NewState != DISABLE)
        TNZ       S:?b10
        JREQ      L:??UART1_ITConfig_2
//  225   {
//  226     /**< Enable the Interrupt bits according to UART1_IT mask */
//  227     if (uartreg == 0x01)
        LD        A, S:?b1
        CP        A, #0x1
        JRNE      L:??UART1_ITConfig_3
//  228     {
//  229       UART1->CR1 |= itpos;
        LD        A, S:?b0
        OR        A, L:0x5234
        LD        L:0x5234, A
        JRA       L:??UART1_ITConfig_4
//  230     }
//  231     else if (uartreg == 0x02)
??UART1_ITConfig_3:
        LD        A, S:?b1
        CP        A, #0x2
        JRNE      L:??UART1_ITConfig_5
//  232     {
//  233       UART1->CR2 |= itpos;
        LD        A, S:?b0
        OR        A, L:0x5235
        LD        L:0x5235, A
        JRA       L:??UART1_ITConfig_4
//  234     }
//  235     else
//  236     {
//  237       UART1->CR4 |= itpos;
??UART1_ITConfig_5:
        LD        A, S:?b0
        OR        A, L:0x5237
        LD        L:0x5237, A
        JRA       L:??UART1_ITConfig_4
//  238     }
//  239   }
//  240   else
//  241   {
//  242     /**< Disable the interrupt bits according to UART1_IT mask */
//  243     if (uartreg == 0x01)
??UART1_ITConfig_2:
        LD        A, S:?b1
        CP        A, #0x1
        JRNE      L:??UART1_ITConfig_6
//  244     {
//  245       UART1->CR1 &= (uint8_t)(~itpos);
        CPL       S:?b0
        LD        A, S:?b0
        AND       A, L:0x5234
        LD        L:0x5234, A
        JRA       L:??UART1_ITConfig_4
//  246     }
//  247     else if (uartreg == 0x02)
??UART1_ITConfig_6:
        LD        A, S:?b1
        CP        A, #0x2
        JRNE      L:??UART1_ITConfig_7
//  248     {
//  249       UART1->CR2 &= (uint8_t)(~itpos);
        CPL       S:?b0
        LD        A, S:?b0
        AND       A, L:0x5235
        LD        L:0x5235, A
        JRA       L:??UART1_ITConfig_4
//  250     }
//  251     else
//  252     {
//  253       UART1->CR4 &= (uint8_t)(~itpos);
??UART1_ITConfig_7:
        CPL       S:?b0
        LD        A, S:?b0
        AND       A, L:0x5237
        LD        L:0x5237, A
//  254     }
//  255   }
//  256   
//  257 }
??UART1_ITConfig_4:
        POP       S:?b10
        JP        L:?epilogue_w4
//  258 
//  259 /**
//  260   * @brief  Enables or disables the UART’s Half Duplex communication.
//  261   * @param  NewState new state of the UART Communication.
//  262   *         This parameter can be: ENABLE or DISABLE.
//  263   * @retval None
//  264   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  265 void UART1_HalfDuplexCmd(FunctionalState NewState)
//  266 {
UART1_HalfDuplexCmd:
        PUSH      S:?b8
        LD        S:?b8, A
//  267   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
        TNZ       S:?b8
        JREQ      L:??UART1_HalfDuplexCmd_0
        LD        A, S:?b8
        CP        A, #0x1
        JREQ      L:??UART1_HalfDuplexCmd_0
        LDW       X, #0x10b
        LDW       S:?w1, X
        CLRW      X
        LDW       S:?w0, X
        LDW       X, #`?<Constant "E:\\\\Desktop\\\\J19B_STM8\\\\...">`
        CALL      L:assert_failed
//  268   
//  269   if (NewState != DISABLE)
??UART1_HalfDuplexCmd_0:
        TNZ       S:?b8
        JREQ      L:??UART1_HalfDuplexCmd_1
//  270   {
//  271     UART1->CR5 |= UART1_CR5_HDSEL;  /**< UART1 Half Duplex Enable  */
        BSET      L:0x5238, #0x3
        JRA       L:??UART1_HalfDuplexCmd_2
//  272   }
//  273   else
//  274   {
//  275     UART1->CR5 &= (uint8_t)~UART1_CR5_HDSEL; /**< UART1 Half Duplex Disable */
??UART1_HalfDuplexCmd_1:
        BRES      L:0x5238, #0x3
//  276   }
//  277 }
??UART1_HalfDuplexCmd_2:
        POP       S:?b8
        RET
//  278 
//  279 /**
//  280   * @brief  Configures the UART’s IrDA interface.
//  281   * @param  UART1_IrDAMode specifies the IrDA mode.
//  282   *         This parameter can be any of the @ref UART1_IrDAMode_TypeDef values.
//  283   * @retval None
//  284   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  285 void UART1_IrDAConfig(UART1_IrDAMode_TypeDef UART1_IrDAMode)
//  286 {
UART1_IrDAConfig:
        PUSH      S:?b8
        LD        S:?b8, A
//  287   assert_param(IS_UART1_IRDAMODE_OK(UART1_IrDAMode));
        LD        A, S:?b8
        CP        A, #0x1
        JREQ      L:??UART1_IrDAConfig_0
        TNZ       S:?b8
        JREQ      L:??UART1_IrDAConfig_0
        LDW       X, #0x11f
        LDW       S:?w1, X
        CLRW      X
        LDW       S:?w0, X
        LDW       X, #`?<Constant "E:\\\\Desktop\\\\J19B_STM8\\\\...">`
        CALL      L:assert_failed
//  288   
//  289   if (UART1_IrDAMode != UART1_IRDAMODE_NORMAL)
??UART1_IrDAConfig_0:
        TNZ       S:?b8
        JREQ      L:??UART1_IrDAConfig_1
//  290   {
//  291     UART1->CR5 |= UART1_CR5_IRLP;
        BSET      L:0x5238, #0x2
        JRA       L:??UART1_IrDAConfig_2
//  292   }
//  293   else
//  294   {
//  295     UART1->CR5 &= ((uint8_t)~UART1_CR5_IRLP);
??UART1_IrDAConfig_1:
        BRES      L:0x5238, #0x2
//  296   }
//  297 }
??UART1_IrDAConfig_2:
        POP       S:?b8
        RET
//  298 
//  299 /**
//  300   * @brief  Enables or disables the UART’s IrDA interface.
//  301   * @param  NewState new state of the IrDA mode.
//  302   *         This parameter can be: ENABLE or DISABLE.
//  303   * @retval None
//  304   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  305 void UART1_IrDACmd(FunctionalState NewState)
//  306 {
UART1_IrDACmd:
        PUSH      S:?b8
        LD        S:?b8, A
//  307   /* Check parameters */
//  308   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
        TNZ       S:?b8
        JREQ      L:??UART1_IrDACmd_0
        LD        A, S:?b8
        CP        A, #0x1
        JREQ      L:??UART1_IrDACmd_0
        LDW       X, #0x134
        LDW       S:?w1, X
        CLRW      X
        LDW       S:?w0, X
        LDW       X, #`?<Constant "E:\\\\Desktop\\\\J19B_STM8\\\\...">`
        CALL      L:assert_failed
//  309   
//  310   if (NewState != DISABLE)
??UART1_IrDACmd_0:
        TNZ       S:?b8
        JREQ      L:??UART1_IrDACmd_1
//  311   {
//  312     /* Enable the IrDA mode by setting the IREN bit in the CR3 register */
//  313     UART1->CR5 |= UART1_CR5_IREN;
        BSET      L:0x5238, #0x1
        JRA       L:??UART1_IrDACmd_2
//  314   }
//  315   else
//  316   {
//  317     /* Disable the IrDA mode by clearing the IREN bit in the CR3 register */
//  318     UART1->CR5 &= ((uint8_t)~UART1_CR5_IREN);
??UART1_IrDACmd_1:
        BRES      L:0x5238, #0x1
//  319   }
//  320 }
??UART1_IrDACmd_2:
        POP       S:?b8
        RET
//  321 
//  322 /**
//  323   * @brief  Sets the UART1 LIN Break detection length.
//  324   * @param  UART1_LINBreakDetectionLength specifies the LIN break detection length.
//  325   *         This parameter can be any of the
//  326   *         @ref UART1_LINBreakDetectionLength_TypeDef values.
//  327   * @retval None
//  328   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  329 void UART1_LINBreakDetectionConfig(UART1_LINBreakDetectionLength_TypeDef UART1_LINBreakDetectionLength)
//  330 {
UART1_LINBreakDetectionConfig:
        PUSH      S:?b8
        LD        S:?b8, A
//  331   assert_param(IS_UART1_LINBREAKDETECTIONLENGTH_OK(UART1_LINBreakDetectionLength));
        TNZ       S:?b8
        JREQ      L:??UART1_LINBreakDetectionConfig_0
        LD        A, S:?b8
        CP        A, #0x1
        JREQ      L:??UART1_LINBreakDetectionConfig_0
        LDW       X, #0x14b
        LDW       S:?w1, X
        CLRW      X
        LDW       S:?w0, X
        LDW       X, #`?<Constant "E:\\\\Desktop\\\\J19B_STM8\\\\...">`
        CALL      L:assert_failed
//  332   
//  333   if (UART1_LINBreakDetectionLength != UART1_LINBREAKDETECTIONLENGTH_10BITS)
??UART1_LINBreakDetectionConfig_0:
        TNZ       S:?b8
        JREQ      L:??UART1_LINBreakDetectionConfig_1
//  334   {
//  335     UART1->CR4 |= UART1_CR4_LBDL;
        BSET      L:0x5237, #0x5
        JRA       L:??UART1_LINBreakDetectionConfig_2
//  336   }
//  337   else
//  338   {
//  339     UART1->CR4 &= ((uint8_t)~UART1_CR4_LBDL);
??UART1_LINBreakDetectionConfig_1:
        BRES      L:0x5237, #0x5
//  340   }
//  341 }
??UART1_LINBreakDetectionConfig_2:
        POP       S:?b8
        RET
//  342 
//  343 /**
//  344   * @brief  Enables or disables the UART1’s LIN mode.
//  345   * @param  NewState is new state of the UART1 LIN mode.
//  346   *         This parameter can be: ENABLE or DISABLE.
//  347   * @retval None
//  348   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  349 void UART1_LINCmd(FunctionalState NewState)
//  350 {
UART1_LINCmd:
        PUSH      S:?b8
        LD        S:?b8, A
//  351   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
        TNZ       S:?b8
        JREQ      L:??UART1_LINCmd_0
        LD        A, S:?b8
        CP        A, #0x1
        JREQ      L:??UART1_LINCmd_0
        LDW       X, #0x15f
        LDW       S:?w1, X
        CLRW      X
        LDW       S:?w0, X
        LDW       X, #`?<Constant "E:\\\\Desktop\\\\J19B_STM8\\\\...">`
        CALL      L:assert_failed
//  352   
//  353   if (NewState != DISABLE)
??UART1_LINCmd_0:
        TNZ       S:?b8
        JREQ      L:??UART1_LINCmd_1
//  354   {
//  355     /* Enable the LIN mode by setting the LINE bit in the CR2 register */
//  356     UART1->CR3 |= UART1_CR3_LINEN;
        BSET      L:0x5236, #0x6
        JRA       L:??UART1_LINCmd_2
//  357   }
//  358   else
//  359   {
//  360     /* Disable the LIN mode by clearing the LINE bit in the CR2 register */
//  361     UART1->CR3 &= ((uint8_t)~UART1_CR3_LINEN);
??UART1_LINCmd_1:
        BRES      L:0x5236, #0x6
//  362   }
//  363 }
??UART1_LINCmd_2:
        POP       S:?b8
        RET
//  364 
//  365 /**
//  366   * @brief  Enables or disables the UART1 Smart Card mode.
//  367   * @param  NewState: new state of the Smart Card mode.
//  368   * This parameter can be: ENABLE or DISABLE.
//  369   * @retval None
//  370   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  371 void UART1_SmartCardCmd(FunctionalState NewState)
//  372 {
UART1_SmartCardCmd:
        PUSH      S:?b8
        LD        S:?b8, A
//  373   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
        TNZ       S:?b8
        JREQ      L:??UART1_SmartCardCmd_0
        LD        A, S:?b8
        CP        A, #0x1
        JREQ      L:??UART1_SmartCardCmd_0
        LDW       X, #0x175
        LDW       S:?w1, X
        CLRW      X
        LDW       S:?w0, X
        LDW       X, #`?<Constant "E:\\\\Desktop\\\\J19B_STM8\\\\...">`
        CALL      L:assert_failed
//  374   
//  375   if (NewState != DISABLE)
??UART1_SmartCardCmd_0:
        TNZ       S:?b8
        JREQ      L:??UART1_SmartCardCmd_1
//  376   {
//  377     /* Enable the SC mode by setting the SCEN bit in the CR5 register */
//  378     UART1->CR5 |= UART1_CR5_SCEN;
        BSET      L:0x5238, #0x5
        JRA       L:??UART1_SmartCardCmd_2
//  379   }
//  380   else
//  381   {
//  382     /* Disable the SC mode by clearing the SCEN bit in the CR5 register */
//  383     UART1->CR5 &= ((uint8_t)(~UART1_CR5_SCEN));
??UART1_SmartCardCmd_1:
        BRES      L:0x5238, #0x5
//  384   }
//  385 }
??UART1_SmartCardCmd_2:
        POP       S:?b8
        RET
//  386 
//  387 /**
//  388   * @brief  Enables or disables NACK transmission.
//  389   * @note   This function is valid only for UART1 because is related to SmartCard mode.
//  390   * @param  NewState: new state of the Smart Card mode.
//  391   *         This parameter can be: ENABLE or DISABLE.
//  392   * @retval None
//  393   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  394 void UART1_SmartCardNACKCmd(FunctionalState NewState)
//  395 {
UART1_SmartCardNACKCmd:
        PUSH      S:?b8
        LD        S:?b8, A
//  396   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
        TNZ       S:?b8
        JREQ      L:??UART1_SmartCardNACKCmd_0
        LD        A, S:?b8
        CP        A, #0x1
        JREQ      L:??UART1_SmartCardNACKCmd_0
        LDW       X, #0x18c
        LDW       S:?w1, X
        CLRW      X
        LDW       S:?w0, X
        LDW       X, #`?<Constant "E:\\\\Desktop\\\\J19B_STM8\\\\...">`
        CALL      L:assert_failed
//  397   
//  398   if (NewState != DISABLE)
??UART1_SmartCardNACKCmd_0:
        TNZ       S:?b8
        JREQ      L:??UART1_SmartCardNACKCmd_1
//  399   {
//  400     /* Enable the NACK transmission by setting the NACK bit in the CR5 register */
//  401     UART1->CR5 |= UART1_CR5_NACK;
        BSET      L:0x5238, #0x4
        JRA       L:??UART1_SmartCardNACKCmd_2
//  402   }
//  403   else
//  404   {
//  405     /* Disable the NACK transmission by clearing the NACK bit in the CR5 register */
//  406     UART1->CR5 &= ((uint8_t)~(UART1_CR5_NACK));
??UART1_SmartCardNACKCmd_1:
        BRES      L:0x5238, #0x4
//  407   }
//  408 }
??UART1_SmartCardNACKCmd_2:
        POP       S:?b8
        RET
//  409 
//  410 /**
//  411   * @brief  Selects the UART1 WakeUp method.
//  412   * @param  UART1_WakeUp: specifies the UART1 wakeup method.
//  413   *         This parameter can be any of the @ref UART1_WakeUp_TypeDef values.
//  414   * @retval None
//  415   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  416 void UART1_WakeUpConfig(UART1_WakeUp_TypeDef UART1_WakeUp)
//  417 {
UART1_WakeUpConfig:
        PUSH      S:?b8
        LD        S:?b8, A
//  418   assert_param(IS_UART1_WAKEUP_OK(UART1_WakeUp));
        TNZ       S:?b8
        JREQ      L:??UART1_WakeUpConfig_0
        LD        A, S:?b8
        CP        A, #0x8
        JREQ      L:??UART1_WakeUpConfig_0
        LDW       X, #0x1a2
        LDW       S:?w1, X
        CLRW      X
        LDW       S:?w0, X
        LDW       X, #`?<Constant "E:\\\\Desktop\\\\J19B_STM8\\\\...">`
        CALL      L:assert_failed
//  419   
//  420   UART1->CR1 &= ((uint8_t)~UART1_CR1_WAKE);
??UART1_WakeUpConfig_0:
        BRES      L:0x5234, #0x3
//  421   UART1->CR1 |= (uint8_t)UART1_WakeUp;
        LD        A, S:?b8
        OR        A, L:0x5234
        LD        L:0x5234, A
//  422 }
        POP       S:?b8
        RET
//  423 
//  424 /**
//  425   * @brief  Determines if the UART1 is in mute mode or not.
//  426   * @param  NewState: new state of the UART1 mode.
//  427   *         This parameter can be: ENABLE or DISABLE.
//  428   * @retval None
//  429   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  430 void UART1_ReceiverWakeUpCmd(FunctionalState NewState)
//  431 {
UART1_ReceiverWakeUpCmd:
        PUSH      S:?b8
        LD        S:?b8, A
//  432   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
        TNZ       S:?b8
        JREQ      L:??UART1_ReceiverWakeUpCmd_0
        LD        A, S:?b8
        CP        A, #0x1
        JREQ      L:??UART1_ReceiverWakeUpCmd_0
        LDW       X, #0x1b0
        LDW       S:?w1, X
        CLRW      X
        LDW       S:?w0, X
        LDW       X, #`?<Constant "E:\\\\Desktop\\\\J19B_STM8\\\\...">`
        CALL      L:assert_failed
//  433   
//  434   if (NewState != DISABLE)
??UART1_ReceiverWakeUpCmd_0:
        TNZ       S:?b8
        JREQ      L:??UART1_ReceiverWakeUpCmd_1
//  435   {
//  436     /* Enable the mute mode UART1 by setting the RWU bit in the CR2 register */
//  437     UART1->CR2 |= UART1_CR2_RWU;
        BSET      L:0x5235, #0x1
        JRA       L:??UART1_ReceiverWakeUpCmd_2
//  438   }
//  439   else
//  440   {
//  441     /* Disable the mute mode UART1 by clearing the RWU bit in the CR1 register */
//  442     UART1->CR2 &= ((uint8_t)~UART1_CR2_RWU);
??UART1_ReceiverWakeUpCmd_1:
        BRES      L:0x5235, #0x1
//  443   }
//  444 }
??UART1_ReceiverWakeUpCmd_2:
        POP       S:?b8
        RET
//  445 
//  446 /**
//  447   * @brief  Returns the most recent received data by the UART1 peripheral.
//  448   * @param  None
//  449   * @retval The received data.
//  450   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  451 uint8_t UART1_ReceiveData8(void)
//  452 {
//  453   return ((uint8_t)UART1->DR);
UART1_ReceiveData8:
        LD        A, L:0x5231
        RET
//  454 }
//  455 
//  456 /**
//  457   * @brief  Returns the most recent received data by the UART1 peripheral.
//  458   * @param  None
//  459   * @retval The received data.
//  460   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  461 uint16_t UART1_ReceiveData9(void)
//  462 {
//  463   uint16_t temp = 0;
UART1_ReceiveData9:
        CLR       S:?b1
        CLR       S:?b0
//  464   
//  465   temp = (uint16_t)(((uint16_t)( (uint16_t)UART1->CR1 & (uint16_t)UART1_CR1_R8)) << 1);
        LD        A, L:0x5234
        CLRW      X
        LD        XL, A
        RLWA      X, A
        AND       A, #0x0
        RLWA      X, A
        AND       A, #0x80
        RLWA      X, A
        SLLW      X
        LDW       S:?w0, X
//  466   return (uint16_t)( (((uint16_t) UART1->DR) | temp ) & ((uint16_t)0x01FF));
        LD        A, L:0x5231
        CLRW      X
        LD        XL, A
        RRWA      X, A
        OR        A, S:?b1
        RRWA      X, A
        OR        A, S:?b0
        RRWA      X, A
        RLWA      X, A
        AND       A, #0x1
        RLWA      X, A
        AND       A, #0xff
        RLWA      X, A
        RET
//  467 }
//  468 
//  469 /**
//  470   * @brief  Transmits 8 bit data through the UART1 peripheral.
//  471   * @param  Data: The data to transmit.
//  472   * @retval None
//  473   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  474 void UART1_SendData8(uint8_t Data)
//  475 {
//  476   /* Transmit Data */
//  477   UART1->DR = Data;
UART1_SendData8:
        LD        L:0x5231, A
//  478 }
        RET
//  479 
//  480 /**
//  481   * @brief  Transmits 9 bit data through the UART peripheral.
//  482   * @param  Data : The data to transmit.
//  483   *         This parameter should be lower than 0x1FF.
//  484   * @retval None
//  485   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  486 void UART1_SendData9(uint16_t Data)
//  487 {
UART1_SendData9:
        LDW       Y, X
//  488   /**< Clear the transmit data bit 8 [8]  */
//  489   UART1->CR1 &= ((uint8_t)~UART1_CR1_T8);
        BRES      L:0x5234, #0x6
//  490   /**< Write the transmit data bit [8]  */
//  491   UART1->CR1 |= (uint8_t)(((uint8_t)(Data >> 2)) & UART1_CR1_T8);
        LDW       X, Y
        SRLW      X
        SRLW      X
        LD        A, XL
        AND       A, #0x40
        OR        A, L:0x5234
        LD        L:0x5234, A
//  492   /**< Write the transmit data bit [0:7] */
//  493   UART1->DR   = (uint8_t)(Data);
        LD        A, YL
        LD        L:0x5231, A
//  494 }
        RET
//  495 
//  496 /**
//  497   * @brief  Transmits break characters.
//  498   * @param  None
//  499   * @retval None
//  500   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  501 void UART1_SendBreak(void)
//  502 {
//  503   UART1->CR2 |= UART1_CR2_SBK;
UART1_SendBreak:
        BSET      L:0x5235, #0x0
//  504 }
        RET
//  505 
//  506 /**
//  507   * @brief  Sets the address of the UART1 node.
//  508   * @param  UART1_Address: Indicates the address of the UART1 node.
//  509   * @retval None
//  510   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  511 void UART1_SetAddress(uint8_t UART1_Address)
//  512 {
UART1_SetAddress:
        PUSH      S:?b8
        LD        S:?b8, A
//  513   /*assert_param for UART1_Address*/
//  514   assert_param(IS_UART1_ADDRESS_OK(UART1_Address));
        LD        A, S:?b8
        CP        A, #0x10
        JRC       L:??UART1_SetAddress_0
        LDW       X, #0x202
        LDW       S:?w1, X
        CLRW      X
        LDW       S:?w0, X
        LDW       X, #`?<Constant "E:\\\\Desktop\\\\J19B_STM8\\\\...">`
        CALL      L:assert_failed
//  515   
//  516   /* Clear the UART1 address */
//  517   UART1->CR4 &= ((uint8_t)~UART1_CR4_ADD);
??UART1_SetAddress_0:
        LD        A, L:0x5237
        AND       A, #0xf0
        LD        L:0x5237, A
//  518   /* Set the UART1 address node */
//  519   UART1->CR4 |= UART1_Address;
        LD        A, S:?b8
        OR        A, L:0x5237
        LD        L:0x5237, A
//  520 }
        POP       S:?b8
        RET
//  521 
//  522 /**
//  523   * @brief  Sets the specified UART guard time.
//  524   * @note   SmartCard Mode should be Enabled
//  525   * @param  UART1_GuardTime: specifies the guard time.
//  526   * @retval None
//  527   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  528 void UART1_SetGuardTime(uint8_t UART1_GuardTime)
//  529 {
//  530   /* Set the UART1 guard time */
//  531   UART1->GTR = UART1_GuardTime;
UART1_SetGuardTime:
        LD        L:0x5239, A
//  532 }
        RET
//  533 
//  534 /**
//  535   * @brief  Sets the system clock prescaler.
//  536   * @note   IrDA Low Power mode or smartcard mode should be enabled
//  537   * @note   This function is related to SmartCard and IrDa mode.
//  538   * @param  UART1_Prescaler: specifies the prescaler clock.
//  539   *         This parameter can be one of the following values:
//  540   *         @par IrDA Low Power Mode
//  541   *         The clock source is divided by the value given in the register (8 bits)
//  542   *         - 0000 0000 Reserved
//  543   *         - 0000 0001 divides the clock source by 1
//  544   *         - 0000 0010 divides the clock source by 2
//  545   *         - ...
//  546   *        @par Smart Card Mode
//  547   *        The clock source is divided by the value given in the register
//  548   *        (5 significant bits) multiplied by 2
//  549   *         - 0 0000 Reserved
//  550   *         - 0 0001 divides the clock source by 2
//  551   *         - 0 0010 divides the clock source by 4
//  552   *         - 0 0011 divides the clock source by 6
//  553   *         - ...
//  554   * @retval None
//  555   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  556 void UART1_SetPrescaler(uint8_t UART1_Prescaler)
//  557 {
//  558   /* Load the UART1 prescaler value*/
//  559   UART1->PSCR = UART1_Prescaler;
UART1_SetPrescaler:
        LD        L:0x523a, A
//  560 }
        RET
//  561 
//  562 /**
//  563   * @brief  Checks whether the specified UART1 flag is set or not.
//  564   * @param  UART1_FLAG specifies the flag to check.
//  565   *         This parameter can be any of the @ref UART1_Flag_TypeDef enumeration.
//  566   * @retval FlagStatus (SET or RESET)
//  567   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  568 FlagStatus UART1_GetFlagStatus(UART1_Flag_TypeDef UART1_FLAG)
//  569 {
UART1_GetFlagStatus:
        CALL      L:?push_w4
        LDW       S:?w4, X
//  570   FlagStatus status = RESET;
        CLR       A
//  571   
//  572   /* Check parameters */
//  573   assert_param(IS_UART1_FLAG_OK(UART1_FLAG));
        LDW       X, S:?w4
        CPW       X, #0x80
        JREQ      L:??UART1_GetFlagStatus_0
        LDW       X, S:?w4
        CPW       X, #0x40
        JREQ      L:??UART1_GetFlagStatus_0
        LDW       X, S:?w4
        CPW       X, #0x20
        JREQ      L:??UART1_GetFlagStatus_0
        LDW       X, S:?w4
        CPW       X, #0x10
        JREQ      L:??UART1_GetFlagStatus_0
        LDW       X, S:?w4
        CPW       X, #0x8
        JREQ      L:??UART1_GetFlagStatus_0
        LDW       X, S:?w4
        CPW       X, #0x4
        JREQ      L:??UART1_GetFlagStatus_0
        LDW       X, S:?w4
        CPW       X, #0x2
        JREQ      L:??UART1_GetFlagStatus_0
        LDW       X, S:?w4
        CPW       X, #0x1
        JREQ      L:??UART1_GetFlagStatus_0
        LDW       X, S:?w4
        CPW       X, #0x101
        JREQ      L:??UART1_GetFlagStatus_0
        LDW       X, S:?w4
        CPW       X, #0x210
        JREQ      L:??UART1_GetFlagStatus_0
        LDW       X, #0x23d
        LDW       S:?w1, X
        CLRW      X
        LDW       S:?w0, X
        LDW       X, #`?<Constant "E:\\\\Desktop\\\\J19B_STM8\\\\...">`
        CALL      L:assert_failed
//  574   
//  575   
//  576   /* Check the status of the specified UART1 flag*/
//  577   if (UART1_FLAG == UART1_FLAG_LBDF)
??UART1_GetFlagStatus_0:
        LDW       X, S:?w4
        CPW       X, #0x210
        JRNE      L:??UART1_GetFlagStatus_1
//  578   {
//  579     if ((UART1->CR4 & (uint8_t)UART1_FLAG) != (uint8_t)0x00)
        LD        A, S:?b9
        AND       A, L:0x5237
        CP        A, #0x0
        JREQ      L:??UART1_GetFlagStatus_2
//  580     {
//  581       /* UART1_FLAG is set*/
//  582       status = SET;
        LD        A, #0x1
        JP        L:?epilogue_w4
//  583     }
//  584     else
//  585     {
//  586       /* UART1_FLAG is reset*/
//  587       status = RESET;
??UART1_GetFlagStatus_2:
        CLR       A
        JP        L:?epilogue_w4
//  588     }
//  589   }
//  590   else if (UART1_FLAG == UART1_FLAG_SBK)
??UART1_GetFlagStatus_1:
        LDW       X, S:?w4
        CPW       X, #0x101
        JRNE      L:??UART1_GetFlagStatus_3
//  591   {
//  592     if ((UART1->CR2 & (uint8_t)UART1_FLAG) != (uint8_t)0x00)
        LD        A, S:?b9
        AND       A, L:0x5235
        CP        A, #0x0
        JREQ      L:??UART1_GetFlagStatus_4
//  593     {
//  594       /* UART1_FLAG is set*/
//  595       status = SET;
        LD        A, #0x1
        JP        L:?epilogue_w4
//  596     }
//  597     else
//  598     {
//  599       /* UART1_FLAG is reset*/
//  600       status = RESET;
??UART1_GetFlagStatus_4:
        CLR       A
        JP        L:?epilogue_w4
//  601     }
//  602   }
//  603   else
//  604   {
//  605     if ((UART1->SR & (uint8_t)UART1_FLAG) != (uint8_t)0x00)
??UART1_GetFlagStatus_3:
        LD        A, S:?b9
        AND       A, L:0x5230
        CP        A, #0x0
        JREQ      L:??UART1_GetFlagStatus_5
//  606     {
//  607       /* UART1_FLAG is set*/
//  608       status = SET;
        LD        A, #0x1
        JP        L:?epilogue_w4
//  609     }
//  610     else
//  611     {
//  612       /* UART1_FLAG is reset*/
//  613       status = RESET;
??UART1_GetFlagStatus_5:
        CLR       A
//  614     }
//  615   }
//  616   /* Return the UART1_FLAG status*/
//  617   return status;
        JP        L:?epilogue_w4
//  618 }
//  619 
//  620 /**
//  621   * @brief  Clears the UART1 flags.
//  622   * @param  UART1_FLAG specifies the flag to clear
//  623   *         This parameter can be any combination of the following values:
//  624   *         - UART1_FLAG_LBDF: LIN Break detection flag.
//  625   *         - UART1_FLAG_RXNE: Receive data register not empty flag.
//  626   * @note
//  627   *         - PE (Parity error), FE (Framing error), NE (Noise error), 
//  628   *         OR (OverRun error) and IDLE (Idle line detected) flags are 
//  629   *         cleared by software sequence: a read operation to UART1_SR register
//  630   *         (UART1_GetFlagStatus())followed by a read operation to UART1_DR 
//  631   *         register(UART1_ReceiveData8() or UART1_ReceiveData9()).
//  632   *           
//  633   *         - RXNE flag can be also cleared by a read to the UART1_DR register
//  634   *         (UART1_ReceiveData8()or UART1_ReceiveData9()).
//  635   *           
//  636   *         - TC flag can be also cleared by software sequence: a read operation
//  637   *         to UART1_SR register (UART1_GetFlagStatus()) followed by a write 
//  638   *         operation to UART1_DR register (UART1_SendData8() or UART1_SendData9()).
//  639   *           
//  640   *         - TXE flag is cleared only by a write to the UART1_DR register 
//  641   *         (UART1_SendData8() or UART1_SendData9()).
//  642   *           
//  643   *         - SBK flag is cleared during the stop bit of break.
//  644   * @retval None
//  645   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  646 void UART1_ClearFlag(UART1_Flag_TypeDef UART1_FLAG)
//  647 {
UART1_ClearFlag:
        CALL      L:?push_w4
        LDW       S:?w4, X
//  648   assert_param(IS_UART1_CLEAR_FLAG_OK(UART1_FLAG));
        LDW       X, S:?w4
        CPW       X, #0x20
        JREQ      L:??UART1_ClearFlag_0
        LDW       X, S:?w4
        CPW       X, #0x210
        JREQ      L:??UART1_ClearFlag_0
        LDW       X, #0x288
        LDW       S:?w1, X
        CLRW      X
        LDW       S:?w0, X
        LDW       X, #`?<Constant "E:\\\\Desktop\\\\J19B_STM8\\\\...">`
        CALL      L:assert_failed
//  649   
//  650   /* Clear the Receive Register Not Empty flag */
//  651   if (UART1_FLAG == UART1_FLAG_RXNE)
??UART1_ClearFlag_0:
        LDW       X, S:?w4
        CPW       X, #0x20
        JRNE      L:??UART1_ClearFlag_1
//  652   {
//  653     UART1->SR = (uint8_t)~(UART1_SR_RXNE);
        MOV       L:0x5230, #0xdf
        JP        L:?epilogue_w4
//  654   }
//  655   /* Clear the LIN Break Detection flag */
//  656   else
//  657   {
//  658     UART1->CR4 &= (uint8_t)~(UART1_CR4_LBDF);
??UART1_ClearFlag_1:
        BRES      L:0x5237, #0x4
//  659   }
//  660 }
        JP        L:?epilogue_w4
//  661 
//  662 /**
//  663   * @brief  Checks whether the specified UART1 interrupt has occurred or not.
//  664   * @param  UART1_IT: Specifies the UART1 interrupt pending bit to check.
//  665   *         This parameter can be one of the following values:
//  666   *         - UART1_IT_LBDF:  LIN Break detection interrupt
//  667   *         - UART1_IT_TXE:  Transmit Data Register empty interrupt
//  668   *         - UART1_IT_TC:   Transmission complete interrupt
//  669   *         - UART1_IT_RXNE: Receive Data register not empty interrupt
//  670   *         - UART1_IT_IDLE: Idle line detection interrupt
//  671   *         - UART1_IT_OR:  OverRun Error interrupt
//  672   *         - UART1_IT_PE:   Parity Error interrupt
//  673   * @retval The new state of UART1_IT (SET or RESET).
//  674   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  675 ITStatus UART1_GetITStatus(UART1_IT_TypeDef UART1_IT)
//  676 {
UART1_GetITStatus:
        CALL      L:?push_w4
        LDW       S:?w4, X
//  677   ITStatus pendingbitstatus = RESET;
        CLR       S:?b0
//  678   uint8_t itpos = 0;
        CLR       S:?b1
//  679   uint8_t itmask1 = 0;
        CLR       S:?b2
//  680   uint8_t itmask2 = 0;
        CLR       A
//  681   uint8_t enablestatus = 0;
        CLR       S:?b3
//  682   
//  683   /* Check parameters */
//  684   assert_param(IS_UART1_GET_IT_OK(UART1_IT));
        LDW       X, S:?w4
        CPW       X, #0x277
        JREQ      L:??UART1_GetITStatus_0
        LDW       X, S:?w4
        CPW       X, #0x266
        JREQ      L:??UART1_GetITStatus_0
        LDW       X, S:?w4
        CPW       X, #0x255
        JREQ      L:??UART1_GetITStatus_0
        LDW       X, S:?w4
        CPW       X, #0x244
        JREQ      L:??UART1_GetITStatus_0
        LDW       X, S:?w4
        CPW       X, #0x235
        JREQ      L:??UART1_GetITStatus_0
        LDW       X, S:?w4
        CPW       X, #0x346
        JREQ      L:??UART1_GetITStatus_0
        LDW       X, S:?w4
        CPW       X, #0x100
        JREQ      L:??UART1_GetITStatus_0
        LDW       X, #0x2ac
        LDW       S:?w1, X
        CLRW      X
        LDW       S:?w0, X
        LDW       X, #`?<Constant "E:\\\\Desktop\\\\J19B_STM8\\\\...">`
        CALL      L:assert_failed
//  685   
//  686   /* Get the UART1 IT index */
//  687   itpos = (uint8_t)((uint8_t)1 << (uint8_t)((uint8_t)UART1_IT & (uint8_t)0x0F));
??UART1_GetITStatus_0:
        LD        A, S:?b9
        AND       A, #0xf
        CLRW      X
        INCW      X
        CALL      L:?sll16_x_x_a
        EXG       A, XL
        LD        S:?b1, A
        EXG       A, XL
//  688   /* Get the UART1 IT index */
//  689   itmask1 = (uint8_t)((uint8_t)UART1_IT >> (uint8_t)4);
        LD        A, S:?b9
        SWAP      A
        AND       A, #0xf
        LD        S:?b2, A
//  690   /* Set the IT mask*/
//  691   itmask2 = (uint8_t)((uint8_t)1 << itmask1);
        CLRW      X
        INCW      X
        LD        A, S:?b2
        CALL      L:?sll16_x_x_a
        LD        A, XL
//  692   
//  693   
//  694   /* Check the status of the specified UART1 pending bit*/
//  695   if (UART1_IT == UART1_IT_PE)
        LDW       X, S:?w4
        CPW       X, #0x100
        JRNE      L:??UART1_GetITStatus_1
//  696   {
//  697     /* Get the UART1_IT enable bit status*/
//  698     enablestatus = (uint8_t)((uint8_t)UART1->CR1 & itmask2);
        AND       A, L:0x5234
        LD        S:?b3, A
//  699     /* Check the status of the specified UART1 interrupt*/
//  700     
//  701     if (((UART1->SR & itpos) != (uint8_t)0x00) && enablestatus)
        LD        A, S:?b1
        AND       A, L:0x5230
        CP        A, #0x0
        JREQ      L:??UART1_GetITStatus_2
        TNZ       S:?b3
        JREQ      L:??UART1_GetITStatus_2
//  702     {
//  703       /* Interrupt occurred*/
//  704       pendingbitstatus = SET;
        MOV       S:?b0, #0x1
        JRA       L:??UART1_GetITStatus_3
//  705     }
//  706     else
//  707     {
//  708       /* Interrupt not occurred*/
//  709       pendingbitstatus = RESET;
??UART1_GetITStatus_2:
        CLR       S:?b0
        JRA       L:??UART1_GetITStatus_3
//  710     }
//  711   }
//  712   
//  713   else if (UART1_IT == UART1_IT_LBDF)
??UART1_GetITStatus_1:
        LDW       X, S:?w4
        CPW       X, #0x346
        JRNE      L:??UART1_GetITStatus_4
//  714   {
//  715     /* Get the UART1_IT enable bit status*/
//  716     enablestatus = (uint8_t)((uint8_t)UART1->CR4 & itmask2);
        AND       A, L:0x5237
        LD        S:?b3, A
//  717     /* Check the status of the specified UART1 interrupt*/
//  718     if (((UART1->CR4 & itpos) != (uint8_t)0x00) && enablestatus)
        LD        A, S:?b1
        AND       A, L:0x5237
        CP        A, #0x0
        JREQ      L:??UART1_GetITStatus_5
        TNZ       S:?b3
        JREQ      L:??UART1_GetITStatus_5
//  719     {
//  720       /* Interrupt occurred*/
//  721       pendingbitstatus = SET;
        MOV       S:?b0, #0x1
        JRA       L:??UART1_GetITStatus_3
//  722     }
//  723     else
//  724     {
//  725       /* Interrupt not occurred*/
//  726       pendingbitstatus = RESET;
??UART1_GetITStatus_5:
        CLR       S:?b0
        JRA       L:??UART1_GetITStatus_3
//  727     }
//  728   }
//  729   else
//  730   {
//  731     /* Get the UART1_IT enable bit status*/
//  732     enablestatus = (uint8_t)((uint8_t)UART1->CR2 & itmask2);
??UART1_GetITStatus_4:
        AND       A, L:0x5235
        LD        S:?b3, A
//  733     /* Check the status of the specified UART1 interrupt*/
//  734     if (((UART1->SR & itpos) != (uint8_t)0x00) && enablestatus)
        LD        A, S:?b1
        AND       A, L:0x5230
        CP        A, #0x0
        JREQ      L:??UART1_GetITStatus_6
        TNZ       S:?b3
        JREQ      L:??UART1_GetITStatus_6
//  735     {
//  736       /* Interrupt occurred*/
//  737       pendingbitstatus = SET;
        MOV       S:?b0, #0x1
        JRA       L:??UART1_GetITStatus_3
//  738     }
//  739     else
//  740     {
//  741       /* Interrupt not occurred*/
//  742       pendingbitstatus = RESET;
??UART1_GetITStatus_6:
        CLR       S:?b0
//  743     }
//  744   }
//  745   
//  746   /* Return the UART1_IT status*/
//  747   return  pendingbitstatus;
??UART1_GetITStatus_3:
        LD        A, S:?b0
        JP        L:?epilogue_w4
//  748 }
//  749 
//  750 /**
//  751   * @brief  Clears the UART1 pending flags.
//  752   * @param  UART1_IT specifies the pending bit to clear
//  753   *         This parameter can be one of the following values:
//  754   *         - UART1_IT_LBDF:  LIN Break detection interrupt
//  755   *         - UART1_IT_RXNE: Receive Data register not empty interrupt.
//  756   * @note
//  757   *         - PE (Parity error), FE (Framing error), NE (Noise error), 
//  758   *           OR (OverRun error) and IDLE (Idle line detected) pending bits are 
//  759   *           cleared by software sequence: a read operation to UART1_SR register
//  760   *           (UART1_GetITStatus()) followed by a read operation to UART1_DR register
//  761   *           (UART1_ReceiveData8() or UART1_ReceiveData9()).
//  762   *   
//  763   *         - RXNE pending bit can be also cleared by a read to the UART1_DR register
//  764   *           (UART1_ReceiveData8() or UART1_ReceiveData9()).
//  765   * 
//  766   *         - TC (Transmit complete) pending bit can be cleared by software 
//  767   *           sequence: a read operation to UART1_SR register (UART1_GetITStatus())
//  768   *           followed by a write operation to UART1_DR register (UART1_SendData8()
//  769   *           or UART1_SendData9()).
//  770   *             
//  771   *         - TXE pending bit is cleared only by a write to the UART1_DR register
//  772   *           (UART1_SendData8() or UART1_SendData9()).
//  773   * @retval None
//  774   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  775 void UART1_ClearITPendingBit(UART1_IT_TypeDef UART1_IT)
//  776 {
UART1_ClearITPendingBit:
        CALL      L:?push_w4
        LDW       S:?w4, X
//  777   assert_param(IS_UART1_CLEAR_IT_OK(UART1_IT));
        LDW       X, S:?w4
        CPW       X, #0x255
        JREQ      L:??UART1_ClearITPendingBit_0
        LDW       X, S:?w4
        CPW       X, #0x346
        JREQ      L:??UART1_ClearITPendingBit_0
        LDW       X, #0x309
        LDW       S:?w1, X
        CLRW      X
        LDW       S:?w0, X
        LDW       X, #`?<Constant "E:\\\\Desktop\\\\J19B_STM8\\\\...">`
        CALL      L:assert_failed
//  778   
//  779   /* Clear the Receive Register Not Empty pending bit */
//  780   if (UART1_IT == UART1_IT_RXNE)
??UART1_ClearITPendingBit_0:
        LDW       X, S:?w4
        CPW       X, #0x255
        JRNE      L:??UART1_ClearITPendingBit_1
//  781   {
//  782     UART1->SR = (uint8_t)~(UART1_SR_RXNE);
        MOV       L:0x5230, #0xdf
        JP        L:?epilogue_w4
//  783   }
//  784   /* Clear the LIN Break Detection pending bit */
//  785   else
//  786   {
//  787     UART1->CR4 &= (uint8_t)~(UART1_CR4_LBDF);
??UART1_ClearITPendingBit_1:
        BRES      L:0x5237, #0x4
//  788   }
//  789 }
        JP        L:?epilogue_w4

        SECTION VREGS:DATA:REORDER:NOROOT(0)

        SECTION `.near.rodata`:CONST:REORDER:NOROOT(0)
`?<Constant "E:\\\\Desktop\\\\J19B_STM8\\\\...">`:
        DC8 "E:\\Desktop\\J19B_STM8\\Lib\\src\\stm8s_uart1.c"

        END
//  790 
//  791 /**
//  792   * @}
//  793   */
//  794   
//  795 /**
//  796   * @}
//  797   */
//  798   
//  799 
//  800 /************************ (C) COPYRIGHT STMicroelectronics *****END OF FILE****/
// 
//    43 bytes in section .near.rodata
// 1 840 bytes in section .near_func.text
// 
// 1 840 bytes of CODE  memory
//    43 bytes of CONST memory
//
//Errors: none
//Warnings: none
