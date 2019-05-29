///////////////////////////////////////////////////////////////////////////////
//                                                                            /
//                                                      28/May/2019  16:13:16 /
// IAR C/C++ Compiler V1.31.1.20058 [Evaluation] for STM8                     /
// Copyright 2010-2012 IAR Systems AB.                                        /
//                                                                            /
//    Source file  =  E:\Desktop\J19B_STM8\Lib\src\stm8s_spi.c                /
//    Command line =  E:\Desktop\J19B_STM8\Lib\src\stm8s_spi.c -e -Ol         /
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
//    List file    =  E:\Desktop\J19B_STM8\Debug\List\stm8s_spi.s             /
//                                                                            /
//                                                                            /
///////////////////////////////////////////////////////////////////////////////

        NAME stm8s_spi

        EXTERN ?b0
        EXTERN ?b1
        EXTERN ?b10
        EXTERN ?b11
        EXTERN ?b12
        EXTERN ?b13
        EXTERN ?b14
        EXTERN ?b15
        EXTERN ?b2
        EXTERN ?b3
        EXTERN ?b4
        EXTERN ?b5
        EXTERN ?b6
        EXTERN ?b8
        EXTERN ?b9
        EXTERN ?epilogue_l2_l3
        EXTERN ?epilogue_w4
        EXTERN ?push_l2
        EXTERN ?push_l3
        EXTERN ?push_w4
        EXTERN ?sll16_x_x_a
        EXTERN ?w0
        EXTERN ?w1
        EXTERN assert_failed

        PUBLIC SPI_BiDirectionalLineConfig
        PUBLIC SPI_CalculateCRCCmd
        PUBLIC SPI_ClearFlag
        PUBLIC SPI_ClearITPendingBit
        PUBLIC SPI_Cmd
        PUBLIC SPI_DeInit
        PUBLIC SPI_GetCRC
        PUBLIC SPI_GetCRCPolynomial
        PUBLIC SPI_GetFlagStatus
        PUBLIC SPI_GetITStatus
        PUBLIC SPI_ITConfig
        PUBLIC SPI_Init
        PUBLIC SPI_NSSInternalSoftwareCmd
        PUBLIC SPI_ReceiveData
        PUBLIC SPI_ResetCRC
        PUBLIC SPI_SendData
        PUBLIC SPI_TransmitCRC

// E:\Desktop\J19B_STM8\Lib\src\stm8s_spi.c
//    1 /**
//    2   ******************************************************************************
//    3   * @file    stm8s_spi.c
//    4   * @author  MCD Application Team
//    5   * @version V2.2.0
//    6   * @date    30-September-2014
//    7   * @brief   This file contains all the functions for the SPI peripheral.
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
//   29 #include "stm8s_spi.h"
//   30 
//   31 /** @addtogroup STM8S_StdPeriph_Driver
//   32   * @{
//   33   */
//   34   
//   35 /* Private define ------------------------------------------------------------*/
//   36 /* Private macro -------------------------------------------------------------*/
//   37 /* Private variables ---------------------------------------------------------*/
//   38 /* Private function prototypes -----------------------------------------------*/
//   39 /* Private functions ---------------------------------------------------------*/
//   40 
//   41 /** @addtogroup SPI_Public_Functions
//   42   * @{
//   43   */
//   44 
//   45 /**
//   46   * @brief  Deinitializes the SPI peripheral registers to their default reset values.
//   47   * @param  None
//   48   * @retval None
//   49   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//   50 void SPI_DeInit(void)
//   51 {
//   52   SPI->CR1    = SPI_CR1_RESET_VALUE;
SPI_DeInit:
        MOV       L:0x5200, #0x0
//   53   SPI->CR2    = SPI_CR2_RESET_VALUE;
        MOV       L:0x5201, #0x0
//   54   SPI->ICR    = SPI_ICR_RESET_VALUE;
        MOV       L:0x5202, #0x0
//   55   SPI->SR     = SPI_SR_RESET_VALUE;
        MOV       L:0x5203, #0x2
//   56   SPI->CRCPR  = SPI_CRCPR_RESET_VALUE;
        MOV       L:0x5205, #0x7
//   57 }
        RET
//   58 
//   59 /**
//   60   * @brief  Initializes the SPI according to the specified parameters.
//   61   * @param  FirstBit : This parameter can be any of the 
//   62   *         @ref SPI_FirstBit_TypeDef enumeration.
//   63   * @param  BaudRatePrescaler : This parameter can be any of the 
//   64   *         @ref SPI_BaudRatePrescaler_TypeDef enumeration.
//   65   * @param  Mode : This parameter can be any of the  
//   66   *         @ref SPI_Mode_TypeDef enumeration.
//   67   * @param  ClockPolarity : This parameter can be any of the 
//   68   *         @ref SPI_ClockPolarity_TypeDef enumeration.
//   69   * @param  ClockPhase : This parameter can be any of the 
//   70   *         @ref SPI_ClockPhase_TypeDef enumeration.
//   71   * @param  Data_Direction : This parameter can be any of the 
//   72   *         @ref SPI_DataDirection_TypeDef enumeration.
//   73   * @param  Slave_Management : This parameter can be any of the 
//   74   *         @ref SPI_NSS_TypeDef enumeration.
//   75   * @param  CRCPolynomial : Configures the CRC polynomial.
//   76   * @retval None
//   77   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//   78 void SPI_Init(SPI_FirstBit_TypeDef FirstBit, SPI_BaudRatePrescaler_TypeDef BaudRatePrescaler, SPI_Mode_TypeDef Mode, SPI_ClockPolarity_TypeDef ClockPolarity, SPI_ClockPhase_TypeDef ClockPhase, SPI_DataDirection_TypeDef Data_Direction, SPI_NSS_TypeDef Slave_Management, uint8_t CRCPolynomial)
//   79 {
SPI_Init:
        CALL      L:?push_l2
        CALL      L:?push_l3
        LD        S:?b15, A
        MOV       S:?b8, S:?b0
        MOV       S:?b9, S:?b1
        MOV       S:?b14, S:?b2
        MOV       S:?b13, S:?b3
        MOV       S:?b10, S:?b4
        MOV       S:?b12, S:?b5
        MOV       S:?b11, S:?b6
//   80   /* Check structure elements */
//   81   assert_param(IS_SPI_FIRSTBIT_OK(FirstBit));
        TNZ       S:?b15
        JREQ      L:??SPI_Init_0
        LD        A, S:?b15
        CP        A, #0x80
        JREQ      L:??SPI_Init_0
        LDW       X, #0x51
        LDW       S:?w1, X
        CLRW      X
        LDW       S:?w0, X
        LDW       X, #`?<Constant "E:\\\\Desktop\\\\J19B_STM8\\\\...">`
        CALL      L:assert_failed
//   82   assert_param(IS_SPI_BAUDRATE_PRESCALER_OK(BaudRatePrescaler));
??SPI_Init_0:
        TNZ       S:?b8
        JREQ      L:??SPI_Init_1
        LD        A, S:?b8
        CP        A, #0x8
        JREQ      L:??SPI_Init_1
        LD        A, S:?b8
        CP        A, #0x10
        JREQ      L:??SPI_Init_1
        LD        A, S:?b8
        CP        A, #0x18
        JREQ      L:??SPI_Init_1
        LD        A, S:?b8
        CP        A, #0x20
        JREQ      L:??SPI_Init_1
        LD        A, S:?b8
        CP        A, #0x28
        JREQ      L:??SPI_Init_1
        LD        A, S:?b8
        CP        A, #0x30
        JREQ      L:??SPI_Init_1
        LD        A, S:?b8
        CP        A, #0x38
        JREQ      L:??SPI_Init_1
        LDW       X, #0x52
        LDW       S:?w1, X
        CLRW      X
        LDW       S:?w0, X
        LDW       X, #`?<Constant "E:\\\\Desktop\\\\J19B_STM8\\\\...">`
        CALL      L:assert_failed
//   83   assert_param(IS_SPI_MODE_OK(Mode));
??SPI_Init_1:
        LD        A, S:?b9
        CP        A, #0x4
        JREQ      L:??SPI_Init_2
        TNZ       S:?b9
        JREQ      L:??SPI_Init_2
        LDW       X, #0x53
        LDW       S:?w1, X
        CLRW      X
        LDW       S:?w0, X
        LDW       X, #`?<Constant "E:\\\\Desktop\\\\J19B_STM8\\\\...">`
        CALL      L:assert_failed
//   84   assert_param(IS_SPI_POLARITY_OK(ClockPolarity));
??SPI_Init_2:
        TNZ       S:?b14
        JREQ      L:??SPI_Init_3
        LD        A, S:?b14
        CP        A, #0x2
        JREQ      L:??SPI_Init_3
        LDW       X, #0x54
        LDW       S:?w1, X
        CLRW      X
        LDW       S:?w0, X
        LDW       X, #`?<Constant "E:\\\\Desktop\\\\J19B_STM8\\\\...">`
        CALL      L:assert_failed
//   85   assert_param(IS_SPI_PHASE_OK(ClockPhase));
??SPI_Init_3:
        TNZ       S:?b13
        JREQ      L:??SPI_Init_4
        LD        A, S:?b13
        CP        A, #0x1
        JREQ      L:??SPI_Init_4
        LDW       X, #0x55
        LDW       S:?w1, X
        CLRW      X
        LDW       S:?w0, X
        LDW       X, #`?<Constant "E:\\\\Desktop\\\\J19B_STM8\\\\...">`
        CALL      L:assert_failed
//   86   assert_param(IS_SPI_DATA_DIRECTION_OK(Data_Direction));
??SPI_Init_4:
        TNZ       S:?b10
        JREQ      L:??SPI_Init_5
        LD        A, S:?b10
        CP        A, #0x4
        JREQ      L:??SPI_Init_5
        LD        A, S:?b10
        CP        A, #0x80
        JREQ      L:??SPI_Init_5
        LD        A, S:?b10
        CP        A, #0xc0
        JREQ      L:??SPI_Init_5
        LDW       X, #0x56
        LDW       S:?w1, X
        CLRW      X
        LDW       S:?w0, X
        LDW       X, #`?<Constant "E:\\\\Desktop\\\\J19B_STM8\\\\...">`
        CALL      L:assert_failed
//   87   assert_param(IS_SPI_SLAVEMANAGEMENT_OK(Slave_Management));
??SPI_Init_5:
        LD        A, S:?b12
        CP        A, #0x2
        JREQ      L:??SPI_Init_6
        TNZ       S:?b12
        JREQ      L:??SPI_Init_6
        LDW       X, #0x57
        LDW       S:?w1, X
        CLRW      X
        LDW       S:?w0, X
        LDW       X, #`?<Constant "E:\\\\Desktop\\\\J19B_STM8\\\\...">`
        CALL      L:assert_failed
//   88   assert_param(IS_SPI_CRC_POLYNOMIAL_OK(CRCPolynomial));
??SPI_Init_6:
        LD        A, S:?b11
        CP        A, #0x1
        JRNC      L:??SPI_Init_7
        LDW       X, #0x58
        LDW       S:?w1, X
        CLRW      X
        LDW       S:?w0, X
        LDW       X, #`?<Constant "E:\\\\Desktop\\\\J19B_STM8\\\\...">`
        CALL      L:assert_failed
//   89   
//   90   /* Frame Format, BaudRate, Clock Polarity and Phase configuration */
//   91   SPI->CR1 = (uint8_t)((uint8_t)((uint8_t)FirstBit | BaudRatePrescaler) |
//   92                        (uint8_t)((uint8_t)ClockPolarity | ClockPhase));
??SPI_Init_7:
        LD        A, S:?b13
        OR        A, S:?b14
        PUSH      A
        LD        A, S:?b8
        OR        A, S:?b15
        LD        S:?b1, A
        POP       A
        OR        A, S:?b1
        LD        L:0x5200, A
//   93   
//   94   /* Data direction configuration: BDM, BDOE and RXONLY bits */
//   95   SPI->CR2 = (uint8_t)((uint8_t)(Data_Direction) | (uint8_t)(Slave_Management));
        LD        A, S:?b12
        OR        A, S:?b10
        LD        L:0x5201, A
//   96   
//   97   if (Mode == SPI_MODE_MASTER)
        LD        A, S:?b9
        CP        A, #0x4
        JRNE      L:??SPI_Init_8
//   98   {
//   99     SPI->CR2 |= (uint8_t)SPI_CR2_SSI;
        BSET      L:0x5201, #0x0
        JRA       L:??SPI_Init_9
//  100   }
//  101   else
//  102   {
//  103     SPI->CR2 &= (uint8_t)~(SPI_CR2_SSI);
??SPI_Init_8:
        BRES      L:0x5201, #0x0
//  104   }
//  105   
//  106   /* Master/Slave mode configuration */
//  107   SPI->CR1 |= (uint8_t)(Mode);
??SPI_Init_9:
        LD        A, S:?b9
        OR        A, L:0x5200
        LD        L:0x5200, A
//  108   
//  109   /* CRC configuration */
//  110   SPI->CRCPR = (uint8_t)CRCPolynomial;
        LD        A, S:?b11
        LD        L:0x5205, A
//  111 }
        JP        L:?epilogue_l2_l3
//  112 
//  113 /**
//  114   * @brief  Enables or disables the SPI peripheral.
//  115   * @param  NewState New state of the SPI peripheral.
//  116   *         This parameter can be: ENABLE or DISABLE
//  117   * @retval None
//  118   */

        SECTION `.near_func.text`:CODE:NOROOT(0)
        CODE
//  119 void SPI_Cmd(FunctionalState NewState)
//  120 {
SPI_Cmd:
        PUSH      S:?b8
        LD        S:?b8, A
//  121   /* Check function parameters */
//  122   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
        TNZ       S:?b8
        JREQ      L:??SPI_Cmd_0
        LD        A, S:?b8
        CP        A, #0x1
        JREQ      L:??SPI_Cmd_0
        LDW       X, #0x7a
        LDW       S:?w1, X
        CLRW      X
        LDW       S:?w0, X
        LDW       X, #`?<Constant "E:\\\\Desktop\\\\J19B_STM8\\\\...">`
        CALL      L:assert_failed
//  123   
//  124   if (NewState != DISABLE)
??SPI_Cmd_0:
        TNZ       S:?b8
        JREQ      L:??SPI_Cmd_1
//  125   {
//  126     SPI->CR1 |= SPI_CR1_SPE; /* Enable the SPI peripheral*/
        BSET      L:0x5200, #0x6
        JRA       L:??SPI_Cmd_2
//  127   }
//  128   else
//  129   {
//  130     SPI->CR1 &= (uint8_t)(~SPI_CR1_SPE); /* Disable the SPI peripheral*/
??SPI_Cmd_1:
        BRES      L:0x5200, #0x6
//  131   }
//  132 }
??SPI_Cmd_2:
        POP       S:?b8
        RET
//  133 
//  134 /**
//  135   * @brief  Enables or disables the specified interrupts.
//  136   * @param  SPI_IT Specifies the SPI interrupts sources to be enabled or disabled.
//  137   * @param  NewState: The new state of the specified SPI interrupts.
//  138   *         This parameter can be: ENABLE or DISABLE.
//  139   * @retval None
//  140   */
//  141 void SPI_ITConfig(SPI_IT_TypeDef SPI_IT, FunctionalState NewState)
//  142 {
//  143   uint8_t itpos = 0;
//  144   /* Check function parameters */
//  145   assert_param(IS_SPI_CONFIG_IT_OK(SPI_IT));
//  146   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
//  147   
//  148   /* Get the SPI IT index */
//  149   itpos = (uint8_t)((uint8_t)1 << (uint8_t)((uint8_t)SPI_IT & (uint8_t)0x0F));
//  150   
//  151   if (NewState != DISABLE)
//  152   {
//  153     SPI->ICR |= itpos; /* Enable interrupt*/
//  154   }
//  155   else
//  156   {
//  157     SPI->ICR &= (uint8_t)(~itpos); /* Disable interrupt*/
//  158   }
//  159 }
//  160 
//  161 /**
//  162   * @brief  Transmits a Data through the SPI peripheral.
//  163   * @param  Data : Byte to be transmitted.
//  164   * @retval None
//  165   */
//  166 void SPI_SendData(uint8_t Data)
//  167 {
//  168   SPI->DR = Data; /* Write in the DR register the data to be sent*/
//  169 }
//  170 
//  171 /**
//  172   * @brief  Returns the most recent received data by the SPI peripheral.
//  173   * @param  None
//  174   * @retval The value of the received data.
//  175   */
//  176 uint8_t SPI_ReceiveData(void)
//  177 {
//  178   return ((uint8_t)SPI->DR); /* Return the data in the DR register*/
//  179 }
//  180 
//  181 /**
//  182   * @brief  Configures internally by software the NSS pin.
//  183   * @param  NewState Indicates the new state of the SPI Software slave management.
//  184   *         This parameter can be: ENABLE or DISABLE.
//  185   * @retval None
//  186   */
//  187 void SPI_NSSInternalSoftwareCmd(FunctionalState NewState)
//  188 {
//  189   /* Check function parameters */
//  190   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
//  191   
//  192   if (NewState != DISABLE)
//  193   {
//  194     SPI->CR2 |= SPI_CR2_SSI; /* Set NSS pin internally by software*/
//  195   }
//  196   else
//  197   {
//  198     SPI->CR2 &= (uint8_t)(~SPI_CR2_SSI); /* Reset NSS pin internally by software*/
//  199   }
//  200 }
//  201 
//  202 /**
//  203   * @brief  Enables the transmit of the CRC value.
//  204   * @param  None
//  205   * @retval None
//  206   */
//  207 void SPI_TransmitCRC(void)
//  208 {
//  209   SPI->CR2 |= SPI_CR2_CRCNEXT; /* Enable the CRC transmission*/
//  210 }
//  211 
//  212 /**
//  213   * @brief  Enables or disables the CRC value calculation of the transferred bytes.
//  214   * @param  NewState Indicates the new state of the SPI CRC value calculation.
//  215   *         This parameter can be: ENABLE or DISABLE.
//  216   * @retval None
//  217   */

        SECTION `.near_func.text`:CODE:NOROOT(0)
        CODE
//  218 void SPI_CalculateCRCCmd(FunctionalState NewState)
//  219 {
SPI_CalculateCRCCmd:
        PUSH      S:?b8
        LD        S:?b8, A
//  220   /* Check function parameters */
//  221   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
        TNZ       S:?b8
        JREQ      L:??SPI_CalculateCRCCmd_0
        LD        A, S:?b8
        CP        A, #0x1
        JREQ      L:??SPI_CalculateCRCCmd_0
        LDW       X, #0xdd
        LDW       S:?w1, X
        CLRW      X
        LDW       S:?w0, X
        LDW       X, #`?<Constant "E:\\\\Desktop\\\\J19B_STM8\\\\...">`
        CALL      L:assert_failed
//  222   
//  223   if (NewState != DISABLE)
??SPI_CalculateCRCCmd_0:
        TNZ       S:?b8
        JREQ      L:??SPI_CalculateCRCCmd_1
//  224   {
//  225     SPI->CR2 |= SPI_CR2_CRCEN; /* Enable the CRC calculation*/
        BSET      L:0x5201, #0x5
        JRA       L:??SPI_CalculateCRCCmd_2
//  226   }
//  227   else
//  228   {
//  229     SPI->CR2 &= (uint8_t)(~SPI_CR2_CRCEN); /* Disable the CRC calculation*/
??SPI_CalculateCRCCmd_1:
        BRES      L:0x5201, #0x5
//  230   }
//  231 }
??SPI_CalculateCRCCmd_2:
        POP       S:?b8
        RET

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
SPI_ResetCRC:
        LD        A, #0x1
        CALL      L:SPI_CalculateCRCCmd
        LD        A, #0x1
        JP        L:SPI_Cmd

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
SPI_ITConfig:
        CALL      L:?push_w4
        LD        S:?b8, A
        MOV       S:?b9, S:?b0
        CLR       S:?b0
        LD        A, S:?b8
        CP        A, #0x17
        JREQ      L:??SPI_ITConfig_0
        LD        A, S:?b8
        CP        A, #0x6
        JREQ      L:??SPI_ITConfig_0
        LD        A, S:?b8
        CP        A, #0x5
        JREQ      L:??SPI_ITConfig_0
        LD        A, S:?b8
        CP        A, #0x34
        JREQ      L:??SPI_ITConfig_0
        LDW       X, #0x91
        LDW       S:?w1, X
        CLRW      X
        LDW       S:?w0, X
        LDW       X, #`?<Constant "E:\\\\Desktop\\\\J19B_STM8\\\\...">`
        CALL      L:assert_failed
??SPI_ITConfig_0:
        TNZ       S:?b9
        JREQ      L:??SPI_ITConfig_1
        LD        A, S:?b9
        CP        A, #0x1
        JREQ      L:??SPI_ITConfig_1
        LDW       X, #0x92
        LDW       S:?w1, X
        CLRW      X
        LDW       S:?w0, X
        LDW       X, #`?<Constant "E:\\\\Desktop\\\\J19B_STM8\\\\...">`
        CALL      L:assert_failed
??SPI_ITConfig_1:
        LD        A, S:?b8
        AND       A, #0xf
        CLRW      X
        INCW      X
        CALL      L:?sll16_x_x_a
        EXG       A, XL
        LD        S:?b0, A
        EXG       A, XL
        TNZ       S:?b9
        JREQ      L:??SPI_ITConfig_2
        LD        A, S:?b0
        OR        A, L:0x5202
        LD        L:0x5202, A
        JP        L:?epilogue_w4
??SPI_ITConfig_2:
        CPL       S:?b0
        LD        A, S:?b0
        AND       A, L:0x5202
        LD        L:0x5202, A
        JP        L:?epilogue_w4

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
SPI_SendData:
        LD        L:0x5204, A
        RET

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
SPI_ReceiveData:
        LD        A, L:0x5204
        RET

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
SPI_NSSInternalSoftwareCmd:
        PUSH      S:?b8
        LD        S:?b8, A
        TNZ       S:?b8
        JREQ      L:??SPI_NSSInternalSoftwareCmd_0
        LD        A, S:?b8
        CP        A, #0x1
        JREQ      L:??SPI_NSSInternalSoftwareCmd_0
        LDW       X, #0xbe
        LDW       S:?w1, X
        CLRW      X
        LDW       S:?w0, X
        LDW       X, #`?<Constant "E:\\\\Desktop\\\\J19B_STM8\\\\...">`
        CALL      L:assert_failed
??SPI_NSSInternalSoftwareCmd_0:
        TNZ       S:?b8
        JREQ      L:??SPI_NSSInternalSoftwareCmd_1
        BSET      L:0x5201, #0x0
        JRA       L:??SPI_NSSInternalSoftwareCmd_2
??SPI_NSSInternalSoftwareCmd_1:
        BRES      L:0x5201, #0x0
??SPI_NSSInternalSoftwareCmd_2:
        POP       S:?b8
        RET

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
SPI_TransmitCRC:
        BSET      L:0x5201, #0x4
        RET
//  232 
//  233 /**
//  234   * @brief  Returns the transmit or the receive CRC register value.
//  235   * @param  SPI_CRC Specifies the CRC register to be read.
//  236   * @retval The selected CRC register value.
//  237   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  238 uint8_t SPI_GetCRC(SPI_CRC_TypeDef SPI_CRC)
//  239 {
SPI_GetCRC:
        PUSH      S:?b8
        LD        S:?b8, A
//  240   uint8_t crcreg = 0;
        CLR       S:?b0
//  241   
//  242   /* Check function parameters */
//  243   assert_param(IS_SPI_CRC_OK(SPI_CRC));
        LD        A, S:?b8
        CP        A, #0x1
        JREQ      L:??SPI_GetCRC_0
        TNZ       S:?b8
        JREQ      L:??SPI_GetCRC_0
        LDW       X, #0xf3
        LDW       S:?w1, X
        CLRW      X
        LDW       S:?w0, X
        LDW       X, #`?<Constant "E:\\\\Desktop\\\\J19B_STM8\\\\...">`
        CALL      L:assert_failed
//  244   
//  245   if (SPI_CRC != SPI_CRC_RX)
??SPI_GetCRC_0:
        TNZ       S:?b8
        JREQ      L:??SPI_GetCRC_1
//  246   {
//  247     crcreg = SPI->TXCRCR;  /* Get the Tx CRC register*/
        LD        A, L:0x5207
        LD        S:?b0, A
        JRA       L:??SPI_GetCRC_2
//  248   }
//  249   else
//  250   {
//  251     crcreg = SPI->RXCRCR; /* Get the Rx CRC register*/
??SPI_GetCRC_1:
        LD        A, L:0x5206
        LD        S:?b0, A
//  252   }
//  253   
//  254   /* Return the selected CRC register status*/
//  255   return crcreg;
??SPI_GetCRC_2:
        LD        A, S:?b0
        POP       S:?b8
        RET
//  256 }
//  257 
//  258 /**
//  259   * @brief  Reset the Rx CRCR and Tx CRCR registers.
//  260   * @param  None
//  261   * @retval None
//  262   */
//  263 void SPI_ResetCRC(void)
//  264 {
//  265   /* Rx CRCR & Tx CRCR registers are reset when CRCEN (hardware calculation)
//  266   bit in SPI_CR2 is written to 1 (enable) */
//  267   SPI_CalculateCRCCmd(ENABLE);
//  268   
//  269   /* Previous function disable the SPI */
//  270   SPI_Cmd(ENABLE);
//  271 }
//  272 
//  273 /**
//  274   * @brief  Returns the CRC Polynomial register value.
//  275   * @param  None
//  276   * @retval The CRC Polynomial register value.
//  277   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  278 uint8_t SPI_GetCRCPolynomial(void)
//  279 {
//  280   return SPI->CRCPR; /* Return the CRC polynomial register */
SPI_GetCRCPolynomial:
        LD        A, L:0x5205
        RET
//  281 }
//  282 
//  283 /**
//  284   * @brief  Selects the data transfer direction in bi-directional mode.
//  285   * @param  SPI_Direction Specifies the data transfer direction in bi-directional mode.
//  286   * @retval None
//  287   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  288 void SPI_BiDirectionalLineConfig(SPI_Direction_TypeDef SPI_Direction)
//  289 {
SPI_BiDirectionalLineConfig:
        PUSH      S:?b8
        LD        S:?b8, A
//  290   /* Check function parameters */
//  291   assert_param(IS_SPI_DIRECTION_OK(SPI_Direction));
        TNZ       S:?b8
        JREQ      L:??SPI_BiDirectionalLineConfig_0
        LD        A, S:?b8
        CP        A, #0x1
        JREQ      L:??SPI_BiDirectionalLineConfig_0
        LDW       X, #0x123
        LDW       S:?w1, X
        CLRW      X
        LDW       S:?w0, X
        LDW       X, #`?<Constant "E:\\\\Desktop\\\\J19B_STM8\\\\...">`
        CALL      L:assert_failed
//  292   
//  293   if (SPI_Direction != SPI_DIRECTION_RX)
??SPI_BiDirectionalLineConfig_0:
        TNZ       S:?b8
        JREQ      L:??SPI_BiDirectionalLineConfig_1
//  294   {
//  295     SPI->CR2 |= SPI_CR2_BDOE; /* Set the Tx only mode*/
        BSET      L:0x5201, #0x6
        JRA       L:??SPI_BiDirectionalLineConfig_2
//  296   }
//  297   else
//  298   {
//  299     SPI->CR2 &= (uint8_t)(~SPI_CR2_BDOE); /* Set the Rx only mode*/
??SPI_BiDirectionalLineConfig_1:
        BRES      L:0x5201, #0x6
//  300   }
//  301 }
??SPI_BiDirectionalLineConfig_2:
        POP       S:?b8
        RET
//  302 
//  303 /**
//  304   * @brief  Checks whether the specified SPI flag is set or not.
//  305   * @param  SPI_FLAG : Specifies the flag to check.
//  306   *         This parameter can be any of the @ref SPI_FLAG_TypeDef enumeration.
//  307   * @retval FlagStatus : Indicates the state of SPI_FLAG.
//  308   *         This parameter can be any of the @ref FlagStatus enumeration.
//  309   */
//  310 

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  311 FlagStatus SPI_GetFlagStatus(SPI_Flag_TypeDef SPI_FLAG)
//  312 {
SPI_GetFlagStatus:
        PUSH      S:?b8
        LD        S:?b8, A
//  313   FlagStatus status = RESET;
        CLR       S:?b0
//  314   /* Check parameters */
//  315   assert_param(IS_SPI_FLAGS_OK(SPI_FLAG));
        LD        A, S:?b8
        CP        A, #0x40
        JREQ      L:??SPI_GetFlagStatus_0
        LD        A, S:?b8
        CP        A, #0x20
        JREQ      L:??SPI_GetFlagStatus_0
        LD        A, S:?b8
        CP        A, #0x10
        JREQ      L:??SPI_GetFlagStatus_0
        LD        A, S:?b8
        CP        A, #0x8
        JREQ      L:??SPI_GetFlagStatus_0
        LD        A, S:?b8
        CP        A, #0x2
        JREQ      L:??SPI_GetFlagStatus_0
        LD        A, S:?b8
        CP        A, #0x1
        JREQ      L:??SPI_GetFlagStatus_0
        LD        A, S:?b8
        CP        A, #0x80
        JREQ      L:??SPI_GetFlagStatus_0
        LDW       X, #0x13b
        LDW       S:?w1, X
        CLRW      X
        LDW       S:?w0, X
        LDW       X, #`?<Constant "E:\\\\Desktop\\\\J19B_STM8\\\\...">`
        CALL      L:assert_failed
//  316   
//  317   /* Check the status of the specified SPI flag */
//  318   if ((SPI->SR & (uint8_t)SPI_FLAG) != (uint8_t)RESET)
??SPI_GetFlagStatus_0:
        LD        A, S:?b8
        AND       A, L:0x5203
        CP        A, #0x0
        JREQ      L:??SPI_GetFlagStatus_1
//  319   {
//  320     status = SET; /* SPI_FLAG is set */
        MOV       S:?b0, #0x1
        JRA       L:??SPI_GetFlagStatus_2
//  321   }
//  322   else
//  323   {
//  324     status = RESET; /* SPI_FLAG is reset*/
??SPI_GetFlagStatus_1:
        CLR       S:?b0
//  325   }
//  326   
//  327   /* Return the SPI_FLAG status */
//  328   return status;
??SPI_GetFlagStatus_2:
        LD        A, S:?b0
        POP       S:?b8
        RET
//  329 }
//  330 
//  331 /**
//  332   * @brief  Clears the SPI flags.
//  333   * @param  SPI_FLAG : Specifies the flag to clear.
//  334   *         This parameter can be one of the following values:
//  335   *         - SPI_FLAG_CRCERR
//  336   *         - SPI_FLAG_WKUP
//  337   * @note   - OVR (OverRun Error) interrupt pending bit is cleared by software
//  338   *         sequence:
//  339   *         a read operation to SPI_DR register (SPI_ReceiveData()) followed by
//  340   *         a read operation to SPI_SR register (SPI_GetFlagStatus()).
//  341   *         - MODF (Mode Fault) interrupt pending bit is cleared by software sequence:
//  342   *         a read/write operation to SPI_SR register (SPI_GetFlagStatus()) followed by
//  343   *         a write operation to SPI_CR1 register (SPI_Cmd() to enable the SPI).
//  344   * @retval None
//  345   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  346 void SPI_ClearFlag(SPI_Flag_TypeDef SPI_FLAG)
//  347 {
SPI_ClearFlag:
        PUSH      S:?b8
        LD        S:?b8, A
//  348   assert_param(IS_SPI_CLEAR_FLAGS_OK(SPI_FLAG));
        LD        A, S:?b8
        CP        A, #0x10
        JREQ      L:??SPI_ClearFlag_0
        LD        A, S:?b8
        CP        A, #0x8
        JREQ      L:??SPI_ClearFlag_0
        LDW       X, #0x15c
        LDW       S:?w1, X
        CLRW      X
        LDW       S:?w0, X
        LDW       X, #`?<Constant "E:\\\\Desktop\\\\J19B_STM8\\\\...">`
        CALL      L:assert_failed
//  349   /* Clear the flag bit */
//  350   SPI->SR = (uint8_t)(~SPI_FLAG);
??SPI_ClearFlag_0:
        CPL       S:?b8
        LD        A, S:?b8
        LD        L:0x5203, A
//  351 }
        POP       S:?b8
        RET
//  352 
//  353 /**
//  354   * @brief  Checks whether the specified interrupt has occurred or not.
//  355   * @param  SPI_IT: Specifies the SPI interrupt pending bit to check.
//  356   *         This parameter can be one of the following values:
//  357   *         - SPI_IT_CRCERR
//  358   *         - SPI_IT_WKUP
//  359   *         - SPI_IT_OVR
//  360   *         - SPI_IT_MODF
//  361   *         - SPI_IT_RXNE
//  362   *         - SPI_IT_TXE
//  363   * @retval ITStatus : Indicates the state of the SPI_IT.
//  364   *         This parameter can be any of the @ref ITStatus enumeration.
//  365   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  366 ITStatus SPI_GetITStatus(SPI_IT_TypeDef SPI_IT)
//  367 {
SPI_GetITStatus:
        PUSH      S:?b8
        LD        S:?b8, A
//  368   ITStatus pendingbitstatus = RESET;
        CLR       S:?b2
//  369   uint8_t itpos = 0;
        CLR       S:?b0
//  370   uint8_t itmask1 = 0;
        CLR       S:?b3
//  371   uint8_t itmask2 = 0;
        CLR       S:?b1
//  372   uint8_t enablestatus = 0;
        CLR       S:?b4
//  373   assert_param(IS_SPI_GET_IT_OK(SPI_IT));
        LD        A, S:?b8
        CP        A, #0x65
        JREQ      L:??SPI_GetITStatus_0
        LD        A, S:?b8
        CP        A, #0x55
        JREQ      L:??SPI_GetITStatus_0
        LD        A, S:?b8
        CP        A, #0x45
        JREQ      L:??SPI_GetITStatus_0
        LD        A, S:?b8
        CP        A, #0x34
        JREQ      L:??SPI_GetITStatus_0
        LD        A, S:?b8
        CP        A, #0x17
        JREQ      L:??SPI_GetITStatus_0
        LD        A, S:?b8
        CP        A, #0x6
        JREQ      L:??SPI_GetITStatus_0
        LDW       X, #0x175
        LDW       S:?w1, X
        CLRW      X
        LDW       S:?w0, X
        LDW       X, #`?<Constant "E:\\\\Desktop\\\\J19B_STM8\\\\...">`
        CALL      L:assert_failed
//  374   /* Get the SPI IT index */
//  375   itpos = (uint8_t)((uint8_t)1 << ((uint8_t)SPI_IT & (uint8_t)0x0F));
??SPI_GetITStatus_0:
        LD        A, S:?b8
        AND       A, #0xf
        CLRW      X
        INCW      X
        CALL      L:?sll16_x_x_a
        EXG       A, XL
        LD        S:?b0, A
        EXG       A, XL
//  376   
//  377   /* Get the SPI IT mask */
//  378   itmask1 = (uint8_t)((uint8_t)SPI_IT >> (uint8_t)4);
        LD        A, S:?b8
        SWAP      A
        AND       A, #0xf
        LD        S:?b3, A
//  379   /* Set the IT mask */
//  380   itmask2 = (uint8_t)((uint8_t)1 << itmask1);
        CLRW      X
        INCW      X
        LD        A, S:?b3
        CALL      L:?sll16_x_x_a
        EXG       A, XL
        LD        S:?b1, A
        EXG       A, XL
//  381   /* Get the SPI_ITPENDINGBIT enable bit status */
//  382   enablestatus = (uint8_t)((uint8_t)SPI->SR & itmask2);
        LD        A, S:?b1
        AND       A, L:0x5203
        LD        S:?b4, A
//  383   /* Check the status of the specified SPI interrupt */
//  384   if (((SPI->ICR & itpos) != RESET) && enablestatus)
        LD        A, S:?b0
        AND       A, L:0x5202
        CP        A, #0x0
        JREQ      L:??SPI_GetITStatus_1
        TNZ       S:?b4
        JREQ      L:??SPI_GetITStatus_1
//  385   {
//  386     /* SPI_ITPENDINGBIT is set */
//  387     pendingbitstatus = SET;
        MOV       S:?b2, #0x1
        JRA       L:??SPI_GetITStatus_2
//  388   }
//  389   else
//  390   {
//  391     /* SPI_ITPENDINGBIT is reset */
//  392     pendingbitstatus = RESET;
??SPI_GetITStatus_1:
        CLR       S:?b2
//  393   }
//  394   /* Return the SPI_ITPENDINGBIT status */
//  395   return  pendingbitstatus;
??SPI_GetITStatus_2:
        LD        A, S:?b2
        POP       S:?b8
        RET
//  396 }
//  397 
//  398 /**
//  399   * @brief  Clears the interrupt pending bits.
//  400   * @param  SPI_IT: Specifies the interrupt pending bit to clear.
//  401   *         This parameter can be one of the following values:
//  402   *         - SPI_IT_CRCERR
//  403   *         - SPI_IT_WKUP
//  404   * @note   - OVR (OverRun Error) interrupt pending bit is cleared by software sequence:
//  405   *         a read operation to SPI_DR register (SPI_ReceiveData()) followed by
//  406   *         a read operation to SPI_SR register (SPI_GetITStatus()).
//  407   *         - MODF (Mode Fault) interrupt pending bit is cleared by software sequence:
//  408   *         a read/write operation to SPI_SR register (SPI_GetITStatus()) followed by
//  409   *         a write operation to SPI_CR1 register (SPI_Cmd() to enable the SPI).
//  410   * @retval None
//  411   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  412 void SPI_ClearITPendingBit(SPI_IT_TypeDef SPI_IT)
//  413 {
SPI_ClearITPendingBit:
        PUSH      S:?b8
        LD        S:?b8, A
//  414   uint8_t itpos = 0;
        CLR       S:?b0
//  415   assert_param(IS_SPI_CLEAR_IT_OK(SPI_IT));
        LD        A, S:?b8
        CP        A, #0x45
        JREQ      L:??SPI_ClearITPendingBit_0
        LD        A, S:?b8
        CP        A, #0x34
        JREQ      L:??SPI_ClearITPendingBit_0
        LDW       X, #0x19f
        LDW       S:?w1, X
        CLRW      X
        LDW       S:?w0, X
        LDW       X, #`?<Constant "E:\\\\Desktop\\\\J19B_STM8\\\\...">`
        CALL      L:assert_failed
//  416   
//  417   /* Clear  SPI_IT_CRCERR or SPI_IT_WKUP interrupt pending bits */
//  418   
//  419   /* Get the SPI pending bit index */
//  420   itpos = (uint8_t)((uint8_t)1 << (uint8_t)((uint8_t)(SPI_IT & (uint8_t)0xF0) >> 4));
??SPI_ClearITPendingBit_0:
        LD        A, S:?b8
        SWAP      A
        AND       A, #0xf
        CLRW      X
        INCW      X
        CALL      L:?sll16_x_x_a
        EXG       A, XL
        LD        S:?b0, A
        EXG       A, XL
//  421   /* Clear the pending bit */
//  422   SPI->SR = (uint8_t)(~itpos);
        CPL       S:?b0
        LD        A, S:?b0
        LD        L:0x5203, A
//  423   
//  424 }
        POP       S:?b8
        RET

        SECTION VREGS:DATA:REORDER:NOROOT(0)

        SECTION `.near.rodata`:CONST:REORDER:NOROOT(0)
`?<Constant "E:\\\\Desktop\\\\J19B_STM8\\\\...">`:
        DC8 "E:\\Desktop\\J19B_STM8\\Lib\\src\\stm8s_spi.c"

        END
//  425 
//  426 /**
//  427   * @}
//  428   */
//  429   
//  430 /**
//  431   * @}
//  432   */
//  433   
//  434 
//  435 /************************ (C) COPYRIGHT STMicroelectronics *****END OF FILE****/
// 
//    41 bytes in section .near.rodata
// 1 039 bytes in section .near_func.text
// 
// 1 039 bytes of CODE  memory
//    41 bytes of CONST memory
//
//Errors: none
//Warnings: none
