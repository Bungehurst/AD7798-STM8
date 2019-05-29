///////////////////////////////////////////////////////////////////////////////
//                                                                            /
//                                                      11/Mar/2019  20:52:10 /
// IAR C/C++ Compiler V1.31.1.20058 [Evaluation] for STM8                     /
// Copyright 2010-2012 IAR Systems AB.                                        /
//                                                                            /
//    Source file  =  C:\Users\lun55\Desktop\J19B_STM8\Lib\stm8s_rst.c        /
//    Command line =  C:\Users\lun55\Desktop\J19B_STM8\Lib\stm8s_rst.c -e     /
//                    -Ol --no_cse --no_unroll --no_inline --no_code_motion   /
//                    --no_tbaa --no_cross_call --debug --code_model small    /
//                    --data_model medium -o C:\Users\lun55\Desktop\J19B_STM8 /
//                    \Debug\Obj\ --dlib_config "D:\Program Files (x86)\IAR   /
//                    Systems\Embedded Workbench 6.0                          /
//                    Evaluation\stm8\LIB\dlstm8smf.h" -lcN                   /
//                    C:\Users\lun55\Desktop\J19B_STM8\Debug\List\ -lB        /
//                    C:\Users\lun55\Desktop\J19B_STM8\Debug\List\ --vregs 16 /
//    List file    =  C:\Users\lun55\Desktop\J19B_STM8\Debug\List\stm8s_rst.s /
//                                                                            /
//                                                                            /
///////////////////////////////////////////////////////////////////////////////

        NAME stm8s_rst

        EXTERN ?b8
        EXTERN ?w0
        EXTERN ?w1
        EXTERN assert_failed

        PUBLIC RST_ClearFlag
        PUBLIC RST_GetFlagStatus

// C:\Users\lun55\Desktop\J19B_STM8\Lib\stm8s_rst.c
//    1 /**
//    2   ******************************************************************************
//    3   * @file    stm8s_rst.c
//    4   * @author  MCD Application Team
//    5   * @version V2.2.0
//    6   * @date    30-September-2014
//    7   * @brief   This file contains all the functions for the RST peripheral.
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
//   30 #include "stm8s_rst.h"
//   31 
//   32 /** @addtogroup STM8S_StdPeriph_Driver
//   33   * @{
//   34   */
//   35 /* Private typedef -----------------------------------------------------------*/
//   36 /* Private define ------------------------------------------------------------*/
//   37 /* Private macro -------------------------------------------------------------*/
//   38 /* Private variables ---------------------------------------------------------*/
//   39 /* Private function prototypes -----------------------------------------------*/
//   40 /* Private Constants ---------------------------------------------------------*/
//   41 /* Public functions ----------------------------------------------------------*/
//   42 /**
//   43   * @addtogroup RST_Public_Functions
//   44   * @{
//   45   */
//   46 
//   47 
//   48 /**
//   49   * @brief   Checks whether the specified RST flag is set or not.
//   50   * @param   RST_Flag : specify the reset flag to check.
//   51   *          This parameter can be a value of @ref RST_FLAG_TypeDef.
//   52   * @retval  FlagStatus: status of the given RST flag.
//   53   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//   54 FlagStatus RST_GetFlagStatus(RST_Flag_TypeDef RST_Flag)
//   55 {
RST_GetFlagStatus:
        PUSH      S:?b8
        LD        S:?b8, A
//   56   /* Check the parameters */
//   57   assert_param(IS_RST_FLAG_OK(RST_Flag));
        LD        A, S:?b8
        CP        A, #0x10
        JREQ      L:??RST_GetFlagStatus_0
        LD        A, S:?b8
        CP        A, #0x8
        JREQ      L:??RST_GetFlagStatus_0
        LD        A, S:?b8
        CP        A, #0x4
        JREQ      L:??RST_GetFlagStatus_0
        LD        A, S:?b8
        CP        A, #0x2
        JREQ      L:??RST_GetFlagStatus_0
        LD        A, S:?b8
        CP        A, #0x1
        JREQ      L:??RST_GetFlagStatus_0
        LDW       X, #0x39
        LDW       S:?w1, X
        CLRW      X
        LDW       S:?w0, X
        LDW       X, #`?<Constant "C:\\\\Users\\\\lun55\\\\Deskto...">`
        CALL      L:assert_failed
//   58   
//   59   /* Get flag status */
//   60   return((FlagStatus)(((uint8_t)(RST->SR & RST_Flag) == (uint8_t)0x00) ? RESET : SET));
??RST_GetFlagStatus_0:
        LD        A, S:?b8
        AND       A, L:0x50b3
        CP        A, #0x0
        JRNE      L:??RST_GetFlagStatus_1
        CLR       A
        JRA       L:??RST_GetFlagStatus_2
??RST_GetFlagStatus_1:
        LD        A, #0x1
??RST_GetFlagStatus_2:
        POP       S:?b8
        RET
//   61 }
//   62 
//   63 /**
//   64   * @brief  Clears the specified RST flag.
//   65   * @param  RST_Flag : specify the reset flag to clear.
//   66   *         This parameter can be a value of @ref RST_FLAG_TypeDef.
//   67   * @retval None
//   68   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//   69 void RST_ClearFlag(RST_Flag_TypeDef RST_Flag)
//   70 {
RST_ClearFlag:
        PUSH      S:?b8
        LD        S:?b8, A
//   71   /* Check the parameters */
//   72   assert_param(IS_RST_FLAG_OK(RST_Flag));
        LD        A, S:?b8
        CP        A, #0x10
        JREQ      L:??RST_ClearFlag_0
        LD        A, S:?b8
        CP        A, #0x8
        JREQ      L:??RST_ClearFlag_0
        LD        A, S:?b8
        CP        A, #0x4
        JREQ      L:??RST_ClearFlag_0
        LD        A, S:?b8
        CP        A, #0x2
        JREQ      L:??RST_ClearFlag_0
        LD        A, S:?b8
        CP        A, #0x1
        JREQ      L:??RST_ClearFlag_0
        LDW       X, #0x48
        LDW       S:?w1, X
        CLRW      X
        LDW       S:?w0, X
        LDW       X, #`?<Constant "C:\\\\Users\\\\lun55\\\\Deskto...">`
        CALL      L:assert_failed
//   73   
//   74   RST->SR = (uint8_t)RST_Flag;
??RST_ClearFlag_0:
        LD        A, S:?b8
        LD        L:0x50b3, A
//   75 }
        POP       S:?b8
        RET

        SECTION VREGS:DATA:REORDER:NOROOT(0)

        SECTION `.near.rodata`:CONST:REORDER:NOROOT(0)
`?<Constant "C:\\\\Users\\\\lun55\\\\Deskto...">`:
        DC8 "C:\\Users\\lun55\\Desktop\\J19B_STM8\\Lib\\stm8s_rst.c"

        END
//   76 
//   77 /**
//   78   * @}
//   79   */
//   80   
//   81 /**
//   82   * @}
//   83   */
//   84   
//   85 
//   86 /************************ (C) COPYRIGHT STMicroelectronics *****END OF FILE****/
// 
//  49 bytes in section .near.rodata
// 125 bytes in section .near_func.text
// 
// 125 bytes of CODE  memory
//  49 bytes of CONST memory
//
//Errors: none
//Warnings: none
