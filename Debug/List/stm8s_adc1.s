///////////////////////////////////////////////////////////////////////////////
//                                                                            /
//                                                      11/Mar/2019  20:52:08 /
// IAR C/C++ Compiler V1.31.1.20058 [Evaluation] for STM8                     /
// Copyright 2010-2012 IAR Systems AB.                                        /
//                                                                            /
//    Source file  =  C:\Users\lun55\Desktop\J19B_STM8\Lib\stm8s_adc1.c       /
//    Command line =  C:\Users\lun55\Desktop\J19B_STM8\Lib\stm8s_adc1.c -e    /
//                    -Ol --no_cse --no_unroll --no_inline --no_code_motion   /
//                    --no_tbaa --no_cross_call --debug --code_model small    /
//                    --data_model medium -o C:\Users\lun55\Desktop\J19B_STM8 /
//                    \Debug\Obj\ --dlib_config "D:\Program Files (x86)\IAR   /
//                    Systems\Embedded Workbench 6.0                          /
//                    Evaluation\stm8\LIB\dlstm8smf.h" -lcN                   /
//                    C:\Users\lun55\Desktop\J19B_STM8\Debug\List\ -lB        /
//                    C:\Users\lun55\Desktop\J19B_STM8\Debug\List\ --vregs 16 /
//    List file    =  C:\Users\lun55\Desktop\J19B_STM8\Debug\List\stm8s_adc1. /
//                    s                                                       /
//                                                                            /
//                                                                            /
///////////////////////////////////////////////////////////////////////////////

        NAME stm8s_adc1

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
        EXTERN ?sll16_x_x_6
        EXTERN ?sll16_x_x_a
        EXTERN ?w0
        EXTERN ?w1
        EXTERN ?w4
        EXTERN assert_failed

        PUBLIC ADC1_AWDChannelConfig
        PUBLIC ADC1_ClearFlag
        PUBLIC ADC1_ClearITPendingBit
        PUBLIC ADC1_Cmd
        PUBLIC ADC1_ConversionConfig
        PUBLIC ADC1_DataBufferCmd
        PUBLIC ADC1_DeInit
        PUBLIC ADC1_ExternalTriggerConfig
        PUBLIC ADC1_GetAWDChannelStatus
        PUBLIC ADC1_GetBufferValue
        PUBLIC ADC1_GetConversionValue
        PUBLIC ADC1_GetFlagStatus
        PUBLIC ADC1_GetITStatus
        PUBLIC ADC1_ITConfig
        PUBLIC ADC1_Init
        PUBLIC ADC1_PrescalerConfig
        PUBLIC ADC1_ScanModeCmd
        PUBLIC ADC1_SchmittTriggerConfig
        PUBLIC ADC1_SetHighThreshold
        PUBLIC ADC1_SetLowThreshold
        PUBLIC ADC1_StartConversion

// C:\Users\lun55\Desktop\J19B_STM8\Lib\stm8s_adc1.c
//    1 /**
//    2   ******************************************************************************
//    3   * @file    stm8s_adc1.c
//    4   * @author  MCD Application Team
//    5   * @version V2.2.0
//    6   * @date    30-September-2014
//    7   * @brief   This file contains all the functions/macros for the ADC1 peripheral.
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
//   29 #include "stm8s_adc1.h"
//   30 
//   31 /** @addtogroup STM8S_StdPeriph_Driver
//   32   * @{
//   33   */
//   34 /* Private typedef -----------------------------------------------------------*/
//   35 /* Private define ------------------------------------------------------------*/
//   36 /* Private macro -------------------------------------------------------------*/
//   37 /* Private variables ---------------------------------------------------------*/
//   38 /* Private function prototypes -----------------------------------------------*/
//   39 /* Private functions ---------------------------------------------------------*/
//   40 /* Public functions ----------------------------------------------------------*/
//   41 
//   42 /**
//   43   * @addtogroup ADC1_Public_Functions
//   44   * @{
//   45   */
//   46 
//   47 /**
//   48   * @brief  Deinitializes the ADC1 peripheral registers to their default reset values.
//   49   * @param  None
//   50   * @retval None
//   51   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//   52 void ADC1_DeInit(void)
//   53 {
//   54   ADC1->CSR  = ADC1_CSR_RESET_VALUE;
ADC1_DeInit:
        MOV       L:0x5400, #0x0
//   55   ADC1->CR1  = ADC1_CR1_RESET_VALUE;
        MOV       L:0x5401, #0x0
//   56   ADC1->CR2  = ADC1_CR2_RESET_VALUE;
        MOV       L:0x5402, #0x0
//   57   ADC1->CR3  = ADC1_CR3_RESET_VALUE;
        MOV       L:0x5403, #0x0
//   58   ADC1->TDRH = ADC1_TDRH_RESET_VALUE;
        MOV       L:0x5406, #0x0
//   59   ADC1->TDRL = ADC1_TDRL_RESET_VALUE;
        MOV       L:0x5407, #0x0
//   60   ADC1->HTRH = ADC1_HTRH_RESET_VALUE;
        MOV       L:0x5408, #0xff
//   61   ADC1->HTRL = ADC1_HTRL_RESET_VALUE;
        MOV       L:0x5409, #0x3
//   62   ADC1->LTRH = ADC1_LTRH_RESET_VALUE;
        MOV       L:0x540a, #0x0
//   63   ADC1->LTRL = ADC1_LTRL_RESET_VALUE;
        MOV       L:0x540b, #0x0
//   64   ADC1->AWCRH = ADC1_AWCRH_RESET_VALUE;
        MOV       L:0x540e, #0x0
//   65   ADC1->AWCRL = ADC1_AWCRL_RESET_VALUE;
        MOV       L:0x540f, #0x0
//   66 }
        RET
//   67 
//   68 /**
//   69   * @brief  Initializes the ADC1 peripheral according to the specified parameters
//   70   * @param   ADC1_ConversionMode: specifies the conversion mode
//   71   * can be one of the values of @ref ADC1_ConvMode_TypeDef.
//   72   * @param   ADC1_Channel: specifies the channel to convert
//   73   * can be one of the values of @ref ADC1_Channel_TypeDef.
//   74   * @param   ADC1_PrescalerSelection: specifies the ADC1 prescaler
//   75   * can be one of the values of @ref ADC1_PresSel_TypeDef.
//   76   * @param   ADC1_ExtTrigger: specifies the external trigger
//   77   * can be one of the values of @ref ADC1_ExtTrig_TypeDef.
//   78   * @param   ADC1_ExtTriggerState: specifies the external trigger new state
//   79   * can be one of the values of @ref FunctionalState.
//   80   * @param   ADC1_Align: specifies the converted data alignment
//   81   * can be one of the values of @ref ADC1_Align_TypeDef.
//   82   * @param   ADC1_SchmittTriggerChannel: specifies the schmitt trigger channel
//   83   * can be one of the values of @ref ADC1_SchmittTrigg_TypeDef.
//   84   * @param   ADC1_SchmittTriggerState: specifies the schmitt trigger state
//   85   * can be one of the values of @ref FunctionalState.
//   86   * @retval None
//   87   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//   88 void ADC1_Init(ADC1_ConvMode_TypeDef ADC1_ConversionMode, ADC1_Channel_TypeDef ADC1_Channel, ADC1_PresSel_TypeDef ADC1_PrescalerSelection, ADC1_ExtTrig_TypeDef ADC1_ExtTrigger, FunctionalState ADC1_ExtTriggerState, ADC1_Align_TypeDef ADC1_Align, ADC1_SchmittTrigg_TypeDef ADC1_SchmittTriggerChannel, FunctionalState ADC1_SchmittTriggerState)
//   89 {
ADC1_Init:
        CALL      L:?push_l2
        CALL      L:?push_l3
        LD        S:?b15, A
        MOV       S:?b8, S:?b0
        MOV       S:?b9, S:?b1
        MOV       S:?b14, S:?b2
        MOV       S:?b13, S:?b3
        MOV       S:?b12, S:?b4
        MOV       S:?b10, S:?b5
        MOV       S:?b11, S:?b6
//   90   /* Check the parameters */
//   91   assert_param(IS_ADC1_CONVERSIONMODE_OK(ADC1_ConversionMode));
        TNZ       S:?b15
        JREQ      L:??ADC1_Init_0
        LD        A, S:?b15
        CP        A, #0x1
        JREQ      L:??ADC1_Init_0
        LDW       X, #0x5b
        LDW       S:?w1, X
        CLRW      X
        LDW       S:?w0, X
        LDW       X, #`?<Constant "C:\\\\Users\\\\lun55\\\\Deskto...">`
        CALL      L:assert_failed
//   92   assert_param(IS_ADC1_CHANNEL_OK(ADC1_Channel));
??ADC1_Init_0:
        TNZ       S:?b8
        JREQ      L:??ADC1_Init_1
        LD        A, S:?b8
        CP        A, #0x1
        JREQ      L:??ADC1_Init_1
        LD        A, S:?b8
        CP        A, #0x2
        JREQ      L:??ADC1_Init_1
        LD        A, S:?b8
        CP        A, #0x3
        JREQ      L:??ADC1_Init_1
        LD        A, S:?b8
        CP        A, #0x4
        JREQ      L:??ADC1_Init_1
        LD        A, S:?b8
        CP        A, #0x5
        JREQ      L:??ADC1_Init_1
        LD        A, S:?b8
        CP        A, #0x6
        JREQ      L:??ADC1_Init_1
        LD        A, S:?b8
        CP        A, #0x7
        JREQ      L:??ADC1_Init_1
        LD        A, S:?b8
        CP        A, #0x8
        JREQ      L:??ADC1_Init_1
        LD        A, S:?b8
        CP        A, #0xc
        JREQ      L:??ADC1_Init_1
        LD        A, S:?b8
        CP        A, #0x9
        JREQ      L:??ADC1_Init_1
        LDW       X, #0x5c
        LDW       S:?w1, X
        CLRW      X
        LDW       S:?w0, X
        LDW       X, #`?<Constant "C:\\\\Users\\\\lun55\\\\Deskto...">`
        CALL      L:assert_failed
//   93   assert_param(IS_ADC1_PRESSEL_OK(ADC1_PrescalerSelection));
??ADC1_Init_1:
        TNZ       S:?b9
        JREQ      L:??ADC1_Init_2
        LD        A, S:?b9
        CP        A, #0x10
        JREQ      L:??ADC1_Init_2
        LD        A, S:?b9
        CP        A, #0x20
        JREQ      L:??ADC1_Init_2
        LD        A, S:?b9
        CP        A, #0x30
        JREQ      L:??ADC1_Init_2
        LD        A, S:?b9
        CP        A, #0x40
        JREQ      L:??ADC1_Init_2
        LD        A, S:?b9
        CP        A, #0x50
        JREQ      L:??ADC1_Init_2
        LD        A, S:?b9
        CP        A, #0x60
        JREQ      L:??ADC1_Init_2
        LD        A, S:?b9
        CP        A, #0x70
        JREQ      L:??ADC1_Init_2
        LDW       X, #0x5d
        LDW       S:?w1, X
        CLRW      X
        LDW       S:?w0, X
        LDW       X, #`?<Constant "C:\\\\Users\\\\lun55\\\\Deskto...">`
        CALL      L:assert_failed
//   94   assert_param(IS_ADC1_EXTTRIG_OK(ADC1_ExtTrigger));
??ADC1_Init_2:
        TNZ       S:?b14
        JREQ      L:??ADC1_Init_3
        LD        A, S:?b14
        CP        A, #0x10
        JREQ      L:??ADC1_Init_3
        LDW       X, #0x5e
        LDW       S:?w1, X
        CLRW      X
        LDW       S:?w0, X
        LDW       X, #`?<Constant "C:\\\\Users\\\\lun55\\\\Deskto...">`
        CALL      L:assert_failed
//   95   assert_param(IS_FUNCTIONALSTATE_OK(((ADC1_ExtTriggerState))));
??ADC1_Init_3:
        TNZ       S:?b13
        JREQ      L:??ADC1_Init_4
        LD        A, S:?b13
        CP        A, #0x1
        JREQ      L:??ADC1_Init_4
        LDW       X, #0x5f
        LDW       S:?w1, X
        CLRW      X
        LDW       S:?w0, X
        LDW       X, #`?<Constant "C:\\\\Users\\\\lun55\\\\Deskto...">`
        CALL      L:assert_failed
//   96   assert_param(IS_ADC1_ALIGN_OK(ADC1_Align));
??ADC1_Init_4:
        TNZ       S:?b12
        JREQ      L:??ADC1_Init_5
        LD        A, S:?b12
        CP        A, #0x8
        JREQ      L:??ADC1_Init_5
        LDW       X, #0x60
        LDW       S:?w1, X
        CLRW      X
        LDW       S:?w0, X
        LDW       X, #`?<Constant "C:\\\\Users\\\\lun55\\\\Deskto...">`
        CALL      L:assert_failed
//   97   assert_param(IS_ADC1_SCHMITTTRIG_OK(ADC1_SchmittTriggerChannel));
??ADC1_Init_5:
        TNZ       S:?b10
        JREQ      L:??ADC1_Init_6
        LD        A, S:?b10
        CP        A, #0x1
        JREQ      L:??ADC1_Init_6
        LD        A, S:?b10
        CP        A, #0x2
        JREQ      L:??ADC1_Init_6
        LD        A, S:?b10
        CP        A, #0x3
        JREQ      L:??ADC1_Init_6
        LD        A, S:?b10
        CP        A, #0x4
        JREQ      L:??ADC1_Init_6
        LD        A, S:?b10
        CP        A, #0x5
        JREQ      L:??ADC1_Init_6
        LD        A, S:?b10
        CP        A, #0x6
        JREQ      L:??ADC1_Init_6
        LD        A, S:?b10
        CP        A, #0x7
        JREQ      L:??ADC1_Init_6
        LD        A, S:?b10
        CP        A, #0x8
        JREQ      L:??ADC1_Init_6
        LD        A, S:?b10
        CP        A, #0xc
        JREQ      L:??ADC1_Init_6
        LD        A, S:?b10
        CP        A, #0xff
        JREQ      L:??ADC1_Init_6
        LD        A, S:?b10
        CP        A, #0x9
        JREQ      L:??ADC1_Init_6
        LDW       X, #0x61
        LDW       S:?w1, X
        CLRW      X
        LDW       S:?w0, X
        LDW       X, #`?<Constant "C:\\\\Users\\\\lun55\\\\Deskto...">`
        CALL      L:assert_failed
//   98   assert_param(IS_FUNCTIONALSTATE_OK(ADC1_SchmittTriggerState));
??ADC1_Init_6:
        TNZ       S:?b11
        JREQ      L:??ADC1_Init_7
        LD        A, S:?b11
        CP        A, #0x1
        JREQ      L:??ADC1_Init_7
        LDW       X, #0x62
        LDW       S:?w1, X
        CLRW      X
        LDW       S:?w0, X
        LDW       X, #`?<Constant "C:\\\\Users\\\\lun55\\\\Deskto...">`
        CALL      L:assert_failed
//   99   
//  100   /*-----------------CR1 & CSR configuration --------------------*/
//  101   /* Configure the conversion mode and the channel to convert
//  102   respectively according to ADC1_ConversionMode & ADC1_Channel values  &  ADC1_Align values */
//  103   ADC1_ConversionConfig(ADC1_ConversionMode, ADC1_Channel, ADC1_Align);
??ADC1_Init_7:
        MOV       S:?b1, S:?b12
        MOV       S:?b0, S:?b8
        LD        A, S:?b15
        CALL      L:ADC1_ConversionConfig
//  104   /* Select the prescaler division factor according to ADC1_PrescalerSelection values */
//  105   ADC1_PrescalerConfig(ADC1_PrescalerSelection);
        LD        A, S:?b9
        CALL      L:ADC1_PrescalerConfig
//  106   
//  107   /*-----------------CR2 configuration --------------------*/
//  108   /* Configure the external trigger state and event respectively
//  109   according to NewState, ADC1_ExtTrigger */
//  110   ADC1_ExternalTriggerConfig(ADC1_ExtTrigger, ADC1_ExtTriggerState);
        MOV       S:?b0, S:?b13
        LD        A, S:?b14
        CALL      L:ADC1_ExternalTriggerConfig
//  111   
//  112   /*------------------TDR configuration ---------------------------*/
//  113   /* Configure the schmitt trigger channel and state respectively
//  114   according to ADC1_SchmittTriggerChannel & ADC1_SchmittTriggerNewState  values */
//  115   ADC1_SchmittTriggerConfig(ADC1_SchmittTriggerChannel, ADC1_SchmittTriggerState);
        MOV       S:?b0, S:?b11
        LD        A, S:?b10
        CALL      L:ADC1_SchmittTriggerConfig
//  116   
//  117   /* Enable the ADC1 peripheral */
//  118   ADC1->CR1 |= ADC1_CR1_ADON;
        BSET      L:0x5401, #0x0
//  119 }
        JP        L:?epilogue_l2_l3
//  120 
//  121 /**
//  122   * @brief  Enables or Disables the ADC1 peripheral.
//  123   * @param  NewState: specifies the peripheral enabled or disabled state.
//  124   * @retval None
//  125   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  126 void ADC1_Cmd(FunctionalState NewState)
//  127 {
ADC1_Cmd:
        PUSH      S:?b8
        LD        S:?b8, A
//  128   /* Check the parameters */
//  129   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
        TNZ       S:?b8
        JREQ      L:??ADC1_Cmd_0
        LD        A, S:?b8
        CP        A, #0x1
        JREQ      L:??ADC1_Cmd_0
        LDW       X, #0x81
        LDW       S:?w1, X
        CLRW      X
        LDW       S:?w0, X
        LDW       X, #`?<Constant "C:\\\\Users\\\\lun55\\\\Deskto...">`
        CALL      L:assert_failed
//  130   
//  131   if (NewState != DISABLE)
??ADC1_Cmd_0:
        TNZ       S:?b8
        JREQ      L:??ADC1_Cmd_1
//  132   {
//  133     ADC1->CR1 |= ADC1_CR1_ADON;
        BSET      L:0x5401, #0x0
        JRA       L:??ADC1_Cmd_2
//  134   }
//  135   else /* NewState == DISABLE */
//  136   {
//  137     ADC1->CR1 &= (uint8_t)(~ADC1_CR1_ADON);
??ADC1_Cmd_1:
        BRES      L:0x5401, #0x0
//  138   }
//  139 }
??ADC1_Cmd_2:
        POP       S:?b8
        RET
//  140 
//  141 /**
//  142   * @brief  Enables or Disables the ADC1 scan mode.
//  143   * @param  NewState: specifies the selected mode enabled or disabled state.
//  144   * @retval None
//  145   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  146 void ADC1_ScanModeCmd(FunctionalState NewState)
//  147 {
ADC1_ScanModeCmd:
        PUSH      S:?b8
        LD        S:?b8, A
//  148   /* Check the parameters */
//  149   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
        TNZ       S:?b8
        JREQ      L:??ADC1_ScanModeCmd_0
        LD        A, S:?b8
        CP        A, #0x1
        JREQ      L:??ADC1_ScanModeCmd_0
        LDW       X, #0x95
        LDW       S:?w1, X
        CLRW      X
        LDW       S:?w0, X
        LDW       X, #`?<Constant "C:\\\\Users\\\\lun55\\\\Deskto...">`
        CALL      L:assert_failed
//  150   
//  151   if (NewState != DISABLE)
??ADC1_ScanModeCmd_0:
        TNZ       S:?b8
        JREQ      L:??ADC1_ScanModeCmd_1
//  152   {
//  153     ADC1->CR2 |= ADC1_CR2_SCAN;
        BSET      L:0x5402, #0x1
        JRA       L:??ADC1_ScanModeCmd_2
//  154   }
//  155   else /* NewState == DISABLE */
//  156   {
//  157     ADC1->CR2 &= (uint8_t)(~ADC1_CR2_SCAN);
??ADC1_ScanModeCmd_1:
        BRES      L:0x5402, #0x1
//  158   }
//  159 }
??ADC1_ScanModeCmd_2:
        POP       S:?b8
        RET
//  160 
//  161 /**
//  162   * @brief  Enables or Disables the ADC1 data store into the Data Buffer registers rather than in the Data Register
//  163   * @param   NewState: specifies the selected mode enabled or disabled state.
//  164   * @retval None
//  165   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  166 void ADC1_DataBufferCmd(FunctionalState NewState)
//  167 {
ADC1_DataBufferCmd:
        PUSH      S:?b8
        LD        S:?b8, A
//  168   /* Check the parameters */
//  169   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
        TNZ       S:?b8
        JREQ      L:??ADC1_DataBufferCmd_0
        LD        A, S:?b8
        CP        A, #0x1
        JREQ      L:??ADC1_DataBufferCmd_0
        LDW       X, #0xa9
        LDW       S:?w1, X
        CLRW      X
        LDW       S:?w0, X
        LDW       X, #`?<Constant "C:\\\\Users\\\\lun55\\\\Deskto...">`
        CALL      L:assert_failed
//  170   
//  171   if (NewState != DISABLE)
??ADC1_DataBufferCmd_0:
        TNZ       S:?b8
        JREQ      L:??ADC1_DataBufferCmd_1
//  172   {
//  173     ADC1->CR3 |= ADC1_CR3_DBUF;
        BSET      L:0x5403, #0x7
        JRA       L:??ADC1_DataBufferCmd_2
//  174   }
//  175   else /* NewState == DISABLE */
//  176   {
//  177     ADC1->CR3 &= (uint8_t)(~ADC1_CR3_DBUF);
??ADC1_DataBufferCmd_1:
        BRES      L:0x5403, #0x7
//  178   }
//  179 }
??ADC1_DataBufferCmd_2:
        POP       S:?b8
        RET
//  180 
//  181 /**
//  182   * @brief  Enables or disables the ADC1 interrupt.
//  183   * @param   ADC1_IT specifies the name of the interrupt to enable or disable.
//  184   * This parameter can be one of the following values:
//  185   *    - ADC1_IT_AWDITEN : Analog WDG interrupt enable
//  186   *    - ADC1_IT_EOCITEN  : EOC iterrupt enable
//  187   * @param   NewState specifies the state of the interrupt to apply.
//  188   * @retval None
//  189   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  190 void ADC1_ITConfig(ADC1_IT_TypeDef ADC1_IT, FunctionalState NewState)
//  191 {
ADC1_ITConfig:
        CALL      L:?push_w4
        PUSH      S:?b10
        LDW       S:?w4, X
        LD        S:?b10, A
//  192   /* Check the parameters */
//  193   assert_param(IS_ADC1_IT_OK(ADC1_IT));
        LDW       X, S:?w4
        CPW       X, #0x20
        JREQ      L:??ADC1_ITConfig_0
        LDW       X, S:?w4
        CPW       X, #0x10
        JREQ      L:??ADC1_ITConfig_0
        LDW       X, #0xc1
        LDW       S:?w1, X
        CLRW      X
        LDW       S:?w0, X
        LDW       X, #`?<Constant "C:\\\\Users\\\\lun55\\\\Deskto...">`
        CALL      L:assert_failed
//  194   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
??ADC1_ITConfig_0:
        TNZ       S:?b10
        JREQ      L:??ADC1_ITConfig_1
        LD        A, S:?b10
        CP        A, #0x1
        JREQ      L:??ADC1_ITConfig_1
        LDW       X, #0xc2
        LDW       S:?w1, X
        CLRW      X
        LDW       S:?w0, X
        LDW       X, #`?<Constant "C:\\\\Users\\\\lun55\\\\Deskto...">`
        CALL      L:assert_failed
//  195   
//  196   if (NewState != DISABLE)
??ADC1_ITConfig_1:
        TNZ       S:?b10
        JREQ      L:??ADC1_ITConfig_2
//  197   {
//  198     /* Enable the ADC1 interrupts */
//  199     ADC1->CSR |= (uint8_t)ADC1_IT;
        LD        A, S:?b9
        OR        A, L:0x5400
        LD        L:0x5400, A
        JRA       L:??ADC1_ITConfig_3
//  200   }
//  201   else  /* NewState == DISABLE */
//  202   {
//  203     /* Disable the ADC1 interrupts */
//  204     ADC1->CSR &= (uint8_t)((uint16_t)~(uint16_t)ADC1_IT);
??ADC1_ITConfig_2:
        LD        A, S:?b9
        CPL       A
        AND       A, L:0x5400
        LD        L:0x5400, A
//  205   }
//  206 }
??ADC1_ITConfig_3:
        POP       S:?b10
        JP        L:?epilogue_w4
//  207 
//  208 /**
//  209   * @brief  Configure the ADC1 prescaler division factor.
//  210   * @param   ADC1_Prescaler: the selected precaler.
//  211   * It can be one of the values of @ref ADC1_PresSel_TypeDef.
//  212   * @retval None
//  213   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  214 void ADC1_PrescalerConfig(ADC1_PresSel_TypeDef ADC1_Prescaler)
//  215 {
ADC1_PrescalerConfig:
        PUSH      S:?b8
        LD        S:?b8, A
//  216   /* Check the parameter */
//  217   assert_param(IS_ADC1_PRESSEL_OK(ADC1_Prescaler));
        TNZ       S:?b8
        JREQ      L:??ADC1_PrescalerConfig_0
        LD        A, S:?b8
        CP        A, #0x10
        JREQ      L:??ADC1_PrescalerConfig_0
        LD        A, S:?b8
        CP        A, #0x20
        JREQ      L:??ADC1_PrescalerConfig_0
        LD        A, S:?b8
        CP        A, #0x30
        JREQ      L:??ADC1_PrescalerConfig_0
        LD        A, S:?b8
        CP        A, #0x40
        JREQ      L:??ADC1_PrescalerConfig_0
        LD        A, S:?b8
        CP        A, #0x50
        JREQ      L:??ADC1_PrescalerConfig_0
        LD        A, S:?b8
        CP        A, #0x60
        JREQ      L:??ADC1_PrescalerConfig_0
        LD        A, S:?b8
        CP        A, #0x70
        JREQ      L:??ADC1_PrescalerConfig_0
        LDW       X, #0xd9
        LDW       S:?w1, X
        CLRW      X
        LDW       S:?w0, X
        LDW       X, #`?<Constant "C:\\\\Users\\\\lun55\\\\Deskto...">`
        CALL      L:assert_failed
//  218   
//  219   /* Clear the SPSEL bits */
//  220   ADC1->CR1 &= (uint8_t)(~ADC1_CR1_SPSEL);
??ADC1_PrescalerConfig_0:
        LD        A, L:0x5401
        AND       A, #0x8f
        LD        L:0x5401, A
//  221   /* Select the prescaler division factor according to ADC1_PrescalerSelection values */
//  222   ADC1->CR1 |= (uint8_t)(ADC1_Prescaler);
        LD        A, S:?b8
        OR        A, L:0x5401
        LD        L:0x5401, A
//  223 }
        POP       S:?b8
        RET
//  224 
//  225 /**
//  226   * @brief  Enables or disables the ADC1 Schmitt Trigger on a selected channel.
//  227   * @param   ADC1_SchmittTriggerChannel specifies the desired Channel.
//  228   * It can be set of the values of @ref ADC1_SchmittTrigg_TypeDef.
//  229   * @param   NewState specifies Channel new status.
//  230   * can have one of the values of @ref FunctionalState.
//  231   * @retval None
//  232   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  233 void ADC1_SchmittTriggerConfig(ADC1_SchmittTrigg_TypeDef ADC1_SchmittTriggerChannel, FunctionalState NewState)
//  234 {
ADC1_SchmittTriggerConfig:
        CALL      L:?push_w4
        LD        S:?b8, A
        MOV       S:?b9, S:?b0
//  235   /* Check the parameters */
//  236   assert_param(IS_ADC1_SCHMITTTRIG_OK(ADC1_SchmittTriggerChannel));
        TNZ       S:?b8
        JREQ      L:??ADC1_SchmittTriggerConfig_0
        LD        A, S:?b8
        CP        A, #0x1
        JREQ      L:??ADC1_SchmittTriggerConfig_0
        LD        A, S:?b8
        CP        A, #0x2
        JREQ      L:??ADC1_SchmittTriggerConfig_0
        LD        A, S:?b8
        CP        A, #0x3
        JREQ      L:??ADC1_SchmittTriggerConfig_0
        LD        A, S:?b8
        CP        A, #0x4
        JREQ      L:??ADC1_SchmittTriggerConfig_0
        LD        A, S:?b8
        CP        A, #0x5
        JREQ      L:??ADC1_SchmittTriggerConfig_0
        LD        A, S:?b8
        CP        A, #0x6
        JREQ      L:??ADC1_SchmittTriggerConfig_0
        LD        A, S:?b8
        CP        A, #0x7
        JREQ      L:??ADC1_SchmittTriggerConfig_0
        LD        A, S:?b8
        CP        A, #0x8
        JREQ      L:??ADC1_SchmittTriggerConfig_0
        LD        A, S:?b8
        CP        A, #0xc
        JREQ      L:??ADC1_SchmittTriggerConfig_0
        LD        A, S:?b8
        CP        A, #0xff
        JREQ      L:??ADC1_SchmittTriggerConfig_0
        LD        A, S:?b8
        CP        A, #0x9
        JREQ      L:??ADC1_SchmittTriggerConfig_0
        LDW       X, #0xec
        LDW       S:?w1, X
        CLRW      X
        LDW       S:?w0, X
        LDW       X, #`?<Constant "C:\\\\Users\\\\lun55\\\\Deskto...">`
        CALL      L:assert_failed
//  237   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
??ADC1_SchmittTriggerConfig_0:
        TNZ       S:?b9
        JREQ      L:??ADC1_SchmittTriggerConfig_1
        LD        A, S:?b9
        CP        A, #0x1
        JREQ      L:??ADC1_SchmittTriggerConfig_1
        LDW       X, #0xed
        LDW       S:?w1, X
        CLRW      X
        LDW       S:?w0, X
        LDW       X, #`?<Constant "C:\\\\Users\\\\lun55\\\\Deskto...">`
        CALL      L:assert_failed
//  238   
//  239   if (ADC1_SchmittTriggerChannel == ADC1_SCHMITTTRIG_ALL)
??ADC1_SchmittTriggerConfig_1:
        LD        A, S:?b8
        CP        A, #0xff
        JRNE      L:??ADC1_SchmittTriggerConfig_2
//  240   {
//  241     if (NewState != DISABLE)
        TNZ       S:?b9
        JREQ      L:??ADC1_SchmittTriggerConfig_3
//  242     {
//  243       ADC1->TDRL &= (uint8_t)0x0;
        LD        A, L:0x5407
        LD        S:?b0, A
        MOV       L:0x5407, #0x0
//  244       ADC1->TDRH &= (uint8_t)0x0;
        LD        A, L:0x5406
        MOV       L:0x5406, #0x0
        JP        L:?epilogue_w4
//  245     }
//  246     else /* NewState == DISABLE */
//  247     {
//  248       ADC1->TDRL |= (uint8_t)0xFF;
??ADC1_SchmittTriggerConfig_3:
        LD        A, L:0x5407
        LD        S:?b0, A
        MOV       L:0x5407, #0xff
//  249       ADC1->TDRH |= (uint8_t)0xFF;
        LD        A, L:0x5406
        MOV       L:0x5406, #0xff
        JP        L:?epilogue_w4
//  250     }
//  251   }
//  252   else if (ADC1_SchmittTriggerChannel < ADC1_SCHMITTTRIG_CHANNEL8)
??ADC1_SchmittTriggerConfig_2:
        LD        A, S:?b8
        CP        A, #0x8
        JRNC      L:??ADC1_SchmittTriggerConfig_4
//  253   {
//  254     if (NewState != DISABLE)
        TNZ       S:?b9
        JREQ      L:??ADC1_SchmittTriggerConfig_5
//  255     {
//  256       ADC1->TDRL &= (uint8_t)(~(uint8_t)((uint8_t)0x01 << (uint8_t)ADC1_SchmittTriggerChannel));
        CLRW      X
        INCW      X
        LD        A, S:?b8
        CALL      L:?sll16_x_x_a
        LD        A, XL
        CPL       A
        AND       A, L:0x5407
        LD        L:0x5407, A
        JP        L:?epilogue_w4
//  257     }
//  258     else /* NewState == DISABLE */
//  259     {
//  260       ADC1->TDRL |= (uint8_t)((uint8_t)0x01 << (uint8_t)ADC1_SchmittTriggerChannel);
??ADC1_SchmittTriggerConfig_5:
        CLRW      X
        INCW      X
        LD        A, S:?b8
        CALL      L:?sll16_x_x_a
        LD        A, XL
        OR        A, L:0x5407
        LD        L:0x5407, A
        JP        L:?epilogue_w4
//  261     }
//  262   }
//  263   else /* ADC1_SchmittTriggerChannel >= ADC1_SCHMITTTRIG_CHANNEL8 */
//  264   {
//  265     if (NewState != DISABLE)
??ADC1_SchmittTriggerConfig_4:
        TNZ       S:?b9
        JREQ      L:??ADC1_SchmittTriggerConfig_6
//  266     {
//  267       ADC1->TDRH &= (uint8_t)(~(uint8_t)((uint8_t)0x01 << ((uint8_t)ADC1_SchmittTriggerChannel - (uint8_t)8)));
        LD        A, S:?b8
        ADD       A, #0xf8
        CLRW      X
        INCW      X
        CALL      L:?sll16_x_x_a
        LD        A, XL
        CPL       A
        AND       A, L:0x5406
        LD        L:0x5406, A
        JP        L:?epilogue_w4
//  268     }
//  269     else /* NewState == DISABLE */
//  270     {
//  271       ADC1->TDRH |= (uint8_t)((uint8_t)0x01 << ((uint8_t)ADC1_SchmittTriggerChannel - (uint8_t)8));
??ADC1_SchmittTriggerConfig_6:
        LD        A, S:?b8
        ADD       A, #0xf8
        CLRW      X
        INCW      X
        CALL      L:?sll16_x_x_a
        LD        A, XL
        OR        A, L:0x5406
        LD        L:0x5406, A
//  272     }
//  273   }
//  274 }
        JP        L:?epilogue_w4
//  275 
//  276 /**
//  277   * @brief  Configure the ADC1 conversion on selected channel.
//  278   * @param   ADC1_ConversionMode Specifies the conversion type.
//  279   * It can be set of the values of @ref ADC1_ConvMode_TypeDef
//  280   * @param   ADC1_Channel specifies the ADC1 Channel.
//  281   * It can be set of the values of @ref ADC1_Channel_TypeDef
//  282   * @param   ADC1_Align specifies the converted data alignment.
//  283   * It can be set of the values of @ref ADC1_Align_TypeDef
//  284   * @retval None
//  285   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  286 void ADC1_ConversionConfig(ADC1_ConvMode_TypeDef ADC1_ConversionMode, ADC1_Channel_TypeDef ADC1_Channel, ADC1_Align_TypeDef ADC1_Align)
//  287 {
ADC1_ConversionConfig:
        CALL      L:?push_w4
        PUSH      S:?b10
        LD        S:?b8, A
        MOV       S:?b9, S:?b0
        MOV       S:?b10, S:?b1
//  288   /* Check the parameters */
//  289   assert_param(IS_ADC1_CONVERSIONMODE_OK(ADC1_ConversionMode));
        TNZ       S:?b8
        JREQ      L:??ADC1_ConversionConfig_0
        LD        A, S:?b8
        CP        A, #0x1
        JREQ      L:??ADC1_ConversionConfig_0
        LDW       X, #0x121
        LDW       S:?w1, X
        CLRW      X
        LDW       S:?w0, X
        LDW       X, #`?<Constant "C:\\\\Users\\\\lun55\\\\Deskto...">`
        CALL      L:assert_failed
//  290   assert_param(IS_ADC1_CHANNEL_OK(ADC1_Channel));
??ADC1_ConversionConfig_0:
        TNZ       S:?b9
        JREQ      L:??ADC1_ConversionConfig_1
        LD        A, S:?b9
        CP        A, #0x1
        JREQ      L:??ADC1_ConversionConfig_1
        LD        A, S:?b9
        CP        A, #0x2
        JREQ      L:??ADC1_ConversionConfig_1
        LD        A, S:?b9
        CP        A, #0x3
        JREQ      L:??ADC1_ConversionConfig_1
        LD        A, S:?b9
        CP        A, #0x4
        JREQ      L:??ADC1_ConversionConfig_1
        LD        A, S:?b9
        CP        A, #0x5
        JREQ      L:??ADC1_ConversionConfig_1
        LD        A, S:?b9
        CP        A, #0x6
        JREQ      L:??ADC1_ConversionConfig_1
        LD        A, S:?b9
        CP        A, #0x7
        JREQ      L:??ADC1_ConversionConfig_1
        LD        A, S:?b9
        CP        A, #0x8
        JREQ      L:??ADC1_ConversionConfig_1
        LD        A, S:?b9
        CP        A, #0xc
        JREQ      L:??ADC1_ConversionConfig_1
        LD        A, S:?b9
        CP        A, #0x9
        JREQ      L:??ADC1_ConversionConfig_1
        LDW       X, #0x122
        LDW       S:?w1, X
        CLRW      X
        LDW       S:?w0, X
        LDW       X, #`?<Constant "C:\\\\Users\\\\lun55\\\\Deskto...">`
        CALL      L:assert_failed
//  291   assert_param(IS_ADC1_ALIGN_OK(ADC1_Align));
??ADC1_ConversionConfig_1:
        TNZ       S:?b10
        JREQ      L:??ADC1_ConversionConfig_2
        LD        A, S:?b10
        CP        A, #0x8
        JREQ      L:??ADC1_ConversionConfig_2
        LDW       X, #0x123
        LDW       S:?w1, X
        CLRW      X
        LDW       S:?w0, X
        LDW       X, #`?<Constant "C:\\\\Users\\\\lun55\\\\Deskto...">`
        CALL      L:assert_failed
//  292   
//  293   /* Clear the align bit */
//  294   ADC1->CR2 &= (uint8_t)(~ADC1_CR2_ALIGN);
??ADC1_ConversionConfig_2:
        BRES      L:0x5402, #0x3
//  295   /* Configure the data alignment */
//  296   ADC1->CR2 |= (uint8_t)(ADC1_Align);
        LD        A, S:?b10
        OR        A, L:0x5402
        LD        L:0x5402, A
//  297   
//  298   if (ADC1_ConversionMode == ADC1_CONVERSIONMODE_CONTINUOUS)
        LD        A, S:?b8
        CP        A, #0x1
        JRNE      L:??ADC1_ConversionConfig_3
//  299   {
//  300     /* Set the continuous conversion mode */
//  301     ADC1->CR1 |= ADC1_CR1_CONT;
        BSET      L:0x5401, #0x1
        JRA       L:??ADC1_ConversionConfig_4
//  302   }
//  303   else /* ADC1_ConversionMode == ADC1_CONVERSIONMODE_SINGLE */
//  304   {
//  305     /* Set the single conversion mode */
//  306     ADC1->CR1 &= (uint8_t)(~ADC1_CR1_CONT);
??ADC1_ConversionConfig_3:
        BRES      L:0x5401, #0x1
//  307   }
//  308   
//  309   /* Clear the ADC1 channels */
//  310   ADC1->CSR &= (uint8_t)(~ADC1_CSR_CH);
??ADC1_ConversionConfig_4:
        LD        A, L:0x5400
        AND       A, #0xf0
        LD        L:0x5400, A
//  311   /* Select the ADC1 channel */
//  312   ADC1->CSR |= (uint8_t)(ADC1_Channel);
        LD        A, S:?b9
        OR        A, L:0x5400
        LD        L:0x5400, A
//  313 }
        POP       S:?b10
        JP        L:?epilogue_w4
//  314 
//  315 /**
//  316   * @brief  Configure the ADC1 conversion on external trigger event.
//  317   * @par Full description:
//  318   * The selected external trigger event can be enabled or disabled.
//  319   * @param   ADC1_ExtTrigger to select the External trigger event.
//  320   * can have one of the values of @ref ADC1_ExtTrig_TypeDef.
//  321   * @param   NewState to enable/disable the selected external trigger
//  322   * can have one of the values of @ref FunctionalState.
//  323   * @retval None
//  324   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  325 void ADC1_ExternalTriggerConfig(ADC1_ExtTrig_TypeDef ADC1_ExtTrigger, FunctionalState NewState)
//  326 {
ADC1_ExternalTriggerConfig:
        CALL      L:?push_w4
        LD        S:?b8, A
        MOV       S:?b9, S:?b0
//  327   /* Check the parameters */
//  328   assert_param(IS_ADC1_EXTTRIG_OK(ADC1_ExtTrigger));
        TNZ       S:?b8
        JREQ      L:??ADC1_ExternalTriggerConfig_0
        LD        A, S:?b8
        CP        A, #0x10
        JREQ      L:??ADC1_ExternalTriggerConfig_0
        LDW       X, #0x148
        LDW       S:?w1, X
        CLRW      X
        LDW       S:?w0, X
        LDW       X, #`?<Constant "C:\\\\Users\\\\lun55\\\\Deskto...">`
        CALL      L:assert_failed
//  329   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
??ADC1_ExternalTriggerConfig_0:
        TNZ       S:?b9
        JREQ      L:??ADC1_ExternalTriggerConfig_1
        LD        A, S:?b9
        CP        A, #0x1
        JREQ      L:??ADC1_ExternalTriggerConfig_1
        LDW       X, #0x149
        LDW       S:?w1, X
        CLRW      X
        LDW       S:?w0, X
        LDW       X, #`?<Constant "C:\\\\Users\\\\lun55\\\\Deskto...">`
        CALL      L:assert_failed
//  330   
//  331   /* Clear the external trigger selection bits */
//  332   ADC1->CR2 &= (uint8_t)(~ADC1_CR2_EXTSEL);
??ADC1_ExternalTriggerConfig_1:
        LD        A, L:0x5402
        AND       A, #0xcf
        LD        L:0x5402, A
//  333   
//  334   if (NewState != DISABLE)
        TNZ       S:?b9
        JREQ      L:??ADC1_ExternalTriggerConfig_2
//  335   {
//  336     /* Enable the selected external Trigger */
//  337     ADC1->CR2 |= (uint8_t)(ADC1_CR2_EXTTRIG);
        BSET      L:0x5402, #0x6
        JRA       L:??ADC1_ExternalTriggerConfig_3
//  338   }
//  339   else /* NewState == DISABLE */
//  340   {
//  341     /* Disable the selected external trigger */
//  342     ADC1->CR2 &= (uint8_t)(~ADC1_CR2_EXTTRIG);
??ADC1_ExternalTriggerConfig_2:
        BRES      L:0x5402, #0x6
//  343   }
//  344   
//  345   /* Set the selected external trigger */
//  346   ADC1->CR2 |= (uint8_t)(ADC1_ExtTrigger);
??ADC1_ExternalTriggerConfig_3:
        LD        A, S:?b8
        OR        A, L:0x5402
        LD        L:0x5402, A
//  347 }
        JP        L:?epilogue_w4
//  348 
//  349 /**
//  350   * @brief  Start ADC1 conversion
//  351   * @par Full description:
//  352   * This function  triggers the start of conversion, after ADC1 configuration.
//  353   * @param  None
//  354   * @retval None
//  355   * @par Required preconditions:
//  356   * Enable the ADC1 peripheral before calling this function
//  357   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  358 void ADC1_StartConversion(void)
//  359 {
//  360   ADC1->CR1 |= ADC1_CR1_ADON;
ADC1_StartConversion:
        BSET      L:0x5401, #0x0
//  361 }
        RET
//  362 
//  363 /**
//  364   * @brief  Get one sample of measured signal.
//  365   * @param  None
//  366   * @retval ConversionValue:  value of the measured signal.
//  367   * @par Required preconditions:
//  368   * ADC1 conversion finished.
//  369   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  370 uint16_t ADC1_GetConversionValue(void)
//  371 {
//  372   uint16_t temph = 0;
ADC1_GetConversionValue:
        CLRW      Y
//  373   uint8_t templ = 0;
        CLR       S:?b0
//  374   
//  375   if ((ADC1->CR2 & ADC1_CR2_ALIGN) != 0) /* Right alignment */
        BTJF      L:0x5402, #0x3, L:??ADC1_GetConversionValue_0
//  376   {
//  377     /* Read LSB first */
//  378     templ = ADC1->DRL;
        LD        A, L:0x5405
        LD        S:?b0, A
//  379     /* Then read MSB */
//  380     temph = ADC1->DRH;
        LD        A, L:0x5404
        CLRW      Y
        LD        YL, A
//  381     
//  382     temph = (uint16_t)(templ | (uint16_t)(temph << (uint8_t)8));
        LDW       X, Y
        CLR       A
        RLWA      X, A
        CLRW      Y
        EXG       A, YL
        LD        A, S:?b0
        EXG       A, YL
        LDW       S:?w0, X
        EXGW      X, Y
        RRWA      X, A
        OR        A, S:?b1
        RRWA      X, A
        OR        A, S:?b0
        RRWA      X, A
        EXGW      X, Y
        JRA       L:??ADC1_GetConversionValue_1
//  383   }
//  384   else /* Left alignment */
//  385   {
//  386     /* Read MSB first*/
//  387     temph = ADC1->DRH;
??ADC1_GetConversionValue_0:
        LD        A, L:0x5404
        CLRW      Y
        LD        YL, A
//  388     /* Then read LSB */
//  389     templ = ADC1->DRL;
        LD        A, L:0x5405
        LD        S:?b0, A
//  390     
//  391     temph = (uint16_t)((uint16_t)((uint16_t)templ << 6) | (uint16_t)((uint16_t)temph << 8));
        CLRW      X
        EXG       A, XL
        LD        A, S:?b0
        EXG       A, XL
        CALL      L:?sll16_x_x_6
        LDW       S:?w1, X
        LDW       X, Y
        CLR       A
        RLWA      X, A
        LDW       S:?w0, X
        LDW       Y, S:?w1
        EXGW      X, Y
        RRWA      X, A
        OR        A, S:?b1
        RRWA      X, A
        OR        A, S:?b0
        RRWA      X, A
        EXGW      X, Y
//  392   }
//  393   
//  394   return ((uint16_t)temph);
??ADC1_GetConversionValue_1:
        LDW       X, Y
        RET
//  395 }
//  396 
//  397 /**
//  398   * @brief  Enables or disables the analog watchdog for the given channel.
//  399   * @param   Channel specifies the desired Channel.
//  400   * It can be set of the values of @ref ADC1_Channel_TypeDef.
//  401   * @param   NewState specifies the analog watchdog new state.
//  402   * can have one of the values of @ref FunctionalState.
//  403   * @retval None
//  404   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  405 void ADC1_AWDChannelConfig(ADC1_Channel_TypeDef Channel, FunctionalState NewState)
//  406 {
ADC1_AWDChannelConfig:
        CALL      L:?push_w4
        LD        S:?b8, A
        MOV       S:?b9, S:?b0
//  407   /* Check the parameters */
//  408   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
        TNZ       S:?b9
        JREQ      L:??ADC1_AWDChannelConfig_0
        LD        A, S:?b9
        CP        A, #0x1
        JREQ      L:??ADC1_AWDChannelConfig_0
        LDW       X, #0x198
        LDW       S:?w1, X
        CLRW      X
        LDW       S:?w0, X
        LDW       X, #`?<Constant "C:\\\\Users\\\\lun55\\\\Deskto...">`
        CALL      L:assert_failed
//  409   assert_param(IS_ADC1_CHANNEL_OK(Channel));
??ADC1_AWDChannelConfig_0:
        TNZ       S:?b8
        JREQ      L:??ADC1_AWDChannelConfig_1
        LD        A, S:?b8
        CP        A, #0x1
        JREQ      L:??ADC1_AWDChannelConfig_1
        LD        A, S:?b8
        CP        A, #0x2
        JREQ      L:??ADC1_AWDChannelConfig_1
        LD        A, S:?b8
        CP        A, #0x3
        JREQ      L:??ADC1_AWDChannelConfig_1
        LD        A, S:?b8
        CP        A, #0x4
        JREQ      L:??ADC1_AWDChannelConfig_1
        LD        A, S:?b8
        CP        A, #0x5
        JREQ      L:??ADC1_AWDChannelConfig_1
        LD        A, S:?b8
        CP        A, #0x6
        JREQ      L:??ADC1_AWDChannelConfig_1
        LD        A, S:?b8
        CP        A, #0x7
        JREQ      L:??ADC1_AWDChannelConfig_1
        LD        A, S:?b8
        CP        A, #0x8
        JREQ      L:??ADC1_AWDChannelConfig_1
        LD        A, S:?b8
        CP        A, #0xc
        JREQ      L:??ADC1_AWDChannelConfig_1
        LD        A, S:?b8
        CP        A, #0x9
        JREQ      L:??ADC1_AWDChannelConfig_1
        LDW       X, #0x199
        LDW       S:?w1, X
        CLRW      X
        LDW       S:?w0, X
        LDW       X, #`?<Constant "C:\\\\Users\\\\lun55\\\\Deskto...">`
        CALL      L:assert_failed
//  410   
//  411   if (Channel < (uint8_t)8)
??ADC1_AWDChannelConfig_1:
        LD        A, S:?b8
        CP        A, #0x8
        JRNC      L:??ADC1_AWDChannelConfig_2
//  412   {
//  413     if (NewState != DISABLE)
        TNZ       S:?b9
        JREQ      L:??ADC1_AWDChannelConfig_3
//  414     {
//  415       ADC1->AWCRL |= (uint8_t)((uint8_t)1 << Channel);
        CLRW      X
        INCW      X
        LD        A, S:?b8
        CALL      L:?sll16_x_x_a
        LD        A, XL
        OR        A, L:0x540f
        LD        L:0x540f, A
        JP        L:?epilogue_w4
//  416     }
//  417     else /* NewState == DISABLE */
//  418     {
//  419       ADC1->AWCRL &= (uint8_t)~(uint8_t)((uint8_t)1 << Channel);
??ADC1_AWDChannelConfig_3:
        CLRW      X
        INCW      X
        LD        A, S:?b8
        CALL      L:?sll16_x_x_a
        LD        A, XL
        CPL       A
        AND       A, L:0x540f
        LD        L:0x540f, A
        JP        L:?epilogue_w4
//  420     }
//  421   }
//  422   else
//  423   {
//  424     if (NewState != DISABLE)
??ADC1_AWDChannelConfig_2:
        TNZ       S:?b9
        JREQ      L:??ADC1_AWDChannelConfig_4
//  425     {
//  426       ADC1->AWCRH |= (uint8_t)((uint8_t)1 << (Channel - (uint8_t)8));
        LD        A, S:?b8
        ADD       A, #0xf8
        CLRW      X
        INCW      X
        CALL      L:?sll16_x_x_a
        LD        A, XL
        OR        A, L:0x540e
        LD        L:0x540e, A
        JP        L:?epilogue_w4
//  427     }
//  428     else /* NewState == DISABLE */
//  429     {
//  430       ADC1->AWCRH &= (uint8_t)~(uint8_t)((uint8_t)1 << (uint8_t)(Channel - (uint8_t)8));
??ADC1_AWDChannelConfig_4:
        LD        A, S:?b8
        ADD       A, #0xf8
        CLRW      X
        INCW      X
        CALL      L:?sll16_x_x_a
        LD        A, XL
        CPL       A
        AND       A, L:0x540e
        LD        L:0x540e, A
//  431     }
//  432   }
//  433 }
        JP        L:?epilogue_w4
//  434 
//  435 /**
//  436   * @brief  Sets the high threshold of the analog watchdog.
//  437   * @param   Threshold specifies the high threshold value.
//  438   * this value depends on the reference voltage range.
//  439   * @retval None
//  440   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  441 void ADC1_SetHighThreshold(uint16_t Threshold)
//  442 {
ADC1_SetHighThreshold:
        LDW       Y, X
//  443   ADC1->HTRH = (uint8_t)(Threshold >> (uint8_t)2);
        LDW       X, Y
        SRLW      X
        SRLW      X
        LD        A, XL
        LD        L:0x5408, A
//  444   ADC1->HTRL = (uint8_t)Threshold;
        LD        A, YL
        LD        L:0x5409, A
//  445 }
        RET
//  446 
//  447 /**
//  448   * @brief  Sets the low threshold of the analog watchdog.
//  449   * @param   Threshold specifies the low threshold value.
//  450   * this value depends on the reference voltage range.
//  451   * @retval None
//  452   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  453 void ADC1_SetLowThreshold(uint16_t Threshold)
//  454 {
//  455   ADC1->LTRL = (uint8_t)Threshold;
ADC1_SetLowThreshold:
        LD        A, XL
        LD        L:0x540b, A
//  456   ADC1->LTRH = (uint8_t)(Threshold >> (uint8_t)2);
        SRLW      X
        SRLW      X
        LD        A, XL
        LD        L:0x540a, A
//  457 }
        RET
//  458 
//  459 /**
//  460   * @brief  Get one sample of measured signal.
//  461   * @param   Buffer specifies the buffer to read.
//  462   * @retval BufferValue:  value read from the given buffer.
//  463   * @par Required preconditions:
//  464   * ADC1 conversion finished.
//  465   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  466 uint16_t ADC1_GetBufferValue(uint8_t Buffer)
//  467 {
ADC1_GetBufferValue:
        PUSH      S:?b8
        LD        S:?b8, A
//  468   uint16_t temph = 0;
        CLRW      Y
//  469   uint8_t templ = 0;
        CLR       S:?b0
//  470   
//  471   /* Check the parameters */
//  472   assert_param(IS_ADC1_BUFFER_OK(Buffer));
        LD        A, S:?b8
        CP        A, #0xa
        JRC       L:??ADC1_GetBufferValue_0
        LDW       X, #0x1d8
        LDW       S:?w1, X
        CLRW      X
        LDW       S:?w0, X
        LDW       X, #`?<Constant "C:\\\\Users\\\\lun55\\\\Deskto...">`
        CALL      L:assert_failed
//  473   
//  474   if ((ADC1->CR2 & ADC1_CR2_ALIGN) != 0) /* Right alignment */
??ADC1_GetBufferValue_0:
        BTJF      L:0x5402, #0x3, L:??ADC1_GetBufferValue_1
//  475   {
//  476     /* Read LSB first */
//  477     templ = *(uint8_t*)(uint16_t)((uint16_t)ADC1_BaseAddress + (uint8_t)(Buffer << 1) + 1);
        LD        A, S:?b8
        SLL       A
        CLRW      X
        LD        XL, A
        ADDW      X, #0x53e1
        LD        A, (X)
        LD        S:?b0, A
//  478     /* Then read MSB */
//  479     temph = *(uint8_t*)(uint16_t)((uint16_t)ADC1_BaseAddress + (uint8_t)(Buffer << 1));
        LD        A, S:?b8
        SLL       A
        CLRW      X
        LD        XL, A
        ADDW      X, #0x53e0
        LD        A, (X)
        CLRW      Y
        LD        YL, A
//  480     
//  481     temph = (uint16_t)(templ | (uint16_t)(temph << (uint8_t)8));
        LDW       X, Y
        CLR       A
        RLWA      X, A
        CLRW      Y
        EXG       A, YL
        LD        A, S:?b0
        EXG       A, YL
        LDW       S:?w0, X
        EXGW      X, Y
        RRWA      X, A
        OR        A, S:?b1
        RRWA      X, A
        OR        A, S:?b0
        RRWA      X, A
        EXGW      X, Y
        JRA       L:??ADC1_GetBufferValue_2
//  482   }
//  483   else /* Left alignment */
//  484   {
//  485     /* Read MSB first*/
//  486     temph = *(uint8_t*)(uint16_t)((uint16_t)ADC1_BaseAddress + (uint8_t)(Buffer << 1));
??ADC1_GetBufferValue_1:
        LD        A, S:?b8
        SLL       A
        CLRW      X
        LD        XL, A
        ADDW      X, #0x53e0
        LD        A, (X)
        CLRW      Y
        LD        YL, A
//  487     /* Then read LSB */
//  488     templ = *(uint8_t*)(uint16_t)((uint16_t)ADC1_BaseAddress + (uint8_t)(Buffer << 1) + 1);
        LD        A, S:?b8
        SLL       A
        CLRW      X
        LD        XL, A
        ADDW      X, #0x53e1
        LD        A, (X)
        LD        S:?b0, A
//  489     
//  490     temph = (uint16_t)((uint16_t)((uint16_t)templ << 6) | (uint16_t)(temph << 8));
        CLRW      X
        EXG       A, XL
        LD        A, S:?b0
        EXG       A, XL
        CALL      L:?sll16_x_x_6
        LDW       S:?w1, X
        LDW       X, Y
        CLR       A
        RLWA      X, A
        LDW       S:?w0, X
        LDW       Y, S:?w1
        EXGW      X, Y
        RRWA      X, A
        OR        A, S:?b1
        RRWA      X, A
        OR        A, S:?b0
        RRWA      X, A
        EXGW      X, Y
//  491   }
//  492   
//  493   return ((uint16_t)temph);
??ADC1_GetBufferValue_2:
        LDW       X, Y
        POP       S:?b8
        RET
//  494 }
//  495 
//  496 /**
//  497   * @brief  Checks the specified analog watchdog channel status.
//  498   * @param   Channel: specify the channel of which to check the analog watchdog
//  499   * can be one of the values of @ref ADC1_Channel_TypeDef.
//  500   * @retval FlagStatus Status of the analog watchdog.
//  501   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  502 FlagStatus ADC1_GetAWDChannelStatus(ADC1_Channel_TypeDef Channel)
//  503 {
ADC1_GetAWDChannelStatus:
        PUSH      S:?b8
        LD        S:?b8, A
//  504   uint8_t status = 0;
        CLR       A
//  505   
//  506   /* Check the parameters */
//  507   assert_param(IS_ADC1_CHANNEL_OK(Channel));
        TNZ       S:?b8
        JREQ      L:??ADC1_GetAWDChannelStatus_0
        LD        A, S:?b8
        CP        A, #0x1
        JREQ      L:??ADC1_GetAWDChannelStatus_0
        LD        A, S:?b8
        CP        A, #0x2
        JREQ      L:??ADC1_GetAWDChannelStatus_0
        LD        A, S:?b8
        CP        A, #0x3
        JREQ      L:??ADC1_GetAWDChannelStatus_0
        LD        A, S:?b8
        CP        A, #0x4
        JREQ      L:??ADC1_GetAWDChannelStatus_0
        LD        A, S:?b8
        CP        A, #0x5
        JREQ      L:??ADC1_GetAWDChannelStatus_0
        LD        A, S:?b8
        CP        A, #0x6
        JREQ      L:??ADC1_GetAWDChannelStatus_0
        LD        A, S:?b8
        CP        A, #0x7
        JREQ      L:??ADC1_GetAWDChannelStatus_0
        LD        A, S:?b8
        CP        A, #0x8
        JREQ      L:??ADC1_GetAWDChannelStatus_0
        LD        A, S:?b8
        CP        A, #0xc
        JREQ      L:??ADC1_GetAWDChannelStatus_0
        LD        A, S:?b8
        CP        A, #0x9
        JREQ      L:??ADC1_GetAWDChannelStatus_0
        LDW       X, #0x1fb
        LDW       S:?w1, X
        CLRW      X
        LDW       S:?w0, X
        LDW       X, #`?<Constant "C:\\\\Users\\\\lun55\\\\Deskto...">`
        CALL      L:assert_failed
//  508   
//  509   if (Channel < (uint8_t)8)
??ADC1_GetAWDChannelStatus_0:
        LD        A, S:?b8
        CP        A, #0x8
        JRNC      L:??ADC1_GetAWDChannelStatus_1
//  510   {
//  511     status = (uint8_t)(ADC1->AWSRL & (uint8_t)((uint8_t)1 << Channel));
        CLRW      X
        INCW      X
        LD        A, S:?b8
        CALL      L:?sll16_x_x_a
        LD        A, XL
        AND       A, L:0x540d
        JRA       L:??ADC1_GetAWDChannelStatus_2
//  512   }
//  513   else /* Channel = 8 | 9 */
//  514   {
//  515     status = (uint8_t)(ADC1->AWSRH & (uint8_t)((uint8_t)1 << (Channel - (uint8_t)8)));
??ADC1_GetAWDChannelStatus_1:
        LD        A, S:?b8
        ADD       A, #0xf8
        CLRW      X
        INCW      X
        CALL      L:?sll16_x_x_a
        LD        A, XL
        AND       A, L:0x540c
//  516   }
//  517   
//  518   return ((FlagStatus)status);
??ADC1_GetAWDChannelStatus_2:
        POP       S:?b8
        RET
//  519 }
//  520 
//  521 /**
//  522   * @brief  Checks the specified ADC1 flag status.
//  523   * @param   Flag: ADC1 flag.
//  524   * can be one of the values of @ref ADC1_Flag_TypeDef.
//  525   * @retval FlagStatus Status of the ADC1 flag.
//  526   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  527 FlagStatus ADC1_GetFlagStatus(ADC1_Flag_TypeDef Flag)
//  528 {
ADC1_GetFlagStatus:
        PUSH      S:?b8
        LD        S:?b8, A
//  529   uint8_t flagstatus = 0;
        CLR       S:?b1
//  530   uint8_t temp = 0;
        CLR       S:?b0
//  531   
//  532   /* Check the parameters */
//  533   assert_param(IS_ADC1_FLAG_OK(Flag));
        LD        A, S:?b8
        CP        A, #0x80
        JREQ      L:??ADC1_GetFlagStatus_0
        LD        A, S:?b8
        CP        A, #0x41
        JREQ      L:??ADC1_GetFlagStatus_0
        LD        A, S:?b8
        CP        A, #0x40
        JREQ      L:??ADC1_GetFlagStatus_0
        LD        A, S:?b8
        CP        A, #0x10
        JREQ      L:??ADC1_GetFlagStatus_0
        LD        A, S:?b8
        CP        A, #0x11
        JREQ      L:??ADC1_GetFlagStatus_0
        LD        A, S:?b8
        CP        A, #0x12
        JREQ      L:??ADC1_GetFlagStatus_0
        LD        A, S:?b8
        CP        A, #0x13
        JREQ      L:??ADC1_GetFlagStatus_0
        LD        A, S:?b8
        CP        A, #0x14
        JREQ      L:??ADC1_GetFlagStatus_0
        LD        A, S:?b8
        CP        A, #0x15
        JREQ      L:??ADC1_GetFlagStatus_0
        LD        A, S:?b8
        CP        A, #0x16
        JREQ      L:??ADC1_GetFlagStatus_0
        LD        A, S:?b8
        CP        A, #0x17
        JREQ      L:??ADC1_GetFlagStatus_0
        LD        A, S:?b8
        CP        A, #0x18
        JREQ      L:??ADC1_GetFlagStatus_0
        LD        A, S:?b8
        CP        A, #0x19
        JREQ      L:??ADC1_GetFlagStatus_0
        LDW       X, #0x215
        LDW       S:?w1, X
        CLRW      X
        LDW       S:?w0, X
        LDW       X, #`?<Constant "C:\\\\Users\\\\lun55\\\\Deskto...">`
        CALL      L:assert_failed
//  534   
//  535   if ((Flag & 0x0F) == 0x01)
??ADC1_GetFlagStatus_0:
        LD        A, S:?b8
        AND       A, #0xf
        CP        A, #0x1
        JRNE      L:??ADC1_GetFlagStatus_1
//  536   {
//  537     /* Get OVR flag status */
//  538     flagstatus = (uint8_t)(ADC1->CR3 & ADC1_CR3_OVR);
        LD        A, L:0x5403
        AND       A, #0x40
        LD        S:?b1, A
        JRA       L:??ADC1_GetFlagStatus_2
//  539   }
//  540   else if ((Flag & 0xF0) == 0x10)
??ADC1_GetFlagStatus_1:
        LD        A, S:?b8
        AND       A, #0xf0
        CP        A, #0x10
        JRNE      L:??ADC1_GetFlagStatus_3
//  541   {
//  542     /* Get analog watchdog channel status */
//  543     temp = (uint8_t)(Flag & (uint8_t)0x0F);
        LD        A, S:?b8
        AND       A, #0xf
        LD        S:?b0, A
//  544     if (temp < 8)
        LD        A, S:?b0
        CP        A, #0x8
        JRNC      L:??ADC1_GetFlagStatus_4
//  545     {
//  546       flagstatus = (uint8_t)(ADC1->AWSRL & (uint8_t)((uint8_t)1 << temp));
        CLRW      X
        INCW      X
        LD        A, S:?b0
        CALL      L:?sll16_x_x_a
        LD        A, XL
        AND       A, L:0x540d
        LD        S:?b1, A
        JRA       L:??ADC1_GetFlagStatus_2
//  547     }
//  548     else
//  549     {
//  550       flagstatus = (uint8_t)(ADC1->AWSRH & (uint8_t)((uint8_t)1 << (temp - 8)));
??ADC1_GetFlagStatus_4:
        LD        A, S:?b0
        ADD       A, #0xf8
        CLRW      X
        INCW      X
        CALL      L:?sll16_x_x_a
        LD        A, XL
        AND       A, L:0x540c
        LD        S:?b1, A
        JRA       L:??ADC1_GetFlagStatus_2
//  551     }
//  552   }
//  553   else  /* Get EOC | AWD flag status */
//  554   {
//  555     flagstatus = (uint8_t)(ADC1->CSR & Flag);
??ADC1_GetFlagStatus_3:
        LD        A, S:?b8
        AND       A, L:0x5400
        LD        S:?b1, A
//  556   }
//  557   return ((FlagStatus)flagstatus);
??ADC1_GetFlagStatus_2:
        LD        A, S:?b1
        POP       S:?b8
        RET
//  558   
//  559 }
//  560 
//  561 /**
//  562   * @brief  Clear the specified ADC1 Flag.
//  563   * @param   Flag: ADC1 flag.
//  564   * can be one of the values of @ref ADC1_Flag_TypeDef.
//  565   * @retval None
//  566   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  567 void ADC1_ClearFlag(ADC1_Flag_TypeDef Flag)
//  568 {
ADC1_ClearFlag:
        PUSH      S:?b8
        LD        S:?b8, A
//  569   uint8_t temp = 0;
        CLR       S:?b0
//  570   
//  571   /* Check the parameters */
//  572   assert_param(IS_ADC1_FLAG_OK(Flag));
        LD        A, S:?b8
        CP        A, #0x80
        JREQ      L:??ADC1_ClearFlag_0
        LD        A, S:?b8
        CP        A, #0x41
        JREQ      L:??ADC1_ClearFlag_0
        LD        A, S:?b8
        CP        A, #0x40
        JREQ      L:??ADC1_ClearFlag_0
        LD        A, S:?b8
        CP        A, #0x10
        JREQ      L:??ADC1_ClearFlag_0
        LD        A, S:?b8
        CP        A, #0x11
        JREQ      L:??ADC1_ClearFlag_0
        LD        A, S:?b8
        CP        A, #0x12
        JREQ      L:??ADC1_ClearFlag_0
        LD        A, S:?b8
        CP        A, #0x13
        JREQ      L:??ADC1_ClearFlag_0
        LD        A, S:?b8
        CP        A, #0x14
        JREQ      L:??ADC1_ClearFlag_0
        LD        A, S:?b8
        CP        A, #0x15
        JREQ      L:??ADC1_ClearFlag_0
        LD        A, S:?b8
        CP        A, #0x16
        JREQ      L:??ADC1_ClearFlag_0
        LD        A, S:?b8
        CP        A, #0x17
        JREQ      L:??ADC1_ClearFlag_0
        LD        A, S:?b8
        CP        A, #0x18
        JREQ      L:??ADC1_ClearFlag_0
        LD        A, S:?b8
        CP        A, #0x19
        JREQ      L:??ADC1_ClearFlag_0
        LDW       X, #0x23c
        LDW       S:?w1, X
        CLRW      X
        LDW       S:?w0, X
        LDW       X, #`?<Constant "C:\\\\Users\\\\lun55\\\\Deskto...">`
        CALL      L:assert_failed
//  573   
//  574   if ((Flag & 0x0F) == 0x01)
??ADC1_ClearFlag_0:
        LD        A, S:?b8
        AND       A, #0xf
        CP        A, #0x1
        JRNE      L:??ADC1_ClearFlag_1
//  575   {
//  576     /* Clear OVR flag status */
//  577     ADC1->CR3 &= (uint8_t)(~ADC1_CR3_OVR);
        BRES      L:0x5403, #0x6
        JRA       L:??ADC1_ClearFlag_2
//  578   }
//  579   else if ((Flag & 0xF0) == 0x10)
??ADC1_ClearFlag_1:
        LD        A, S:?b8
        AND       A, #0xf0
        CP        A, #0x10
        JRNE      L:??ADC1_ClearFlag_3
//  580   {
//  581     /* Clear analog watchdog channel status */
//  582     temp = (uint8_t)(Flag & (uint8_t)0x0F);
        LD        A, S:?b8
        AND       A, #0xf
        LD        S:?b0, A
//  583     if (temp < 8)
        LD        A, S:?b0
        CP        A, #0x8
        JRNC      L:??ADC1_ClearFlag_4
//  584     {
//  585       ADC1->AWSRL &= (uint8_t)~(uint8_t)((uint8_t)1 << temp);
        CLRW      X
        INCW      X
        LD        A, S:?b0
        CALL      L:?sll16_x_x_a
        LD        A, XL
        CPL       A
        AND       A, L:0x540d
        LD        L:0x540d, A
        JRA       L:??ADC1_ClearFlag_2
//  586     }
//  587     else
//  588     {
//  589       ADC1->AWSRH &= (uint8_t)~(uint8_t)((uint8_t)1 << (temp - 8));
??ADC1_ClearFlag_4:
        LD        A, S:?b0
        ADD       A, #0xf8
        CLRW      X
        INCW      X
        CALL      L:?sll16_x_x_a
        LD        A, XL
        CPL       A
        AND       A, L:0x540c
        LD        L:0x540c, A
        JRA       L:??ADC1_ClearFlag_2
//  590     }
//  591   }
//  592   else  /* Clear EOC | AWD flag status */
//  593   {
//  594     ADC1->CSR &= (uint8_t) (~Flag);
??ADC1_ClearFlag_3:
        CPL       S:?b8
        LD        A, S:?b8
        AND       A, L:0x5400
        LD        L:0x5400, A
//  595   }
//  596 }
??ADC1_ClearFlag_2:
        POP       S:?b8
        RET
//  597 
//  598 /**
//  599   * @brief  Returns the specified pending bit status
//  600   * @param   ITPendingBit : the IT pending bit to check.
//  601   * This parameter can be one of the following values:
//  602   *    - ADC1_IT_AWD   : Analog WDG IT status
//  603   *    - ADC1_IT_AWS0 : Analog channel 0 IT status
//  604   *    - ADC1_IT_AWS1 : Analog channel 1 IT status
//  605   *    - ADC1_IT_AWS2 : Analog channel 2 IT status
//  606   *    - ADC1_IT_AWS3 : Analog channel 3 IT status
//  607   *    - ADC1_IT_AWS4 : Analog channel 4 IT status
//  608   *    - ADC1_IT_AWS5 : Analog channel 5 IT status
//  609   *    - ADC1_IT_AWS6 : Analog channel 6 IT status
//  610   *    - ADC1_IT_AWS7 : Analog channel 7 IT status
//  611   *    - ADC1_IT_AWS8 : Analog channel 8 IT status
//  612   *    - ADC1_IT_AWS9 : Analog channel 9 IT status
//  613   *    - ADC1_IT_EOC    : EOC pending bit
//  614   * @retval ITStatus: status of the specified pending bit.
//  615   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  616 ITStatus ADC1_GetITStatus(ADC1_IT_TypeDef ITPendingBit)
//  617 {
ADC1_GetITStatus:
        CALL      L:?push_w4
        LDW       S:?w4, X
//  618   ITStatus itstatus = RESET;
        CLR       S:?b0
//  619   uint8_t temp = 0;
        CLR       A
//  620   
//  621   /* Check the parameters */
//  622   assert_param(IS_ADC1_ITPENDINGBIT_OK(ITPendingBit));
        LDW       X, S:?w4
        CPW       X, #0x80
        JREQ      L:??ADC1_GetITStatus_0
        LDW       X, S:?w4
        CPW       X, #0x140
        JREQ      L:??ADC1_GetITStatus_0
        LDW       X, S:?w4
        CPW       X, #0x110
        JREQ      L:??ADC1_GetITStatus_0
        LDW       X, S:?w4
        CPW       X, #0x111
        JREQ      L:??ADC1_GetITStatus_0
        LDW       X, S:?w4
        CPW       X, #0x112
        JREQ      L:??ADC1_GetITStatus_0
        LDW       X, S:?w4
        CPW       X, #0x113
        JREQ      L:??ADC1_GetITStatus_0
        LDW       X, S:?w4
        CPW       X, #0x114
        JREQ      L:??ADC1_GetITStatus_0
        LDW       X, S:?w4
        CPW       X, #0x115
        JREQ      L:??ADC1_GetITStatus_0
        LDW       X, S:?w4
        CPW       X, #0x116
        JREQ      L:??ADC1_GetITStatus_0
        LDW       X, S:?w4
        CPW       X, #0x117
        JREQ      L:??ADC1_GetITStatus_0
        LDW       X, S:?w4
        CPW       X, #0x118
        JREQ      L:??ADC1_GetITStatus_0
        LDW       X, S:?w4
        CPW       X, #0x11c
        JREQ      L:??ADC1_GetITStatus_0
        LDW       X, S:?w4
        CPW       X, #0x119
        JREQ      L:??ADC1_GetITStatus_0
        LDW       X, #0x26e
        LDW       S:?w1, X
        CLRW      X
        LDW       S:?w0, X
        LDW       X, #`?<Constant "C:\\\\Users\\\\lun55\\\\Deskto...">`
        CALL      L:assert_failed
//  623   
//  624   if (((uint16_t)ITPendingBit & 0xF0) == 0x10)
??ADC1_GetITStatus_0:
        LD        A, S:?b9
        AND       A, #0xf0
        CP        A, #0x10
        JRNE      L:??ADC1_GetITStatus_1
//  625   {
//  626     /* Get analog watchdog channel status */
//  627     temp = (uint8_t)((uint16_t)ITPendingBit & 0x0F);
        LD        A, S:?b9
        AND       A, #0xf
//  628     if (temp < 8)
        CP        A, #0x8
        JRNC      L:??ADC1_GetITStatus_2
//  629     {
//  630       itstatus = (ITStatus)(ADC1->AWSRL & (uint8_t)((uint8_t)1 << temp));
        CLRW      X
        INCW      X
        CALL      L:?sll16_x_x_a
        LD        A, XL
        AND       A, L:0x540d
        LD        S:?b0, A
        JRA       L:??ADC1_GetITStatus_3
//  631     }
//  632     else
//  633     {
//  634       itstatus = (ITStatus)(ADC1->AWSRH & (uint8_t)((uint8_t)1 << (temp - 8)));
??ADC1_GetITStatus_2:
        ADD       A, #0xf8
        CLRW      X
        INCW      X
        CALL      L:?sll16_x_x_a
        LD        A, XL
        AND       A, L:0x540c
        LD        S:?b0, A
        JRA       L:??ADC1_GetITStatus_3
//  635     }
//  636   }
//  637   else  /* Get EOC | AWD flag status */
//  638   {
//  639     itstatus = (ITStatus)(ADC1->CSR & (uint8_t)ITPendingBit);
??ADC1_GetITStatus_1:
        LD        A, S:?b9
        AND       A, L:0x5400
        LD        S:?b0, A
//  640   }
//  641   return ((ITStatus)itstatus);
??ADC1_GetITStatus_3:
        LD        A, S:?b0
        JP        L:?epilogue_w4
//  642 }
//  643 
//  644 /**
//  645   * @brief  Clear the ADC1 End of Conversion pending bit.
//  646   * @param   ITPendingBit : the IT pending bit to clear.
//  647   * This parameter can be one of the following values:
//  648   *    - ADC1_IT_AWD   : Analog WDG IT status
//  649   *    - ADC1_IT_AWS0 : Analog channel 0 IT status
//  650   *    - ADC1_IT_AWS1 : Analog channel 1 IT status
//  651   *    - ADC1_IT_AWS2 : Analog channel 2 IT status
//  652   *    - ADC1_IT_AWS3 : Analog channel 3 IT status
//  653   *    - ADC1_IT_AWS4 : Analog channel 4 IT status
//  654   *    - ADC1_IT_AWS5 : Analog channel 5 IT status
//  655   *    - ADC1_IT_AWS6 : Analog channel 6 IT status
//  656   *    - ADC1_IT_AWS7 : Analog channel 7 IT status
//  657   *    - ADC1_IT_AWS8 : Analog channel 8 IT status
//  658   *    - ADC1_IT_AWS9 : Analog channel 9 IT status
//  659   *    - ADC1_IT_EOC  : EOC pending bit
//  660   * @retval None
//  661   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  662 void ADC1_ClearITPendingBit(ADC1_IT_TypeDef ITPendingBit)
//  663 {
ADC1_ClearITPendingBit:
        CALL      L:?push_w4
        LDW       S:?w4, X
//  664   uint8_t temp = 0;
        CLR       A
//  665   
//  666   /* Check the parameters */
//  667   assert_param(IS_ADC1_ITPENDINGBIT_OK(ITPendingBit));
        LDW       X, S:?w4
        CPW       X, #0x80
        JREQ      L:??ADC1_ClearITPendingBit_0
        LDW       X, S:?w4
        CPW       X, #0x140
        JREQ      L:??ADC1_ClearITPendingBit_0
        LDW       X, S:?w4
        CPW       X, #0x110
        JREQ      L:??ADC1_ClearITPendingBit_0
        LDW       X, S:?w4
        CPW       X, #0x111
        JREQ      L:??ADC1_ClearITPendingBit_0
        LDW       X, S:?w4
        CPW       X, #0x112
        JREQ      L:??ADC1_ClearITPendingBit_0
        LDW       X, S:?w4
        CPW       X, #0x113
        JREQ      L:??ADC1_ClearITPendingBit_0
        LDW       X, S:?w4
        CPW       X, #0x114
        JREQ      L:??ADC1_ClearITPendingBit_0
        LDW       X, S:?w4
        CPW       X, #0x115
        JREQ      L:??ADC1_ClearITPendingBit_0
        LDW       X, S:?w4
        CPW       X, #0x116
        JREQ      L:??ADC1_ClearITPendingBit_0
        LDW       X, S:?w4
        CPW       X, #0x117
        JREQ      L:??ADC1_ClearITPendingBit_0
        LDW       X, S:?w4
        CPW       X, #0x118
        JREQ      L:??ADC1_ClearITPendingBit_0
        LDW       X, S:?w4
        CPW       X, #0x11c
        JREQ      L:??ADC1_ClearITPendingBit_0
        LDW       X, S:?w4
        CPW       X, #0x119
        JREQ      L:??ADC1_ClearITPendingBit_0
        LDW       X, #0x29b
        LDW       S:?w1, X
        CLRW      X
        LDW       S:?w0, X
        LDW       X, #`?<Constant "C:\\\\Users\\\\lun55\\\\Deskto...">`
        CALL      L:assert_failed
//  668   
//  669   if (((uint16_t)ITPendingBit & 0xF0) == 0x10)
??ADC1_ClearITPendingBit_0:
        LD        A, S:?b9
        AND       A, #0xf0
        CP        A, #0x10
        JRNE      L:??ADC1_ClearITPendingBit_1
//  670   {
//  671     /* Clear analog watchdog channel status */
//  672     temp = (uint8_t)((uint16_t)ITPendingBit & 0x0F);
        LD        A, S:?b9
        AND       A, #0xf
//  673     if (temp < 8)
        CP        A, #0x8
        JRNC      L:??ADC1_ClearITPendingBit_2
//  674     {
//  675       ADC1->AWSRL &= (uint8_t)~(uint8_t)((uint8_t)1 << temp);
        CLRW      X
        INCW      X
        CALL      L:?sll16_x_x_a
        LD        A, XL
        CPL       A
        AND       A, L:0x540d
        LD        L:0x540d, A
        JP        L:?epilogue_w4
//  676     }
//  677     else
//  678     {
//  679       ADC1->AWSRH &= (uint8_t)~(uint8_t)((uint8_t)1 << (temp - 8));
??ADC1_ClearITPendingBit_2:
        ADD       A, #0xf8
        CLRW      X
        INCW      X
        CALL      L:?sll16_x_x_a
        LD        A, XL
        CPL       A
        AND       A, L:0x540c
        LD        L:0x540c, A
        JP        L:?epilogue_w4
//  680     }
//  681   }
//  682   else  /* Clear EOC | AWD flag status */
//  683   {
//  684     ADC1->CSR &= (uint8_t)((uint16_t)~(uint16_t)ITPendingBit);
??ADC1_ClearITPendingBit_1:
        LD        A, S:?b9
        CPL       A
        AND       A, L:0x5400
        LD        L:0x5400, A
//  685   }
//  686 }
        JP        L:?epilogue_w4

        SECTION VREGS:DATA:REORDER:NOROOT(0)

        SECTION `.near.rodata`:CONST:REORDER:NOROOT(0)
`?<Constant "C:\\\\Users\\\\lun55\\\\Deskto...">`:
        DC8 "C:\\Users\\lun55\\Desktop\\J19B_STM8\\Lib\\stm8s_adc1.c"

        END
//  687 
//  688 /**
//  689   * @}
//  690   */
//  691   
//  692 /**
//  693   * @}
//  694   */
//  695   
//  696 
//  697 /************************ (C) COPYRIGHT STMicroelectronics *****END OF FILE****/
// 
//    50 bytes in section .near.rodata
// 2 584 bytes in section .near_func.text
// 
// 2 584 bytes of CODE  memory
//    50 bytes of CONST memory
//
//Errors: none
//Warnings: none
