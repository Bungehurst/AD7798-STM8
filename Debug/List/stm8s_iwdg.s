///////////////////////////////////////////////////////////////////////////////
//                                                                            /
//                                                      11/Mar/2019  20:52:10 /
// IAR C/C++ Compiler V1.31.1.20058 [Evaluation] for STM8                     /
// Copyright 2010-2012 IAR Systems AB.                                        /
//                                                                            /
//    Source file  =  C:\Users\lun55\Desktop\J19B_STM8\Lib\stm8s_iwdg.c       /
//    Command line =  C:\Users\lun55\Desktop\J19B_STM8\Lib\stm8s_iwdg.c -e    /
//                    -Ol --no_cse --no_unroll --no_inline --no_code_motion   /
//                    --no_tbaa --no_cross_call --debug --code_model small    /
//                    --data_model medium -o C:\Users\lun55\Desktop\J19B_STM8 /
//                    \Debug\Obj\ --dlib_config "D:\Program Files (x86)\IAR   /
//                    Systems\Embedded Workbench 6.0                          /
//                    Evaluation\stm8\LIB\dlstm8smf.h" -lcN                   /
//                    C:\Users\lun55\Desktop\J19B_STM8\Debug\List\ -lB        /
//                    C:\Users\lun55\Desktop\J19B_STM8\Debug\List\ --vregs 16 /
//    List file    =  C:\Users\lun55\Desktop\J19B_STM8\Debug\List\stm8s_iwdg. /
//                    s                                                       /
//                                                                            /
//                                                                            /
///////////////////////////////////////////////////////////////////////////////

        NAME stm8s_iwdg

        EXTERN ?b8
        EXTERN ?w0
        EXTERN ?w1
        EXTERN assert_failed

        PUBLIC IWDG_Enable
        PUBLIC IWDG_ReloadCounter
        PUBLIC IWDG_SetPrescaler
        PUBLIC IWDG_SetReload
        PUBLIC IWDG_WriteAccessCmd

// C:\Users\lun55\Desktop\J19B_STM8\Lib\stm8s_iwdg.c
//    1 /**
//    2   ********************************************************************************
//    3   * @file    stm8s_iwdg.c
//    4   * @author  MCD Application Team
//    5   * @version V2.2.0
//    6   * @date    30-September-2014
//    7   * @brief   This file contains all the functions for the IWDG peripheral.
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
//   29 #include "stm8s_iwdg.h"
//   30 
//   31 /* Private define ------------------------------------------------------------*/
//   32 /* Private macro -------------------------------------------------------------*/
//   33 /* Private variables ---------------------------------------------------------*/
//   34 /* Private function prototypes -----------------------------------------------*/
//   35 /* Private functions ---------------------------------------------------------*/
//   36 /* Public functions ----------------------------------------------------------*/
//   37 
//   38 /** @addtogroup IWDG_Public_Functions
//   39   * @{
//   40   */
//   41 
//   42 /**
//   43   * @brief  Enables or disables write access to Prescaler and Reload registers.
//   44   * @param  IWDG_WriteAccess : New state of write access to Prescaler and Reload
//   45   *         registers.  This parameter can be a value of @ref IWDG_WriteAccess_TypeDef.
//   46   * @retval None
//   47   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//   48 void IWDG_WriteAccessCmd(IWDG_WriteAccess_TypeDef IWDG_WriteAccess)
//   49 {
IWDG_WriteAccessCmd:
        PUSH      S:?b8
        LD        S:?b8, A
//   50   /* Check the parameters */
//   51   assert_param(IS_IWDG_WRITEACCESS_MODE_OK(IWDG_WriteAccess));
        LD        A, S:?b8
        CP        A, #0x55
        JREQ      L:??IWDG_WriteAccessCmd_0
        TNZ       S:?b8
        JREQ      L:??IWDG_WriteAccessCmd_0
        LDW       X, #0x33
        LDW       S:?w1, X
        CLRW      X
        LDW       S:?w0, X
        LDW       X, #`?<Constant "C:\\\\Users\\\\lun55\\\\Deskto...">`
        CALL      L:assert_failed
//   52   
//   53   IWDG->KR = (uint8_t)IWDG_WriteAccess; /* Write Access */
??IWDG_WriteAccessCmd_0:
        LD        A, S:?b8
        LD        L:0x50e0, A
//   54 }
        POP       S:?b8
        RET
//   55 
//   56 /**
//   57   * @brief  Sets IWDG Prescaler value.
//   58   * @note   Write access should be enabled
//   59   * @param  IWDG_Prescaler : Specifies the IWDG Prescaler value.
//   60   *         This parameter can be a value of @ref IWDG_Prescaler_TypeDef.
//   61   * @retval None
//   62   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//   63 void IWDG_SetPrescaler(IWDG_Prescaler_TypeDef IWDG_Prescaler)
//   64 {
IWDG_SetPrescaler:
        PUSH      S:?b8
        LD        S:?b8, A
//   65   /* Check the parameters */
//   66   assert_param(IS_IWDG_PRESCALER_OK(IWDG_Prescaler));
        TNZ       S:?b8
        JREQ      L:??IWDG_SetPrescaler_0
        LD        A, S:?b8
        CP        A, #0x1
        JREQ      L:??IWDG_SetPrescaler_0
        LD        A, S:?b8
        CP        A, #0x2
        JREQ      L:??IWDG_SetPrescaler_0
        LD        A, S:?b8
        CP        A, #0x3
        JREQ      L:??IWDG_SetPrescaler_0
        LD        A, S:?b8
        CP        A, #0x4
        JREQ      L:??IWDG_SetPrescaler_0
        LD        A, S:?b8
        CP        A, #0x5
        JREQ      L:??IWDG_SetPrescaler_0
        LD        A, S:?b8
        CP        A, #0x6
        JREQ      L:??IWDG_SetPrescaler_0
        LDW       X, #0x42
        LDW       S:?w1, X
        CLRW      X
        LDW       S:?w0, X
        LDW       X, #`?<Constant "C:\\\\Users\\\\lun55\\\\Deskto...">`
        CALL      L:assert_failed
//   67   
//   68   IWDG->PR = (uint8_t)IWDG_Prescaler;
??IWDG_SetPrescaler_0:
        LD        A, S:?b8
        LD        L:0x50e1, A
//   69 }
        POP       S:?b8
        RET
//   70 
//   71 /**
//   72   * @brief  Sets IWDG Reload value.
//   73   * @note   Write access should be enabled
//   74   * @param  IWDG_Reload : Reload register value.
//   75   *         This parameter must be a number between 0 and 0xFF.
//   76   * @retval None
//   77   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//   78 void IWDG_SetReload(uint8_t IWDG_Reload)
//   79 {
//   80   IWDG->RLR = IWDG_Reload;
IWDG_SetReload:
        LD        L:0x50e2, A
//   81 }
        RET
//   82 
//   83 /**
//   84   * @brief  Reloads IWDG counter
//   85   * @note   Write access should be enabled
//   86   * @param  None
//   87   * @retval None
//   88   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//   89 void IWDG_ReloadCounter(void)
//   90 {
//   91   IWDG->KR = IWDG_KEY_REFRESH;
IWDG_ReloadCounter:
        MOV       L:0x50e0, #0xaa
//   92 }
        RET
//   93 
//   94 /**
//   95   * @brief  Enables IWDG.
//   96   * @param  None
//   97   * @retval None
//   98   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//   99 void IWDG_Enable(void)
//  100 {
//  101   IWDG->KR = IWDG_KEY_ENABLE;
IWDG_Enable:
        MOV       L:0x50e0, #0xcc
//  102 }
        RET

        SECTION VREGS:DATA:REORDER:NOROOT(0)

        SECTION `.near.rodata`:CONST:REORDER:NOROOT(0)
`?<Constant "C:\\\\Users\\\\lun55\\\\Deskto...">`:
        DC8 "C:\\Users\\lun55\\Desktop\\J19B_STM8\\Lib\\stm8s_iwdg.c"

        END
//  103 
//  104 /**
//  105   * @}
//  106   */
//  107   
//  108 /**
//  109   * @}
//  110   */
//  111   
//  112 
//  113 /************************ (C) COPYRIGHT STMicroelectronics *****END OF FILE****/
// 
//  50 bytes in section .near.rodata
// 120 bytes in section .near_func.text
// 
// 120 bytes of CODE  memory
//  50 bytes of CONST memory
//
//Errors: none
//Warnings: none
