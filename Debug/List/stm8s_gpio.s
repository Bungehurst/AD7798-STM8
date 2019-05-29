///////////////////////////////////////////////////////////////////////////////
//                                                                            /
//                                                      28/May/2019  16:13:16 /
// IAR C/C++ Compiler V1.31.1.20058 [Evaluation] for STM8                     /
// Copyright 2010-2012 IAR Systems AB.                                        /
//                                                                            /
//    Source file  =  E:\Desktop\J19B_STM8\Lib\src\stm8s_gpio.c               /
//    Command line =  E:\Desktop\J19B_STM8\Lib\src\stm8s_gpio.c -e -Ol        /
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
//    List file    =  E:\Desktop\J19B_STM8\Debug\List\stm8s_gpio.s            /
//                                                                            /
//                                                                            /
///////////////////////////////////////////////////////////////////////////////

        NAME stm8s_gpio

        EXTERN ?b0
        EXTERN ?b10
        EXTERN ?b11
        EXTERN ?epilogue_l2
        EXTERN ?push_l2
        EXTERN ?w0
        EXTERN ?w1
        EXTERN ?w4
        EXTERN assert_failed

        PUBLIC GPIO_DeInit
        PUBLIC GPIO_ExternalPullUpConfig
        PUBLIC GPIO_Init
        PUBLIC GPIO_ReadInputData
        PUBLIC GPIO_ReadInputPin
        PUBLIC GPIO_ReadOutputData
        PUBLIC GPIO_Write
        PUBLIC GPIO_WriteHigh
        PUBLIC GPIO_WriteLow
        PUBLIC GPIO_WriteReverse

// E:\Desktop\J19B_STM8\Lib\src\stm8s_gpio.c
//    1 /**
//    2   ******************************************************************************
//    3   * @file    stm8s_gpio.c
//    4   * @author  MCD Application Team
//    5   * @version V2.2.0
//    6   * @date    30-September-2014
//    7   * @brief   This file contains all the functions for the GPIO peripheral.
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
//   29 #include "stm8s_gpio.h"
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
//   44   * @addtogroup GPIO_Public_Functions
//   45   * @{
//   46   */
//   47 
//   48 /**
//   49   * @brief  Deinitializes the GPIOx peripheral registers to their default reset values.
//   50   * @param  GPIOx: Select the GPIO peripheral number (x = A to I).
//   51   * @retval None
//   52   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//   53 void GPIO_DeInit(GPIO_TypeDef* GPIOx)
//   54 {
//   55   GPIOx->ODR = GPIO_ODR_RESET_VALUE; /* Reset Output Data Register */
GPIO_DeInit:
        CLR       A
        LD        (X), A
//   56   GPIOx->DDR = GPIO_DDR_RESET_VALUE; /* Reset Data Direction Register */
        LDW       Y, X
        ADDW      Y, #0x2
        CLR       A
        LD        (Y), A
//   57   GPIOx->CR1 = GPIO_CR1_RESET_VALUE; /* Reset Control Register 1 */
        LDW       Y, X
        ADDW      Y, #0x3
        CLR       A
        LD        (Y), A
//   58   GPIOx->CR2 = GPIO_CR2_RESET_VALUE; /* Reset Control Register 2 */
        ADDW      X, #0x4
        CLR       A
        LD        (X), A
//   59 }
        RET
//   60 
//   61 /**
//   62   * @brief  Initializes the GPIOx according to the specified parameters.
//   63   * @param  GPIOx : Select the GPIO peripheral number (x = A to I).
//   64   * @param  GPIO_Pin : This parameter contains the pin number, it can be any value
//   65   *         of the @ref GPIO_Pin_TypeDef enumeration.
//   66   * @param  GPIO_Mode : This parameter can be a value of the
//   67   *         @Ref GPIO_Mode_TypeDef enumeration.
//   68   * @retval None
//   69   */
//   70 

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//   71 void GPIO_Init(GPIO_TypeDef* GPIOx, GPIO_Pin_TypeDef GPIO_Pin, GPIO_Mode_TypeDef GPIO_Mode)
//   72 {
GPIO_Init:
        CALL      L:?push_l2
        LDW       S:?w4, X
        LD        S:?b10, A
        MOV       S:?b11, S:?b0
//   73   /*----------------------*/
//   74   /* Check the parameters */
//   75   /*----------------------*/
//   76   
//   77   assert_param(IS_GPIO_MODE_OK(GPIO_Mode));
        TNZ       S:?b11
        JREQ      L:??GPIO_Init_0
        LD        A, S:?b11
        CP        A, #0x40
        JREQ      L:??GPIO_Init_0
        LD        A, S:?b11
        CP        A, #0x20
        JREQ      L:??GPIO_Init_0
        LD        A, S:?b11
        CP        A, #0x60
        JREQ      L:??GPIO_Init_0
        LD        A, S:?b11
        CP        A, #0xa0
        JREQ      L:??GPIO_Init_0
        LD        A, S:?b11
        CP        A, #0xe0
        JREQ      L:??GPIO_Init_0
        LD        A, S:?b11
        CP        A, #0x80
        JREQ      L:??GPIO_Init_0
        LD        A, S:?b11
        CP        A, #0xc0
        JREQ      L:??GPIO_Init_0
        LD        A, S:?b11
        CP        A, #0xb0
        JREQ      L:??GPIO_Init_0
        LD        A, S:?b11
        CP        A, #0xf0
        JREQ      L:??GPIO_Init_0
        LD        A, S:?b11
        CP        A, #0x90
        JREQ      L:??GPIO_Init_0
        LD        A, S:?b11
        CP        A, #0xd0
        JREQ      L:??GPIO_Init_0
        LDW       X, #0x4d
        LDW       S:?w1, X
        CLRW      X
        LDW       S:?w0, X
        LDW       X, #`?<Constant "E:\\\\Desktop\\\\J19B_STM8\\\\...">`
        CALL      L:assert_failed
//   78   assert_param(IS_GPIO_PIN_OK(GPIO_Pin));
??GPIO_Init_0:
        TNZ       S:?b10
        JRNE      L:??GPIO_Init_1
        LDW       X, #0x4e
        LDW       S:?w1, X
        CLRW      X
        LDW       S:?w0, X
        LDW       X, #`?<Constant "E:\\\\Desktop\\\\J19B_STM8\\\\...">`
        CALL      L:assert_failed
//   79   
//   80   /* Reset corresponding bit to GPIO_Pin in CR2 register */
//   81   GPIOx->CR2 &= (uint8_t)(~(GPIO_Pin));
??GPIO_Init_1:
        LDW       X, S:?w4
        ADDW      X, #0x4
        LD        A, S:?b10
        CPL       A
        AND       A, (X)
        LDW       X, S:?w4
        ADDW      X, #0x4
        LD        (X), A
//   82   
//   83   /*-----------------------------*/
//   84   /* Input/Output mode selection */
//   85   /*-----------------------------*/
//   86   
//   87   if ((((uint8_t)(GPIO_Mode)) & (uint8_t)0x80) != (uint8_t)0x00) /* Output mode */
        LD        A, S:?b11
        AND       A, #0x80
        CP        A, #0x0
        JREQ      L:??GPIO_Init_2
//   88   {
//   89     if ((((uint8_t)(GPIO_Mode)) & (uint8_t)0x10) != (uint8_t)0x00) /* High level */
        LD        A, S:?b11
        AND       A, #0x10
        CP        A, #0x0
        JREQ      L:??GPIO_Init_3
//   90     {
//   91       GPIOx->ODR |= (uint8_t)GPIO_Pin;
        LD        A, S:?b10
        OR        A, [S:?w4.w]
        LD        [S:?w4.w], A
        JRA       L:??GPIO_Init_4
//   92     } 
//   93     else /* Low level */
//   94     {
//   95       GPIOx->ODR &= (uint8_t)(~(GPIO_Pin));
??GPIO_Init_3:
        LD        A, S:?b10
        CPL       A
        AND       A, [S:?w4.w]
        LD        [S:?w4.w], A
//   96     }
//   97     /* Set Output mode */
//   98     GPIOx->DDR |= (uint8_t)GPIO_Pin;
??GPIO_Init_4:
        LDW       X, S:?w4
        ADDW      X, #0x2
        LD        A, S:?b10
        OR        A, (X)
        LDW       X, S:?w4
        ADDW      X, #0x2
        LD        (X), A
        JRA       L:??GPIO_Init_5
//   99   } 
//  100   else /* Input mode */
//  101   {
//  102     /* Set Input mode */
//  103     GPIOx->DDR &= (uint8_t)(~(GPIO_Pin));
??GPIO_Init_2:
        LDW       X, S:?w4
        ADDW      X, #0x2
        LD        A, S:?b10
        CPL       A
        AND       A, (X)
        LDW       X, S:?w4
        ADDW      X, #0x2
        LD        (X), A
//  104   }
//  105   
//  106   /*------------------------------------------------------------------------*/
//  107   /* Pull-Up/Float (Input) or Push-Pull/Open-Drain (Output) modes selection */
//  108   /*------------------------------------------------------------------------*/
//  109   
//  110   if ((((uint8_t)(GPIO_Mode)) & (uint8_t)0x40) != (uint8_t)0x00) /* Pull-Up or Push-Pull */
??GPIO_Init_5:
        LD        A, S:?b11
        AND       A, #0x40
        CP        A, #0x0
        JREQ      L:??GPIO_Init_6
//  111   {
//  112     GPIOx->CR1 |= (uint8_t)GPIO_Pin;
        LDW       X, S:?w4
        ADDW      X, #0x3
        LD        A, S:?b10
        OR        A, (X)
        LDW       X, S:?w4
        ADDW      X, #0x3
        LD        (X), A
        JRA       L:??GPIO_Init_7
//  113   } 
//  114   else /* Float or Open-Drain */
//  115   {
//  116     GPIOx->CR1 &= (uint8_t)(~(GPIO_Pin));
??GPIO_Init_6:
        LDW       X, S:?w4
        ADDW      X, #0x3
        LD        A, S:?b10
        CPL       A
        AND       A, (X)
        LDW       X, S:?w4
        ADDW      X, #0x3
        LD        (X), A
//  117   }
//  118   
//  119   /*-----------------------------------------------------*/
//  120   /* Interrupt (Input) or Slope (Output) modes selection */
//  121   /*-----------------------------------------------------*/
//  122   
//  123   if ((((uint8_t)(GPIO_Mode)) & (uint8_t)0x20) != (uint8_t)0x00) /* Interrupt or Slow slope */
??GPIO_Init_7:
        LD        A, S:?b11
        AND       A, #0x20
        CP        A, #0x0
        JREQ      L:??GPIO_Init_8
//  124   {
//  125     GPIOx->CR2 |= (uint8_t)GPIO_Pin;
        LDW       X, S:?w4
        ADDW      X, #0x4
        LD        A, S:?b10
        OR        A, (X)
        LDW       X, S:?w4
        ADDW      X, #0x4
        LD        (X), A
        JP        L:?epilogue_l2
//  126   } 
//  127   else /* No external interrupt or No slope control */
//  128   {
//  129     GPIOx->CR2 &= (uint8_t)(~(GPIO_Pin));
??GPIO_Init_8:
        LDW       X, S:?w4
        ADDW      X, #0x4
        CPL       S:?b10
        LD        A, S:?b10
        AND       A, (X)
        LDW       X, S:?w4
        ADDW      X, #0x4
        LD        (X), A
//  130   }
//  131 }
        JP        L:?epilogue_l2
//  132 
//  133 /**
//  134   * @brief  Writes data to the specified GPIO data port.
//  135   * @note   The port must be configured in output mode.
//  136   * @param  GPIOx : Select the GPIO peripheral number (x = A to I).
//  137   * @param  GPIO_PortVal : Specifies the value to be written to the port output
//  138   *         data register.
//  139   * @retval None
//  140   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  141 void GPIO_Write(GPIO_TypeDef* GPIOx, uint8_t PortVal)
//  142 {
//  143   GPIOx->ODR = PortVal;
GPIO_Write:
        LD        (X), A
//  144 }
        RET
//  145 
//  146 /**
//  147   * @brief  Writes high level to the specified GPIO pins.
//  148   * @note   The port must be configured in output mode.  
//  149   * @param  GPIOx : Select the GPIO peripheral number (x = A to I).
//  150   * @param  PortPins : Specifies the pins to be turned high to the port output.
//  151   *         data register.
//  152   * @retval None
//  153   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  154 void GPIO_WriteHigh(GPIO_TypeDef* GPIOx, GPIO_Pin_TypeDef PortPins)
//  155 {
//  156   GPIOx->ODR |= (uint8_t)PortPins;
GPIO_WriteHigh:
        OR        A, (X)
        LD        (X), A
//  157 }
        RET
//  158 
//  159 /**
//  160   * @brief  Writes low level to the specified GPIO pins.
//  161   * @note   The port must be configured in output mode.  
//  162   * @param  GPIOx : Select the GPIO peripheral number (x = A to I).
//  163   * @param  PortPins : Specifies the pins to be turned low to the port output.
//  164   *         data register.
//  165   * @retval None
//  166   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  167 void GPIO_WriteLow(GPIO_TypeDef* GPIOx, GPIO_Pin_TypeDef PortPins)
//  168 {
//  169   GPIOx->ODR &= (uint8_t)(~PortPins);
GPIO_WriteLow:
        CPL       A
        AND       A, (X)
        LD        (X), A
//  170 }
        RET
//  171 
//  172 /**
//  173   * @brief  Writes reverse level to the specified GPIO pins.
//  174   * @note   The port must be configured in output mode.
//  175   * @param  GPIOx : Select the GPIO peripheral number (x = A to I).
//  176   * @param  PortPins : Specifies the pins to be reversed to the port output.
//  177   *         data register.
//  178   * @retval None
//  179   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  180 void GPIO_WriteReverse(GPIO_TypeDef* GPIOx, GPIO_Pin_TypeDef PortPins)
//  181 {
//  182   GPIOx->ODR ^= (uint8_t)PortPins;
GPIO_WriteReverse:
        XOR       A, (X)
        LD        (X), A
//  183 }
        RET
//  184 
//  185 /**
//  186   * @brief  Reads the specified GPIO output data port.
//  187   * @note   The port must be configured in input mode.  
//  188   * @param  GPIOx : Select the GPIO peripheral number (x = A to I).
//  189   * @retval GPIO output data port value.
//  190   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  191 uint8_t GPIO_ReadOutputData(GPIO_TypeDef* GPIOx)
//  192 {
//  193   return ((uint8_t)GPIOx->ODR);
GPIO_ReadOutputData:
        LD        A, (X)
        RET
//  194 }
//  195 
//  196 /**
//  197   * @brief  Reads the specified GPIO input data port.
//  198   * @note   The port must be configured in input mode.   
//  199   * @param  GPIOx : Select the GPIO peripheral number (x = A to I).
//  200   * @retval GPIO input data port value.
//  201   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  202 uint8_t GPIO_ReadInputData(GPIO_TypeDef* GPIOx)
//  203 {
//  204   return ((uint8_t)GPIOx->IDR);
GPIO_ReadInputData:
        INCW      X
        LD        A, (X)
        RET
//  205 }
//  206 
//  207 /**
//  208   * @brief  Reads the specified GPIO input data pin.
//  209   * @param  GPIOx : Select the GPIO peripheral number (x = A to I).
//  210   * @param  GPIO_Pin : Specifies the pin number.
//  211   * @retval BitStatus : GPIO input pin status.
//  212   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  213 BitStatus GPIO_ReadInputPin(GPIO_TypeDef* GPIOx, GPIO_Pin_TypeDef GPIO_Pin)
//  214 {
//  215   return ((BitStatus)(GPIOx->IDR & (uint8_t)GPIO_Pin));
GPIO_ReadInputPin:
        INCW      X
        AND       A, (X)
        RET
//  216 }
//  217 
//  218 /**
//  219   * @brief  Configures the external pull-up on GPIOx pins.
//  220   * @param  GPIOx : Select the GPIO peripheral number (x = A to I).
//  221   * @param  GPIO_Pin : Specifies the pin number
//  222   * @param  NewState : The new state of the pull up pin.
//  223   * @retval None
//  224   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  225 void GPIO_ExternalPullUpConfig(GPIO_TypeDef* GPIOx, GPIO_Pin_TypeDef GPIO_Pin, FunctionalState NewState)
//  226 {
GPIO_ExternalPullUpConfig:
        CALL      L:?push_l2
        LDW       S:?w4, X
        LD        S:?b10, A
        MOV       S:?b11, S:?b0
//  227   /* Check the parameters */
//  228   assert_param(IS_GPIO_PIN_OK(GPIO_Pin));
        TNZ       S:?b10
        JRNE      L:??GPIO_ExternalPullUpConfig_0
        LDW       X, #0xe4
        LDW       S:?w1, X
        CLRW      X
        LDW       S:?w0, X
        LDW       X, #`?<Constant "E:\\\\Desktop\\\\J19B_STM8\\\\...">`
        CALL      L:assert_failed
//  229   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
??GPIO_ExternalPullUpConfig_0:
        TNZ       S:?b11
        JREQ      L:??GPIO_ExternalPullUpConfig_1
        LD        A, S:?b11
        CP        A, #0x1
        JREQ      L:??GPIO_ExternalPullUpConfig_1
        LDW       X, #0xe5
        LDW       S:?w1, X
        CLRW      X
        LDW       S:?w0, X
        LDW       X, #`?<Constant "E:\\\\Desktop\\\\J19B_STM8\\\\...">`
        CALL      L:assert_failed
//  230   
//  231   if (NewState != DISABLE) /* External Pull-Up Set*/
??GPIO_ExternalPullUpConfig_1:
        TNZ       S:?b11
        JREQ      L:??GPIO_ExternalPullUpConfig_2
//  232   {
//  233     GPIOx->CR1 |= (uint8_t)GPIO_Pin;
        LDW       X, S:?w4
        ADDW      X, #0x3
        LD        A, S:?b10
        OR        A, (X)
        LDW       X, S:?w4
        ADDW      X, #0x3
        LD        (X), A
        JP        L:?epilogue_l2
//  234   } else /* External Pull-Up Reset*/
//  235   {
//  236     GPIOx->CR1 &= (uint8_t)(~(GPIO_Pin));
??GPIO_ExternalPullUpConfig_2:
        LDW       X, S:?w4
        ADDW      X, #0x3
        CPL       S:?b10
        LD        A, S:?b10
        AND       A, (X)
        LDW       X, S:?w4
        ADDW      X, #0x3
        LD        (X), A
//  237   }
//  238 }
        JP        L:?epilogue_l2

        SECTION VREGS:DATA:REORDER:NOROOT(0)

        SECTION `.near.rodata`:CONST:REORDER:NOROOT(0)
`?<Constant "E:\\\\Desktop\\\\J19B_STM8\\\\...">`:
        DC8 "E:\\Desktop\\J19B_STM8\\Lib\\src\\stm8s_gpio.c"

        END
//  239 
//  240 /**
//  241   * @}
//  242   */
//  243   
//  244 /**
//  245   * @}
//  246   */
//  247   
//  248 
//  249 /************************ (C) COPYRIGHT STMicroelectronics *****END OF FILE****/
// 
//  42 bytes in section .near.rodata
// 414 bytes in section .near_func.text
// 
// 414 bytes of CODE  memory
//  42 bytes of CONST memory
//
//Errors: none
//Warnings: none
