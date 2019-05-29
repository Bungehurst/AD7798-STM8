///////////////////////////////////////////////////////////////////////////////
//                                                                            /
//                                                      28/May/2019  16:13:16 /
// IAR C/C++ Compiler V1.31.1.20058 [Evaluation] for STM8                     /
// Copyright 2010-2012 IAR Systems AB.                                        /
//                                                                            /
//    Source file  =  E:\Desktop\J19B_STM8\Lib\src\stm8s_tim1.c               /
//    Command line =  E:\Desktop\J19B_STM8\Lib\src\stm8s_tim1.c -e -Ol        /
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
//    List file    =  E:\Desktop\J19B_STM8\Debug\List\stm8s_tim1.s            /
//                                                                            /
//                                                                            /
///////////////////////////////////////////////////////////////////////////////

        NAME stm8s_tim1

        EXTERN ?b0
        EXTERN ?b1
        EXTERN ?b10
        EXTERN ?b11
        EXTERN ?b12
        EXTERN ?b13
        EXTERN ?b14
        EXTERN ?b2
        EXTERN ?b3
        EXTERN ?b4
        EXTERN ?b5
        EXTERN ?b8
        EXTERN ?b9
        EXTERN ?epilogue_l2
        EXTERN ?epilogue_l2_w6
        EXTERN ?epilogue_w4
        EXTERN ?pop_w5
        EXTERN ?push_l2
        EXTERN ?push_w4
        EXTERN ?push_w5
        EXTERN ?push_w6
        EXTERN ?w0
        EXTERN ?w1
        EXTERN ?w4
        EXTERN ?w5
        EXTERN ?w6
        EXTERN assert_failed

        PUBLIC TIM1_ARRPreloadConfig
        PUBLIC TIM1_BDTRConfig
        PUBLIC TIM1_CCPreloadControl
        PUBLIC TIM1_CCxCmd
        PUBLIC TIM1_CCxNCmd
        PUBLIC TIM1_ClearFlag
        PUBLIC TIM1_ClearITPendingBit
        PUBLIC TIM1_Cmd
        PUBLIC TIM1_CounterModeConfig
        PUBLIC TIM1_CtrlPWMOutputs
        PUBLIC TIM1_DeInit
        PUBLIC TIM1_ETRClockMode1Config
        PUBLIC TIM1_ETRClockMode2Config
        PUBLIC TIM1_ETRConfig
        PUBLIC TIM1_EncoderInterfaceConfig
        PUBLIC TIM1_ForcedOC1Config
        PUBLIC TIM1_ForcedOC2Config
        PUBLIC TIM1_ForcedOC3Config
        PUBLIC TIM1_ForcedOC4Config
        PUBLIC TIM1_GenerateEvent
        PUBLIC TIM1_GetCapture1
        PUBLIC TIM1_GetCapture2
        PUBLIC TIM1_GetCapture3
        PUBLIC TIM1_GetCapture4
        PUBLIC TIM1_GetCounter
        PUBLIC TIM1_GetFlagStatus
        PUBLIC TIM1_GetITStatus
        PUBLIC TIM1_GetPrescaler
        PUBLIC TIM1_ICInit
        PUBLIC TIM1_ITConfig
        PUBLIC TIM1_InternalClockConfig
        PUBLIC TIM1_OC1FastConfig
        PUBLIC TIM1_OC1Init
        PUBLIC TIM1_OC1NPolarityConfig
        PUBLIC TIM1_OC1PolarityConfig
        PUBLIC TIM1_OC1PreloadConfig
        PUBLIC TIM1_OC2FastConfig
        PUBLIC TIM1_OC2Init
        PUBLIC TIM1_OC2NPolarityConfig
        PUBLIC TIM1_OC2PolarityConfig
        PUBLIC TIM1_OC2PreloadConfig
        PUBLIC TIM1_OC3FastConfig
        PUBLIC TIM1_OC3Init
        PUBLIC TIM1_OC3NPolarityConfig
        PUBLIC TIM1_OC3PolarityConfig
        PUBLIC TIM1_OC3PreloadConfig
        PUBLIC TIM1_OC4FastConfig
        PUBLIC TIM1_OC4Init
        PUBLIC TIM1_OC4PolarityConfig
        PUBLIC TIM1_OC4PreloadConfig
        PUBLIC TIM1_PWMIConfig
        PUBLIC TIM1_PrescalerConfig
        PUBLIC TIM1_SelectCOM
        PUBLIC TIM1_SelectHallSensor
        PUBLIC TIM1_SelectInputTrigger
        PUBLIC TIM1_SelectMasterSlaveMode
        PUBLIC TIM1_SelectOCxM
        PUBLIC TIM1_SelectOnePulseMode
        PUBLIC TIM1_SelectOutputTrigger
        PUBLIC TIM1_SelectSlaveMode
        PUBLIC TIM1_SetAutoreload
        PUBLIC TIM1_SetCompare1
        PUBLIC TIM1_SetCompare2
        PUBLIC TIM1_SetCompare3
        PUBLIC TIM1_SetCompare4
        PUBLIC TIM1_SetCounter
        PUBLIC TIM1_SetIC1Prescaler
        PUBLIC TIM1_SetIC2Prescaler
        PUBLIC TIM1_SetIC3Prescaler
        PUBLIC TIM1_SetIC4Prescaler
        PUBLIC TIM1_TIxExternalClockConfig
        PUBLIC TIM1_TimeBaseInit
        PUBLIC TIM1_UpdateDisableConfig
        PUBLIC TIM1_UpdateRequestConfig

// E:\Desktop\J19B_STM8\Lib\src\stm8s_tim1.c
//    1 /**
//    2   ******************************************************************************
//    3   * @file    stm8s_tim1.c
//    4   * @author  MCD Application Team
//    5   * @version V2.2.0
//    6   * @date    30-September-2014
//    7   * @brief   This file contains all the functions for the TIM1 peripheral.
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
//   29 #include "stm8s_tim1.h"
//   30 
//   31 /** @addtogroup STM8S_StdPeriph_Driver
//   32   * @{
//   33   */
//   34 /* Private typedef -----------------------------------------------------------*/
//   35 /* Private define ------------------------------------------------------------*/
//   36 /* Private macro -------------------------------------------------------------*/
//   37 /* Private variables ---------------------------------------------------------*/
//   38 /* Private function prototypes -----------------------------------------------*/
//   39 static void TI1_Config(uint8_t TIM1_ICPolarity, uint8_t TIM1_ICSelection,
//   40                        uint8_t TIM1_ICFilter);
//   41 static void TI2_Config(uint8_t TIM1_ICPolarity, uint8_t TIM1_ICSelection,
//   42                        uint8_t TIM1_ICFilter);
//   43 static void TI3_Config(uint8_t TIM1_ICPolarity, uint8_t TIM1_ICSelection,
//   44                        uint8_t TIM1_ICFilter);
//   45 static void TI4_Config(uint8_t TIM1_ICPolarity, uint8_t TIM1_ICSelection,
//   46                        uint8_t TIM1_ICFilter);
//   47 
//   48 /**
//   49   * @addtogroup TIM1_Public_Functions
//   50   * @{
//   51   */
//   52 
//   53 /**
//   54   * @brief  Deinitializes the TIM1 peripheral registers to their default reset values.
//   55   * @param  None
//   56   * @retval None
//   57   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//   58 void TIM1_DeInit(void)
//   59 {
//   60   TIM1->CR1  = TIM1_CR1_RESET_VALUE;
TIM1_DeInit:
        MOV       L:0x5250, #0x0
//   61   TIM1->CR2  = TIM1_CR2_RESET_VALUE;
        MOV       L:0x5251, #0x0
//   62   TIM1->SMCR = TIM1_SMCR_RESET_VALUE;
        MOV       L:0x5252, #0x0
//   63   TIM1->ETR  = TIM1_ETR_RESET_VALUE;
        MOV       L:0x5253, #0x0
//   64   TIM1->IER  = TIM1_IER_RESET_VALUE;
        MOV       L:0x5254, #0x0
//   65   TIM1->SR2  = TIM1_SR2_RESET_VALUE;
        MOV       L:0x5256, #0x0
//   66   /* Disable channels */
//   67   TIM1->CCER1 = TIM1_CCER1_RESET_VALUE;
        MOV       L:0x525c, #0x0
//   68   TIM1->CCER2 = TIM1_CCER2_RESET_VALUE;
        MOV       L:0x525d, #0x0
//   69   /* Configure channels as inputs: it is necessary if lock level is equal to 2 or 3 */
//   70   TIM1->CCMR1 = 0x01;
        MOV       L:0x5258, #0x1
//   71   TIM1->CCMR2 = 0x01;
        MOV       L:0x5259, #0x1
//   72   TIM1->CCMR3 = 0x01;
        MOV       L:0x525a, #0x1
//   73   TIM1->CCMR4 = 0x01;
        MOV       L:0x525b, #0x1
//   74   /* Then reset channel registers: it also works if lock level is equal to 2 or 3 */
//   75   TIM1->CCER1 = TIM1_CCER1_RESET_VALUE;
        MOV       L:0x525c, #0x0
//   76   TIM1->CCER2 = TIM1_CCER2_RESET_VALUE;
        MOV       L:0x525d, #0x0
//   77   TIM1->CCMR1 = TIM1_CCMR1_RESET_VALUE;
        MOV       L:0x5258, #0x0
//   78   TIM1->CCMR2 = TIM1_CCMR2_RESET_VALUE;
        MOV       L:0x5259, #0x0
//   79   TIM1->CCMR3 = TIM1_CCMR3_RESET_VALUE;
        MOV       L:0x525a, #0x0
//   80   TIM1->CCMR4 = TIM1_CCMR4_RESET_VALUE;
        MOV       L:0x525b, #0x0
//   81   TIM1->CNTRH = TIM1_CNTRH_RESET_VALUE;
        MOV       L:0x525e, #0x0
//   82   TIM1->CNTRL = TIM1_CNTRL_RESET_VALUE;
        MOV       L:0x525f, #0x0
//   83   TIM1->PSCRH = TIM1_PSCRH_RESET_VALUE;
        MOV       L:0x5260, #0x0
//   84   TIM1->PSCRL = TIM1_PSCRL_RESET_VALUE;
        MOV       L:0x5261, #0x0
//   85   TIM1->ARRH  = TIM1_ARRH_RESET_VALUE;
        MOV       L:0x5262, #0xff
//   86   TIM1->ARRL  = TIM1_ARRL_RESET_VALUE;
        MOV       L:0x5263, #0xff
//   87   TIM1->CCR1H = TIM1_CCR1H_RESET_VALUE;
        MOV       L:0x5265, #0x0
//   88   TIM1->CCR1L = TIM1_CCR1L_RESET_VALUE;
        MOV       L:0x5266, #0x0
//   89   TIM1->CCR2H = TIM1_CCR2H_RESET_VALUE;
        MOV       L:0x5267, #0x0
//   90   TIM1->CCR2L = TIM1_CCR2L_RESET_VALUE;
        MOV       L:0x5268, #0x0
//   91   TIM1->CCR3H = TIM1_CCR3H_RESET_VALUE;
        MOV       L:0x5269, #0x0
//   92   TIM1->CCR3L = TIM1_CCR3L_RESET_VALUE;
        MOV       L:0x526a, #0x0
//   93   TIM1->CCR4H = TIM1_CCR4H_RESET_VALUE;
        MOV       L:0x526b, #0x0
//   94   TIM1->CCR4L = TIM1_CCR4L_RESET_VALUE;
        MOV       L:0x526c, #0x0
//   95   TIM1->OISR  = TIM1_OISR_RESET_VALUE;
        MOV       L:0x526f, #0x0
//   96   TIM1->EGR   = 0x01; /* TIM1_EGR_UG */
        MOV       L:0x5257, #0x1
//   97   TIM1->DTR   = TIM1_DTR_RESET_VALUE;
        MOV       L:0x526e, #0x0
//   98   TIM1->BKR   = TIM1_BKR_RESET_VALUE;
        MOV       L:0x526d, #0x0
//   99   TIM1->RCR   = TIM1_RCR_RESET_VALUE;
        MOV       L:0x5264, #0x0
//  100   TIM1->SR1   = TIM1_SR1_RESET_VALUE;
        MOV       L:0x5255, #0x0
//  101 }
        RET
//  102 
//  103 /**
//  104   * @brief  Initializes the TIM1 Time Base Unit according to the specified parameters.
//  105   * @param  TIM1_Prescaler specifies the Prescaler value.
//  106   * @param  TIM1_CounterMode specifies the counter mode  from @ref TIM1_CounterMode_TypeDef .
//  107   * @param  TIM1_Period specifies the Period value.
//  108   * @param  TIM1_RepetitionCounter specifies the Repetition counter value
//  109   * @retval None
//  110   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  111 void TIM1_TimeBaseInit(uint16_t TIM1_Prescaler,
//  112                        TIM1_CounterMode_TypeDef TIM1_CounterMode,
//  113                        uint16_t TIM1_Period,
//  114                        uint8_t TIM1_RepetitionCounter)
//  115 {
TIM1_TimeBaseInit:
        CALL      L:?push_l2
        CALL      L:?push_w6
        LDW       S:?w5, X
        LD        S:?b9, A
        LDW       S:?w6, Y
        MOV       S:?b8, S:?b0
//  116   /* Check parameters */
//  117   assert_param(IS_TIM1_COUNTER_MODE_OK(TIM1_CounterMode));
        TNZ       S:?b9
        JREQ      L:??TIM1_TimeBaseInit_0
        LD        A, S:?b9
        CP        A, #0x10
        JREQ      L:??TIM1_TimeBaseInit_0
        LD        A, S:?b9
        CP        A, #0x20
        JREQ      L:??TIM1_TimeBaseInit_0
        LD        A, S:?b9
        CP        A, #0x40
        JREQ      L:??TIM1_TimeBaseInit_0
        LD        A, S:?b9
        CP        A, #0x60
        JREQ      L:??TIM1_TimeBaseInit_0
        LDW       X, #0x75
        LDW       S:?w1, X
        CLRW      X
        LDW       S:?w0, X
        LDW       X, #`?<Constant "E:\\\\Desktop\\\\J19B_STM8\\\\...">`
        CALL      L:assert_failed
//  118   
//  119   /* Set the Autoreload value */
//  120   TIM1->ARRH = (uint8_t)(TIM1_Period >> 8);
??TIM1_TimeBaseInit_0:
        LDW       X, S:?w6
        CLR       A
        RRWA      X, A
        LD        A, XL
        LD        L:0x5262, A
//  121   TIM1->ARRL = (uint8_t)(TIM1_Period);
        LD        A, S:?b13
        LD        L:0x5263, A
//  122   
//  123   /* Set the Prescaler value */
//  124   TIM1->PSCRH = (uint8_t)(TIM1_Prescaler >> 8);
        LDW       X, S:?w5
        CLR       A
        RRWA      X, A
        LD        A, XL
        LD        L:0x5260, A
//  125   TIM1->PSCRL = (uint8_t)(TIM1_Prescaler);
        LD        A, S:?b11
        LD        L:0x5261, A
//  126   
//  127   /* Select the Counter Mode */
//  128   TIM1->CR1 = (uint8_t)((uint8_t)(TIM1->CR1 & (uint8_t)(~(TIM1_CR1_CMS | TIM1_CR1_DIR)))
//  129                         | (uint8_t)(TIM1_CounterMode));
        LD        A, L:0x5250
        AND       A, #0x8f
        OR        A, S:?b9
        LD        L:0x5250, A
//  130   
//  131   /* Set the Repetition Counter value */
//  132   TIM1->RCR = TIM1_RepetitionCounter;
        LD        A, S:?b8
        LD        L:0x5264, A
//  133 }
        JP        L:?epilogue_l2_w6
//  134 
//  135 /**
//  136   * @brief  Initializes the TIM1 Channel1 according to the specified parameters.
//  137   * @param  TIM1_OCMode specifies the Output Compare mode from 
//  138   *         @ref TIM1_OCMode_TypeDef.
//  139   * @param  TIM1_OutputState specifies the Output State from 
//  140   *         @ref TIM1_OutputState_TypeDef.
//  141   * @param  TIM1_OutputNState specifies the Complementary Output State 
//  142   *         from @ref TIM1_OutputNState_TypeDef.
//  143   * @param  TIM1_Pulse specifies the Pulse width value.
//  144   * @param  TIM1_OCPolarity specifies the Output Compare Polarity from 
//  145   *         @ref TIM1_OCPolarity_TypeDef.
//  146   * @param  TIM1_OCNPolarity specifies the Complementary Output Compare Polarity
//  147   *         from @ref TIM1_OCNPolarity_TypeDef.
//  148   * @param  TIM1_OCIdleState specifies the Output Compare Idle State from 
//  149   *         @ref TIM1_OCIdleState_TypeDef.
//  150   * @param  TIM1_OCNIdleState specifies the Complementary Output Compare Idle 
//  151   *         State from @ref TIM1_OCIdleState_TypeDef.
//  152   * @retval None
//  153   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  154 void TIM1_OC1Init(TIM1_OCMode_TypeDef TIM1_OCMode,
//  155                   TIM1_OutputState_TypeDef TIM1_OutputState,
//  156                   TIM1_OutputNState_TypeDef TIM1_OutputNState,
//  157                   uint16_t TIM1_Pulse,
//  158                   TIM1_OCPolarity_TypeDef TIM1_OCPolarity,
//  159                   TIM1_OCNPolarity_TypeDef TIM1_OCNPolarity,
//  160                   TIM1_OCIdleState_TypeDef TIM1_OCIdleState,
//  161                   TIM1_OCNIdleState_TypeDef TIM1_OCNIdleState)
//  162 {
TIM1_OC1Init:
        CALL      L:?push_l2
        CALL      L:?push_w6
        PUSH      S:?b14
        PUSHW     X
        LD        S:?b8, A
        MOV       S:?b14, S:?b0
        MOV       S:?b13, S:?b1
        MOV       S:?b12, S:?b2
        MOV       S:?b9, S:?b3
        MOV       S:?b10, S:?b4
        MOV       S:?b11, S:?b5
//  163   /* Check the parameters */
//  164   assert_param(IS_TIM1_OC_MODE_OK(TIM1_OCMode));
        TNZ       S:?b8
        JREQ      L:??TIM1_OC1Init_0
        LD        A, S:?b8
        CP        A, #0x10
        JREQ      L:??TIM1_OC1Init_0
        LD        A, S:?b8
        CP        A, #0x20
        JREQ      L:??TIM1_OC1Init_0
        LD        A, S:?b8
        CP        A, #0x30
        JREQ      L:??TIM1_OC1Init_0
        LD        A, S:?b8
        CP        A, #0x60
        JREQ      L:??TIM1_OC1Init_0
        LD        A, S:?b8
        CP        A, #0x70
        JREQ      L:??TIM1_OC1Init_0
        LDW       X, #0xa4
        LDW       S:?w1, X
        CLRW      X
        LDW       S:?w0, X
        LDW       X, #`?<Constant "E:\\\\Desktop\\\\J19B_STM8\\\\...">`
        CALL      L:assert_failed
//  165   assert_param(IS_TIM1_OUTPUT_STATE_OK(TIM1_OutputState));
??TIM1_OC1Init_0:
        TNZ       S:?b14
        JREQ      L:??TIM1_OC1Init_1
        LD        A, S:?b14
        CP        A, #0x11
        JREQ      L:??TIM1_OC1Init_1
        LDW       X, #0xa5
        LDW       S:?w1, X
        CLRW      X
        LDW       S:?w0, X
        LDW       X, #`?<Constant "E:\\\\Desktop\\\\J19B_STM8\\\\...">`
        CALL      L:assert_failed
//  166   assert_param(IS_TIM1_OUTPUTN_STATE_OK(TIM1_OutputNState));
??TIM1_OC1Init_1:
        TNZ       S:?b13
        JREQ      L:??TIM1_OC1Init_2
        LD        A, S:?b13
        CP        A, #0x44
        JREQ      L:??TIM1_OC1Init_2
        LDW       X, #0xa6
        LDW       S:?w1, X
        CLRW      X
        LDW       S:?w0, X
        LDW       X, #`?<Constant "E:\\\\Desktop\\\\J19B_STM8\\\\...">`
        CALL      L:assert_failed
//  167   assert_param(IS_TIM1_OC_POLARITY_OK(TIM1_OCPolarity));
??TIM1_OC1Init_2:
        TNZ       S:?b12
        JREQ      L:??TIM1_OC1Init_3
        LD        A, S:?b12
        CP        A, #0x22
        JREQ      L:??TIM1_OC1Init_3
        LDW       X, #0xa7
        LDW       S:?w1, X
        CLRW      X
        LDW       S:?w0, X
        LDW       X, #`?<Constant "E:\\\\Desktop\\\\J19B_STM8\\\\...">`
        CALL      L:assert_failed
//  168   assert_param(IS_TIM1_OCN_POLARITY_OK(TIM1_OCNPolarity));
??TIM1_OC1Init_3:
        TNZ       S:?b9
        JREQ      L:??TIM1_OC1Init_4
        LD        A, S:?b9
        CP        A, #0x88
        JREQ      L:??TIM1_OC1Init_4
        LDW       X, #0xa8
        LDW       S:?w1, X
        CLRW      X
        LDW       S:?w0, X
        LDW       X, #`?<Constant "E:\\\\Desktop\\\\J19B_STM8\\\\...">`
        CALL      L:assert_failed
//  169   assert_param(IS_TIM1_OCIDLE_STATE_OK(TIM1_OCIdleState));
??TIM1_OC1Init_4:
        LD        A, S:?b10
        CP        A, #0x55
        JREQ      L:??TIM1_OC1Init_5
        TNZ       S:?b10
        JREQ      L:??TIM1_OC1Init_5
        LDW       X, #0xa9
        LDW       S:?w1, X
        CLRW      X
        LDW       S:?w0, X
        LDW       X, #`?<Constant "E:\\\\Desktop\\\\J19B_STM8\\\\...">`
        CALL      L:assert_failed
//  170   assert_param(IS_TIM1_OCNIDLE_STATE_OK(TIM1_OCNIdleState));
??TIM1_OC1Init_5:
        LD        A, S:?b11
        CP        A, #0x2a
        JREQ      L:??TIM1_OC1Init_6
        TNZ       S:?b11
        JREQ      L:??TIM1_OC1Init_6
        LDW       X, #0xaa
        LDW       S:?w1, X
        CLRW      X
        LDW       S:?w0, X
        LDW       X, #`?<Constant "E:\\\\Desktop\\\\J19B_STM8\\\\...">`
        CALL      L:assert_failed
//  171   
//  172   /* Disable the Channel 1: Reset the CCE Bit, Set the Output State , 
//  173   the Output N State, the Output Polarity & the Output N Polarity*/
//  174   TIM1->CCER1 &= (uint8_t)(~( TIM1_CCER1_CC1E | TIM1_CCER1_CC1NE 
//  175                              | TIM1_CCER1_CC1P | TIM1_CCER1_CC1NP));
??TIM1_OC1Init_6:
        LD        A, L:0x525c
        AND       A, #0xf0
        LD        L:0x525c, A
//  176   /* Set the Output State & Set the Output N State & Set the Output Polarity &
//  177   Set the Output N Polarity */
//  178   TIM1->CCER1 |= (uint8_t)((uint8_t)((uint8_t)(TIM1_OutputState & TIM1_CCER1_CC1E)
//  179                                      | (uint8_t)(TIM1_OutputNState & TIM1_CCER1_CC1NE))
//  180                            | (uint8_t)( (uint8_t)(TIM1_OCPolarity  & TIM1_CCER1_CC1P)
//  181                                        | (uint8_t)(TIM1_OCNPolarity & TIM1_CCER1_CC1NP)));
        LD        A, S:?b9
        AND       A, #0x8
        PUSH      A
        LD        A, S:?b12
        AND       A, #0x2
        LD        S:?b1, A
        POP       A
        OR        A, S:?b1
        PUSH      A
        LD        A, S:?b13
        AND       A, #0x4
        PUSH      A
        LD        A, S:?b14
        AND       A, #0x1
        LD        S:?b2, A
        POP       A
        OR        A, S:?b2
        LD        S:?b1, A
        POP       A
        OR        A, S:?b1
        OR        A, L:0x525c
        LD        L:0x525c, A
//  182   
//  183   /* Reset the Output Compare Bits & Set the Output Compare Mode */
//  184   TIM1->CCMR1 = (uint8_t)((uint8_t)(TIM1->CCMR1 & (uint8_t)(~TIM1_CCMR_OCM)) | 
//  185                           (uint8_t)TIM1_OCMode);
        LD        A, L:0x5258
        AND       A, #0x8f
        OR        A, S:?b8
        LD        L:0x5258, A
//  186   
//  187   /* Reset the Output Idle state & the Output N Idle state bits */
//  188   TIM1->OISR &= (uint8_t)(~(TIM1_OISR_OIS1 | TIM1_OISR_OIS1N));
        LD        A, L:0x526f
        AND       A, #0xfc
        LD        L:0x526f, A
//  189   /* Set the Output Idle state & the Output N Idle state configuration */
//  190   TIM1->OISR |= (uint8_t)((uint8_t)( TIM1_OCIdleState & TIM1_OISR_OIS1 ) | 
//  191                           (uint8_t)( TIM1_OCNIdleState & TIM1_OISR_OIS1N ));
        LD        A, S:?b11
        AND       A, #0x2
        PUSH      A
        LD        A, S:?b10
        AND       A, #0x1
        LD        S:?b1, A
        POP       A
        OR        A, S:?b1
        OR        A, L:0x526f
        LD        L:0x526f, A
//  192   
//  193   /* Set the Pulse value */
//  194   TIM1->CCR1H = (uint8_t)(TIM1_Pulse >> 8);
        LDW       X, (0x1,SP)
        CLR       A
        RRWA      X, A
        LD        A, XL
        LD        L:0x5265, A
//  195   TIM1->CCR1L = (uint8_t)(TIM1_Pulse);
        LD        A, (0x2,SP)
        LD        L:0x5266, A
//  196 }
        ADD       SP, #0x2
        POP       S:?b14
        JP        L:?epilogue_l2_w6
//  197 
//  198 /**
//  199   * @brief  Initializes the TIM1 Channel2 according to the specified parameters.
//  200   * @param  TIM1_OCMode specifies the Output Compare mode from
//  201   *         @ref TIM1_OCMode_TypeDef.
//  202   * @param  TIM1_OutputState specifies the Output State from 
//  203   *         @ref TIM1_OutputState_TypeDef.
//  204   * @param  TIM1_OutputNState specifies the Complementary Output State from 
//  205   *         @ref TIM1_OutputNState_TypeDef.
//  206   * @param  TIM1_Pulse specifies the Pulse width value.
//  207   * @param  TIM1_OCPolarity specifies the Output Compare Polarity from 
//  208   *         @ref TIM1_OCPolarity_TypeDef.
//  209   * @param  TIM1_OCNPolarity specifies the Complementary Output Compare Polarity
//  210   *         from @ref TIM1_OCNPolarity_TypeDef.
//  211   * @param  TIM1_OCIdleState specifies the Output Compare Idle State from 
//  212   *         @ref TIM1_OCIdleState_TypeDef.
//  213   * @param  TIM1_OCNIdleState specifies the Complementary Output Compare Idle 
//  214   *         State from @ref TIM1_OCIdleState_TypeDef.
//  215   * @retval None
//  216   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  217 void TIM1_OC2Init(TIM1_OCMode_TypeDef TIM1_OCMode,
//  218                   TIM1_OutputState_TypeDef TIM1_OutputState,
//  219                   TIM1_OutputNState_TypeDef TIM1_OutputNState,
//  220                   uint16_t TIM1_Pulse,
//  221                   TIM1_OCPolarity_TypeDef TIM1_OCPolarity,
//  222                   TIM1_OCNPolarity_TypeDef TIM1_OCNPolarity,
//  223                   TIM1_OCIdleState_TypeDef TIM1_OCIdleState,
//  224                   TIM1_OCNIdleState_TypeDef TIM1_OCNIdleState)
//  225 {
TIM1_OC2Init:
        CALL      L:?push_l2
        CALL      L:?push_w6
        PUSH      S:?b14
        PUSHW     X
        LD        S:?b8, A
        MOV       S:?b14, S:?b0
        MOV       S:?b13, S:?b1
        MOV       S:?b12, S:?b2
        MOV       S:?b9, S:?b3
        MOV       S:?b10, S:?b4
        MOV       S:?b11, S:?b5
//  226   /* Check the parameters */
//  227   assert_param(IS_TIM1_OC_MODE_OK(TIM1_OCMode));
        TNZ       S:?b8
        JREQ      L:??TIM1_OC2Init_0
        LD        A, S:?b8
        CP        A, #0x10
        JREQ      L:??TIM1_OC2Init_0
        LD        A, S:?b8
        CP        A, #0x20
        JREQ      L:??TIM1_OC2Init_0
        LD        A, S:?b8
        CP        A, #0x30
        JREQ      L:??TIM1_OC2Init_0
        LD        A, S:?b8
        CP        A, #0x60
        JREQ      L:??TIM1_OC2Init_0
        LD        A, S:?b8
        CP        A, #0x70
        JREQ      L:??TIM1_OC2Init_0
        LDW       X, #0xe3
        LDW       S:?w1, X
        CLRW      X
        LDW       S:?w0, X
        LDW       X, #`?<Constant "E:\\\\Desktop\\\\J19B_STM8\\\\...">`
        CALL      L:assert_failed
//  228   assert_param(IS_TIM1_OUTPUT_STATE_OK(TIM1_OutputState));
??TIM1_OC2Init_0:
        TNZ       S:?b14
        JREQ      L:??TIM1_OC2Init_1
        LD        A, S:?b14
        CP        A, #0x11
        JREQ      L:??TIM1_OC2Init_1
        LDW       X, #0xe4
        LDW       S:?w1, X
        CLRW      X
        LDW       S:?w0, X
        LDW       X, #`?<Constant "E:\\\\Desktop\\\\J19B_STM8\\\\...">`
        CALL      L:assert_failed
//  229   assert_param(IS_TIM1_OUTPUTN_STATE_OK(TIM1_OutputNState));
??TIM1_OC2Init_1:
        TNZ       S:?b13
        JREQ      L:??TIM1_OC2Init_2
        LD        A, S:?b13
        CP        A, #0x44
        JREQ      L:??TIM1_OC2Init_2
        LDW       X, #0xe5
        LDW       S:?w1, X
        CLRW      X
        LDW       S:?w0, X
        LDW       X, #`?<Constant "E:\\\\Desktop\\\\J19B_STM8\\\\...">`
        CALL      L:assert_failed
//  230   assert_param(IS_TIM1_OC_POLARITY_OK(TIM1_OCPolarity));
??TIM1_OC2Init_2:
        TNZ       S:?b12
        JREQ      L:??TIM1_OC2Init_3
        LD        A, S:?b12
        CP        A, #0x22
        JREQ      L:??TIM1_OC2Init_3
        LDW       X, #0xe6
        LDW       S:?w1, X
        CLRW      X
        LDW       S:?w0, X
        LDW       X, #`?<Constant "E:\\\\Desktop\\\\J19B_STM8\\\\...">`
        CALL      L:assert_failed
//  231   assert_param(IS_TIM1_OCN_POLARITY_OK(TIM1_OCNPolarity));
??TIM1_OC2Init_3:
        TNZ       S:?b9
        JREQ      L:??TIM1_OC2Init_4
        LD        A, S:?b9
        CP        A, #0x88
        JREQ      L:??TIM1_OC2Init_4
        LDW       X, #0xe7
        LDW       S:?w1, X
        CLRW      X
        LDW       S:?w0, X
        LDW       X, #`?<Constant "E:\\\\Desktop\\\\J19B_STM8\\\\...">`
        CALL      L:assert_failed
//  232   assert_param(IS_TIM1_OCIDLE_STATE_OK(TIM1_OCIdleState));
??TIM1_OC2Init_4:
        LD        A, S:?b10
        CP        A, #0x55
        JREQ      L:??TIM1_OC2Init_5
        TNZ       S:?b10
        JREQ      L:??TIM1_OC2Init_5
        LDW       X, #0xe8
        LDW       S:?w1, X
        CLRW      X
        LDW       S:?w0, X
        LDW       X, #`?<Constant "E:\\\\Desktop\\\\J19B_STM8\\\\...">`
        CALL      L:assert_failed
//  233   assert_param(IS_TIM1_OCNIDLE_STATE_OK(TIM1_OCNIdleState));
??TIM1_OC2Init_5:
        LD        A, S:?b11
        CP        A, #0x2a
        JREQ      L:??TIM1_OC2Init_6
        TNZ       S:?b11
        JREQ      L:??TIM1_OC2Init_6
        LDW       X, #0xe9
        LDW       S:?w1, X
        CLRW      X
        LDW       S:?w0, X
        LDW       X, #`?<Constant "E:\\\\Desktop\\\\J19B_STM8\\\\...">`
        CALL      L:assert_failed
//  234   
//  235   /* Disable the Channel 1: Reset the CCE Bit, Set the Output State , 
//  236   the Output N State, the Output Polarity & the Output N Polarity*/
//  237   TIM1->CCER1 &= (uint8_t)(~( TIM1_CCER1_CC2E | TIM1_CCER1_CC2NE | 
//  238                              TIM1_CCER1_CC2P | TIM1_CCER1_CC2NP));
??TIM1_OC2Init_6:
        LD        A, L:0x525c
        AND       A, #0xf
        LD        L:0x525c, A
//  239   
//  240   /* Set the Output State & Set the Output N State & Set the Output Polarity &
//  241   Set the Output N Polarity */
//  242   TIM1->CCER1 |= (uint8_t)((uint8_t)((uint8_t)(TIM1_OutputState & TIM1_CCER1_CC2E  ) | 
//  243                                      (uint8_t)(TIM1_OutputNState & TIM1_CCER1_CC2NE )) | 
//  244                            (uint8_t)((uint8_t)(TIM1_OCPolarity  & TIM1_CCER1_CC2P  ) | 
//  245                                      (uint8_t)(TIM1_OCNPolarity & TIM1_CCER1_CC2NP )));
        LD        A, S:?b13
        AND       A, #0x40
        PUSH      A
        LD        A, S:?b14
        AND       A, #0x10
        LD        S:?b1, A
        POP       A
        OR        A, S:?b1
        PUSH      A
        LD        A, S:?b12
        AND       A, #0x20
        LD        S:?b1, A
        POP       A
        OR        A, S:?b1
        LD        S:?b0, A
        LD        A, S:?b9
        AND       A, #0x80
        OR        A, S:?b0
        OR        A, L:0x525c
        LD        L:0x525c, A
//  246   
//  247   /* Reset the Output Compare Bits & Set the Output Compare Mode */
//  248   TIM1->CCMR2 = (uint8_t)((uint8_t)(TIM1->CCMR2 & (uint8_t)(~TIM1_CCMR_OCM)) | 
//  249                           (uint8_t)TIM1_OCMode);
        LD        A, L:0x5259
        AND       A, #0x8f
        OR        A, S:?b8
        LD        L:0x5259, A
//  250   
//  251   /* Reset the Output Idle state & the Output N Idle state bits */
//  252   TIM1->OISR &= (uint8_t)(~(TIM1_OISR_OIS2 | TIM1_OISR_OIS2N));
        LD        A, L:0x526f
        AND       A, #0xf3
        LD        L:0x526f, A
//  253   /* Set the Output Idle state & the Output N Idle state configuration */
//  254   TIM1->OISR |= (uint8_t)((uint8_t)(TIM1_OISR_OIS2 & TIM1_OCIdleState) | 
//  255                           (uint8_t)(TIM1_OISR_OIS2N & TIM1_OCNIdleState));
        LD        A, S:?b11
        AND       A, #0x8
        PUSH      A
        LD        A, S:?b10
        AND       A, #0x4
        LD        S:?b1, A
        POP       A
        OR        A, S:?b1
        OR        A, L:0x526f
        LD        L:0x526f, A
//  256   
//  257   /* Set the Pulse value */
//  258   TIM1->CCR2H = (uint8_t)(TIM1_Pulse >> 8);
        LDW       X, (0x1,SP)
        CLR       A
        RRWA      X, A
        LD        A, XL
        LD        L:0x5267, A
//  259   TIM1->CCR2L = (uint8_t)(TIM1_Pulse);
        LD        A, (0x2,SP)
        LD        L:0x5268, A
//  260 }
        ADD       SP, #0x2
        POP       S:?b14
        JP        L:?epilogue_l2_w6
//  261 
//  262 /**
//  263   * @brief  Initializes the TIM1 Channel3 according to the specified parameters.
//  264   * @param  TIM1_OCMode specifies the Output Compare mode  from 
//  265   *         @ref TIM1_OCMode_TypeDef.
//  266   * @param  TIM1_OutputState specifies the Output State  
//  267   *         from @ref TIM1_OutputState_TypeDef.
//  268   * @param  TIM1_OutputNState specifies the Complementary Output State
//  269   *         from @ref TIM1_OutputNState_TypeDef.
//  270   * @param  TIM1_Pulse specifies the Pulse width value.
//  271   * @param  TIM1_OCPolarity specifies the Output Compare Polarity  from 
//  272   *         @ref TIM1_OCPolarity_TypeDef.
//  273   * @param  TIM1_OCNPolarity specifies the Complementary  Output Compare 
//  274   *         Polarity from @ref TIM1_OCNPolarity_TypeDef.
//  275   * @param  TIM1_OCIdleState specifies the Output Compare Idle State
//  276   *         from @ref TIM1_OCIdleState_TypeDef.
//  277   * @param  TIM1_OCNIdleState specifies the Complementary Output Compare 
//  278   *         Idle State  from @ref TIM1_OCIdleState_TypeDef.
//  279   * @retval None
//  280   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  281 void TIM1_OC3Init(TIM1_OCMode_TypeDef TIM1_OCMode,
//  282                   TIM1_OutputState_TypeDef TIM1_OutputState,
//  283                   TIM1_OutputNState_TypeDef TIM1_OutputNState,
//  284                   uint16_t TIM1_Pulse,
//  285                   TIM1_OCPolarity_TypeDef TIM1_OCPolarity,
//  286                   TIM1_OCNPolarity_TypeDef TIM1_OCNPolarity,
//  287                   TIM1_OCIdleState_TypeDef TIM1_OCIdleState,
//  288                   TIM1_OCNIdleState_TypeDef TIM1_OCNIdleState)
//  289 {
TIM1_OC3Init:
        CALL      L:?push_l2
        CALL      L:?push_w6
        PUSH      S:?b14
        PUSHW     X
        LD        S:?b8, A
        MOV       S:?b14, S:?b0
        MOV       S:?b13, S:?b1
        MOV       S:?b12, S:?b2
        MOV       S:?b9, S:?b3
        MOV       S:?b10, S:?b4
        MOV       S:?b11, S:?b5
//  290   /* Check the parameters */
//  291   assert_param(IS_TIM1_OC_MODE_OK(TIM1_OCMode));
        TNZ       S:?b8
        JREQ      L:??TIM1_OC3Init_0
        LD        A, S:?b8
        CP        A, #0x10
        JREQ      L:??TIM1_OC3Init_0
        LD        A, S:?b8
        CP        A, #0x20
        JREQ      L:??TIM1_OC3Init_0
        LD        A, S:?b8
        CP        A, #0x30
        JREQ      L:??TIM1_OC3Init_0
        LD        A, S:?b8
        CP        A, #0x60
        JREQ      L:??TIM1_OC3Init_0
        LD        A, S:?b8
        CP        A, #0x70
        JREQ      L:??TIM1_OC3Init_0
        LDW       X, #0x123
        LDW       S:?w1, X
        CLRW      X
        LDW       S:?w0, X
        LDW       X, #`?<Constant "E:\\\\Desktop\\\\J19B_STM8\\\\...">`
        CALL      L:assert_failed
//  292   assert_param(IS_TIM1_OUTPUT_STATE_OK(TIM1_OutputState));
??TIM1_OC3Init_0:
        TNZ       S:?b14
        JREQ      L:??TIM1_OC3Init_1
        LD        A, S:?b14
        CP        A, #0x11
        JREQ      L:??TIM1_OC3Init_1
        LDW       X, #0x124
        LDW       S:?w1, X
        CLRW      X
        LDW       S:?w0, X
        LDW       X, #`?<Constant "E:\\\\Desktop\\\\J19B_STM8\\\\...">`
        CALL      L:assert_failed
//  293   assert_param(IS_TIM1_OUTPUTN_STATE_OK(TIM1_OutputNState));
??TIM1_OC3Init_1:
        TNZ       S:?b13
        JREQ      L:??TIM1_OC3Init_2
        LD        A, S:?b13
        CP        A, #0x44
        JREQ      L:??TIM1_OC3Init_2
        LDW       X, #0x125
        LDW       S:?w1, X
        CLRW      X
        LDW       S:?w0, X
        LDW       X, #`?<Constant "E:\\\\Desktop\\\\J19B_STM8\\\\...">`
        CALL      L:assert_failed
//  294   assert_param(IS_TIM1_OC_POLARITY_OK(TIM1_OCPolarity));
??TIM1_OC3Init_2:
        TNZ       S:?b12
        JREQ      L:??TIM1_OC3Init_3
        LD        A, S:?b12
        CP        A, #0x22
        JREQ      L:??TIM1_OC3Init_3
        LDW       X, #0x126
        LDW       S:?w1, X
        CLRW      X
        LDW       S:?w0, X
        LDW       X, #`?<Constant "E:\\\\Desktop\\\\J19B_STM8\\\\...">`
        CALL      L:assert_failed
//  295   assert_param(IS_TIM1_OCN_POLARITY_OK(TIM1_OCNPolarity));
??TIM1_OC3Init_3:
        TNZ       S:?b9
        JREQ      L:??TIM1_OC3Init_4
        LD        A, S:?b9
        CP        A, #0x88
        JREQ      L:??TIM1_OC3Init_4
        LDW       X, #0x127
        LDW       S:?w1, X
        CLRW      X
        LDW       S:?w0, X
        LDW       X, #`?<Constant "E:\\\\Desktop\\\\J19B_STM8\\\\...">`
        CALL      L:assert_failed
//  296   assert_param(IS_TIM1_OCIDLE_STATE_OK(TIM1_OCIdleState));
??TIM1_OC3Init_4:
        LD        A, S:?b10
        CP        A, #0x55
        JREQ      L:??TIM1_OC3Init_5
        TNZ       S:?b10
        JREQ      L:??TIM1_OC3Init_5
        LDW       X, #0x128
        LDW       S:?w1, X
        CLRW      X
        LDW       S:?w0, X
        LDW       X, #`?<Constant "E:\\\\Desktop\\\\J19B_STM8\\\\...">`
        CALL      L:assert_failed
//  297   assert_param(IS_TIM1_OCNIDLE_STATE_OK(TIM1_OCNIdleState));
??TIM1_OC3Init_5:
        LD        A, S:?b11
        CP        A, #0x2a
        JREQ      L:??TIM1_OC3Init_6
        TNZ       S:?b11
        JREQ      L:??TIM1_OC3Init_6
        LDW       X, #0x129
        LDW       S:?w1, X
        CLRW      X
        LDW       S:?w0, X
        LDW       X, #`?<Constant "E:\\\\Desktop\\\\J19B_STM8\\\\...">`
        CALL      L:assert_failed
//  298   
//  299   /* Disable the Channel 1: Reset the CCE Bit, Set the Output State , 
//  300   the Output N State, the Output Polarity & the Output N Polarity*/
//  301   TIM1->CCER2 &= (uint8_t)(~( TIM1_CCER2_CC3E | TIM1_CCER2_CC3NE | 
//  302                              TIM1_CCER2_CC3P | TIM1_CCER2_CC3NP));
??TIM1_OC3Init_6:
        LD        A, L:0x525d
        AND       A, #0xf0
        LD        L:0x525d, A
//  303   /* Set the Output State & Set the Output N State & Set the Output Polarity &
//  304   Set the Output N Polarity */
//  305   TIM1->CCER2 |= (uint8_t)((uint8_t)((uint8_t)(TIM1_OutputState  & TIM1_CCER2_CC3E   ) |
//  306                                      (uint8_t)(TIM1_OutputNState & TIM1_CCER2_CC3NE  )) | 
//  307                            (uint8_t)((uint8_t)(TIM1_OCPolarity   & TIM1_CCER2_CC3P   ) | 
//  308                                      (uint8_t)(TIM1_OCNPolarity  & TIM1_CCER2_CC3NP  )));
        LD        A, S:?b9
        AND       A, #0x8
        PUSH      A
        LD        A, S:?b12
        AND       A, #0x2
        LD        S:?b1, A
        POP       A
        OR        A, S:?b1
        PUSH      A
        LD        A, S:?b13
        AND       A, #0x4
        PUSH      A
        LD        A, S:?b14
        AND       A, #0x1
        LD        S:?b2, A
        POP       A
        OR        A, S:?b2
        LD        S:?b1, A
        POP       A
        OR        A, S:?b1
        OR        A, L:0x525d
        LD        L:0x525d, A
//  309   
//  310   /* Reset the Output Compare Bits & Set the Output Compare Mode */
//  311   TIM1->CCMR3 = (uint8_t)((uint8_t)(TIM1->CCMR3 & (uint8_t)(~TIM1_CCMR_OCM)) | 
//  312                           (uint8_t)TIM1_OCMode);
        LD        A, L:0x525a
        AND       A, #0x8f
        OR        A, S:?b8
        LD        L:0x525a, A
//  313   
//  314   /* Reset the Output Idle state & the Output N Idle state bits */
//  315   TIM1->OISR &= (uint8_t)(~(TIM1_OISR_OIS3 | TIM1_OISR_OIS3N));
        LD        A, L:0x526f
        AND       A, #0xcf
        LD        L:0x526f, A
//  316   /* Set the Output Idle state & the Output N Idle state configuration */
//  317   TIM1->OISR |= (uint8_t)((uint8_t)(TIM1_OISR_OIS3 & TIM1_OCIdleState) | 
//  318                           (uint8_t)(TIM1_OISR_OIS3N & TIM1_OCNIdleState));
        LD        A, S:?b11
        AND       A, #0x20
        PUSH      A
        LD        A, S:?b10
        AND       A, #0x10
        LD        S:?b1, A
        POP       A
        OR        A, S:?b1
        OR        A, L:0x526f
        LD        L:0x526f, A
//  319   
//  320   /* Set the Pulse value */
//  321   TIM1->CCR3H = (uint8_t)(TIM1_Pulse >> 8);
        LDW       X, (0x1,SP)
        CLR       A
        RRWA      X, A
        LD        A, XL
        LD        L:0x5269, A
//  322   TIM1->CCR3L = (uint8_t)(TIM1_Pulse);
        LD        A, (0x2,SP)
        LD        L:0x526a, A
//  323 }
        ADD       SP, #0x2
        POP       S:?b14
        JP        L:?epilogue_l2_w6
//  324 
//  325 /**
//  326   * @brief  Initializes the TIM1 Channel4 according to the specified parameters.
//  327   * @param  TIM1_OCMode specifies the Output Compare mode  from 
//  328   *         @ref TIM1_OCMode_TypeDef.
//  329   * @param  TIM1_OutputState specifies the Output State
//  330   *         from @ref TIM1_OutputState_TypeDef.
//  331   * @param  TIM1_Pulse specifies the Pulse width  value.
//  332   * @param  TIM1_OCPolarity specifies the Output Compare Polarity
//  333   *         from @ref TIM1_OCPolarity_TypeDef.
//  334   * @param  TIM1_OCIdleState specifies the Output Compare Idle State
//  335   *         from @ref TIM1_OCIdleState_TypeDef.
//  336   * @retval None
//  337   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  338 void TIM1_OC4Init(TIM1_OCMode_TypeDef TIM1_OCMode,
//  339                   TIM1_OutputState_TypeDef TIM1_OutputState,
//  340                   uint16_t TIM1_Pulse,
//  341                   TIM1_OCPolarity_TypeDef TIM1_OCPolarity,
//  342                   TIM1_OCIdleState_TypeDef TIM1_OCIdleState)
//  343 {
TIM1_OC4Init:
        CALL      L:?push_l2
        CALL      L:?push_w6
        LD        S:?b8, A
        MOV       S:?b9, S:?b0
        LDW       S:?w6, X
        MOV       S:?b10, S:?b1
        MOV       S:?b11, S:?b2
//  344   /* Check the parameters */
//  345   assert_param(IS_TIM1_OC_MODE_OK(TIM1_OCMode));
        TNZ       S:?b8
        JREQ      L:??TIM1_OC4Init_0
        LD        A, S:?b8
        CP        A, #0x10
        JREQ      L:??TIM1_OC4Init_0
        LD        A, S:?b8
        CP        A, #0x20
        JREQ      L:??TIM1_OC4Init_0
        LD        A, S:?b8
        CP        A, #0x30
        JREQ      L:??TIM1_OC4Init_0
        LD        A, S:?b8
        CP        A, #0x60
        JREQ      L:??TIM1_OC4Init_0
        LD        A, S:?b8
        CP        A, #0x70
        JREQ      L:??TIM1_OC4Init_0
        LDW       X, #0x159
        LDW       S:?w1, X
        CLRW      X
        LDW       S:?w0, X
        LDW       X, #`?<Constant "E:\\\\Desktop\\\\J19B_STM8\\\\...">`
        CALL      L:assert_failed
//  346   assert_param(IS_TIM1_OUTPUT_STATE_OK(TIM1_OutputState));
??TIM1_OC4Init_0:
        TNZ       S:?b9
        JREQ      L:??TIM1_OC4Init_1
        LD        A, S:?b9
        CP        A, #0x11
        JREQ      L:??TIM1_OC4Init_1
        LDW       X, #0x15a
        LDW       S:?w1, X
        CLRW      X
        LDW       S:?w0, X
        LDW       X, #`?<Constant "E:\\\\Desktop\\\\J19B_STM8\\\\...">`
        CALL      L:assert_failed
//  347   assert_param(IS_TIM1_OC_POLARITY_OK(TIM1_OCPolarity));
??TIM1_OC4Init_1:
        TNZ       S:?b10
        JREQ      L:??TIM1_OC4Init_2
        LD        A, S:?b10
        CP        A, #0x22
        JREQ      L:??TIM1_OC4Init_2
        LDW       X, #0x15b
        LDW       S:?w1, X
        CLRW      X
        LDW       S:?w0, X
        LDW       X, #`?<Constant "E:\\\\Desktop\\\\J19B_STM8\\\\...">`
        CALL      L:assert_failed
//  348   assert_param(IS_TIM1_OCIDLE_STATE_OK(TIM1_OCIdleState));
??TIM1_OC4Init_2:
        LD        A, S:?b11
        CP        A, #0x55
        JREQ      L:??TIM1_OC4Init_3
        TNZ       S:?b11
        JREQ      L:??TIM1_OC4Init_3
        LDW       X, #0x15c
        LDW       S:?w1, X
        CLRW      X
        LDW       S:?w0, X
        LDW       X, #`?<Constant "E:\\\\Desktop\\\\J19B_STM8\\\\...">`
        CALL      L:assert_failed
//  349   
//  350   /* Disable the Channel 4: Reset the CCE Bit */
//  351   TIM1->CCER2 &= (uint8_t)(~(TIM1_CCER2_CC4E | TIM1_CCER2_CC4P));
??TIM1_OC4Init_3:
        LD        A, L:0x525d
        AND       A, #0xcf
        LD        L:0x525d, A
//  352   /* Set the Output State  &  the Output Polarity */
//  353   TIM1->CCER2 |= (uint8_t)((uint8_t)(TIM1_OutputState & TIM1_CCER2_CC4E ) |  
//  354                            (uint8_t)(TIM1_OCPolarity  & TIM1_CCER2_CC4P ));
        LD        A, S:?b10
        AND       A, #0x20
        PUSH      A
        LD        A, S:?b9
        AND       A, #0x10
        LD        S:?b1, A
        POP       A
        OR        A, S:?b1
        OR        A, L:0x525d
        LD        L:0x525d, A
//  355   
//  356   /* Reset the Output Compare Bit  and Set the Output Compare Mode */
//  357   TIM1->CCMR4 = (uint8_t)((uint8_t)(TIM1->CCMR4 & (uint8_t)(~TIM1_CCMR_OCM)) | 
//  358                           TIM1_OCMode);
        LD        A, L:0x525b
        AND       A, #0x8f
        OR        A, S:?b8
        LD        L:0x525b, A
//  359   
//  360   /* Set the Output Idle state */
//  361   if (TIM1_OCIdleState != TIM1_OCIDLESTATE_RESET)
        TNZ       S:?b11
        JREQ      L:??TIM1_OC4Init_4
//  362   {
//  363     TIM1->OISR |= (uint8_t)(~TIM1_CCER2_CC4P);
        LD        A, L:0x526f
        OR        A, #0xdf
        LD        L:0x526f, A
        JRA       L:??TIM1_OC4Init_5
//  364   }
//  365   else
//  366   {
//  367     TIM1->OISR &= (uint8_t)(~TIM1_OISR_OIS4);
??TIM1_OC4Init_4:
        BRES      L:0x526f, #0x6
//  368   }
//  369   
//  370   /* Set the Pulse value */
//  371   TIM1->CCR4H = (uint8_t)(TIM1_Pulse >> 8);
??TIM1_OC4Init_5:
        LDW       X, S:?w6
        CLR       A
        RRWA      X, A
        LD        A, XL
        LD        L:0x526b, A
//  372   TIM1->CCR4L = (uint8_t)(TIM1_Pulse);
        LD        A, S:?b13
        LD        L:0x526c, A
//  373 }
        JP        L:?epilogue_l2_w6
//  374 
//  375 /**
//  376   * @brief  Configures the Break feature, dead time, Lock level, the OSSI,
//  377   *         and the AOE(automatic output enable).
//  378   * @param  TIM1_OSSIState specifies the OSSIS State from @ref TIM1_OSSIState_TypeDef.
//  379   * @param  TIM1_LockLevel specifies the lock level from @ref TIM1_LockLevel_TypeDef.
//  380   * @param  TIM1_DeadTime specifies the dead time value.
//  381   * @param  TIM1_Break specifies the Break state @ref TIM1_BreakState_TypeDef.
//  382   * @param  TIM1_BreakPolarity specifies the Break polarity from 
//  383   *         @ref TIM1_BreakPolarity_TypeDef.
//  384   * @param  TIM1_AutomaticOutput specifies the Automatic Output configuration 
//  385   *         from @ref TIM1_AutomaticOutput_TypeDef.
//  386   * @retval None
//  387   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  388 void TIM1_BDTRConfig(TIM1_OSSIState_TypeDef TIM1_OSSIState,
//  389                      TIM1_LockLevel_TypeDef TIM1_LockLevel,
//  390                      uint8_t TIM1_DeadTime,
//  391                      TIM1_BreakState_TypeDef TIM1_Break,
//  392                      TIM1_BreakPolarity_TypeDef TIM1_BreakPolarity,
//  393                      TIM1_AutomaticOutput_TypeDef TIM1_AutomaticOutput)
//  394 {
TIM1_BDTRConfig:
        CALL      L:?push_l2
        CALL      L:?push_w6
        LD        S:?b13, A
        MOV       S:?b8, S:?b0
        MOV       S:?b9, S:?b1
        MOV       S:?b12, S:?b2
        MOV       S:?b10, S:?b3
        MOV       S:?b11, S:?b4
//  395   /* Check the parameters */
//  396   assert_param(IS_TIM1_OSSI_STATE_OK(TIM1_OSSIState));
        LD        A, S:?b13
        CP        A, #0x4
        JREQ      L:??TIM1_BDTRConfig_0
        TNZ       S:?b13
        JREQ      L:??TIM1_BDTRConfig_0
        LDW       X, #0x18c
        LDW       S:?w1, X
        CLRW      X
        LDW       S:?w0, X
        LDW       X, #`?<Constant "E:\\\\Desktop\\\\J19B_STM8\\\\...">`
        CALL      L:assert_failed
//  397   assert_param(IS_TIM1_LOCK_LEVEL_OK(TIM1_LockLevel));
??TIM1_BDTRConfig_0:
        TNZ       S:?b8
        JREQ      L:??TIM1_BDTRConfig_1
        LD        A, S:?b8
        CP        A, #0x1
        JREQ      L:??TIM1_BDTRConfig_1
        LD        A, S:?b8
        CP        A, #0x2
        JREQ      L:??TIM1_BDTRConfig_1
        LD        A, S:?b8
        CP        A, #0x3
        JREQ      L:??TIM1_BDTRConfig_1
        LDW       X, #0x18d
        LDW       S:?w1, X
        CLRW      X
        LDW       S:?w0, X
        LDW       X, #`?<Constant "E:\\\\Desktop\\\\J19B_STM8\\\\...">`
        CALL      L:assert_failed
//  398   assert_param(IS_TIM1_BREAK_STATE_OK(TIM1_Break));
??TIM1_BDTRConfig_1:
        LD        A, S:?b12
        CP        A, #0x10
        JREQ      L:??TIM1_BDTRConfig_2
        TNZ       S:?b12
        JREQ      L:??TIM1_BDTRConfig_2
        LDW       X, #0x18e
        LDW       S:?w1, X
        CLRW      X
        LDW       S:?w0, X
        LDW       X, #`?<Constant "E:\\\\Desktop\\\\J19B_STM8\\\\...">`
        CALL      L:assert_failed
//  399   assert_param(IS_TIM1_BREAK_POLARITY_OK(TIM1_BreakPolarity));
??TIM1_BDTRConfig_2:
        TNZ       S:?b10
        JREQ      L:??TIM1_BDTRConfig_3
        LD        A, S:?b10
        CP        A, #0x20
        JREQ      L:??TIM1_BDTRConfig_3
        LDW       X, #0x18f
        LDW       S:?w1, X
        CLRW      X
        LDW       S:?w0, X
        LDW       X, #`?<Constant "E:\\\\Desktop\\\\J19B_STM8\\\\...">`
        CALL      L:assert_failed
//  400   assert_param(IS_TIM1_AUTOMATIC_OUTPUT_STATE_OK(TIM1_AutomaticOutput));
??TIM1_BDTRConfig_3:
        LD        A, S:?b11
        CP        A, #0x40
        JREQ      L:??TIM1_BDTRConfig_4
        TNZ       S:?b11
        JREQ      L:??TIM1_BDTRConfig_4
        LDW       X, #0x190
        LDW       S:?w1, X
        CLRW      X
        LDW       S:?w0, X
        LDW       X, #`?<Constant "E:\\\\Desktop\\\\J19B_STM8\\\\...">`
        CALL      L:assert_failed
//  401   
//  402   TIM1->DTR = (uint8_t)(TIM1_DeadTime);
??TIM1_BDTRConfig_4:
        LD        A, S:?b9
        LD        L:0x526e, A
//  403   /* Set the Lock level, the Break enable Bit and the Polarity, the OSSI State,
//  404   the dead time value  and the Automatic Output Enable Bit */
//  405   
//  406   TIM1->BKR  =  (uint8_t)((uint8_t)(TIM1_OSSIState | (uint8_t)TIM1_LockLevel)  | 
//  407                           (uint8_t)((uint8_t)(TIM1_Break | (uint8_t)TIM1_BreakPolarity)  | 
//  408                           (uint8_t)TIM1_AutomaticOutput));
        LD        A, S:?b10
        OR        A, S:?b12
        OR        A, S:?b11
        PUSH      A
        LD        A, S:?b8
        OR        A, S:?b13
        LD        S:?b1, A
        POP       A
        OR        A, S:?b1
        LD        L:0x526d, A
//  409 }
        JP        L:?epilogue_l2_w6
//  410 
//  411 /**
//  412   * @brief  Initializes the TIM1 peripheral according to the specified parameters.
//  413   * @param  TIM1_Channel specifies the input capture channel from TIM1_Channel_TypeDef.
//  414   * @param  TIM1_ICPolarity specifies the Input capture polarity from  
//  415   *         TIM1_ICPolarity_TypeDef .
//  416   * @param  TIM1_ICSelection specifies the Input capture source selection from 
//  417   *         TIM1_ICSelection_TypeDef.
//  418   * @param  TIM1_ICPrescaler specifies the Input capture Prescaler from
//  419   *         TIM1_ICPSC_TypeDef.
//  420   * @param  TIM1_ICFilter specifies the Input capture filter value.
//  421   * @retval None
//  422   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  423 void TIM1_ICInit(TIM1_Channel_TypeDef TIM1_Channel,
//  424                  TIM1_ICPolarity_TypeDef TIM1_ICPolarity,
//  425                  TIM1_ICSelection_TypeDef TIM1_ICSelection,
//  426                  TIM1_ICPSC_TypeDef TIM1_ICPrescaler,
//  427                  uint8_t TIM1_ICFilter)
//  428 {
TIM1_ICInit:
        CALL      L:?push_l2
        PUSH      S:?b12
        LD        S:?b12, A
        MOV       S:?b8, S:?b0
        MOV       S:?b9, S:?b1
        MOV       S:?b10, S:?b2
        MOV       S:?b11, S:?b3
//  429   /* Check the parameters */
//  430   assert_param(IS_TIM1_CHANNEL_OK(TIM1_Channel));
        TNZ       S:?b12
        JREQ      L:??TIM1_ICInit_0
        LD        A, S:?b12
        CP        A, #0x1
        JREQ      L:??TIM1_ICInit_0
        LD        A, S:?b12
        CP        A, #0x2
        JREQ      L:??TIM1_ICInit_0
        LD        A, S:?b12
        CP        A, #0x3
        JREQ      L:??TIM1_ICInit_0
        LDW       X, #0x1ae
        LDW       S:?w1, X
        CLRW      X
        LDW       S:?w0, X
        LDW       X, #`?<Constant "E:\\\\Desktop\\\\J19B_STM8\\\\...">`
        CALL      L:assert_failed
//  431   assert_param(IS_TIM1_IC_POLARITY_OK(TIM1_ICPolarity));
??TIM1_ICInit_0:
        TNZ       S:?b8
        JREQ      L:??TIM1_ICInit_1
        LD        A, S:?b8
        CP        A, #0x1
        JREQ      L:??TIM1_ICInit_1
        LDW       X, #0x1af
        LDW       S:?w1, X
        CLRW      X
        LDW       S:?w0, X
        LDW       X, #`?<Constant "E:\\\\Desktop\\\\J19B_STM8\\\\...">`
        CALL      L:assert_failed
//  432   assert_param(IS_TIM1_IC_SELECTION_OK(TIM1_ICSelection));
??TIM1_ICInit_1:
        LD        A, S:?b9
        CP        A, #0x1
        JREQ      L:??TIM1_ICInit_2
        LD        A, S:?b9
        CP        A, #0x2
        JREQ      L:??TIM1_ICInit_2
        LD        A, S:?b9
        CP        A, #0x3
        JREQ      L:??TIM1_ICInit_2
        LDW       X, #0x1b0
        LDW       S:?w1, X
        CLRW      X
        LDW       S:?w0, X
        LDW       X, #`?<Constant "E:\\\\Desktop\\\\J19B_STM8\\\\...">`
        CALL      L:assert_failed
//  433   assert_param(IS_TIM1_IC_PRESCALER_OK(TIM1_ICPrescaler));
??TIM1_ICInit_2:
        TNZ       S:?b10
        JREQ      L:??TIM1_ICInit_3
        LD        A, S:?b10
        CP        A, #0x4
        JREQ      L:??TIM1_ICInit_3
        LD        A, S:?b10
        CP        A, #0x8
        JREQ      L:??TIM1_ICInit_3
        LD        A, S:?b10
        CP        A, #0xc
        JREQ      L:??TIM1_ICInit_3
        LDW       X, #0x1b1
        LDW       S:?w1, X
        CLRW      X
        LDW       S:?w0, X
        LDW       X, #`?<Constant "E:\\\\Desktop\\\\J19B_STM8\\\\...">`
        CALL      L:assert_failed
//  434   assert_param(IS_TIM1_IC_FILTER_OK(TIM1_ICFilter));
??TIM1_ICInit_3:
        LD        A, S:?b11
        CP        A, #0x10
        JRC       L:??TIM1_ICInit_4
        LDW       X, #0x1b2
        LDW       S:?w1, X
        CLRW      X
        LDW       S:?w0, X
        LDW       X, #`?<Constant "E:\\\\Desktop\\\\J19B_STM8\\\\...">`
        CALL      L:assert_failed
//  435   
//  436   if (TIM1_Channel == TIM1_CHANNEL_1)
??TIM1_ICInit_4:
        TNZ       S:?b12
        JRNE      L:??TIM1_ICInit_5
//  437   {
//  438     /* TI1 Configuration */
//  439     TI1_Config((uint8_t)TIM1_ICPolarity,
//  440                (uint8_t)TIM1_ICSelection,
//  441                (uint8_t)TIM1_ICFilter);
        MOV       S:?b1, S:?b11
        MOV       S:?b0, S:?b9
        LD        A, S:?b8
        CALL      L:TI1_Config
//  442     /* Set the Input Capture Prescaler value */
//  443     TIM1_SetIC1Prescaler(TIM1_ICPrescaler);
        LD        A, S:?b10
        CALL      L:TIM1_SetIC1Prescaler
        JRA       L:??TIM1_ICInit_6
//  444   }
//  445   else if (TIM1_Channel == TIM1_CHANNEL_2)
??TIM1_ICInit_5:
        LD        A, S:?b12
        CP        A, #0x1
        JRNE      L:??TIM1_ICInit_7
//  446   {
//  447     /* TI2 Configuration */
//  448     TI2_Config((uint8_t)TIM1_ICPolarity,
//  449                (uint8_t)TIM1_ICSelection,
//  450                (uint8_t)TIM1_ICFilter);
        MOV       S:?b1, S:?b11
        MOV       S:?b0, S:?b9
        LD        A, S:?b8
        CALL      L:TI2_Config
//  451     /* Set the Input Capture Prescaler value */
//  452     TIM1_SetIC2Prescaler(TIM1_ICPrescaler);
        LD        A, S:?b10
        CALL      L:TIM1_SetIC2Prescaler
        JRA       L:??TIM1_ICInit_6
//  453   }
//  454   else if (TIM1_Channel == TIM1_CHANNEL_3)
??TIM1_ICInit_7:
        LD        A, S:?b12
        CP        A, #0x2
        JRNE      L:??TIM1_ICInit_8
//  455   {
//  456     /* TI3 Configuration */
//  457     TI3_Config((uint8_t)TIM1_ICPolarity,
//  458                (uint8_t)TIM1_ICSelection,
//  459                (uint8_t)TIM1_ICFilter);
        MOV       S:?b1, S:?b11
        MOV       S:?b0, S:?b9
        LD        A, S:?b8
        CALL      L:TI3_Config
//  460     /* Set the Input Capture Prescaler value */
//  461     TIM1_SetIC3Prescaler(TIM1_ICPrescaler);
        LD        A, S:?b10
        CALL      L:TIM1_SetIC3Prescaler
        JRA       L:??TIM1_ICInit_6
//  462   }
//  463   else
//  464   {
//  465     /* TI4 Configuration */
//  466     TI4_Config((uint8_t)TIM1_ICPolarity,
//  467                (uint8_t)TIM1_ICSelection,
//  468                (uint8_t)TIM1_ICFilter);
??TIM1_ICInit_8:
        MOV       S:?b1, S:?b11
        MOV       S:?b0, S:?b9
        LD        A, S:?b8
        CALL      L:TI4_Config
//  469     /* Set the Input Capture Prescaler value */
//  470     TIM1_SetIC4Prescaler(TIM1_ICPrescaler);
        LD        A, S:?b10
        CALL      L:TIM1_SetIC4Prescaler
//  471   }
//  472 }
??TIM1_ICInit_6:
        POP       S:?b12
        JP        L:?epilogue_l2
//  473 
//  474 /**
//  475   * @brief  Configures the TIM1 peripheral in PWM Input Mode according to the 
//  476   *         specified parameters.
//  477   * @param  TIM1_Channel specifies the input capture channel from 
//  478   *         @ref TIM1_Channel_TypeDef.
//  479   * @param  TIM1_ICPolarity specifies the Input capture polarity from  
//  480   *         @ref TIM1_ICPolarity_TypeDef .
//  481   * @param  TIM1_ICSelection specifies the Input capture source selection  from
//  482   *         @ref TIM1_ICSelection_TypeDef.
//  483   * @param  TIM1_ICPrescaler specifies the Input capture Prescaler from  
//  484   *         @ref TIM1_ICPSC_TypeDef.
//  485   * @param  TIM1_ICFilter specifies the Input capture filter value.
//  486   * @retval None
//  487   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  488 void TIM1_PWMIConfig(TIM1_Channel_TypeDef TIM1_Channel,
//  489                      TIM1_ICPolarity_TypeDef TIM1_ICPolarity,
//  490                      TIM1_ICSelection_TypeDef TIM1_ICSelection,
//  491                      TIM1_ICPSC_TypeDef TIM1_ICPrescaler,
//  492                      uint8_t TIM1_ICFilter)
//  493 {
TIM1_PWMIConfig:
        CALL      L:?push_l2
        CALL      L:?push_w6
        PUSH      S:?b14
        LD        S:?b12, A
        MOV       S:?b8, S:?b0
        MOV       S:?b9, S:?b1
        MOV       S:?b10, S:?b2
        MOV       S:?b11, S:?b3
//  494   uint8_t icpolarity = TIM1_ICPOLARITY_RISING;
        CLR       S:?b14
//  495   uint8_t icselection = TIM1_ICSELECTION_DIRECTTI;
        MOV       S:?b13, #0x1
//  496   
//  497   /* Check the parameters */
//  498   assert_param(IS_TIM1_PWMI_CHANNEL_OK(TIM1_Channel));
        TNZ       S:?b12
        JREQ      L:??TIM1_PWMIConfig_0
        LD        A, S:?b12
        CP        A, #0x1
        JREQ      L:??TIM1_PWMIConfig_0
        LDW       X, #0x1f2
        LDW       S:?w1, X
        CLRW      X
        LDW       S:?w0, X
        LDW       X, #`?<Constant "E:\\\\Desktop\\\\J19B_STM8\\\\...">`
        CALL      L:assert_failed
//  499   assert_param(IS_TIM1_IC_POLARITY_OK(TIM1_ICPolarity));
??TIM1_PWMIConfig_0:
        TNZ       S:?b8
        JREQ      L:??TIM1_PWMIConfig_1
        LD        A, S:?b8
        CP        A, #0x1
        JREQ      L:??TIM1_PWMIConfig_1
        LDW       X, #0x1f3
        LDW       S:?w1, X
        CLRW      X
        LDW       S:?w0, X
        LDW       X, #`?<Constant "E:\\\\Desktop\\\\J19B_STM8\\\\...">`
        CALL      L:assert_failed
//  500   assert_param(IS_TIM1_IC_SELECTION_OK(TIM1_ICSelection));
??TIM1_PWMIConfig_1:
        LD        A, S:?b9
        CP        A, #0x1
        JREQ      L:??TIM1_PWMIConfig_2
        LD        A, S:?b9
        CP        A, #0x2
        JREQ      L:??TIM1_PWMIConfig_2
        LD        A, S:?b9
        CP        A, #0x3
        JREQ      L:??TIM1_PWMIConfig_2
        LDW       X, #0x1f4
        LDW       S:?w1, X
        CLRW      X
        LDW       S:?w0, X
        LDW       X, #`?<Constant "E:\\\\Desktop\\\\J19B_STM8\\\\...">`
        CALL      L:assert_failed
//  501   assert_param(IS_TIM1_IC_PRESCALER_OK(TIM1_ICPrescaler));
??TIM1_PWMIConfig_2:
        TNZ       S:?b10
        JREQ      L:??TIM1_PWMIConfig_3
        LD        A, S:?b10
        CP        A, #0x4
        JREQ      L:??TIM1_PWMIConfig_3
        LD        A, S:?b10
        CP        A, #0x8
        JREQ      L:??TIM1_PWMIConfig_3
        LD        A, S:?b10
        CP        A, #0xc
        JREQ      L:??TIM1_PWMIConfig_3
        LDW       X, #0x1f5
        LDW       S:?w1, X
        CLRW      X
        LDW       S:?w0, X
        LDW       X, #`?<Constant "E:\\\\Desktop\\\\J19B_STM8\\\\...">`
        CALL      L:assert_failed
//  502   
//  503   /* Select the Opposite Input Polarity */
//  504   if (TIM1_ICPolarity != TIM1_ICPOLARITY_FALLING)
??TIM1_PWMIConfig_3:
        LD        A, S:?b8
        CP        A, #0x1
        JREQ      L:??TIM1_PWMIConfig_4
//  505   {
//  506     icpolarity = TIM1_ICPOLARITY_FALLING;
        MOV       S:?b14, #0x1
        JRA       L:??TIM1_PWMIConfig_5
//  507   }
//  508   else
//  509   {
//  510     icpolarity = TIM1_ICPOLARITY_RISING;
??TIM1_PWMIConfig_4:
        CLR       S:?b14
//  511   }
//  512   
//  513   /* Select the Opposite Input */
//  514   if (TIM1_ICSelection == TIM1_ICSELECTION_DIRECTTI)
??TIM1_PWMIConfig_5:
        LD        A, S:?b9
        CP        A, #0x1
        JRNE      L:??TIM1_PWMIConfig_6
//  515   {
//  516     icselection = TIM1_ICSELECTION_INDIRECTTI;
        MOV       S:?b13, #0x2
        JRA       L:??TIM1_PWMIConfig_7
//  517   }
//  518   else
//  519   {
//  520     icselection = TIM1_ICSELECTION_DIRECTTI;
??TIM1_PWMIConfig_6:
        MOV       S:?b13, #0x1
//  521   }
//  522   
//  523   if (TIM1_Channel == TIM1_CHANNEL_1)
??TIM1_PWMIConfig_7:
        TNZ       S:?b12
        JRNE      L:??TIM1_PWMIConfig_8
//  524   {
//  525     /* TI1 Configuration */
//  526     TI1_Config((uint8_t)TIM1_ICPolarity, (uint8_t)TIM1_ICSelection,
//  527                (uint8_t)TIM1_ICFilter);
        MOV       S:?b1, S:?b11
        MOV       S:?b0, S:?b9
        LD        A, S:?b8
        CALL      L:TI1_Config
//  528     
//  529     /* Set the Input Capture Prescaler value */
//  530     TIM1_SetIC1Prescaler(TIM1_ICPrescaler);
        LD        A, S:?b10
        CALL      L:TIM1_SetIC1Prescaler
//  531     
//  532     /* TI2 Configuration */
//  533     TI2_Config(icpolarity, icselection, TIM1_ICFilter);
        MOV       S:?b1, S:?b11
        MOV       S:?b0, S:?b13
        LD        A, S:?b14
        CALL      L:TI2_Config
//  534     
//  535     /* Set the Input Capture Prescaler value */
//  536     TIM1_SetIC2Prescaler(TIM1_ICPrescaler);
        LD        A, S:?b10
        CALL      L:TIM1_SetIC2Prescaler
        JRA       L:??TIM1_PWMIConfig_9
//  537   }
//  538   else
//  539   {
//  540     /* TI2 Configuration */
//  541     TI2_Config((uint8_t)TIM1_ICPolarity, (uint8_t)TIM1_ICSelection,
//  542                (uint8_t)TIM1_ICFilter);
??TIM1_PWMIConfig_8:
        MOV       S:?b1, S:?b11
        MOV       S:?b0, S:?b9
        LD        A, S:?b8
        CALL      L:TI2_Config
//  543     
//  544     /* Set the Input Capture Prescaler value */
//  545     TIM1_SetIC2Prescaler(TIM1_ICPrescaler);
        LD        A, S:?b10
        CALL      L:TIM1_SetIC2Prescaler
//  546     
//  547     /* TI1 Configuration */
//  548     TI1_Config(icpolarity, icselection, TIM1_ICFilter);
        MOV       S:?b1, S:?b11
        MOV       S:?b0, S:?b13
        LD        A, S:?b14
        CALL      L:TI1_Config
//  549     
//  550     /* Set the Input Capture Prescaler value */
//  551     TIM1_SetIC1Prescaler(TIM1_ICPrescaler);
        LD        A, S:?b10
        CALL      L:TIM1_SetIC1Prescaler
//  552   }
//  553 }
??TIM1_PWMIConfig_9:
        POP       S:?b14
        JP        L:?epilogue_l2_w6
//  554 
//  555 /**
//  556   * @brief  Enables or disables the TIM1 peripheral.
//  557   * @param  NewState new state of the TIM1 peripheral.
//  558   *         This parameter can be ENABLE or DISABLE.
//  559   * @retval None
//  560   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  561 void TIM1_Cmd(FunctionalState NewState)
//  562 {
TIM1_Cmd:
        PUSH      S:?b8
        LD        S:?b8, A
//  563   /* Check the parameters */
//  564   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
        TNZ       S:?b8
        JREQ      L:??TIM1_Cmd_0
        LD        A, S:?b8
        CP        A, #0x1
        JREQ      L:??TIM1_Cmd_0
        LDW       X, #0x234
        LDW       S:?w1, X
        CLRW      X
        LDW       S:?w0, X
        LDW       X, #`?<Constant "E:\\\\Desktop\\\\J19B_STM8\\\\...">`
        CALL      L:assert_failed
//  565   
//  566   /* set or Reset the CEN Bit */
//  567   if (NewState != DISABLE)
??TIM1_Cmd_0:
        TNZ       S:?b8
        JREQ      L:??TIM1_Cmd_1
//  568   {
//  569     TIM1->CR1 |= TIM1_CR1_CEN;
        BSET      L:0x5250, #0x0
        JRA       L:??TIM1_Cmd_2
//  570   }
//  571   else
//  572   {
//  573     TIM1->CR1 &= (uint8_t)(~TIM1_CR1_CEN);
??TIM1_Cmd_1:
        BRES      L:0x5250, #0x0
//  574   }
//  575 }
??TIM1_Cmd_2:
        POP       S:?b8
        RET
//  576 
//  577 /**
//  578   * @brief  Enables or disables the TIM1 peripheral Main Outputs.
//  579   * @param  NewState new state of the TIM1 peripheral.
//  580   *         This parameter can be ENABLE or DISABLE.
//  581   * @retval None
//  582   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  583 void TIM1_CtrlPWMOutputs(FunctionalState NewState)
//  584 {
TIM1_CtrlPWMOutputs:
        PUSH      S:?b8
        LD        S:?b8, A
//  585   /* Check the parameters */
//  586   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
        TNZ       S:?b8
        JREQ      L:??TIM1_CtrlPWMOutputs_0
        LD        A, S:?b8
        CP        A, #0x1
        JREQ      L:??TIM1_CtrlPWMOutputs_0
        LDW       X, #0x24a
        LDW       S:?w1, X
        CLRW      X
        LDW       S:?w0, X
        LDW       X, #`?<Constant "E:\\\\Desktop\\\\J19B_STM8\\\\...">`
        CALL      L:assert_failed
//  587   
//  588   /* Set or Reset the MOE Bit */
//  589   
//  590   if (NewState != DISABLE)
??TIM1_CtrlPWMOutputs_0:
        TNZ       S:?b8
        JREQ      L:??TIM1_CtrlPWMOutputs_1
//  591   {
//  592     TIM1->BKR |= TIM1_BKR_MOE;
        BSET      L:0x526d, #0x7
        JRA       L:??TIM1_CtrlPWMOutputs_2
//  593   }
//  594   else
//  595   {
//  596     TIM1->BKR &= (uint8_t)(~TIM1_BKR_MOE);
??TIM1_CtrlPWMOutputs_1:
        BRES      L:0x526d, #0x7
//  597   }
//  598 }
??TIM1_CtrlPWMOutputs_2:
        POP       S:?b8
        RET
//  599 
//  600 /**
//  601   * @brief  Enables or disables the specified TIM1 interrupts.
//  602   * @param  NewState new state of the TIM1 peripheral.
//  603   *         This parameter can be: ENABLE or DISABLE.
//  604   * @param  TIM1_IT specifies the TIM1 interrupts sources to be enabled or disabled.
//  605   *         This parameter can be any combination of the following values:
//  606   *           - TIM1_IT_UPDATE: TIM1 update Interrupt source
//  607   *           - TIM1_IT_CC1: TIM1 Capture Compare 1 Interrupt source
//  608   *           - TIM1_IT_CC2: TIM1 Capture Compare 2 Interrupt source
//  609   *           - TIM1_IT_CC3: TIM1 Capture Compare 3 Interrupt source
//  610   *           - TIM1_IT_CC4: TIM1 Capture Compare 4 Interrupt source
//  611   *           - TIM1_IT_CCUpdate: TIM1 Capture Compare Update Interrupt source
//  612   *           - TIM1_IT_TRIGGER: TIM1 Trigger Interrupt source
//  613   *           - TIM1_IT_BREAK: TIM1 Break Interrupt source
//  614   * @param  NewState new state of the TIM1 peripheral.
//  615   * @retval None
//  616   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  617 void TIM1_ITConfig(TIM1_IT_TypeDef  TIM1_IT, FunctionalState NewState)
//  618 {
TIM1_ITConfig:
        CALL      L:?push_w4
        LD        S:?b8, A
        MOV       S:?b9, S:?b0
//  619   /* Check the parameters */
//  620   assert_param(IS_TIM1_IT_OK(TIM1_IT));
        TNZ       S:?b8
        JRNE      L:??TIM1_ITConfig_0
        LDW       X, #0x26c
        LDW       S:?w1, X
        CLRW      X
        LDW       S:?w0, X
        LDW       X, #`?<Constant "E:\\\\Desktop\\\\J19B_STM8\\\\...">`
        CALL      L:assert_failed
//  621   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
??TIM1_ITConfig_0:
        TNZ       S:?b9
        JREQ      L:??TIM1_ITConfig_1
        LD        A, S:?b9
        CP        A, #0x1
        JREQ      L:??TIM1_ITConfig_1
        LDW       X, #0x26d
        LDW       S:?w1, X
        CLRW      X
        LDW       S:?w0, X
        LDW       X, #`?<Constant "E:\\\\Desktop\\\\J19B_STM8\\\\...">`
        CALL      L:assert_failed
//  622   
//  623   if (NewState != DISABLE)
??TIM1_ITConfig_1:
        TNZ       S:?b9
        JREQ      L:??TIM1_ITConfig_2
//  624   {
//  625     /* Enable the Interrupt sources */
//  626     TIM1->IER |= (uint8_t)TIM1_IT;
        LD        A, S:?b8
        OR        A, L:0x5254
        LD        L:0x5254, A
        JP        L:?epilogue_w4
//  627   }
//  628   else
//  629   {
//  630     /* Disable the Interrupt sources */
//  631     TIM1->IER &= (uint8_t)(~(uint8_t)TIM1_IT);
??TIM1_ITConfig_2:
        CPL       S:?b8
        LD        A, S:?b8
        AND       A, L:0x5254
        LD        L:0x5254, A
//  632   }
//  633 }
        JP        L:?epilogue_w4
//  634 
//  635 /**
//  636   * @brief  Configures the TIM1 internal Clock.
//  637   * @param  None
//  638   * @retval None
//  639   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  640 void TIM1_InternalClockConfig(void)
//  641 {
//  642   /* Disable slave mode to clock the prescaler directly with the internal clock */
//  643   TIM1->SMCR &= (uint8_t)(~TIM1_SMCR_SMS);
TIM1_InternalClockConfig:
        LD        A, L:0x5252
        AND       A, #0xf8
        LD        L:0x5252, A
//  644 }
        RET
//  645 
//  646 /**
//  647   * @brief  Configures the TIM1 External clock Mode1.
//  648   * @param  TIM1_ExtTRGPrescaler specifies the external Trigger Prescaler.
//  649   *         This parameter can be one of the following values:
//  650   *                       - TIM1_EXTTRGPSC_OFF
//  651   *                       - TIM1_EXTTRGPSC_DIV2
//  652   *                       - TIM1_EXTTRGPSC_DIV4
//  653   *                       - TIM1_EXTTRGPSC_DIV8.
//  654   * @param  TIM1_ExtTRGPolarity specifies the external Trigger Polarity.
//  655   *         This parameter can be one of the following values:
//  656   *                       - TIM1_EXTTRGPOLARITY_INVERTED
//  657   *                       - TIM1_EXTTRGPOLARITY_NONINVERTED
//  658   * @param  ExtTRGFilter specifies the External Trigger Filter.
//  659   *         This parameter must be a value between 0x00 and 0x0F
//  660   * @retval None
//  661   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  662 void TIM1_ETRClockMode1Config(TIM1_ExtTRGPSC_TypeDef TIM1_ExtTRGPrescaler,
//  663                               TIM1_ExtTRGPolarity_TypeDef TIM1_ExtTRGPolarity,
//  664                               uint8_t ExtTRGFilter)
//  665 {
TIM1_ETRClockMode1Config:
        CALL      L:?push_w4
        PUSH      S:?b10
        LD        S:?b8, A
        MOV       S:?b9, S:?b0
        MOV       S:?b10, S:?b1
//  666   /* Check the parameters */
//  667   assert_param(IS_TIM1_EXT_PRESCALER_OK(TIM1_ExtTRGPrescaler));
        TNZ       S:?b8
        JREQ      L:??TIM1_ETRClockMode1Config_0
        LD        A, S:?b8
        CP        A, #0x10
        JREQ      L:??TIM1_ETRClockMode1Config_0
        LD        A, S:?b8
        CP        A, #0x20
        JREQ      L:??TIM1_ETRClockMode1Config_0
        LD        A, S:?b8
        CP        A, #0x30
        JREQ      L:??TIM1_ETRClockMode1Config_0
        LDW       X, #0x29b
        LDW       S:?w1, X
        CLRW      X
        LDW       S:?w0, X
        LDW       X, #`?<Constant "E:\\\\Desktop\\\\J19B_STM8\\\\...">`
        CALL      L:assert_failed
//  668   assert_param(IS_TIM1_EXT_POLARITY_OK(TIM1_ExtTRGPolarity));
??TIM1_ETRClockMode1Config_0:
        LD        A, S:?b9
        CP        A, #0x80
        JREQ      L:??TIM1_ETRClockMode1Config_1
        TNZ       S:?b9
        JREQ      L:??TIM1_ETRClockMode1Config_1
        LDW       X, #0x29c
        LDW       S:?w1, X
        CLRW      X
        LDW       S:?w0, X
        LDW       X, #`?<Constant "E:\\\\Desktop\\\\J19B_STM8\\\\...">`
        CALL      L:assert_failed
//  669   
//  670   /* Configure the ETR Clock source */
//  671   TIM1_ETRConfig(TIM1_ExtTRGPrescaler, TIM1_ExtTRGPolarity, ExtTRGFilter);
??TIM1_ETRClockMode1Config_1:
        MOV       S:?b1, S:?b10
        MOV       S:?b0, S:?b9
        LD        A, S:?b8
        CALL      L:TIM1_ETRConfig
//  672   
//  673   /* Select the External clock mode1 & Select the Trigger selection : ETRF */
//  674   TIM1->SMCR = (uint8_t)((uint8_t)(TIM1->SMCR & (uint8_t)(~(uint8_t)(TIM1_SMCR_SMS | TIM1_SMCR_TS )))
//  675                          | (uint8_t)((uint8_t)TIM1_SLAVEMODE_EXTERNAL1 | TIM1_TS_ETRF ));
        LD        A, L:0x5252
        OR        A, #0x77
        LD        L:0x5252, A
//  676 }
        POP       S:?b10
        JP        L:?epilogue_w4
//  677 
//  678 /**
//  679   * @brief  Configures the TIM1 External clock Mode2.
//  680   * @param  TIM1_ExtTRGPrescaler specifies the external Trigger Prescaler.
//  681   *         This parameter can be one of the following values:
//  682   *                       - TIM1_EXTTRGPSC_OFF
//  683   *                       - TIM1_EXTTRGPSC_DIV2
//  684   *                       - TIM1_EXTTRGPSC_DIV4
//  685   *                       - TIM1_EXTTRGPSC_DIV8.
//  686   * @param  TIM1_ExtTRGPolarity specifies the external Trigger Polarity.
//  687   *         This parameter can be one of the following values:
//  688   *                       - TIM1_EXTTRGPOLARITY_INVERTED
//  689   *                       - TIM1_EXTTRGPOLARITY_NONINVERTED
//  690   * @param  ExtTRGFilter specifies the External Trigger Filter.
//  691   *         This parameter must be a value between 0x00 and 0x0F
//  692   * @retval None
//  693   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  694 void TIM1_ETRClockMode2Config(TIM1_ExtTRGPSC_TypeDef TIM1_ExtTRGPrescaler,
//  695                               TIM1_ExtTRGPolarity_TypeDef TIM1_ExtTRGPolarity,
//  696                               uint8_t ExtTRGFilter)
//  697 {
TIM1_ETRClockMode2Config:
        CALL      L:?push_w4
        PUSH      S:?b10
        LD        S:?b8, A
        MOV       S:?b9, S:?b0
        MOV       S:?b10, S:?b1
//  698   /* Check the parameters */
//  699   assert_param(IS_TIM1_EXT_PRESCALER_OK(TIM1_ExtTRGPrescaler));
        TNZ       S:?b8
        JREQ      L:??TIM1_ETRClockMode2Config_0
        LD        A, S:?b8
        CP        A, #0x10
        JREQ      L:??TIM1_ETRClockMode2Config_0
        LD        A, S:?b8
        CP        A, #0x20
        JREQ      L:??TIM1_ETRClockMode2Config_0
        LD        A, S:?b8
        CP        A, #0x30
        JREQ      L:??TIM1_ETRClockMode2Config_0
        LDW       X, #0x2bb
        LDW       S:?w1, X
        CLRW      X
        LDW       S:?w0, X
        LDW       X, #`?<Constant "E:\\\\Desktop\\\\J19B_STM8\\\\...">`
        CALL      L:assert_failed
//  700   assert_param(IS_TIM1_EXT_POLARITY_OK(TIM1_ExtTRGPolarity));
??TIM1_ETRClockMode2Config_0:
        LD        A, S:?b9
        CP        A, #0x80
        JREQ      L:??TIM1_ETRClockMode2Config_1
        TNZ       S:?b9
        JREQ      L:??TIM1_ETRClockMode2Config_1
        LDW       X, #0x2bc
        LDW       S:?w1, X
        CLRW      X
        LDW       S:?w0, X
        LDW       X, #`?<Constant "E:\\\\Desktop\\\\J19B_STM8\\\\...">`
        CALL      L:assert_failed
//  701   
//  702   /* Configure the ETR Clock source */
//  703   TIM1_ETRConfig(TIM1_ExtTRGPrescaler, TIM1_ExtTRGPolarity, ExtTRGFilter);
??TIM1_ETRClockMode2Config_1:
        MOV       S:?b1, S:?b10
        MOV       S:?b0, S:?b9
        LD        A, S:?b8
        CALL      L:TIM1_ETRConfig
//  704   
//  705   /* Enable the External clock mode2 */
//  706   TIM1->ETR |= TIM1_ETR_ECE;
        BSET      L:0x5253, #0x6
//  707 }
        POP       S:?b10
        JP        L:?epilogue_w4
//  708 
//  709 /**
//  710   * @brief  Configures the TIM1 External Trigger.
//  711   * @param  TIM1_ExtTRGPrescaler specifies the external Trigger Prescaler.
//  712   *         This parameter can be one of the following values:
//  713   *                       - TIM1_EXTTRGPSC_OFF
//  714   *                       - TIM1_EXTTRGPSC_DIV2
//  715   *                       - TIM1_EXTTRGPSC_DIV4
//  716   *                       - TIM1_EXTTRGPSC_DIV8.
//  717   * @param  TIM1_ExtTRGPolarity specifies the external Trigger Polarity.
//  718   *         This parameter can be one of the following values:
//  719   *                       - TIM1_EXTTRGPOLARITY_INVERTED
//  720   *                       - TIM1_EXTTRGPOLARITY_NONINVERTED
//  721   * @param  ExtTRGFilter specifies the External Trigger Filter.
//  722   *         This parameter must be a value between 0x00 and 0x0F
//  723   * @retval None
//  724   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  725 void TIM1_ETRConfig(TIM1_ExtTRGPSC_TypeDef TIM1_ExtTRGPrescaler,
//  726                     TIM1_ExtTRGPolarity_TypeDef TIM1_ExtTRGPolarity,
//  727                     uint8_t ExtTRGFilter)
//  728 {
TIM1_ETRConfig:
        CALL      L:?push_w4
        PUSH      S:?b10
        LD        S:?b9, A
        MOV       S:?b8, S:?b0
        MOV       S:?b10, S:?b1
//  729   /* Check the parameters */
//  730   assert_param(IS_TIM1_EXT_TRG_FILTER_OK(ExtTRGFilter));
        LD        A, S:?b10
        CP        A, #0x10
        JRC       L:??TIM1_ETRConfig_0
        LDW       X, #0x2da
        LDW       S:?w1, X
        CLRW      X
        LDW       S:?w0, X
        LDW       X, #`?<Constant "E:\\\\Desktop\\\\J19B_STM8\\\\...">`
        CALL      L:assert_failed
//  731   /* Set the Prescaler, the Filter value and the Polarity */
//  732   TIM1->ETR |= (uint8_t)((uint8_t)(TIM1_ExtTRGPrescaler | (uint8_t)TIM1_ExtTRGPolarity )|
//  733                          (uint8_t)ExtTRGFilter );
??TIM1_ETRConfig_0:
        LD        A, S:?b8
        OR        A, S:?b9
        OR        A, S:?b10
        OR        A, L:0x5253
        LD        L:0x5253, A
//  734 }
        POP       S:?b10
        JP        L:?epilogue_w4
//  735 
//  736 /**
//  737   * @brief  Configures the TIM1 Trigger as External Clock.
//  738   * @param  TIM1_TIxExternalCLKSource specifies Trigger source.
//  739   *         This parameter can be one of the following values:
//  740   *                     - TIM1_TIXEXTERNALCLK1SOURCE_TI1: TI1 Edge Detector
//  741   *                     - TIM1_TIXEXTERNALCLK1SOURCE_TI2: Filtered TIM1 Input 1
//  742   *                     - TIM1_TIXEXTERNALCLK1SOURCE_TI1ED: Filtered TIM1 Input 2
//  743   * @param  TIM1_ICPolarity specifies the TIx Polarity.
//  744   *         This parameter can be:
//  745   *                     - TIM1_ICPOLARITY_RISING
//  746   *                     - TIM1_ICPOLARITY_FALLING
//  747   * @param  ICFilter specifies the filter value.
//  748   *         This parameter must be a value between 0x00 and 0x0F
//  749   * @retval None
//  750   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  751 void TIM1_TIxExternalClockConfig(TIM1_TIxExternalCLK1Source_TypeDef TIM1_TIxExternalCLKSource,
//  752                                  TIM1_ICPolarity_TypeDef TIM1_ICPolarity,
//  753                                  uint8_t ICFilter)
//  754 {
TIM1_TIxExternalClockConfig:
        CALL      L:?push_w4
        PUSH      S:?b10
        LD        S:?b8, A
        MOV       S:?b9, S:?b0
        MOV       S:?b10, S:?b1
//  755   /* Check the parameters */
//  756   assert_param(IS_TIM1_TIXCLK_SOURCE_OK(TIM1_TIxExternalCLKSource));
        LD        A, S:?b8
        CP        A, #0x40
        JREQ      L:??TIM1_TIxExternalClockConfig_0
        LD        A, S:?b8
        CP        A, #0x60
        JREQ      L:??TIM1_TIxExternalClockConfig_0
        LD        A, S:?b8
        CP        A, #0x50
        JREQ      L:??TIM1_TIxExternalClockConfig_0
        LDW       X, #0x2f4
        LDW       S:?w1, X
        CLRW      X
        LDW       S:?w0, X
        LDW       X, #`?<Constant "E:\\\\Desktop\\\\J19B_STM8\\\\...">`
        CALL      L:assert_failed
//  757   assert_param(IS_TIM1_IC_POLARITY_OK(TIM1_ICPolarity));
??TIM1_TIxExternalClockConfig_0:
        TNZ       S:?b9
        JREQ      L:??TIM1_TIxExternalClockConfig_1
        LD        A, S:?b9
        CP        A, #0x1
        JREQ      L:??TIM1_TIxExternalClockConfig_1
        LDW       X, #0x2f5
        LDW       S:?w1, X
        CLRW      X
        LDW       S:?w0, X
        LDW       X, #`?<Constant "E:\\\\Desktop\\\\J19B_STM8\\\\...">`
        CALL      L:assert_failed
//  758   assert_param(IS_TIM1_IC_FILTER_OK(ICFilter));
??TIM1_TIxExternalClockConfig_1:
        LD        A, S:?b10
        CP        A, #0x10
        JRC       L:??TIM1_TIxExternalClockConfig_2
        LDW       X, #0x2f6
        LDW       S:?w1, X
        CLRW      X
        LDW       S:?w0, X
        LDW       X, #`?<Constant "E:\\\\Desktop\\\\J19B_STM8\\\\...">`
        CALL      L:assert_failed
//  759   
//  760   /* Configure the TIM1 Input Clock Source */
//  761   if (TIM1_TIxExternalCLKSource == TIM1_TIXEXTERNALCLK1SOURCE_TI2)
??TIM1_TIxExternalClockConfig_2:
        LD        A, S:?b8
        CP        A, #0x60
        JRNE      L:??TIM1_TIxExternalClockConfig_3
//  762   {
//  763     TI2_Config((uint8_t)TIM1_ICPolarity, (uint8_t)TIM1_ICSELECTION_DIRECTTI, (uint8_t)ICFilter);
        MOV       S:?b1, S:?b10
        MOV       S:?b0, #0x1
        LD        A, S:?b9
        CALL      L:TI2_Config
        JRA       L:??TIM1_TIxExternalClockConfig_4
//  764   }
//  765   else
//  766   {
//  767     TI1_Config((uint8_t)TIM1_ICPolarity, (uint8_t)TIM1_ICSELECTION_DIRECTTI, (uint8_t)ICFilter);
??TIM1_TIxExternalClockConfig_3:
        MOV       S:?b1, S:?b10
        MOV       S:?b0, #0x1
        LD        A, S:?b9
        CALL      L:TI1_Config
//  768   }
//  769   
//  770   /* Select the Trigger source */
//  771   TIM1_SelectInputTrigger((TIM1_TS_TypeDef)TIM1_TIxExternalCLKSource);
??TIM1_TIxExternalClockConfig_4:
        LD        A, S:?b8
        CALL      L:TIM1_SelectInputTrigger
//  772   
//  773   /* Select the External clock mode1 */
//  774   TIM1->SMCR |= (uint8_t)(TIM1_SLAVEMODE_EXTERNAL1);
        LD        A, L:0x5252
        OR        A, #0x7
        LD        L:0x5252, A
//  775 }
        POP       S:?b10
        JP        L:?epilogue_w4
//  776 
//  777 /**
//  778   * @brief  Selects the TIM1 Input Trigger source.
//  779   * @param   TIM1_InputTriggerSource specifies Input Trigger source.
//  780   * This parameter can be one of the following values:
//  781   *                       - TIM1_TS_TI1F_ED: TI1 Edge Detector
//  782   *                       - TIM1_TS_TI1FP1: Filtered Timer Input 1
//  783   *                       - TIM1_TS_TI2FP2: Filtered Timer Input 2
//  784   *                       - TIM1_TS_ETRF: External Trigger input
//  785   * @retval None
//  786   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  787 void TIM1_SelectInputTrigger(TIM1_TS_TypeDef TIM1_InputTriggerSource)
//  788 {
TIM1_SelectInputTrigger:
        PUSH      S:?b8
        LD        S:?b8, A
//  789   /* Check the parameters */
//  790   assert_param(IS_TIM1_TRIGGER_SELECTION_OK(TIM1_InputTriggerSource));
        LD        A, S:?b8
        CP        A, #0x40
        JREQ      L:??TIM1_SelectInputTrigger_0
        LD        A, S:?b8
        CP        A, #0x50
        JREQ      L:??TIM1_SelectInputTrigger_0
        LD        A, S:?b8
        CP        A, #0x60
        JREQ      L:??TIM1_SelectInputTrigger_0
        LD        A, S:?b8
        CP        A, #0x70
        JREQ      L:??TIM1_SelectInputTrigger_0
        LD        A, S:?b8
        CP        A, #0x30
        JREQ      L:??TIM1_SelectInputTrigger_0
        TNZ       S:?b8
        JREQ      L:??TIM1_SelectInputTrigger_0
        LDW       X, #0x316
        LDW       S:?w1, X
        CLRW      X
        LDW       S:?w0, X
        LDW       X, #`?<Constant "E:\\\\Desktop\\\\J19B_STM8\\\\...">`
        CALL      L:assert_failed
//  791   
//  792   /* Select the Tgigger Source */
//  793   TIM1->SMCR = (uint8_t)((uint8_t)(TIM1->SMCR & (uint8_t)(~TIM1_SMCR_TS)) | (uint8_t)TIM1_InputTriggerSource);
??TIM1_SelectInputTrigger_0:
        LD        A, L:0x5252
        AND       A, #0x8f
        OR        A, S:?b8
        LD        L:0x5252, A
//  794 }
        POP       S:?b8
        RET
//  795 
//  796 /**
//  797   * @brief  Enables or Disables the TIM1 Update event.
//  798   * @param   NewState new state of the TIM1 peripheral Preload register. This parameter can
//  799   * be ENABLE or DISABLE.
//  800   * @retval None
//  801   */
//  802 

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  803 void TIM1_UpdateDisableConfig(FunctionalState NewState)
//  804 {
TIM1_UpdateDisableConfig:
        PUSH      S:?b8
        LD        S:?b8, A
//  805   /* Check the parameters */
//  806   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
        TNZ       S:?b8
        JREQ      L:??TIM1_UpdateDisableConfig_0
        LD        A, S:?b8
        CP        A, #0x1
        JREQ      L:??TIM1_UpdateDisableConfig_0
        LDW       X, #0x326
        LDW       S:?w1, X
        CLRW      X
        LDW       S:?w0, X
        LDW       X, #`?<Constant "E:\\\\Desktop\\\\J19B_STM8\\\\...">`
        CALL      L:assert_failed
//  807   
//  808   /* Set or Reset the UDIS Bit */
//  809   if (NewState != DISABLE)
??TIM1_UpdateDisableConfig_0:
        TNZ       S:?b8
        JREQ      L:??TIM1_UpdateDisableConfig_1
//  810   {
//  811     TIM1->CR1 |= TIM1_CR1_UDIS;
        BSET      L:0x5250, #0x1
        JRA       L:??TIM1_UpdateDisableConfig_2
//  812   }
//  813   else
//  814   {
//  815     TIM1->CR1 &= (uint8_t)(~TIM1_CR1_UDIS);
??TIM1_UpdateDisableConfig_1:
        BRES      L:0x5250, #0x1
//  816   }
//  817 }
??TIM1_UpdateDisableConfig_2:
        POP       S:?b8
        RET
//  818 
//  819 /**
//  820   * @brief  Selects the TIM1 Update Request Interrupt source.
//  821   * @param   TIM1_UpdateSource specifies the Update source.
//  822   * This parameter can be one of the following values
//  823   *                       - TIM1_UPDATESOURCE_REGULAR
//  824   *                       - TIM1_UPDATESOURCE_GLOBAL
//  825   * @retval None
//  826   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  827 void TIM1_UpdateRequestConfig(TIM1_UpdateSource_TypeDef TIM1_UpdateSource)
//  828 {
TIM1_UpdateRequestConfig:
        PUSH      S:?b8
        LD        S:?b8, A
//  829   /* Check the parameters */
//  830   assert_param(IS_TIM1_UPDATE_SOURCE_OK(TIM1_UpdateSource));
        TNZ       S:?b8
        JREQ      L:??TIM1_UpdateRequestConfig_0
        LD        A, S:?b8
        CP        A, #0x1
        JREQ      L:??TIM1_UpdateRequestConfig_0
        LDW       X, #0x33e
        LDW       S:?w1, X
        CLRW      X
        LDW       S:?w0, X
        LDW       X, #`?<Constant "E:\\\\Desktop\\\\J19B_STM8\\\\...">`
        CALL      L:assert_failed
//  831   
//  832   /* Set or Reset the URS Bit */
//  833   if (TIM1_UpdateSource != TIM1_UPDATESOURCE_GLOBAL)
??TIM1_UpdateRequestConfig_0:
        TNZ       S:?b8
        JREQ      L:??TIM1_UpdateRequestConfig_1
//  834   {
//  835     TIM1->CR1 |= TIM1_CR1_URS;
        BSET      L:0x5250, #0x2
        JRA       L:??TIM1_UpdateRequestConfig_2
//  836   }
//  837   else
//  838   {
//  839     TIM1->CR1 &= (uint8_t)(~TIM1_CR1_URS);
??TIM1_UpdateRequestConfig_1:
        BRES      L:0x5250, #0x2
//  840   }
//  841 }
??TIM1_UpdateRequestConfig_2:
        POP       S:?b8
        RET
//  842 
//  843 /**
//  844   * @brief  Enables or Disables the TIM1’s Hall sensor interface.
//  845   * @param   NewState new state of the TIM1 Hall sensor interface.This parameter can
//  846   * be ENABLE or DISABLE.
//  847   * @retval None
//  848   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  849 void TIM1_SelectHallSensor(FunctionalState NewState)
//  850 {
TIM1_SelectHallSensor:
        PUSH      S:?b8
        LD        S:?b8, A
//  851   /* Check the parameters */
//  852   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
        TNZ       S:?b8
        JREQ      L:??TIM1_SelectHallSensor_0
        LD        A, S:?b8
        CP        A, #0x1
        JREQ      L:??TIM1_SelectHallSensor_0
        LDW       X, #0x354
        LDW       S:?w1, X
        CLRW      X
        LDW       S:?w0, X
        LDW       X, #`?<Constant "E:\\\\Desktop\\\\J19B_STM8\\\\...">`
        CALL      L:assert_failed
//  853   
//  854   /* Set or Reset the TI1S Bit */
//  855   if (NewState != DISABLE)
??TIM1_SelectHallSensor_0:
        TNZ       S:?b8
        JREQ      L:??TIM1_SelectHallSensor_1
//  856   {
//  857     TIM1->CR2 |= TIM1_CR2_TI1S;
        BSET      L:0x5251, #0x7
        JRA       L:??TIM1_SelectHallSensor_2
//  858   }
//  859   else
//  860   {
//  861     TIM1->CR2 &= (uint8_t)(~TIM1_CR2_TI1S);
??TIM1_SelectHallSensor_1:
        BRES      L:0x5251, #0x7
//  862   }
//  863 }
??TIM1_SelectHallSensor_2:
        POP       S:?b8
        RET
//  864 
//  865 /**
//  866   * @brief  Selects the TIM1’s One Pulse Mode.
//  867   * @param   TIM1_OPMode specifies the OPM Mode to be used.
//  868   * This parameter can be one of the following values
//  869   *                    - TIM1_OPMODE_SINGLE
//  870   *                    - TIM1_OPMODE_REPETITIVE
//  871   * @retval None
//  872   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  873 void TIM1_SelectOnePulseMode(TIM1_OPMode_TypeDef TIM1_OPMode)
//  874 {
TIM1_SelectOnePulseMode:
        PUSH      S:?b8
        LD        S:?b8, A
//  875   /* Check the parameters */
//  876   assert_param(IS_TIM1_OPM_MODE_OK(TIM1_OPMode));
        LD        A, S:?b8
        CP        A, #0x1
        JREQ      L:??TIM1_SelectOnePulseMode_0
        TNZ       S:?b8
        JREQ      L:??TIM1_SelectOnePulseMode_0
        LDW       X, #0x36c
        LDW       S:?w1, X
        CLRW      X
        LDW       S:?w0, X
        LDW       X, #`?<Constant "E:\\\\Desktop\\\\J19B_STM8\\\\...">`
        CALL      L:assert_failed
//  877   
//  878   /* Set or Reset the OPM Bit */
//  879   if (TIM1_OPMode != TIM1_OPMODE_REPETITIVE)
??TIM1_SelectOnePulseMode_0:
        TNZ       S:?b8
        JREQ      L:??TIM1_SelectOnePulseMode_1
//  880   {
//  881     TIM1->CR1 |= TIM1_CR1_OPM;
        BSET      L:0x5250, #0x3
        JRA       L:??TIM1_SelectOnePulseMode_2
//  882   }
//  883   else
//  884   {
//  885     TIM1->CR1 &= (uint8_t)(~TIM1_CR1_OPM);
??TIM1_SelectOnePulseMode_1:
        BRES      L:0x5250, #0x3
//  886   }
//  887   
//  888 }
??TIM1_SelectOnePulseMode_2:
        POP       S:?b8
        RET
//  889 
//  890 /**
//  891   * @brief  Selects the TIM1 Trigger Output Mode.
//  892   * @param   TIM1_TRGOSource specifies the Trigger Output source.
//  893   * This parameter can be one of the following values
//  894   *                       - TIM1_TRGOSOURCE_RESET
//  895   *                       - TIM1_TRGOSOURCE_ENABLE
//  896   *                       - TIM1_TRGOSOURCE_UPDATE
//  897   *                       - TIM1_TRGOSource_OC1
//  898   *                       - TIM1_TRGOSOURCE_OC1REF
//  899   *                       - TIM1_TRGOSOURCE_OC2REF
//  900   *                       - TIM1_TRGOSOURCE_OC3REF
//  901   * @retval None
//  902   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  903 void TIM1_SelectOutputTrigger(TIM1_TRGOSource_TypeDef TIM1_TRGOSource)
//  904 {
TIM1_SelectOutputTrigger:
        PUSH      S:?b8
        LD        S:?b8, A
//  905   /* Check the parameters */
//  906   assert_param(IS_TIM1_TRGO_SOURCE_OK(TIM1_TRGOSource));
        TNZ       S:?b8
        JREQ      L:??TIM1_SelectOutputTrigger_0
        LD        A, S:?b8
        CP        A, #0x10
        JREQ      L:??TIM1_SelectOutputTrigger_0
        LD        A, S:?b8
        CP        A, #0x20
        JREQ      L:??TIM1_SelectOutputTrigger_0
        LD        A, S:?b8
        CP        A, #0x30
        JREQ      L:??TIM1_SelectOutputTrigger_0
        LD        A, S:?b8
        CP        A, #0x40
        JREQ      L:??TIM1_SelectOutputTrigger_0
        LD        A, S:?b8
        CP        A, #0x50
        JREQ      L:??TIM1_SelectOutputTrigger_0
        LD        A, S:?b8
        CP        A, #0x60
        JREQ      L:??TIM1_SelectOutputTrigger_0
        LDW       X, #0x38a
        LDW       S:?w1, X
        CLRW      X
        LDW       S:?w0, X
        LDW       X, #`?<Constant "E:\\\\Desktop\\\\J19B_STM8\\\\...">`
        CALL      L:assert_failed
//  907   
//  908   /* Reset the MMS Bits & Select the TRGO source */
//  909   TIM1->CR2 = (uint8_t)((uint8_t)(TIM1->CR2 & (uint8_t)(~TIM1_CR2_MMS)) | 
//  910                         (uint8_t) TIM1_TRGOSource);
??TIM1_SelectOutputTrigger_0:
        LD        A, L:0x5251
        AND       A, #0x8f
        OR        A, S:?b8
        LD        L:0x5251, A
//  911 }
        POP       S:?b8
        RET
//  912 
//  913 /**
//  914   * @brief  Selects the TIM1 Slave Mode.
//  915   * @param   TIM1_SlaveMode specifies the TIM1 Slave Mode.
//  916   * This parameter can be one of the following values
//  917   *                       - TIM1_SLAVEMODE_RESET
//  918   *                       - TIM1_SLAVEMODE_GATED
//  919   *                       - TIM1_SLAVEMODE_TRIGGER
//  920   *                       - TIM1_SLAVEMODE_EXTERNAL1
//  921   * @retval None
//  922   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  923 void TIM1_SelectSlaveMode(TIM1_SlaveMode_TypeDef TIM1_SlaveMode)
//  924 {
TIM1_SelectSlaveMode:
        PUSH      S:?b8
        LD        S:?b8, A
//  925   /* Check the parameters */
//  926   assert_param(IS_TIM1_SLAVE_MODE_OK(TIM1_SlaveMode));
        LD        A, S:?b8
        CP        A, #0x4
        JREQ      L:??TIM1_SelectSlaveMode_0
        LD        A, S:?b8
        CP        A, #0x5
        JREQ      L:??TIM1_SelectSlaveMode_0
        LD        A, S:?b8
        CP        A, #0x6
        JREQ      L:??TIM1_SelectSlaveMode_0
        LD        A, S:?b8
        CP        A, #0x7
        JREQ      L:??TIM1_SelectSlaveMode_0
        LDW       X, #0x39e
        LDW       S:?w1, X
        CLRW      X
        LDW       S:?w0, X
        LDW       X, #`?<Constant "E:\\\\Desktop\\\\J19B_STM8\\\\...">`
        CALL      L:assert_failed
//  927   
//  928   /* Reset the SMS Bits */ /* Select the Slave Mode */
//  929   TIM1->SMCR = (uint8_t)((uint8_t)(TIM1->SMCR & (uint8_t)(~TIM1_SMCR_SMS)) |
//  930                          (uint8_t)TIM1_SlaveMode);
??TIM1_SelectSlaveMode_0:
        LD        A, L:0x5252
        AND       A, #0xf8
        OR        A, S:?b8
        LD        L:0x5252, A
//  931 }
        POP       S:?b8
        RET
//  932 
//  933 /**
//  934   * @brief  Sets or Resets the TIM1 Master/Slave Mode.
//  935   * @param   NewState new state of the synchronization between TIM1 and its slaves
//  936   *  (through TRGO). This parameter can be ENABLE or DISABLE.
//  937   * @retval None
//  938   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  939 void TIM1_SelectMasterSlaveMode(FunctionalState NewState)
//  940 {
TIM1_SelectMasterSlaveMode:
        PUSH      S:?b8
        LD        S:?b8, A
//  941   /* Check the parameters */
//  942   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
        TNZ       S:?b8
        JREQ      L:??TIM1_SelectMasterSlaveMode_0
        LD        A, S:?b8
        CP        A, #0x1
        JREQ      L:??TIM1_SelectMasterSlaveMode_0
        LDW       X, #0x3ae
        LDW       S:?w1, X
        CLRW      X
        LDW       S:?w0, X
        LDW       X, #`?<Constant "E:\\\\Desktop\\\\J19B_STM8\\\\...">`
        CALL      L:assert_failed
//  943   
//  944   /* Set or Reset the MSM Bit */
//  945   if (NewState != DISABLE)
??TIM1_SelectMasterSlaveMode_0:
        TNZ       S:?b8
        JREQ      L:??TIM1_SelectMasterSlaveMode_1
//  946   {
//  947     TIM1->SMCR |= TIM1_SMCR_MSM;
        BSET      L:0x5252, #0x7
        JRA       L:??TIM1_SelectMasterSlaveMode_2
//  948   }
//  949   else
//  950   {
//  951     TIM1->SMCR &= (uint8_t)(~TIM1_SMCR_MSM);
??TIM1_SelectMasterSlaveMode_1:
        BRES      L:0x5252, #0x7
//  952   }
//  953 }
??TIM1_SelectMasterSlaveMode_2:
        POP       S:?b8
        RET
//  954 
//  955 /**
//  956   * @brief  Configures the TIM1 Encoder Interface.
//  957   * @param   TIM1_EncoderMode specifies the TIM1 Encoder Mode.
//  958   * This parameter can be one of the following values
//  959   * - TIM1_ENCODERMODE_TI1: Counter counts on TI1FP1 edge
//  960 	* depending on TI2FP2 level.
//  961   * - TIM1_ENCODERMODE_TI2: Counter counts on TI2FP2 edge
//  962   *	depending on TI1FP1 level.
//  963   * - TIM1_ENCODERMODE_TI12: Counter counts on both TI1FP1 and
//  964   * TI2FP2 edges depending on the level of the other input.
//  965   * @param   TIM1_IC1Polarity specifies the IC1 Polarity.
//  966   * This parameter can be one of the following values
//  967   *                       - TIM1_ICPOLARITY_FALLING
//  968   *                       - TIM1_ICPOLARITY_RISING
//  969   * @param   TIM1_IC2Polarity specifies the IC2 Polarity.
//  970   * This parameter can be one of the following values
//  971   *                       - TIM1_ICPOLARITY_FALLING
//  972   *                       - TIM1_ICPOLARITY_RISING
//  973   * @retval None
//  974   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  975 void TIM1_EncoderInterfaceConfig(TIM1_EncoderMode_TypeDef TIM1_EncoderMode,
//  976                                  TIM1_ICPolarity_TypeDef TIM1_IC1Polarity,
//  977                                  TIM1_ICPolarity_TypeDef TIM1_IC2Polarity)
//  978 {
TIM1_EncoderInterfaceConfig:
        CALL      L:?push_w4
        PUSH      S:?b10
        LD        S:?b10, A
        MOV       S:?b8, S:?b0
        MOV       S:?b9, S:?b1
//  979   /* Check the parameters */
//  980   assert_param(IS_TIM1_ENCODER_MODE_OK(TIM1_EncoderMode));
        LD        A, S:?b10
        CP        A, #0x1
        JREQ      L:??TIM1_EncoderInterfaceConfig_0
        LD        A, S:?b10
        CP        A, #0x2
        JREQ      L:??TIM1_EncoderInterfaceConfig_0
        LD        A, S:?b10
        CP        A, #0x3
        JREQ      L:??TIM1_EncoderInterfaceConfig_0
        LDW       X, #0x3d4
        LDW       S:?w1, X
        CLRW      X
        LDW       S:?w0, X
        LDW       X, #`?<Constant "E:\\\\Desktop\\\\J19B_STM8\\\\...">`
        CALL      L:assert_failed
//  981   assert_param(IS_TIM1_IC_POLARITY_OK(TIM1_IC1Polarity));
??TIM1_EncoderInterfaceConfig_0:
        TNZ       S:?b8
        JREQ      L:??TIM1_EncoderInterfaceConfig_1
        LD        A, S:?b8
        CP        A, #0x1
        JREQ      L:??TIM1_EncoderInterfaceConfig_1
        LDW       X, #0x3d5
        LDW       S:?w1, X
        CLRW      X
        LDW       S:?w0, X
        LDW       X, #`?<Constant "E:\\\\Desktop\\\\J19B_STM8\\\\...">`
        CALL      L:assert_failed
//  982   assert_param(IS_TIM1_IC_POLARITY_OK(TIM1_IC2Polarity));
??TIM1_EncoderInterfaceConfig_1:
        TNZ       S:?b9
        JREQ      L:??TIM1_EncoderInterfaceConfig_2
        LD        A, S:?b9
        CP        A, #0x1
        JREQ      L:??TIM1_EncoderInterfaceConfig_2
        LDW       X, #0x3d6
        LDW       S:?w1, X
        CLRW      X
        LDW       S:?w0, X
        LDW       X, #`?<Constant "E:\\\\Desktop\\\\J19B_STM8\\\\...">`
        CALL      L:assert_failed
//  983   
//  984   /* Set the TI1 and the TI2 Polarities */
//  985   if (TIM1_IC1Polarity != TIM1_ICPOLARITY_RISING)
??TIM1_EncoderInterfaceConfig_2:
        TNZ       S:?b8
        JREQ      L:??TIM1_EncoderInterfaceConfig_3
//  986   {
//  987     TIM1->CCER1 |= TIM1_CCER1_CC1P;
        BSET      L:0x525c, #0x1
        JRA       L:??TIM1_EncoderInterfaceConfig_4
//  988   }
//  989   else
//  990   {
//  991     TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC1P);
??TIM1_EncoderInterfaceConfig_3:
        BRES      L:0x525c, #0x1
//  992   }
//  993   
//  994   if (TIM1_IC2Polarity != TIM1_ICPOLARITY_RISING)
??TIM1_EncoderInterfaceConfig_4:
        TNZ       S:?b9
        JREQ      L:??TIM1_EncoderInterfaceConfig_5
//  995   {
//  996     TIM1->CCER1 |= TIM1_CCER1_CC2P;
        BSET      L:0x525c, #0x5
        JRA       L:??TIM1_EncoderInterfaceConfig_6
//  997   }
//  998   else
//  999   {
// 1000     TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC2P);
??TIM1_EncoderInterfaceConfig_5:
        BRES      L:0x525c, #0x5
// 1001   }
// 1002   /* Set the encoder Mode */
// 1003   TIM1->SMCR = (uint8_t)((uint8_t)(TIM1->SMCR & (uint8_t)(TIM1_SMCR_MSM | TIM1_SMCR_TS))
// 1004                          | (uint8_t) TIM1_EncoderMode);
??TIM1_EncoderInterfaceConfig_6:
        LD        A, L:0x5252
        AND       A, #0xf0
        OR        A, S:?b10
        LD        L:0x5252, A
// 1005   
// 1006   /* Select the Capture Compare 1 and the Capture Compare 2 as input */
// 1007   TIM1->CCMR1 = (uint8_t)((uint8_t)(TIM1->CCMR1 & (uint8_t)(~TIM1_CCMR_CCxS)) 
// 1008                           | (uint8_t) CCMR_TIxDirect_Set);
        LD        A, L:0x5258
        AND       A, #0xfc
        OR        A, #0x1
        LD        L:0x5258, A
// 1009   TIM1->CCMR2 = (uint8_t)((uint8_t)(TIM1->CCMR2 & (uint8_t)(~TIM1_CCMR_CCxS))
// 1010                           | (uint8_t) CCMR_TIxDirect_Set);
        LD        A, L:0x5259
        AND       A, #0xfc
        OR        A, #0x1
        LD        L:0x5259, A
// 1011 }
        POP       S:?b10
        JP        L:?epilogue_w4
// 1012 
// 1013 /**
// 1014   * @brief  Configures the TIM1 Prescaler.
// 1015   * @param   Prescaler specifies the Prescaler Register value
// 1016   * This parameter must be a value between 0x0000 and 0xFFFF
// 1017   * @param   TIM1_PSCReloadMode specifies the TIM1 Prescaler Reload mode.
// 1018   * This parameter can be one of the following values
// 1019   * - TIM1_PSCRELOADMODE_IMMEDIATE: The Prescaler is loaded immediately.
// 1020   * - TIM1_PSCRELOADMODE_UPDATE: The Prescaler is loaded at the update event.
// 1021   * @retval None
// 1022   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
// 1023 void TIM1_PrescalerConfig(uint16_t Prescaler,
// 1024                           TIM1_PSCReloadMode_TypeDef TIM1_PSCReloadMode)
// 1025 {
TIM1_PrescalerConfig:
        CALL      L:?push_w5
        PUSH      S:?b8
        LDW       S:?w5, X
        LD        S:?b8, A
// 1026   /* Check the parameters */
// 1027   assert_param(IS_TIM1_PRESCALER_RELOAD_OK(TIM1_PSCReloadMode));
        TNZ       S:?b8
        JREQ      L:??TIM1_PrescalerConfig_0
        LD        A, S:?b8
        CP        A, #0x1
        JREQ      L:??TIM1_PrescalerConfig_0
        LDW       X, #0x403
        LDW       S:?w1, X
        CLRW      X
        LDW       S:?w0, X
        LDW       X, #`?<Constant "E:\\\\Desktop\\\\J19B_STM8\\\\...">`
        CALL      L:assert_failed
// 1028   
// 1029   /* Set the Prescaler value */
// 1030   TIM1->PSCRH = (uint8_t)(Prescaler >> 8);
??TIM1_PrescalerConfig_0:
        LDW       X, S:?w5
        CLR       A
        RRWA      X, A
        LD        A, XL
        LD        L:0x5260, A
// 1031   TIM1->PSCRL = (uint8_t)(Prescaler);
        LD        A, S:?b11
        LD        L:0x5261, A
// 1032   
// 1033   /* Set or reset the UG Bit */
// 1034   TIM1->EGR = (uint8_t)TIM1_PSCReloadMode;
        LD        A, S:?b8
        LD        L:0x5257, A
// 1035 }
        POP       S:?b8
        CALL      L:?pop_w5
        RET
// 1036 
// 1037 /**
// 1038   * @brief  Specifies the TIM1 Counter Mode to be used.
// 1039   * @param   TIM1_CounterMode specifies the Counter Mode to be used
// 1040   * This parameter can be one of the following values:
// 1041   * - TIM1_COUNTERMODE_UP: TIM1 Up Counting Mode
// 1042   * - TIM1_COUNTERMODE_DOWN: TIM1 Down Counting Mode
// 1043   * - TIM1_COUNTERMODE_CENTERALIGNED1: TIM1 Center Aligned Mode1
// 1044   * - TIM1_CounterMode_CenterAligned2: TIM1 Center Aligned Mode2
// 1045   * - TIM1_COUNTERMODE_CENTERALIGNED3: TIM1 Center Aligned Mode3
// 1046   * @retval None
// 1047   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
// 1048 void TIM1_CounterModeConfig(TIM1_CounterMode_TypeDef TIM1_CounterMode)
// 1049 {
TIM1_CounterModeConfig:
        PUSH      S:?b8
        LD        S:?b8, A
// 1050   /* Check the parameters */
// 1051   assert_param(IS_TIM1_COUNTER_MODE_OK(TIM1_CounterMode));
        TNZ       S:?b8
        JREQ      L:??TIM1_CounterModeConfig_0
        LD        A, S:?b8
        CP        A, #0x10
        JREQ      L:??TIM1_CounterModeConfig_0
        LD        A, S:?b8
        CP        A, #0x20
        JREQ      L:??TIM1_CounterModeConfig_0
        LD        A, S:?b8
        CP        A, #0x40
        JREQ      L:??TIM1_CounterModeConfig_0
        LD        A, S:?b8
        CP        A, #0x60
        JREQ      L:??TIM1_CounterModeConfig_0
        LDW       X, #0x41b
        LDW       S:?w1, X
        CLRW      X
        LDW       S:?w0, X
        LDW       X, #`?<Constant "E:\\\\Desktop\\\\J19B_STM8\\\\...">`
        CALL      L:assert_failed
// 1052   
// 1053   
// 1054   /* Reset the CMS and DIR Bits & Set the Counter Mode */
// 1055   TIM1->CR1 = (uint8_t)((uint8_t)(TIM1->CR1 & (uint8_t)((uint8_t)(~TIM1_CR1_CMS) & (uint8_t)(~TIM1_CR1_DIR)))
// 1056                         | (uint8_t)TIM1_CounterMode);
??TIM1_CounterModeConfig_0:
        LD        A, L:0x5250
        AND       A, #0x8f
        OR        A, S:?b8
        LD        L:0x5250, A
// 1057 }
        POP       S:?b8
        RET
// 1058 
// 1059 /**
// 1060   * @brief  Forces the TIM1 Channel1 output waveform to active or inactive level.
// 1061   * @param   TIM1_ForcedAction specifies the forced Action to be set to the output waveform.
// 1062   * This parameter can be one of the following values:
// 1063   * - TIM1_FORCEDACTION_ACTIVE: Force active level on OC1REF
// 1064   * - TIM1_FORCEDACTION_INACTIVE: Force inactive level on OC1REF.
// 1065   * @retval None
// 1066   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
// 1067 void TIM1_ForcedOC1Config(TIM1_ForcedAction_TypeDef TIM1_ForcedAction)
// 1068 {
TIM1_ForcedOC1Config:
        PUSH      S:?b8
        LD        S:?b8, A
// 1069   /* Check the parameters */
// 1070   assert_param(IS_TIM1_FORCED_ACTION_OK(TIM1_ForcedAction));
        LD        A, S:?b8
        CP        A, #0x50
        JREQ      L:??TIM1_ForcedOC1Config_0
        LD        A, S:?b8
        CP        A, #0x40
        JREQ      L:??TIM1_ForcedOC1Config_0
        LDW       X, #0x42e
        LDW       S:?w1, X
        CLRW      X
        LDW       S:?w0, X
        LDW       X, #`?<Constant "E:\\\\Desktop\\\\J19B_STM8\\\\...">`
        CALL      L:assert_failed
// 1071   
// 1072   /* Reset the OCM Bits & Configure the Forced output Mode */
// 1073   TIM1->CCMR1 =  (uint8_t)((uint8_t)(TIM1->CCMR1 & (uint8_t)(~TIM1_CCMR_OCM))|
// 1074                            (uint8_t)TIM1_ForcedAction);
??TIM1_ForcedOC1Config_0:
        LD        A, L:0x5258
        AND       A, #0x8f
        OR        A, S:?b8
        LD        L:0x5258, A
// 1075 }
        POP       S:?b8
        RET
// 1076 
// 1077 /**
// 1078   * @brief  Forces the TIM1 Channel2 output waveform to active or inactive level.
// 1079   * @param   TIM1_ForcedAction specifies the forced Action to be set to the output waveform.
// 1080   * This parameter can be one of the following values:
// 1081   * - TIM1_FORCEDACTION_ACTIVE: Force active level on OC2REF
// 1082   * - TIM1_FORCEDACTION_INACTIVE: Force inactive level on OC2REF.
// 1083   * @retval None
// 1084   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
// 1085 void TIM1_ForcedOC2Config(TIM1_ForcedAction_TypeDef TIM1_ForcedAction)
// 1086 {
TIM1_ForcedOC2Config:
        PUSH      S:?b8
        LD        S:?b8, A
// 1087   /* Check the parameters */
// 1088   assert_param(IS_TIM1_FORCED_ACTION_OK(TIM1_ForcedAction));
        LD        A, S:?b8
        CP        A, #0x50
        JREQ      L:??TIM1_ForcedOC2Config_0
        LD        A, S:?b8
        CP        A, #0x40
        JREQ      L:??TIM1_ForcedOC2Config_0
        LDW       X, #0x440
        LDW       S:?w1, X
        CLRW      X
        LDW       S:?w0, X
        LDW       X, #`?<Constant "E:\\\\Desktop\\\\J19B_STM8\\\\...">`
        CALL      L:assert_failed
// 1089   
// 1090   /* Reset the OCM Bits & Configure the Forced output Mode */
// 1091   TIM1->CCMR2  =  (uint8_t)((uint8_t)(TIM1->CCMR2 & (uint8_t)(~TIM1_CCMR_OCM))
// 1092                             | (uint8_t)TIM1_ForcedAction);
??TIM1_ForcedOC2Config_0:
        LD        A, L:0x5259
        AND       A, #0x8f
        OR        A, S:?b8
        LD        L:0x5259, A
// 1093 }
        POP       S:?b8
        RET
// 1094 
// 1095 /**
// 1096   * @brief  Forces the TIM1 Channel3 output waveform to active or inactive level.
// 1097   * @param   TIM1_ForcedAction specifies the forced Action to be set to the output waveform.
// 1098   * This parameter can be one of the following values:
// 1099   *                       - TIM1_FORCEDACTION_ACTIVE: Force active level on OC3REF
// 1100   *                       - TIM1_FORCEDACTION_INACTIVE: Force inactive level on
// 1101   *                         OC3REF.
// 1102   * @retval None
// 1103   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
// 1104 void TIM1_ForcedOC3Config(TIM1_ForcedAction_TypeDef TIM1_ForcedAction)
// 1105 {
TIM1_ForcedOC3Config:
        PUSH      S:?b8
        LD        S:?b8, A
// 1106   /* Check the parameters */
// 1107   assert_param(IS_TIM1_FORCED_ACTION_OK(TIM1_ForcedAction));
        LD        A, S:?b8
        CP        A, #0x50
        JREQ      L:??TIM1_ForcedOC3Config_0
        LD        A, S:?b8
        CP        A, #0x40
        JREQ      L:??TIM1_ForcedOC3Config_0
        LDW       X, #0x453
        LDW       S:?w1, X
        CLRW      X
        LDW       S:?w0, X
        LDW       X, #`?<Constant "E:\\\\Desktop\\\\J19B_STM8\\\\...">`
        CALL      L:assert_failed
// 1108   
// 1109   /* Reset the OCM Bits */ /* Configure The Forced output Mode */
// 1110   TIM1->CCMR3  =  (uint8_t)((uint8_t)(TIM1->CCMR3 & (uint8_t)(~TIM1_CCMR_OCM))  
// 1111                             | (uint8_t)TIM1_ForcedAction);
??TIM1_ForcedOC3Config_0:
        LD        A, L:0x525a
        AND       A, #0x8f
        OR        A, S:?b8
        LD        L:0x525a, A
// 1112 }
        POP       S:?b8
        RET
// 1113 
// 1114 /**
// 1115   * @brief  Forces the TIM1 Channel4 output waveform to active or inactive level.
// 1116   * @param   TIM1_ForcedAction specifies the forced Action to be set to the output waveform.
// 1117   * This parameter can be one of the following values:
// 1118   *                       - TIM1_FORCEDACTION_ACTIVE: Force active level on OC4REF
// 1119   *                       - TIM1_FORCEDACTION_INACTIVE: Force inactive level on
// 1120   *                         OC4REF.
// 1121   * @retval None
// 1122   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
// 1123 void TIM1_ForcedOC4Config(TIM1_ForcedAction_TypeDef TIM1_ForcedAction)
// 1124 {
TIM1_ForcedOC4Config:
        PUSH      S:?b8
        LD        S:?b8, A
// 1125   /* Check the parameters */
// 1126   assert_param(IS_TIM1_FORCED_ACTION_OK(TIM1_ForcedAction));
        LD        A, S:?b8
        CP        A, #0x50
        JREQ      L:??TIM1_ForcedOC4Config_0
        LD        A, S:?b8
        CP        A, #0x40
        JREQ      L:??TIM1_ForcedOC4Config_0
        LDW       X, #0x466
        LDW       S:?w1, X
        CLRW      X
        LDW       S:?w0, X
        LDW       X, #`?<Constant "E:\\\\Desktop\\\\J19B_STM8\\\\...">`
        CALL      L:assert_failed
// 1127   
// 1128   /* Reset the OCM Bits & Configure the Forced output Mode */
// 1129   TIM1->CCMR4  =  (uint8_t)((uint8_t)(TIM1->CCMR4 & (uint8_t)(~TIM1_CCMR_OCM)) 
// 1130                             | (uint8_t)TIM1_ForcedAction);
??TIM1_ForcedOC4Config_0:
        LD        A, L:0x525b
        AND       A, #0x8f
        OR        A, S:?b8
        LD        L:0x525b, A
// 1131 }
        POP       S:?b8
        RET
// 1132 
// 1133 /**
// 1134   * @brief  Enables or disables TIM1 peripheral Preload register on ARR.
// 1135   * @param   NewState new state of the TIM1 peripheral Preload register.
// 1136   * This parameter can be ENABLE or DISABLE.
// 1137   * @retval None
// 1138   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
// 1139 void TIM1_ARRPreloadConfig(FunctionalState NewState)
// 1140 {
TIM1_ARRPreloadConfig:
        PUSH      S:?b8
        LD        S:?b8, A
// 1141   /* Check the parameters */
// 1142   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
        TNZ       S:?b8
        JREQ      L:??TIM1_ARRPreloadConfig_0
        LD        A, S:?b8
        CP        A, #0x1
        JREQ      L:??TIM1_ARRPreloadConfig_0
        LDW       X, #0x476
        LDW       S:?w1, X
        CLRW      X
        LDW       S:?w0, X
        LDW       X, #`?<Constant "E:\\\\Desktop\\\\J19B_STM8\\\\...">`
        CALL      L:assert_failed
// 1143   
// 1144   /* Set or Reset the ARPE Bit */
// 1145   if (NewState != DISABLE)
??TIM1_ARRPreloadConfig_0:
        TNZ       S:?b8
        JREQ      L:??TIM1_ARRPreloadConfig_1
// 1146   {
// 1147     TIM1->CR1 |= TIM1_CR1_ARPE;
        BSET      L:0x5250, #0x7
        JRA       L:??TIM1_ARRPreloadConfig_2
// 1148   }
// 1149   else
// 1150   {
// 1151     TIM1->CR1 &= (uint8_t)(~TIM1_CR1_ARPE);
??TIM1_ARRPreloadConfig_1:
        BRES      L:0x5250, #0x7
// 1152   }
// 1153 }
??TIM1_ARRPreloadConfig_2:
        POP       S:?b8
        RET
// 1154 
// 1155 /**
// 1156   * @brief  Selects the TIM1 peripheral Commutation event.
// 1157   * @param   NewState new state of the Commutation event.
// 1158   * This parameter can be ENABLE or DISABLE.
// 1159   * @retval None
// 1160   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
// 1161 void TIM1_SelectCOM(FunctionalState NewState)
// 1162 {
TIM1_SelectCOM:
        PUSH      S:?b8
        LD        S:?b8, A
// 1163   /* Check the parameters */
// 1164   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
        TNZ       S:?b8
        JREQ      L:??TIM1_SelectCOM_0
        LD        A, S:?b8
        CP        A, #0x1
        JREQ      L:??TIM1_SelectCOM_0
        LDW       X, #0x48c
        LDW       S:?w1, X
        CLRW      X
        LDW       S:?w0, X
        LDW       X, #`?<Constant "E:\\\\Desktop\\\\J19B_STM8\\\\...">`
        CALL      L:assert_failed
// 1165   
// 1166   /* Set or Reset the COMS Bit */
// 1167   if (NewState != DISABLE)
??TIM1_SelectCOM_0:
        TNZ       S:?b8
        JREQ      L:??TIM1_SelectCOM_1
// 1168   {
// 1169     TIM1->CR2 |= TIM1_CR2_COMS;
        BSET      L:0x5251, #0x2
        JRA       L:??TIM1_SelectCOM_2
// 1170   }
// 1171   else
// 1172   {
// 1173     TIM1->CR2 &= (uint8_t)(~TIM1_CR2_COMS);
??TIM1_SelectCOM_1:
        BRES      L:0x5251, #0x2
// 1174   }
// 1175 }
??TIM1_SelectCOM_2:
        POP       S:?b8
        RET
// 1176 
// 1177 /**
// 1178   * @brief  Sets or Resets the TIM1 peripheral Capture Compare Preload Control bit.
// 1179   * @param   NewState new state of the Capture Compare Preload Control bit.
// 1180   * This parameter can be ENABLE or DISABLE.
// 1181   * @retval None
// 1182   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
// 1183 void TIM1_CCPreloadControl(FunctionalState NewState)
// 1184 {
TIM1_CCPreloadControl:
        PUSH      S:?b8
        LD        S:?b8, A
// 1185   /* Check the parameters */
// 1186   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
        TNZ       S:?b8
        JREQ      L:??TIM1_CCPreloadControl_0
        LD        A, S:?b8
        CP        A, #0x1
        JREQ      L:??TIM1_CCPreloadControl_0
        LDW       X, #0x4a2
        LDW       S:?w1, X
        CLRW      X
        LDW       S:?w0, X
        LDW       X, #`?<Constant "E:\\\\Desktop\\\\J19B_STM8\\\\...">`
        CALL      L:assert_failed
// 1187   
// 1188   /* Set or Reset the CCPC Bit */
// 1189   if (NewState != DISABLE)
??TIM1_CCPreloadControl_0:
        TNZ       S:?b8
        JREQ      L:??TIM1_CCPreloadControl_1
// 1190   {
// 1191     TIM1->CR2 |= TIM1_CR2_CCPC;
        BSET      L:0x5251, #0x0
        JRA       L:??TIM1_CCPreloadControl_2
// 1192   }
// 1193   else
// 1194   {
// 1195     TIM1->CR2 &= (uint8_t)(~TIM1_CR2_CCPC);
??TIM1_CCPreloadControl_1:
        BRES      L:0x5251, #0x0
// 1196   }
// 1197 }
??TIM1_CCPreloadControl_2:
        POP       S:?b8
        RET
// 1198 
// 1199 /**
// 1200   * @brief  Enables or disables the TIM1 peripheral Preload Register on CCR1.
// 1201   * @param   NewState new state of the Capture Compare Preload register.
// 1202   * This parameter can be ENABLE or DISABLE.
// 1203   * @retval None
// 1204   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
// 1205 void TIM1_OC1PreloadConfig(FunctionalState NewState)
// 1206 {
TIM1_OC1PreloadConfig:
        PUSH      S:?b8
        LD        S:?b8, A
// 1207   /* Check the parameters */
// 1208   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
        TNZ       S:?b8
        JREQ      L:??TIM1_OC1PreloadConfig_0
        LD        A, S:?b8
        CP        A, #0x1
        JREQ      L:??TIM1_OC1PreloadConfig_0
        LDW       X, #0x4b8
        LDW       S:?w1, X
        CLRW      X
        LDW       S:?w0, X
        LDW       X, #`?<Constant "E:\\\\Desktop\\\\J19B_STM8\\\\...">`
        CALL      L:assert_failed
// 1209   
// 1210   /* Set or Reset the OC1PE Bit */
// 1211   if (NewState != DISABLE)
??TIM1_OC1PreloadConfig_0:
        TNZ       S:?b8
        JREQ      L:??TIM1_OC1PreloadConfig_1
// 1212   {
// 1213     TIM1->CCMR1 |= TIM1_CCMR_OCxPE;
        BSET      L:0x5258, #0x3
        JRA       L:??TIM1_OC1PreloadConfig_2
// 1214   }
// 1215   else
// 1216   {
// 1217     TIM1->CCMR1 &= (uint8_t)(~TIM1_CCMR_OCxPE);
??TIM1_OC1PreloadConfig_1:
        BRES      L:0x5258, #0x3
// 1218   }
// 1219 }
??TIM1_OC1PreloadConfig_2:
        POP       S:?b8
        RET
// 1220 
// 1221 /**
// 1222   * @brief  Enables or disables the TIM1 peripheral Preload Register on CCR2.
// 1223   * @param   NewState new state of the Capture Compare Preload register.
// 1224   * This parameter can be ENABLE or DISABLE.
// 1225   * @retval None
// 1226   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
// 1227 void TIM1_OC2PreloadConfig(FunctionalState NewState)
// 1228 {
TIM1_OC2PreloadConfig:
        PUSH      S:?b8
        LD        S:?b8, A
// 1229   /* Check the parameters */
// 1230   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
        TNZ       S:?b8
        JREQ      L:??TIM1_OC2PreloadConfig_0
        LD        A, S:?b8
        CP        A, #0x1
        JREQ      L:??TIM1_OC2PreloadConfig_0
        LDW       X, #0x4ce
        LDW       S:?w1, X
        CLRW      X
        LDW       S:?w0, X
        LDW       X, #`?<Constant "E:\\\\Desktop\\\\J19B_STM8\\\\...">`
        CALL      L:assert_failed
// 1231   
// 1232   /* Set or Reset the OC2PE Bit */
// 1233   if (NewState != DISABLE)
??TIM1_OC2PreloadConfig_0:
        TNZ       S:?b8
        JREQ      L:??TIM1_OC2PreloadConfig_1
// 1234   {
// 1235     TIM1->CCMR2 |= TIM1_CCMR_OCxPE;
        BSET      L:0x5259, #0x3
        JRA       L:??TIM1_OC2PreloadConfig_2
// 1236   }
// 1237   else
// 1238   {
// 1239     TIM1->CCMR2 &= (uint8_t)(~TIM1_CCMR_OCxPE);
??TIM1_OC2PreloadConfig_1:
        BRES      L:0x5259, #0x3
// 1240   }
// 1241 }
??TIM1_OC2PreloadConfig_2:
        POP       S:?b8
        RET
// 1242 
// 1243 /**
// 1244   * @brief  Enables or disables the TIM1 peripheral Preload Register on CCR3.
// 1245   * @param   NewState new state of the Capture Compare Preload register.
// 1246   * This parameter can be ENABLE or DISABLE.
// 1247   * @retval None
// 1248   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
// 1249 void TIM1_OC3PreloadConfig(FunctionalState NewState)
// 1250 {
TIM1_OC3PreloadConfig:
        PUSH      S:?b8
        LD        S:?b8, A
// 1251   /* Check the parameters */
// 1252   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
        TNZ       S:?b8
        JREQ      L:??TIM1_OC3PreloadConfig_0
        LD        A, S:?b8
        CP        A, #0x1
        JREQ      L:??TIM1_OC3PreloadConfig_0
        LDW       X, #0x4e4
        LDW       S:?w1, X
        CLRW      X
        LDW       S:?w0, X
        LDW       X, #`?<Constant "E:\\\\Desktop\\\\J19B_STM8\\\\...">`
        CALL      L:assert_failed
// 1253   
// 1254   /* Set or Reset the OC3PE Bit */
// 1255   if (NewState != DISABLE)
??TIM1_OC3PreloadConfig_0:
        TNZ       S:?b8
        JREQ      L:??TIM1_OC3PreloadConfig_1
// 1256   {
// 1257     TIM1->CCMR3 |= TIM1_CCMR_OCxPE;
        BSET      L:0x525a, #0x3
        JRA       L:??TIM1_OC3PreloadConfig_2
// 1258   }
// 1259   else
// 1260   {
// 1261     TIM1->CCMR3 &= (uint8_t)(~TIM1_CCMR_OCxPE);
??TIM1_OC3PreloadConfig_1:
        BRES      L:0x525a, #0x3
// 1262   }
// 1263 }
??TIM1_OC3PreloadConfig_2:
        POP       S:?b8
        RET
// 1264 
// 1265 /**
// 1266   * @brief  Enables or disables the TIM1 peripheral Preload Register on CCR4.
// 1267   * @param   NewState new state of the Capture Compare Preload register.
// 1268   * This parameter can be ENABLE or DISABLE.
// 1269   * @retval None
// 1270   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
// 1271 void TIM1_OC4PreloadConfig(FunctionalState NewState)
// 1272 {
TIM1_OC4PreloadConfig:
        PUSH      S:?b8
        LD        S:?b8, A
// 1273   /* Check the parameters */
// 1274   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
        TNZ       S:?b8
        JREQ      L:??TIM1_OC4PreloadConfig_0
        LD        A, S:?b8
        CP        A, #0x1
        JREQ      L:??TIM1_OC4PreloadConfig_0
        LDW       X, #0x4fa
        LDW       S:?w1, X
        CLRW      X
        LDW       S:?w0, X
        LDW       X, #`?<Constant "E:\\\\Desktop\\\\J19B_STM8\\\\...">`
        CALL      L:assert_failed
// 1275   
// 1276   /* Set or Reset the OC4PE Bit */
// 1277   if (NewState != DISABLE)
??TIM1_OC4PreloadConfig_0:
        TNZ       S:?b8
        JREQ      L:??TIM1_OC4PreloadConfig_1
// 1278   {
// 1279     TIM1->CCMR4 |= TIM1_CCMR_OCxPE;
        BSET      L:0x525b, #0x3
        JRA       L:??TIM1_OC4PreloadConfig_2
// 1280   }
// 1281   else
// 1282   {
// 1283     TIM1->CCMR4 &= (uint8_t)(~TIM1_CCMR_OCxPE);
??TIM1_OC4PreloadConfig_1:
        BRES      L:0x525b, #0x3
// 1284   }
// 1285 }
??TIM1_OC4PreloadConfig_2:
        POP       S:?b8
        RET
// 1286 
// 1287 /**
// 1288   * @brief  Configures the TIM1 Capture Compare 1 Fast feature.
// 1289   * @param   NewState new state of the Output Compare Fast Enable bit.
// 1290   * This parameter can be ENABLE or DISABLE.
// 1291   * @retval None
// 1292   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
// 1293 void TIM1_OC1FastConfig(FunctionalState NewState)
// 1294 {
TIM1_OC1FastConfig:
        PUSH      S:?b8
        LD        S:?b8, A
// 1295   /* Check the parameters */
// 1296   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
        TNZ       S:?b8
        JREQ      L:??TIM1_OC1FastConfig_0
        LD        A, S:?b8
        CP        A, #0x1
        JREQ      L:??TIM1_OC1FastConfig_0
        LDW       X, #0x510
        LDW       S:?w1, X
        CLRW      X
        LDW       S:?w0, X
        LDW       X, #`?<Constant "E:\\\\Desktop\\\\J19B_STM8\\\\...">`
        CALL      L:assert_failed
// 1297   
// 1298   /* Set or Reset the OC1FE Bit */
// 1299   if (NewState != DISABLE)
??TIM1_OC1FastConfig_0:
        TNZ       S:?b8
        JREQ      L:??TIM1_OC1FastConfig_1
// 1300   {
// 1301     TIM1->CCMR1 |= TIM1_CCMR_OCxFE;
        BSET      L:0x5258, #0x2
        JRA       L:??TIM1_OC1FastConfig_2
// 1302   }
// 1303   else
// 1304   {
// 1305     TIM1->CCMR1 &= (uint8_t)(~TIM1_CCMR_OCxFE);
??TIM1_OC1FastConfig_1:
        BRES      L:0x5258, #0x2
// 1306   }
// 1307 }
??TIM1_OC1FastConfig_2:
        POP       S:?b8
        RET
// 1308 
// 1309 /**
// 1310   * @brief  Configures the TIM1 Capture Compare 2 Fast feature.
// 1311   * @param   NewState new state of the Output Compare Fast Enable bit.
// 1312   * This parameter can be ENABLE or DISABLE.
// 1313   * @retval None
// 1314   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
// 1315 void TIM1_OC2FastConfig(FunctionalState NewState)
// 1316 {
TIM1_OC2FastConfig:
        PUSH      S:?b8
        LD        S:?b8, A
// 1317   /* Check the parameters */
// 1318   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
        TNZ       S:?b8
        JREQ      L:??TIM1_OC2FastConfig_0
        LD        A, S:?b8
        CP        A, #0x1
        JREQ      L:??TIM1_OC2FastConfig_0
        LDW       X, #0x526
        LDW       S:?w1, X
        CLRW      X
        LDW       S:?w0, X
        LDW       X, #`?<Constant "E:\\\\Desktop\\\\J19B_STM8\\\\...">`
        CALL      L:assert_failed
// 1319   
// 1320   /* Set or Reset the OC2FE Bit */
// 1321   if (NewState != DISABLE)
??TIM1_OC2FastConfig_0:
        TNZ       S:?b8
        JREQ      L:??TIM1_OC2FastConfig_1
// 1322   {
// 1323     TIM1->CCMR2 |= TIM1_CCMR_OCxFE;
        BSET      L:0x5259, #0x2
        JRA       L:??TIM1_OC2FastConfig_2
// 1324   }
// 1325   else
// 1326   {
// 1327     TIM1->CCMR2 &= (uint8_t)(~TIM1_CCMR_OCxFE);
??TIM1_OC2FastConfig_1:
        BRES      L:0x5259, #0x2
// 1328   }
// 1329 }
??TIM1_OC2FastConfig_2:
        POP       S:?b8
        RET
// 1330 
// 1331 /**
// 1332   * @brief  Configures the TIM1 Capture Compare 3 Fast feature.
// 1333   * @param   NewState new state of the Output Compare Fast Enable bit.
// 1334   * This parameter can be ENABLE or DISABLE.
// 1335   * @retval None
// 1336   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
// 1337 void TIM1_OC3FastConfig(FunctionalState NewState)
// 1338 {
TIM1_OC3FastConfig:
        PUSH      S:?b8
        LD        S:?b8, A
// 1339   /* Check the parameters */
// 1340   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
        TNZ       S:?b8
        JREQ      L:??TIM1_OC3FastConfig_0
        LD        A, S:?b8
        CP        A, #0x1
        JREQ      L:??TIM1_OC3FastConfig_0
        LDW       X, #0x53c
        LDW       S:?w1, X
        CLRW      X
        LDW       S:?w0, X
        LDW       X, #`?<Constant "E:\\\\Desktop\\\\J19B_STM8\\\\...">`
        CALL      L:assert_failed
// 1341   
// 1342   /* Set or Reset the OC3FE Bit */
// 1343   if (NewState != DISABLE)
??TIM1_OC3FastConfig_0:
        TNZ       S:?b8
        JREQ      L:??TIM1_OC3FastConfig_1
// 1344   {
// 1345     TIM1->CCMR3 |= TIM1_CCMR_OCxFE;
        BSET      L:0x525a, #0x2
        JRA       L:??TIM1_OC3FastConfig_2
// 1346   }
// 1347   else
// 1348   {
// 1349     TIM1->CCMR3 &= (uint8_t)(~TIM1_CCMR_OCxFE);
??TIM1_OC3FastConfig_1:
        BRES      L:0x525a, #0x2
// 1350   }
// 1351 }
??TIM1_OC3FastConfig_2:
        POP       S:?b8
        RET
// 1352 
// 1353 /**
// 1354   * @brief  Configures the TIM1 Capture Compare 4 Fast feature.
// 1355   * @param   NewState new state of the Output Compare Fast Enable bit.
// 1356   * This parameter can be ENABLE or DISABLE.
// 1357   * @retval None
// 1358   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
// 1359 void TIM1_OC4FastConfig(FunctionalState NewState)
// 1360 {
TIM1_OC4FastConfig:
        PUSH      S:?b8
        LD        S:?b8, A
// 1361   /* Check the parameters */
// 1362   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
        TNZ       S:?b8
        JREQ      L:??TIM1_OC4FastConfig_0
        LD        A, S:?b8
        CP        A, #0x1
        JREQ      L:??TIM1_OC4FastConfig_0
        LDW       X, #0x552
        LDW       S:?w1, X
        CLRW      X
        LDW       S:?w0, X
        LDW       X, #`?<Constant "E:\\\\Desktop\\\\J19B_STM8\\\\...">`
        CALL      L:assert_failed
// 1363   
// 1364   /* Set or Reset the OC4FE Bit */
// 1365   if (NewState != DISABLE)
??TIM1_OC4FastConfig_0:
        TNZ       S:?b8
        JREQ      L:??TIM1_OC4FastConfig_1
// 1366   {
// 1367     TIM1->CCMR4 |= TIM1_CCMR_OCxFE;
        BSET      L:0x525b, #0x2
        JRA       L:??TIM1_OC4FastConfig_2
// 1368   }
// 1369   else
// 1370   {
// 1371     TIM1->CCMR4 &= (uint8_t)(~TIM1_CCMR_OCxFE);
??TIM1_OC4FastConfig_1:
        BRES      L:0x525b, #0x2
// 1372   }
// 1373 }
??TIM1_OC4FastConfig_2:
        POP       S:?b8
        RET
// 1374 
// 1375 /**
// 1376   * @brief  Configures the TIM1 event to be generated by software.
// 1377   * @param   TIM1_EventSource specifies the event source.
// 1378   * This parameter can be one of the following values:
// 1379   *                       - TIM1_EVENTSOURCE_UPDATE: TIM1 update Event source
// 1380   *                       - TIM1_EVENTSOURCE_CC1: TIM1 Capture Compare 1 Event source
// 1381   *                       - TIM1_EVENTSOURCE_CC2: TIM1 Capture Compare 2 Event source
// 1382   *                       - TIM1_EVENTSOURCE_CC3: TIM1 Capture Compare 3 Event source
// 1383   *                       - TIM1_EVENTSOURCE_CC4: TIM1 Capture Compare 4 Event source
// 1384   *                       - TIM1_EVENTSOURCE_COM: TIM1 COM Event source
// 1385   *                       - TIM1_EVENTSOURCE_TRIGGER: TIM1 Trigger Event source
// 1386   *                       - TIM1_EventSourceBreak: TIM1 Break Event source
// 1387   * @retval None
// 1388   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
// 1389 void TIM1_GenerateEvent(TIM1_EventSource_TypeDef TIM1_EventSource)
// 1390 {
TIM1_GenerateEvent:
        PUSH      S:?b8
        LD        S:?b8, A
// 1391   /* Check the parameters */
// 1392   assert_param(IS_TIM1_EVENT_SOURCE_OK(TIM1_EventSource));
        TNZ       S:?b8
        JRNE      L:??TIM1_GenerateEvent_0
        LDW       X, #0x570
        LDW       S:?w1, X
        CLRW      X
        LDW       S:?w0, X
        LDW       X, #`?<Constant "E:\\\\Desktop\\\\J19B_STM8\\\\...">`
        CALL      L:assert_failed
// 1393   
// 1394   /* Set the event sources */
// 1395   TIM1->EGR = (uint8_t)TIM1_EventSource;
??TIM1_GenerateEvent_0:
        LD        A, S:?b8
        LD        L:0x5257, A
// 1396 }
        POP       S:?b8
        RET
// 1397 
// 1398 /**
// 1399   * @brief  Configures the TIM1 Channel 1 polarity.
// 1400   * @param   TIM1_OCPolarity specifies the OC1 Polarity.
// 1401   * This parameter can be one of the following values:
// 1402   *                       - TIM1_OCPOLARITY_LOW: Output Compare active low
// 1403   *                       - TIM1_OCPOLARITY_HIGH: Output Compare active high
// 1404   * @retval None
// 1405   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
// 1406 void TIM1_OC1PolarityConfig(TIM1_OCPolarity_TypeDef TIM1_OCPolarity)
// 1407 {
TIM1_OC1PolarityConfig:
        PUSH      S:?b8
        LD        S:?b8, A
// 1408   /* Check the parameters */
// 1409   assert_param(IS_TIM1_OC_POLARITY_OK(TIM1_OCPolarity));
        TNZ       S:?b8
        JREQ      L:??TIM1_OC1PolarityConfig_0
        LD        A, S:?b8
        CP        A, #0x22
        JREQ      L:??TIM1_OC1PolarityConfig_0
        LDW       X, #0x581
        LDW       S:?w1, X
        CLRW      X
        LDW       S:?w0, X
        LDW       X, #`?<Constant "E:\\\\Desktop\\\\J19B_STM8\\\\...">`
        CALL      L:assert_failed
// 1410   
// 1411   /* Set or Reset the CC1P Bit */
// 1412   if (TIM1_OCPolarity != TIM1_OCPOLARITY_HIGH)
??TIM1_OC1PolarityConfig_0:
        TNZ       S:?b8
        JREQ      L:??TIM1_OC1PolarityConfig_1
// 1413   {
// 1414     TIM1->CCER1 |= TIM1_CCER1_CC1P;
        BSET      L:0x525c, #0x1
        JRA       L:??TIM1_OC1PolarityConfig_2
// 1415   }
// 1416   else
// 1417   {
// 1418     TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC1P);
??TIM1_OC1PolarityConfig_1:
        BRES      L:0x525c, #0x1
// 1419   }
// 1420 }
??TIM1_OC1PolarityConfig_2:
        POP       S:?b8
        RET
// 1421 
// 1422 /**
// 1423   * @brief  Configures the TIM1 Channel 1N polarity.
// 1424   * @param   TIM1_OCNPolarity specifies the OC1N Polarity.
// 1425   * This parameter can be one of the following values:
// 1426   *                       - TIM1_OCNPOLARITY_LOW: Output Compare active low
// 1427   *                       - TIM1_OCNPOLARITY_HIGH: Output Compare active high
// 1428   * @retval None
// 1429   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
// 1430 void TIM1_OC1NPolarityConfig(TIM1_OCNPolarity_TypeDef TIM1_OCNPolarity)
// 1431 {
TIM1_OC1NPolarityConfig:
        PUSH      S:?b8
        LD        S:?b8, A
// 1432   /* Check the parameters */
// 1433   assert_param(IS_TIM1_OCN_POLARITY_OK(TIM1_OCNPolarity));
        TNZ       S:?b8
        JREQ      L:??TIM1_OC1NPolarityConfig_0
        LD        A, S:?b8
        CP        A, #0x88
        JREQ      L:??TIM1_OC1NPolarityConfig_0
        LDW       X, #0x599
        LDW       S:?w1, X
        CLRW      X
        LDW       S:?w0, X
        LDW       X, #`?<Constant "E:\\\\Desktop\\\\J19B_STM8\\\\...">`
        CALL      L:assert_failed
// 1434   
// 1435   /* Set or Reset the CC3P Bit */
// 1436   if (TIM1_OCNPolarity != TIM1_OCNPOLARITY_HIGH)
??TIM1_OC1NPolarityConfig_0:
        TNZ       S:?b8
        JREQ      L:??TIM1_OC1NPolarityConfig_1
// 1437   {
// 1438     TIM1->CCER1 |= TIM1_CCER1_CC1NP;
        BSET      L:0x525c, #0x3
        JRA       L:??TIM1_OC1NPolarityConfig_2
// 1439   }
// 1440   else
// 1441   {
// 1442     TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC1NP);
??TIM1_OC1NPolarityConfig_1:
        BRES      L:0x525c, #0x3
// 1443   }
// 1444 }
??TIM1_OC1NPolarityConfig_2:
        POP       S:?b8
        RET
// 1445 
// 1446 /**
// 1447   * @brief  Configures the TIM1 Channel 2 polarity.
// 1448   * @param   TIM1_OCPolarity specifies the OC2 Polarity.
// 1449   * This parameter can be one of the following values:
// 1450   *                       - TIM1_OCPOLARITY_LOW: Output Compare active low
// 1451   *                       - TIM1_OCPOLARITY_HIGH: Output Compare active high
// 1452   * @retval None
// 1453   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
// 1454 void TIM1_OC2PolarityConfig(TIM1_OCPolarity_TypeDef TIM1_OCPolarity)
// 1455 {
TIM1_OC2PolarityConfig:
        PUSH      S:?b8
        LD        S:?b8, A
// 1456   /* Check the parameters */
// 1457   assert_param(IS_TIM1_OC_POLARITY_OK(TIM1_OCPolarity));
        TNZ       S:?b8
        JREQ      L:??TIM1_OC2PolarityConfig_0
        LD        A, S:?b8
        CP        A, #0x22
        JREQ      L:??TIM1_OC2PolarityConfig_0
        LDW       X, #0x5b1
        LDW       S:?w1, X
        CLRW      X
        LDW       S:?w0, X
        LDW       X, #`?<Constant "E:\\\\Desktop\\\\J19B_STM8\\\\...">`
        CALL      L:assert_failed
// 1458   
// 1459   /* Set or Reset the CC2P Bit */
// 1460   if (TIM1_OCPolarity != TIM1_OCPOLARITY_HIGH)
??TIM1_OC2PolarityConfig_0:
        TNZ       S:?b8
        JREQ      L:??TIM1_OC2PolarityConfig_1
// 1461   {
// 1462     TIM1->CCER1 |= TIM1_CCER1_CC2P;
        BSET      L:0x525c, #0x5
        JRA       L:??TIM1_OC2PolarityConfig_2
// 1463   }
// 1464   else
// 1465   {
// 1466     TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC2P);
??TIM1_OC2PolarityConfig_1:
        BRES      L:0x525c, #0x5
// 1467   }
// 1468 }
??TIM1_OC2PolarityConfig_2:
        POP       S:?b8
        RET
// 1469 
// 1470 /**
// 1471   * @brief  Configures the TIM1 Channel 2N polarity.
// 1472   * @param   TIM1_OCNPolarity specifies the OC2N Polarity.
// 1473   * This parameter can be one of the following values:
// 1474   *                       - TIM1_OCNPOLARITY_LOW: Output Compare active low
// 1475   *                       - TIM1_OCNPOLARITY_HIGH: Output Compare active high
// 1476   * @retval None
// 1477   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
// 1478 void TIM1_OC2NPolarityConfig(TIM1_OCNPolarity_TypeDef TIM1_OCNPolarity)
// 1479 {
TIM1_OC2NPolarityConfig:
        PUSH      S:?b8
        LD        S:?b8, A
// 1480   /* Check the parameters */
// 1481   assert_param(IS_TIM1_OCN_POLARITY_OK(TIM1_OCNPolarity));
        TNZ       S:?b8
        JREQ      L:??TIM1_OC2NPolarityConfig_0
        LD        A, S:?b8
        CP        A, #0x88
        JREQ      L:??TIM1_OC2NPolarityConfig_0
        LDW       X, #0x5c9
        LDW       S:?w1, X
        CLRW      X
        LDW       S:?w0, X
        LDW       X, #`?<Constant "E:\\\\Desktop\\\\J19B_STM8\\\\...">`
        CALL      L:assert_failed
// 1482   
// 1483   /* Set or Reset the CC3P Bit */
// 1484   if (TIM1_OCNPolarity != TIM1_OCNPOLARITY_HIGH)
??TIM1_OC2NPolarityConfig_0:
        TNZ       S:?b8
        JREQ      L:??TIM1_OC2NPolarityConfig_1
// 1485   {
// 1486     TIM1->CCER1 |= TIM1_CCER1_CC2NP;
        BSET      L:0x525c, #0x7
        JRA       L:??TIM1_OC2NPolarityConfig_2
// 1487   }
// 1488   else
// 1489   {
// 1490     TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC2NP);
??TIM1_OC2NPolarityConfig_1:
        BRES      L:0x525c, #0x7
// 1491   }
// 1492 }
??TIM1_OC2NPolarityConfig_2:
        POP       S:?b8
        RET
// 1493 
// 1494 /**
// 1495   * @brief  Configures the TIM1 Channel 3 polarity.
// 1496   * @param   TIM1_OCPolarity specifies the OC3 Polarity.
// 1497   * This parameter can be one of the following values:
// 1498   *                       - TIM1_OCPOLARITY_LOW: Output Compare active low
// 1499   *                       - TIM1_OCPOLARITY_HIGH: Output Compare active high
// 1500   * @retval None
// 1501   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
// 1502 void TIM1_OC3PolarityConfig(TIM1_OCPolarity_TypeDef TIM1_OCPolarity)
// 1503 {
TIM1_OC3PolarityConfig:
        PUSH      S:?b8
        LD        S:?b8, A
// 1504   /* Check the parameters */
// 1505   assert_param(IS_TIM1_OC_POLARITY_OK(TIM1_OCPolarity));
        TNZ       S:?b8
        JREQ      L:??TIM1_OC3PolarityConfig_0
        LD        A, S:?b8
        CP        A, #0x22
        JREQ      L:??TIM1_OC3PolarityConfig_0
        LDW       X, #0x5e1
        LDW       S:?w1, X
        CLRW      X
        LDW       S:?w0, X
        LDW       X, #`?<Constant "E:\\\\Desktop\\\\J19B_STM8\\\\...">`
        CALL      L:assert_failed
// 1506   
// 1507   /* Set or Reset the CC3P Bit */
// 1508   if (TIM1_OCPolarity != TIM1_OCPOLARITY_HIGH)
??TIM1_OC3PolarityConfig_0:
        TNZ       S:?b8
        JREQ      L:??TIM1_OC3PolarityConfig_1
// 1509   {
// 1510     TIM1->CCER2 |= TIM1_CCER2_CC3P;
        BSET      L:0x525d, #0x1
        JRA       L:??TIM1_OC3PolarityConfig_2
// 1511   }
// 1512   else
// 1513   {
// 1514     TIM1->CCER2 &= (uint8_t)(~TIM1_CCER2_CC3P);
??TIM1_OC3PolarityConfig_1:
        BRES      L:0x525d, #0x1
// 1515   }
// 1516 }
??TIM1_OC3PolarityConfig_2:
        POP       S:?b8
        RET
// 1517 
// 1518 
// 1519 /**
// 1520   * @brief  Configures the TIM1 Channel 3N polarity.
// 1521   * @param   TIM1_OCNPolarity specifies the OC3N Polarity.
// 1522   * This parameter can be one of the following values:
// 1523   *                       - TIM1_OCNPOLARITY_LOW: Output Compare active low
// 1524   *                       - TIM1_OCNPOLARITY_HIGH: Output Compare active high
// 1525   * @retval None
// 1526   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
// 1527 void TIM1_OC3NPolarityConfig(TIM1_OCNPolarity_TypeDef TIM1_OCNPolarity)
// 1528 {
TIM1_OC3NPolarityConfig:
        PUSH      S:?b8
        LD        S:?b8, A
// 1529   /* Check the parameters */
// 1530   assert_param(IS_TIM1_OCN_POLARITY_OK(TIM1_OCNPolarity));
        TNZ       S:?b8
        JREQ      L:??TIM1_OC3NPolarityConfig_0
        LD        A, S:?b8
        CP        A, #0x88
        JREQ      L:??TIM1_OC3NPolarityConfig_0
        LDW       X, #0x5fa
        LDW       S:?w1, X
        CLRW      X
        LDW       S:?w0, X
        LDW       X, #`?<Constant "E:\\\\Desktop\\\\J19B_STM8\\\\...">`
        CALL      L:assert_failed
// 1531   
// 1532   /* Set or Reset the CC3P Bit */
// 1533   if (TIM1_OCNPolarity != TIM1_OCNPOLARITY_HIGH)
??TIM1_OC3NPolarityConfig_0:
        TNZ       S:?b8
        JREQ      L:??TIM1_OC3NPolarityConfig_1
// 1534   {
// 1535     TIM1->CCER2 |= TIM1_CCER2_CC3NP;
        BSET      L:0x525d, #0x3
        JRA       L:??TIM1_OC3NPolarityConfig_2
// 1536   }
// 1537   else
// 1538   {
// 1539     TIM1->CCER2 &= (uint8_t)(~TIM1_CCER2_CC3NP);
??TIM1_OC3NPolarityConfig_1:
        BRES      L:0x525d, #0x3
// 1540   }
// 1541 }
??TIM1_OC3NPolarityConfig_2:
        POP       S:?b8
        RET
// 1542 
// 1543 /**
// 1544   * @brief  Configures the TIM1 Channel 4 polarity.
// 1545   * @param   TIM1_OCPolarity specifies the OC4 Polarity.
// 1546   * This parameter can be one of the following values:
// 1547   *                       - TIM1_OCPOLARITY_LOW: Output Compare active low
// 1548   *                       - TIM1_OCPOLARITY_HIGH: Output Compare active high
// 1549   * @retval None
// 1550   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
// 1551 void TIM1_OC4PolarityConfig(TIM1_OCPolarity_TypeDef TIM1_OCPolarity)
// 1552 {
TIM1_OC4PolarityConfig:
        PUSH      S:?b8
        LD        S:?b8, A
// 1553   /* Check the parameters */
// 1554   assert_param(IS_TIM1_OC_POLARITY_OK(TIM1_OCPolarity));
        TNZ       S:?b8
        JREQ      L:??TIM1_OC4PolarityConfig_0
        LD        A, S:?b8
        CP        A, #0x22
        JREQ      L:??TIM1_OC4PolarityConfig_0
        LDW       X, #0x612
        LDW       S:?w1, X
        CLRW      X
        LDW       S:?w0, X
        LDW       X, #`?<Constant "E:\\\\Desktop\\\\J19B_STM8\\\\...">`
        CALL      L:assert_failed
// 1555   
// 1556   /* Set or Reset the CC4P Bit */
// 1557   if (TIM1_OCPolarity != TIM1_OCPOLARITY_HIGH)
??TIM1_OC4PolarityConfig_0:
        TNZ       S:?b8
        JREQ      L:??TIM1_OC4PolarityConfig_1
// 1558   {
// 1559     TIM1->CCER2 |= TIM1_CCER2_CC4P;
        BSET      L:0x525d, #0x5
        JRA       L:??TIM1_OC4PolarityConfig_2
// 1560   }
// 1561   else
// 1562   {
// 1563     TIM1->CCER2 &= (uint8_t)(~TIM1_CCER2_CC4P);
??TIM1_OC4PolarityConfig_1:
        BRES      L:0x525d, #0x5
// 1564   }
// 1565 }
??TIM1_OC4PolarityConfig_2:
        POP       S:?b8
        RET
// 1566 
// 1567 /**
// 1568   * @brief  Enables or disables the TIM1 Capture Compare Channel x (x=1,..,4).
// 1569   * @param   TIM1_Channel specifies the TIM1 Channel.
// 1570   * This parameter can be one of the following values:
// 1571   *                       - TIM1_CHANNEL_1: TIM1 Channel1
// 1572   *                       - TIM1_CHANNEL_2: TIM1 Channel2
// 1573   *                       - TIM1_CHANNEL_3: TIM1 Channel3
// 1574   *                       - TIM1_CHANNEL_4: TIM1 Channel4
// 1575   * @param   NewState specifies the TIM1 Channel CCxE bit new state.
// 1576   * This parameter can be: ENABLE or DISABLE.
// 1577   * @retval None
// 1578   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
// 1579 void TIM1_CCxCmd(TIM1_Channel_TypeDef TIM1_Channel, FunctionalState NewState)
// 1580 {
TIM1_CCxCmd:
        CALL      L:?push_w4
        LD        S:?b8, A
        MOV       S:?b9, S:?b0
// 1581   /* Check the parameters */
// 1582   assert_param(IS_TIM1_CHANNEL_OK(TIM1_Channel));
        TNZ       S:?b8
        JREQ      L:??TIM1_CCxCmd_0
        LD        A, S:?b8
        CP        A, #0x1
        JREQ      L:??TIM1_CCxCmd_0
        LD        A, S:?b8
        CP        A, #0x2
        JREQ      L:??TIM1_CCxCmd_0
        LD        A, S:?b8
        CP        A, #0x3
        JREQ      L:??TIM1_CCxCmd_0
        LDW       X, #0x62e
        LDW       S:?w1, X
        CLRW      X
        LDW       S:?w0, X
        LDW       X, #`?<Constant "E:\\\\Desktop\\\\J19B_STM8\\\\...">`
        CALL      L:assert_failed
// 1583   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
??TIM1_CCxCmd_0:
        TNZ       S:?b9
        JREQ      L:??TIM1_CCxCmd_1
        LD        A, S:?b9
        CP        A, #0x1
        JREQ      L:??TIM1_CCxCmd_1
        LDW       X, #0x62f
        LDW       S:?w1, X
        CLRW      X
        LDW       S:?w0, X
        LDW       X, #`?<Constant "E:\\\\Desktop\\\\J19B_STM8\\\\...">`
        CALL      L:assert_failed
// 1584   
// 1585   if (TIM1_Channel == TIM1_CHANNEL_1)
??TIM1_CCxCmd_1:
        TNZ       S:?b8
        JRNE      L:??TIM1_CCxCmd_2
// 1586   {
// 1587     /* Set or Reset the CC1E Bit */
// 1588     if (NewState != DISABLE)
        TNZ       S:?b9
        JREQ      L:??TIM1_CCxCmd_3
// 1589     {
// 1590       TIM1->CCER1 |= TIM1_CCER1_CC1E;
        BSET      L:0x525c, #0x0
        JP        L:?epilogue_w4
// 1591     }
// 1592     else
// 1593     {
// 1594       TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC1E);
??TIM1_CCxCmd_3:
        BRES      L:0x525c, #0x0
        JP        L:?epilogue_w4
// 1595     }
// 1596     
// 1597   }
// 1598   else if (TIM1_Channel == TIM1_CHANNEL_2)
??TIM1_CCxCmd_2:
        LD        A, S:?b8
        CP        A, #0x1
        JRNE      L:??TIM1_CCxCmd_4
// 1599   {
// 1600     /* Set or Reset the CC2E Bit */
// 1601     if (NewState != DISABLE)
        TNZ       S:?b9
        JREQ      L:??TIM1_CCxCmd_5
// 1602     {
// 1603       TIM1->CCER1 |= TIM1_CCER1_CC2E;
        BSET      L:0x525c, #0x4
        JP        L:?epilogue_w4
// 1604     }
// 1605     else
// 1606     {
// 1607       TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC2E);
??TIM1_CCxCmd_5:
        BRES      L:0x525c, #0x4
        JP        L:?epilogue_w4
// 1608     }
// 1609   }
// 1610   else if (TIM1_Channel == TIM1_CHANNEL_3)
??TIM1_CCxCmd_4:
        LD        A, S:?b8
        CP        A, #0x2
        JRNE      L:??TIM1_CCxCmd_6
// 1611   {
// 1612     /* Set or Reset the CC3E Bit */
// 1613     if (NewState != DISABLE)
        TNZ       S:?b9
        JREQ      L:??TIM1_CCxCmd_7
// 1614     {
// 1615       TIM1->CCER2 |= TIM1_CCER2_CC3E;
        BSET      L:0x525d, #0x0
        JP        L:?epilogue_w4
// 1616     }
// 1617     else
// 1618     {
// 1619       TIM1->CCER2 &= (uint8_t)(~TIM1_CCER2_CC3E);
??TIM1_CCxCmd_7:
        BRES      L:0x525d, #0x0
        JP        L:?epilogue_w4
// 1620     }
// 1621   }
// 1622   else
// 1623   {
// 1624     /* Set or Reset the CC4E Bit */
// 1625     if (NewState != DISABLE)
??TIM1_CCxCmd_6:
        TNZ       S:?b9
        JREQ      L:??TIM1_CCxCmd_8
// 1626     {
// 1627       TIM1->CCER2 |= TIM1_CCER2_CC4E;
        BSET      L:0x525d, #0x4
        JP        L:?epilogue_w4
// 1628     }
// 1629     else
// 1630     {
// 1631       TIM1->CCER2 &= (uint8_t)(~TIM1_CCER2_CC4E);
??TIM1_CCxCmd_8:
        BRES      L:0x525d, #0x4
// 1632     }
// 1633   }
// 1634 }
        JP        L:?epilogue_w4
// 1635 
// 1636 /**
// 1637   * @brief  Enables or disables the TIM1 Capture Compare Channel xN (xN=1,..,3).
// 1638   * @param   TIM1_Channel specifies the TIM1 Channel.
// 1639   * This parameter can be one of the following values:
// 1640   *                       - TIM1_CHANNEL_1: TIM1 Channel1
// 1641   *                       - TIM1_CHANNEL_2: TIM1 Channel2
// 1642   *                       - TIM1_CHANNEL_3: TIM1 Channel3
// 1643   * @param   NewState specifies the TIM1 Channel CCxNE bit new state.
// 1644   * This parameter can be: ENABLE or DISABLE.
// 1645   * @retval None
// 1646   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
// 1647 void TIM1_CCxNCmd(TIM1_Channel_TypeDef TIM1_Channel, FunctionalState NewState)
// 1648 {
TIM1_CCxNCmd:
        CALL      L:?push_w4
        LD        S:?b8, A
        MOV       S:?b9, S:?b0
// 1649   /* Check the parameters */
// 1650   assert_param(IS_TIM1_COMPLEMENTARY_CHANNEL_OK(TIM1_Channel));
        TNZ       S:?b8
        JREQ      L:??TIM1_CCxNCmd_0
        LD        A, S:?b8
        CP        A, #0x1
        JREQ      L:??TIM1_CCxNCmd_0
        LD        A, S:?b8
        CP        A, #0x2
        JREQ      L:??TIM1_CCxNCmd_0
        LDW       X, #0x672
        LDW       S:?w1, X
        CLRW      X
        LDW       S:?w0, X
        LDW       X, #`?<Constant "E:\\\\Desktop\\\\J19B_STM8\\\\...">`
        CALL      L:assert_failed
// 1651   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
??TIM1_CCxNCmd_0:
        TNZ       S:?b9
        JREQ      L:??TIM1_CCxNCmd_1
        LD        A, S:?b9
        CP        A, #0x1
        JREQ      L:??TIM1_CCxNCmd_1
        LDW       X, #0x673
        LDW       S:?w1, X
        CLRW      X
        LDW       S:?w0, X
        LDW       X, #`?<Constant "E:\\\\Desktop\\\\J19B_STM8\\\\...">`
        CALL      L:assert_failed
// 1652   
// 1653   if (TIM1_Channel == TIM1_CHANNEL_1)
??TIM1_CCxNCmd_1:
        TNZ       S:?b8
        JRNE      L:??TIM1_CCxNCmd_2
// 1654   {
// 1655     /* Set or Reset the CC1NE Bit */
// 1656     if (NewState != DISABLE)
        TNZ       S:?b9
        JREQ      L:??TIM1_CCxNCmd_3
// 1657     {
// 1658       TIM1->CCER1 |= TIM1_CCER1_CC1NE;
        BSET      L:0x525c, #0x2
        JP        L:?epilogue_w4
// 1659     }
// 1660     else
// 1661     {
// 1662       TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC1NE);
??TIM1_CCxNCmd_3:
        BRES      L:0x525c, #0x2
        JP        L:?epilogue_w4
// 1663     }
// 1664   }
// 1665   else if (TIM1_Channel == TIM1_CHANNEL_2)
??TIM1_CCxNCmd_2:
        LD        A, S:?b8
        CP        A, #0x1
        JRNE      L:??TIM1_CCxNCmd_4
// 1666   {
// 1667     /* Set or Reset the CC2NE Bit */
// 1668     if (NewState != DISABLE)
        TNZ       S:?b9
        JREQ      L:??TIM1_CCxNCmd_5
// 1669     {
// 1670       TIM1->CCER1 |= TIM1_CCER1_CC2NE;
        BSET      L:0x525c, #0x6
        JP        L:?epilogue_w4
// 1671     }
// 1672     else
// 1673     {
// 1674       TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC2NE);
??TIM1_CCxNCmd_5:
        BRES      L:0x525c, #0x6
        JP        L:?epilogue_w4
// 1675     }
// 1676   }
// 1677   else
// 1678   {
// 1679     /* Set or Reset the CC3NE Bit */
// 1680     if (NewState != DISABLE)
??TIM1_CCxNCmd_4:
        TNZ       S:?b9
        JREQ      L:??TIM1_CCxNCmd_6
// 1681     {
// 1682       TIM1->CCER2 |= TIM1_CCER2_CC3NE;
        BSET      L:0x525d, #0x2
        JP        L:?epilogue_w4
// 1683     }
// 1684     else
// 1685     {
// 1686       TIM1->CCER2 &= (uint8_t)(~TIM1_CCER2_CC3NE);
??TIM1_CCxNCmd_6:
        BRES      L:0x525d, #0x2
// 1687     }
// 1688   }
// 1689 }
        JP        L:?epilogue_w4
// 1690 
// 1691 /**
// 1692   * @brief  Selects the TIM1 Output Compare Mode. This function disables the
// 1693   * selected channel before changing the Output Compare Mode. User has to
// 1694   * enable this channel using TIM1_CCxCmd and TIM1_CCxNCmd functions.
// 1695   * @param   TIM1_Channel specifies the TIM1 Channel.
// 1696   * This parameter can be one of the following values:
// 1697   *                       - TIM1_CHANNEL_1: TIM1 Channel1
// 1698   *                       - TIM1_CHANNEL_2: TIM1 Channel2
// 1699   *                       - TIM1_CHANNEL_3: TIM1 Channel3
// 1700   *                       - TIM1_CHANNEL_4: TIM1 Channel4
// 1701   * @param   TIM1_OCMode specifies the TIM1 Output Compare Mode.
// 1702   * This parameter can be one of the following values:
// 1703   *                       - TIM1_OCMODE_TIMING
// 1704   *                       - TIM1_OCMODE_ACTIVE
// 1705   *                       - TIM1_OCMODE_TOGGLE
// 1706   *                       - TIM1_OCMODE_PWM1
// 1707   *                       - TIM1_OCMODE_PWM2
// 1708   *                       - TIM1_FORCEDACTION_ACTIVE
// 1709   *                       - TIM1_FORCEDACTION_INACTIVE
// 1710   * @retval None
// 1711   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
// 1712 void TIM1_SelectOCxM(TIM1_Channel_TypeDef TIM1_Channel, TIM1_OCMode_TypeDef TIM1_OCMode)
// 1713 {
TIM1_SelectOCxM:
        CALL      L:?push_w4
        LD        S:?b8, A
        MOV       S:?b9, S:?b0
// 1714   /* Check the parameters */
// 1715   assert_param(IS_TIM1_CHANNEL_OK(TIM1_Channel));
        TNZ       S:?b8
        JREQ      L:??TIM1_SelectOCxM_0
        LD        A, S:?b8
        CP        A, #0x1
        JREQ      L:??TIM1_SelectOCxM_0
        LD        A, S:?b8
        CP        A, #0x2
        JREQ      L:??TIM1_SelectOCxM_0
        LD        A, S:?b8
        CP        A, #0x3
        JREQ      L:??TIM1_SelectOCxM_0
        LDW       X, #0x6b3
        LDW       S:?w1, X
        CLRW      X
        LDW       S:?w0, X
        LDW       X, #`?<Constant "E:\\\\Desktop\\\\J19B_STM8\\\\...">`
        CALL      L:assert_failed
// 1716   assert_param(IS_TIM1_OCM_OK(TIM1_OCMode));
??TIM1_SelectOCxM_0:
        TNZ       S:?b9
        JREQ      L:??TIM1_SelectOCxM_1
        LD        A, S:?b9
        CP        A, #0x10
        JREQ      L:??TIM1_SelectOCxM_1
        LD        A, S:?b9
        CP        A, #0x20
        JREQ      L:??TIM1_SelectOCxM_1
        LD        A, S:?b9
        CP        A, #0x30
        JREQ      L:??TIM1_SelectOCxM_1
        LD        A, S:?b9
        CP        A, #0x60
        JREQ      L:??TIM1_SelectOCxM_1
        LD        A, S:?b9
        CP        A, #0x70
        JREQ      L:??TIM1_SelectOCxM_1
        LD        A, S:?b9
        CP        A, #0x50
        JREQ      L:??TIM1_SelectOCxM_1
        LD        A, S:?b9
        CP        A, #0x40
        JREQ      L:??TIM1_SelectOCxM_1
        LDW       X, #0x6b4
        LDW       S:?w1, X
        CLRW      X
        LDW       S:?w0, X
        LDW       X, #`?<Constant "E:\\\\Desktop\\\\J19B_STM8\\\\...">`
        CALL      L:assert_failed
// 1717   
// 1718   if (TIM1_Channel == TIM1_CHANNEL_1)
??TIM1_SelectOCxM_1:
        TNZ       S:?b8
        JRNE      L:??TIM1_SelectOCxM_2
// 1719   {
// 1720     /* Disable the Channel 1: Reset the CCE Bit */
// 1721     TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC1E);
        BRES      L:0x525c, #0x0
// 1722     
// 1723     /* Reset the Output Compare Bits & Set the Output Compare Mode */
// 1724     TIM1->CCMR1 = (uint8_t)((uint8_t)(TIM1->CCMR1 & (uint8_t)(~TIM1_CCMR_OCM)) 
// 1725                             | (uint8_t)TIM1_OCMode);
        LD        A, L:0x5258
        AND       A, #0x8f
        OR        A, S:?b9
        LD        L:0x5258, A
        JP        L:?epilogue_w4
// 1726   }
// 1727   else if (TIM1_Channel == TIM1_CHANNEL_2)
??TIM1_SelectOCxM_2:
        LD        A, S:?b8
        CP        A, #0x1
        JRNE      L:??TIM1_SelectOCxM_3
// 1728   {
// 1729     /* Disable the Channel 2: Reset the CCE Bit */
// 1730     TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC2E);
        BRES      L:0x525c, #0x4
// 1731     
// 1732     /* Reset the Output Compare Bits & Set the Output Compare Mode */
// 1733     TIM1->CCMR2 = (uint8_t)((uint8_t)(TIM1->CCMR2 & (uint8_t)(~TIM1_CCMR_OCM))
// 1734                             | (uint8_t)TIM1_OCMode);
        LD        A, L:0x5259
        AND       A, #0x8f
        OR        A, S:?b9
        LD        L:0x5259, A
        JP        L:?epilogue_w4
// 1735   }
// 1736   else if (TIM1_Channel == TIM1_CHANNEL_3)
??TIM1_SelectOCxM_3:
        LD        A, S:?b8
        CP        A, #0x2
        JRNE      L:??TIM1_SelectOCxM_4
// 1737   {
// 1738     /* Disable the Channel 3: Reset the CCE Bit */
// 1739     TIM1->CCER2 &= (uint8_t)(~TIM1_CCER2_CC3E);
        BRES      L:0x525d, #0x0
// 1740     
// 1741     /* Reset the Output Compare Bits & Set the Output Compare Mode */
// 1742     TIM1->CCMR3 = (uint8_t)((uint8_t)(TIM1->CCMR3 & (uint8_t)(~TIM1_CCMR_OCM)) 
// 1743                             | (uint8_t)TIM1_OCMode);
        LD        A, L:0x525a
        AND       A, #0x8f
        OR        A, S:?b9
        LD        L:0x525a, A
        JP        L:?epilogue_w4
// 1744   }
// 1745   else
// 1746   {
// 1747     /* Disable the Channel 4: Reset the CCE Bit */
// 1748     TIM1->CCER2 &= (uint8_t)(~TIM1_CCER2_CC4E);
??TIM1_SelectOCxM_4:
        BRES      L:0x525d, #0x4
// 1749     
// 1750     /* Reset the Output Compare Bits & Set the Output Compare Mode */
// 1751     TIM1->CCMR4 = (uint8_t)((uint8_t)(TIM1->CCMR4 & (uint8_t)(~TIM1_CCMR_OCM)) 
// 1752                             | (uint8_t)TIM1_OCMode);
        LD        A, L:0x525b
        AND       A, #0x8f
        OR        A, S:?b9
        LD        L:0x525b, A
// 1753   }
// 1754 }
        JP        L:?epilogue_w4
// 1755 
// 1756 /**
// 1757   * @brief  Sets the TIM1 Counter Register value.
// 1758   * @param   Counter specifies the Counter register new value.
// 1759   * This parameter is between 0x0000 and 0xFFFF.
// 1760   * @retval None
// 1761   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
// 1762 void TIM1_SetCounter(uint16_t Counter)
// 1763 {
TIM1_SetCounter:
        LDW       Y, X
// 1764   /* Set the Counter Register value */
// 1765   TIM1->CNTRH = (uint8_t)(Counter >> 8);
        LDW       X, Y
        CLR       A
        RRWA      X, A
        LD        A, XL
        LD        L:0x525e, A
// 1766   TIM1->CNTRL = (uint8_t)(Counter);
        LD        A, YL
        LD        L:0x525f, A
// 1767 }
        RET
// 1768 
// 1769 /**
// 1770   * @brief  Sets the TIM1 Autoreload Register value.
// 1771   * @param   Autoreload specifies the Autoreload register new value.
// 1772   * This parameter is between 0x0000 and 0xFFFF.
// 1773   * @retval None
// 1774   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
// 1775 void TIM1_SetAutoreload(uint16_t Autoreload)
// 1776 {
TIM1_SetAutoreload:
        LDW       Y, X
// 1777   /* Set the Autoreload Register value */
// 1778   TIM1->ARRH = (uint8_t)(Autoreload >> 8);
        LDW       X, Y
        CLR       A
        RRWA      X, A
        LD        A, XL
        LD        L:0x5262, A
// 1779   TIM1->ARRL = (uint8_t)(Autoreload);
        LD        A, YL
        LD        L:0x5263, A
// 1780  }
        RET
// 1781 
// 1782 /**
// 1783   * @brief  Sets the TIM1 Capture Compare1 Register value.
// 1784   * @param   Compare1 specifies the Capture Compare1 register new value.
// 1785   * This parameter is between 0x0000 and 0xFFFF.
// 1786   * @retval None
// 1787   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
// 1788 void TIM1_SetCompare1(uint16_t Compare1)
// 1789 {
TIM1_SetCompare1:
        LDW       Y, X
// 1790   /* Set the Capture Compare1 Register value */
// 1791   TIM1->CCR1H = (uint8_t)(Compare1 >> 8);
        LDW       X, Y
        CLR       A
        RRWA      X, A
        LD        A, XL
        LD        L:0x5265, A
// 1792   TIM1->CCR1L = (uint8_t)(Compare1);
        LD        A, YL
        LD        L:0x5266, A
// 1793 }
        RET
// 1794 
// 1795 /**
// 1796   * @brief  Sets the TIM1 Capture Compare2 Register value.
// 1797   * @param   Compare2 specifies the Capture Compare2 register new value.
// 1798   * This parameter is between 0x0000 and 0xFFFF.
// 1799   * @retval None
// 1800   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
// 1801 void TIM1_SetCompare2(uint16_t Compare2)
// 1802 {
TIM1_SetCompare2:
        LDW       Y, X
// 1803   /* Set the Capture Compare2 Register value */
// 1804   TIM1->CCR2H = (uint8_t)(Compare2 >> 8);
        LDW       X, Y
        CLR       A
        RRWA      X, A
        LD        A, XL
        LD        L:0x5267, A
// 1805   TIM1->CCR2L = (uint8_t)(Compare2);
        LD        A, YL
        LD        L:0x5268, A
// 1806 }
        RET
// 1807 
// 1808 /**
// 1809   * @brief  Sets the TIM1 Capture Compare3 Register value.
// 1810   * @param   Compare3 specifies the Capture Compare3 register new value.
// 1811   * This parameter is between 0x0000 and 0xFFFF.
// 1812   * @retval None
// 1813   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
// 1814 void TIM1_SetCompare3(uint16_t Compare3)
// 1815 {
TIM1_SetCompare3:
        LDW       Y, X
// 1816   /* Set the Capture Compare3 Register value */
// 1817   TIM1->CCR3H = (uint8_t)(Compare3 >> 8);
        LDW       X, Y
        CLR       A
        RRWA      X, A
        LD        A, XL
        LD        L:0x5269, A
// 1818   TIM1->CCR3L = (uint8_t)(Compare3);
        LD        A, YL
        LD        L:0x526a, A
// 1819 }
        RET
// 1820 
// 1821 /**
// 1822   * @brief  Sets the TIM1 Capture Compare4 Register value.
// 1823   * @param   Compare4 specifies the Capture Compare4 register new value.
// 1824   * This parameter is between 0x0000 and 0xFFFF.
// 1825   * @retval None
// 1826   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
// 1827 void TIM1_SetCompare4(uint16_t Compare4)
// 1828 {
TIM1_SetCompare4:
        LDW       Y, X
// 1829   /* Set the Capture Compare4 Register value */
// 1830   TIM1->CCR4H = (uint8_t)(Compare4 >> 8);
        LDW       X, Y
        CLR       A
        RRWA      X, A
        LD        A, XL
        LD        L:0x526b, A
// 1831   TIM1->CCR4L = (uint8_t)(Compare4);
        LD        A, YL
        LD        L:0x526c, A
// 1832 }
        RET
// 1833 
// 1834 /**
// 1835   * @brief  Sets the TIM1 Input Capture 1 prescaler.
// 1836   * @param   TIM1_IC1Prescaler specifies the Input Capture prescaler new value
// 1837   * This parameter can be one of the following values:
// 1838   *                       - TIM1_ICPSC_DIV1: no prescaler
// 1839   *                       - TIM1_ICPSC_DIV2: capture is done once every 2 events
// 1840   *                       - TIM1_ICPSC_DIV4: capture is done once every 4 events
// 1841   *                       - TIM1_ICPSC_DIV8: capture is done once every 8 events
// 1842   * @retval None
// 1843   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
// 1844 void TIM1_SetIC1Prescaler(TIM1_ICPSC_TypeDef TIM1_IC1Prescaler)
// 1845 {
TIM1_SetIC1Prescaler:
        PUSH      S:?b8
        LD        S:?b8, A
// 1846   /* Check the parameters */
// 1847   assert_param(IS_TIM1_IC_PRESCALER_OK(TIM1_IC1Prescaler));
        TNZ       S:?b8
        JREQ      L:??TIM1_SetIC1Prescaler_0
        LD        A, S:?b8
        CP        A, #0x4
        JREQ      L:??TIM1_SetIC1Prescaler_0
        LD        A, S:?b8
        CP        A, #0x8
        JREQ      L:??TIM1_SetIC1Prescaler_0
        LD        A, S:?b8
        CP        A, #0xc
        JREQ      L:??TIM1_SetIC1Prescaler_0
        LDW       X, #0x737
        LDW       S:?w1, X
        CLRW      X
        LDW       S:?w0, X
        LDW       X, #`?<Constant "E:\\\\Desktop\\\\J19B_STM8\\\\...">`
        CALL      L:assert_failed
// 1848   
// 1849   /* Reset the IC1PSC Bits */ /* Set the IC1PSC value */
// 1850   TIM1->CCMR1 = (uint8_t)((uint8_t)(TIM1->CCMR1 & (uint8_t)(~TIM1_CCMR_ICxPSC)) 
// 1851                           | (uint8_t)TIM1_IC1Prescaler);
??TIM1_SetIC1Prescaler_0:
        LD        A, L:0x5258
        AND       A, #0xf3
        OR        A, S:?b8
        LD        L:0x5258, A
// 1852 }
        POP       S:?b8
        RET
// 1853 
// 1854 /**
// 1855   * @brief  Sets the TIM1 Input Capture 2 prescaler.
// 1856   * @param   TIM1_IC2Prescaler specifies the Input Capture prescaler new value
// 1857   * This parameter can be one of the following values:
// 1858   *                       - TIM1_ICPSC_DIV1: no prescaler
// 1859   *                       - TIM1_ICPSC_DIV2: capture is done once every 2 events
// 1860   *                       - TIM1_ICPSC_DIV4: capture is done once every 4 events
// 1861   *                       - TIM1_ICPSC_DIV8: capture is done once every 8 events
// 1862   * @retval None
// 1863   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
// 1864 void TIM1_SetIC2Prescaler(TIM1_ICPSC_TypeDef TIM1_IC2Prescaler)
// 1865 {
TIM1_SetIC2Prescaler:
        PUSH      S:?b8
        LD        S:?b8, A
// 1866   
// 1867   /* Check the parameters */
// 1868   assert_param(IS_TIM1_IC_PRESCALER_OK(TIM1_IC2Prescaler));
        TNZ       S:?b8
        JREQ      L:??TIM1_SetIC2Prescaler_0
        LD        A, S:?b8
        CP        A, #0x4
        JREQ      L:??TIM1_SetIC2Prescaler_0
        LD        A, S:?b8
        CP        A, #0x8
        JREQ      L:??TIM1_SetIC2Prescaler_0
        LD        A, S:?b8
        CP        A, #0xc
        JREQ      L:??TIM1_SetIC2Prescaler_0
        LDW       X, #0x74c
        LDW       S:?w1, X
        CLRW      X
        LDW       S:?w0, X
        LDW       X, #`?<Constant "E:\\\\Desktop\\\\J19B_STM8\\\\...">`
        CALL      L:assert_failed
// 1869   
// 1870   /* Reset the IC1PSC Bits */ /* Set the IC1PSC value */
// 1871   TIM1->CCMR2 = (uint8_t)((uint8_t)(TIM1->CCMR2 & (uint8_t)(~TIM1_CCMR_ICxPSC))
// 1872                           | (uint8_t)TIM1_IC2Prescaler);
??TIM1_SetIC2Prescaler_0:
        LD        A, L:0x5259
        AND       A, #0xf3
        OR        A, S:?b8
        LD        L:0x5259, A
// 1873 }
        POP       S:?b8
        RET
// 1874 
// 1875 /**
// 1876   * @brief  Sets the TIM1 Input Capture 3 prescaler.
// 1877   * @param   TIM1_IC3Prescaler specifies the Input Capture prescaler new value
// 1878   * This parameter can be one of the following values:
// 1879   *                       - TIM1_ICPSC_DIV1: no prescaler
// 1880   *                       - TIM1_ICPSC_DIV2: capture is done once every 2 events
// 1881   *                       - TIM1_ICPSC_DIV4: capture is done once every 4 events
// 1882   *                       - TIM1_ICPSC_DIV8: capture is done once every 8 events
// 1883   * @retval None
// 1884   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
// 1885 void TIM1_SetIC3Prescaler(TIM1_ICPSC_TypeDef TIM1_IC3Prescaler)
// 1886 {
TIM1_SetIC3Prescaler:
        PUSH      S:?b8
        LD        S:?b8, A
// 1887   
// 1888   /* Check the parameters */
// 1889   assert_param(IS_TIM1_IC_PRESCALER_OK(TIM1_IC3Prescaler));
        TNZ       S:?b8
        JREQ      L:??TIM1_SetIC3Prescaler_0
        LD        A, S:?b8
        CP        A, #0x4
        JREQ      L:??TIM1_SetIC3Prescaler_0
        LD        A, S:?b8
        CP        A, #0x8
        JREQ      L:??TIM1_SetIC3Prescaler_0
        LD        A, S:?b8
        CP        A, #0xc
        JREQ      L:??TIM1_SetIC3Prescaler_0
        LDW       X, #0x761
        LDW       S:?w1, X
        CLRW      X
        LDW       S:?w0, X
        LDW       X, #`?<Constant "E:\\\\Desktop\\\\J19B_STM8\\\\...">`
        CALL      L:assert_failed
// 1890   
// 1891   /* Reset the IC1PSC Bits & Set the IC1PSC value */
// 1892   TIM1->CCMR3 = (uint8_t)((uint8_t)(TIM1->CCMR3 & (uint8_t)(~TIM1_CCMR_ICxPSC)) | 
// 1893                           (uint8_t)TIM1_IC3Prescaler);
??TIM1_SetIC3Prescaler_0:
        LD        A, L:0x525a
        AND       A, #0xf3
        OR        A, S:?b8
        LD        L:0x525a, A
// 1894 }
        POP       S:?b8
        RET
// 1895 
// 1896 /**
// 1897   * @brief  Sets the TIM1 Input Capture 4 prescaler.
// 1898   * @param  TIM1_IC4Prescaler specifies the Input Capture prescaler new value
// 1899   *         This parameter can be one of the following values:
// 1900   *                       - TIM1_ICPSC_DIV1: no prescaler
// 1901   *                       - TIM1_ICPSC_DIV2: capture is done once every 2 events
// 1902   *                       - TIM1_ICPSC_DIV4: capture is done once every 4 events
// 1903   *                       - TIM1_ICPSC_DIV8: capture is done once every 8 events
// 1904   * @retval None
// 1905   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
// 1906 void TIM1_SetIC4Prescaler(TIM1_ICPSC_TypeDef TIM1_IC4Prescaler)
// 1907 {
TIM1_SetIC4Prescaler:
        PUSH      S:?b8
        LD        S:?b8, A
// 1908   
// 1909   /* Check the parameters */
// 1910   assert_param(IS_TIM1_IC_PRESCALER_OK(TIM1_IC4Prescaler));
        TNZ       S:?b8
        JREQ      L:??TIM1_SetIC4Prescaler_0
        LD        A, S:?b8
        CP        A, #0x4
        JREQ      L:??TIM1_SetIC4Prescaler_0
        LD        A, S:?b8
        CP        A, #0x8
        JREQ      L:??TIM1_SetIC4Prescaler_0
        LD        A, S:?b8
        CP        A, #0xc
        JREQ      L:??TIM1_SetIC4Prescaler_0
        LDW       X, #0x776
        LDW       S:?w1, X
        CLRW      X
        LDW       S:?w0, X
        LDW       X, #`?<Constant "E:\\\\Desktop\\\\J19B_STM8\\\\...">`
        CALL      L:assert_failed
// 1911   
// 1912   /* Reset the IC1PSC Bits &  Set the IC1PSC value */
// 1913   TIM1->CCMR4 = (uint8_t)((uint8_t)(TIM1->CCMR4 & (uint8_t)(~TIM1_CCMR_ICxPSC)) |
// 1914                           (uint8_t)TIM1_IC4Prescaler);
??TIM1_SetIC4Prescaler_0:
        LD        A, L:0x525b
        AND       A, #0xf3
        OR        A, S:?b8
        LD        L:0x525b, A
// 1915 }
        POP       S:?b8
        RET
// 1916 
// 1917 /**
// 1918   * @brief  Gets the TIM1 Input Capture 1 value.
// 1919   * @param  None
// 1920   * @retval Capture Compare 1 Register value.
// 1921   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
// 1922 uint16_t TIM1_GetCapture1(void)
// 1923 {
// 1924   /* Get the Capture 1 Register value */
// 1925   
// 1926   uint16_t tmpccr1 = 0;
TIM1_GetCapture1:
        CLRW      Y
// 1927   uint8_t tmpccr1l=0, tmpccr1h=0;
        CLR       S:?b1
        CLR       S:?b0
// 1928   
// 1929   tmpccr1h = TIM1->CCR1H;
        LD        A, L:0x5265
        LD        S:?b0, A
// 1930   tmpccr1l = TIM1->CCR1L;
        LD        A, L:0x5266
        LD        S:?b1, A
// 1931   
// 1932   tmpccr1 = (uint16_t)(tmpccr1l);
        CLRW      X
        EXG       A, XL
        LD        A, S:?b1
        EXG       A, XL
        LDW       Y, X
// 1933   tmpccr1 |= (uint16_t)((uint16_t)tmpccr1h << 8);
        CLRW      X
        EXG       A, XL
        LD        A, S:?b0
        EXG       A, XL
        CLR       A
        RLWA      X, A
        LDW       S:?w0, X
        EXGW      X, Y
        RRWA      X, A
        OR        A, S:?b1
        RRWA      X, A
        OR        A, S:?b0
        RRWA      X, A
        EXGW      X, Y
// 1934   /* Get the Capture 1 Register value */
// 1935   return (uint16_t)tmpccr1;
        LDW       X, Y
        RET
// 1936 }
// 1937 
// 1938 /**
// 1939   * @brief  Gets the TIM1 Input Capture 2 value.
// 1940   * @param  None
// 1941   * @retval Capture Compare 2 Register value.
// 1942   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
// 1943 uint16_t TIM1_GetCapture2(void)
// 1944 {
// 1945   /* Get the Capture 2 Register value */
// 1946   
// 1947   uint16_t tmpccr2 = 0;
TIM1_GetCapture2:
        CLRW      Y
// 1948   uint8_t tmpccr2l=0, tmpccr2h=0;
        CLR       S:?b1
        CLR       S:?b0
// 1949   
// 1950   tmpccr2h = TIM1->CCR2H;
        LD        A, L:0x5267
        LD        S:?b0, A
// 1951   tmpccr2l = TIM1->CCR2L;
        LD        A, L:0x5268
        LD        S:?b1, A
// 1952   
// 1953   tmpccr2 = (uint16_t)(tmpccr2l);
        CLRW      X
        EXG       A, XL
        LD        A, S:?b1
        EXG       A, XL
        LDW       Y, X
// 1954   tmpccr2 |= (uint16_t)((uint16_t)tmpccr2h << 8);
        CLRW      X
        EXG       A, XL
        LD        A, S:?b0
        EXG       A, XL
        CLR       A
        RLWA      X, A
        LDW       S:?w0, X
        EXGW      X, Y
        RRWA      X, A
        OR        A, S:?b1
        RRWA      X, A
        OR        A, S:?b0
        RRWA      X, A
        EXGW      X, Y
// 1955   /* Get the Capture 2 Register value */
// 1956   return (uint16_t)tmpccr2;
        LDW       X, Y
        RET
// 1957 }
// 1958 
// 1959 /**
// 1960   * @brief  Gets the TIM1 Input Capture 3 value.
// 1961   * @param  None
// 1962   * @retval Capture Compare 3 Register value.
// 1963   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
// 1964 uint16_t TIM1_GetCapture3(void)
// 1965 {
// 1966   /* Get the Capture 3 Register value */
// 1967   uint16_t tmpccr3 = 0;
TIM1_GetCapture3:
        CLRW      Y
// 1968   uint8_t tmpccr3l=0, tmpccr3h=0;
        CLR       S:?b1
        CLR       S:?b0
// 1969   
// 1970   tmpccr3h = TIM1->CCR3H;
        LD        A, L:0x5269
        LD        S:?b0, A
// 1971   tmpccr3l = TIM1->CCR3L;
        LD        A, L:0x526a
        LD        S:?b1, A
// 1972   
// 1973   tmpccr3 = (uint16_t)(tmpccr3l);
        CLRW      X
        EXG       A, XL
        LD        A, S:?b1
        EXG       A, XL
        LDW       Y, X
// 1974   tmpccr3 |= (uint16_t)((uint16_t)tmpccr3h << 8);
        CLRW      X
        EXG       A, XL
        LD        A, S:?b0
        EXG       A, XL
        CLR       A
        RLWA      X, A
        LDW       S:?w0, X
        EXGW      X, Y
        RRWA      X, A
        OR        A, S:?b1
        RRWA      X, A
        OR        A, S:?b0
        RRWA      X, A
        EXGW      X, Y
// 1975   /* Get the Capture 3 Register value */
// 1976   return (uint16_t)tmpccr3;
        LDW       X, Y
        RET
// 1977 }
// 1978 
// 1979 /**
// 1980   * @brief  Gets the TIM1 Input Capture 4 value.
// 1981   * @param  None
// 1982   * @retval Capture Compare 4 Register value.
// 1983   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
// 1984 uint16_t TIM1_GetCapture4(void)
// 1985 {
// 1986   /* Get the Capture 4 Register value */
// 1987   uint16_t tmpccr4 = 0;
TIM1_GetCapture4:
        CLRW      Y
// 1988   uint8_t tmpccr4l=0, tmpccr4h=0;
        CLR       S:?b1
        CLR       S:?b0
// 1989   
// 1990   tmpccr4h = TIM1->CCR4H;
        LD        A, L:0x526b
        LD        S:?b0, A
// 1991   tmpccr4l = TIM1->CCR4L;
        LD        A, L:0x526c
        LD        S:?b1, A
// 1992   
// 1993   tmpccr4 = (uint16_t)(tmpccr4l);
        CLRW      X
        EXG       A, XL
        LD        A, S:?b1
        EXG       A, XL
        LDW       Y, X
// 1994   tmpccr4 |= (uint16_t)((uint16_t)tmpccr4h << 8);
        CLRW      X
        EXG       A, XL
        LD        A, S:?b0
        EXG       A, XL
        CLR       A
        RLWA      X, A
        LDW       S:?w0, X
        EXGW      X, Y
        RRWA      X, A
        OR        A, S:?b1
        RRWA      X, A
        OR        A, S:?b0
        RRWA      X, A
        EXGW      X, Y
// 1995   /* Get the Capture 4 Register value */
// 1996   return (uint16_t)tmpccr4;
        LDW       X, Y
        RET
// 1997 }
// 1998 
// 1999 /**
// 2000   * @brief  Gets the TIM1 Counter value.
// 2001   * @param  None
// 2002   * @retval Counter Register value.
// 2003   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
// 2004 uint16_t TIM1_GetCounter(void)
// 2005 {
// 2006   uint16_t tmpcntr = 0;
TIM1_GetCounter:
        CLRW      Y
// 2007   
// 2008   tmpcntr = ((uint16_t)TIM1->CNTRH << 8);
        LD        A, L:0x525e
        CLRW      X
        LD        XL, A
        CLR       A
        RLWA      X, A
        LDW       Y, X
// 2009   
// 2010   /* Get the Counter Register value */
// 2011   return (uint16_t)(tmpcntr | (uint16_t)(TIM1->CNTRL));
        LD        A, L:0x525f
        CLRW      X
        LD        XL, A
        LDW       S:?w0, X
        LDW       X, Y
        RRWA      X, A
        OR        A, S:?b1
        RRWA      X, A
        OR        A, S:?b0
        RRWA      X, A
        RET
// 2012 }
// 2013 
// 2014 /**
// 2015   * @brief  Gets the TIM1 Prescaler value.
// 2016   * @param  None
// 2017   * @retval Prescaler Register value.
// 2018   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
// 2019 uint16_t TIM1_GetPrescaler(void)
// 2020 {
// 2021   uint16_t temp = 0;
TIM1_GetPrescaler:
        CLRW      Y
// 2022   
// 2023   temp = ((uint16_t)TIM1->PSCRH << 8);
        LD        A, L:0x5260
        CLRW      X
        LD        XL, A
        CLR       A
        RLWA      X, A
        LDW       Y, X
// 2024   
// 2025   /* Get the Prescaler Register value */
// 2026   return (uint16_t)( temp | (uint16_t)(TIM1->PSCRL));
        LD        A, L:0x5261
        CLRW      X
        LD        XL, A
        LDW       S:?w0, X
        LDW       X, Y
        RRWA      X, A
        OR        A, S:?b1
        RRWA      X, A
        OR        A, S:?b0
        RRWA      X, A
        RET
// 2027 }
// 2028 
// 2029 /**
// 2030   * @brief  Checks whether the specified TIM1 flag is set or not.
// 2031   * @param  TIM1_FLAG specifies the flag to check.
// 2032   *         This parameter can be one of the following values:
// 2033   *                   - TIM1_FLAG_UPDATE: TIM1 update Flag
// 2034   *                   - TIM1_FLAG_CC1: TIM1 Capture Compare 1 Flag
// 2035   *                   - TIM1_FLAG_CC2: TIM1 Capture Compare 2 Flag
// 2036   *                   - TIM1_FLAG_CC3: TIM1 Capture Compare 3 Flag
// 2037   *                   - TIM1_FLAG_CC4: TIM1 Capture Compare 4 Flag
// 2038   *                   - TIM1_FLAG_COM: TIM1 Commutation Flag
// 2039   *                   - TIM1_FLAG_TRIGGER: TIM1 Trigger Flag
// 2040   *                   - TIM1_FLAG_BREAK: TIM1 Break Flag
// 2041   *                   - TIM1_FLAG_CC1OF: TIM1 Capture Compare 1 overcapture Flag
// 2042   *                   - TIM1_FLAG_CC2OF: TIM1 Capture Compare 2 overcapture Flag
// 2043   *                   - TIM1_FLAG_CC3OF: TIM1 Capture Compare 3 overcapture Flag
// 2044   *                   - TIM1_FLAG_CC4OF: TIM1 Capture Compare 4 overcapture Flag
// 2045   * @retval FlagStatus The new state of TIM1_FLAG (SET or RESET).
// 2046   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
// 2047 FlagStatus TIM1_GetFlagStatus(TIM1_FLAG_TypeDef TIM1_FLAG)
// 2048 {
TIM1_GetFlagStatus:
        CALL      L:?push_w4
        LDW       S:?w4, X
// 2049   FlagStatus bitstatus = RESET;
        CLR       S:?b0
// 2050   uint8_t tim1_flag_l = 0, tim1_flag_h = 0;
        CLR       S:?b1
        CLR       A
// 2051   
// 2052   /* Check the parameters */
// 2053   assert_param(IS_TIM1_GET_FLAG_OK(TIM1_FLAG));
        LDW       X, S:?w4
        CPW       X, #0x1
        JREQ      L:??TIM1_GetFlagStatus_0
        LDW       X, S:?w4
        CPW       X, #0x2
        JREQ      L:??TIM1_GetFlagStatus_0
        LDW       X, S:?w4
        CPW       X, #0x4
        JREQ      L:??TIM1_GetFlagStatus_0
        LDW       X, S:?w4
        CPW       X, #0x8
        JREQ      L:??TIM1_GetFlagStatus_0
        LDW       X, S:?w4
        CPW       X, #0x10
        JREQ      L:??TIM1_GetFlagStatus_0
        LDW       X, S:?w4
        CPW       X, #0x20
        JREQ      L:??TIM1_GetFlagStatus_0
        LDW       X, S:?w4
        CPW       X, #0x40
        JREQ      L:??TIM1_GetFlagStatus_0
        LDW       X, S:?w4
        CPW       X, #0x80
        JREQ      L:??TIM1_GetFlagStatus_0
        LDW       X, S:?w4
        CPW       X, #0x200
        JREQ      L:??TIM1_GetFlagStatus_0
        LDW       X, S:?w4
        CPW       X, #0x400
        JREQ      L:??TIM1_GetFlagStatus_0
        LDW       X, S:?w4
        CPW       X, #0x800
        JREQ      L:??TIM1_GetFlagStatus_0
        LDW       X, S:?w4
        CPW       X, #0x1000
        JREQ      L:??TIM1_GetFlagStatus_0
        LDW       X, #0x805
        LDW       S:?w1, X
        CLRW      X
        LDW       S:?w0, X
        LDW       X, #`?<Constant "E:\\\\Desktop\\\\J19B_STM8\\\\...">`
        CALL      L:assert_failed
// 2054   
// 2055   tim1_flag_l = (uint8_t)(TIM1->SR1 & (uint8_t)TIM1_FLAG);
??TIM1_GetFlagStatus_0:
        LD        A, S:?b9
        AND       A, L:0x5255
        LD        S:?b1, A
// 2056   tim1_flag_h = (uint8_t)((uint16_t)TIM1_FLAG >> 8);
        LDW       X, S:?w4
        CLR       A
        RRWA      X, A
        LD        A, XL
// 2057   
// 2058   if ((tim1_flag_l | (uint8_t)(TIM1->SR2 & tim1_flag_h)) != 0)
        AND       A, L:0x5256
        OR        A, S:?b1
        CP        A, #0x0
        JREQ      L:??TIM1_GetFlagStatus_1
// 2059   {
// 2060     bitstatus = SET;
        MOV       S:?b0, #0x1
        JRA       L:??TIM1_GetFlagStatus_2
// 2061   }
// 2062   else
// 2063   {
// 2064     bitstatus = RESET;
??TIM1_GetFlagStatus_1:
        CLR       S:?b0
// 2065   }
// 2066   return (FlagStatus)(bitstatus);
??TIM1_GetFlagStatus_2:
        LD        A, S:?b0
        JP        L:?epilogue_w4
// 2067 }
// 2068 
// 2069 /**
// 2070   * @brief  Clears the TIM1’s pending flags.
// 2071   * @param  TIM1_FLAG specifies the flag to clear.
// 2072   *         This parameter can be one of the following values:
// 2073   *                       - TIM1_FLAG_UPDATE: TIM1 update Flag
// 2074   *                       - TIM1_FLAG_CC1: TIM1 Capture Compare 1 Flag
// 2075   *                       - TIM1_FLAG_CC2: TIM1 Capture Compare 2 Flag
// 2076   *                       - TIM1_FLAG_CC3: TIM1 Capture Compare 3 Flag
// 2077   *                       - TIM1_FLAG_CC4: TIM1 Capture Compare 4 Flag
// 2078   *                       - TIM1_FLAG_COM: TIM1 Commutation Flag
// 2079   *                       - TIM1_FLAG_TRIGGER: TIM1 Trigger Flag
// 2080   *                       - TIM1_FLAG_BREAK: TIM1 Break Flag
// 2081   *                       - TIM1_FLAG_CC1OF: TIM1 Capture Compare 1 overcapture Flag
// 2082   *                       - TIM1_FLAG_CC2OF: TIM1 Capture Compare 2 overcapture Flag
// 2083   *                       - TIM1_FLAG_CC3OF: TIM1 Capture Compare 3 overcapture Flag
// 2084   *                       - TIM1_FLAG_CC4OF: TIM1 Capture Compare 4 overcapture Flag
// 2085   * @retval None.
// 2086   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
// 2087 void TIM1_ClearFlag(TIM1_FLAG_TypeDef TIM1_FLAG)
// 2088 {
TIM1_ClearFlag:
        CALL      L:?push_w4
        LDW       S:?w4, X
// 2089   /* Check the parameters */
// 2090   assert_param(IS_TIM1_CLEAR_FLAG_OK(TIM1_FLAG));
        LDW       X, S:?w4
        RLWA      X, A
        AND       A, #0xe1
        RLWA      X, A
        AND       A, #0x0
        RLWA      X, A
        TNZW      X
        JRNE      L:??TIM1_ClearFlag_0
        LDW       X, S:?w4
        TNZW      X
        JRNE      L:??TIM1_ClearFlag_1
??TIM1_ClearFlag_0:
        LDW       X, #0x82a
        LDW       S:?w1, X
        CLRW      X
        LDW       S:?w0, X
        LDW       X, #`?<Constant "E:\\\\Desktop\\\\J19B_STM8\\\\...">`
        CALL      L:assert_failed
// 2091   
// 2092   /* Clear the flags (rc_w0) clear this bit by writing 0. Writing ‘1’ has no effect*/
// 2093   TIM1->SR1 = (uint8_t)(~(uint8_t)(TIM1_FLAG));
??TIM1_ClearFlag_1:
        LD        A, S:?b9
        CPL       A
        LD        L:0x5255, A
// 2094   TIM1->SR2 = (uint8_t)((uint8_t)(~((uint8_t)((uint16_t)TIM1_FLAG >> 8))) & 
// 2095                         (uint8_t)0x1E);
        LDW       X, S:?w4
        CLR       A
        RRWA      X, A
        LD        A, XL
        CPL       A
        AND       A, #0x1e
        LD        L:0x5256, A
// 2096 }
        JP        L:?epilogue_w4
// 2097 
// 2098 /**
// 2099   * @brief  Checks whether the TIM1 interrupt has occurred or not.
// 2100   * @param  TIM1_IT specifies the TIM1 interrupt source to check.
// 2101   *         This parameter can be one of the following values:
// 2102   *                       - TIM1_IT_UPDATE: TIM1 update Interrupt source
// 2103   *                       - TIM1_IT_CC1: TIM1 Capture Compare 1 Interrupt source
// 2104   *                       - TIM1_IT_CC2: TIM1 Capture Compare 2 Interrupt source
// 2105   *                       - TIM1_IT_CC3: TIM1 Capture Compare 3 Interrupt source
// 2106   *                       - TIM1_IT_CC4: TIM1 Capture Compare 4 Interrupt source
// 2107   *                       - TIM1_IT_COM: TIM1 Commutation Interrupt source
// 2108   *                       - TIM1_IT_TRIGGER: TIM1 Trigger Interrupt source
// 2109   *                       - TIM1_IT_BREAK: TIM1 Break Interrupt source
// 2110   * @retval ITStatus The new state of the TIM1_IT(SET or RESET).
// 2111   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
// 2112 ITStatus TIM1_GetITStatus(TIM1_IT_TypeDef TIM1_IT)
// 2113 {
TIM1_GetITStatus:
        PUSH      S:?b8
        LD        S:?b8, A
// 2114   ITStatus bitstatus = RESET;
        CLR       S:?b0
// 2115   uint8_t TIM1_itStatus = 0, TIM1_itEnable = 0;
        CLR       S:?b2
        CLR       S:?b1
// 2116   
// 2117   /* Check the parameters */
// 2118   assert_param(IS_TIM1_GET_IT_OK(TIM1_IT));
        LD        A, S:?b8
        CP        A, #0x1
        JREQ      L:??TIM1_GetITStatus_0
        LD        A, S:?b8
        CP        A, #0x2
        JREQ      L:??TIM1_GetITStatus_0
        LD        A, S:?b8
        CP        A, #0x4
        JREQ      L:??TIM1_GetITStatus_0
        LD        A, S:?b8
        CP        A, #0x8
        JREQ      L:??TIM1_GetITStatus_0
        LD        A, S:?b8
        CP        A, #0x10
        JREQ      L:??TIM1_GetITStatus_0
        LD        A, S:?b8
        CP        A, #0x20
        JREQ      L:??TIM1_GetITStatus_0
        LD        A, S:?b8
        CP        A, #0x40
        JREQ      L:??TIM1_GetITStatus_0
        LD        A, S:?b8
        CP        A, #0x80
        JREQ      L:??TIM1_GetITStatus_0
        LDW       X, #0x846
        LDW       S:?w1, X
        CLRW      X
        LDW       S:?w0, X
        LDW       X, #`?<Constant "E:\\\\Desktop\\\\J19B_STM8\\\\...">`
        CALL      L:assert_failed
// 2119   
// 2120   TIM1_itStatus = (uint8_t)(TIM1->SR1 & (uint8_t)TIM1_IT);
??TIM1_GetITStatus_0:
        LD        A, S:?b8
        AND       A, L:0x5255
        LD        S:?b2, A
// 2121   
// 2122   TIM1_itEnable = (uint8_t)(TIM1->IER & (uint8_t)TIM1_IT);
        LD        A, S:?b8
        AND       A, L:0x5254
        LD        S:?b1, A
// 2123   
// 2124   if ((TIM1_itStatus != (uint8_t)RESET ) && (TIM1_itEnable != (uint8_t)RESET ))
        TNZ       S:?b2
        JREQ      L:??TIM1_GetITStatus_1
        TNZ       S:?b1
        JREQ      L:??TIM1_GetITStatus_1
// 2125   {
// 2126     bitstatus = SET;
        MOV       S:?b0, #0x1
        JRA       L:??TIM1_GetITStatus_2
// 2127   }
// 2128   else
// 2129   {
// 2130     bitstatus = RESET;
??TIM1_GetITStatus_1:
        CLR       S:?b0
// 2131   }
// 2132   return (ITStatus)(bitstatus);
??TIM1_GetITStatus_2:
        LD        A, S:?b0
        POP       S:?b8
        RET
// 2133 }
// 2134 
// 2135 /**
// 2136   * @brief  Clears the TIM1's interrupt pending bits.
// 2137   * @param  TIM1_IT specifies the pending bit to clear.
// 2138   *         This parameter can be one of the following values:
// 2139   *                       - TIM1_IT_UPDATE: TIM1 update Interrupt source
// 2140   *                       - TIM1_IT_CC1: TIM1 Capture Compare 1 Interrupt source
// 2141   *                       - TIM1_IT_CC2: TIM1 Capture Compare 2 Interrupt source
// 2142   *                       - TIM1_IT_CC3: TIM1 Capture Compare 3 Interrupt source
// 2143   *                       - TIM1_IT_CC4: TIM1 Capture Compare 4 Interrupt source
// 2144   *                       - TIM1_IT_COM: TIM1 Commutation Interrupt source
// 2145   *                       - TIM1_IT_TRIGGER: TIM1 Trigger Interrupt source
// 2146   *                       - TIM1_IT_BREAK: TIM1 Break Interrupt source
// 2147   * @retval None.
// 2148   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
// 2149 void TIM1_ClearITPendingBit(TIM1_IT_TypeDef TIM1_IT)
// 2150 {
TIM1_ClearITPendingBit:
        PUSH      S:?b8
        LD        S:?b8, A
// 2151   /* Check the parameters */
// 2152   assert_param(IS_TIM1_IT_OK(TIM1_IT));
        TNZ       S:?b8
        JRNE      L:??TIM1_ClearITPendingBit_0
        LDW       X, #0x868
        LDW       S:?w1, X
        CLRW      X
        LDW       S:?w0, X
        LDW       X, #`?<Constant "E:\\\\Desktop\\\\J19B_STM8\\\\...">`
        CALL      L:assert_failed
// 2153   
// 2154   /* Clear the IT pending Bit */
// 2155   TIM1->SR1 = (uint8_t)(~(uint8_t)TIM1_IT);
??TIM1_ClearITPendingBit_0:
        CPL       S:?b8
        LD        A, S:?b8
        LD        L:0x5255, A
// 2156 }
        POP       S:?b8
        RET
// 2157 
// 2158 /**
// 2159   * @brief  Configure the TI1 as Input.
// 2160   * @param  TIM1_ICPolarity  The Input Polarity.
// 2161   *         This parameter can be one of the following values:
// 2162   *                       - TIM1_ICPOLARITY_FALLING
// 2163   *                       - TIM1_ICPOLARITY_RISING
// 2164   * @param  TIM1_ICSelection specifies the input to be used.
// 2165   *         This parameter can be one of the following values:
// 2166   *                       - TIM1_ICSELECTION_DIRECTTI: TIM1 Input 1 is selected to
// 2167   *                         be connected to IC1.
// 2168   *                       - TIM1_ICSELECTION_INDIRECTTI: TIM1 Input 1 is selected to
// 2169   *                         be connected to IC2.
// 2170   * @param  TIM1_ICFilter Specifies the Input Capture Filter.
// 2171   *         This parameter must be a value between 0x00 and 0x0F.
// 2172   * @retval None
// 2173   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
// 2174 static void TI1_Config(uint8_t TIM1_ICPolarity,
// 2175                        uint8_t TIM1_ICSelection,
// 2176                        uint8_t TIM1_ICFilter)
// 2177 {
TI1_Config:
        LD        S:?b2, A
        LD        A, S:?b1
// 2178   /* Disable the Channel 1: Reset the CCE Bit */
// 2179   TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC1E);
        BRES      L:0x525c, #0x0
// 2180   
// 2181   /* Select the Input and set the filter */
// 2182   TIM1->CCMR1 = (uint8_t)((uint8_t)(TIM1->CCMR1 & (uint8_t)(~(uint8_t)( TIM1_CCMR_CCxS | TIM1_CCMR_ICxF ))) | 
// 2183                           (uint8_t)(( (TIM1_ICSelection)) | ((uint8_t)( TIM1_ICFilter << 4))));
        SWAP      A
        AND       A, #0xf0
        OR        A, S:?b0
        PUSH      A
        LD        A, L:0x5258
        AND       A, #0xc
        LD        S:?b1, A
        POP       A
        OR        A, S:?b1
        LD        L:0x5258, A
// 2184   
// 2185   /* Select the Polarity */
// 2186   if (TIM1_ICPolarity != TIM1_ICPOLARITY_RISING)
        TNZ       S:?b2
        JREQ      L:??TI1_Config_0
// 2187   {
// 2188     TIM1->CCER1 |= TIM1_CCER1_CC1P;
        BSET      L:0x525c, #0x1
        JRA       L:??TI1_Config_1
// 2189   }
// 2190   else
// 2191   {
// 2192     TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC1P);
??TI1_Config_0:
        BRES      L:0x525c, #0x1
// 2193   }
// 2194   
// 2195   /* Set the CCE Bit */
// 2196   TIM1->CCER1 |=  TIM1_CCER1_CC1E;
??TI1_Config_1:
        BSET      L:0x525c, #0x0
// 2197 }
        RET
// 2198 
// 2199 /**
// 2200   * @brief  Configure the TI2 as Input.
// 2201   * @param  TIM1_ICPolarity  The Input Polarity.
// 2202   *         This parameter can be one of the following values:
// 2203   *                       - TIM1_ICPOLARITY_FALLING
// 2204   *                       - TIM1_ICPOLARITY_RISING
// 2205   * @param  TIM1_ICSelection specifies the input to be used.
// 2206   *         This parameter can be one of the following values:
// 2207   *                       - TIM1_ICSELECTION_DIRECTTI: TIM1 Input 2 is selected to
// 2208   *                         be connected to IC2.
// 2209   *                       - TIM1_ICSELECTION_INDIRECTTI: TIM1 Input 2 is selected to
// 2210   *                         be connected to IC1.
// 2211   * @param  TIM1_ICFilter Specifies the Input Capture Filter.
// 2212   *         This parameter must be a value between 0x00 and 0x0F.
// 2213   * @retval None
// 2214   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
// 2215 static void TI2_Config(uint8_t TIM1_ICPolarity,
// 2216                        uint8_t TIM1_ICSelection,
// 2217                        uint8_t TIM1_ICFilter)
// 2218 {
TI2_Config:
        LD        S:?b2, A
        LD        A, S:?b1
// 2219   /* Disable the Channel 2: Reset the CCE Bit */
// 2220   TIM1->CCER1 &=  (uint8_t)(~TIM1_CCER1_CC2E);
        BRES      L:0x525c, #0x4
// 2221   
// 2222   /* Select the Input and set the filter */
// 2223   TIM1->CCMR2  = (uint8_t)((uint8_t)(TIM1->CCMR2 & (uint8_t)(~(uint8_t)( TIM1_CCMR_CCxS | TIM1_CCMR_ICxF ))) 
// 2224                            | (uint8_t)(( (TIM1_ICSelection)) | ((uint8_t)( TIM1_ICFilter << 4))));
        SWAP      A
        AND       A, #0xf0
        OR        A, S:?b0
        PUSH      A
        LD        A, L:0x5259
        AND       A, #0xc
        LD        S:?b1, A
        POP       A
        OR        A, S:?b1
        LD        L:0x5259, A
// 2225   /* Select the Polarity */
// 2226   if (TIM1_ICPolarity != TIM1_ICPOLARITY_RISING)
        TNZ       S:?b2
        JREQ      L:??TI2_Config_0
// 2227   {
// 2228     TIM1->CCER1 |= TIM1_CCER1_CC2P;
        BSET      L:0x525c, #0x5
        JRA       L:??TI2_Config_1
// 2229   }
// 2230   else
// 2231   {
// 2232     TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC2P);
??TI2_Config_0:
        BRES      L:0x525c, #0x5
// 2233   }
// 2234   /* Set the CCE Bit */
// 2235   TIM1->CCER1 |=  TIM1_CCER1_CC2E;
??TI2_Config_1:
        BSET      L:0x525c, #0x4
// 2236 }
        RET
// 2237 
// 2238 /**
// 2239   * @brief  Configure the TI3 as Input.
// 2240   * @param  TIM1_ICPolarity  The Input Polarity.
// 2241   *         This parameter can be one of the following values:
// 2242   *                       - TIM1_ICPOLARITY_FALLING
// 2243   *                       - TIM1_ICPOLARITY_RISING
// 2244   * @param  TIM1_ICSelection specifies the input to be used.
// 2245   *         This parameter can be one of the following values:
// 2246   *                       - TIM1_ICSELECTION_DIRECTTI: TIM1 Input 3 is selected to
// 2247   *                         be connected to IC3.
// 2248   *                       - TIM1_ICSELECTION_INDIRECTTI: TIM1 Input 3 is selected to
// 2249   *                         be connected to IC4.
// 2250   * @param  TIM1_ICFilter Specifies the Input Capture Filter.
// 2251   *         This parameter must be a value between 0x00 and 0x0F.
// 2252   * @retval None
// 2253   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
// 2254 static void TI3_Config(uint8_t TIM1_ICPolarity,
// 2255                        uint8_t TIM1_ICSelection,
// 2256                        uint8_t TIM1_ICFilter)
// 2257 {
TI3_Config:
        LD        S:?b2, A
        LD        A, S:?b1
// 2258   /* Disable the Channel 3: Reset the CCE Bit */
// 2259   TIM1->CCER2 &=  (uint8_t)(~TIM1_CCER2_CC3E);
        BRES      L:0x525d, #0x0
// 2260   
// 2261   /* Select the Input and set the filter */
// 2262   TIM1->CCMR3 = (uint8_t)((uint8_t)(TIM1->CCMR3 & (uint8_t)(~(uint8_t)( TIM1_CCMR_CCxS | TIM1_CCMR_ICxF))) 
// 2263                           | (uint8_t)(( (TIM1_ICSelection)) | ((uint8_t)( TIM1_ICFilter << 4))));
        SWAP      A
        AND       A, #0xf0
        OR        A, S:?b0
        PUSH      A
        LD        A, L:0x525a
        AND       A, #0xc
        LD        S:?b1, A
        POP       A
        OR        A, S:?b1
        LD        L:0x525a, A
// 2264   
// 2265   /* Select the Polarity */
// 2266   if (TIM1_ICPolarity != TIM1_ICPOLARITY_RISING)
        TNZ       S:?b2
        JREQ      L:??TI3_Config_0
// 2267   {
// 2268     TIM1->CCER2 |= TIM1_CCER2_CC3P;
        BSET      L:0x525d, #0x1
        JRA       L:??TI3_Config_1
// 2269   }
// 2270   else
// 2271   {
// 2272     TIM1->CCER2 &= (uint8_t)(~TIM1_CCER2_CC3P);
??TI3_Config_0:
        BRES      L:0x525d, #0x1
// 2273   }
// 2274   /* Set the CCE Bit */
// 2275   TIM1->CCER2 |=  TIM1_CCER2_CC3E;
??TI3_Config_1:
        BSET      L:0x525d, #0x0
// 2276 }
        RET
// 2277 
// 2278 /**
// 2279   * @brief  Configure the TI4 as Input.
// 2280   * @param  TIM1_ICPolarity  The Input Polarity.
// 2281   *         This parameter can be one of the following values:
// 2282   *                       - TIM1_ICPOLARITY_FALLING
// 2283   *                       - TIM1_ICPOLARITY_RISING
// 2284   * @param  TIM1_ICSelection specifies the input to be used.
// 2285   *         This parameter can be one of the following values:
// 2286   *                       - TIM1_ICSELECTION_DIRECTTI: TIM1 Input 4 is selected to
// 2287   *                         be connected to IC4.
// 2288   *                       - TIM1_ICSELECTION_INDIRECTTI: TIM1 Input 4 is selected to
// 2289   *                         be connected to IC3.
// 2290   * @param  TIM1_ICFilter Specifies the Input Capture Filter.
// 2291   *         This parameter must be a value between 0x00 and 0x0F.
// 2292   * @retval None
// 2293   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
// 2294 static void TI4_Config(uint8_t TIM1_ICPolarity,
// 2295                        uint8_t TIM1_ICSelection,
// 2296                        uint8_t TIM1_ICFilter)
// 2297 {
TI4_Config:
        LD        S:?b2, A
        LD        A, S:?b1
// 2298   /* Disable the Channel 4: Reset the CCE Bit */
// 2299   TIM1->CCER2 &=  (uint8_t)(~TIM1_CCER2_CC4E);
        BRES      L:0x525d, #0x4
// 2300   
// 2301   /* Select the Input and set the filter */
// 2302   TIM1->CCMR4 = (uint8_t)((uint8_t)(TIM1->CCMR4 & (uint8_t)(~(uint8_t)( TIM1_CCMR_CCxS | TIM1_CCMR_ICxF )))
// 2303                           | (uint8_t)(( (TIM1_ICSelection)) | ((uint8_t)( TIM1_ICFilter << 4))));
        SWAP      A
        AND       A, #0xf0
        OR        A, S:?b0
        PUSH      A
        LD        A, L:0x525b
        AND       A, #0xc
        LD        S:?b1, A
        POP       A
        OR        A, S:?b1
        LD        L:0x525b, A
// 2304   
// 2305   /* Select the Polarity */
// 2306   if (TIM1_ICPolarity != TIM1_ICPOLARITY_RISING)
        TNZ       S:?b2
        JREQ      L:??TI4_Config_0
// 2307   {
// 2308     TIM1->CCER2 |= TIM1_CCER2_CC4P;
        BSET      L:0x525d, #0x5
        JRA       L:??TI4_Config_1
// 2309   }
// 2310   else
// 2311   {
// 2312     TIM1->CCER2 &= (uint8_t)(~TIM1_CCER2_CC4P);
??TI4_Config_0:
        BRES      L:0x525d, #0x5
// 2313   }
// 2314   
// 2315   /* Set the CCE Bit */
// 2316   TIM1->CCER2 |=  TIM1_CCER2_CC4E;
??TI4_Config_1:
        BSET      L:0x525d, #0x4
// 2317 }
        RET

        SECTION VREGS:DATA:REORDER:NOROOT(0)

        SECTION `.near.rodata`:CONST:REORDER:NOROOT(0)
`?<Constant "E:\\\\Desktop\\\\J19B_STM8\\\\...">`:
        DC8 "E:\\Desktop\\J19B_STM8\\Lib\\src\\stm8s_tim1.c"

        END
// 2318 
// 2319 
// 2320 /**
// 2321   * @}
// 2322   */
// 2323   
// 2324 /**
// 2325   * @}
// 2326   */
// 2327   
// 2328 
// 2329 /************************ (C) COPYRIGHT STMicroelectronics *****END OF FILE****/
// 
//    42 bytes in section .near.rodata
// 6 011 bytes in section .near_func.text
// 
// 6 011 bytes of CODE  memory
//    42 bytes of CONST memory
//
//Errors: none
//Warnings: none
