///////////////////////////////////////////////////////////////////////////////
//                                                                            /
//                                                      11/Mar/2019  20:52:08 /
// IAR C/C++ Compiler V1.31.1.20058 [Evaluation] for STM8                     /
// Copyright 2010-2012 IAR Systems AB.                                        /
//                                                                            /
//    Source file  =  C:\Users\lun55\Desktop\J19B_STM8\Lib\stm8s_awu.c        /
//    Command line =  C:\Users\lun55\Desktop\J19B_STM8\Lib\stm8s_awu.c -e     /
//                    -Ol --no_cse --no_unroll --no_inline --no_code_motion   /
//                    --no_tbaa --no_cross_call --debug --code_model small    /
//                    --data_model medium -o C:\Users\lun55\Desktop\J19B_STM8 /
//                    \Debug\Obj\ --dlib_config "D:\Program Files (x86)\IAR   /
//                    Systems\Embedded Workbench 6.0                          /
//                    Evaluation\stm8\LIB\dlstm8smf.h" -lcN                   /
//                    C:\Users\lun55\Desktop\J19B_STM8\Debug\List\ -lB        /
//                    C:\Users\lun55\Desktop\J19B_STM8\Debug\List\ --vregs 16 /
//    List file    =  C:\Users\lun55\Desktop\J19B_STM8\Debug\List\stm8s_awu.s /
//                                                                            /
//                                                                            /
///////////////////////////////////////////////////////////////////////////////

        NAME stm8s_awu

        EXTERN ?b4
        EXTERN ?b5
        EXTERN ?b8
        EXTERN ?epilogue_l2
        EXTERN ?mov_l0_l2
        EXTERN ?mov_l2_l0
        EXTERN ?mov_w2_w1
        EXTERN ?mul16_x_x_w0
        EXTERN ?push_l2
        EXTERN ?sub32_l0_l0_dl
        EXTERN ?udiv32_l0_l0_dl
        EXTERN ?w0
        EXTERN ?w1
        EXTERN ?w2
        EXTERN assert_failed

        PUBLIC APR_Array
        PUBLIC AWU_Cmd
        PUBLIC AWU_DeInit
        PUBLIC AWU_GetFlagStatus
        PUBLIC AWU_IdleModeEnable
        PUBLIC AWU_Init
        PUBLIC AWU_LSICalibrationConfig
        PUBLIC TBR_Array

// C:\Users\lun55\Desktop\J19B_STM8\Lib\stm8s_awu.c
//    1 /**
//    2   ******************************************************************************
//    3   * @file    stm8s_awu.c
//    4   * @author  MCD Application Team
//    5   * @version V2.2.0
//    6   * @date    30-September-2014
//    7   * @brief   This file contains all the functions for the AWU peripheral.  
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
//   29 #include "stm8s_awu.h"
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
//   41 /* See also AWU_Timebase_TypeDef structure in stm8s_awu.h file :
//   42                           N   2   5   1   2   4   8   1   3   6   1   2   5   1   2   1   3
//   43                           O   5   0   m   m   m   m   6   2   4   2   5   1   s   s   2   0
//   44                           I   0   0   s   s   s   s   m   m   m   8   6   2           s   s
//   45                           T   u   u                   s   s   s   m   m   m
//   46                               s   s                               s   s   s
//   47 */
//   48 /** Contains the different values to write in the APR register (used by AWU_Init function) */

        SECTION `.near.rodata`:CONST:REORDER:NOROOT(0)
//   49 CONST uint8_t APR_Array[17] =
APR_Array:
        DC8 0, 30, 30, 30, 30, 30, 30, 30, 30, 30, 30, 30, 30, 61, 23, 23, 62
//   50     {
//   51         0, 30, 30, 30, 30, 30, 30, 30, 30, 30, 30, 30, 30, 61, 23, 23, 62
//   52     };
//   53 
//   54 /** Contains the different values to write in the TBR register (used by AWU_Init function) */

        SECTION `.near.rodata`:CONST:REORDER:NOROOT(0)
//   55 CONST uint8_t TBR_Array[17] =
TBR_Array:
        DC8 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 12, 14, 15, 15
//   56     {
//   57         0,  1,  2,  3,  4,  5,  6,  7,  8,  9, 10, 11, 12, 12, 14, 15, 15
//   58     };
//   59 
//   60 /* Public functions ----------------------------------------------------------*/
//   61 
//   62 /**
//   63   * @addtogroup AWU_Public_Functions
//   64   * @{
//   65   */
//   66 
//   67 /**
//   68   * @brief  Deinitializes the AWU peripheral registers to their default reset
//   69   * values.
//   70   * @param  None
//   71   * @retval None
//   72   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//   73 void AWU_DeInit(void)
//   74 {
//   75   AWU->CSR = AWU_CSR_RESET_VALUE;
AWU_DeInit:
        MOV       L:0x50f0, #0x0
//   76   AWU->APR = AWU_APR_RESET_VALUE;
        MOV       L:0x50f1, #0x3f
//   77   AWU->TBR = AWU_TBR_RESET_VALUE;
        MOV       L:0x50f2, #0x0
//   78 }
        RET
//   79 
//   80 /**
//   81   * @brief  Initializes the AWU peripheral according to the specified parameters.
//   82   * @param   AWU_TimeBase : Time base selection (interval between AWU interrupts).
//   83   * can be one of the values of @ref AWU_Timebase_TypeDef.
//   84   * @retval None
//   85   * @par Required preconditions:
//   86   * The LS RC calibration must be performed before calling this function.
//   87   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//   88 void AWU_Init(AWU_Timebase_TypeDef AWU_TimeBase)
//   89 {
AWU_Init:
        PUSH      S:?b8
        LD        S:?b8, A
//   90   /* Check parameter */
//   91   assert_param(IS_AWU_TIMEBASE_OK(AWU_TimeBase));
        TNZ       S:?b8
        JREQ      L:??AWU_Init_0
        LD        A, S:?b8
        CP        A, #0x1
        JREQ      L:??AWU_Init_0
        LD        A, S:?b8
        CP        A, #0x2
        JREQ      L:??AWU_Init_0
        LD        A, S:?b8
        CP        A, #0x3
        JREQ      L:??AWU_Init_0
        LD        A, S:?b8
        CP        A, #0x4
        JREQ      L:??AWU_Init_0
        LD        A, S:?b8
        CP        A, #0x5
        JREQ      L:??AWU_Init_0
        LD        A, S:?b8
        CP        A, #0x6
        JREQ      L:??AWU_Init_0
        LD        A, S:?b8
        CP        A, #0x7
        JREQ      L:??AWU_Init_0
        LD        A, S:?b8
        CP        A, #0x8
        JREQ      L:??AWU_Init_0
        LD        A, S:?b8
        CP        A, #0x9
        JREQ      L:??AWU_Init_0
        LD        A, S:?b8
        CP        A, #0xa
        JREQ      L:??AWU_Init_0
        LD        A, S:?b8
        CP        A, #0xb
        JREQ      L:??AWU_Init_0
        LD        A, S:?b8
        CP        A, #0xc
        JREQ      L:??AWU_Init_0
        LD        A, S:?b8
        CP        A, #0xd
        JREQ      L:??AWU_Init_0
        LD        A, S:?b8
        CP        A, #0xe
        JREQ      L:??AWU_Init_0
        LD        A, S:?b8
        CP        A, #0xf
        JREQ      L:??AWU_Init_0
        LD        A, S:?b8
        CP        A, #0x10
        JREQ      L:??AWU_Init_0
        LDW       X, #0x5b
        LDW       S:?w1, X
        CLRW      X
        LDW       S:?w0, X
        LDW       X, #`?<Constant "C:\\\\Users\\\\lun55\\\\Deskto...">`
        CALL      L:assert_failed
//   92   
//   93   /* Enable the AWU peripheral */
//   94   AWU->CSR |= AWU_CSR_AWUEN;
??AWU_Init_0:
        BSET      L:0x50f0, #0x4
//   95   
//   96   /* Set the TimeBase */
//   97   AWU->TBR &= (uint8_t)(~AWU_TBR_AWUTB);
        LD        A, L:0x50f2
        AND       A, #0xf0
        LD        L:0x50f2, A
//   98   AWU->TBR |= TBR_Array[(uint8_t)AWU_TimeBase];
        CLRW      X
        EXG       A, XL
        LD        A, S:?b8
        EXG       A, XL
        LD        A, (L:TBR_Array,X)
        OR        A, L:0x50f2
        LD        L:0x50f2, A
//   99   
//  100   /* Set the APR divider */
//  101   AWU->APR &= (uint8_t)(~AWU_APR_APR);
        LD        A, L:0x50f1
        AND       A, #0xc0
        LD        L:0x50f1, A
//  102   AWU->APR |= APR_Array[(uint8_t)AWU_TimeBase];
        CLRW      X
        EXG       A, XL
        LD        A, S:?b8
        EXG       A, XL
        LD        A, (L:APR_Array,X)
        OR        A, L:0x50f1
        LD        L:0x50f1, A
//  103 }
        POP       S:?b8
        RET
//  104 
//  105 /**
//  106   * @brief  Enable or disable the AWU peripheral.
//  107   * @param   NewState Indicates the new state of the AWU peripheral.
//  108   * @retval None
//  109   * @par Required preconditions:
//  110   * Initialisation of AWU and LS RC calibration must be done before.
//  111   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  112 void AWU_Cmd(FunctionalState NewState)
//  113 {
//  114   if (NewState != DISABLE)
AWU_Cmd:
        TNZ       A
        JREQ      L:??AWU_Cmd_0
//  115   {
//  116     /* Enable the AWU peripheral */
//  117     AWU->CSR |= AWU_CSR_AWUEN;
        BSET      L:0x50f0, #0x4
        RET
//  118   }
//  119   else
//  120   {
//  121     /* Disable the AWU peripheral */
//  122     AWU->CSR &= (uint8_t)(~AWU_CSR_AWUEN);
??AWU_Cmd_0:
        BRES      L:0x50f0, #0x4
//  123   }
//  124 }
        RET
//  125 
//  126 /**
//  127   * @brief  Update APR register with the measured LSI frequency.
//  128   * @par Note on the APR calculation:
//  129   * A is the integer part of lsifreqkhz/4 and x the decimal part.
//  130   * x <= A/(1+2A) is equivalent to A >= x(1+2A) and also to 4A >= 4x(1+2A) [F1]
//  131   * but we know that A + x = lsifreqkhz/4 ==> 4x = lsifreqkhz-4A
//  132   * so [F1] can be written :
//  133   * 4A >= (lsifreqkhz-4A)(1+2A)
//  134   * @param   LSIFreqHz Low Speed RC frequency measured by timer (in Hz).
//  135   * @retval None
//  136   * @par Required preconditions:
//  137   * - AWU must be disabled to avoid unwanted interrupts.
//  138   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  139 void AWU_LSICalibrationConfig(uint32_t LSIFreqHz)
//  140 {
AWU_LSICalibrationConfig:
        CALL      L:?push_l2
        CALL      L:?mov_l2_l0
//  141   uint16_t lsifreqkhz = 0x0;
        CLR       S:?b5
        CLR       S:?b4
//  142   uint16_t A = 0x0;
        CLRW      Y
//  143   
//  144   /* Check parameter */
//  145   assert_param(IS_LSI_FREQUENCY_OK(LSIFreqHz));
        CALL      L:?mov_l0_l2
        CALL      L:?sub32_l0_l0_dl
        DATA
        DC32      0x1adb0
        CODE
        LDW       X, S:?w0
        CPW       X, #0x0
        JRNE      L:??AWU_LSICalibrationConfig_0
        LDW       X, S:?w1
        CPW       X, #0x9c41
??AWU_LSICalibrationConfig_0:
        JRC       L:??AWU_LSICalibrationConfig_1
        LDW       X, #0x91
        LDW       S:?w1, X
        CLRW      X
        LDW       S:?w0, X
        LDW       X, #`?<Constant "C:\\\\Users\\\\lun55\\\\Deskto...">`
        CALL      L:assert_failed
//  146   
//  147   lsifreqkhz = (uint16_t)(LSIFreqHz / 1000); /* Converts value in kHz */
??AWU_LSICalibrationConfig_1:
        CALL      L:?mov_l0_l2
        CALL      L:?udiv32_l0_l0_dl
        DATA
        DC32      0x3e8
        CODE
        CALL      L:?mov_w2_w1
//  148   
//  149   /* Calculation of AWU calibration value */
//  150   
//  151   A = (uint16_t)(lsifreqkhz >> 2U); /* Division by 4, keep integer part only */
        LDW       X, S:?w2
        SRLW      X
        SRLW      X
        LDW       Y, X
//  152   
//  153   if ((4U * A) >= ((lsifreqkhz - (4U * A)) * (1U + (2U * A))))
        LDW       X, #0x4
        LDW       S:?w0, X
        LDW       X, Y
        CALL      L:?mul16_x_x_w0
        LDW       S:?w0, X
        LDW       X, S:?w2
        SUBW      X, S:?w0
        LDW       S:?w1, X
        LDW       X, Y
        SLLW      X
        INCW      X
        LDW       S:?w0, X
        LDW       X, S:?w1
        CALL      L:?mul16_x_x_w0
        LDW       S:?w1, X
        LDW       X, #0x4
        LDW       S:?w0, X
        LDW       X, Y
        CALL      L:?mul16_x_x_w0
        CPW       X, S:?w1
        JRC       L:??AWU_LSICalibrationConfig_2
//  154   {
//  155     AWU->APR = (uint8_t)(A - 2U);
        LD        A, YL
        ADD       A, #0xfe
        LD        L:0x50f1, A
        JP        L:?epilogue_l2
//  156   }
//  157   else
//  158   {
//  159     AWU->APR = (uint8_t)(A - 1U);
??AWU_LSICalibrationConfig_2:
        LD        A, YL
        ADD       A, #0xff
        LD        L:0x50f1, A
//  160   }
//  161 }
        JP        L:?epilogue_l2
//  162 
//  163 /**
//  164   * @brief  Configures AWU in Idle mode to reduce power consumption.
//  165   * @param  None
//  166   * @retval None
//  167   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  168 void AWU_IdleModeEnable(void)
//  169 {
//  170   /* Disable AWU peripheral */
//  171   AWU->CSR &= (uint8_t)(~AWU_CSR_AWUEN);
AWU_IdleModeEnable:
        BRES      L:0x50f0, #0x4
//  172   
//  173   /* No AWU timebase */
//  174   AWU->TBR = (uint8_t)(~AWU_TBR_AWUTB);
        MOV       L:0x50f2, #0xf0
//  175 }
        RET
//  176 
//  177 /**
//  178   * @brief  Returns status of the AWU peripheral flag.
//  179   * @param  None
//  180   * @retval FlagStatus : Status of the AWU flag.
//  181   * This parameter can be any of the @ref FlagStatus enumeration.
//  182   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  183 FlagStatus AWU_GetFlagStatus(void)
//  184 {
//  185   return((FlagStatus)(((uint8_t)(AWU->CSR & AWU_CSR_AWUF) == (uint8_t)0x00) ? RESET : SET));
AWU_GetFlagStatus:
        BTJF      L:0x50f0, #0x5, L:??AWU_GetFlagStatus_0
        LD        A, #0x1
        RET
??AWU_GetFlagStatus_0:
        CLR       A
        RET
//  186 }

        SECTION VREGS:DATA:REORDER:NOROOT(0)

        SECTION `.near.rodata`:CONST:REORDER:NOROOT(0)
`?<Constant "C:\\\\Users\\\\lun55\\\\Deskto...">`:
        DC8 "C:\\Users\\lun55\\Desktop\\J19B_STM8\\Lib\\stm8s_awu.c"

        END
//  187 
//  188 
//  189 /**
//  190   * @}
//  191   */
//  192   
//  193 /**
//  194   * @}
//  195   */
//  196   
//  197 
//  198 /************************ (C) COPYRIGHT STMicroelectronics *****END OF FILE****/
// 
//  83 bytes in section .near.rodata
// 349 bytes in section .near_func.text
// 
// 349 bytes of CODE  memory
//  83 bytes of CONST memory
//
//Errors: none
//Warnings: none
