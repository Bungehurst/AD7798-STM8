///////////////////////////////////////////////////////////////////////////////
//                                                                            /
//                                                      11/Mar/2019  20:52:09 /
// IAR C/C++ Compiler V1.31.1.20058 [Evaluation] for STM8                     /
// Copyright 2010-2012 IAR Systems AB.                                        /
//                                                                            /
//    Source file  =  C:\Users\lun55\Desktop\J19B_STM8\Lib\stm8s_beep.c       /
//    Command line =  C:\Users\lun55\Desktop\J19B_STM8\Lib\stm8s_beep.c -e    /
//                    -Ol --no_cse --no_unroll --no_inline --no_code_motion   /
//                    --no_tbaa --no_cross_call --debug --code_model small    /
//                    --data_model medium -o C:\Users\lun55\Desktop\J19B_STM8 /
//                    \Debug\Obj\ --dlib_config "D:\Program Files (x86)\IAR   /
//                    Systems\Embedded Workbench 6.0                          /
//                    Evaluation\stm8\LIB\dlstm8smf.h" -lcN                   /
//                    C:\Users\lun55\Desktop\J19B_STM8\Debug\List\ -lB        /
//                    C:\Users\lun55\Desktop\J19B_STM8\Debug\List\ --vregs 16 /
//    List file    =  C:\Users\lun55\Desktop\J19B_STM8\Debug\List\stm8s_beep. /
//                    s                                                       /
//                                                                            /
//                                                                            /
///////////////////////////////////////////////////////////////////////////////

        NAME stm8s_beep

        EXTERN ?b8
        EXTERN ?epilogue_l2
        EXTERN ?mov_l0_l2
        EXTERN ?mov_l2_l0
        EXTERN ?mul16_x_x_w0
        EXTERN ?push_l2
        EXTERN ?sub32_l0_l0_dl
        EXTERN ?udiv32_l0_l0_dl
        EXTERN ?w0
        EXTERN ?w1
        EXTERN assert_failed

        PUBLIC BEEP_Cmd
        PUBLIC BEEP_DeInit
        PUBLIC BEEP_Init
        PUBLIC BEEP_LSICalibrationConfig

// C:\Users\lun55\Desktop\J19B_STM8\Lib\stm8s_beep.c
//    1 /**
//    2   ******************************************************************************
//    3   * @file    stm8s_beep.c
//    4   * @author  MCD Application Team
//    5   * @version V2.2.0
//    6   * @date    30-September-2014
//    7   * @brief   This file contains all the functions for the BEEP peripheral.
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
//   29 #include "stm8s_beep.h"
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
//   40 
//   41 /* Public functions ----------------------------------------------------------*/
//   42 
//   43 /**
//   44   * @addtogroup BEEP_Public_Functions
//   45   * @{
//   46   */
//   47 
//   48 /**
//   49   * @brief  Deinitializes the BEEP peripheral registers to their default reset
//   50   * values.
//   51   * @param  None
//   52   * @retval None
//   53   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//   54 void BEEP_DeInit(void)
//   55 {
//   56   BEEP->CSR = BEEP_CSR_RESET_VALUE;
BEEP_DeInit:
        MOV       L:0x50f3, #0x1f
//   57 }
        RET
//   58 
//   59 /**
//   60   * @brief  Initializes the BEEP function according to the specified parameters.
//   61   * @param   BEEP_Frequency Frequency selection.
//   62   * can be one of the values of @ref BEEP_Frequency_TypeDef.
//   63   * @retval None
//   64   * @par Required preconditions:
//   65   * The LS RC calibration must be performed before calling this function.
//   66   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//   67 void BEEP_Init(BEEP_Frequency_TypeDef BEEP_Frequency)
//   68 {
BEEP_Init:
        PUSH      S:?b8
        LD        S:?b8, A
//   69   /* Check parameter */
//   70   assert_param(IS_BEEP_FREQUENCY_OK(BEEP_Frequency));
        TNZ       S:?b8
        JREQ      L:??BEEP_Init_0
        LD        A, S:?b8
        CP        A, #0x40
        JREQ      L:??BEEP_Init_0
        LD        A, S:?b8
        CP        A, #0x80
        JREQ      L:??BEEP_Init_0
        LDW       X, #0x46
        LDW       S:?w1, X
        CLRW      X
        LDW       S:?w0, X
        LDW       X, #`?<Constant "C:\\\\Users\\\\lun55\\\\Deskto...">`
        CALL      L:assert_failed
//   71   
//   72   /* Set a default calibration value if no calibration is done */
//   73   if ((BEEP->CSR & BEEP_CSR_BEEPDIV) == BEEP_CSR_BEEPDIV)
??BEEP_Init_0:
        LD        A, L:0x50f3
        AND       A, #0x1f
        CP        A, #0x1f
        JRNE      L:??BEEP_Init_1
//   74   {
//   75     BEEP->CSR &= (uint8_t)(~BEEP_CSR_BEEPDIV); /* Clear bits */
        LD        A, L:0x50f3
        AND       A, #0xe0
        LD        L:0x50f3, A
//   76     BEEP->CSR |= BEEP_CALIBRATION_DEFAULT;
        LD        A, L:0x50f3
        OR        A, #0xb
        LD        L:0x50f3, A
//   77   }
//   78   
//   79   /* Select the output frequency */
//   80   BEEP->CSR &= (uint8_t)(~BEEP_CSR_BEEPSEL);
??BEEP_Init_1:
        LD        A, L:0x50f3
        AND       A, #0x3f
        LD        L:0x50f3, A
//   81   BEEP->CSR |= (uint8_t)(BEEP_Frequency);
        LD        A, S:?b8
        OR        A, L:0x50f3
        LD        L:0x50f3, A
//   82 }
        POP       S:?b8
        RET
//   83 
//   84 /**
//   85   * @brief  Enable or disable the BEEP function.
//   86   * @param   NewState Indicates the new state of the BEEP function.
//   87   * @retval None
//   88   * @par Required preconditions:
//   89   * Initialisation of BEEP and LS RC calibration must be done before.
//   90   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//   91 void BEEP_Cmd(FunctionalState NewState)
//   92 {
//   93   if (NewState != DISABLE)
BEEP_Cmd:
        TNZ       A
        JREQ      L:??BEEP_Cmd_0
//   94   {
//   95     /* Enable the BEEP peripheral */
//   96     BEEP->CSR |= BEEP_CSR_BEEPEN;
        BSET      L:0x50f3, #0x5
        RET
//   97   }
//   98   else
//   99   {
//  100     /* Disable the BEEP peripheral */
//  101     BEEP->CSR &= (uint8_t)(~BEEP_CSR_BEEPEN);
??BEEP_Cmd_0:
        BRES      L:0x50f3, #0x5
//  102   }
//  103 }
        RET
//  104 
//  105 /**
//  106   * @brief  Update CSR register with the measured LSI frequency.
//  107   * @par Note on the APR calculation:
//  108   * A is the integer part of LSIFreqkHz/4 and x the decimal part.
//  109   * x <= A/(1+2A) is equivalent to A >= x(1+2A) and also to 4A >= 4x(1+2A) [F1]
//  110   * but we know that A + x = LSIFreqkHz/4 ==> 4x = LSIFreqkHz-4A
//  111   * so [F1] can be written :
//  112   * 4A >= (LSIFreqkHz-4A)(1+2A)
//  113   * @param   LSIFreqHz Low Speed RC frequency measured by timer (in Hz).
//  114   * @retval None
//  115   * @par Required preconditions:
//  116   * - BEEP must be disabled to avoid unwanted interrupts.
//  117   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  118 void BEEP_LSICalibrationConfig(uint32_t LSIFreqHz)
//  119 {
BEEP_LSICalibrationConfig:
        CALL      L:?push_l2
        CALL      L:?mov_l2_l0
//  120   uint16_t lsifreqkhz;
//  121   uint16_t A;
//  122   
//  123   /* Check parameter */
//  124   assert_param(IS_LSI_FREQUENCY_OK(LSIFreqHz));
        CALL      L:?mov_l0_l2
        CALL      L:?sub32_l0_l0_dl
        DATA
        DC32      0x1adb0
        CODE
        LDW       X, S:?w0
        CPW       X, #0x0
        JRNE      L:??BEEP_LSICalibrationConfig_0
        LDW       X, S:?w1
        CPW       X, #0x9c41
??BEEP_LSICalibrationConfig_0:
        JRC       L:??BEEP_LSICalibrationConfig_1
        LDW       X, #0x7c
        LDW       S:?w1, X
        CLRW      X
        LDW       S:?w0, X
        LDW       X, #`?<Constant "C:\\\\Users\\\\lun55\\\\Deskto...">`
        CALL      L:assert_failed
//  125   
//  126   lsifreqkhz = (uint16_t)(LSIFreqHz / 1000); /* Converts value in kHz */
??BEEP_LSICalibrationConfig_1:
        CALL      L:?mov_l0_l2
        CALL      L:?udiv32_l0_l0_dl
        DATA
        DC32      0x3e8
        CODE
//  127   
//  128   /* Calculation of BEEPER calibration value */
//  129   
//  130   BEEP->CSR &= (uint8_t)(~BEEP_CSR_BEEPDIV); /* Clear bits */
        LD        A, L:0x50f3
        AND       A, #0xe0
        LD        L:0x50f3, A
//  131   
//  132   A = (uint16_t)(lsifreqkhz >> 3U); /* Division by 8, keep integer part only */
        LDW       X, S:?w1
        SRLW      X
        SRLW      X
        SRLW      X
        LDW       Y, X
//  133   
//  134   if ((8U * A) >= ((lsifreqkhz - (8U * A)) * (1U + (2U * A))))
        LDW       X, #0x8
        LDW       S:?w0, X
        LDW       X, Y
        CALL      L:?mul16_x_x_w0
        LDW       S:?w0, X
        LDW       X, S:?w1
        SUBW      X, S:?w0
        LDW       S:?w1, X
        LDW       X, Y
        SLLW      X
        INCW      X
        LDW       S:?w0, X
        LDW       X, S:?w1
        CALL      L:?mul16_x_x_w0
        LDW       S:?w1, X
        LDW       X, #0x8
        LDW       S:?w0, X
        LDW       X, Y
        CALL      L:?mul16_x_x_w0
        CPW       X, S:?w1
        JRC       L:??BEEP_LSICalibrationConfig_2
//  135   {
//  136     BEEP->CSR |= (uint8_t)(A - 2U);
        LD        A, YL
        ADD       A, #0xfe
        OR        A, L:0x50f3
        LD        L:0x50f3, A
        JP        L:?epilogue_l2
//  137   }
//  138   else
//  139   {
//  140     BEEP->CSR |= (uint8_t)(A - 1U);
??BEEP_LSICalibrationConfig_2:
        LD        A, YL
        ADD       A, #0xff
        OR        A, L:0x50f3
        LD        L:0x50f3, A
//  141   }
//  142 }
        JP        L:?epilogue_l2

        SECTION VREGS:DATA:REORDER:NOROOT(0)

        SECTION `.near.rodata`:CONST:REORDER:NOROOT(0)
`?<Constant "C:\\\\Users\\\\lun55\\\\Deskto...">`:
        DC8 "C:\\Users\\lun55\\Desktop\\J19B_STM8\\Lib\\stm8s_beep.c"

        END
//  143 
//  144 /**
//  145   * @}
//  146   */
//  147   
//  148 /**
//  149   * @}
//  150   */
//  151   
//  152 
//  153 /************************ (C) COPYRIGHT STMicroelectronics *****END OF FILE****/
// 
//  50 bytes in section .near.rodata
// 237 bytes in section .near_func.text
// 
// 237 bytes of CODE  memory
//  50 bytes of CONST memory
//
//Errors: none
//Warnings: none
