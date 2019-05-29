///////////////////////////////////////////////////////////////////////////////
//                                                                            /
//                                                      11/Mar/2019  20:52:12 /
// IAR C/C++ Compiler V1.31.1.20058 [Evaluation] for STM8                     /
// Copyright 2010-2012 IAR Systems AB.                                        /
//                                                                            /
//    Source file  =  C:\Users\lun55\Desktop\J19B_STM8\Lib\stm8s_wwdg.c       /
//    Command line =  C:\Users\lun55\Desktop\J19B_STM8\Lib\stm8s_wwdg.c -e    /
//                    -Ol --no_cse --no_unroll --no_inline --no_code_motion   /
//                    --no_tbaa --no_cross_call --debug --code_model small    /
//                    --data_model medium -o C:\Users\lun55\Desktop\J19B_STM8 /
//                    \Debug\Obj\ --dlib_config "D:\Program Files (x86)\IAR   /
//                    Systems\Embedded Workbench 6.0                          /
//                    Evaluation\stm8\LIB\dlstm8smf.h" -lcN                   /
//                    C:\Users\lun55\Desktop\J19B_STM8\Debug\List\ -lB        /
//                    C:\Users\lun55\Desktop\J19B_STM8\Debug\List\ --vregs 16 /
//    List file    =  C:\Users\lun55\Desktop\J19B_STM8\Debug\List\stm8s_wwdg. /
//                    s                                                       /
//                                                                            /
//                                                                            /
///////////////////////////////////////////////////////////////////////////////

        NAME stm8s_wwdg

        EXTERN ?b0
        EXTERN ?b8
        EXTERN ?b9
        EXTERN ?epilogue_w4
        EXTERN ?push_w4
        EXTERN ?w0
        EXTERN ?w1
        EXTERN assert_failed

        PUBLIC WWDG_GetCounter
        PUBLIC WWDG_Init
        PUBLIC WWDG_SWReset
        PUBLIC WWDG_SetCounter
        PUBLIC WWDG_SetWindowValue

// C:\Users\lun55\Desktop\J19B_STM8\Lib\stm8s_wwdg.c
//    1 /**
//    2   ********************************************************************************
//    3   * @file    stm8s_wwdg.c
//    4   * @author  MCD Application Team
//    5   * @version V2.2.0
//    6   * @date    30-September-2014
//    7   * @brief   This file contains all the functions for the WWDG peripheral.
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
//   29 #include "stm8s_wwdg.h"
//   30 
//   31 /** @addtogroup STM8S_StdPeriph_Driver
//   32   * @{
//   33   */
//   34 /* Private define ------------------------------------------------------------*/
//   35 #define BIT_MASK          ((uint8_t)0x7F)
//   36 /* Private macro -------------------------------------------------------------*/
//   37 /* Private variables ---------------------------------------------------------*/
//   38 /* Private function prototypes -----------------------------------------------*/
//   39 /* Private functions ---------------------------------------------------------*/
//   40 
//   41 /** @addtogroup WWDG_Public_Functions
//   42   * @{
//   43   */
//   44 
//   45 /**
//   46   * @brief  Initializes the WWDG peripheral.
//   47   *         This function set Window Register = WindowValue, Counter Register
//   48   *         according to Counter and \b ENABLE \b WWDG
//   49   * @param  Counter : WWDG counter value
//   50   * @param  WindowValue : specifies the WWDG Window Register, range is 0x00 to 0x7F.
//   51   * @retval None
//   52   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//   53 void WWDG_Init(uint8_t Counter, uint8_t WindowValue)
//   54 {
WWDG_Init:
        CALL      L:?push_w4
        LD        S:?b8, A
        MOV       S:?b9, S:?b0
//   55   /* Check the parameters */
//   56   assert_param(IS_WWDG_WINDOWLIMITVALUE_OK(WindowValue));
        LD        A, S:?b9
        CP        A, #0x80
        JRC       L:??WWDG_Init_0
        LDW       X, #0x38
        LDW       S:?w1, X
        CLRW      X
        LDW       S:?w0, X
        LDW       X, #`?<Constant "C:\\\\Users\\\\lun55\\\\Deskto...">`
        CALL      L:assert_failed
//   57   
//   58   WWDG->WR = WWDG_WR_RESET_VALUE;
??WWDG_Init_0:
        MOV       L:0x50d2, #0x7f
//   59   WWDG->CR = (uint8_t)((uint8_t)(WWDG_CR_WDGA | WWDG_CR_T6) | (uint8_t)Counter);
        LD        A, S:?b8
        OR        A, #0xc0
        LD        L:0x50d1, A
//   60   WWDG->WR = (uint8_t)((uint8_t)(~WWDG_CR_WDGA) & (uint8_t)(WWDG_CR_T6 | WindowValue));
        LD        A, S:?b9
        OR        A, #0x40
        AND       A, #0x7f
        LD        L:0x50d2, A
//   61 }
        JP        L:?epilogue_w4
//   62 
//   63 /**
//   64   * @brief  Refreshes the WWDG peripheral.
//   65   * @param  Counter :  WWDG Counter Value
//   66   *         This parameter must be a number between 0x40 and 0x7F.
//   67   * @retval None
//   68   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//   69 void WWDG_SetCounter(uint8_t Counter)
//   70 {
WWDG_SetCounter:
        PUSH      S:?b8
        LD        S:?b8, A
//   71   /* Check the parameters */
//   72   assert_param(IS_WWDG_COUNTERVALUE_OK(Counter));
        LD        A, S:?b8
        CP        A, #0x80
        JRC       L:??WWDG_SetCounter_0
        LDW       X, #0x48
        LDW       S:?w1, X
        CLRW      X
        LDW       S:?w0, X
        LDW       X, #`?<Constant "C:\\\\Users\\\\lun55\\\\Deskto...">`
        CALL      L:assert_failed
//   73   
//   74   /* Write to T[6:0] bits to configure the counter value, no need to do
//   75   a read-modify-write; writing a 0 to WDGA bit does nothing */
//   76   WWDG->CR = (uint8_t)(Counter & (uint8_t)BIT_MASK);
??WWDG_SetCounter_0:
        LD        A, S:?b8
        AND       A, #0x7f
        LD        L:0x50d1, A
//   77 }
        POP       S:?b8
        RET
//   78 
//   79 /**
//   80   * @brief Gets the WWDG Counter Value.
//   81   *        This value could be used to check if WWDG is in the window, where
//   82   *        refresh is allowed.
//   83   * @param  None
//   84   * @retval WWDG Counter Value
//   85   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//   86 uint8_t WWDG_GetCounter(void)
//   87 {
//   88   return(WWDG->CR);
WWDG_GetCounter:
        LD        A, L:0x50d1
        RET
//   89 }
//   90 
//   91 /**
//   92   * @brief  Generates immediate WWDG RESET.
//   93   * @param  None
//   94   * @retval None
//   95   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//   96 void WWDG_SWReset(void)
//   97 {
//   98   WWDG->CR = WWDG_CR_WDGA; /* Activate WWDG, with clearing T6 */
WWDG_SWReset:
        MOV       L:0x50d1, #0x80
//   99 }
        RET
//  100 
//  101 /**
//  102   * @brief  Sets the WWDG window value.
//  103   * @param  WindowValue: specifies the window value to be compared to the
//  104   *         downcounter.
//  105   *         This parameter value must be lower than 0x80.
//  106   * @retval None
//  107   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  108 void WWDG_SetWindowValue(uint8_t WindowValue)
//  109 {
WWDG_SetWindowValue:
        PUSH      S:?b8
        LD        S:?b8, A
//  110   /* Check the parameters */
//  111   assert_param(IS_WWDG_WINDOWLIMITVALUE_OK(WindowValue));
        LD        A, S:?b8
        CP        A, #0x80
        JRC       L:??WWDG_SetWindowValue_0
        LDW       X, #0x6f
        LDW       S:?w1, X
        CLRW      X
        LDW       S:?w0, X
        LDW       X, #`?<Constant "C:\\\\Users\\\\lun55\\\\Deskto...">`
        CALL      L:assert_failed
//  112   
//  113   WWDG->WR = (uint8_t)((uint8_t)(~WWDG_CR_WDGA) & (uint8_t)(WWDG_CR_T6 | WindowValue));
??WWDG_SetWindowValue_0:
        LD        A, S:?b8
        OR        A, #0x40
        AND       A, #0x7f
        LD        L:0x50d2, A
//  114 }
        POP       S:?b8
        RET

        SECTION VREGS:DATA:REORDER:NOROOT(0)

        SECTION `.near.rodata`:CONST:REORDER:NOROOT(0)
`?<Constant "C:\\\\Users\\\\lun55\\\\Deskto...">`:
        DC8 "C:\\Users\\lun55\\Desktop\\J19B_STM8\\Lib\\stm8s_wwdg.c"

        END
//  115 
//  116 /**
//  117   * @}
//  118   */
//  119   
//  120 /**
//  121   * @}
//  122   */
//  123   
//  124 
//  125 /************************ (C) COPYRIGHT STMicroelectronics *****END OF FILE****/
// 
//  50 bytes in section .near.rodata
// 134 bytes in section .near_func.text
// 
// 134 bytes of CODE  memory
//  50 bytes of CONST memory
//
//Errors: none
//Warnings: none
