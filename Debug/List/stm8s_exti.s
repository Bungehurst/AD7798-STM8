///////////////////////////////////////////////////////////////////////////////
//                                                                            /
//                                                      11/Mar/2019  20:52:09 /
// IAR C/C++ Compiler V1.31.1.20058 [Evaluation] for STM8                     /
// Copyright 2010-2012 IAR Systems AB.                                        /
//                                                                            /
//    Source file  =  C:\Users\lun55\Desktop\J19B_STM8\Lib\stm8s_exti.c       /
//    Command line =  C:\Users\lun55\Desktop\J19B_STM8\Lib\stm8s_exti.c -e    /
//                    -Ol --no_cse --no_unroll --no_inline --no_code_motion   /
//                    --no_tbaa --no_cross_call --debug --code_model small    /
//                    --data_model medium -o C:\Users\lun55\Desktop\J19B_STM8 /
//                    \Debug\Obj\ --dlib_config "D:\Program Files (x86)\IAR   /
//                    Systems\Embedded Workbench 6.0                          /
//                    Evaluation\stm8\LIB\dlstm8smf.h" -lcN                   /
//                    C:\Users\lun55\Desktop\J19B_STM8\Debug\List\ -lB        /
//                    C:\Users\lun55\Desktop\J19B_STM8\Debug\List\ --vregs 16 /
//    List file    =  C:\Users\lun55\Desktop\J19B_STM8\Debug\List\stm8s_exti. /
//                    s                                                       /
//                                                                            /
//                                                                            /
///////////////////////////////////////////////////////////////////////////////

        NAME stm8s_exti

        EXTERN ?b0
        EXTERN ?b8
        EXTERN ?b9
        EXTERN ?epilogue_w4
        EXTERN ?push_w4
        EXTERN ?sll8_a_a_6
        EXTERN ?srl8_a_a_6
        EXTERN ?w0
        EXTERN ?w1
        EXTERN assert_failed

        PUBLIC EXTI_DeInit
        PUBLIC EXTI_GetExtIntSensitivity
        PUBLIC EXTI_GetTLISensitivity
        PUBLIC EXTI_SetExtIntSensitivity
        PUBLIC EXTI_SetTLISensitivity

// C:\Users\lun55\Desktop\J19B_STM8\Lib\stm8s_exti.c
//    1 /**
//    2   ******************************************************************************
//    3   * @file    stm8s_exti.c
//    4   * @author  MCD Application Team
//    5   * @version V2.2.0
//    6   * @date    30-September-2014
//    7   * @brief   This file contains all the functions for the EXTI peripheral.
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
//   29 #include "stm8s_exti.h"
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
//   44   * @addtogroup EXTI_Public_Functions
//   45   * @{
//   46   */
//   47 
//   48 /**
//   49   * @brief  Deinitializes the external interrupt control registers to their default reset value.
//   50   * @param  None
//   51   * @retval None
//   52   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//   53 void EXTI_DeInit(void)
//   54 {
//   55   EXTI->CR1 = EXTI_CR1_RESET_VALUE;
EXTI_DeInit:
        MOV       L:0x50a0, #0x0
//   56   EXTI->CR2 = EXTI_CR2_RESET_VALUE;
        MOV       L:0x50a1, #0x0
//   57 }
        RET
//   58 
//   59 /**
//   60   * @brief  Set the external interrupt sensitivity of the selected port.
//   61   * @warning
//   62   * - The modification of external interrupt sensitivity is only possible when the interrupts are disabled.
//   63   * - The normal behavior is to disable the interrupts before calling this function, and re-enable them after.
//   64   * @param   Port The port number to access.
//   65   * @param   SensitivityValue The external interrupt sensitivity value to set.
//   66   * @retval None
//   67   * @par Required preconditions:
//   68   * Global interrupts must be disabled before calling this function.
//   69   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//   70 void EXTI_SetExtIntSensitivity(EXTI_Port_TypeDef Port, EXTI_Sensitivity_TypeDef SensitivityValue)
//   71 {
EXTI_SetExtIntSensitivity:
        CALL      L:?push_w4
        LD        S:?b8, A
        MOV       S:?b9, S:?b0
//   72   /* Check function parameters */
//   73   assert_param(IS_EXTI_PORT_OK(Port));
        TNZ       S:?b8
        JREQ      L:??EXTI_SetExtIntSensitivity_0
        LD        A, S:?b8
        CP        A, #0x1
        JREQ      L:??EXTI_SetExtIntSensitivity_0
        LD        A, S:?b8
        CP        A, #0x2
        JREQ      L:??EXTI_SetExtIntSensitivity_0
        LD        A, S:?b8
        CP        A, #0x3
        JREQ      L:??EXTI_SetExtIntSensitivity_0
        LD        A, S:?b8
        CP        A, #0x4
        JREQ      L:??EXTI_SetExtIntSensitivity_0
        LDW       X, #0x49
        LDW       S:?w1, X
        CLRW      X
        LDW       S:?w0, X
        LDW       X, #`?<Constant "C:\\\\Users\\\\lun55\\\\Deskto...">`
        CALL      L:assert_failed
//   74   assert_param(IS_EXTI_SENSITIVITY_OK(SensitivityValue));
??EXTI_SetExtIntSensitivity_0:
        TNZ       S:?b9
        JREQ      L:??EXTI_SetExtIntSensitivity_1
        LD        A, S:?b9
        CP        A, #0x1
        JREQ      L:??EXTI_SetExtIntSensitivity_1
        LD        A, S:?b9
        CP        A, #0x2
        JREQ      L:??EXTI_SetExtIntSensitivity_1
        LD        A, S:?b9
        CP        A, #0x3
        JREQ      L:??EXTI_SetExtIntSensitivity_1
        LDW       X, #0x4a
        LDW       S:?w1, X
        CLRW      X
        LDW       S:?w0, X
        LDW       X, #`?<Constant "C:\\\\Users\\\\lun55\\\\Deskto...">`
        CALL      L:assert_failed
//   75   
//   76   /* Set external interrupt sensitivity */
//   77   switch (Port)
??EXTI_SetExtIntSensitivity_1:
        LD        A, S:?b8
        TNZ       A
        JREQ      L:??EXTI_SetExtIntSensitivity_2
        DEC       A
        JREQ      L:??EXTI_SetExtIntSensitivity_3
        DEC       A
        JREQ      L:??EXTI_SetExtIntSensitivity_4
        DEC       A
        JREQ      L:??EXTI_SetExtIntSensitivity_5
        DEC       A
        JREQ      L:??EXTI_SetExtIntSensitivity_6
        JP        L:?epilogue_w4
//   78   {
//   79   case EXTI_PORT_GPIOA:
//   80     EXTI->CR1 &= (uint8_t)(~EXTI_CR1_PAIS);
??EXTI_SetExtIntSensitivity_2:
        LD        A, L:0x50a0
        AND       A, #0xfc
        LD        L:0x50a0, A
//   81     EXTI->CR1 |= (uint8_t)(SensitivityValue);
        LD        A, S:?b9
        OR        A, L:0x50a0
        LD        L:0x50a0, A
//   82     break;
        JP        L:?epilogue_w4
//   83   case EXTI_PORT_GPIOB:
//   84     EXTI->CR1 &= (uint8_t)(~EXTI_CR1_PBIS);
??EXTI_SetExtIntSensitivity_3:
        LD        A, L:0x50a0
        AND       A, #0xf3
        LD        L:0x50a0, A
//   85     EXTI->CR1 |= (uint8_t)((uint8_t)(SensitivityValue) << 2);
        LD        A, S:?b9
        SLL       A
        SLL       A
        OR        A, L:0x50a0
        LD        L:0x50a0, A
//   86     break;
        JP        L:?epilogue_w4
//   87   case EXTI_PORT_GPIOC:
//   88     EXTI->CR1 &= (uint8_t)(~EXTI_CR1_PCIS);
??EXTI_SetExtIntSensitivity_4:
        LD        A, L:0x50a0
        AND       A, #0xcf
        LD        L:0x50a0, A
//   89     EXTI->CR1 |= (uint8_t)((uint8_t)(SensitivityValue) << 4);
        LD        A, S:?b9
        SWAP      A
        AND       A, #0xf0
        OR        A, L:0x50a0
        LD        L:0x50a0, A
//   90     break;
        JP        L:?epilogue_w4
//   91   case EXTI_PORT_GPIOD:
//   92     EXTI->CR1 &= (uint8_t)(~EXTI_CR1_PDIS);
??EXTI_SetExtIntSensitivity_5:
        LD        A, L:0x50a0
        AND       A, #0x3f
        LD        L:0x50a0, A
//   93     EXTI->CR1 |= (uint8_t)((uint8_t)(SensitivityValue) << 6);
        LD        A, S:?b9
        CALL      L:?sll8_a_a_6
        OR        A, L:0x50a0
        LD        L:0x50a0, A
//   94     break;
        JP        L:?epilogue_w4
//   95   case EXTI_PORT_GPIOE:
//   96     EXTI->CR2 &= (uint8_t)(~EXTI_CR2_PEIS);
??EXTI_SetExtIntSensitivity_6:
        LD        A, L:0x50a1
        AND       A, #0xfc
        LD        L:0x50a1, A
//   97     EXTI->CR2 |= (uint8_t)(SensitivityValue);
        LD        A, S:?b9
        OR        A, L:0x50a1
        LD        L:0x50a1, A
//   98     break;
//   99   default:
//  100     break;
//  101   }
//  102 }
        JP        L:?epilogue_w4
//  103 
//  104 /**
//  105   * @brief  Set the TLI interrupt sensitivity.
//  106   * @param   SensitivityValue The TLI interrupt sensitivity value.
//  107   * @retval None
//  108   * @par Required preconditions:
//  109   * Global interrupts must be disabled before calling this function.
//  110   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  111 void EXTI_SetTLISensitivity(EXTI_TLISensitivity_TypeDef SensitivityValue)
//  112 {
EXTI_SetTLISensitivity:
        PUSH      S:?b8
        LD        S:?b8, A
//  113   /* Check function parameters */
//  114   assert_param(IS_EXTI_TLISENSITIVITY_OK(SensitivityValue));
        TNZ       S:?b8
        JREQ      L:??EXTI_SetTLISensitivity_0
        LD        A, S:?b8
        CP        A, #0x4
        JREQ      L:??EXTI_SetTLISensitivity_0
        LDW       X, #0x72
        LDW       S:?w1, X
        CLRW      X
        LDW       S:?w0, X
        LDW       X, #`?<Constant "C:\\\\Users\\\\lun55\\\\Deskto...">`
        CALL      L:assert_failed
//  115   
//  116   /* Set TLI interrupt sensitivity */
//  117   EXTI->CR2 &= (uint8_t)(~EXTI_CR2_TLIS);
??EXTI_SetTLISensitivity_0:
        BRES      L:0x50a1, #0x2
//  118   EXTI->CR2 |= (uint8_t)(SensitivityValue);
        LD        A, S:?b8
        OR        A, L:0x50a1
        LD        L:0x50a1, A
//  119 }
        POP       S:?b8
        RET
//  120 
//  121 /**
//  122   * @brief  Get the external interrupt sensitivity of the selected port.
//  123   * @param   Port The port number to access.
//  124   * @retval EXTI_Sensitivity_TypeDef The external interrupt sensitivity of the selected port.
//  125   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  126 EXTI_Sensitivity_TypeDef EXTI_GetExtIntSensitivity(EXTI_Port_TypeDef Port)
//  127 {
EXTI_GetExtIntSensitivity:
        CALL      L:?push_w4
        LD        S:?b9, A
//  128   uint8_t value = 0;
        CLR       S:?b8
//  129   
//  130   /* Check function parameters */
//  131   assert_param(IS_EXTI_PORT_OK(Port));
        TNZ       S:?b9
        JREQ      L:??EXTI_GetExtIntSensitivity_0
        LD        A, S:?b9
        CP        A, #0x1
        JREQ      L:??EXTI_GetExtIntSensitivity_0
        LD        A, S:?b9
        CP        A, #0x2
        JREQ      L:??EXTI_GetExtIntSensitivity_0
        LD        A, S:?b9
        CP        A, #0x3
        JREQ      L:??EXTI_GetExtIntSensitivity_0
        LD        A, S:?b9
        CP        A, #0x4
        JREQ      L:??EXTI_GetExtIntSensitivity_0
        LDW       X, #0x83
        LDW       S:?w1, X
        CLRW      X
        LDW       S:?w0, X
        LDW       X, #`?<Constant "C:\\\\Users\\\\lun55\\\\Deskto...">`
        CALL      L:assert_failed
//  132   
//  133   switch (Port)
??EXTI_GetExtIntSensitivity_0:
        LD        A, S:?b9
        TNZ       A
        JREQ      L:??EXTI_GetExtIntSensitivity_1
        DEC       A
        JREQ      L:??EXTI_GetExtIntSensitivity_2
        DEC       A
        JREQ      L:??EXTI_GetExtIntSensitivity_3
        DEC       A
        JREQ      L:??EXTI_GetExtIntSensitivity_4
        DEC       A
        JREQ      L:??EXTI_GetExtIntSensitivity_5
        JRA       L:??EXTI_GetExtIntSensitivity_6
//  134   {
//  135   case EXTI_PORT_GPIOA:
//  136     value = (uint8_t)(EXTI->CR1 & EXTI_CR1_PAIS);
??EXTI_GetExtIntSensitivity_1:
        LD        A, L:0x50a0
        AND       A, #0x3
        LD        S:?b8, A
//  137     break;
        JRA       L:??EXTI_GetExtIntSensitivity_6
//  138   case EXTI_PORT_GPIOB:
//  139     value = (uint8_t)((uint8_t)(EXTI->CR1 & EXTI_CR1_PBIS) >> 2);
??EXTI_GetExtIntSensitivity_2:
        LD        A, L:0x50a0
        AND       A, #0xc
        SRL       A
        SRL       A
        LD        S:?b8, A
//  140     break;
        JRA       L:??EXTI_GetExtIntSensitivity_6
//  141   case EXTI_PORT_GPIOC:
//  142     value = (uint8_t)((uint8_t)(EXTI->CR1 & EXTI_CR1_PCIS) >> 4);
??EXTI_GetExtIntSensitivity_3:
        LD        A, L:0x50a0
        AND       A, #0x30
        SWAP      A
        AND       A, #0xf
        LD        S:?b8, A
//  143     break;
        JRA       L:??EXTI_GetExtIntSensitivity_6
//  144   case EXTI_PORT_GPIOD:
//  145     value = (uint8_t)((uint8_t)(EXTI->CR1 & EXTI_CR1_PDIS) >> 6);
??EXTI_GetExtIntSensitivity_4:
        LD        A, L:0x50a0
        CALL      L:?srl8_a_a_6
        LD        S:?b8, A
//  146     break;
        JRA       L:??EXTI_GetExtIntSensitivity_6
//  147   case EXTI_PORT_GPIOE:
//  148     value = (uint8_t)(EXTI->CR2 & EXTI_CR2_PEIS);
??EXTI_GetExtIntSensitivity_5:
        LD        A, L:0x50a1
        AND       A, #0x3
        LD        S:?b8, A
//  149     break;
//  150   default:
//  151     break;
//  152   }
//  153   
//  154   return((EXTI_Sensitivity_TypeDef)value);
??EXTI_GetExtIntSensitivity_6:
        LD        A, S:?b8
        JP        L:?epilogue_w4
//  155 }
//  156 
//  157 /**
//  158   * @brief  Get the TLI interrupt sensitivity.
//  159   * @param  None
//  160   * @retval EXTI_TLISensitivity_TypeDef The TLI interrupt sensitivity read.
//  161   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  162 EXTI_TLISensitivity_TypeDef EXTI_GetTLISensitivity(void)
//  163 {
//  164   uint8_t value = 0;
EXTI_GetTLISensitivity:
        CLR       S:?b0
//  165   
//  166   /* Get TLI interrupt sensitivity */
//  167   value = (uint8_t)(EXTI->CR2 & EXTI_CR2_TLIS);
        LD        A, L:0x50a1
        AND       A, #0x4
        LD        S:?b0, A
//  168   
//  169   return((EXTI_TLISensitivity_TypeDef)value);
        LD        A, S:?b0
        RET
//  170 }

        SECTION VREGS:DATA:REORDER:NOROOT(0)

        SECTION `.near.rodata`:CONST:REORDER:NOROOT(0)
`?<Constant "C:\\\\Users\\\\lun55\\\\Deskto...">`:
        DC8 "C:\\Users\\lun55\\Desktop\\J19B_STM8\\Lib\\stm8s_exti.c"

        END
//  171 
//  172 /**
//  173   * @}
//  174   */
//  175   
//  176 /**
//  177   * @}
//  178   */
//  179   
//  180 
//  181 /************************ (C) COPYRIGHT STMicroelectronics *****END OF FILE****/
// 
//  50 bytes in section .near.rodata
// 397 bytes in section .near_func.text
// 
// 397 bytes of CODE  memory
//  50 bytes of CONST memory
//
//Errors: none
//Warnings: none
