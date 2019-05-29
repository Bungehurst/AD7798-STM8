///////////////////////////////////////////////////////////////////////////////
//                                                                            /
//                                                      11/Mar/2019  20:52:11 /
// IAR C/C++ Compiler V1.31.1.20058 [Evaluation] for STM8                     /
// Copyright 2010-2012 IAR Systems AB.                                        /
//                                                                            /
//    Source file  =  C:\Users\lun55\Desktop\J19B_STM8\Lib\stm8s_tim4.c       /
//    Command line =  C:\Users\lun55\Desktop\J19B_STM8\Lib\stm8s_tim4.c -e    /
//                    -Ol --no_cse --no_unroll --no_inline --no_code_motion   /
//                    --no_tbaa --no_cross_call --debug --code_model small    /
//                    --data_model medium -o C:\Users\lun55\Desktop\J19B_STM8 /
//                    \Debug\Obj\ --dlib_config "D:\Program Files (x86)\IAR   /
//                    Systems\Embedded Workbench 6.0                          /
//                    Evaluation\stm8\LIB\dlstm8smf.h" -lcN                   /
//                    C:\Users\lun55\Desktop\J19B_STM8\Debug\List\ -lB        /
//                    C:\Users\lun55\Desktop\J19B_STM8\Debug\List\ --vregs 16 /
//    List file    =  C:\Users\lun55\Desktop\J19B_STM8\Debug\List\stm8s_tim4. /
//                    s                                                       /
//                                                                            /
//                                                                            /
///////////////////////////////////////////////////////////////////////////////

        NAME stm8s_tim4

        EXTERN ?b0
        EXTERN ?b1
        EXTERN ?b2
        EXTERN ?b8
        EXTERN ?b9
        EXTERN ?epilogue_w4
        EXTERN ?push_w4
        EXTERN ?w0
        EXTERN ?w1
        EXTERN assert_failed

        PUBLIC TIM4_ARRPreloadConfig
        PUBLIC TIM4_ClearFlag
        PUBLIC TIM4_ClearITPendingBit
        PUBLIC TIM4_Cmd
        PUBLIC TIM4_DeInit
        PUBLIC TIM4_GenerateEvent
        PUBLIC TIM4_GetCounter
        PUBLIC TIM4_GetFlagStatus
        PUBLIC TIM4_GetITStatus
        PUBLIC TIM4_GetPrescaler
        PUBLIC TIM4_ITConfig
        PUBLIC TIM4_PrescalerConfig
        PUBLIC TIM4_SelectOnePulseMode
        PUBLIC TIM4_SetAutoreload
        PUBLIC TIM4_SetCounter
        PUBLIC TIM4_TimeBaseInit
        PUBLIC TIM4_UpdateDisableConfig
        PUBLIC TIM4_UpdateRequestConfig

// C:\Users\lun55\Desktop\J19B_STM8\Lib\stm8s_tim4.c
//    1 /**
//    2   ******************************************************************************
//    3   * @file    stm8s_tim4.c
//    4   * @author  MCD Application Team
//    5   * @version V2.2.0
//    6   * @date    30-September-2014
//    7   * @brief   This file contains all the functions for the TIM4 peripheral.
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
//   29 #include "stm8s_tim4.h"
//   30 
//   31 /** @addtogroup STM8S_StdPeriph_Driver
//   32   * @{
//   33   */
//   34 /* Private typedef -----------------------------------------------------------*/
//   35 /* Private define ------------------------------------------------------------*/
//   36 /* Private macro -------------------------------------------------------------*/
//   37 /* Private variables ---------------------------------------------------------*/
//   38 /* Private function prototypes -----------------------------------------------*/
//   39 /**
//   40   * @addtogroup TIM4_Public_Functions
//   41   * @{
//   42   */
//   43 
//   44 /**
//   45   * @brief  Deinitializes the TIM4 peripheral registers to their default reset values.
//   46   * @param  None
//   47   * @retval None
//   48   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//   49 void TIM4_DeInit(void)
//   50 {
//   51   TIM4->CR1 = TIM4_CR1_RESET_VALUE;
TIM4_DeInit:
        MOV       L:0x5340, #0x0
//   52   TIM4->IER = TIM4_IER_RESET_VALUE;
        MOV       L:0x5343, #0x0
//   53   TIM4->CNTR = TIM4_CNTR_RESET_VALUE;
        MOV       L:0x5346, #0x0
//   54   TIM4->PSCR = TIM4_PSCR_RESET_VALUE;
        MOV       L:0x5347, #0x0
//   55   TIM4->ARR = TIM4_ARR_RESET_VALUE;
        MOV       L:0x5348, #0xff
//   56   TIM4->SR1 = TIM4_SR1_RESET_VALUE;
        MOV       L:0x5344, #0x0
//   57 }
        RET
//   58 
//   59 /**
//   60   * @brief  Initializes the TIM4 Time Base Unit according to the specified parameters.
//   61   * @param    TIM4_Prescaler specifies the Prescaler from TIM4_Prescaler_TypeDef.
//   62   * @param    TIM4_Period specifies the Period value.
//   63   * @retval None
//   64   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//   65 void TIM4_TimeBaseInit(TIM4_Prescaler_TypeDef TIM4_Prescaler, uint8_t TIM4_Period)
//   66 {
TIM4_TimeBaseInit:
        CALL      L:?push_w4
        LD        S:?b9, A
        MOV       S:?b8, S:?b0
//   67   /* Check TIM4 prescaler value */
//   68   assert_param(IS_TIM4_PRESCALER_OK(TIM4_Prescaler));
        TNZ       S:?b9
        JREQ      L:??TIM4_TimeBaseInit_0
        LD        A, S:?b9
        CP        A, #0x1
        JREQ      L:??TIM4_TimeBaseInit_0
        LD        A, S:?b9
        CP        A, #0x2
        JREQ      L:??TIM4_TimeBaseInit_0
        LD        A, S:?b9
        CP        A, #0x3
        JREQ      L:??TIM4_TimeBaseInit_0
        LD        A, S:?b9
        CP        A, #0x4
        JREQ      L:??TIM4_TimeBaseInit_0
        LD        A, S:?b9
        CP        A, #0x5
        JREQ      L:??TIM4_TimeBaseInit_0
        LD        A, S:?b9
        CP        A, #0x6
        JREQ      L:??TIM4_TimeBaseInit_0
        LD        A, S:?b9
        CP        A, #0x7
        JREQ      L:??TIM4_TimeBaseInit_0
        LDW       X, #0x44
        LDW       S:?w1, X
        CLRW      X
        LDW       S:?w0, X
        LDW       X, #`?<Constant "C:\\\\Users\\\\lun55\\\\Deskto...">`
        CALL      L:assert_failed
//   69   /* Set the Prescaler value */
//   70   TIM4->PSCR = (uint8_t)(TIM4_Prescaler);
??TIM4_TimeBaseInit_0:
        LD        A, S:?b9
        LD        L:0x5347, A
//   71   /* Set the Autoreload value */
//   72   TIM4->ARR = (uint8_t)(TIM4_Period);
        LD        A, S:?b8
        LD        L:0x5348, A
//   73 }
        JP        L:?epilogue_w4
//   74 
//   75 /**
//   76   * @brief  Enables or disables the TIM4 peripheral.
//   77   * @param   NewState new state of the TIM4 peripheral. This parameter can
//   78   * be ENABLE or DISABLE.
//   79   * @retval None
//   80   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//   81 void TIM4_Cmd(FunctionalState NewState)
//   82 {
TIM4_Cmd:
        PUSH      S:?b8
        LD        S:?b8, A
//   83   /* Check the parameters */
//   84   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
        TNZ       S:?b8
        JREQ      L:??TIM4_Cmd_0
        LD        A, S:?b8
        CP        A, #0x1
        JREQ      L:??TIM4_Cmd_0
        LDW       X, #0x54
        LDW       S:?w1, X
        CLRW      X
        LDW       S:?w0, X
        LDW       X, #`?<Constant "C:\\\\Users\\\\lun55\\\\Deskto...">`
        CALL      L:assert_failed
//   85   
//   86   /* set or Reset the CEN Bit */
//   87   if (NewState != DISABLE)
??TIM4_Cmd_0:
        TNZ       S:?b8
        JREQ      L:??TIM4_Cmd_1
//   88   {
//   89     TIM4->CR1 |= TIM4_CR1_CEN;
        BSET      L:0x5340, #0x0
        JRA       L:??TIM4_Cmd_2
//   90   }
//   91   else
//   92   {
//   93     TIM4->CR1 &= (uint8_t)(~TIM4_CR1_CEN);
??TIM4_Cmd_1:
        BRES      L:0x5340, #0x0
//   94   }
//   95 }
??TIM4_Cmd_2:
        POP       S:?b8
        RET
//   96 
//   97 /**
//   98   * @brief  Enables or disables the specified TIM4 interrupts.
//   99   * @param   NewState new state of the TIM4 peripheral.
//  100   * This parameter can be: ENABLE or DISABLE.
//  101   * @param   TIM4_IT specifies the TIM4 interrupts sources to be enabled or disabled.
//  102   * This parameter can be any combination of the following values:
//  103   * - TIM4_IT_UPDATE: TIM4 update Interrupt source
//  104   * @param   NewState new state of the TIM4 peripheral.
//  105   * @retval None
//  106   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  107 void TIM4_ITConfig(TIM4_IT_TypeDef TIM4_IT, FunctionalState NewState)
//  108 {
TIM4_ITConfig:
        CALL      L:?push_w4
        LD        S:?b8, A
        MOV       S:?b9, S:?b0
//  109   /* Check the parameters */
//  110   assert_param(IS_TIM4_IT_OK(TIM4_IT));
        LD        A, S:?b8
        CP        A, #0x1
        JREQ      L:??TIM4_ITConfig_0
        LDW       X, #0x6e
        LDW       S:?w1, X
        CLRW      X
        LDW       S:?w0, X
        LDW       X, #`?<Constant "C:\\\\Users\\\\lun55\\\\Deskto...">`
        CALL      L:assert_failed
//  111   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
??TIM4_ITConfig_0:
        TNZ       S:?b9
        JREQ      L:??TIM4_ITConfig_1
        LD        A, S:?b9
        CP        A, #0x1
        JREQ      L:??TIM4_ITConfig_1
        LDW       X, #0x6f
        LDW       S:?w1, X
        CLRW      X
        LDW       S:?w0, X
        LDW       X, #`?<Constant "C:\\\\Users\\\\lun55\\\\Deskto...">`
        CALL      L:assert_failed
//  112   
//  113   if (NewState != DISABLE)
??TIM4_ITConfig_1:
        TNZ       S:?b9
        JREQ      L:??TIM4_ITConfig_2
//  114   {
//  115     /* Enable the Interrupt sources */
//  116     TIM4->IER |= (uint8_t)TIM4_IT;
        LD        A, S:?b8
        OR        A, L:0x5343
        LD        L:0x5343, A
        JP        L:?epilogue_w4
//  117   }
//  118   else
//  119   {
//  120     /* Disable the Interrupt sources */
//  121     TIM4->IER &= (uint8_t)(~TIM4_IT);
??TIM4_ITConfig_2:
        CPL       S:?b8
        LD        A, S:?b8
        AND       A, L:0x5343
        LD        L:0x5343, A
//  122   }
//  123 }
        JP        L:?epilogue_w4
//  124 
//  125 /**
//  126   * @brief  Enables or Disables the TIM4 Update event.
//  127   * @param   NewState new state of the TIM4 peripheral Preload register. This parameter can
//  128   * be ENABLE or DISABLE.
//  129   * @retval None
//  130   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  131 void TIM4_UpdateDisableConfig(FunctionalState NewState)
//  132 {
TIM4_UpdateDisableConfig:
        PUSH      S:?b8
        LD        S:?b8, A
//  133   /* Check the parameters */
//  134   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
        TNZ       S:?b8
        JREQ      L:??TIM4_UpdateDisableConfig_0
        LD        A, S:?b8
        CP        A, #0x1
        JREQ      L:??TIM4_UpdateDisableConfig_0
        LDW       X, #0x86
        LDW       S:?w1, X
        CLRW      X
        LDW       S:?w0, X
        LDW       X, #`?<Constant "C:\\\\Users\\\\lun55\\\\Deskto...">`
        CALL      L:assert_failed
//  135   
//  136   /* Set or Reset the UDIS Bit */
//  137   if (NewState != DISABLE)
??TIM4_UpdateDisableConfig_0:
        TNZ       S:?b8
        JREQ      L:??TIM4_UpdateDisableConfig_1
//  138   {
//  139     TIM4->CR1 |= TIM4_CR1_UDIS;
        BSET      L:0x5340, #0x1
        JRA       L:??TIM4_UpdateDisableConfig_2
//  140   }
//  141   else
//  142   {
//  143     TIM4->CR1 &= (uint8_t)(~TIM4_CR1_UDIS);
??TIM4_UpdateDisableConfig_1:
        BRES      L:0x5340, #0x1
//  144   }
//  145 }
??TIM4_UpdateDisableConfig_2:
        POP       S:?b8
        RET
//  146 
//  147 /**
//  148   * @brief  Selects the TIM4 Update Request Interrupt source.
//  149   * @param   TIM4_UpdateSource specifies the Update source.
//  150   * This parameter can be one of the following values
//  151   *                       - TIM4_UPDATESOURCE_REGULAR
//  152   *                       - TIM4_UPDATESOURCE_GLOBAL
//  153   * @retval None
//  154   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  155 void TIM4_UpdateRequestConfig(TIM4_UpdateSource_TypeDef TIM4_UpdateSource)
//  156 {
TIM4_UpdateRequestConfig:
        PUSH      S:?b8
        LD        S:?b8, A
//  157   /* Check the parameters */
//  158   assert_param(IS_TIM4_UPDATE_SOURCE_OK(TIM4_UpdateSource));
        TNZ       S:?b8
        JREQ      L:??TIM4_UpdateRequestConfig_0
        LD        A, S:?b8
        CP        A, #0x1
        JREQ      L:??TIM4_UpdateRequestConfig_0
        LDW       X, #0x9e
        LDW       S:?w1, X
        CLRW      X
        LDW       S:?w0, X
        LDW       X, #`?<Constant "C:\\\\Users\\\\lun55\\\\Deskto...">`
        CALL      L:assert_failed
//  159   
//  160   /* Set or Reset the URS Bit */
//  161   if (TIM4_UpdateSource != TIM4_UPDATESOURCE_GLOBAL)
??TIM4_UpdateRequestConfig_0:
        TNZ       S:?b8
        JREQ      L:??TIM4_UpdateRequestConfig_1
//  162   {
//  163     TIM4->CR1 |= TIM4_CR1_URS;
        BSET      L:0x5340, #0x2
        JRA       L:??TIM4_UpdateRequestConfig_2
//  164   }
//  165   else
//  166   {
//  167     TIM4->CR1 &= (uint8_t)(~TIM4_CR1_URS);
??TIM4_UpdateRequestConfig_1:
        BRES      L:0x5340, #0x2
//  168   }
//  169 }
??TIM4_UpdateRequestConfig_2:
        POP       S:?b8
        RET
//  170 
//  171 /**
//  172   * @brief  Selects the TIM4’s One Pulse Mode.
//  173   * @param   TIM4_OPMode specifies the OPM Mode to be used.
//  174   * This parameter can be one of the following values
//  175   *                    - TIM4_OPMODE_SINGLE
//  176   *                    - TIM4_OPMODE_REPETITIVE
//  177   * @retval None
//  178   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  179 void TIM4_SelectOnePulseMode(TIM4_OPMode_TypeDef TIM4_OPMode)
//  180 {
TIM4_SelectOnePulseMode:
        PUSH      S:?b8
        LD        S:?b8, A
//  181   /* Check the parameters */
//  182   assert_param(IS_TIM4_OPM_MODE_OK(TIM4_OPMode));
        LD        A, S:?b8
        CP        A, #0x1
        JREQ      L:??TIM4_SelectOnePulseMode_0
        TNZ       S:?b8
        JREQ      L:??TIM4_SelectOnePulseMode_0
        LDW       X, #0xb6
        LDW       S:?w1, X
        CLRW      X
        LDW       S:?w0, X
        LDW       X, #`?<Constant "C:\\\\Users\\\\lun55\\\\Deskto...">`
        CALL      L:assert_failed
//  183   
//  184   /* Set or Reset the OPM Bit */
//  185   if (TIM4_OPMode != TIM4_OPMODE_REPETITIVE)
??TIM4_SelectOnePulseMode_0:
        TNZ       S:?b8
        JREQ      L:??TIM4_SelectOnePulseMode_1
//  186   {
//  187     TIM4->CR1 |= TIM4_CR1_OPM;
        BSET      L:0x5340, #0x3
        JRA       L:??TIM4_SelectOnePulseMode_2
//  188   }
//  189   else
//  190   {
//  191     TIM4->CR1 &= (uint8_t)(~TIM4_CR1_OPM);
??TIM4_SelectOnePulseMode_1:
        BRES      L:0x5340, #0x3
//  192   }
//  193 }
??TIM4_SelectOnePulseMode_2:
        POP       S:?b8
        RET
//  194 
//  195 /**
//  196   * @brief  Configures the TIM4 Prescaler.
//  197   * @param   Prescaler specifies the Prescaler Register value
//  198   * This parameter can be one of the following values
//  199   *                       -  TIM4_PRESCALER_1
//  200   *                       -  TIM4_PRESCALER_2
//  201   *                       -  TIM4_PRESCALER_4
//  202   *                       -  TIM4_PRESCALER_8
//  203   *                       -  TIM4_PRESCALER_16
//  204   *                       -  TIM4_PRESCALER_32
//  205   *                       -  TIM4_PRESCALER_64
//  206   *                       -  TIM4_PRESCALER_128
//  207   * @param   TIM4_PSCReloadMode specifies the TIM4 Prescaler Reload mode.
//  208   * This parameter can be one of the following values
//  209   *                       - TIM4_PSCRELOADMODE_IMMEDIATE: The Prescaler is loaded
//  210   *                         immediately.
//  211   *                       - TIM4_PSCRELOADMODE_UPDATE: The Prescaler is loaded at
//  212   *                         the update event.
//  213   * @retval None
//  214   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  215 void TIM4_PrescalerConfig(TIM4_Prescaler_TypeDef Prescaler, TIM4_PSCReloadMode_TypeDef TIM4_PSCReloadMode)
//  216 {
TIM4_PrescalerConfig:
        CALL      L:?push_w4
        LD        S:?b9, A
        MOV       S:?b8, S:?b0
//  217   /* Check the parameters */
//  218   assert_param(IS_TIM4_PRESCALER_RELOAD_OK(TIM4_PSCReloadMode));
        TNZ       S:?b8
        JREQ      L:??TIM4_PrescalerConfig_0
        LD        A, S:?b8
        CP        A, #0x1
        JREQ      L:??TIM4_PrescalerConfig_0
        LDW       X, #0xda
        LDW       S:?w1, X
        CLRW      X
        LDW       S:?w0, X
        LDW       X, #`?<Constant "C:\\\\Users\\\\lun55\\\\Deskto...">`
        CALL      L:assert_failed
//  219   assert_param(IS_TIM4_PRESCALER_OK(Prescaler));
??TIM4_PrescalerConfig_0:
        TNZ       S:?b9
        JREQ      L:??TIM4_PrescalerConfig_1
        LD        A, S:?b9
        CP        A, #0x1
        JREQ      L:??TIM4_PrescalerConfig_1
        LD        A, S:?b9
        CP        A, #0x2
        JREQ      L:??TIM4_PrescalerConfig_1
        LD        A, S:?b9
        CP        A, #0x3
        JREQ      L:??TIM4_PrescalerConfig_1
        LD        A, S:?b9
        CP        A, #0x4
        JREQ      L:??TIM4_PrescalerConfig_1
        LD        A, S:?b9
        CP        A, #0x5
        JREQ      L:??TIM4_PrescalerConfig_1
        LD        A, S:?b9
        CP        A, #0x6
        JREQ      L:??TIM4_PrescalerConfig_1
        LD        A, S:?b9
        CP        A, #0x7
        JREQ      L:??TIM4_PrescalerConfig_1
        LDW       X, #0xdb
        LDW       S:?w1, X
        CLRW      X
        LDW       S:?w0, X
        LDW       X, #`?<Constant "C:\\\\Users\\\\lun55\\\\Deskto...">`
        CALL      L:assert_failed
//  220   
//  221   /* Set the Prescaler value */
//  222   TIM4->PSCR = (uint8_t)Prescaler;
??TIM4_PrescalerConfig_1:
        LD        A, S:?b9
        LD        L:0x5347, A
//  223   
//  224   /* Set or reset the UG Bit */
//  225   TIM4->EGR = (uint8_t)TIM4_PSCReloadMode;
        LD        A, S:?b8
        LD        L:0x5345, A
//  226 }
        JP        L:?epilogue_w4
//  227 
//  228 /**
//  229   * @brief  Enables or disables TIM4 peripheral Preload register on ARR.
//  230   * @param   NewState new state of the TIM4 peripheral Preload register.
//  231   * This parameter can be ENABLE or DISABLE.
//  232   * @retval None
//  233   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  234 void TIM4_ARRPreloadConfig(FunctionalState NewState)
//  235 {
TIM4_ARRPreloadConfig:
        PUSH      S:?b8
        LD        S:?b8, A
//  236   /* Check the parameters */
//  237   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
        TNZ       S:?b8
        JREQ      L:??TIM4_ARRPreloadConfig_0
        LD        A, S:?b8
        CP        A, #0x1
        JREQ      L:??TIM4_ARRPreloadConfig_0
        LDW       X, #0xed
        LDW       S:?w1, X
        CLRW      X
        LDW       S:?w0, X
        LDW       X, #`?<Constant "C:\\\\Users\\\\lun55\\\\Deskto...">`
        CALL      L:assert_failed
//  238   
//  239   /* Set or Reset the ARPE Bit */
//  240   if (NewState != DISABLE)
??TIM4_ARRPreloadConfig_0:
        TNZ       S:?b8
        JREQ      L:??TIM4_ARRPreloadConfig_1
//  241   {
//  242     TIM4->CR1 |= TIM4_CR1_ARPE;
        BSET      L:0x5340, #0x7
        JRA       L:??TIM4_ARRPreloadConfig_2
//  243   }
//  244   else
//  245   {
//  246     TIM4->CR1 &= (uint8_t)(~TIM4_CR1_ARPE);
??TIM4_ARRPreloadConfig_1:
        BRES      L:0x5340, #0x7
//  247   }
//  248 }
??TIM4_ARRPreloadConfig_2:
        POP       S:?b8
        RET
//  249 
//  250 /**
//  251   * @brief  Configures the TIM4 event to be generated by software.
//  252   * @param   TIM4_EventSource specifies the event source.
//  253   * This parameter can be one of the following values:
//  254   *                       - TIM4_EVENTSOURCE_UPDATE: TIM4 update Event source
//  255   * @retval None
//  256   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  257 void TIM4_GenerateEvent(TIM4_EventSource_TypeDef TIM4_EventSource)
//  258 {
TIM4_GenerateEvent:
        PUSH      S:?b8
        LD        S:?b8, A
//  259   /* Check the parameters */
//  260   assert_param(IS_TIM4_EVENT_SOURCE_OK(TIM4_EventSource));
        LD        A, S:?b8
        CP        A, #0x1
        JREQ      L:??TIM4_GenerateEvent_0
        LDW       X, #0x104
        LDW       S:?w1, X
        CLRW      X
        LDW       S:?w0, X
        LDW       X, #`?<Constant "C:\\\\Users\\\\lun55\\\\Deskto...">`
        CALL      L:assert_failed
//  261   
//  262   /* Set the event sources */
//  263   TIM4->EGR = (uint8_t)(TIM4_EventSource);
??TIM4_GenerateEvent_0:
        LD        A, S:?b8
        LD        L:0x5345, A
//  264 }
        POP       S:?b8
        RET
//  265 
//  266 /**
//  267   * @brief  Sets the TIM4 Counter Register value.
//  268   * @param   Counter specifies the Counter register new value.
//  269   * This parameter is between 0x00 and 0xFF.
//  270   * @retval None
//  271   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  272 void TIM4_SetCounter(uint8_t Counter)
//  273 {
//  274   /* Set the Counter Register value */
//  275   TIM4->CNTR = (uint8_t)(Counter);
TIM4_SetCounter:
        LD        L:0x5346, A
//  276 }
        RET
//  277 
//  278 /**
//  279   * @brief  Sets the TIM4 Autoreload Register value.
//  280   * @param   Autoreload specifies the Autoreload register new value.
//  281   * This parameter is between 0x00 and 0xFF.
//  282   * @retval None
//  283   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  284 void TIM4_SetAutoreload(uint8_t Autoreload)
//  285 {
//  286   /* Set the Autoreload Register value */
//  287   TIM4->ARR = (uint8_t)(Autoreload);
TIM4_SetAutoreload:
        LD        L:0x5348, A
//  288 }
        RET
//  289 
//  290 /**
//  291   * @brief  Gets the TIM4 Counter value.
//  292   * @param  None
//  293   * @retval Counter Register value.
//  294   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  295 uint8_t TIM4_GetCounter(void)
//  296 {
//  297   /* Get the Counter Register value */
//  298   return (uint8_t)(TIM4->CNTR);
TIM4_GetCounter:
        LD        A, L:0x5346
        RET
//  299 }
//  300 
//  301 /**
//  302   * @brief  Gets the TIM4 Prescaler value.
//  303   * @param  None
//  304   * @retval Prescaler Register configuration value.
//  305   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  306 TIM4_Prescaler_TypeDef TIM4_GetPrescaler(void)
//  307 {
//  308   /* Get the Prescaler Register value */
//  309   return (TIM4_Prescaler_TypeDef)(TIM4->PSCR);
TIM4_GetPrescaler:
        LD        A, L:0x5347
        RET
//  310 }
//  311 
//  312 /**
//  313   * @brief  Checks whether the specified TIM4 flag is set or not.
//  314   * @param   TIM4_FLAG specifies the flag to check.
//  315   * This parameter can be one of the following values:
//  316   *                       - TIM4_FLAG_UPDATE: TIM4 update Flag
//  317   * @retval FlagStatus The new state of TIM4_FLAG (SET or RESET).
//  318   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  319 FlagStatus TIM4_GetFlagStatus(TIM4_FLAG_TypeDef TIM4_FLAG)
//  320 {
TIM4_GetFlagStatus:
        PUSH      S:?b8
        LD        S:?b8, A
//  321   FlagStatus bitstatus = RESET;
        CLR       S:?b0
//  322   
//  323   /* Check the parameters */
//  324   assert_param(IS_TIM4_GET_FLAG_OK(TIM4_FLAG));
        LD        A, S:?b8
        CP        A, #0x1
        JREQ      L:??TIM4_GetFlagStatus_0
        LDW       X, #0x144
        LDW       S:?w1, X
        CLRW      X
        LDW       S:?w0, X
        LDW       X, #`?<Constant "C:\\\\Users\\\\lun55\\\\Deskto...">`
        CALL      L:assert_failed
//  325   
//  326   if ((TIM4->SR1 & (uint8_t)TIM4_FLAG)  != 0)
??TIM4_GetFlagStatus_0:
        LD        A, S:?b8
        AND       A, L:0x5344
        CP        A, #0x0
        JREQ      L:??TIM4_GetFlagStatus_1
//  327   {
//  328     bitstatus = SET;
        MOV       S:?b0, #0x1
        JRA       L:??TIM4_GetFlagStatus_2
//  329   }
//  330   else
//  331   {
//  332     bitstatus = RESET;
??TIM4_GetFlagStatus_1:
        CLR       S:?b0
//  333   }
//  334   return ((FlagStatus)bitstatus);
??TIM4_GetFlagStatus_2:
        LD        A, S:?b0
        POP       S:?b8
        RET
//  335 }
//  336 
//  337 /**
//  338   * @brief  Clears the TIM4’s pending flags.
//  339   * @param   TIM4_FLAG specifies the flag to clear.
//  340   * This parameter can be one of the following values:
//  341   *                       - TIM4_FLAG_UPDATE: TIM4 update Flag
//  342   * @retval None.
//  343   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  344 void TIM4_ClearFlag(TIM4_FLAG_TypeDef TIM4_FLAG)
//  345 {
TIM4_ClearFlag:
        PUSH      S:?b8
        LD        S:?b8, A
//  346   /* Check the parameters */
//  347   assert_param(IS_TIM4_GET_FLAG_OK(TIM4_FLAG));
        LD        A, S:?b8
        CP        A, #0x1
        JREQ      L:??TIM4_ClearFlag_0
        LDW       X, #0x15b
        LDW       S:?w1, X
        CLRW      X
        LDW       S:?w0, X
        LDW       X, #`?<Constant "C:\\\\Users\\\\lun55\\\\Deskto...">`
        CALL      L:assert_failed
//  348   
//  349   /* Clear the flags (rc_w0) clear this bit by writing 0. Writing ‘1’ has no effect*/
//  350   TIM4->SR1 = (uint8_t)(~TIM4_FLAG);
??TIM4_ClearFlag_0:
        CPL       S:?b8
        LD        A, S:?b8
        LD        L:0x5344, A
//  351 }
        POP       S:?b8
        RET
//  352 
//  353 /**
//  354   * @brief  Checks whether the TIM4 interrupt has occurred or not.
//  355   * @param  TIM4_IT specifies the TIM4 interrupt source to check.
//  356   * This parameter can be one of the following values:
//  357   *                       - TIM4_IT_UPDATE: TIM4 update Interrupt source
//  358   * @retval ITStatus The new state of the TIM4_IT (SET or RESET).
//  359   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  360 ITStatus TIM4_GetITStatus(TIM4_IT_TypeDef TIM4_IT)
//  361 {
TIM4_GetITStatus:
        PUSH      S:?b8
        LD        S:?b8, A
//  362   ITStatus bitstatus = RESET;
        CLR       S:?b0
//  363   
//  364   uint8_t itstatus = 0x0, itenable = 0x0;
        CLR       S:?b2
        CLR       S:?b1
//  365   
//  366   /* Check the parameters */
//  367   assert_param(IS_TIM4_IT_OK(TIM4_IT));
        LD        A, S:?b8
        CP        A, #0x1
        JREQ      L:??TIM4_GetITStatus_0
        LDW       X, #0x16f
        LDW       S:?w1, X
        CLRW      X
        LDW       S:?w0, X
        LDW       X, #`?<Constant "C:\\\\Users\\\\lun55\\\\Deskto...">`
        CALL      L:assert_failed
//  368   
//  369   itstatus = (uint8_t)(TIM4->SR1 & (uint8_t)TIM4_IT);
??TIM4_GetITStatus_0:
        LD        A, S:?b8
        AND       A, L:0x5344
        LD        S:?b2, A
//  370   
//  371   itenable = (uint8_t)(TIM4->IER & (uint8_t)TIM4_IT);
        LD        A, S:?b8
        AND       A, L:0x5343
        LD        S:?b1, A
//  372   
//  373   if ((itstatus != (uint8_t)RESET ) && (itenable != (uint8_t)RESET ))
        TNZ       S:?b2
        JREQ      L:??TIM4_GetITStatus_1
        TNZ       S:?b1
        JREQ      L:??TIM4_GetITStatus_1
//  374   {
//  375     bitstatus = (ITStatus)SET;
        MOV       S:?b0, #0x1
        JRA       L:??TIM4_GetITStatus_2
//  376   }
//  377   else
//  378   {
//  379     bitstatus = (ITStatus)RESET;
??TIM4_GetITStatus_1:
        CLR       S:?b0
//  380   }
//  381   return ((ITStatus)bitstatus);
??TIM4_GetITStatus_2:
        LD        A, S:?b0
        POP       S:?b8
        RET
//  382 }
//  383 
//  384 /**
//  385   * @brief Clears the TIM4's interrupt pending bits.
//  386   * @param TIM4_IT specifies the pending bit to clear.
//  387   * This parameter can be one of the following values:
//  388   *                       - TIM4_IT_UPDATE: TIM4 update Interrupt source
//  389   * @retval None.
//  390   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  391 void TIM4_ClearITPendingBit(TIM4_IT_TypeDef TIM4_IT)
//  392 {
TIM4_ClearITPendingBit:
        PUSH      S:?b8
        LD        S:?b8, A
//  393   /* Check the parameters */
//  394   assert_param(IS_TIM4_IT_OK(TIM4_IT));
        LD        A, S:?b8
        CP        A, #0x1
        JREQ      L:??TIM4_ClearITPendingBit_0
        LDW       X, #0x18a
        LDW       S:?w1, X
        CLRW      X
        LDW       S:?w0, X
        LDW       X, #`?<Constant "C:\\\\Users\\\\lun55\\\\Deskto...">`
        CALL      L:assert_failed
//  395   
//  396   /* Clear the IT pending Bit */
//  397   TIM4->SR1 = (uint8_t)(~TIM4_IT);
??TIM4_ClearITPendingBit_0:
        CPL       S:?b8
        LD        A, S:?b8
        LD        L:0x5344, A
//  398 }
        POP       S:?b8
        RET

        SECTION VREGS:DATA:REORDER:NOROOT(0)

        SECTION `.near.rodata`:CONST:REORDER:NOROOT(0)
`?<Constant "C:\\\\Users\\\\lun55\\\\Deskto...">`:
        DC8 "C:\\Users\\lun55\\Desktop\\J19B_STM8\\Lib\\stm8s_tim4.c"

        END
//  399 
//  400 /**
//  401   * @}
//  402   */
//  403   
//  404   /**
//  405   * @}
//  406   */
//  407   
//  408 
//  409 /************************ (C) COPYRIGHT STMicroelectronics *****END OF FILE****/
// 
//  50 bytes in section .near.rodata
// 765 bytes in section .near_func.text
// 
// 765 bytes of CODE  memory
//  50 bytes of CONST memory
//
//Errors: none
//Warnings: none
