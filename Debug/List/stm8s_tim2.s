///////////////////////////////////////////////////////////////////////////////
//                                                                            /
//                                                      11/Mar/2019  20:52:11 /
// IAR C/C++ Compiler V1.31.1.20058 [Evaluation] for STM8                     /
// Copyright 2010-2012 IAR Systems AB.                                        /
//                                                                            /
//    Source file  =  C:\Users\lun55\Desktop\J19B_STM8\Lib\stm8s_tim2.c       /
//    Command line =  C:\Users\lun55\Desktop\J19B_STM8\Lib\stm8s_tim2.c -e    /
//                    -Ol --no_cse --no_unroll --no_inline --no_code_motion   /
//                    --no_tbaa --no_cross_call --debug --code_model small    /
//                    --data_model medium -o C:\Users\lun55\Desktop\J19B_STM8 /
//                    \Debug\Obj\ --dlib_config "D:\Program Files (x86)\IAR   /
//                    Systems\Embedded Workbench 6.0                          /
//                    Evaluation\stm8\LIB\dlstm8smf.h" -lcN                   /
//                    C:\Users\lun55\Desktop\J19B_STM8\Debug\List\ -lB        /
//                    C:\Users\lun55\Desktop\J19B_STM8\Debug\List\ --vregs 16 /
//    List file    =  C:\Users\lun55\Desktop\J19B_STM8\Debug\List\stm8s_tim2. /
//                    s                                                       /
//                                                                            /
//                                                                            /
///////////////////////////////////////////////////////////////////////////////

        NAME stm8s_tim2

        EXTERN ?and16_x_x_dw
        EXTERN ?b0
        EXTERN ?b1
        EXTERN ?b10
        EXTERN ?b11
        EXTERN ?b12
        EXTERN ?b13
        EXTERN ?b14
        EXTERN ?b2
        EXTERN ?b3
        EXTERN ?b8
        EXTERN ?b9
        EXTERN ?epilogue_l2
        EXTERN ?epilogue_l2_w6
        EXTERN ?epilogue_w4
        EXTERN ?pop_w6
        EXTERN ?push_l2
        EXTERN ?push_w4
        EXTERN ?push_w6
        EXTERN ?w0
        EXTERN ?w1
        EXTERN ?w4
        EXTERN ?w6
        EXTERN assert_failed

        PUBLIC TIM2_ARRPreloadConfig
        PUBLIC TIM2_CCxCmd
        PUBLIC TIM2_ClearFlag
        PUBLIC TIM2_ClearITPendingBit
        PUBLIC TIM2_Cmd
        PUBLIC TIM2_DeInit
        PUBLIC TIM2_ForcedOC1Config
        PUBLIC TIM2_ForcedOC2Config
        PUBLIC TIM2_ForcedOC3Config
        PUBLIC TIM2_GenerateEvent
        PUBLIC TIM2_GetCapture1
        PUBLIC TIM2_GetCapture2
        PUBLIC TIM2_GetCapture3
        PUBLIC TIM2_GetCounter
        PUBLIC TIM2_GetFlagStatus
        PUBLIC TIM2_GetITStatus
        PUBLIC TIM2_GetPrescaler
        PUBLIC TIM2_ICInit
        PUBLIC TIM2_ITConfig
        PUBLIC TIM2_OC1Init
        PUBLIC TIM2_OC1PolarityConfig
        PUBLIC TIM2_OC1PreloadConfig
        PUBLIC TIM2_OC2Init
        PUBLIC TIM2_OC2PolarityConfig
        PUBLIC TIM2_OC2PreloadConfig
        PUBLIC TIM2_OC3Init
        PUBLIC TIM2_OC3PolarityConfig
        PUBLIC TIM2_OC3PreloadConfig
        PUBLIC TIM2_PWMIConfig
        PUBLIC TIM2_PrescalerConfig
        PUBLIC TIM2_SelectOCxM
        PUBLIC TIM2_SelectOnePulseMode
        PUBLIC TIM2_SetAutoreload
        PUBLIC TIM2_SetCompare1
        PUBLIC TIM2_SetCompare2
        PUBLIC TIM2_SetCompare3
        PUBLIC TIM2_SetCounter
        PUBLIC TIM2_SetIC1Prescaler
        PUBLIC TIM2_SetIC2Prescaler
        PUBLIC TIM2_SetIC3Prescaler
        PUBLIC TIM2_TimeBaseInit
        PUBLIC TIM2_UpdateDisableConfig
        PUBLIC TIM2_UpdateRequestConfig

// C:\Users\lun55\Desktop\J19B_STM8\Lib\stm8s_tim2.c
//    1 /**
//    2   ******************************************************************************
//    3   * @file    stm8s_tim2.c
//    4   * @author  MCD Application Team
//    5   * @version V2.2.0
//    6   * @date    30-September-2014
//    7   * @brief   This file contains all the functions for the TIM2 peripheral.
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
//   29 #include "stm8s_tim2.h"
//   30 
//   31 /** @addtogroup STM8S_StdPeriph_Driver
//   32   * @{
//   33   */
//   34 /* Private typedef -----------------------------------------------------------*/
//   35 /* Private define ------------------------------------------------------------*/
//   36 /* Private macro -------------------------------------------------------------*/
//   37 /* Private variables ---------------------------------------------------------*/
//   38 /* Private function prototypes -----------------------------------------------*/
//   39 static void TI1_Config(uint8_t TIM2_ICPolarity, uint8_t TIM2_ICSelection, uint8_t TIM2_ICFilter);
//   40 static void TI2_Config(uint8_t TIM2_ICPolarity, uint8_t TIM2_ICSelection, uint8_t TIM2_ICFilter);
//   41 static void TI3_Config(uint8_t TIM2_ICPolarity, uint8_t TIM2_ICSelection, uint8_t TIM2_ICFilter);
//   42 /**
//   43   * @addtogroup TIM2_Public_Functions
//   44   * @{
//   45   */
//   46 
//   47 /**
//   48   * @brief  Deinitializes the TIM2 peripheral registers to their default reset values.
//   49   * @param  None
//   50   * @retval None
//   51   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//   52 void TIM2_DeInit(void)
//   53 {
//   54   TIM2->CR1 = (uint8_t)TIM2_CR1_RESET_VALUE;
TIM2_DeInit:
        MOV       L:0x5300, #0x0
//   55   TIM2->IER = (uint8_t)TIM2_IER_RESET_VALUE;
        MOV       L:0x5303, #0x0
//   56   TIM2->SR2 = (uint8_t)TIM2_SR2_RESET_VALUE;
        MOV       L:0x5305, #0x0
//   57   
//   58   /* Disable channels */
//   59   TIM2->CCER1 = (uint8_t)TIM2_CCER1_RESET_VALUE;
        MOV       L:0x530a, #0x0
//   60   TIM2->CCER2 = (uint8_t)TIM2_CCER2_RESET_VALUE;
        MOV       L:0x530b, #0x0
//   61   
//   62   
//   63   /* Then reset channel registers: it also works if lock level is equal to 2 or 3 */
//   64   TIM2->CCER1 = (uint8_t)TIM2_CCER1_RESET_VALUE;
        MOV       L:0x530a, #0x0
//   65   TIM2->CCER2 = (uint8_t)TIM2_CCER2_RESET_VALUE;
        MOV       L:0x530b, #0x0
//   66   TIM2->CCMR1 = (uint8_t)TIM2_CCMR1_RESET_VALUE;
        MOV       L:0x5307, #0x0
//   67   TIM2->CCMR2 = (uint8_t)TIM2_CCMR2_RESET_VALUE;
        MOV       L:0x5308, #0x0
//   68   TIM2->CCMR3 = (uint8_t)TIM2_CCMR3_RESET_VALUE;
        MOV       L:0x5309, #0x0
//   69   TIM2->CNTRH = (uint8_t)TIM2_CNTRH_RESET_VALUE;
        MOV       L:0x530c, #0x0
//   70   TIM2->CNTRL = (uint8_t)TIM2_CNTRL_RESET_VALUE;
        MOV       L:0x530d, #0x0
//   71   TIM2->PSCR = (uint8_t)TIM2_PSCR_RESET_VALUE;
        MOV       L:0x530e, #0x0
//   72   TIM2->ARRH  = (uint8_t)TIM2_ARRH_RESET_VALUE;
        MOV       L:0x530f, #0xff
//   73   TIM2->ARRL  = (uint8_t)TIM2_ARRL_RESET_VALUE;
        MOV       L:0x5310, #0xff
//   74   TIM2->CCR1H = (uint8_t)TIM2_CCR1H_RESET_VALUE;
        MOV       L:0x5311, #0x0
//   75   TIM2->CCR1L = (uint8_t)TIM2_CCR1L_RESET_VALUE;
        MOV       L:0x5312, #0x0
//   76   TIM2->CCR2H = (uint8_t)TIM2_CCR2H_RESET_VALUE;
        MOV       L:0x5313, #0x0
//   77   TIM2->CCR2L = (uint8_t)TIM2_CCR2L_RESET_VALUE;
        MOV       L:0x5314, #0x0
//   78   TIM2->CCR3H = (uint8_t)TIM2_CCR3H_RESET_VALUE;
        MOV       L:0x5315, #0x0
//   79   TIM2->CCR3L = (uint8_t)TIM2_CCR3L_RESET_VALUE;
        MOV       L:0x5316, #0x0
//   80   TIM2->SR1 = (uint8_t)TIM2_SR1_RESET_VALUE;
        MOV       L:0x5304, #0x0
//   81 }
        RET
//   82 
//   83 /**
//   84   * @brief  Initializes the TIM2 Time Base Unit according to the specified parameters.
//   85   * @param    TIM2_Prescaler specifies the Prescaler from TIM2_Prescaler_TypeDef.
//   86   * @param    TIM2_Period specifies the Period value.
//   87   * @retval None
//   88   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//   89 void TIM2_TimeBaseInit( TIM2_Prescaler_TypeDef TIM2_Prescaler,
//   90                         uint16_t TIM2_Period)
//   91 {
TIM2_TimeBaseInit:
        LDW       Y, X
//   92   /* Set the Prescaler value */
//   93   TIM2->PSCR = (uint8_t)(TIM2_Prescaler);
        LD        L:0x530e, A
//   94   /* Set the Autoreload value */
//   95   TIM2->ARRH = (uint8_t)(TIM2_Period >> 8);
        LDW       X, Y
        CLR       A
        RRWA      X, A
        LD        A, XL
        LD        L:0x530f, A
//   96   TIM2->ARRL = (uint8_t)(TIM2_Period);
        LD        A, YL
        LD        L:0x5310, A
//   97 }
        RET
//   98 
//   99 
//  100 /**
//  101   * @brief  Initializes the TIM2 Channel1 according to the specified parameters.
//  102   * @param   TIM2_OCMode specifies the Output Compare mode  from @ref TIM2_OCMode_TypeDef.
//  103   * @param   TIM2_OutputState specifies the Output State  from @ref TIM2_OutputState_TypeDef.
//  104   * @param   TIM2_Pulse specifies the Pulse width  value.
//  105   * @param   TIM2_OCPolarity specifies the Output Compare Polarity  from @ref TIM2_OCPolarity_TypeDef.
//  106   * @retval None
//  107   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  108 void TIM2_OC1Init(TIM2_OCMode_TypeDef TIM2_OCMode,
//  109                   TIM2_OutputState_TypeDef TIM2_OutputState,
//  110                   uint16_t TIM2_Pulse,
//  111                   TIM2_OCPolarity_TypeDef TIM2_OCPolarity)
//  112 {
TIM2_OC1Init:
        CALL      L:?push_w4
        CALL      L:?push_w6
        PUSH      S:?b10
        LD        S:?b8, A
        MOV       S:?b9, S:?b0
        LDW       S:?w6, X
        MOV       S:?b10, S:?b1
//  113   /* Check the parameters */
//  114   assert_param(IS_TIM2_OC_MODE_OK(TIM2_OCMode));
        TNZ       S:?b8
        JREQ      L:??TIM2_OC1Init_0
        LD        A, S:?b8
        CP        A, #0x10
        JREQ      L:??TIM2_OC1Init_0
        LD        A, S:?b8
        CP        A, #0x20
        JREQ      L:??TIM2_OC1Init_0
        LD        A, S:?b8
        CP        A, #0x30
        JREQ      L:??TIM2_OC1Init_0
        LD        A, S:?b8
        CP        A, #0x60
        JREQ      L:??TIM2_OC1Init_0
        LD        A, S:?b8
        CP        A, #0x70
        JREQ      L:??TIM2_OC1Init_0
        LDW       X, #0x72
        LDW       S:?w1, X
        CLRW      X
        LDW       S:?w0, X
        LDW       X, #`?<Constant "C:\\\\Users\\\\lun55\\\\Deskto...">`
        CALL      L:assert_failed
//  115   assert_param(IS_TIM2_OUTPUT_STATE_OK(TIM2_OutputState));
??TIM2_OC1Init_0:
        TNZ       S:?b9
        JREQ      L:??TIM2_OC1Init_1
        LD        A, S:?b9
        CP        A, #0x11
        JREQ      L:??TIM2_OC1Init_1
        LDW       X, #0x73
        LDW       S:?w1, X
        CLRW      X
        LDW       S:?w0, X
        LDW       X, #`?<Constant "C:\\\\Users\\\\lun55\\\\Deskto...">`
        CALL      L:assert_failed
//  116   assert_param(IS_TIM2_OC_POLARITY_OK(TIM2_OCPolarity));
??TIM2_OC1Init_1:
        TNZ       S:?b10
        JREQ      L:??TIM2_OC1Init_2
        LD        A, S:?b10
        CP        A, #0x22
        JREQ      L:??TIM2_OC1Init_2
        LDW       X, #0x74
        LDW       S:?w1, X
        CLRW      X
        LDW       S:?w0, X
        LDW       X, #`?<Constant "C:\\\\Users\\\\lun55\\\\Deskto...">`
        CALL      L:assert_failed
//  117   
//  118   /* Disable the Channel 1: Reset the CCE Bit, Set the Output State , the Output Polarity */
//  119   TIM2->CCER1 &= (uint8_t)(~( TIM2_CCER1_CC1E | TIM2_CCER1_CC1P));
??TIM2_OC1Init_2:
        LD        A, L:0x530a
        AND       A, #0xfc
        LD        L:0x530a, A
//  120   /* Set the Output State &  Set the Output Polarity  */
//  121   TIM2->CCER1 |= (uint8_t)((uint8_t)(TIM2_OutputState & TIM2_CCER1_CC1E ) | 
//  122                            (uint8_t)(TIM2_OCPolarity & TIM2_CCER1_CC1P));
        LD        A, S:?b10
        AND       A, #0x2
        PUSH      A
        LD        A, S:?b9
        AND       A, #0x1
        LD        S:?b1, A
        POP       A
        OR        A, S:?b1
        OR        A, L:0x530a
        LD        L:0x530a, A
//  123   
//  124   /* Reset the Output Compare Bits  & Set the Ouput Compare Mode */
//  125   TIM2->CCMR1 = (uint8_t)((uint8_t)(TIM2->CCMR1 & (uint8_t)(~TIM2_CCMR_OCM)) |
//  126                           (uint8_t)TIM2_OCMode);
        LD        A, L:0x5307
        AND       A, #0x8f
        OR        A, S:?b8
        LD        L:0x5307, A
//  127   
//  128   /* Set the Pulse value */
//  129   TIM2->CCR1H = (uint8_t)(TIM2_Pulse >> 8);
        LDW       X, S:?w6
        CLR       A
        RRWA      X, A
        LD        A, XL
        LD        L:0x5311, A
//  130   TIM2->CCR1L = (uint8_t)(TIM2_Pulse);
        LD        A, S:?b13
        LD        L:0x5312, A
//  131 }
        POP       S:?b10
        CALL      L:?pop_w6
        JP        L:?epilogue_w4
//  132 
//  133 
//  134 /**
//  135   * @brief  Initializes the TIM2 Channel2 according to the specified parameters.
//  136   * @param   TIM2_OCMode specifies the Output Compare mode  from @ref TIM2_OCMode_TypeDef.
//  137   * @param   TIM2_OutputState specifies the Output State  from @ref TIM2_OutputState_TypeDef.
//  138   * @param   TIM2_Pulse specifies the Pulse width  value.
//  139   * @param   TIM2_OCPolarity specifies the Output Compare Polarity  from @ref TIM2_OCPolarity_TypeDef.
//  140   * @retval None
//  141   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  142 void TIM2_OC2Init(TIM2_OCMode_TypeDef TIM2_OCMode,
//  143                   TIM2_OutputState_TypeDef TIM2_OutputState,
//  144                   uint16_t TIM2_Pulse,
//  145                   TIM2_OCPolarity_TypeDef TIM2_OCPolarity)
//  146 {
TIM2_OC2Init:
        CALL      L:?push_w4
        CALL      L:?push_w6
        PUSH      S:?b10
        LD        S:?b8, A
        MOV       S:?b9, S:?b0
        LDW       S:?w6, X
        MOV       S:?b10, S:?b1
//  147   /* Check the parameters */
//  148   assert_param(IS_TIM2_OC_MODE_OK(TIM2_OCMode));
        TNZ       S:?b8
        JREQ      L:??TIM2_OC2Init_0
        LD        A, S:?b8
        CP        A, #0x10
        JREQ      L:??TIM2_OC2Init_0
        LD        A, S:?b8
        CP        A, #0x20
        JREQ      L:??TIM2_OC2Init_0
        LD        A, S:?b8
        CP        A, #0x30
        JREQ      L:??TIM2_OC2Init_0
        LD        A, S:?b8
        CP        A, #0x60
        JREQ      L:??TIM2_OC2Init_0
        LD        A, S:?b8
        CP        A, #0x70
        JREQ      L:??TIM2_OC2Init_0
        LDW       X, #0x94
        LDW       S:?w1, X
        CLRW      X
        LDW       S:?w0, X
        LDW       X, #`?<Constant "C:\\\\Users\\\\lun55\\\\Deskto...">`
        CALL      L:assert_failed
//  149   assert_param(IS_TIM2_OUTPUT_STATE_OK(TIM2_OutputState));
??TIM2_OC2Init_0:
        TNZ       S:?b9
        JREQ      L:??TIM2_OC2Init_1
        LD        A, S:?b9
        CP        A, #0x11
        JREQ      L:??TIM2_OC2Init_1
        LDW       X, #0x95
        LDW       S:?w1, X
        CLRW      X
        LDW       S:?w0, X
        LDW       X, #`?<Constant "C:\\\\Users\\\\lun55\\\\Deskto...">`
        CALL      L:assert_failed
//  150   assert_param(IS_TIM2_OC_POLARITY_OK(TIM2_OCPolarity));
??TIM2_OC2Init_1:
        TNZ       S:?b10
        JREQ      L:??TIM2_OC2Init_2
        LD        A, S:?b10
        CP        A, #0x22
        JREQ      L:??TIM2_OC2Init_2
        LDW       X, #0x96
        LDW       S:?w1, X
        CLRW      X
        LDW       S:?w0, X
        LDW       X, #`?<Constant "C:\\\\Users\\\\lun55\\\\Deskto...">`
        CALL      L:assert_failed
//  151   
//  152   
//  153   /* Disable the Channel 1: Reset the CCE Bit, Set the Output State, the Output Polarity */
//  154   TIM2->CCER1 &= (uint8_t)(~( TIM2_CCER1_CC2E |  TIM2_CCER1_CC2P ));
??TIM2_OC2Init_2:
        LD        A, L:0x530a
        AND       A, #0xcf
        LD        L:0x530a, A
//  155   /* Set the Output State & Set the Output Polarity */
//  156   TIM2->CCER1 |= (uint8_t)((uint8_t)(TIM2_OutputState  & TIM2_CCER1_CC2E ) |
//  157                            (uint8_t)(TIM2_OCPolarity & TIM2_CCER1_CC2P));
        LD        A, S:?b10
        AND       A, #0x20
        PUSH      A
        LD        A, S:?b9
        AND       A, #0x10
        LD        S:?b1, A
        POP       A
        OR        A, S:?b1
        OR        A, L:0x530a
        LD        L:0x530a, A
//  158   
//  159   
//  160   /* Reset the Output Compare Bits & Set the Output Compare Mode */
//  161   TIM2->CCMR2 = (uint8_t)((uint8_t)(TIM2->CCMR2 & (uint8_t)(~TIM2_CCMR_OCM)) | 
//  162                           (uint8_t)TIM2_OCMode);
        LD        A, L:0x5308
        AND       A, #0x8f
        OR        A, S:?b8
        LD        L:0x5308, A
//  163   
//  164   
//  165   /* Set the Pulse value */
//  166   TIM2->CCR2H = (uint8_t)(TIM2_Pulse >> 8);
        LDW       X, S:?w6
        CLR       A
        RRWA      X, A
        LD        A, XL
        LD        L:0x5313, A
//  167   TIM2->CCR2L = (uint8_t)(TIM2_Pulse);
        LD        A, S:?b13
        LD        L:0x5314, A
//  168 }
        POP       S:?b10
        CALL      L:?pop_w6
        JP        L:?epilogue_w4
//  169 
//  170 
//  171 /**
//  172   * @brief  Initializes the TIM2 Channel3 according to the specified parameters.
//  173   * @param   TIM2_OCMode specifies the Output Compare mode from @ref TIM2_OCMode_TypeDef.
//  174   * @param   TIM2_OutputState specifies the Output State from @ref TIM2_OutputState_TypeDef.
//  175   * @param   TIM2_Pulse specifies the Pulse width value.
//  176   * @param   TIM2_OCPolarity specifies the Output Compare Polarity  from @ref TIM2_OCPolarity_TypeDef.
//  177   * @retval None
//  178   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  179 void TIM2_OC3Init(TIM2_OCMode_TypeDef TIM2_OCMode,
//  180                   TIM2_OutputState_TypeDef TIM2_OutputState,
//  181                   uint16_t TIM2_Pulse,
//  182                   TIM2_OCPolarity_TypeDef TIM2_OCPolarity)
//  183 {
TIM2_OC3Init:
        CALL      L:?push_w4
        CALL      L:?push_w6
        PUSH      S:?b10
        LD        S:?b8, A
        MOV       S:?b9, S:?b0
        LDW       S:?w6, X
        MOV       S:?b10, S:?b1
//  184   /* Check the parameters */
//  185   assert_param(IS_TIM2_OC_MODE_OK(TIM2_OCMode));
        TNZ       S:?b8
        JREQ      L:??TIM2_OC3Init_0
        LD        A, S:?b8
        CP        A, #0x10
        JREQ      L:??TIM2_OC3Init_0
        LD        A, S:?b8
        CP        A, #0x20
        JREQ      L:??TIM2_OC3Init_0
        LD        A, S:?b8
        CP        A, #0x30
        JREQ      L:??TIM2_OC3Init_0
        LD        A, S:?b8
        CP        A, #0x60
        JREQ      L:??TIM2_OC3Init_0
        LD        A, S:?b8
        CP        A, #0x70
        JREQ      L:??TIM2_OC3Init_0
        LDW       X, #0xb9
        LDW       S:?w1, X
        CLRW      X
        LDW       S:?w0, X
        LDW       X, #`?<Constant "C:\\\\Users\\\\lun55\\\\Deskto...">`
        CALL      L:assert_failed
//  186   assert_param(IS_TIM2_OUTPUT_STATE_OK(TIM2_OutputState));
??TIM2_OC3Init_0:
        TNZ       S:?b9
        JREQ      L:??TIM2_OC3Init_1
        LD        A, S:?b9
        CP        A, #0x11
        JREQ      L:??TIM2_OC3Init_1
        LDW       X, #0xba
        LDW       S:?w1, X
        CLRW      X
        LDW       S:?w0, X
        LDW       X, #`?<Constant "C:\\\\Users\\\\lun55\\\\Deskto...">`
        CALL      L:assert_failed
//  187   assert_param(IS_TIM2_OC_POLARITY_OK(TIM2_OCPolarity));
??TIM2_OC3Init_1:
        TNZ       S:?b10
        JREQ      L:??TIM2_OC3Init_2
        LD        A, S:?b10
        CP        A, #0x22
        JREQ      L:??TIM2_OC3Init_2
        LDW       X, #0xbb
        LDW       S:?w1, X
        CLRW      X
        LDW       S:?w0, X
        LDW       X, #`?<Constant "C:\\\\Users\\\\lun55\\\\Deskto...">`
        CALL      L:assert_failed
//  188   /* Disable the Channel 1: Reset the CCE Bit, Set the Output State, the Output Polarity */
//  189   TIM2->CCER2 &= (uint8_t)(~( TIM2_CCER2_CC3E  | TIM2_CCER2_CC3P));
??TIM2_OC3Init_2:
        LD        A, L:0x530b
        AND       A, #0xfc
        LD        L:0x530b, A
//  190   /* Set the Output State & Set the Output Polarity */
//  191   TIM2->CCER2 |= (uint8_t)((uint8_t)(TIM2_OutputState & TIM2_CCER2_CC3E) |  
//  192                            (uint8_t)(TIM2_OCPolarity & TIM2_CCER2_CC3P));
        LD        A, S:?b10
        AND       A, #0x2
        PUSH      A
        LD        A, S:?b9
        AND       A, #0x1
        LD        S:?b1, A
        POP       A
        OR        A, S:?b1
        OR        A, L:0x530b
        LD        L:0x530b, A
//  193   
//  194   /* Reset the Output Compare Bits & Set the Output Compare Mode */
//  195   TIM2->CCMR3 = (uint8_t)((uint8_t)(TIM2->CCMR3 & (uint8_t)(~TIM2_CCMR_OCM)) |
//  196                           (uint8_t)TIM2_OCMode);
        LD        A, L:0x5309
        AND       A, #0x8f
        OR        A, S:?b8
        LD        L:0x5309, A
//  197   
//  198   /* Set the Pulse value */
//  199   TIM2->CCR3H = (uint8_t)(TIM2_Pulse >> 8);
        LDW       X, S:?w6
        CLR       A
        RRWA      X, A
        LD        A, XL
        LD        L:0x5315, A
//  200   TIM2->CCR3L = (uint8_t)(TIM2_Pulse);
        LD        A, S:?b13
        LD        L:0x5316, A
//  201 }
        POP       S:?b10
        CALL      L:?pop_w6
        JP        L:?epilogue_w4
//  202 
//  203 /**
//  204   * @brief  Initializes the TIM2 peripheral according to the specified parameters.
//  205   * @param    TIM2_Channel specifies the Input Capture Channel from @ref TIM2_Channel_TypeDef.
//  206   * @param   TIM2_ICPolarity specifies the Input Capture Polarity from @ref TIM2_ICPolarity_TypeDef.
//  207   * @param   TIM2_ICSelection specifies the Input Capture Selection from @ref TIM2_ICSelection_TypeDef.
//  208   * @param   TIM2_ICPrescaler specifies the Input Capture Prescaler from @ref TIM2_ICPSC_TypeDef.
//  209   * @param   TIM2_ICFilter specifies the Input Capture Filter value (value can be an integer from 0x00 to 0x0F).
//  210   * @retval None
//  211   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  212 void TIM2_ICInit(TIM2_Channel_TypeDef TIM2_Channel,
//  213                  TIM2_ICPolarity_TypeDef TIM2_ICPolarity,
//  214                  TIM2_ICSelection_TypeDef TIM2_ICSelection,
//  215                  TIM2_ICPSC_TypeDef TIM2_ICPrescaler,
//  216                  uint8_t TIM2_ICFilter)
//  217 {
TIM2_ICInit:
        CALL      L:?push_l2
        PUSH      S:?b12
        LD        S:?b12, A
        MOV       S:?b8, S:?b0
        MOV       S:?b9, S:?b1
        MOV       S:?b10, S:?b2
        MOV       S:?b11, S:?b3
//  218   /* Check the parameters */
//  219   assert_param(IS_TIM2_CHANNEL_OK(TIM2_Channel));
        TNZ       S:?b12
        JREQ      L:??TIM2_ICInit_0
        LD        A, S:?b12
        CP        A, #0x1
        JREQ      L:??TIM2_ICInit_0
        LD        A, S:?b12
        CP        A, #0x2
        JREQ      L:??TIM2_ICInit_0
        LDW       X, #0xdb
        LDW       S:?w1, X
        CLRW      X
        LDW       S:?w0, X
        LDW       X, #`?<Constant "C:\\\\Users\\\\lun55\\\\Deskto...">`
        CALL      L:assert_failed
//  220   assert_param(IS_TIM2_IC_POLARITY_OK(TIM2_ICPolarity));
??TIM2_ICInit_0:
        TNZ       S:?b8
        JREQ      L:??TIM2_ICInit_1
        LD        A, S:?b8
        CP        A, #0x44
        JREQ      L:??TIM2_ICInit_1
        LDW       X, #0xdc
        LDW       S:?w1, X
        CLRW      X
        LDW       S:?w0, X
        LDW       X, #`?<Constant "C:\\\\Users\\\\lun55\\\\Deskto...">`
        CALL      L:assert_failed
//  221   assert_param(IS_TIM2_IC_SELECTION_OK(TIM2_ICSelection));
??TIM2_ICInit_1:
        LD        A, S:?b9
        CP        A, #0x1
        JREQ      L:??TIM2_ICInit_2
        LD        A, S:?b9
        CP        A, #0x2
        JREQ      L:??TIM2_ICInit_2
        LD        A, S:?b9
        CP        A, #0x3
        JREQ      L:??TIM2_ICInit_2
        LDW       X, #0xdd
        LDW       S:?w1, X
        CLRW      X
        LDW       S:?w0, X
        LDW       X, #`?<Constant "C:\\\\Users\\\\lun55\\\\Deskto...">`
        CALL      L:assert_failed
//  222   assert_param(IS_TIM2_IC_PRESCALER_OK(TIM2_ICPrescaler));
??TIM2_ICInit_2:
        TNZ       S:?b10
        JREQ      L:??TIM2_ICInit_3
        LD        A, S:?b10
        CP        A, #0x4
        JREQ      L:??TIM2_ICInit_3
        LD        A, S:?b10
        CP        A, #0x8
        JREQ      L:??TIM2_ICInit_3
        LD        A, S:?b10
        CP        A, #0xc
        JREQ      L:??TIM2_ICInit_3
        LDW       X, #0xde
        LDW       S:?w1, X
        CLRW      X
        LDW       S:?w0, X
        LDW       X, #`?<Constant "C:\\\\Users\\\\lun55\\\\Deskto...">`
        CALL      L:assert_failed
//  223   assert_param(IS_TIM2_IC_FILTER_OK(TIM2_ICFilter));
??TIM2_ICInit_3:
        LD        A, S:?b11
        CP        A, #0x10
        JRC       L:??TIM2_ICInit_4
        LDW       X, #0xdf
        LDW       S:?w1, X
        CLRW      X
        LDW       S:?w0, X
        LDW       X, #`?<Constant "C:\\\\Users\\\\lun55\\\\Deskto...">`
        CALL      L:assert_failed
//  224   
//  225   if (TIM2_Channel == TIM2_CHANNEL_1)
??TIM2_ICInit_4:
        TNZ       S:?b12
        JRNE      L:??TIM2_ICInit_5
//  226   {
//  227     /* TI1 Configuration */
//  228     TI1_Config((uint8_t)TIM2_ICPolarity,
//  229                (uint8_t)TIM2_ICSelection,
//  230                (uint8_t)TIM2_ICFilter);
        MOV       S:?b1, S:?b11
        MOV       S:?b0, S:?b9
        LD        A, S:?b8
        CALL      L:TI1_Config
//  231     
//  232     /* Set the Input Capture Prescaler value */
//  233     TIM2_SetIC1Prescaler(TIM2_ICPrescaler);
        LD        A, S:?b10
        CALL      L:TIM2_SetIC1Prescaler
        JRA       L:??TIM2_ICInit_6
//  234   }
//  235   else if (TIM2_Channel == TIM2_CHANNEL_2)
??TIM2_ICInit_5:
        LD        A, S:?b12
        CP        A, #0x1
        JRNE      L:??TIM2_ICInit_7
//  236   {
//  237     /* TI2 Configuration */
//  238     TI2_Config((uint8_t)TIM2_ICPolarity,
//  239                (uint8_t)TIM2_ICSelection,
//  240                (uint8_t)TIM2_ICFilter);
        MOV       S:?b1, S:?b11
        MOV       S:?b0, S:?b9
        LD        A, S:?b8
        CALL      L:TI2_Config
//  241     
//  242     /* Set the Input Capture Prescaler value */
//  243     TIM2_SetIC2Prescaler(TIM2_ICPrescaler);
        LD        A, S:?b10
        CALL      L:TIM2_SetIC2Prescaler
        JRA       L:??TIM2_ICInit_6
//  244   }
//  245   else
//  246   {
//  247     /* TI3 Configuration */
//  248     TI3_Config((uint8_t)TIM2_ICPolarity,
//  249                (uint8_t)TIM2_ICSelection,
//  250                (uint8_t)TIM2_ICFilter);
??TIM2_ICInit_7:
        MOV       S:?b1, S:?b11
        MOV       S:?b0, S:?b9
        LD        A, S:?b8
        CALL      L:TI3_Config
//  251     
//  252     /* Set the Input Capture Prescaler value */
//  253     TIM2_SetIC3Prescaler(TIM2_ICPrescaler);
        LD        A, S:?b10
        CALL      L:TIM2_SetIC3Prescaler
//  254   }
//  255 }
??TIM2_ICInit_6:
        POP       S:?b12
        JP        L:?epilogue_l2
//  256 
//  257 /**
//  258   * @brief  Configures the TIM2 peripheral in PWM Input Mode according to the specified parameters.
//  259     * @param    TIM2_Channel specifies the Input Capture Channel from @ref TIM2_Channel_TypeDef.
//  260   * @param   TIM2_ICPolarity specifies the Input Capture Polarity from @ref TIM2_ICPolarity_TypeDef.
//  261   * @param   TIM2_ICSelection specifies the Input Capture Selection from @ref TIM2_ICSelection_TypeDef.
//  262   * @param   TIM2_ICPrescaler specifies the Input Capture Prescaler from @ref TIM2_ICPSC_TypeDef.
//  263   * @param   TIM2_ICFilter specifies the Input Capture Filter value (value can be an integer from 0x00 to 0x0F).
//  264   * @retval None
//  265   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  266 void TIM2_PWMIConfig(TIM2_Channel_TypeDef TIM2_Channel,
//  267                      TIM2_ICPolarity_TypeDef TIM2_ICPolarity,
//  268                      TIM2_ICSelection_TypeDef TIM2_ICSelection,
//  269                      TIM2_ICPSC_TypeDef TIM2_ICPrescaler,
//  270                      uint8_t TIM2_ICFilter)
//  271 {
TIM2_PWMIConfig:
        CALL      L:?push_l2
        CALL      L:?push_w6
        PUSH      S:?b14
        LD        S:?b12, A
        MOV       S:?b8, S:?b0
        MOV       S:?b9, S:?b1
        MOV       S:?b10, S:?b2
        MOV       S:?b11, S:?b3
//  272   uint8_t icpolarity = (uint8_t)TIM2_ICPOLARITY_RISING;
        CLR       S:?b14
//  273   uint8_t icselection = (uint8_t)TIM2_ICSELECTION_DIRECTTI;
        MOV       S:?b13, #0x1
//  274   
//  275   /* Check the parameters */
//  276   assert_param(IS_TIM2_PWMI_CHANNEL_OK(TIM2_Channel));
        TNZ       S:?b12
        JREQ      L:??TIM2_PWMIConfig_0
        LD        A, S:?b12
        CP        A, #0x1
        JREQ      L:??TIM2_PWMIConfig_0
        LDW       X, #0x114
        LDW       S:?w1, X
        CLRW      X
        LDW       S:?w0, X
        LDW       X, #`?<Constant "C:\\\\Users\\\\lun55\\\\Deskto...">`
        CALL      L:assert_failed
//  277   assert_param(IS_TIM2_IC_POLARITY_OK(TIM2_ICPolarity));
??TIM2_PWMIConfig_0:
        TNZ       S:?b8
        JREQ      L:??TIM2_PWMIConfig_1
        LD        A, S:?b8
        CP        A, #0x44
        JREQ      L:??TIM2_PWMIConfig_1
        LDW       X, #0x115
        LDW       S:?w1, X
        CLRW      X
        LDW       S:?w0, X
        LDW       X, #`?<Constant "C:\\\\Users\\\\lun55\\\\Deskto...">`
        CALL      L:assert_failed
//  278   assert_param(IS_TIM2_IC_SELECTION_OK(TIM2_ICSelection));
??TIM2_PWMIConfig_1:
        LD        A, S:?b9
        CP        A, #0x1
        JREQ      L:??TIM2_PWMIConfig_2
        LD        A, S:?b9
        CP        A, #0x2
        JREQ      L:??TIM2_PWMIConfig_2
        LD        A, S:?b9
        CP        A, #0x3
        JREQ      L:??TIM2_PWMIConfig_2
        LDW       X, #0x116
        LDW       S:?w1, X
        CLRW      X
        LDW       S:?w0, X
        LDW       X, #`?<Constant "C:\\\\Users\\\\lun55\\\\Deskto...">`
        CALL      L:assert_failed
//  279   assert_param(IS_TIM2_IC_PRESCALER_OK(TIM2_ICPrescaler));
??TIM2_PWMIConfig_2:
        TNZ       S:?b10
        JREQ      L:??TIM2_PWMIConfig_3
        LD        A, S:?b10
        CP        A, #0x4
        JREQ      L:??TIM2_PWMIConfig_3
        LD        A, S:?b10
        CP        A, #0x8
        JREQ      L:??TIM2_PWMIConfig_3
        LD        A, S:?b10
        CP        A, #0xc
        JREQ      L:??TIM2_PWMIConfig_3
        LDW       X, #0x117
        LDW       S:?w1, X
        CLRW      X
        LDW       S:?w0, X
        LDW       X, #`?<Constant "C:\\\\Users\\\\lun55\\\\Deskto...">`
        CALL      L:assert_failed
//  280   
//  281   /* Select the Opposite Input Polarity */
//  282   if (TIM2_ICPolarity != TIM2_ICPOLARITY_FALLING)
??TIM2_PWMIConfig_3:
        LD        A, S:?b8
        CP        A, #0x44
        JREQ      L:??TIM2_PWMIConfig_4
//  283   {
//  284     icpolarity = (uint8_t)TIM2_ICPOLARITY_FALLING;
        MOV       S:?b14, #0x44
        JRA       L:??TIM2_PWMIConfig_5
//  285   }
//  286   else
//  287   {
//  288     icpolarity = (uint8_t)TIM2_ICPOLARITY_RISING;
??TIM2_PWMIConfig_4:
        CLR       S:?b14
//  289   }
//  290   
//  291   /* Select the Opposite Input */
//  292   if (TIM2_ICSelection == TIM2_ICSELECTION_DIRECTTI)
??TIM2_PWMIConfig_5:
        LD        A, S:?b9
        CP        A, #0x1
        JRNE      L:??TIM2_PWMIConfig_6
//  293   {
//  294     icselection = (uint8_t)TIM2_ICSELECTION_INDIRECTTI;
        MOV       S:?b13, #0x2
        JRA       L:??TIM2_PWMIConfig_7
//  295   }
//  296   else
//  297   {
//  298     icselection = (uint8_t)TIM2_ICSELECTION_DIRECTTI;
??TIM2_PWMIConfig_6:
        MOV       S:?b13, #0x1
//  299   }
//  300   
//  301   if (TIM2_Channel == TIM2_CHANNEL_1)
??TIM2_PWMIConfig_7:
        TNZ       S:?b12
        JRNE      L:??TIM2_PWMIConfig_8
//  302   {
//  303     /* TI1 Configuration */
//  304     TI1_Config((uint8_t)TIM2_ICPolarity, (uint8_t)TIM2_ICSelection,
//  305                (uint8_t)TIM2_ICFilter);
        MOV       S:?b1, S:?b11
        MOV       S:?b0, S:?b9
        LD        A, S:?b8
        CALL      L:TI1_Config
//  306     
//  307     /* Set the Input Capture Prescaler value */
//  308     TIM2_SetIC1Prescaler(TIM2_ICPrescaler);
        LD        A, S:?b10
        CALL      L:TIM2_SetIC1Prescaler
//  309     
//  310     /* TI2 Configuration */
//  311     TI2_Config(icpolarity, icselection, TIM2_ICFilter);
        MOV       S:?b1, S:?b11
        MOV       S:?b0, S:?b13
        LD        A, S:?b14
        CALL      L:TI2_Config
//  312     
//  313     /* Set the Input Capture Prescaler value */
//  314     TIM2_SetIC2Prescaler(TIM2_ICPrescaler);
        LD        A, S:?b10
        CALL      L:TIM2_SetIC2Prescaler
        JRA       L:??TIM2_PWMIConfig_9
//  315   }
//  316   else
//  317   {
//  318     /* TI2 Configuration */
//  319     TI2_Config((uint8_t)TIM2_ICPolarity, (uint8_t)TIM2_ICSelection,
//  320                (uint8_t)TIM2_ICFilter);
??TIM2_PWMIConfig_8:
        MOV       S:?b1, S:?b11
        MOV       S:?b0, S:?b9
        LD        A, S:?b8
        CALL      L:TI2_Config
//  321     
//  322     /* Set the Input Capture Prescaler value */
//  323     TIM2_SetIC2Prescaler(TIM2_ICPrescaler);
        LD        A, S:?b10
        CALL      L:TIM2_SetIC2Prescaler
//  324     
//  325     /* TI1 Configuration */
//  326     TI1_Config((uint8_t)icpolarity, icselection, (uint8_t)TIM2_ICFilter);
        MOV       S:?b1, S:?b11
        MOV       S:?b0, S:?b13
        LD        A, S:?b14
        CALL      L:TI1_Config
//  327     
//  328     /* Set the Input Capture Prescaler value */
//  329     TIM2_SetIC1Prescaler(TIM2_ICPrescaler);
        LD        A, S:?b10
        CALL      L:TIM2_SetIC1Prescaler
//  330   }
//  331 }
??TIM2_PWMIConfig_9:
        POP       S:?b14
        JP        L:?epilogue_l2_w6
//  332 
//  333 /**
//  334   * @brief  Enables or disables the TIM2 peripheral.
//  335   * @param   NewState new state of the TIM2 peripheral. This parameter can
//  336   * be ENABLE or DISABLE.
//  337   * @retval None
//  338   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  339 void TIM2_Cmd(FunctionalState NewState)
//  340 {
TIM2_Cmd:
        PUSH      S:?b8
        LD        S:?b8, A
//  341   /* Check the parameters */
//  342   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
        TNZ       S:?b8
        JREQ      L:??TIM2_Cmd_0
        LD        A, S:?b8
        CP        A, #0x1
        JREQ      L:??TIM2_Cmd_0
        LDW       X, #0x156
        LDW       S:?w1, X
        CLRW      X
        LDW       S:?w0, X
        LDW       X, #`?<Constant "C:\\\\Users\\\\lun55\\\\Deskto...">`
        CALL      L:assert_failed
//  343   
//  344   /* set or Reset the CEN Bit */
//  345   if (NewState != DISABLE)
??TIM2_Cmd_0:
        TNZ       S:?b8
        JREQ      L:??TIM2_Cmd_1
//  346   {
//  347     TIM2->CR1 |= (uint8_t)TIM2_CR1_CEN;
        BSET      L:0x5300, #0x0
        JRA       L:??TIM2_Cmd_2
//  348   }
//  349   else
//  350   {
//  351     TIM2->CR1 &= (uint8_t)(~TIM2_CR1_CEN);
??TIM2_Cmd_1:
        BRES      L:0x5300, #0x0
//  352   }
//  353 }
??TIM2_Cmd_2:
        POP       S:?b8
        RET
//  354 
//  355 /**
//  356   * @brief  Enables or disables the specified TIM2 interrupts.
//  357   * @param   NewState new state of the TIM2 peripheral.
//  358   * This parameter can be: ENABLE or DISABLE.
//  359   * @param   TIM2_IT specifies the TIM2 interrupts sources to be enabled or disabled.
//  360   * This parameter can be any combination of the following values:
//  361   *                       - TIM2_IT_UPDATE: TIM2 update Interrupt source
//  362   *                       - TIM2_IT_CC1: TIM2 Capture Compare 1 Interrupt source
//  363   *                       - TIM2_IT_CC2: TIM2 Capture Compare 2 Interrupt source
//  364   *                       - TIM2_IT_CC3: TIM2 Capture Compare 3 Interrupt source
//  365   * @param   NewState new state of the TIM2 peripheral.
//  366   * @retval None
//  367   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  368 void TIM2_ITConfig(TIM2_IT_TypeDef TIM2_IT, FunctionalState NewState)
//  369 {
TIM2_ITConfig:
        CALL      L:?push_w4
        LD        S:?b8, A
        MOV       S:?b9, S:?b0
//  370   /* Check the parameters */
//  371   assert_param(IS_TIM2_IT_OK(TIM2_IT));
        TNZ       S:?b8
        JREQ      L:??TIM2_ITConfig_0
        LD        A, S:?b8
        CP        A, #0x10
        JRC       L:??TIM2_ITConfig_1
??TIM2_ITConfig_0:
        LDW       X, #0x173
        LDW       S:?w1, X
        CLRW      X
        LDW       S:?w0, X
        LDW       X, #`?<Constant "C:\\\\Users\\\\lun55\\\\Deskto...">`
        CALL      L:assert_failed
//  372   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
??TIM2_ITConfig_1:
        TNZ       S:?b9
        JREQ      L:??TIM2_ITConfig_2
        LD        A, S:?b9
        CP        A, #0x1
        JREQ      L:??TIM2_ITConfig_2
        LDW       X, #0x174
        LDW       S:?w1, X
        CLRW      X
        LDW       S:?w0, X
        LDW       X, #`?<Constant "C:\\\\Users\\\\lun55\\\\Deskto...">`
        CALL      L:assert_failed
//  373   
//  374   if (NewState != DISABLE)
??TIM2_ITConfig_2:
        TNZ       S:?b9
        JREQ      L:??TIM2_ITConfig_3
//  375   {
//  376     /* Enable the Interrupt sources */
//  377     TIM2->IER |= (uint8_t)TIM2_IT;
        LD        A, S:?b8
        OR        A, L:0x5303
        LD        L:0x5303, A
        JP        L:?epilogue_w4
//  378   }
//  379   else
//  380   {
//  381     /* Disable the Interrupt sources */
//  382     TIM2->IER &= (uint8_t)(~TIM2_IT);
??TIM2_ITConfig_3:
        CPL       S:?b8
        LD        A, S:?b8
        AND       A, L:0x5303
        LD        L:0x5303, A
//  383   }
//  384 }
        JP        L:?epilogue_w4
//  385 
//  386 /**
//  387   * @brief  Enables or Disables the TIM2 Update event.
//  388   * @param   NewState new state of the TIM2 peripheral Preload register. This parameter can
//  389   * be ENABLE or DISABLE.
//  390   * @retval None
//  391   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  392 void TIM2_UpdateDisableConfig(FunctionalState NewState)
//  393 {
TIM2_UpdateDisableConfig:
        PUSH      S:?b8
        LD        S:?b8, A
//  394   /* Check the parameters */
//  395   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
        TNZ       S:?b8
        JREQ      L:??TIM2_UpdateDisableConfig_0
        LD        A, S:?b8
        CP        A, #0x1
        JREQ      L:??TIM2_UpdateDisableConfig_0
        LDW       X, #0x18b
        LDW       S:?w1, X
        CLRW      X
        LDW       S:?w0, X
        LDW       X, #`?<Constant "C:\\\\Users\\\\lun55\\\\Deskto...">`
        CALL      L:assert_failed
//  396   
//  397   /* Set or Reset the UDIS Bit */
//  398   if (NewState != DISABLE)
??TIM2_UpdateDisableConfig_0:
        TNZ       S:?b8
        JREQ      L:??TIM2_UpdateDisableConfig_1
//  399   {
//  400     TIM2->CR1 |= (uint8_t)TIM2_CR1_UDIS;
        BSET      L:0x5300, #0x1
        JRA       L:??TIM2_UpdateDisableConfig_2
//  401   }
//  402   else
//  403   {
//  404     TIM2->CR1 &= (uint8_t)(~TIM2_CR1_UDIS);
??TIM2_UpdateDisableConfig_1:
        BRES      L:0x5300, #0x1
//  405   }
//  406 }
??TIM2_UpdateDisableConfig_2:
        POP       S:?b8
        RET
//  407 
//  408 /**
//  409   * @brief  Selects the TIM2 Update Request Interrupt source.
//  410   * @param   TIM2_UpdateSource specifies the Update source.
//  411   * This parameter can be one of the following values
//  412   *                       - TIM2_UPDATESOURCE_REGULAR
//  413   *                       - TIM2_UPDATESOURCE_GLOBAL
//  414   * @retval None
//  415   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  416 void TIM2_UpdateRequestConfig(TIM2_UpdateSource_TypeDef TIM2_UpdateSource)
//  417 {
TIM2_UpdateRequestConfig:
        PUSH      S:?b8
        LD        S:?b8, A
//  418   /* Check the parameters */
//  419   assert_param(IS_TIM2_UPDATE_SOURCE_OK(TIM2_UpdateSource));
        TNZ       S:?b8
        JREQ      L:??TIM2_UpdateRequestConfig_0
        LD        A, S:?b8
        CP        A, #0x1
        JREQ      L:??TIM2_UpdateRequestConfig_0
        LDW       X, #0x1a3
        LDW       S:?w1, X
        CLRW      X
        LDW       S:?w0, X
        LDW       X, #`?<Constant "C:\\\\Users\\\\lun55\\\\Deskto...">`
        CALL      L:assert_failed
//  420   
//  421   /* Set or Reset the URS Bit */
//  422   if (TIM2_UpdateSource != TIM2_UPDATESOURCE_GLOBAL)
??TIM2_UpdateRequestConfig_0:
        TNZ       S:?b8
        JREQ      L:??TIM2_UpdateRequestConfig_1
//  423   {
//  424     TIM2->CR1 |= (uint8_t)TIM2_CR1_URS;
        BSET      L:0x5300, #0x2
        JRA       L:??TIM2_UpdateRequestConfig_2
//  425   }
//  426   else
//  427   {
//  428     TIM2->CR1 &= (uint8_t)(~TIM2_CR1_URS);
??TIM2_UpdateRequestConfig_1:
        BRES      L:0x5300, #0x2
//  429   }
//  430 }
??TIM2_UpdateRequestConfig_2:
        POP       S:?b8
        RET
//  431 
//  432 /**
//  433   * @brief  Selects the TIM2’s One Pulse Mode.
//  434   * @param   TIM2_OPMode specifies the OPM Mode to be used.
//  435   * This parameter can be one of the following values
//  436   *                    - TIM2_OPMODE_SINGLE
//  437   *                    - TIM2_OPMODE_REPETITIVE
//  438   * @retval None
//  439   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  440 void TIM2_SelectOnePulseMode(TIM2_OPMode_TypeDef TIM2_OPMode)
//  441 {
TIM2_SelectOnePulseMode:
        PUSH      S:?b8
        LD        S:?b8, A
//  442   /* Check the parameters */
//  443   assert_param(IS_TIM2_OPM_MODE_OK(TIM2_OPMode));
        LD        A, S:?b8
        CP        A, #0x1
        JREQ      L:??TIM2_SelectOnePulseMode_0
        TNZ       S:?b8
        JREQ      L:??TIM2_SelectOnePulseMode_0
        LDW       X, #0x1bb
        LDW       S:?w1, X
        CLRW      X
        LDW       S:?w0, X
        LDW       X, #`?<Constant "C:\\\\Users\\\\lun55\\\\Deskto...">`
        CALL      L:assert_failed
//  444   
//  445   /* Set or Reset the OPM Bit */
//  446   if (TIM2_OPMode != TIM2_OPMODE_REPETITIVE)
??TIM2_SelectOnePulseMode_0:
        TNZ       S:?b8
        JREQ      L:??TIM2_SelectOnePulseMode_1
//  447   {
//  448     TIM2->CR1 |= (uint8_t)TIM2_CR1_OPM;
        BSET      L:0x5300, #0x3
        JRA       L:??TIM2_SelectOnePulseMode_2
//  449   }
//  450   else
//  451   {
//  452     TIM2->CR1 &= (uint8_t)(~TIM2_CR1_OPM);
??TIM2_SelectOnePulseMode_1:
        BRES      L:0x5300, #0x3
//  453   }
//  454 }
??TIM2_SelectOnePulseMode_2:
        POP       S:?b8
        RET
//  455 
//  456 /**
//  457   * @brief  Configures the TIM2 Prescaler.
//  458   * @param   Prescaler specifies the Prescaler Register value
//  459   * This parameter can be one of the following values
//  460   *                       -  TIM2_PRESCALER_1
//  461   *                       -  TIM2_PRESCALER_2
//  462   *                       -  TIM2_PRESCALER_4
//  463   *                       -  TIM2_PRESCALER_8
//  464   *                       -  TIM2_PRESCALER_16
//  465   *                       -  TIM2_PRESCALER_32
//  466   *                       -  TIM2_PRESCALER_64
//  467   *                       -  TIM2_PRESCALER_128
//  468   *                       -  TIM2_PRESCALER_256
//  469   *                       -  TIM2_PRESCALER_512
//  470   *                       -  TIM2_PRESCALER_1024
//  471   *                       -  TIM2_PRESCALER_2048
//  472   *                       -  TIM2_PRESCALER_4096
//  473   *                       -  TIM2_PRESCALER_8192
//  474   *                       -  TIM2_PRESCALER_16384
//  475   *                       -  TIM2_PRESCALER_32768
//  476   * @param   TIM2_PSCReloadMode specifies the TIM2 Prescaler Reload mode.
//  477   * This parameter can be one of the following values
//  478   *                       - TIM2_PSCRELOADMODE_IMMEDIATE: The Prescaler is loaded
//  479   *                         immediately.
//  480   *                       - TIM2_PSCRELOADMODE_UPDATE: The Prescaler is loaded at
//  481   *                         the update event.
//  482   * @retval None
//  483   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  484 void TIM2_PrescalerConfig(TIM2_Prescaler_TypeDef Prescaler,
//  485                           TIM2_PSCReloadMode_TypeDef TIM2_PSCReloadMode)
//  486 {
TIM2_PrescalerConfig:
        CALL      L:?push_w4
        LD        S:?b9, A
        MOV       S:?b8, S:?b0
//  487   /* Check the parameters */
//  488   assert_param(IS_TIM2_PRESCALER_RELOAD_OK(TIM2_PSCReloadMode));
        TNZ       S:?b8
        JREQ      L:??TIM2_PrescalerConfig_0
        LD        A, S:?b8
        CP        A, #0x1
        JREQ      L:??TIM2_PrescalerConfig_0
        LDW       X, #0x1e8
        LDW       S:?w1, X
        CLRW      X
        LDW       S:?w0, X
        LDW       X, #`?<Constant "C:\\\\Users\\\\lun55\\\\Deskto...">`
        CALL      L:assert_failed
//  489   assert_param(IS_TIM2_PRESCALER_OK(Prescaler));
??TIM2_PrescalerConfig_0:
        TNZ       S:?b9
        JREQ      L:??TIM2_PrescalerConfig_1
        LD        A, S:?b9
        CP        A, #0x1
        JREQ      L:??TIM2_PrescalerConfig_1
        LD        A, S:?b9
        CP        A, #0x2
        JREQ      L:??TIM2_PrescalerConfig_1
        LD        A, S:?b9
        CP        A, #0x3
        JREQ      L:??TIM2_PrescalerConfig_1
        LD        A, S:?b9
        CP        A, #0x4
        JREQ      L:??TIM2_PrescalerConfig_1
        LD        A, S:?b9
        CP        A, #0x5
        JREQ      L:??TIM2_PrescalerConfig_1
        LD        A, S:?b9
        CP        A, #0x6
        JREQ      L:??TIM2_PrescalerConfig_1
        LD        A, S:?b9
        CP        A, #0x7
        JREQ      L:??TIM2_PrescalerConfig_1
        LD        A, S:?b9
        CP        A, #0x8
        JREQ      L:??TIM2_PrescalerConfig_1
        LD        A, S:?b9
        CP        A, #0x9
        JREQ      L:??TIM2_PrescalerConfig_1
        LD        A, S:?b9
        CP        A, #0xa
        JREQ      L:??TIM2_PrescalerConfig_1
        LD        A, S:?b9
        CP        A, #0xb
        JREQ      L:??TIM2_PrescalerConfig_1
        LD        A, S:?b9
        CP        A, #0xc
        JREQ      L:??TIM2_PrescalerConfig_1
        LD        A, S:?b9
        CP        A, #0xd
        JREQ      L:??TIM2_PrescalerConfig_1
        LD        A, S:?b9
        CP        A, #0xe
        JREQ      L:??TIM2_PrescalerConfig_1
        LD        A, S:?b9
        CP        A, #0xf
        JREQ      L:??TIM2_PrescalerConfig_1
        LDW       X, #0x1e9
        LDW       S:?w1, X
        CLRW      X
        LDW       S:?w0, X
        LDW       X, #`?<Constant "C:\\\\Users\\\\lun55\\\\Deskto...">`
        CALL      L:assert_failed
//  490   
//  491   /* Set the Prescaler value */
//  492   TIM2->PSCR = (uint8_t)Prescaler;
??TIM2_PrescalerConfig_1:
        LD        A, S:?b9
        LD        L:0x530e, A
//  493   
//  494   /* Set or reset the UG Bit */
//  495   TIM2->EGR = (uint8_t)TIM2_PSCReloadMode;
        LD        A, S:?b8
        LD        L:0x5306, A
//  496 }
        JP        L:?epilogue_w4
//  497 
//  498 /**
//  499   * @brief  Forces the TIM2 Channel1 output waveform to active or inactive level.
//  500   * @param   TIM2_ForcedAction specifies the forced Action to be set to the output waveform.
//  501   * This parameter can be one of the following values:
//  502   *                       - TIM2_FORCEDACTION_ACTIVE: Force active level on OC1REF
//  503   *                       - TIM2_FORCEDACTION_INACTIVE: Force inactive level on
//  504   *                         OC1REF.
//  505   * @retval None
//  506   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  507 void TIM2_ForcedOC1Config(TIM2_ForcedAction_TypeDef TIM2_ForcedAction)
//  508 {
TIM2_ForcedOC1Config:
        PUSH      S:?b8
        LD        S:?b8, A
//  509   /* Check the parameters */
//  510   assert_param(IS_TIM2_FORCED_ACTION_OK(TIM2_ForcedAction));
        LD        A, S:?b8
        CP        A, #0x50
        JREQ      L:??TIM2_ForcedOC1Config_0
        LD        A, S:?b8
        CP        A, #0x40
        JREQ      L:??TIM2_ForcedOC1Config_0
        LDW       X, #0x1fe
        LDW       S:?w1, X
        CLRW      X
        LDW       S:?w0, X
        LDW       X, #`?<Constant "C:\\\\Users\\\\lun55\\\\Deskto...">`
        CALL      L:assert_failed
//  511   
//  512   /* Reset the OCM Bits & Configure the Forced output Mode */
//  513   TIM2->CCMR1  =  (uint8_t)((uint8_t)(TIM2->CCMR1 & (uint8_t)(~TIM2_CCMR_OCM))  
//  514                             | (uint8_t)TIM2_ForcedAction);
??TIM2_ForcedOC1Config_0:
        LD        A, L:0x5307
        AND       A, #0x8f
        OR        A, S:?b8
        LD        L:0x5307, A
//  515 }
        POP       S:?b8
        RET
//  516 
//  517 /**
//  518   * @brief  Forces the TIM2 Channel2 output waveform to active or inactive level.
//  519   * @param   TIM2_ForcedAction specifies the forced Action to be set to the output waveform.
//  520   * This parameter can be one of the following values:
//  521   *                       - TIM2_FORCEDACTION_ACTIVE: Force active level on OC2REF
//  522   *                       - TIM2_FORCEDACTION_INACTIVE: Force inactive level on
//  523   *                         OC2REF.
//  524   * @retval None
//  525   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  526 void TIM2_ForcedOC2Config(TIM2_ForcedAction_TypeDef TIM2_ForcedAction)
//  527 {
TIM2_ForcedOC2Config:
        PUSH      S:?b8
        LD        S:?b8, A
//  528   /* Check the parameters */
//  529   assert_param(IS_TIM2_FORCED_ACTION_OK(TIM2_ForcedAction));
        LD        A, S:?b8
        CP        A, #0x50
        JREQ      L:??TIM2_ForcedOC2Config_0
        LD        A, S:?b8
        CP        A, #0x40
        JREQ      L:??TIM2_ForcedOC2Config_0
        LDW       X, #0x211
        LDW       S:?w1, X
        CLRW      X
        LDW       S:?w0, X
        LDW       X, #`?<Constant "C:\\\\Users\\\\lun55\\\\Deskto...">`
        CALL      L:assert_failed
//  530   
//  531   /* Reset the OCM Bits & Configure the Forced output Mode */
//  532   TIM2->CCMR2 = (uint8_t)((uint8_t)(TIM2->CCMR2 & (uint8_t)(~TIM2_CCMR_OCM))  
//  533                           | (uint8_t)TIM2_ForcedAction);
??TIM2_ForcedOC2Config_0:
        LD        A, L:0x5308
        AND       A, #0x8f
        OR        A, S:?b8
        LD        L:0x5308, A
//  534 }
        POP       S:?b8
        RET
//  535 
//  536 /**
//  537   * @brief  Forces the TIM2 Channel3 output waveform to active or inactive level.
//  538   * @param   TIM2_ForcedAction specifies the forced Action to be set to the output waveform.
//  539   * This parameter can be one of the following values:
//  540   *                       - TIM2_FORCEDACTION_ACTIVE: Force active level on OC3REF
//  541   *                       - TIM2_FORCEDACTION_INACTIVE: Force inactive level on
//  542   *                         OC3REF.
//  543   * @retval None
//  544   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  545 void TIM2_ForcedOC3Config(TIM2_ForcedAction_TypeDef TIM2_ForcedAction)
//  546 {
TIM2_ForcedOC3Config:
        PUSH      S:?b8
        LD        S:?b8, A
//  547   /* Check the parameters */
//  548   assert_param(IS_TIM2_FORCED_ACTION_OK(TIM2_ForcedAction));
        LD        A, S:?b8
        CP        A, #0x50
        JREQ      L:??TIM2_ForcedOC3Config_0
        LD        A, S:?b8
        CP        A, #0x40
        JREQ      L:??TIM2_ForcedOC3Config_0
        LDW       X, #0x224
        LDW       S:?w1, X
        CLRW      X
        LDW       S:?w0, X
        LDW       X, #`?<Constant "C:\\\\Users\\\\lun55\\\\Deskto...">`
        CALL      L:assert_failed
//  549   
//  550   /* Reset the OCM Bits & Configure the Forced output Mode */
//  551   TIM2->CCMR3  =  (uint8_t)((uint8_t)(TIM2->CCMR3 & (uint8_t)(~TIM2_CCMR_OCM))
//  552                             | (uint8_t)TIM2_ForcedAction);
??TIM2_ForcedOC3Config_0:
        LD        A, L:0x5309
        AND       A, #0x8f
        OR        A, S:?b8
        LD        L:0x5309, A
//  553 }
        POP       S:?b8
        RET
//  554 
//  555 /**
//  556   * @brief  Enables or disables TIM2 peripheral Preload register on ARR.
//  557   * @param   NewState new state of the TIM2 peripheral Preload register.
//  558   * This parameter can be ENABLE or DISABLE.
//  559   * @retval None
//  560   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  561 void TIM2_ARRPreloadConfig(FunctionalState NewState)
//  562 {
TIM2_ARRPreloadConfig:
        PUSH      S:?b8
        LD        S:?b8, A
//  563   /* Check the parameters */
//  564   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
        TNZ       S:?b8
        JREQ      L:??TIM2_ARRPreloadConfig_0
        LD        A, S:?b8
        CP        A, #0x1
        JREQ      L:??TIM2_ARRPreloadConfig_0
        LDW       X, #0x234
        LDW       S:?w1, X
        CLRW      X
        LDW       S:?w0, X
        LDW       X, #`?<Constant "C:\\\\Users\\\\lun55\\\\Deskto...">`
        CALL      L:assert_failed
//  565   
//  566   /* Set or Reset the ARPE Bit */
//  567   if (NewState != DISABLE)
??TIM2_ARRPreloadConfig_0:
        TNZ       S:?b8
        JREQ      L:??TIM2_ARRPreloadConfig_1
//  568   {
//  569     TIM2->CR1 |= (uint8_t)TIM2_CR1_ARPE;
        BSET      L:0x5300, #0x7
        JRA       L:??TIM2_ARRPreloadConfig_2
//  570   }
//  571   else
//  572   {
//  573     TIM2->CR1 &= (uint8_t)(~TIM2_CR1_ARPE);
??TIM2_ARRPreloadConfig_1:
        BRES      L:0x5300, #0x7
//  574   }
//  575 }
??TIM2_ARRPreloadConfig_2:
        POP       S:?b8
        RET
//  576 
//  577 /**
//  578   * @brief  Enables or disables the TIM2 peripheral Preload Register on CCR1.
//  579   * @param   NewState new state of the Capture Compare Preload register.
//  580   * This parameter can be ENABLE or DISABLE.
//  581   * @retval None
//  582   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  583 void TIM2_OC1PreloadConfig(FunctionalState NewState)
//  584 {
TIM2_OC1PreloadConfig:
        PUSH      S:?b8
        LD        S:?b8, A
//  585   /* Check the parameters */
//  586   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
        TNZ       S:?b8
        JREQ      L:??TIM2_OC1PreloadConfig_0
        LD        A, S:?b8
        CP        A, #0x1
        JREQ      L:??TIM2_OC1PreloadConfig_0
        LDW       X, #0x24a
        LDW       S:?w1, X
        CLRW      X
        LDW       S:?w0, X
        LDW       X, #`?<Constant "C:\\\\Users\\\\lun55\\\\Deskto...">`
        CALL      L:assert_failed
//  587   
//  588   /* Set or Reset the OC1PE Bit */
//  589   if (NewState != DISABLE)
??TIM2_OC1PreloadConfig_0:
        TNZ       S:?b8
        JREQ      L:??TIM2_OC1PreloadConfig_1
//  590   {
//  591     TIM2->CCMR1 |= (uint8_t)TIM2_CCMR_OCxPE;
        BSET      L:0x5307, #0x3
        JRA       L:??TIM2_OC1PreloadConfig_2
//  592   }
//  593   else
//  594   {
//  595     TIM2->CCMR1 &= (uint8_t)(~TIM2_CCMR_OCxPE);
??TIM2_OC1PreloadConfig_1:
        BRES      L:0x5307, #0x3
//  596   }
//  597 }
??TIM2_OC1PreloadConfig_2:
        POP       S:?b8
        RET
//  598 
//  599 /**
//  600   * @brief  Enables or disables the TIM2 peripheral Preload Register on CCR2.
//  601   * @param   NewState new state of the Capture Compare Preload register.
//  602   * This parameter can be ENABLE or DISABLE.
//  603   * @retval None
//  604   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  605 void TIM2_OC2PreloadConfig(FunctionalState NewState)
//  606 {
TIM2_OC2PreloadConfig:
        PUSH      S:?b8
        LD        S:?b8, A
//  607   /* Check the parameters */
//  608   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
        TNZ       S:?b8
        JREQ      L:??TIM2_OC2PreloadConfig_0
        LD        A, S:?b8
        CP        A, #0x1
        JREQ      L:??TIM2_OC2PreloadConfig_0
        LDW       X, #0x260
        LDW       S:?w1, X
        CLRW      X
        LDW       S:?w0, X
        LDW       X, #`?<Constant "C:\\\\Users\\\\lun55\\\\Deskto...">`
        CALL      L:assert_failed
//  609   
//  610   /* Set or Reset the OC2PE Bit */
//  611   if (NewState != DISABLE)
??TIM2_OC2PreloadConfig_0:
        TNZ       S:?b8
        JREQ      L:??TIM2_OC2PreloadConfig_1
//  612   {
//  613     TIM2->CCMR2 |= (uint8_t)TIM2_CCMR_OCxPE;
        BSET      L:0x5308, #0x3
        JRA       L:??TIM2_OC2PreloadConfig_2
//  614   }
//  615   else
//  616   {
//  617     TIM2->CCMR2 &= (uint8_t)(~TIM2_CCMR_OCxPE);
??TIM2_OC2PreloadConfig_1:
        BRES      L:0x5308, #0x3
//  618   }
//  619 }
??TIM2_OC2PreloadConfig_2:
        POP       S:?b8
        RET
//  620 
//  621 /**
//  622   * @brief  Enables or disables the TIM2 peripheral Preload Register on CCR3.
//  623   * @param   NewState new state of the Capture Compare Preload register.
//  624   * This parameter can be ENABLE or DISABLE.
//  625   * @retval None
//  626   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  627 void TIM2_OC3PreloadConfig(FunctionalState NewState)
//  628 {
TIM2_OC3PreloadConfig:
        PUSH      S:?b8
        LD        S:?b8, A
//  629   /* Check the parameters */
//  630   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
        TNZ       S:?b8
        JREQ      L:??TIM2_OC3PreloadConfig_0
        LD        A, S:?b8
        CP        A, #0x1
        JREQ      L:??TIM2_OC3PreloadConfig_0
        LDW       X, #0x276
        LDW       S:?w1, X
        CLRW      X
        LDW       S:?w0, X
        LDW       X, #`?<Constant "C:\\\\Users\\\\lun55\\\\Deskto...">`
        CALL      L:assert_failed
//  631   
//  632   /* Set or Reset the OC3PE Bit */
//  633   if (NewState != DISABLE)
??TIM2_OC3PreloadConfig_0:
        TNZ       S:?b8
        JREQ      L:??TIM2_OC3PreloadConfig_1
//  634   {
//  635     TIM2->CCMR3 |= (uint8_t)TIM2_CCMR_OCxPE;
        BSET      L:0x5309, #0x3
        JRA       L:??TIM2_OC3PreloadConfig_2
//  636   }
//  637   else
//  638   {
//  639     TIM2->CCMR3 &= (uint8_t)(~TIM2_CCMR_OCxPE);
??TIM2_OC3PreloadConfig_1:
        BRES      L:0x5309, #0x3
//  640   }
//  641 }
??TIM2_OC3PreloadConfig_2:
        POP       S:?b8
        RET
//  642 
//  643 /**
//  644   * @brief  Configures the TIM2 event to be generated by software.
//  645   * @param   TIM2_EventSource specifies the event source.
//  646   * This parameter can be one of the following values:
//  647   *                       - TIM2_EVENTSOURCE_UPDATE: TIM2 update Event source
//  648   *                       - TIM2_EVENTSOURCE_CC1: TIM2 Capture Compare 1 Event source
//  649   *                       - TIM2_EVENTSOURCE_CC2: TIM2 Capture Compare 2 Event source
//  650   *                       - TIM2_EVENTSOURCE_CC3: TIM2 Capture Compare 3 Event source
//  651   * @retval None
//  652   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  653 void TIM2_GenerateEvent(TIM2_EventSource_TypeDef TIM2_EventSource)
//  654 {
TIM2_GenerateEvent:
        PUSH      S:?b8
        LD        S:?b8, A
//  655   /* Check the parameters */
//  656   assert_param(IS_TIM2_EVENT_SOURCE_OK(TIM2_EventSource));
        TNZ       S:?b8
        JRNE      L:??TIM2_GenerateEvent_0
        LDW       X, #0x290
        LDW       S:?w1, X
        CLRW      X
        LDW       S:?w0, X
        LDW       X, #`?<Constant "C:\\\\Users\\\\lun55\\\\Deskto...">`
        CALL      L:assert_failed
//  657   
//  658   /* Set the event sources */
//  659   TIM2->EGR = (uint8_t)TIM2_EventSource;
??TIM2_GenerateEvent_0:
        LD        A, S:?b8
        LD        L:0x5306, A
//  660 }
        POP       S:?b8
        RET
//  661 
//  662 /**
//  663   * @brief  Configures the TIM2 Channel 1 polarity.
//  664   * @param   TIM2_OCPolarity specifies the OC1 Polarity.
//  665   * This parameter can be one of the following values:
//  666   *                       - TIM2_OCPOLARITY_LOW: Output Compare active low
//  667   *                       - TIM2_OCPOLARITY_HIGH: Output Compare active high
//  668   * @retval None
//  669   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  670 void TIM2_OC1PolarityConfig(TIM2_OCPolarity_TypeDef TIM2_OCPolarity)
//  671 {
TIM2_OC1PolarityConfig:
        PUSH      S:?b8
        LD        S:?b8, A
//  672   /* Check the parameters */
//  673   assert_param(IS_TIM2_OC_POLARITY_OK(TIM2_OCPolarity));
        TNZ       S:?b8
        JREQ      L:??TIM2_OC1PolarityConfig_0
        LD        A, S:?b8
        CP        A, #0x22
        JREQ      L:??TIM2_OC1PolarityConfig_0
        LDW       X, #0x2a1
        LDW       S:?w1, X
        CLRW      X
        LDW       S:?w0, X
        LDW       X, #`?<Constant "C:\\\\Users\\\\lun55\\\\Deskto...">`
        CALL      L:assert_failed
//  674   
//  675   /* Set or Reset the CC1P Bit */
//  676   if (TIM2_OCPolarity != TIM2_OCPOLARITY_HIGH)
??TIM2_OC1PolarityConfig_0:
        TNZ       S:?b8
        JREQ      L:??TIM2_OC1PolarityConfig_1
//  677   {
//  678     TIM2->CCER1 |= (uint8_t)TIM2_CCER1_CC1P;
        BSET      L:0x530a, #0x1
        JRA       L:??TIM2_OC1PolarityConfig_2
//  679   }
//  680   else
//  681   {
//  682     TIM2->CCER1 &= (uint8_t)(~TIM2_CCER1_CC1P);
??TIM2_OC1PolarityConfig_1:
        BRES      L:0x530a, #0x1
//  683   }
//  684 }
??TIM2_OC1PolarityConfig_2:
        POP       S:?b8
        RET
//  685 
//  686 /**
//  687   * @brief  Configures the TIM2 Channel 2 polarity.
//  688   * @param   TIM2_OCPolarity specifies the OC2 Polarity.
//  689   * This parameter can be one of the following values:
//  690   *                       - TIM2_OCPOLARITY_LOW: Output Compare active low
//  691   *                       - TIM2_OCPOLARITY_HIGH: Output Compare active high
//  692   * @retval None
//  693   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  694 void TIM2_OC2PolarityConfig(TIM2_OCPolarity_TypeDef TIM2_OCPolarity)
//  695 {
TIM2_OC2PolarityConfig:
        PUSH      S:?b8
        LD        S:?b8, A
//  696   /* Check the parameters */
//  697   assert_param(IS_TIM2_OC_POLARITY_OK(TIM2_OCPolarity));
        TNZ       S:?b8
        JREQ      L:??TIM2_OC2PolarityConfig_0
        LD        A, S:?b8
        CP        A, #0x22
        JREQ      L:??TIM2_OC2PolarityConfig_0
        LDW       X, #0x2b9
        LDW       S:?w1, X
        CLRW      X
        LDW       S:?w0, X
        LDW       X, #`?<Constant "C:\\\\Users\\\\lun55\\\\Deskto...">`
        CALL      L:assert_failed
//  698   
//  699   /* Set or Reset the CC2P Bit */
//  700   if (TIM2_OCPolarity != TIM2_OCPOLARITY_HIGH)
??TIM2_OC2PolarityConfig_0:
        TNZ       S:?b8
        JREQ      L:??TIM2_OC2PolarityConfig_1
//  701   {
//  702     TIM2->CCER1 |= TIM2_CCER1_CC2P;
        BSET      L:0x530a, #0x5
        JRA       L:??TIM2_OC2PolarityConfig_2
//  703   }
//  704   else
//  705   {
//  706     TIM2->CCER1 &= (uint8_t)(~TIM2_CCER1_CC2P);
??TIM2_OC2PolarityConfig_1:
        BRES      L:0x530a, #0x5
//  707   }
//  708 }
??TIM2_OC2PolarityConfig_2:
        POP       S:?b8
        RET
//  709 
//  710 /**
//  711   * @brief  Configures the TIM2 Channel 3 polarity.
//  712   * @param   TIM2_OCPolarity specifies the OC3 Polarity.
//  713   * This parameter can be one of the following values:
//  714   *                       - TIM2_OCPOLARITY_LOW: Output Compare active low
//  715   *                       - TIM2_OCPOLARITY_HIGH: Output Compare active high
//  716   * @retval None
//  717   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  718 void TIM2_OC3PolarityConfig(TIM2_OCPolarity_TypeDef TIM2_OCPolarity)
//  719 {
TIM2_OC3PolarityConfig:
        PUSH      S:?b8
        LD        S:?b8, A
//  720   /* Check the parameters */
//  721   assert_param(IS_TIM2_OC_POLARITY_OK(TIM2_OCPolarity));
        TNZ       S:?b8
        JREQ      L:??TIM2_OC3PolarityConfig_0
        LD        A, S:?b8
        CP        A, #0x22
        JREQ      L:??TIM2_OC3PolarityConfig_0
        LDW       X, #0x2d1
        LDW       S:?w1, X
        CLRW      X
        LDW       S:?w0, X
        LDW       X, #`?<Constant "C:\\\\Users\\\\lun55\\\\Deskto...">`
        CALL      L:assert_failed
//  722   
//  723   /* Set or Reset the CC3P Bit */
//  724   if (TIM2_OCPolarity != TIM2_OCPOLARITY_HIGH)
??TIM2_OC3PolarityConfig_0:
        TNZ       S:?b8
        JREQ      L:??TIM2_OC3PolarityConfig_1
//  725   {
//  726     TIM2->CCER2 |= (uint8_t)TIM2_CCER2_CC3P;
        BSET      L:0x530b, #0x1
        JRA       L:??TIM2_OC3PolarityConfig_2
//  727   }
//  728   else
//  729   {
//  730     TIM2->CCER2 &= (uint8_t)(~TIM2_CCER2_CC3P);
??TIM2_OC3PolarityConfig_1:
        BRES      L:0x530b, #0x1
//  731   }
//  732 }
??TIM2_OC3PolarityConfig_2:
        POP       S:?b8
        RET
//  733 
//  734 /**
//  735   * @brief  Enables or disables the TIM2 Capture Compare Channel x.
//  736   * @param   TIM2_Channel specifies the TIM2 Channel.
//  737   * This parameter can be one of the following values:
//  738   *                       - TIM2_CHANNEL_1: TIM2 Channel1
//  739   *                       - TIM2_CHANNEL_2: TIM2 Channel2
//  740   *                       - TIM2_CHANNEL_3: TIM2 Channel3
//  741   * @param   NewState specifies the TIM2 Channel CCxE bit new state.
//  742   * This parameter can be: ENABLE or DISABLE.
//  743   * @retval None
//  744   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  745 void TIM2_CCxCmd(TIM2_Channel_TypeDef TIM2_Channel, FunctionalState NewState)
//  746 {
TIM2_CCxCmd:
        CALL      L:?push_w4
        LD        S:?b8, A
        MOV       S:?b9, S:?b0
//  747   /* Check the parameters */
//  748   assert_param(IS_TIM2_CHANNEL_OK(TIM2_Channel));
        TNZ       S:?b8
        JREQ      L:??TIM2_CCxCmd_0
        LD        A, S:?b8
        CP        A, #0x1
        JREQ      L:??TIM2_CCxCmd_0
        LD        A, S:?b8
        CP        A, #0x2
        JREQ      L:??TIM2_CCxCmd_0
        LDW       X, #0x2ec
        LDW       S:?w1, X
        CLRW      X
        LDW       S:?w0, X
        LDW       X, #`?<Constant "C:\\\\Users\\\\lun55\\\\Deskto...">`
        CALL      L:assert_failed
//  749   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
??TIM2_CCxCmd_0:
        TNZ       S:?b9
        JREQ      L:??TIM2_CCxCmd_1
        LD        A, S:?b9
        CP        A, #0x1
        JREQ      L:??TIM2_CCxCmd_1
        LDW       X, #0x2ed
        LDW       S:?w1, X
        CLRW      X
        LDW       S:?w0, X
        LDW       X, #`?<Constant "C:\\\\Users\\\\lun55\\\\Deskto...">`
        CALL      L:assert_failed
//  750   
//  751   if (TIM2_Channel == TIM2_CHANNEL_1)
??TIM2_CCxCmd_1:
        TNZ       S:?b8
        JRNE      L:??TIM2_CCxCmd_2
//  752   {
//  753     /* Set or Reset the CC1E Bit */
//  754     if (NewState != DISABLE)
        TNZ       S:?b9
        JREQ      L:??TIM2_CCxCmd_3
//  755     {
//  756       TIM2->CCER1 |= (uint8_t)TIM2_CCER1_CC1E;
        BSET      L:0x530a, #0x0
        JP        L:?epilogue_w4
//  757     }
//  758     else
//  759     {
//  760       TIM2->CCER1 &= (uint8_t)(~TIM2_CCER1_CC1E);
??TIM2_CCxCmd_3:
        BRES      L:0x530a, #0x0
        JP        L:?epilogue_w4
//  761     }
//  762     
//  763   }
//  764   else if (TIM2_Channel == TIM2_CHANNEL_2)
??TIM2_CCxCmd_2:
        LD        A, S:?b8
        CP        A, #0x1
        JRNE      L:??TIM2_CCxCmd_4
//  765   {
//  766     /* Set or Reset the CC2E Bit */
//  767     if (NewState != DISABLE)
        TNZ       S:?b9
        JREQ      L:??TIM2_CCxCmd_5
//  768     {
//  769       TIM2->CCER1 |= (uint8_t)TIM2_CCER1_CC2E;
        BSET      L:0x530a, #0x4
        JP        L:?epilogue_w4
//  770     }
//  771     else
//  772     {
//  773       TIM2->CCER1 &= (uint8_t)(~TIM2_CCER1_CC2E);
??TIM2_CCxCmd_5:
        BRES      L:0x530a, #0x4
        JP        L:?epilogue_w4
//  774     }
//  775   }
//  776   else
//  777   {
//  778     /* Set or Reset the CC3E Bit */
//  779     if (NewState != DISABLE)
??TIM2_CCxCmd_4:
        TNZ       S:?b9
        JREQ      L:??TIM2_CCxCmd_6
//  780     {
//  781       TIM2->CCER2 |= (uint8_t)TIM2_CCER2_CC3E;
        BSET      L:0x530b, #0x0
        JP        L:?epilogue_w4
//  782     }
//  783     else
//  784     {
//  785       TIM2->CCER2 &= (uint8_t)(~TIM2_CCER2_CC3E);
??TIM2_CCxCmd_6:
        BRES      L:0x530b, #0x0
//  786     }
//  787   }
//  788 }
        JP        L:?epilogue_w4
//  789 
//  790 /**
//  791   * @brief  Selects the TIM2 Output Compare Mode. This function disables the
//  792   * selected channel before changing the Output Compare Mode. User has to
//  793   * enable this channel using TIM2_CCxCmd and TIM2_CCxNCmd functions.
//  794   * @param   TIM2_Channel specifies the TIM2 Channel.
//  795   * This parameter can be one of the following values:
//  796   *                       - TIM2_CHANNEL_1: TIM2 Channel1
//  797   *                       - TIM2_CHANNEL_2: TIM2 Channel2
//  798   *                       - TIM2_CHANNEL_3: TIM2 Channel3
//  799   * @param   TIM2_OCMode specifies the TIM2 Output Compare Mode.
//  800   * This parameter can be one of the following values:
//  801   *                       - TIM2_OCMODE_TIMING
//  802   *                       - TIM2_OCMODE_ACTIVE
//  803   *                       - TIM2_OCMODE_TOGGLE
//  804   *                       - TIM2_OCMODE_PWM1
//  805   *                       - TIM2_OCMODE_PWM2
//  806   *                       - TIM2_FORCEDACTION_ACTIVE
//  807   *                       - TIM2_FORCEDACTION_INACTIVE
//  808   * @retval None
//  809   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  810 void TIM2_SelectOCxM(TIM2_Channel_TypeDef TIM2_Channel, TIM2_OCMode_TypeDef TIM2_OCMode)
//  811 {
TIM2_SelectOCxM:
        CALL      L:?push_w4
        LD        S:?b8, A
        MOV       S:?b9, S:?b0
//  812   /* Check the parameters */
//  813   assert_param(IS_TIM2_CHANNEL_OK(TIM2_Channel));
        TNZ       S:?b8
        JREQ      L:??TIM2_SelectOCxM_0
        LD        A, S:?b8
        CP        A, #0x1
        JREQ      L:??TIM2_SelectOCxM_0
        LD        A, S:?b8
        CP        A, #0x2
        JREQ      L:??TIM2_SelectOCxM_0
        LDW       X, #0x32d
        LDW       S:?w1, X
        CLRW      X
        LDW       S:?w0, X
        LDW       X, #`?<Constant "C:\\\\Users\\\\lun55\\\\Deskto...">`
        CALL      L:assert_failed
//  814   assert_param(IS_TIM2_OCM_OK(TIM2_OCMode));
??TIM2_SelectOCxM_0:
        TNZ       S:?b9
        JREQ      L:??TIM2_SelectOCxM_1
        LD        A, S:?b9
        CP        A, #0x10
        JREQ      L:??TIM2_SelectOCxM_1
        LD        A, S:?b9
        CP        A, #0x20
        JREQ      L:??TIM2_SelectOCxM_1
        LD        A, S:?b9
        CP        A, #0x30
        JREQ      L:??TIM2_SelectOCxM_1
        LD        A, S:?b9
        CP        A, #0x60
        JREQ      L:??TIM2_SelectOCxM_1
        LD        A, S:?b9
        CP        A, #0x70
        JREQ      L:??TIM2_SelectOCxM_1
        LD        A, S:?b9
        CP        A, #0x50
        JREQ      L:??TIM2_SelectOCxM_1
        LD        A, S:?b9
        CP        A, #0x40
        JREQ      L:??TIM2_SelectOCxM_1
        LDW       X, #0x32e
        LDW       S:?w1, X
        CLRW      X
        LDW       S:?w0, X
        LDW       X, #`?<Constant "C:\\\\Users\\\\lun55\\\\Deskto...">`
        CALL      L:assert_failed
//  815   
//  816   if (TIM2_Channel == TIM2_CHANNEL_1)
??TIM2_SelectOCxM_1:
        TNZ       S:?b8
        JRNE      L:??TIM2_SelectOCxM_2
//  817   {
//  818     /* Disable the Channel 1: Reset the CCE Bit */
//  819     TIM2->CCER1 &= (uint8_t)(~TIM2_CCER1_CC1E);
        BRES      L:0x530a, #0x0
//  820     
//  821     /* Reset the Output Compare Bits & Set the Output Compare Mode */
//  822     TIM2->CCMR1 = (uint8_t)((uint8_t)(TIM2->CCMR1 & (uint8_t)(~TIM2_CCMR_OCM))
//  823                             | (uint8_t)TIM2_OCMode);
        LD        A, L:0x5307
        AND       A, #0x8f
        OR        A, S:?b9
        LD        L:0x5307, A
        JP        L:?epilogue_w4
//  824   }
//  825   else if (TIM2_Channel == TIM2_CHANNEL_2)
??TIM2_SelectOCxM_2:
        LD        A, S:?b8
        CP        A, #0x1
        JRNE      L:??TIM2_SelectOCxM_3
//  826   {
//  827     /* Disable the Channel 2: Reset the CCE Bit */
//  828     TIM2->CCER1 &= (uint8_t)(~TIM2_CCER1_CC2E);
        BRES      L:0x530a, #0x4
//  829     
//  830     /* Reset the Output Compare Bits & Set the Output Compare Mode */
//  831     TIM2->CCMR2 = (uint8_t)((uint8_t)(TIM2->CCMR2 & (uint8_t)(~TIM2_CCMR_OCM))
//  832                             | (uint8_t)TIM2_OCMode);
        LD        A, L:0x5308
        AND       A, #0x8f
        OR        A, S:?b9
        LD        L:0x5308, A
        JP        L:?epilogue_w4
//  833   }
//  834   else
//  835   {
//  836     /* Disable the Channel 3: Reset the CCE Bit */
//  837     TIM2->CCER2 &= (uint8_t)(~TIM2_CCER2_CC3E);
??TIM2_SelectOCxM_3:
        BRES      L:0x530b, #0x0
//  838     
//  839     /* Reset the Output Compare Bits & Set the Output Compare Mode */
//  840     TIM2->CCMR3 = (uint8_t)((uint8_t)(TIM2->CCMR3 & (uint8_t)(~TIM2_CCMR_OCM))
//  841                             | (uint8_t)TIM2_OCMode);
        LD        A, L:0x5309
        AND       A, #0x8f
        OR        A, S:?b9
        LD        L:0x5309, A
//  842   }
//  843 }
        JP        L:?epilogue_w4
//  844 
//  845 /**
//  846   * @brief  Sets the TIM2 Counter Register value.
//  847   * @param   Counter specifies the Counter register new value.
//  848   * This parameter is between 0x0000 and 0xFFFF.
//  849   * @retval None
//  850   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  851 void TIM2_SetCounter(uint16_t Counter)
//  852 {
TIM2_SetCounter:
        LDW       Y, X
//  853   /* Set the Counter Register value */
//  854   TIM2->CNTRH = (uint8_t)(Counter >> 8);
        LDW       X, Y
        CLR       A
        RRWA      X, A
        LD        A, XL
        LD        L:0x530c, A
//  855   TIM2->CNTRL = (uint8_t)(Counter);
        LD        A, YL
        LD        L:0x530d, A
//  856 }
        RET
//  857 
//  858 /**
//  859   * @brief  Sets the TIM2 Autoreload Register value.
//  860   * @param   Autoreload specifies the Autoreload register new value.
//  861   * This parameter is between 0x0000 and 0xFFFF.
//  862   * @retval None
//  863   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  864 void TIM2_SetAutoreload(uint16_t Autoreload)
//  865 {
TIM2_SetAutoreload:
        LDW       Y, X
//  866   /* Set the Autoreload Register value */
//  867   TIM2->ARRH = (uint8_t)(Autoreload >> 8);
        LDW       X, Y
        CLR       A
        RRWA      X, A
        LD        A, XL
        LD        L:0x530f, A
//  868   TIM2->ARRL = (uint8_t)(Autoreload);
        LD        A, YL
        LD        L:0x5310, A
//  869 }
        RET
//  870 
//  871 /**
//  872   * @brief  Sets the TIM2 Capture Compare1 Register value.
//  873   * @param   Compare1 specifies the Capture Compare1 register new value.
//  874   * This parameter is between 0x0000 and 0xFFFF.
//  875   * @retval None
//  876   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  877 void TIM2_SetCompare1(uint16_t Compare1)
//  878 {
TIM2_SetCompare1:
        LDW       Y, X
//  879   /* Set the Capture Compare1 Register value */
//  880   TIM2->CCR1H = (uint8_t)(Compare1 >> 8);
        LDW       X, Y
        CLR       A
        RRWA      X, A
        LD        A, XL
        LD        L:0x5311, A
//  881   TIM2->CCR1L = (uint8_t)(Compare1);
        LD        A, YL
        LD        L:0x5312, A
//  882 }
        RET
//  883 
//  884 /**
//  885   * @brief  Sets the TIM2 Capture Compare2 Register value.
//  886   * @param   Compare2 specifies the Capture Compare2 register new value.
//  887   * This parameter is between 0x0000 and 0xFFFF.
//  888   * @retval None
//  889   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  890 void TIM2_SetCompare2(uint16_t Compare2)
//  891 {
TIM2_SetCompare2:
        LDW       Y, X
//  892   /* Set the Capture Compare2 Register value */
//  893   TIM2->CCR2H = (uint8_t)(Compare2 >> 8);
        LDW       X, Y
        CLR       A
        RRWA      X, A
        LD        A, XL
        LD        L:0x5313, A
//  894   TIM2->CCR2L = (uint8_t)(Compare2);
        LD        A, YL
        LD        L:0x5314, A
//  895 }
        RET
//  896 
//  897 /**
//  898   * @brief  Sets the TIM2 Capture Compare3 Register value.
//  899   * @param   Compare3 specifies the Capture Compare3 register new value.
//  900   * This parameter is between 0x0000 and 0xFFFF.
//  901   * @retval None
//  902   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  903 void TIM2_SetCompare3(uint16_t Compare3)
//  904 {
TIM2_SetCompare3:
        LDW       Y, X
//  905   /* Set the Capture Compare3 Register value */
//  906   TIM2->CCR3H = (uint8_t)(Compare3 >> 8);
        LDW       X, Y
        CLR       A
        RRWA      X, A
        LD        A, XL
        LD        L:0x5315, A
//  907   TIM2->CCR3L = (uint8_t)(Compare3);
        LD        A, YL
        LD        L:0x5316, A
//  908 }
        RET
//  909 
//  910 /**
//  911   * @brief  Sets the TIM2 Input Capture 1 Prescaler.
//  912   * @param   TIM2_IC1Prescaler specifies the Input Capture prescaler new value
//  913   * This parameter can be one of the following values:
//  914   *                       - TIM2_ICPSC_DIV1: no prescaler
//  915   *                       - TIM2_ICPSC_DIV2: capture is done once every 2 events
//  916   *                       - TIM2_ICPSC_DIV4: capture is done once every 4 events
//  917   *                       - TIM2_ICPSC_DIV8: capture is done once every 8 events
//  918   * @retval None
//  919   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  920 void TIM2_SetIC1Prescaler(TIM2_ICPSC_TypeDef TIM2_IC1Prescaler)
//  921 {
TIM2_SetIC1Prescaler:
        PUSH      S:?b8
        LD        S:?b8, A
//  922   /* Check the parameters */
//  923   assert_param(IS_TIM2_IC_PRESCALER_OK(TIM2_IC1Prescaler));
        TNZ       S:?b8
        JREQ      L:??TIM2_SetIC1Prescaler_0
        LD        A, S:?b8
        CP        A, #0x4
        JREQ      L:??TIM2_SetIC1Prescaler_0
        LD        A, S:?b8
        CP        A, #0x8
        JREQ      L:??TIM2_SetIC1Prescaler_0
        LD        A, S:?b8
        CP        A, #0xc
        JREQ      L:??TIM2_SetIC1Prescaler_0
        LDW       X, #0x39b
        LDW       S:?w1, X
        CLRW      X
        LDW       S:?w0, X
        LDW       X, #`?<Constant "C:\\\\Users\\\\lun55\\\\Deskto...">`
        CALL      L:assert_failed
//  924   
//  925   /* Reset the IC1PSC Bits &Set the IC1PSC value */
//  926   TIM2->CCMR1 = (uint8_t)((uint8_t)(TIM2->CCMR1 & (uint8_t)(~TIM2_CCMR_ICxPSC))
//  927                           | (uint8_t)TIM2_IC1Prescaler);
??TIM2_SetIC1Prescaler_0:
        LD        A, L:0x5307
        AND       A, #0xf3
        OR        A, S:?b8
        LD        L:0x5307, A
//  928 }
        POP       S:?b8
        RET
//  929 
//  930 /**
//  931   * @brief  Sets the TIM2 Input Capture 2 prescaler.
//  932   * @param   TIM2_IC2Prescaler specifies the Input Capture prescaler new value
//  933   * This parameter can be one of the following values:
//  934   *                       - TIM2_ICPSC_DIV1: no prescaler
//  935   *                       - TIM2_ICPSC_DIV2: capture is done once every 2 events
//  936   *                       - TIM2_ICPSC_DIV4: capture is done once every 4 events
//  937   *                       - TIM2_ICPSC_DIV8: capture is done once every 8 events
//  938   * @retval None
//  939   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  940 void TIM2_SetIC2Prescaler(TIM2_ICPSC_TypeDef TIM2_IC2Prescaler)
//  941 {
TIM2_SetIC2Prescaler:
        PUSH      S:?b8
        LD        S:?b8, A
//  942   /* Check the parameters */
//  943   assert_param(IS_TIM2_IC_PRESCALER_OK(TIM2_IC2Prescaler));
        TNZ       S:?b8
        JREQ      L:??TIM2_SetIC2Prescaler_0
        LD        A, S:?b8
        CP        A, #0x4
        JREQ      L:??TIM2_SetIC2Prescaler_0
        LD        A, S:?b8
        CP        A, #0x8
        JREQ      L:??TIM2_SetIC2Prescaler_0
        LD        A, S:?b8
        CP        A, #0xc
        JREQ      L:??TIM2_SetIC2Prescaler_0
        LDW       X, #0x3af
        LDW       S:?w1, X
        CLRW      X
        LDW       S:?w0, X
        LDW       X, #`?<Constant "C:\\\\Users\\\\lun55\\\\Deskto...">`
        CALL      L:assert_failed
//  944   
//  945   /* Reset the IC1PSC Bits &Set the IC1PSC value */
//  946   TIM2->CCMR2 = (uint8_t)((uint8_t)(TIM2->CCMR2 & (uint8_t)(~TIM2_CCMR_ICxPSC))
//  947                           | (uint8_t)TIM2_IC2Prescaler);
??TIM2_SetIC2Prescaler_0:
        LD        A, L:0x5308
        AND       A, #0xf3
        OR        A, S:?b8
        LD        L:0x5308, A
//  948 }
        POP       S:?b8
        RET
//  949 
//  950 /**
//  951   * @brief  Sets the TIM2 Input Capture 3 prescaler.
//  952   * @param   TIM2_IC3Prescaler specifies the Input Capture prescaler new value
//  953   * This parameter can be one of the following values:
//  954   *                       - TIM2_ICPSC_DIV1: no prescaler
//  955   *                       - TIM2_ICPSC_DIV2: capture is done once every 2 events
//  956   *                       - TIM2_ICPSC_DIV4: capture is done once every 4 events
//  957   *                       - TIM2_ICPSC_DIV8: capture is done once every 8 events
//  958   * @retval None
//  959   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  960 void TIM2_SetIC3Prescaler(TIM2_ICPSC_TypeDef TIM2_IC3Prescaler)
//  961 {
TIM2_SetIC3Prescaler:
        PUSH      S:?b8
        LD        S:?b8, A
//  962   
//  963   /* Check the parameters */
//  964   assert_param(IS_TIM2_IC_PRESCALER_OK(TIM2_IC3Prescaler));
        TNZ       S:?b8
        JREQ      L:??TIM2_SetIC3Prescaler_0
        LD        A, S:?b8
        CP        A, #0x4
        JREQ      L:??TIM2_SetIC3Prescaler_0
        LD        A, S:?b8
        CP        A, #0x8
        JREQ      L:??TIM2_SetIC3Prescaler_0
        LD        A, S:?b8
        CP        A, #0xc
        JREQ      L:??TIM2_SetIC3Prescaler_0
        LDW       X, #0x3c4
        LDW       S:?w1, X
        CLRW      X
        LDW       S:?w0, X
        LDW       X, #`?<Constant "C:\\\\Users\\\\lun55\\\\Deskto...">`
        CALL      L:assert_failed
//  965   /* Reset the IC1PSC Bits &Set the IC1PSC value */
//  966   TIM2->CCMR3 = (uint8_t)((uint8_t)(TIM2->CCMR3 & (uint8_t)(~TIM2_CCMR_ICxPSC))
//  967                           | (uint8_t)TIM2_IC3Prescaler);
??TIM2_SetIC3Prescaler_0:
        LD        A, L:0x5309
        AND       A, #0xf3
        OR        A, S:?b8
        LD        L:0x5309, A
//  968 }
        POP       S:?b8
        RET
//  969 
//  970 /**
//  971   * @brief  Gets the TIM2 Input Capture 1 value.
//  972   * @param  None
//  973   * @retval Capture Compare 1 Register value.
//  974   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  975 uint16_t TIM2_GetCapture1(void)
//  976 {
//  977   /* Get the Capture 1 Register value */
//  978   uint16_t tmpccr1 = 0;
TIM2_GetCapture1:
        CLRW      Y
//  979   uint8_t tmpccr1l=0, tmpccr1h=0;
        CLR       S:?b1
        CLR       S:?b0
//  980   
//  981   tmpccr1h = TIM2->CCR1H;
        LD        A, L:0x5311
        LD        S:?b0, A
//  982   tmpccr1l = TIM2->CCR1L;
        LD        A, L:0x5312
        LD        S:?b1, A
//  983   
//  984   tmpccr1 = (uint16_t)(tmpccr1l);
        CLRW      X
        EXG       A, XL
        LD        A, S:?b1
        EXG       A, XL
        LDW       Y, X
//  985   tmpccr1 |= (uint16_t)((uint16_t)tmpccr1h << 8);
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
//  986   /* Get the Capture 1 Register value */
//  987   return (uint16_t)tmpccr1;
        LDW       X, Y
        RET
//  988 }
//  989 
//  990 /**
//  991   * @brief  Gets the TIM2 Input Capture 2 value.
//  992   * @param  None
//  993   * @retval Capture Compare 2 Register value.
//  994   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  995 uint16_t TIM2_GetCapture2(void)
//  996 {
//  997   /* Get the Capture 2 Register value */
//  998   uint16_t tmpccr2 = 0;
TIM2_GetCapture2:
        CLRW      Y
//  999   uint8_t tmpccr2l=0, tmpccr2h=0;
        CLR       S:?b1
        CLR       S:?b0
// 1000   
// 1001   tmpccr2h = TIM2->CCR2H;
        LD        A, L:0x5313
        LD        S:?b0, A
// 1002   tmpccr2l = TIM2->CCR2L;
        LD        A, L:0x5314
        LD        S:?b1, A
// 1003   
// 1004   tmpccr2 = (uint16_t)(tmpccr2l);
        CLRW      X
        EXG       A, XL
        LD        A, S:?b1
        EXG       A, XL
        LDW       Y, X
// 1005   tmpccr2 |= (uint16_t)((uint16_t)tmpccr2h << 8);
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
// 1006   /* Get the Capture 2 Register value */
// 1007   return (uint16_t)tmpccr2;
        LDW       X, Y
        RET
// 1008 }
// 1009 
// 1010 /**
// 1011   * @brief  Gets the TIM2 Input Capture 3 value.
// 1012   * @param  None
// 1013   * @retval Capture Compare 3 Register value.
// 1014   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
// 1015 uint16_t TIM2_GetCapture3(void)
// 1016 {
// 1017   /* Get the Capture 3 Register value */
// 1018   uint16_t tmpccr3 = 0;
TIM2_GetCapture3:
        CLRW      Y
// 1019   uint8_t tmpccr3l=0, tmpccr3h=0;
        CLR       S:?b1
        CLR       S:?b0
// 1020   
// 1021   tmpccr3h = TIM2->CCR3H;
        LD        A, L:0x5315
        LD        S:?b0, A
// 1022   tmpccr3l = TIM2->CCR3L;
        LD        A, L:0x5316
        LD        S:?b1, A
// 1023   
// 1024   tmpccr3 = (uint16_t)(tmpccr3l);
        CLRW      X
        EXG       A, XL
        LD        A, S:?b1
        EXG       A, XL
        LDW       Y, X
// 1025   tmpccr3 |= (uint16_t)((uint16_t)tmpccr3h << 8);
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
// 1026   /* Get the Capture 3 Register value */
// 1027   return (uint16_t)tmpccr3;
        LDW       X, Y
        RET
// 1028 }
// 1029 
// 1030 /**
// 1031   * @brief  Gets the TIM2 Counter value.
// 1032   * @param  None
// 1033   * @retval Counter Register value.
// 1034   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
// 1035 uint16_t TIM2_GetCounter(void)
// 1036 {
// 1037   uint16_t tmpcntr = 0;
TIM2_GetCounter:
        CLRW      Y
// 1038   
// 1039   tmpcntr =  ((uint16_t)TIM2->CNTRH << 8);
        LD        A, L:0x530c
        CLRW      X
        LD        XL, A
        CLR       A
        RLWA      X, A
        LDW       Y, X
// 1040   /* Get the Counter Register value */
// 1041   return (uint16_t)( tmpcntr| (uint16_t)(TIM2->CNTRL));
        LD        A, L:0x530d
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
// 1042 }
// 1043 
// 1044 /**
// 1045   * @brief  Gets the TIM2 Prescaler value.
// 1046   * @param  None
// 1047   * @retval Prescaler Register configuration value  @ref TIM2_Prescaler_TypeDef.
// 1048   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
// 1049 TIM2_Prescaler_TypeDef TIM2_GetPrescaler(void)
// 1050 {
// 1051   /* Get the Prescaler Register value */
// 1052   return (TIM2_Prescaler_TypeDef)(TIM2->PSCR);
TIM2_GetPrescaler:
        LD        A, L:0x530e
        RET
// 1053 }
// 1054 
// 1055 /**
// 1056   * @brief  Checks whether the specified TIM2 flag is set or not.
// 1057   * @param   TIM2_FLAG specifies the flag to check.
// 1058   * This parameter can be one of the following values:
// 1059   *                       - TIM2_FLAG_UPDATE: TIM2 update Flag
// 1060   *                       - TIM2_FLAG_CC1: TIM2 Capture Compare 1 Flag
// 1061   *                       - TIM2_FLAG_CC2: TIM2 Capture Compare 2 Flag
// 1062   *                       - TIM2_FLAG_CC3: TIM2 Capture Compare 3 Flag
// 1063   *                       - TIM2_FLAG_CC1OF: TIM2 Capture Compare 1 over capture Flag
// 1064   *                       - TIM2_FLAG_CC2OF: TIM2 Capture Compare 2 over capture Flag
// 1065   *                       - TIM2_FLAG_CC3OF: TIM2 Capture Compare 3 over capture Flag
// 1066   * @retval FlagStatus The new state of TIM2_FLAG (SET or RESET).
// 1067   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
// 1068 FlagStatus TIM2_GetFlagStatus(TIM2_FLAG_TypeDef TIM2_FLAG)
// 1069 {
TIM2_GetFlagStatus:
        CALL      L:?push_w4
        LDW       S:?w4, X
// 1070   FlagStatus bitstatus = RESET;
        CLR       S:?b0
// 1071   uint8_t tim2_flag_l = 0, tim2_flag_h = 0;
        CLR       S:?b1
        CLR       A
// 1072   
// 1073   /* Check the parameters */
// 1074   assert_param(IS_TIM2_GET_FLAG_OK(TIM2_FLAG));
        LDW       X, S:?w4
        CPW       X, #0x1
        JREQ      L:??TIM2_GetFlagStatus_0
        LDW       X, S:?w4
        CPW       X, #0x2
        JREQ      L:??TIM2_GetFlagStatus_0
        LDW       X, S:?w4
        CPW       X, #0x4
        JREQ      L:??TIM2_GetFlagStatus_0
        LDW       X, S:?w4
        CPW       X, #0x8
        JREQ      L:??TIM2_GetFlagStatus_0
        LDW       X, S:?w4
        CPW       X, #0x200
        JREQ      L:??TIM2_GetFlagStatus_0
        LDW       X, S:?w4
        CPW       X, #0x400
        JREQ      L:??TIM2_GetFlagStatus_0
        LDW       X, S:?w4
        CPW       X, #0x800
        JREQ      L:??TIM2_GetFlagStatus_0
        LDW       X, #0x432
        LDW       S:?w1, X
        CLRW      X
        LDW       S:?w0, X
        LDW       X, #`?<Constant "C:\\\\Users\\\\lun55\\\\Deskto...">`
        CALL      L:assert_failed
// 1075   
// 1076   tim2_flag_l = (uint8_t)(TIM2->SR1 & (uint8_t)TIM2_FLAG);
??TIM2_GetFlagStatus_0:
        LD        A, S:?b9
        AND       A, L:0x5304
        LD        S:?b1, A
// 1077   tim2_flag_h = (uint8_t)((uint16_t)TIM2_FLAG >> 8);
        LDW       X, S:?w4
        CLR       A
        RRWA      X, A
        LD        A, XL
// 1078   
// 1079   if ((tim2_flag_l | (uint8_t)(TIM2->SR2 & tim2_flag_h)) != (uint8_t)RESET )
        AND       A, L:0x5305
        OR        A, S:?b1
        CP        A, #0x0
        JREQ      L:??TIM2_GetFlagStatus_1
// 1080   {
// 1081     bitstatus = SET;
        MOV       S:?b0, #0x1
        JRA       L:??TIM2_GetFlagStatus_2
// 1082   }
// 1083   else
// 1084   {
// 1085     bitstatus = RESET;
??TIM2_GetFlagStatus_1:
        CLR       S:?b0
// 1086   }
// 1087   return (FlagStatus)bitstatus;
??TIM2_GetFlagStatus_2:
        LD        A, S:?b0
        JP        L:?epilogue_w4
// 1088 }
// 1089 
// 1090 /**
// 1091   * @brief  Clears the TIM2’s pending flags.
// 1092   * @param   TIM2_FLAG specifies the flag to clear.
// 1093   * This parameter can be one of the following values:
// 1094   *                       - TIM2_FLAG_UPDATE: TIM2 update Flag
// 1095   *                       - TIM2_FLAG_CC1: TIM2 Capture Compare 1 Flag
// 1096   *                       - TIM2_FLAG_CC2: TIM2 Capture Compare 2 Flag
// 1097   *                       - TIM2_FLAG_CC3: TIM2 Capture Compare 3 Flag
// 1098   *                       - TIM2_FLAG_CC1OF: TIM2 Capture Compare 1 over capture Flag
// 1099   *                       - TIM2_FLAG_CC2OF: TIM2 Capture Compare 2 over capture Flag
// 1100   *                       - TIM2_FLAG_CC3OF: TIM2 Capture Compare 3 over capture Flag
// 1101   * @retval None.
// 1102   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
// 1103 void TIM2_ClearFlag(TIM2_FLAG_TypeDef TIM2_FLAG)
// 1104 {
TIM2_ClearFlag:
        CALL      L:?push_w4
        LDW       S:?w4, X
// 1105   /* Check the parameters */
// 1106   assert_param(IS_TIM2_CLEAR_FLAG_OK(TIM2_FLAG));
        LDW       X, S:?w4
        CALL      L:?and16_x_x_dw
        DATA
        DC16      0xf1f0
        CODE
        TNZW      X
        JRNE      L:??TIM2_ClearFlag_0
        LDW       X, S:?w4
        TNZW      X
        JRNE      L:??TIM2_ClearFlag_1
??TIM2_ClearFlag_0:
        LDW       X, #0x452
        LDW       S:?w1, X
        CLRW      X
        LDW       S:?w0, X
        LDW       X, #`?<Constant "C:\\\\Users\\\\lun55\\\\Deskto...">`
        CALL      L:assert_failed
// 1107   
// 1108   /* Clear the flags (rc_w0) clear this bit by writing 0. Writing ‘1’ has no effect*/
// 1109   TIM2->SR1 = (uint8_t)(~((uint8_t)(TIM2_FLAG)));
??TIM2_ClearFlag_1:
        LD        A, S:?b9
        CPL       A
        LD        L:0x5304, A
// 1110   TIM2->SR2 = (uint8_t)(~((uint8_t)((uint8_t)TIM2_FLAG >> 8)));
        MOV       L:0x5305, #0xff
// 1111 }
        JP        L:?epilogue_w4
// 1112 
// 1113 /**
// 1114   * @brief  Checks whether the TIM2 interrupt has occurred or not.
// 1115   * @param   TIM2_IT specifies the TIM2 interrupt source to check.
// 1116   * This parameter can be one of the following values:
// 1117   *                       - TIM2_IT_UPDATE: TIM2 update Interrupt source
// 1118   *                       - TIM2_IT_CC1: TIM2 Capture Compare 1 Interrupt source
// 1119   *                       - TIM2_IT_CC2: TIM2 Capture Compare 2 Interrupt source
// 1120   *                       - TIM2_IT_CC3: TIM2 Capture Compare 3 Interrupt source
// 1121   * @retval ITStatus The new state of the TIM2_IT(SET or RESET).
// 1122   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
// 1123 ITStatus TIM2_GetITStatus(TIM2_IT_TypeDef TIM2_IT)
// 1124 {
TIM2_GetITStatus:
        PUSH      S:?b8
        LD        S:?b8, A
// 1125   ITStatus bitstatus = RESET;
        CLR       S:?b0
// 1126   uint8_t TIM2_itStatus = 0, TIM2_itEnable = 0;
        CLR       S:?b2
        CLR       S:?b1
// 1127   
// 1128   /* Check the parameters */
// 1129   assert_param(IS_TIM2_GET_IT_OK(TIM2_IT));
        LD        A, S:?b8
        CP        A, #0x1
        JREQ      L:??TIM2_GetITStatus_0
        LD        A, S:?b8
        CP        A, #0x2
        JREQ      L:??TIM2_GetITStatus_0
        LD        A, S:?b8
        CP        A, #0x4
        JREQ      L:??TIM2_GetITStatus_0
        LD        A, S:?b8
        CP        A, #0x8
        JREQ      L:??TIM2_GetITStatus_0
        LDW       X, #0x469
        LDW       S:?w1, X
        CLRW      X
        LDW       S:?w0, X
        LDW       X, #`?<Constant "C:\\\\Users\\\\lun55\\\\Deskto...">`
        CALL      L:assert_failed
// 1130   
// 1131   TIM2_itStatus = (uint8_t)(TIM2->SR1 & TIM2_IT);
??TIM2_GetITStatus_0:
        LD        A, S:?b8
        AND       A, L:0x5304
        LD        S:?b2, A
// 1132   
// 1133   TIM2_itEnable = (uint8_t)(TIM2->IER & TIM2_IT);
        LD        A, S:?b8
        AND       A, L:0x5303
        LD        S:?b1, A
// 1134   
// 1135   if ((TIM2_itStatus != (uint8_t)RESET ) && (TIM2_itEnable != (uint8_t)RESET ))
        TNZ       S:?b2
        JREQ      L:??TIM2_GetITStatus_1
        TNZ       S:?b1
        JREQ      L:??TIM2_GetITStatus_1
// 1136   {
// 1137     bitstatus = SET;
        MOV       S:?b0, #0x1
        JRA       L:??TIM2_GetITStatus_2
// 1138   }
// 1139   else
// 1140   {
// 1141     bitstatus = RESET;
??TIM2_GetITStatus_1:
        CLR       S:?b0
// 1142   }
// 1143   return (ITStatus)(bitstatus);
??TIM2_GetITStatus_2:
        LD        A, S:?b0
        POP       S:?b8
        RET
// 1144 }
// 1145 
// 1146 /**
// 1147   * @brief  Clears the TIM2's interrupt pending bits.
// 1148   * @param   TIM2_IT specifies the pending bit to clear.
// 1149   * This parameter can be one of the following values:
// 1150   *                       - TIM2_IT_UPDATE: TIM2 update Interrupt source
// 1151   *                       - TIM2_IT_CC1: TIM2 Capture Compare 1 Interrupt source
// 1152   *                       - TIM2_IT_CC2: TIM2 Capture Compare 2 Interrupt source
// 1153   *                       - TIM2_IT_CC3: TIM2 Capture Compare 3 Interrupt source
// 1154   * @retval None.
// 1155   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
// 1156 void TIM2_ClearITPendingBit(TIM2_IT_TypeDef TIM2_IT)
// 1157 {
TIM2_ClearITPendingBit:
        PUSH      S:?b8
        LD        S:?b8, A
// 1158   /* Check the parameters */
// 1159   assert_param(IS_TIM2_IT_OK(TIM2_IT));
        TNZ       S:?b8
        JREQ      L:??TIM2_ClearITPendingBit_0
        LD        A, S:?b8
        CP        A, #0x10
        JRC       L:??TIM2_ClearITPendingBit_1
??TIM2_ClearITPendingBit_0:
        LDW       X, #0x487
        LDW       S:?w1, X
        CLRW      X
        LDW       S:?w0, X
        LDW       X, #`?<Constant "C:\\\\Users\\\\lun55\\\\Deskto...">`
        CALL      L:assert_failed
// 1160   
// 1161   /* Clear the IT pending Bit */
// 1162   TIM2->SR1 = (uint8_t)(~TIM2_IT);
??TIM2_ClearITPendingBit_1:
        CPL       S:?b8
        LD        A, S:?b8
        LD        L:0x5304, A
// 1163 }
        POP       S:?b8
        RET
// 1164 
// 1165 /**
// 1166   * @brief  Configure the TI1 as Input.
// 1167   * @param   TIM2_ICPolarity  The Input Polarity.
// 1168   * This parameter can be one of the following values:
// 1169   *                       - TIM2_ICPOLARITY_FALLING
// 1170   *                       - TIM2_ICPOLARITY_RISING
// 1171   * @param   TIM2_ICSelection specifies the input to be used.
// 1172   * This parameter can be one of the following values:
// 1173   *                       - TIM2_ICSELECTION_DIRECTTI: TIM2 Input 1 is selected to
// 1174   *                         be connected to IC1.
// 1175   *                       - TIM2_ICSELECTION_INDIRECTTI: TIM2 Input 1 is selected to
// 1176   *                         be connected to IC2.
// 1177   * @param   TIM2_ICFilter Specifies the Input Capture Filter.
// 1178   * This parameter must be a value between 0x00 and 0x0F.
// 1179   * @retval None
// 1180   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
// 1181 static void TI1_Config(uint8_t TIM2_ICPolarity,
// 1182                        uint8_t TIM2_ICSelection,
// 1183                        uint8_t TIM2_ICFilter)
// 1184 {
TI1_Config:
        LD        S:?b2, A
        LD        A, S:?b1
// 1185   /* Disable the Channel 1: Reset the CCE Bit */
// 1186   TIM2->CCER1 &= (uint8_t)(~TIM2_CCER1_CC1E);
        BRES      L:0x530a, #0x0
// 1187   
// 1188   /* Select the Input and set the filter */
// 1189   TIM2->CCMR1  = (uint8_t)((uint8_t)(TIM2->CCMR1 & (uint8_t)(~(uint8_t)( TIM2_CCMR_CCxS | TIM2_CCMR_ICxF )))
// 1190                            | (uint8_t)(((TIM2_ICSelection)) | ((uint8_t)( TIM2_ICFilter << 4))));
        SWAP      A
        AND       A, #0xf0
        OR        A, S:?b0
        PUSH      A
        LD        A, L:0x5307
        AND       A, #0xc
        LD        S:?b1, A
        POP       A
        OR        A, S:?b1
        LD        L:0x5307, A
// 1191   
// 1192   /* Select the Polarity */
// 1193   if (TIM2_ICPolarity != TIM2_ICPOLARITY_RISING)
        TNZ       S:?b2
        JREQ      L:??TI1_Config_0
// 1194   {
// 1195     TIM2->CCER1 |= TIM2_CCER1_CC1P;
        BSET      L:0x530a, #0x1
        JRA       L:??TI1_Config_1
// 1196   }
// 1197   else
// 1198   {
// 1199     TIM2->CCER1 &= (uint8_t)(~TIM2_CCER1_CC1P);
??TI1_Config_0:
        BRES      L:0x530a, #0x1
// 1200   }
// 1201   /* Set the CCE Bit */
// 1202   TIM2->CCER1 |= TIM2_CCER1_CC1E;
??TI1_Config_1:
        BSET      L:0x530a, #0x0
// 1203 }
        RET
// 1204 
// 1205 /**
// 1206   * @brief  Configure the TI2 as Input.
// 1207   * @param   TIM2_ICPolarity  The Input Polarity.
// 1208   * This parameter can be one of the following values:
// 1209   *                       - TIM2_ICPOLARITY_FALLING
// 1210   *                       - TIM2_ICPOLARITY_RISING
// 1211   * @param   TIM2_ICSelection specifies the input to be used.
// 1212   * This parameter can be one of the following values:
// 1213   *                       - TIM2_ICSELECTION_DIRECTTI: TIM2 Input 2 is selected to
// 1214   *                         be connected to IC2.
// 1215   *                       - TIM2_ICSELECTION_INDIRECTTI: TIM2 Input 2 is selected to
// 1216   *                         be connected to IC1.
// 1217   * @param   TIM2_ICFilter Specifies the Input Capture Filter.
// 1218   * This parameter must be a value between 0x00 and 0x0F.
// 1219   * @retval None
// 1220   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
// 1221 static void TI2_Config(uint8_t TIM2_ICPolarity,
// 1222                        uint8_t TIM2_ICSelection,
// 1223                        uint8_t TIM2_ICFilter)
// 1224 {
TI2_Config:
        LD        S:?b2, A
        LD        A, S:?b1
// 1225   /* Disable the Channel 2: Reset the CCE Bit */
// 1226   TIM2->CCER1 &= (uint8_t)(~TIM2_CCER1_CC2E);
        BRES      L:0x530a, #0x4
// 1227   
// 1228   /* Select the Input and set the filter */
// 1229   TIM2->CCMR2 = (uint8_t)((uint8_t)(TIM2->CCMR2 & (uint8_t)(~(uint8_t)( TIM2_CCMR_CCxS | TIM2_CCMR_ICxF ))) 
// 1230                           | (uint8_t)(( (TIM2_ICSelection)) | ((uint8_t)( TIM2_ICFilter << 4))));
        SWAP      A
        AND       A, #0xf0
        OR        A, S:?b0
        PUSH      A
        LD        A, L:0x5308
        AND       A, #0xc
        LD        S:?b1, A
        POP       A
        OR        A, S:?b1
        LD        L:0x5308, A
// 1231   
// 1232   
// 1233   /* Select the Polarity */
// 1234   if (TIM2_ICPolarity != TIM2_ICPOLARITY_RISING)
        TNZ       S:?b2
        JREQ      L:??TI2_Config_0
// 1235   {
// 1236     TIM2->CCER1 |= TIM2_CCER1_CC2P;
        BSET      L:0x530a, #0x5
        JRA       L:??TI2_Config_1
// 1237   }
// 1238   else
// 1239   {
// 1240     TIM2->CCER1 &= (uint8_t)(~TIM2_CCER1_CC2P);
??TI2_Config_0:
        BRES      L:0x530a, #0x5
// 1241   }
// 1242   
// 1243   /* Set the CCE Bit */
// 1244   TIM2->CCER1 |= TIM2_CCER1_CC2E;
??TI2_Config_1:
        BSET      L:0x530a, #0x4
// 1245 }
        RET
// 1246 
// 1247 /**
// 1248   * @brief  Configure the TI3 as Input.
// 1249   * @param   TIM2_ICPolarity  The Input Polarity.
// 1250   * This parameter can be one of the following values:
// 1251   *                       - TIM2_ICPOLARITY_FALLING
// 1252   *                       - TIM2_ICPOLARITY_RISING
// 1253   * @param   TIM2_ICSelection specifies the input to be used.
// 1254   * This parameter can be one of the following values:
// 1255   *                       - TIM2_ICSELECTION_DIRECTTI: TIM2 Input 3 is selected to
// 1256   *                         be connected to IC3.
// 1257   * @param   TIM2_ICFilter Specifies the Input Capture Filter.
// 1258   * This parameter must be a value between 0x00 and 0x0F.
// 1259   * @retval None
// 1260   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
// 1261 static void TI3_Config(uint8_t TIM2_ICPolarity, uint8_t TIM2_ICSelection,
// 1262                        uint8_t TIM2_ICFilter)
// 1263 {
TI3_Config:
        LD        S:?b2, A
        LD        A, S:?b1
// 1264   /* Disable the Channel 3: Reset the CCE Bit */
// 1265   TIM2->CCER2 &=  (uint8_t)(~TIM2_CCER2_CC3E);
        BRES      L:0x530b, #0x0
// 1266   
// 1267   /* Select the Input and set the filter */
// 1268   TIM2->CCMR3 = (uint8_t)((uint8_t)(TIM2->CCMR3 & (uint8_t)(~( TIM2_CCMR_CCxS | TIM2_CCMR_ICxF))) 
// 1269                           | (uint8_t)(( (TIM2_ICSelection)) | ((uint8_t)( TIM2_ICFilter << 4))));
        SWAP      A
        AND       A, #0xf0
        OR        A, S:?b0
        PUSH      A
        LD        A, L:0x5309
        AND       A, #0xc
        LD        S:?b1, A
        POP       A
        OR        A, S:?b1
        LD        L:0x5309, A
// 1270   
// 1271   
// 1272   /* Select the Polarity */
// 1273   if (TIM2_ICPolarity != TIM2_ICPOLARITY_RISING)
        TNZ       S:?b2
        JREQ      L:??TI3_Config_0
// 1274   {
// 1275     TIM2->CCER2 |= TIM2_CCER2_CC3P;
        BSET      L:0x530b, #0x1
        JRA       L:??TI3_Config_1
// 1276   }
// 1277   else
// 1278   {
// 1279     TIM2->CCER2 &= (uint8_t)(~TIM2_CCER2_CC3P);
??TI3_Config_0:
        BRES      L:0x530b, #0x1
// 1280   }
// 1281   /* Set the CCE Bit */
// 1282   TIM2->CCER2 |= TIM2_CCER2_CC3E;
??TI3_Config_1:
        BSET      L:0x530b, #0x0
// 1283 }
        RET

        SECTION VREGS:DATA:REORDER:NOROOT(0)

        SECTION `.near.rodata`:CONST:REORDER:NOROOT(0)
`?<Constant "C:\\\\Users\\\\lun55\\\\Deskto...">`:
        DC8 "C:\\Users\\lun55\\Desktop\\J19B_STM8\\Lib\\stm8s_tim2.c"

        END
// 1284 
// 1285 /**
// 1286   * @}
// 1287   */
// 1288   
// 1289   /**
// 1290   * @}
// 1291   */
// 1292 
// 1293 
// 1294 /************************ (C) COPYRIGHT STMicroelectronics *****END OF FILE****/
// 
//    50 bytes in section .near.rodata
// 3 136 bytes in section .near_func.text
// 
// 3 136 bytes of CODE  memory
//    50 bytes of CONST memory
//
//Errors: none
//Warnings: none
