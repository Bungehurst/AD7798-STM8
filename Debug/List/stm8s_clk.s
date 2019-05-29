///////////////////////////////////////////////////////////////////////////////
//                                                                            /
//                                                      28/May/2019  16:13:16 /
// IAR C/C++ Compiler V1.31.1.20058 [Evaluation] for STM8                     /
// Copyright 2010-2012 IAR Systems AB.                                        /
//                                                                            /
//    Source file  =  E:\Desktop\J19B_STM8\Lib\src\stm8s_clk.c                /
//    Command line =  E:\Desktop\J19B_STM8\Lib\src\stm8s_clk.c -e -Ol         /
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
//    List file    =  E:\Desktop\J19B_STM8\Debug\List\stm8s_clk.s             /
//                                                                            /
//                                                                            /
///////////////////////////////////////////////////////////////////////////////

        NAME stm8s_clk

        EXTERN ?b0
        EXTERN ?b1
        EXTERN ?b10
        EXTERN ?b11
        EXTERN ?b12
        EXTERN ?b13
        EXTERN ?b2
        EXTERN ?b4
        EXTERN ?b5
        EXTERN ?b6
        EXTERN ?b8
        EXTERN ?b9
        EXTERN ?epilogue_l2_w6
        EXTERN ?epilogue_w4
        EXTERN ?push_l2
        EXTERN ?push_w4
        EXTERN ?push_w6
        EXTERN ?sll16_x_x_a
        EXTERN ?udiv32_l0_dl_l1
        EXTERN ?w0
        EXTERN ?w1
        EXTERN ?w2
        EXTERN ?w3
        EXTERN ?w4
        EXTERN assert_failed

        PUBLIC CLKPrescTable
        PUBLIC CLK_AdjustHSICalibrationValue
        PUBLIC CLK_CCOCmd
        PUBLIC CLK_CCOConfig
        PUBLIC CLK_ClearITPendingBit
        PUBLIC CLK_ClockSecuritySystemEnable
        PUBLIC CLK_ClockSwitchCmd
        PUBLIC CLK_ClockSwitchConfig
        PUBLIC CLK_DeInit
        PUBLIC CLK_FastHaltWakeUpCmd
        PUBLIC CLK_GetClockFreq
        PUBLIC CLK_GetFlagStatus
        PUBLIC CLK_GetITStatus
        PUBLIC CLK_GetSYSCLKSource
        PUBLIC CLK_HSECmd
        PUBLIC CLK_HSICmd
        PUBLIC CLK_HSIPrescalerConfig
        PUBLIC CLK_ITConfig
        PUBLIC CLK_LSICmd
        PUBLIC CLK_PeripheralClockConfig
        PUBLIC CLK_SWIMConfig
        PUBLIC CLK_SYSCLKConfig
        PUBLIC CLK_SYSCLKEmergencyClear
        PUBLIC CLK_SlowActiveHaltWakeUpCmd
        PUBLIC HSIDivFactor

// E:\Desktop\J19B_STM8\Lib\src\stm8s_clk.c
//    1 /**
//    2   ******************************************************************************
//    3   * @file    stm8s_clk.c
//    4   * @author  MCD Application Team
//    5   * @version V2.2.0
//    6   * @date    30-September-2014
//    7   * @brief   This file contains all the functions for the CLK peripheral.
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
//   29 
//   30 #include "stm8s_clk.h"
//   31 
//   32 /** @addtogroup STM8S_StdPeriph_Driver
//   33   * @{
//   34   */
//   35 /* Private typedef -----------------------------------------------------------*/
//   36 /* Private define ------------------------------------------------------------*/
//   37 /* Private macro -------------------------------------------------------------*/
//   38 /* Private variables ---------------------------------------------------------*/
//   39 /* Private function prototypes -----------------------------------------------*/
//   40 
//   41 /* Private Constants ---------------------------------------------------------*/
//   42 
//   43 /**
//   44   * @addtogroup CLK_Private_Constants
//   45   * @{
//   46   */
//   47 

        SECTION `.near.rodata`:CONST:REORDER:NOROOT(0)
//   48 CONST uint8_t HSIDivFactor[4] = {1, 2, 4, 8}; /*!< Holds the different HSI Divider factors */
HSIDivFactor:
        DC8 1, 2, 4, 8

        SECTION `.near.rodata`:CONST:REORDER:NOROOT(0)
//   49 CONST uint8_t CLKPrescTable[8] = {1, 2, 4, 8, 10, 16, 20, 40}; /*!< Holds the different CLK prescaler values */
CLKPrescTable:
        DC8 1, 2, 4, 8, 10, 16, 20, 40
//   50 
//   51 /**
//   52   * @}
//   53   */
//   54 
//   55 /* Public functions ----------------------------------------------------------*/
//   56 /**
//   57   * @addtogroup CLK_Public_Functions
//   58   * @{
//   59   */
//   60 
//   61 /**
//   62   * @brief  Deinitializes the CLK peripheral registers to their default reset
//   63   * values.
//   64   * @param  None
//   65   * @retval None
//   66   * @par Warning:
//   67   * Resetting the CCOR register: \n
//   68   * When the CCOEN bit is set, the reset of the CCOR register require
//   69   * two consecutive write instructions in order to reset first the CCOEN bit
//   70   * and the second one is to reset the CCOSEL bits.
//   71   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//   72 void CLK_DeInit(void)
//   73 {
//   74   CLK->ICKR = CLK_ICKR_RESET_VALUE;
CLK_DeInit:
        MOV       L:0x50c0, #0x1
//   75   CLK->ECKR = CLK_ECKR_RESET_VALUE;
        MOV       L:0x50c1, #0x0
//   76   CLK->SWR  = CLK_SWR_RESET_VALUE;
        MOV       L:0x50c4, #0xe1
//   77   CLK->SWCR = CLK_SWCR_RESET_VALUE;
        MOV       L:0x50c5, #0x0
//   78   CLK->CKDIVR = CLK_CKDIVR_RESET_VALUE;
        MOV       L:0x50c6, #0x18
//   79   CLK->PCKENR1 = CLK_PCKENR1_RESET_VALUE;
        MOV       L:0x50c7, #0xff
//   80   CLK->PCKENR2 = CLK_PCKENR2_RESET_VALUE;
        MOV       L:0x50ca, #0xff
//   81   CLK->CSSR = CLK_CSSR_RESET_VALUE;
        MOV       L:0x50c8, #0x0
//   82   CLK->CCOR = CLK_CCOR_RESET_VALUE;
        MOV       L:0x50c9, #0x0
//   83   while ((CLK->CCOR & CLK_CCOR_CCOEN)!= 0)
??CLK_DeInit_0:
        BTJT      L:0x50c9, #0x0, L:??CLK_DeInit_0
//   84   {}
//   85   CLK->CCOR = CLK_CCOR_RESET_VALUE;
        MOV       L:0x50c9, #0x0
//   86   CLK->HSITRIMR = CLK_HSITRIMR_RESET_VALUE;
        MOV       L:0x50cc, #0x0
//   87   CLK->SWIMCCR = CLK_SWIMCCR_RESET_VALUE;
        MOV       L:0x50cd, #0x0
//   88 }
        RET
//   89 
//   90 /**
//   91   * @brief   Configures the High Speed Internal oscillator (HSI).
//   92   * @par Full description:
//   93   * If CLK_FastHaltWakeup is enabled, HSI oscillator is automatically
//   94   * switched-on (HSIEN=1) and selected as next clock master
//   95   * (CKM=SWI=HSI) when resuming from HALT/ActiveHalt modes.\n
//   96   * @param   NewState this parameter is the Wake-up Mode state.
//   97   * @retval None
//   98   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//   99 void CLK_FastHaltWakeUpCmd(FunctionalState NewState)
//  100 {
CLK_FastHaltWakeUpCmd:
        PUSH      S:?b8
        LD        S:?b8, A
//  101   /* check the parameters */
//  102   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
        TNZ       S:?b8
        JREQ      L:??CLK_FastHaltWakeUpCmd_0
        LD        A, S:?b8
        CP        A, #0x1
        JREQ      L:??CLK_FastHaltWakeUpCmd_0
        LDW       X, #0x66
        LDW       S:?w1, X
        CLRW      X
        LDW       S:?w0, X
        LDW       X, #`?<Constant "E:\\\\Desktop\\\\J19B_STM8\\\\...">`
        CALL      L:assert_failed
//  103   
//  104   if (NewState != DISABLE)
??CLK_FastHaltWakeUpCmd_0:
        TNZ       S:?b8
        JREQ      L:??CLK_FastHaltWakeUpCmd_1
//  105   {
//  106     /* Set FHWU bit (HSI oscillator is automatically switched-on) */
//  107     CLK->ICKR |= CLK_ICKR_FHWU;
        BSET      L:0x50c0, #0x2
        JRA       L:??CLK_FastHaltWakeUpCmd_2
//  108   }
//  109   else  /* FastHaltWakeup = DISABLE */
//  110   {
//  111     /* Reset FHWU bit */
//  112     CLK->ICKR &= (uint8_t)(~CLK_ICKR_FHWU);
??CLK_FastHaltWakeUpCmd_1:
        BRES      L:0x50c0, #0x2
//  113   }
//  114 }
??CLK_FastHaltWakeUpCmd_2:
        POP       S:?b8
        RET
//  115 
//  116 /**
//  117   * @brief  Enable or Disable the External High Speed oscillator (HSE).
//  118   * @param   NewState new state of HSEEN, value accepted ENABLE, DISABLE.
//  119   * @retval None
//  120   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  121 void CLK_HSECmd(FunctionalState NewState)
//  122 {
CLK_HSECmd:
        PUSH      S:?b8
        LD        S:?b8, A
//  123   /* Check the parameters */
//  124   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
        TNZ       S:?b8
        JREQ      L:??CLK_HSECmd_0
        LD        A, S:?b8
        CP        A, #0x1
        JREQ      L:??CLK_HSECmd_0
        LDW       X, #0x7c
        LDW       S:?w1, X
        CLRW      X
        LDW       S:?w0, X
        LDW       X, #`?<Constant "E:\\\\Desktop\\\\J19B_STM8\\\\...">`
        CALL      L:assert_failed
//  125   
//  126   if (NewState != DISABLE)
??CLK_HSECmd_0:
        TNZ       S:?b8
        JREQ      L:??CLK_HSECmd_1
//  127   {
//  128     /* Set HSEEN bit */
//  129     CLK->ECKR |= CLK_ECKR_HSEEN;
        BSET      L:0x50c1, #0x0
        JRA       L:??CLK_HSECmd_2
//  130   }
//  131   else
//  132   {
//  133     /* Reset HSEEN bit */
//  134     CLK->ECKR &= (uint8_t)(~CLK_ECKR_HSEEN);
??CLK_HSECmd_1:
        BRES      L:0x50c1, #0x0
//  135   }
//  136 }
??CLK_HSECmd_2:
        POP       S:?b8
        RET
//  137 
//  138 /**
//  139   * @brief  Enables or disables the Internal High Speed oscillator (HSI).
//  140   * @param   NewState new state of HSIEN, value accepted ENABLE, DISABLE.
//  141   * @retval None
//  142   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  143 void CLK_HSICmd(FunctionalState NewState)
//  144 {
CLK_HSICmd:
        PUSH      S:?b8
        LD        S:?b8, A
//  145   /* Check the parameters */
//  146   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
        TNZ       S:?b8
        JREQ      L:??CLK_HSICmd_0
        LD        A, S:?b8
        CP        A, #0x1
        JREQ      L:??CLK_HSICmd_0
        LDW       X, #0x92
        LDW       S:?w1, X
        CLRW      X
        LDW       S:?w0, X
        LDW       X, #`?<Constant "E:\\\\Desktop\\\\J19B_STM8\\\\...">`
        CALL      L:assert_failed
//  147   
//  148   if (NewState != DISABLE)
??CLK_HSICmd_0:
        TNZ       S:?b8
        JREQ      L:??CLK_HSICmd_1
//  149   {
//  150     /* Set HSIEN bit */
//  151     CLK->ICKR |= CLK_ICKR_HSIEN;
        BSET      L:0x50c0, #0x0
        JRA       L:??CLK_HSICmd_2
//  152   }
//  153   else
//  154   {
//  155     /* Reset HSIEN bit */
//  156     CLK->ICKR &= (uint8_t)(~CLK_ICKR_HSIEN);
??CLK_HSICmd_1:
        BRES      L:0x50c0, #0x0
//  157   }
//  158 }
??CLK_HSICmd_2:
        POP       S:?b8
        RET
//  159 
//  160 /**
//  161   * @brief  Enables or disables the Internal Low Speed oscillator (LSI).
//  162   * @param  NewState new state of LSIEN, value accepted ENABLE, DISABLE.
//  163   * @note   Before using the LSI clock you have to enable the option bytes (LSI_EN option bit is set).
//  164   * @retval None
//  165   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  166 void CLK_LSICmd(FunctionalState NewState)
//  167 {
CLK_LSICmd:
        PUSH      S:?b8
        LD        S:?b8, A
//  168   /* Check the parameters */
//  169   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
        TNZ       S:?b8
        JREQ      L:??CLK_LSICmd_0
        LD        A, S:?b8
        CP        A, #0x1
        JREQ      L:??CLK_LSICmd_0
        LDW       X, #0xa9
        LDW       S:?w1, X
        CLRW      X
        LDW       S:?w0, X
        LDW       X, #`?<Constant "E:\\\\Desktop\\\\J19B_STM8\\\\...">`
        CALL      L:assert_failed
//  170   
//  171   if (NewState != DISABLE)
??CLK_LSICmd_0:
        TNZ       S:?b8
        JREQ      L:??CLK_LSICmd_1
//  172   {
//  173     /* Set LSIEN bit */
//  174     CLK->ICKR |= CLK_ICKR_LSIEN;
        BSET      L:0x50c0, #0x3
        JRA       L:??CLK_LSICmd_2
//  175   }
//  176   else
//  177   {
//  178     /* Reset LSIEN bit */
//  179     CLK->ICKR &= (uint8_t)(~CLK_ICKR_LSIEN);
??CLK_LSICmd_1:
        BRES      L:0x50c0, #0x3
//  180   }
//  181 }
??CLK_LSICmd_2:
        POP       S:?b8
        RET
//  182 
//  183 /**
//  184   * @brief  Enables or disablle the Configurable Clock Output (CCO).
//  185   * @param   NewState : New state of CCEN bit (CCO register).
//  186   * This parameter can be any of the @ref FunctionalState enumeration.
//  187   * @retval None
//  188   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  189 void CLK_CCOCmd(FunctionalState NewState)
//  190 {
CLK_CCOCmd:
        PUSH      S:?b8
        LD        S:?b8, A
//  191   /* Check the parameters */
//  192   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
        TNZ       S:?b8
        JREQ      L:??CLK_CCOCmd_0
        LD        A, S:?b8
        CP        A, #0x1
        JREQ      L:??CLK_CCOCmd_0
        LDW       X, #0xc0
        LDW       S:?w1, X
        CLRW      X
        LDW       S:?w0, X
        LDW       X, #`?<Constant "E:\\\\Desktop\\\\J19B_STM8\\\\...">`
        CALL      L:assert_failed
//  193   
//  194   if (NewState != DISABLE)
??CLK_CCOCmd_0:
        TNZ       S:?b8
        JREQ      L:??CLK_CCOCmd_1
//  195   {
//  196     /* Set CCOEN bit */
//  197     CLK->CCOR |= CLK_CCOR_CCOEN;
        BSET      L:0x50c9, #0x0
        JRA       L:??CLK_CCOCmd_2
//  198   }
//  199   else
//  200   {
//  201     /* Reset CCOEN bit */
//  202     CLK->CCOR &= (uint8_t)(~CLK_CCOR_CCOEN);
??CLK_CCOCmd_1:
        BRES      L:0x50c9, #0x0
//  203   }
//  204 }
??CLK_CCOCmd_2:
        POP       S:?b8
        RET
//  205 
//  206 /**
//  207   * @brief  Starts or Stops manually the clock switch execution.
//  208   * @par Full description:
//  209   * NewState parameter set the SWEN.
//  210   * @param   NewState new state of SWEN, value accepted ENABLE, DISABLE.
//  211   * @retval None
//  212   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  213 void CLK_ClockSwitchCmd(FunctionalState NewState)
//  214 {
CLK_ClockSwitchCmd:
        PUSH      S:?b8
        LD        S:?b8, A
//  215   /* Check the parameters */
//  216   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
        TNZ       S:?b8
        JREQ      L:??CLK_ClockSwitchCmd_0
        LD        A, S:?b8
        CP        A, #0x1
        JREQ      L:??CLK_ClockSwitchCmd_0
        LDW       X, #0xd8
        LDW       S:?w1, X
        CLRW      X
        LDW       S:?w0, X
        LDW       X, #`?<Constant "E:\\\\Desktop\\\\J19B_STM8\\\\...">`
        CALL      L:assert_failed
//  217   
//  218   if (NewState != DISABLE )
??CLK_ClockSwitchCmd_0:
        TNZ       S:?b8
        JREQ      L:??CLK_ClockSwitchCmd_1
//  219   {
//  220     /* Enable the Clock Switch */
//  221     CLK->SWCR |= CLK_SWCR_SWEN;
        BSET      L:0x50c5, #0x1
        JRA       L:??CLK_ClockSwitchCmd_2
//  222   }
//  223   else
//  224   {
//  225     /* Disable the Clock Switch */
//  226     CLK->SWCR &= (uint8_t)(~CLK_SWCR_SWEN);
??CLK_ClockSwitchCmd_1:
        BRES      L:0x50c5, #0x1
//  227   }
//  228 }
??CLK_ClockSwitchCmd_2:
        POP       S:?b8
        RET
//  229 
//  230 /**
//  231   * @brief  Configures the slow active halt wake up
//  232   * @param   NewState: specifies the Slow Active Halt wake up state.
//  233   * can be set of the following values:
//  234   * - DISABLE: Slow Active Halt mode disabled;
//  235   * - ENABLE:  Slow Active Halt mode enabled.
//  236   * @retval None
//  237   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  238 void CLK_SlowActiveHaltWakeUpCmd(FunctionalState NewState)
//  239 {
CLK_SlowActiveHaltWakeUpCmd:
        PUSH      S:?b8
        LD        S:?b8, A
//  240   /* check the parameters */
//  241   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
        TNZ       S:?b8
        JREQ      L:??CLK_SlowActiveHaltWakeUpCmd_0
        LD        A, S:?b8
        CP        A, #0x1
        JREQ      L:??CLK_SlowActiveHaltWakeUpCmd_0
        LDW       X, #0xf1
        LDW       S:?w1, X
        CLRW      X
        LDW       S:?w0, X
        LDW       X, #`?<Constant "E:\\\\Desktop\\\\J19B_STM8\\\\...">`
        CALL      L:assert_failed
//  242   
//  243   if (NewState != DISABLE)
??CLK_SlowActiveHaltWakeUpCmd_0:
        TNZ       S:?b8
        JREQ      L:??CLK_SlowActiveHaltWakeUpCmd_1
//  244   {
//  245     /* Set S_ACTHALT bit */
//  246     CLK->ICKR |= CLK_ICKR_SWUAH;
        BSET      L:0x50c0, #0x5
        JRA       L:??CLK_SlowActiveHaltWakeUpCmd_2
//  247   }
//  248   else
//  249   {
//  250     /* Reset S_ACTHALT bit */
//  251     CLK->ICKR &= (uint8_t)(~CLK_ICKR_SWUAH);
??CLK_SlowActiveHaltWakeUpCmd_1:
        BRES      L:0x50c0, #0x5
//  252   }
//  253 }
??CLK_SlowActiveHaltWakeUpCmd_2:
        POP       S:?b8
        RET
//  254 
//  255 /**
//  256   * @brief   Enables or disables the specified peripheral CLK.
//  257   * @param   CLK_Peripheral : This parameter specifies the peripheral clock to gate.
//  258   * This parameter can be any of the  @ref CLK_Peripheral_TypeDef enumeration.
//  259   * @param   NewState : New state of specified peripheral clock.
//  260   * This parameter can be any of the @ref FunctionalState enumeration.
//  261   * @retval None
//  262   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  263 void CLK_PeripheralClockConfig(CLK_Peripheral_TypeDef CLK_Peripheral, FunctionalState NewState)
//  264 {
CLK_PeripheralClockConfig:
        CALL      L:?push_w4
        LD        S:?b8, A
        MOV       S:?b9, S:?b0
//  265   /* Check the parameters */
//  266   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
        TNZ       S:?b9
        JREQ      L:??CLK_PeripheralClockConfig_0
        LD        A, S:?b9
        CP        A, #0x1
        JREQ      L:??CLK_PeripheralClockConfig_0
        LDW       X, #0x10a
        LDW       S:?w1, X
        CLRW      X
        LDW       S:?w0, X
        LDW       X, #`?<Constant "E:\\\\Desktop\\\\J19B_STM8\\\\...">`
        CALL      L:assert_failed
//  267   assert_param(IS_CLK_PERIPHERAL_OK(CLK_Peripheral));
??CLK_PeripheralClockConfig_0:
        TNZ       S:?b8
        JREQ      L:??CLK_PeripheralClockConfig_1
        LD        A, S:?b8
        CP        A, #0x1
        JREQ      L:??CLK_PeripheralClockConfig_1
        LD        A, S:?b8
        CP        A, #0x3
        JREQ      L:??CLK_PeripheralClockConfig_1
        LD        A, S:?b8
        CP        A, #0x3
        JREQ      L:??CLK_PeripheralClockConfig_1
        LD        A, S:?b8
        CP        A, #0x3
        JREQ      L:??CLK_PeripheralClockConfig_1
        LD        A, S:?b8
        CP        A, #0x4
        JREQ      L:??CLK_PeripheralClockConfig_1
        LD        A, S:?b8
        CP        A, #0x5
        JREQ      L:??CLK_PeripheralClockConfig_1
        LD        A, S:?b8
        CP        A, #0x5
        JREQ      L:??CLK_PeripheralClockConfig_1
        LD        A, S:?b8
        CP        A, #0x4
        JREQ      L:??CLK_PeripheralClockConfig_1
        LD        A, S:?b8
        CP        A, #0x6
        JREQ      L:??CLK_PeripheralClockConfig_1
        LD        A, S:?b8
        CP        A, #0x7
        JREQ      L:??CLK_PeripheralClockConfig_1
        LD        A, S:?b8
        CP        A, #0x17
        JREQ      L:??CLK_PeripheralClockConfig_1
        LD        A, S:?b8
        CP        A, #0x13
        JREQ      L:??CLK_PeripheralClockConfig_1
        LD        A, S:?b8
        CP        A, #0x12
        JREQ      L:??CLK_PeripheralClockConfig_1
        LDW       X, #0x10b
        LDW       S:?w1, X
        CLRW      X
        LDW       S:?w0, X
        LDW       X, #`?<Constant "E:\\\\Desktop\\\\J19B_STM8\\\\...">`
        CALL      L:assert_failed
//  268   
//  269   if (((uint8_t)CLK_Peripheral & (uint8_t)0x10) == 0x00)
??CLK_PeripheralClockConfig_1:
        LD        A, S:?b8
        AND       A, #0x10
        CP        A, #0x0
        JRNE      L:??CLK_PeripheralClockConfig_2
//  270   {
//  271     if (NewState != DISABLE)
        TNZ       S:?b9
        JREQ      L:??CLK_PeripheralClockConfig_3
//  272     {
//  273       /* Enable the peripheral Clock */
//  274       CLK->PCKENR1 |= (uint8_t)((uint8_t)1 << ((uint8_t)CLK_Peripheral & (uint8_t)0x0F));
        LD        A, S:?b8
        AND       A, #0xf
        CLRW      X
        INCW      X
        CALL      L:?sll16_x_x_a
        LD        A, XL
        OR        A, L:0x50c7
        LD        L:0x50c7, A
        JP        L:?epilogue_w4
//  275     }
//  276     else
//  277     {
//  278       /* Disable the peripheral Clock */
//  279       CLK->PCKENR1 &= (uint8_t)(~(uint8_t)(((uint8_t)1 << ((uint8_t)CLK_Peripheral & (uint8_t)0x0F))));
??CLK_PeripheralClockConfig_3:
        LD        A, S:?b8
        AND       A, #0xf
        CLRW      X
        INCW      X
        CALL      L:?sll16_x_x_a
        LD        A, XL
        CPL       A
        AND       A, L:0x50c7
        LD        L:0x50c7, A
        JP        L:?epilogue_w4
//  280     }
//  281   }
//  282   else
//  283   {
//  284     if (NewState != DISABLE)
??CLK_PeripheralClockConfig_2:
        TNZ       S:?b9
        JREQ      L:??CLK_PeripheralClockConfig_4
//  285     {
//  286       /* Enable the peripheral Clock */
//  287       CLK->PCKENR2 |= (uint8_t)((uint8_t)1 << ((uint8_t)CLK_Peripheral & (uint8_t)0x0F));
        LD        A, S:?b8
        AND       A, #0xf
        CLRW      X
        INCW      X
        CALL      L:?sll16_x_x_a
        LD        A, XL
        OR        A, L:0x50ca
        LD        L:0x50ca, A
        JP        L:?epilogue_w4
//  288     }
//  289     else
//  290     {
//  291       /* Disable the peripheral Clock */
//  292       CLK->PCKENR2 &= (uint8_t)(~(uint8_t)(((uint8_t)1 << ((uint8_t)CLK_Peripheral & (uint8_t)0x0F))));
??CLK_PeripheralClockConfig_4:
        LD        A, S:?b8
        AND       A, #0xf
        CLRW      X
        INCW      X
        CALL      L:?sll16_x_x_a
        LD        A, XL
        CPL       A
        AND       A, L:0x50ca
        LD        L:0x50ca, A
//  293     }
//  294   }
//  295 }
        JP        L:?epilogue_w4
//  296 
//  297 /**
//  298   * @brief  configures the Switch from one clock to another
//  299   * @param   CLK_SwitchMode select the clock switch mode.
//  300   * It can be set of the values of @ref CLK_SwitchMode_TypeDef
//  301   * @param   CLK_NewClock choice of the future clock.
//  302   * It can be set of the values of @ref CLK_Source_TypeDef
//  303   * @param   NewState Enable or Disable the Clock Switch interrupt.
//  304   * @param   CLK_CurrentClockState current clock to switch OFF or to keep ON.
//  305   * It can be set of the values of @ref CLK_CurrentClockState_TypeDef
//  306   * @note LSI selected as master clock source only if LSI_EN option bit is set.
//  307   * @retval ErrorStatus this shows the clock switch status (ERROR/SUCCESS).
//  308   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  309 ErrorStatus CLK_ClockSwitchConfig(CLK_SwitchMode_TypeDef CLK_SwitchMode, CLK_Source_TypeDef CLK_NewClock, FunctionalState ITState, CLK_CurrentClockState_TypeDef CLK_CurrentClockState)
//  310 {
CLK_ClockSwitchConfig:
        CALL      L:?push_l2
        CALL      L:?push_w6
        LD        S:?b10, A
        MOV       S:?b11, S:?b0
        MOV       S:?b12, S:?b1
        MOV       S:?b13, S:?b2
//  311   CLK_Source_TypeDef clock_master;
//  312   uint16_t DownCounter = CLK_TIMEOUT;
        CLRW      X
        DECW      X
        LDW       S:?w4, X
//  313   ErrorStatus Swif = ERROR;
        CLR       S:?b0
//  314   
//  315   /* Check the parameters */
//  316   assert_param(IS_CLK_SOURCE_OK(CLK_NewClock));
        LD        A, S:?b11
        CP        A, #0xe1
        JREQ      L:??CLK_ClockSwitchConfig_0
        LD        A, S:?b11
        CP        A, #0xd2
        JREQ      L:??CLK_ClockSwitchConfig_0
        LD        A, S:?b11
        CP        A, #0xb4
        JREQ      L:??CLK_ClockSwitchConfig_0
        LDW       X, #0x13c
        LDW       S:?w1, X
        CLRW      X
        LDW       S:?w0, X
        LDW       X, #`?<Constant "E:\\\\Desktop\\\\J19B_STM8\\\\...">`
        CALL      L:assert_failed
//  317   assert_param(IS_CLK_SWITCHMODE_OK(CLK_SwitchMode));
??CLK_ClockSwitchConfig_0:
        TNZ       S:?b10
        JREQ      L:??CLK_ClockSwitchConfig_1
        LD        A, S:?b10
        CP        A, #0x1
        JREQ      L:??CLK_ClockSwitchConfig_1
        LDW       X, #0x13d
        LDW       S:?w1, X
        CLRW      X
        LDW       S:?w0, X
        LDW       X, #`?<Constant "E:\\\\Desktop\\\\J19B_STM8\\\\...">`
        CALL      L:assert_failed
//  318   assert_param(IS_FUNCTIONALSTATE_OK(ITState));
??CLK_ClockSwitchConfig_1:
        TNZ       S:?b12
        JREQ      L:??CLK_ClockSwitchConfig_2
        LD        A, S:?b12
        CP        A, #0x1
        JREQ      L:??CLK_ClockSwitchConfig_2
        LDW       X, #0x13e
        LDW       S:?w1, X
        CLRW      X
        LDW       S:?w0, X
        LDW       X, #`?<Constant "E:\\\\Desktop\\\\J19B_STM8\\\\...">`
        CALL      L:assert_failed
//  319   assert_param(IS_CLK_CURRENTCLOCKSTATE_OK(CLK_CurrentClockState));
??CLK_ClockSwitchConfig_2:
        TNZ       S:?b13
        JREQ      L:??CLK_ClockSwitchConfig_3
        LD        A, S:?b13
        CP        A, #0x1
        JREQ      L:??CLK_ClockSwitchConfig_3
        LDW       X, #0x13f
        LDW       S:?w1, X
        CLRW      X
        LDW       S:?w0, X
        LDW       X, #`?<Constant "E:\\\\Desktop\\\\J19B_STM8\\\\...">`
        CALL      L:assert_failed
//  320   
//  321   /* Current clock master saving */
//  322   clock_master = (CLK_Source_TypeDef)CLK->CMSR;
??CLK_ClockSwitchConfig_3:
        LD        A, L:0x50c3
        LD        S:?b1, A
//  323   
//  324   /* Automatic switch mode management */
//  325   if (CLK_SwitchMode == CLK_SWITCHMODE_AUTO)
        LD        A, S:?b10
        CP        A, #0x1
        JRNE      L:??CLK_ClockSwitchConfig_4
//  326   {
//  327     /* Enables Clock switch */
//  328     CLK->SWCR |= CLK_SWCR_SWEN;
        BSET      L:0x50c5, #0x1
//  329     
//  330     /* Enables or Disables Switch interrupt */
//  331     if (ITState != DISABLE)
        TNZ       S:?b12
        JREQ      L:??CLK_ClockSwitchConfig_5
//  332     {
//  333       CLK->SWCR |= CLK_SWCR_SWIEN;
        BSET      L:0x50c5, #0x2
        JRA       L:??CLK_ClockSwitchConfig_6
//  334     }
//  335     else
//  336     {
//  337       CLK->SWCR &= (uint8_t)(~CLK_SWCR_SWIEN);
??CLK_ClockSwitchConfig_5:
        BRES      L:0x50c5, #0x2
//  338     }
//  339     
//  340     /* Selection of the target clock source */
//  341     CLK->SWR = (uint8_t)CLK_NewClock;
??CLK_ClockSwitchConfig_6:
        LD        A, S:?b11
        LD        L:0x50c4, A
        JRA       L:??CLK_ClockSwitchConfig_7
//  342     
//  343     /* Wait until the target clock source is ready */
//  344     while((((CLK->SWCR & CLK_SWCR_SWBSY) != 0 )&& (DownCounter != 0)))
//  345     {
//  346       DownCounter--;
??CLK_ClockSwitchConfig_8:
        LDW       X, S:?w4
        DECW      X
        LDW       S:?w4, X
//  347     }
??CLK_ClockSwitchConfig_7:
        BTJF      L:0x50c5, #0x0, L:??CLK_ClockSwitchConfig_9
        LDW       X, S:?w4
        TNZW      X
        JRNE      L:??CLK_ClockSwitchConfig_8
//  348     
//  349     if(DownCounter != 0)
??CLK_ClockSwitchConfig_9:
        LDW       X, S:?w4
        TNZW      X
        JREQ      L:??CLK_ClockSwitchConfig_10
//  350     {
//  351       Swif = SUCCESS;
        MOV       S:?b0, #0x1
        JRA       L:??CLK_ClockSwitchConfig_11
//  352     }
//  353     else
//  354     {
//  355       Swif = ERROR;
??CLK_ClockSwitchConfig_10:
        CLR       S:?b0
        JRA       L:??CLK_ClockSwitchConfig_11
//  356     }
//  357   }
//  358   else /* CLK_SwitchMode == CLK_SWITCHMODE_MANUAL */
//  359   {
//  360     /* Enables or Disables Switch interrupt  if required  */
//  361     if (ITState != DISABLE)
??CLK_ClockSwitchConfig_4:
        TNZ       S:?b12
        JREQ      L:??CLK_ClockSwitchConfig_12
//  362     {
//  363       CLK->SWCR |= CLK_SWCR_SWIEN;
        BSET      L:0x50c5, #0x2
        JRA       L:??CLK_ClockSwitchConfig_13
//  364     }
//  365     else
//  366     {
//  367       CLK->SWCR &= (uint8_t)(~CLK_SWCR_SWIEN);
??CLK_ClockSwitchConfig_12:
        BRES      L:0x50c5, #0x2
//  368     }
//  369     
//  370     /* Selection of the target clock source */
//  371     CLK->SWR = (uint8_t)CLK_NewClock;
??CLK_ClockSwitchConfig_13:
        LD        A, S:?b11
        LD        L:0x50c4, A
        JRA       L:??CLK_ClockSwitchConfig_14
//  372     
//  373     /* Wait until the target clock source is ready */
//  374     while((((CLK->SWCR & CLK_SWCR_SWIF) != 0 ) && (DownCounter != 0)))
//  375     {
//  376       DownCounter--;
??CLK_ClockSwitchConfig_15:
        LDW       X, S:?w4
        DECW      X
        LDW       S:?w4, X
//  377     }
??CLK_ClockSwitchConfig_14:
        BTJF      L:0x50c5, #0x3, L:??CLK_ClockSwitchConfig_16
        LDW       X, S:?w4
        TNZW      X
        JRNE      L:??CLK_ClockSwitchConfig_15
//  378     
//  379     if(DownCounter != 0)
??CLK_ClockSwitchConfig_16:
        LDW       X, S:?w4
        TNZW      X
        JREQ      L:??CLK_ClockSwitchConfig_17
//  380     {
//  381       /* Enables Clock switch */
//  382       CLK->SWCR |= CLK_SWCR_SWEN;
        BSET      L:0x50c5, #0x1
//  383       Swif = SUCCESS;
        MOV       S:?b0, #0x1
        JRA       L:??CLK_ClockSwitchConfig_11
//  384     }
//  385     else
//  386     {
//  387       Swif = ERROR;
??CLK_ClockSwitchConfig_17:
        CLR       S:?b0
//  388     }
//  389   }
//  390   if(Swif != ERROR)
??CLK_ClockSwitchConfig_11:
        TNZ       S:?b0
        JREQ      L:??CLK_ClockSwitchConfig_18
//  391   {
//  392     /* Switch OFF current clock if required */
//  393     if((CLK_CurrentClockState == CLK_CURRENTCLOCKSTATE_DISABLE) && ( clock_master == CLK_SOURCE_HSI))
        TNZ       S:?b13
        JRNE      L:??CLK_ClockSwitchConfig_19
        LD        A, S:?b1
        CP        A, #0xe1
        JRNE      L:??CLK_ClockSwitchConfig_19
//  394     {
//  395       CLK->ICKR &= (uint8_t)(~CLK_ICKR_HSIEN);
        BRES      L:0x50c0, #0x0
        JRA       L:??CLK_ClockSwitchConfig_18
//  396     }
//  397     else if((CLK_CurrentClockState == CLK_CURRENTCLOCKSTATE_DISABLE) && ( clock_master == CLK_SOURCE_LSI))
??CLK_ClockSwitchConfig_19:
        TNZ       S:?b13
        JRNE      L:??CLK_ClockSwitchConfig_20
        LD        A, S:?b1
        CP        A, #0xd2
        JRNE      L:??CLK_ClockSwitchConfig_20
//  398     {
//  399       CLK->ICKR &= (uint8_t)(~CLK_ICKR_LSIEN);
        BRES      L:0x50c0, #0x3
        JRA       L:??CLK_ClockSwitchConfig_18
//  400     }
//  401     else if ((CLK_CurrentClockState == CLK_CURRENTCLOCKSTATE_DISABLE) && ( clock_master == CLK_SOURCE_HSE))
??CLK_ClockSwitchConfig_20:
        TNZ       S:?b13
        JRNE      L:??CLK_ClockSwitchConfig_18
        LD        A, S:?b1
        CP        A, #0xb4
        JRNE      L:??CLK_ClockSwitchConfig_18
//  402     {
//  403       CLK->ECKR &= (uint8_t)(~CLK_ECKR_HSEEN);
        BRES      L:0x50c1, #0x0
//  404     }
//  405   }
//  406   return(Swif);
??CLK_ClockSwitchConfig_18:
        LD        A, S:?b0
        JP        L:?epilogue_l2_w6
//  407 }
//  408 
//  409 /**
//  410   * @brief  Configures the HSI clock dividers.
//  411   * @param   HSIPrescaler : Specifies the HSI clock divider to apply.
//  412   * This parameter can be any of the @ref CLK_Prescaler_TypeDef enumeration.
//  413   * @retval None
//  414   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  415 void CLK_HSIPrescalerConfig(CLK_Prescaler_TypeDef HSIPrescaler)
//  416 {
CLK_HSIPrescalerConfig:
        PUSH      S:?b8
        LD        S:?b8, A
//  417   /* check the parameters */
//  418   assert_param(IS_CLK_HSIPRESCALER_OK(HSIPrescaler));
        TNZ       S:?b8
        JREQ      L:??CLK_HSIPrescalerConfig_0
        LD        A, S:?b8
        CP        A, #0x8
        JREQ      L:??CLK_HSIPrescalerConfig_0
        LD        A, S:?b8
        CP        A, #0x10
        JREQ      L:??CLK_HSIPrescalerConfig_0
        LD        A, S:?b8
        CP        A, #0x18
        JREQ      L:??CLK_HSIPrescalerConfig_0
        LDW       X, #0x1a2
        LDW       S:?w1, X
        CLRW      X
        LDW       S:?w0, X
        LDW       X, #`?<Constant "E:\\\\Desktop\\\\J19B_STM8\\\\...">`
        CALL      L:assert_failed
//  419   
//  420   /* Clear High speed internal clock prescaler */
//  421   CLK->CKDIVR &= (uint8_t)(~CLK_CKDIVR_HSIDIV);
??CLK_HSIPrescalerConfig_0:
        LD        A, L:0x50c6
        AND       A, #0xe7
        LD        L:0x50c6, A
//  422   
//  423   /* Set High speed internal clock prescaler */
//  424   CLK->CKDIVR |= (uint8_t)HSIPrescaler;
        LD        A, S:?b8
        OR        A, L:0x50c6
        LD        L:0x50c6, A
//  425 }
        POP       S:?b8
        RET
//  426 
//  427 /**
//  428   * @brief  Output the selected clock on a dedicated I/O pin.
//  429   * @param   CLK_CCO : Specifies the clock source.
//  430   * This parameter can be any of the  @ref CLK_Output_TypeDef enumeration.
//  431   * @retval None
//  432   * @par Required preconditions:
//  433   * The dedicated I/O pin must be set at 1 in the corresponding Px_CR1 register \n
//  434   * to be set as input with pull-up or push-pull output.
//  435   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  436 void CLK_CCOConfig(CLK_Output_TypeDef CLK_CCO)
//  437 {
CLK_CCOConfig:
        PUSH      S:?b8
        LD        S:?b8, A
//  438   /* check the parameters */
//  439   assert_param(IS_CLK_OUTPUT_OK(CLK_CCO));
        TNZ       S:?b8
        JREQ      L:??CLK_CCOConfig_0
        LD        A, S:?b8
        CP        A, #0x4
        JREQ      L:??CLK_CCOConfig_0
        LD        A, S:?b8
        CP        A, #0x2
        JREQ      L:??CLK_CCOConfig_0
        LD        A, S:?b8
        CP        A, #0x8
        JREQ      L:??CLK_CCOConfig_0
        LD        A, S:?b8
        CP        A, #0xa
        JREQ      L:??CLK_CCOConfig_0
        LD        A, S:?b8
        CP        A, #0xc
        JREQ      L:??CLK_CCOConfig_0
        LD        A, S:?b8
        CP        A, #0xe
        JREQ      L:??CLK_CCOConfig_0
        LD        A, S:?b8
        CP        A, #0x10
        JREQ      L:??CLK_CCOConfig_0
        LD        A, S:?b8
        CP        A, #0x12
        JREQ      L:??CLK_CCOConfig_0
        LD        A, S:?b8
        CP        A, #0x14
        JREQ      L:??CLK_CCOConfig_0
        LD        A, S:?b8
        CP        A, #0x16
        JREQ      L:??CLK_CCOConfig_0
        LD        A, S:?b8
        CP        A, #0x18
        JREQ      L:??CLK_CCOConfig_0
        LD        A, S:?b8
        CP        A, #0x1a
        JREQ      L:??CLK_CCOConfig_0
        LDW       X, #0x1b7
        LDW       S:?w1, X
        CLRW      X
        LDW       S:?w0, X
        LDW       X, #`?<Constant "E:\\\\Desktop\\\\J19B_STM8\\\\...">`
        CALL      L:assert_failed
//  440   
//  441   /* Clears of the CCO type bits part */
//  442   CLK->CCOR &= (uint8_t)(~CLK_CCOR_CCOSEL);
??CLK_CCOConfig_0:
        LD        A, L:0x50c9
        AND       A, #0xe1
        LD        L:0x50c9, A
//  443   
//  444   /* Selects the source provided on cco_ck output */
//  445   CLK->CCOR |= (uint8_t)CLK_CCO;
        LD        A, S:?b8
        OR        A, L:0x50c9
        LD        L:0x50c9, A
//  446   
//  447   /* Enable the clock output */
//  448   CLK->CCOR |= CLK_CCOR_CCOEN;
        BSET      L:0x50c9, #0x0
//  449 }
        POP       S:?b8
        RET
//  450 
//  451 /**
//  452   * @brief   Enables or disables the specified CLK interrupts.
//  453   * @param   CLK_IT This parameter specifies the interrupt sources.
//  454   * It can be one of the values of @ref CLK_IT_TypeDef.
//  455   * @param   NewState New state of the Interrupt.
//  456   * Value accepted ENABLE, DISABLE.
//  457   * @retval None
//  458   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  459 void CLK_ITConfig(CLK_IT_TypeDef CLK_IT, FunctionalState NewState)
//  460 {
CLK_ITConfig:
        CALL      L:?push_w4
        LD        S:?b8, A
        MOV       S:?b9, S:?b0
//  461   /* check the parameters */
//  462   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
        TNZ       S:?b9
        JREQ      L:??CLK_ITConfig_0
        LD        A, S:?b9
        CP        A, #0x1
        JREQ      L:??CLK_ITConfig_0
        LDW       X, #0x1ce
        LDW       S:?w1, X
        CLRW      X
        LDW       S:?w0, X
        LDW       X, #`?<Constant "E:\\\\Desktop\\\\J19B_STM8\\\\...">`
        CALL      L:assert_failed
//  463   assert_param(IS_CLK_IT_OK(CLK_IT));
??CLK_ITConfig_0:
        LD        A, S:?b8
        CP        A, #0xc
        JREQ      L:??CLK_ITConfig_1
        LD        A, S:?b8
        CP        A, #0x1c
        JREQ      L:??CLK_ITConfig_1
        LDW       X, #0x1cf
        LDW       S:?w1, X
        CLRW      X
        LDW       S:?w0, X
        LDW       X, #`?<Constant "E:\\\\Desktop\\\\J19B_STM8\\\\...">`
        CALL      L:assert_failed
//  464   
//  465   if (NewState != DISABLE)
??CLK_ITConfig_1:
        TNZ       S:?b9
        JREQ      L:??CLK_ITConfig_2
//  466   {
//  467     switch (CLK_IT)
        LD        A, S:?b8
        SUB       A, #0xc
        JREQ      L:??CLK_ITConfig_3
        SUB       A, #0x10
        JRNE      L:??CLK_ITConfig_4
//  468     {
//  469     case CLK_IT_SWIF: /* Enable the clock switch interrupt */
//  470       CLK->SWCR |= CLK_SWCR_SWIEN;
        BSET      L:0x50c5, #0x2
//  471       break;
        JP        L:?epilogue_w4
//  472     case CLK_IT_CSSD: /* Enable the clock security system detection interrupt */
//  473       CLK->CSSR |= CLK_CSSR_CSSDIE;
??CLK_ITConfig_3:
        BSET      L:0x50c8, #0x2
//  474       break;
        JP        L:?epilogue_w4
//  475     default:
//  476       break;
//  477     }
//  478   }
//  479   else  /*(NewState == DISABLE)*/
//  480   {
//  481     switch (CLK_IT)
??CLK_ITConfig_2:
        LD        A, S:?b8
        SUB       A, #0xc
        JREQ      L:??CLK_ITConfig_5
        SUB       A, #0x10
        JRNE      L:??CLK_ITConfig_4
//  482     {
//  483     case CLK_IT_SWIF: /* Disable the clock switch interrupt */
//  484       CLK->SWCR  &= (uint8_t)(~CLK_SWCR_SWIEN);
        BRES      L:0x50c5, #0x2
//  485       break;
        JP        L:?epilogue_w4
//  486     case CLK_IT_CSSD: /* Disable the clock security system detection interrupt */
//  487       CLK->CSSR &= (uint8_t)(~CLK_CSSR_CSSDIE);
??CLK_ITConfig_5:
        BRES      L:0x50c8, #0x2
//  488       break;
//  489     default:
//  490       break;
//  491     }
//  492   }
//  493 }
??CLK_ITConfig_4:
        JP        L:?epilogue_w4
//  494 
//  495 /**
//  496   * @brief  Configures the HSI and CPU clock dividers.
//  497   * @param   ClockPrescaler Specifies the HSI or CPU clock divider to apply.
//  498   * @retval None
//  499   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  500 void CLK_SYSCLKConfig(CLK_Prescaler_TypeDef CLK_Prescaler)
//  501 {
CLK_SYSCLKConfig:
        PUSH      S:?b8
        LD        S:?b8, A
//  502   /* check the parameters */
//  503   assert_param(IS_CLK_PRESCALER_OK(CLK_Prescaler));
        TNZ       S:?b8
        JREQ      L:??CLK_SYSCLKConfig_0
        LD        A, S:?b8
        CP        A, #0x8
        JREQ      L:??CLK_SYSCLKConfig_0
        LD        A, S:?b8
        CP        A, #0x10
        JREQ      L:??CLK_SYSCLKConfig_0
        LD        A, S:?b8
        CP        A, #0x18
        JREQ      L:??CLK_SYSCLKConfig_0
        LD        A, S:?b8
        CP        A, #0x80
        JREQ      L:??CLK_SYSCLKConfig_0
        LD        A, S:?b8
        CP        A, #0x81
        JREQ      L:??CLK_SYSCLKConfig_0
        LD        A, S:?b8
        CP        A, #0x82
        JREQ      L:??CLK_SYSCLKConfig_0
        LD        A, S:?b8
        CP        A, #0x83
        JREQ      L:??CLK_SYSCLKConfig_0
        LD        A, S:?b8
        CP        A, #0x84
        JREQ      L:??CLK_SYSCLKConfig_0
        LD        A, S:?b8
        CP        A, #0x85
        JREQ      L:??CLK_SYSCLKConfig_0
        LD        A, S:?b8
        CP        A, #0x86
        JREQ      L:??CLK_SYSCLKConfig_0
        LD        A, S:?b8
        CP        A, #0x87
        JREQ      L:??CLK_SYSCLKConfig_0
        LDW       X, #0x1f7
        LDW       S:?w1, X
        CLRW      X
        LDW       S:?w0, X
        LDW       X, #`?<Constant "E:\\\\Desktop\\\\J19B_STM8\\\\...">`
        CALL      L:assert_failed
//  504   
//  505   if (((uint8_t)CLK_Prescaler & (uint8_t)0x80) == 0x00) /* Bit7 = 0 means HSI divider */
??CLK_SYSCLKConfig_0:
        LD        A, S:?b8
        AND       A, #0x80
        CP        A, #0x0
        JRNE      L:??CLK_SYSCLKConfig_1
//  506   {
//  507     CLK->CKDIVR &= (uint8_t)(~CLK_CKDIVR_HSIDIV);
        LD        A, L:0x50c6
        AND       A, #0xe7
        LD        L:0x50c6, A
//  508     CLK->CKDIVR |= (uint8_t)((uint8_t)CLK_Prescaler & (uint8_t)CLK_CKDIVR_HSIDIV);
        LD        A, S:?b8
        AND       A, #0x18
        OR        A, L:0x50c6
        LD        L:0x50c6, A
        JRA       L:??CLK_SYSCLKConfig_2
//  509   }
//  510   else /* Bit7 = 1 means CPU divider */
//  511   {
//  512     CLK->CKDIVR &= (uint8_t)(~CLK_CKDIVR_CPUDIV);
??CLK_SYSCLKConfig_1:
        LD        A, L:0x50c6
        AND       A, #0xf8
        LD        L:0x50c6, A
//  513     CLK->CKDIVR |= (uint8_t)((uint8_t)CLK_Prescaler & (uint8_t)CLK_CKDIVR_CPUDIV);
        LD        A, S:?b8
        AND       A, #0x7
        OR        A, L:0x50c6
        LD        L:0x50c6, A
//  514   }
//  515 }
??CLK_SYSCLKConfig_2:
        POP       S:?b8
        RET
//  516 
//  517 /**
//  518   * @brief  Configures the SWIM clock frequency on the fly.
//  519   * @param   CLK_SWIMDivider Specifies the SWIM clock divider to apply.
//  520   * can be one of the value of @ref CLK_SWIMDivider_TypeDef
//  521   * @retval None
//  522   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  523 void CLK_SWIMConfig(CLK_SWIMDivider_TypeDef CLK_SWIMDivider)
//  524 {
CLK_SWIMConfig:
        PUSH      S:?b8
        LD        S:?b8, A
//  525   /* check the parameters */
//  526   assert_param(IS_CLK_SWIMDIVIDER_OK(CLK_SWIMDivider));
        TNZ       S:?b8
        JREQ      L:??CLK_SWIMConfig_0
        LD        A, S:?b8
        CP        A, #0x1
        JREQ      L:??CLK_SWIMConfig_0
        LDW       X, #0x20e
        LDW       S:?w1, X
        CLRW      X
        LDW       S:?w0, X
        LDW       X, #`?<Constant "E:\\\\Desktop\\\\J19B_STM8\\\\...">`
        CALL      L:assert_failed
//  527   
//  528   if (CLK_SWIMDivider != CLK_SWIMDIVIDER_2)
??CLK_SWIMConfig_0:
        TNZ       S:?b8
        JREQ      L:??CLK_SWIMConfig_1
//  529   {
//  530     /* SWIM clock is not divided by 2 */
//  531     CLK->SWIMCCR |= CLK_SWIMCCR_SWIMDIV;
        BSET      L:0x50cd, #0x0
        JRA       L:??CLK_SWIMConfig_2
//  532   }
//  533   else /* CLK_SWIMDivider == CLK_SWIMDIVIDER_2 */
//  534   {
//  535     /* SWIM clock is divided by 2 */
//  536     CLK->SWIMCCR &= (uint8_t)(~CLK_SWIMCCR_SWIMDIV);
??CLK_SWIMConfig_1:
        BRES      L:0x50cd, #0x0
//  537   }
//  538 }
??CLK_SWIMConfig_2:
        POP       S:?b8
        RET
//  539 
//  540 /**
//  541   * @brief  Enables the Clock Security System.
//  542   * @par Full description:
//  543   * once CSS is enabled it cannot be disabled until the next reset.
//  544   * @param  None
//  545   * @retval None
//  546   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  547 void CLK_ClockSecuritySystemEnable(void)
//  548 {
//  549   /* Set CSSEN bit */
//  550   CLK->CSSR |= CLK_CSSR_CSSEN;
CLK_ClockSecuritySystemEnable:
        BSET      L:0x50c8, #0x0
//  551 }
        RET
//  552 
//  553 /**
//  554   * @brief  Returns the clock source used as system clock.
//  555   * @param  None
//  556   * @retval  Clock source used.
//  557   * can be one of the values of @ref CLK_Source_TypeDef
//  558   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  559 CLK_Source_TypeDef CLK_GetSYSCLKSource(void)
//  560 {
//  561   return((CLK_Source_TypeDef)CLK->CMSR);
CLK_GetSYSCLKSource:
        LD        A, L:0x50c3
        RET
//  562 }
//  563 
//  564 /**
//  565   * @brief  This function returns the frequencies of different on chip clocks.
//  566   * @param  None
//  567   * @retval the master clock frequency
//  568   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  569 uint32_t CLK_GetClockFreq(void)
//  570 {
//  571   uint32_t clockfrequency = 0;
CLK_GetClockFreq:
        CLRW      X
        LDW       S:?w1, X
        LDW       S:?w0, X
//  572   CLK_Source_TypeDef clocksource = CLK_SOURCE_HSI;
        MOV       S:?b6, #0xe1
//  573   uint8_t tmp = 0, presc = 0;
        CLR       S:?b5
        CLR       S:?b4
//  574   
//  575   /* Get CLK source. */
//  576   clocksource = (CLK_Source_TypeDef)CLK->CMSR;
        LD        A, L:0x50c3
        LD        S:?b6, A
//  577   
//  578   if (clocksource == CLK_SOURCE_HSI)
        LD        A, S:?b6
        CP        A, #0xe1
        JRNE      L:??CLK_GetClockFreq_0
//  579   {
//  580     tmp = (uint8_t)(CLK->CKDIVR & CLK_CKDIVR_HSIDIV);
        LD        A, L:0x50c6
        AND       A, #0x18
        LD        S:?b5, A
//  581     tmp = (uint8_t)(tmp >> 3);
        LD        A, S:?b5
        SRL       A
        SRL       A
        SRL       A
        LD        S:?b5, A
//  582     presc = HSIDivFactor[tmp];
        CLRW      X
        EXG       A, XL
        LD        A, S:?b5
        EXG       A, XL
        LD        A, (L:HSIDivFactor,X)
        LD        S:?b4, A
//  583     clockfrequency = HSI_VALUE / presc;
        CLRW      X
        EXG       A, XL
        LD        A, S:?b4
        EXG       A, XL
        LDW       S:?w3, X
        CLRW      X
        LDW       S:?w2, X
        CALL      L:?udiv32_l0_dl_l1
        DATA
        DC32      0xf42400
        CODE
        RET
//  584   }
//  585   else if ( clocksource == CLK_SOURCE_LSI)
??CLK_GetClockFreq_0:
        LD        A, S:?b6
        CP        A, #0xd2
        JRNE      L:??CLK_GetClockFreq_1
//  586   {
//  587     clockfrequency = LSI_VALUE;
        LDW       X, #0xf400
        LDW       S:?w1, X
        CLRW      X
        INCW      X
        LDW       S:?w0, X
        RET
//  588   }
//  589   else
//  590   {
//  591     clockfrequency = HSE_VALUE;
??CLK_GetClockFreq_1:
        LDW       X, #0x2400
        LDW       S:?w1, X
        LDW       X, #0xf4
        LDW       S:?w0, X
//  592   }
//  593   
//  594   return((uint32_t)clockfrequency);
        RET
//  595 }
//  596 
//  597 /**
//  598   * @brief  Adjusts the Internal High Speed oscillator (HSI) calibration value.
//  599   * @par Full description:
//  600   * @param   CLK_HSICalibrationValue calibration trimming value.
//  601   * can be one of the values of @ref CLK_HSITrimValue_TypeDef
//  602   * @retval None
//  603   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  604 void CLK_AdjustHSICalibrationValue(CLK_HSITrimValue_TypeDef CLK_HSICalibrationValue)
//  605 {
CLK_AdjustHSICalibrationValue:
        PUSH      S:?b8
        LD        S:?b8, A
//  606   /* check the parameters */
//  607   assert_param(IS_CLK_HSITRIMVALUE_OK(CLK_HSICalibrationValue));
        TNZ       S:?b8
        JREQ      L:??CLK_AdjustHSICalibrationValue_0
        LD        A, S:?b8
        CP        A, #0x1
        JREQ      L:??CLK_AdjustHSICalibrationValue_0
        LD        A, S:?b8
        CP        A, #0x2
        JREQ      L:??CLK_AdjustHSICalibrationValue_0
        LD        A, S:?b8
        CP        A, #0x3
        JREQ      L:??CLK_AdjustHSICalibrationValue_0
        LD        A, S:?b8
        CP        A, #0x4
        JREQ      L:??CLK_AdjustHSICalibrationValue_0
        LD        A, S:?b8
        CP        A, #0x5
        JREQ      L:??CLK_AdjustHSICalibrationValue_0
        LD        A, S:?b8
        CP        A, #0x6
        JREQ      L:??CLK_AdjustHSICalibrationValue_0
        LD        A, S:?b8
        CP        A, #0x7
        JREQ      L:??CLK_AdjustHSICalibrationValue_0
        LDW       X, #0x25f
        LDW       S:?w1, X
        CLRW      X
        LDW       S:?w0, X
        LDW       X, #`?<Constant "E:\\\\Desktop\\\\J19B_STM8\\\\...">`
        CALL      L:assert_failed
//  608   
//  609   /* Store the new value */
//  610   CLK->HSITRIMR = (uint8_t)( (uint8_t)(CLK->HSITRIMR & (uint8_t)(~CLK_HSITRIMR_HSITRIM))|((uint8_t)CLK_HSICalibrationValue));
??CLK_AdjustHSICalibrationValue_0:
        LD        A, L:0x50cc
        AND       A, #0xf8
        OR        A, S:?b8
        LD        L:0x50cc, A
//  611 }
        POP       S:?b8
        RET
//  612 
//  613 /**
//  614   * @brief  Reset the SWBSY flag (SWICR Register)
//  615   * @par Full description:
//  616   * This function reset SWBSY flag in order to reset clock switch operations (target
//  617   * oscillator is broken, stabilization is longing too much, etc.).  If at the same time \n
//  618   * software attempts to set SWEN and clear SWBSY, SWBSY action takes precedence.
//  619   * @param  None
//  620   * @retval None
//  621   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  622 void CLK_SYSCLKEmergencyClear(void)
//  623 {
//  624   CLK->SWCR &= (uint8_t)(~CLK_SWCR_SWBSY);
CLK_SYSCLKEmergencyClear:
        BRES      L:0x50c5, #0x0
//  625 }
        RET
//  626 
//  627 /**
//  628   * @brief  Checks whether the specified CLK flag is set or not.
//  629   * @par Full description:
//  630   * @param   CLK_FLAG Flag to check.
//  631   * can be one of the values of @ref CLK_Flag_TypeDef
//  632   * @retval FlagStatus, status of the checked flag
//  633   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  634 FlagStatus CLK_GetFlagStatus(CLK_Flag_TypeDef CLK_FLAG)
//  635 {
CLK_GetFlagStatus:
        CALL      L:?push_w4
        LDW       S:?w4, X
//  636   uint16_t statusreg = 0;
        CLRW      X
//  637   uint8_t tmpreg = 0;
        CLR       S:?b0
//  638   FlagStatus bitstatus = RESET;
        CLR       A
//  639   
//  640   /* check the parameters */
//  641   assert_param(IS_CLK_FLAG_OK(CLK_FLAG));
        LDW       Y, S:?w4
        CPW       Y, #0x110
        JREQ      L:??CLK_GetFlagStatus_0
        LDW       X, S:?w4
        CPW       X, #0x102
        JREQ      L:??CLK_GetFlagStatus_0
        LDW       X, S:?w4
        CPW       X, #0x202
        JREQ      L:??CLK_GetFlagStatus_0
        LDW       X, S:?w4
        CPW       X, #0x308
        JREQ      L:??CLK_GetFlagStatus_0
        LDW       X, S:?w4
        CPW       X, #0x301
        JREQ      L:??CLK_GetFlagStatus_0
        LDW       X, S:?w4
        CPW       X, #0x408
        JREQ      L:??CLK_GetFlagStatus_0
        LDW       X, S:?w4
        CPW       X, #0x402
        JREQ      L:??CLK_GetFlagStatus_0
        LDW       X, S:?w4
        CPW       X, #0x504
        JREQ      L:??CLK_GetFlagStatus_0
        LDW       X, S:?w4
        CPW       X, #0x502
        JREQ      L:??CLK_GetFlagStatus_0
        LDW       X, #0x281
        LDW       S:?w1, X
        CLRW      X
        LDW       S:?w0, X
        LDW       X, #`?<Constant "E:\\\\Desktop\\\\J19B_STM8\\\\...">`
        CALL      L:assert_failed
//  642   
//  643   /* Get the CLK register index */
//  644   statusreg = (uint16_t)((uint16_t)CLK_FLAG & (uint16_t)0xFF00);
??CLK_GetFlagStatus_0:
        LDW       X, S:?w4
        RLWA      X, A
        AND       A, #0xff
        RLWA      X, A
        AND       A, #0x0
        RLWA      X, A
//  645   
//  646   
//  647   if (statusreg == 0x0100) /* The flag to check is in ICKRregister */
        CPW       X, #0x100
        JRNE      L:??CLK_GetFlagStatus_1
//  648   {
//  649     tmpreg = CLK->ICKR;
        LD        A, L:0x50c0
        LD        S:?b0, A
        JRA       L:??CLK_GetFlagStatus_2
//  650   }
//  651   else if (statusreg == 0x0200) /* The flag to check is in ECKRregister */
??CLK_GetFlagStatus_1:
        CPW       X, #0x200
        JRNE      L:??CLK_GetFlagStatus_3
//  652   {
//  653     tmpreg = CLK->ECKR;
        LD        A, L:0x50c1
        LD        S:?b0, A
        JRA       L:??CLK_GetFlagStatus_2
//  654   }
//  655   else if (statusreg == 0x0300) /* The flag to check is in SWIC register */
??CLK_GetFlagStatus_3:
        CPW       X, #0x300
        JRNE      L:??CLK_GetFlagStatus_4
//  656   {
//  657     tmpreg = CLK->SWCR;
        LD        A, L:0x50c5
        LD        S:?b0, A
        JRA       L:??CLK_GetFlagStatus_2
//  658   }
//  659   else if (statusreg == 0x0400) /* The flag to check is in CSS register */
??CLK_GetFlagStatus_4:
        CPW       X, #0x400
        JRNE      L:??CLK_GetFlagStatus_5
//  660   {
//  661     tmpreg = CLK->CSSR;
        LD        A, L:0x50c8
        LD        S:?b0, A
        JRA       L:??CLK_GetFlagStatus_2
//  662   }
//  663   else /* The flag to check is in CCO register */
//  664   {
//  665     tmpreg = CLK->CCOR;
??CLK_GetFlagStatus_5:
        LD        A, L:0x50c9
        LD        S:?b0, A
//  666   }
//  667   
//  668   if ((tmpreg & (uint8_t)CLK_FLAG) != (uint8_t)RESET)
??CLK_GetFlagStatus_2:
        LD        A, S:?b9
        AND       A, S:?b0
        CP        A, #0x0
        JREQ      L:??CLK_GetFlagStatus_6
//  669   {
//  670     bitstatus = SET;
        LD        A, #0x1
        JP        L:?epilogue_w4
//  671   }
//  672   else
//  673   {
//  674     bitstatus = RESET;
??CLK_GetFlagStatus_6:
        CLR       A
//  675   }
//  676   
//  677   /* Return the flag status */
//  678   return((FlagStatus)bitstatus);
        JP        L:?epilogue_w4
//  679 }
//  680 
//  681 /**
//  682   * @brief  Checks whether the specified CLK interrupt has is enabled or not.
//  683   * @param   CLK_IT specifies the CLK interrupt.
//  684   * can be one of the values of @ref CLK_IT_TypeDef
//  685   * @retval ITStatus, new state of CLK_IT (SET or RESET).
//  686   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  687 ITStatus CLK_GetITStatus(CLK_IT_TypeDef CLK_IT)
//  688 {
CLK_GetITStatus:
        PUSH      S:?b8
        LD        S:?b8, A
//  689   ITStatus bitstatus = RESET;
        CLR       S:?b0
//  690   
//  691   /* check the parameters */
//  692   assert_param(IS_CLK_IT_OK(CLK_IT));
        LD        A, S:?b8
        CP        A, #0xc
        JREQ      L:??CLK_GetITStatus_0
        LD        A, S:?b8
        CP        A, #0x1c
        JREQ      L:??CLK_GetITStatus_0
        LDW       X, #0x2b4
        LDW       S:?w1, X
        CLRW      X
        LDW       S:?w0, X
        LDW       X, #`?<Constant "E:\\\\Desktop\\\\J19B_STM8\\\\...">`
        CALL      L:assert_failed
//  693   
//  694   if (CLK_IT == CLK_IT_SWIF)
??CLK_GetITStatus_0:
        LD        A, S:?b8
        CP        A, #0x1c
        JRNE      L:??CLK_GetITStatus_1
//  695   {
//  696     /* Check the status of the clock switch interrupt */
//  697     if ((CLK->SWCR & (uint8_t)CLK_IT) == (uint8_t)0x0C)
        LD        A, S:?b8
        AND       A, L:0x50c5
        CP        A, #0xc
        JRNE      L:??CLK_GetITStatus_2
//  698     {
//  699       bitstatus = SET;
        MOV       S:?b0, #0x1
        JRA       L:??CLK_GetITStatus_3
//  700     }
//  701     else
//  702     {
//  703       bitstatus = RESET;
??CLK_GetITStatus_2:
        CLR       S:?b0
        JRA       L:??CLK_GetITStatus_3
//  704     }
//  705   }
//  706   else /* CLK_IT == CLK_IT_CSSDIE */
//  707   {
//  708     /* Check the status of the security system detection interrupt */
//  709     if ((CLK->CSSR & (uint8_t)CLK_IT) == (uint8_t)0x0C)
??CLK_GetITStatus_1:
        LD        A, S:?b8
        AND       A, L:0x50c8
        CP        A, #0xc
        JRNE      L:??CLK_GetITStatus_4
//  710     {
//  711       bitstatus = SET;
        MOV       S:?b0, #0x1
        JRA       L:??CLK_GetITStatus_3
//  712     }
//  713     else
//  714     {
//  715       bitstatus = RESET;
??CLK_GetITStatus_4:
        CLR       S:?b0
//  716     }
//  717   }
//  718   
//  719   /* Return the CLK_IT status */
//  720   return bitstatus;
??CLK_GetITStatus_3:
        LD        A, S:?b0
        POP       S:?b8
        RET
//  721 }
//  722 
//  723 /**
//  724   * @brief  Clears the CLK’s interrupt pending bits.
//  725   * @param   CLK_IT specifies the interrupt pending bits.
//  726   * can be one of the values of @ref CLK_IT_TypeDef
//  727   * @retval None
//  728   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  729 void CLK_ClearITPendingBit(CLK_IT_TypeDef CLK_IT)
//  730 {
CLK_ClearITPendingBit:
        PUSH      S:?b8
        LD        S:?b8, A
//  731   /* check the parameters */
//  732   assert_param(IS_CLK_IT_OK(CLK_IT));
        LD        A, S:?b8
        CP        A, #0xc
        JREQ      L:??CLK_ClearITPendingBit_0
        LD        A, S:?b8
        CP        A, #0x1c
        JREQ      L:??CLK_ClearITPendingBit_0
        LDW       X, #0x2dc
        LDW       S:?w1, X
        CLRW      X
        LDW       S:?w0, X
        LDW       X, #`?<Constant "E:\\\\Desktop\\\\J19B_STM8\\\\...">`
        CALL      L:assert_failed
//  733   
//  734   if (CLK_IT == (uint8_t)CLK_IT_CSSD)
??CLK_ClearITPendingBit_0:
        LD        A, S:?b8
        CP        A, #0xc
        JRNE      L:??CLK_ClearITPendingBit_1
//  735   {
//  736     /* Clear the status of the security system detection interrupt */
//  737     CLK->CSSR &= (uint8_t)(~CLK_CSSR_CSSD);
        BRES      L:0x50c8, #0x3
        JRA       L:??CLK_ClearITPendingBit_2
//  738   }
//  739   else /* CLK_PendingBit == (uint8_t)CLK_IT_SWIF */
//  740   {
//  741     /* Clear the status of the clock switch interrupt */
//  742     CLK->SWCR &= (uint8_t)(~CLK_SWCR_SWIF);
??CLK_ClearITPendingBit_1:
        BRES      L:0x50c5, #0x3
//  743   }
//  744   
//  745 }
??CLK_ClearITPendingBit_2:
        POP       S:?b8
        RET

        SECTION VREGS:DATA:REORDER:NOROOT(0)

        SECTION `.near.rodata`:CONST:REORDER:NOROOT(0)
`?<Constant "E:\\\\Desktop\\\\J19B_STM8\\\\...">`:
        DC8 "E:\\Desktop\\J19B_STM8\\Lib\\src\\stm8s_clk.c"

        END
//  746 
//  747 /**
//  748   * @}
//  749   */
//  750   
//  751 /**
//  752   * @}
//  753   */
//  754   
//  755 
//  756 /************************ (C) COPYRIGHT STMicroelectronics *****END OF FILE****/
// 
//    53 bytes in section .near.rodata
// 1 867 bytes in section .near_func.text
// 
// 1 867 bytes of CODE  memory
//    53 bytes of CONST memory
//
//Errors: none
//Warnings: none
