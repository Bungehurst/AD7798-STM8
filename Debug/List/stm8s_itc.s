///////////////////////////////////////////////////////////////////////////////
//                                                                            /
//                                                      11/Mar/2019  20:52:10 /
// IAR C/C++ Compiler V1.31.1.20058 [Evaluation] for STM8                     /
// Copyright 2010-2012 IAR Systems AB.                                        /
//                                                                            /
//    Source file  =  C:\Users\lun55\Desktop\J19B_STM8\Lib\stm8s_itc.c        /
//    Command line =  C:\Users\lun55\Desktop\J19B_STM8\Lib\stm8s_itc.c -e     /
//                    -Ol --no_cse --no_unroll --no_inline --no_code_motion   /
//                    --no_tbaa --no_cross_call --debug --code_model small    /
//                    --data_model medium -o C:\Users\lun55\Desktop\J19B_STM8 /
//                    \Debug\Obj\ --dlib_config "D:\Program Files (x86)\IAR   /
//                    Systems\Embedded Workbench 6.0                          /
//                    Evaluation\stm8\LIB\dlstm8smf.h" -lcN                   /
//                    C:\Users\lun55\Desktop\J19B_STM8\Debug\List\ -lB        /
//                    C:\Users\lun55\Desktop\J19B_STM8\Debug\List\ --vregs 16 /
//    List file    =  C:\Users\lun55\Desktop\J19B_STM8\Debug\List\stm8s_itc.s /
//                                                                            /
//                                                                            /
///////////////////////////////////////////////////////////////////////////////

        NAME stm8s_itc

        EXTERN ?b0
        EXTERN ?b1
        EXTERN ?b8
        EXTERN ?b9
        EXTERN ?epilogue_w4
        EXTERN ?push_w4
        EXTERN ?sll16_x_x_a
        EXTERN ?srl8_a_a_b0
        EXTERN ?w0
        EXTERN ?w1
        EXTERN assert_failed

        PUBLIC ITC_DeInit
        PUBLIC ITC_GetCPUCC
        PUBLIC ITC_GetSoftIntStatus
        PUBLIC ITC_GetSoftwarePriority
        PUBLIC ITC_SetSoftwarePriority

// C:\Users\lun55\Desktop\J19B_STM8\Lib\stm8s_itc.c
//    1 /**
//    2   ******************************************************************************
//    3   * @file    stm8s_itc.c
//    4   * @author  MCD Application Team
//    5   * @version V2.2.0
//    6   * @date    30-September-2014
//    7   * @brief   This file contains all the functions for the ITC peripheral.
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
//   29 #include "stm8s_itc.h"
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
//   41 /** @addtogroup ITC_Private_Functions
//   42   * @{
//   43   */
//   44 
//   45 /**
//   46   * @brief  Utility function used to read CC register.
//   47   * @param  None
//   48   * @retval CPU CC register value
//   49   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//   50 uint8_t ITC_GetCPUCC(void)
//   51 {
//   52 #ifdef _COSMIC_
//   53   _asm("push cc");
//   54   _asm("pop a");
//   55   return; /* Ignore compiler warning, the returned value is in A register */
//   56 #elif defined _RAISONANCE_ /* _RAISONANCE_ */
//   57   return _getCC_();
//   58 #else /* _IAR_ */
//   59   asm("push cc");
ITC_GetCPUCC:
        push cc
//   60   asm("pop a"); /* Ignore compiler warning, the returned value is in A register */
        pop a
//   61 #endif /* _COSMIC_*/
//   62 }
        RET
//   63 
//   64 
//   65 /**
//   66   * @}
//   67   */
//   68 
//   69 /* Public functions ----------------------------------------------------------*/
//   70 
//   71 /** @addtogroup ITC_Public_Functions
//   72   * @{
//   73   */
//   74 
//   75 /**
//   76   * @brief  Deinitializes the ITC registers to their default reset value.
//   77   * @param  None
//   78   * @retval None
//   79   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//   80 void ITC_DeInit(void)
//   81 {
//   82   ITC->ISPR1 = ITC_SPRX_RESET_VALUE;
ITC_DeInit:
        MOV       L:0x7f70, #0xff
//   83   ITC->ISPR2 = ITC_SPRX_RESET_VALUE;
        MOV       L:0x7f71, #0xff
//   84   ITC->ISPR3 = ITC_SPRX_RESET_VALUE;
        MOV       L:0x7f72, #0xff
//   85   ITC->ISPR4 = ITC_SPRX_RESET_VALUE;
        MOV       L:0x7f73, #0xff
//   86   ITC->ISPR5 = ITC_SPRX_RESET_VALUE;
        MOV       L:0x7f74, #0xff
//   87   ITC->ISPR6 = ITC_SPRX_RESET_VALUE;
        MOV       L:0x7f75, #0xff
//   88   ITC->ISPR7 = ITC_SPRX_RESET_VALUE;
        MOV       L:0x7f76, #0xff
//   89   ITC->ISPR8 = ITC_SPRX_RESET_VALUE;
        MOV       L:0x7f77, #0xff
//   90 }
        RET
//   91 
//   92 /**
//   93   * @brief  Gets the interrupt software priority bits (I1, I0) value from CPU CC register.
//   94   * @param  None
//   95   * @retval The interrupt software priority bits value.
//   96   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//   97 uint8_t ITC_GetSoftIntStatus(void)
//   98 {
//   99   return (uint8_t)(ITC_GetCPUCC() & CPU_CC_I1I0);
ITC_GetSoftIntStatus:
        CALL      L:ITC_GetCPUCC
        AND       A, #0x28
        RET
//  100 }
//  101 
//  102 /**
//  103   * @brief  Gets the software priority of the specified interrupt source.
//  104   * @param  IrqNum : Specifies the peripheral interrupt source.
//  105   * @retval ITC_PriorityLevel_TypeDef : Specifies the software priority of the interrupt source.
//  106   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  107 ITC_PriorityLevel_TypeDef ITC_GetSoftwarePriority(ITC_Irq_TypeDef IrqNum)
//  108 {
ITC_GetSoftwarePriority:
        CALL      L:?push_w4
        LD        S:?b8, A
//  109   uint8_t Value = 0;
        CLR       S:?b9
//  110   uint8_t Mask = 0;
        CLR       S:?b0
//  111   
//  112   /* Check function parameters */
//  113   assert_param(IS_ITC_IRQ_OK((uint8_t)IrqNum));
        LD        A, S:?b8
        CP        A, #0x19
        JRC       L:??ITC_GetSoftwarePriority_0
        LDW       X, #0x71
        LDW       S:?w1, X
        CLRW      X
        LDW       S:?w0, X
        LDW       X, #`?<Constant "C:\\\\Users\\\\lun55\\\\Deskto...">`
        CALL      L:assert_failed
//  114   
//  115   /* Define the mask corresponding to the bits position in the SPR register */
//  116   Mask = (uint8_t)(0x03U << (((uint8_t)IrqNum % 4U) * 2U));
??ITC_GetSoftwarePriority_0:
        LD        A, #0x4
        CLRW      X
        RRWA      X, A
        LD        A, S:?b8
        RLWA      X, A
        DIV       X, A
        MOV       S:?b0, #0x2
        LD        XL, A
        LD        A, S:?b0
        MUL       X, A
        LD        A, XL
        LDW       X, #0x3
        CALL      L:?sll16_x_x_a
        EXG       A, XL
        LD        S:?b0, A
        EXG       A, XL
//  117   
//  118   switch (IrqNum)
        LD        A, S:?b8
        TNZ       A
        JREQ      L:??ITC_GetSoftwarePriority_1
        DEC       A
        JREQ      L:??ITC_GetSoftwarePriority_1
        DEC       A
        JREQ      L:??ITC_GetSoftwarePriority_1
        DEC       A
        JREQ      L:??ITC_GetSoftwarePriority_1
        DEC       A
        JREQ      L:??ITC_GetSoftwarePriority_2
        DEC       A
        JREQ      L:??ITC_GetSoftwarePriority_2
        DEC       A
        JREQ      L:??ITC_GetSoftwarePriority_2
        DEC       A
        JREQ      L:??ITC_GetSoftwarePriority_2
        SUB       A, #0x3
        JREQ      L:??ITC_GetSoftwarePriority_3
        DEC       A
        JREQ      L:??ITC_GetSoftwarePriority_3
        DEC       A
        JREQ      L:??ITC_GetSoftwarePriority_4
        DEC       A
        JREQ      L:??ITC_GetSoftwarePriority_4
        DEC       A
        JREQ      L:??ITC_GetSoftwarePriority_4
        DEC       A
        JREQ      L:??ITC_GetSoftwarePriority_4
        DEC       A
        JREQ      L:??ITC_GetSoftwarePriority_5
        DEC       A
        JREQ      L:??ITC_GetSoftwarePriority_5
        DEC       A
        JREQ      L:??ITC_GetSoftwarePriority_5
        DEC       A
        JREQ      L:??ITC_GetSoftwarePriority_5
        SUB       A, #0x3
        JREQ      L:??ITC_GetSoftwarePriority_6
        DEC       A
        JREQ      L:??ITC_GetSoftwarePriority_6
        DEC       A
        JREQ      L:??ITC_GetSoftwarePriority_7
        JRA       L:??ITC_GetSoftwarePriority_8
//  119   {
//  120   case ITC_IRQ_TLI: /* TLI software priority can be read but has no meaning */
//  121   case ITC_IRQ_AWU:
//  122   case ITC_IRQ_CLK:
//  123   case ITC_IRQ_PORTA:
//  124     Value = (uint8_t)(ITC->ISPR1 & Mask); /* Read software priority */
??ITC_GetSoftwarePriority_1:
        LD        A, S:?b0
        AND       A, L:0x7f70
        LD        S:?b9, A
//  125     break;
        JRA       L:??ITC_GetSoftwarePriority_8
//  126 
//  127   case ITC_IRQ_PORTB:
//  128   case ITC_IRQ_PORTC:
//  129   case ITC_IRQ_PORTD:
//  130   case ITC_IRQ_PORTE:
//  131     Value = (uint8_t)(ITC->ISPR2 & Mask); /* Read software priority */
??ITC_GetSoftwarePriority_2:
        LD        A, S:?b0
        AND       A, L:0x7f71
        LD        S:?b9, A
//  132     break;
        JRA       L:??ITC_GetSoftwarePriority_8
//  133 
//  134 #if defined(STM8S208) || defined(STM8AF52Ax)
//  135   case ITC_IRQ_CAN_RX:
//  136   case ITC_IRQ_CAN_TX:
//  137 #endif /*STM8S208 or STM8AF52Ax */
//  138 #if defined(STM8S903) || defined(STM8AF622x)
//  139   case ITC_IRQ_PORTF:
//  140 #endif /*STM8S903 or STM8AF622x */
//  141   case ITC_IRQ_SPI:
//  142   case ITC_IRQ_TIM1_OVF:
//  143     Value = (uint8_t)(ITC->ISPR3 & Mask); /* Read software priority */
??ITC_GetSoftwarePriority_3:
        LD        A, S:?b0
        AND       A, L:0x7f72
        LD        S:?b9, A
//  144     break;
        JRA       L:??ITC_GetSoftwarePriority_8
//  145 
//  146   case ITC_IRQ_TIM1_CAPCOM:
//  147 #if defined (STM8S903) || defined (STM8AF622x)
//  148   case ITC_IRQ_TIM5_OVFTRI:
//  149   case ITC_IRQ_TIM5_CAPCOM:
//  150 #else
//  151   case ITC_IRQ_TIM2_OVF:
//  152   case ITC_IRQ_TIM2_CAPCOM:
//  153 #endif /* STM8S903 or STM8AF622x*/
//  154   case ITC_IRQ_TIM3_OVF:
//  155     Value = (uint8_t)(ITC->ISPR4 & Mask); /* Read software priority */
??ITC_GetSoftwarePriority_4:
        LD        A, S:?b0
        AND       A, L:0x7f73
        LD        S:?b9, A
//  156     break;
        JRA       L:??ITC_GetSoftwarePriority_8
//  157 
//  158   case ITC_IRQ_TIM3_CAPCOM:
//  159 #if defined(STM8S208) ||defined(STM8S207) || defined (STM8S007) || defined(STM8S103) || \ 
//  160     defined(STM8S003) ||defined(STM8S903) || defined (STM8AF52Ax) || defined (STM8AF62Ax)
//  161   case ITC_IRQ_UART1_TX:
//  162   case ITC_IRQ_UART1_RX:
//  163 #endif /*STM8S208 or STM8S207 or STM8S007 or STM8S103 or STM8S003 or STM8S903 or STM8AF52Ax or STM8AF62Ax */ 
//  164 #if defined(STM8AF622x)
//  165   case ITC_IRQ_UART4_TX:
//  166   case ITC_IRQ_UART4_RX:
//  167 #endif /*STM8AF622x */
//  168   case ITC_IRQ_I2C:
//  169     Value = (uint8_t)(ITC->ISPR5 & Mask); /* Read software priority */
??ITC_GetSoftwarePriority_5:
        LD        A, S:?b0
        AND       A, L:0x7f74
        LD        S:?b9, A
//  170     break;
        JRA       L:??ITC_GetSoftwarePriority_8
//  171 
//  172 #if defined(STM8S105) || defined(STM8S005) || defined(STM8AF626x)
//  173   case ITC_IRQ_UART2_TX:
//  174   case ITC_IRQ_UART2_RX:
//  175 #endif /*STM8S105 or STM8AF626x*/
//  176 #if defined(STM8S208) || defined(STM8S207) || defined(STM8S007) || defined(STM8AF52Ax) || \ 
//  177     defined(STM8AF62Ax)
//  178   case ITC_IRQ_UART3_TX:
//  179   case ITC_IRQ_UART3_RX:
//  180   case ITC_IRQ_ADC2:
//  181 #endif /*STM8S208 or STM8S207 or STM8AF52Ax or STM8AF62Ax */
//  182 #if defined(STM8S105) || defined(STM8S005) || defined(STM8S103) || defined(STM8S003) || \ 
//  183     defined(STM8S903) || defined(STM8AF626x) || defined(STM8AF622x)
//  184   case ITC_IRQ_ADC1:
//  185 #endif /*STM8S105, STM8S005, STM8S103 or STM8S003 or STM8S903 or STM8AF626x or STM8AF622x */
//  186 #if defined (STM8S903) || defined (STM8AF622x)
//  187   case ITC_IRQ_TIM6_OVFTRI:
//  188 #else
//  189   case ITC_IRQ_TIM4_OVF:
//  190 #endif /*STM8S903 or STM8AF622x */
//  191     Value = (uint8_t)(ITC->ISPR6 & Mask); /* Read software priority */
??ITC_GetSoftwarePriority_6:
        LD        A, S:?b0
        AND       A, L:0x7f75
        LD        S:?b9, A
//  192     break;
        JRA       L:??ITC_GetSoftwarePriority_8
//  193 
//  194   case ITC_IRQ_EEPROM_EEC:
//  195     Value = (uint8_t)(ITC->ISPR7 & Mask); /* Read software priority */
??ITC_GetSoftwarePriority_7:
        LD        A, S:?b0
        AND       A, L:0x7f76
        LD        S:?b9, A
//  196     break;
//  197 
//  198   default:
//  199     break;
//  200   }
//  201   
//  202   Value >>= (uint8_t)(((uint8_t)IrqNum % 4u) * 2u);
??ITC_GetSoftwarePriority_8:
        LD        A, #0x4
        CLRW      X
        RRWA      X, A
        LD        A, S:?b8
        RLWA      X, A
        DIV       X, A
        MOV       S:?b0, #0x2
        LD        XL, A
        LD        A, S:?b0
        MUL       X, A
        EXG       A, XL
        LD        S:?b0, A
        EXG       A, XL
        LD        A, S:?b9
        CALL      L:?srl8_a_a_b0
        LD        S:?b9, A
//  203   
//  204   return((ITC_PriorityLevel_TypeDef)Value);
        LD        A, S:?b9
        JP        L:?epilogue_w4
//  205 }
//  206 
//  207 /**
//  208   * @brief  Sets the software priority of the specified interrupt source.
//  209   * @note   - The modification of the software priority is only possible when
//  210   *         the interrupts are disabled.
//  211   *         - The normal behavior is to disable the interrupt before calling
//  212   *         this function, and re-enable it after.
//  213   *         - The priority level 0 cannot be set (see product specification
//  214   *         for more details).
//  215   * @param  IrqNum : Specifies the peripheral interrupt source.
//  216   * @param  PriorityValue : Specifies the software priority value to set,
//  217   *         can be a value of @ref  ITC_PriorityLevel_TypeDef .
//  218   * @retval None
//  219 */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  220 void ITC_SetSoftwarePriority(ITC_Irq_TypeDef IrqNum, ITC_PriorityLevel_TypeDef PriorityValue)
//  221 {
ITC_SetSoftwarePriority:
        CALL      L:?push_w4
        LD        S:?b8, A
        MOV       S:?b9, S:?b0
//  222   uint8_t Mask = 0;
        CLR       S:?b0
//  223   uint8_t NewPriority = 0;
        CLR       S:?b1
//  224   
//  225   /* Check function parameters */
//  226   assert_param(IS_ITC_IRQ_OK((uint8_t)IrqNum));
        LD        A, S:?b8
        CP        A, #0x19
        JRC       L:??ITC_SetSoftwarePriority_0
        LDW       X, #0xe2
        LDW       S:?w1, X
        CLRW      X
        LDW       S:?w0, X
        LDW       X, #`?<Constant "C:\\\\Users\\\\lun55\\\\Deskto...">`
        CALL      L:assert_failed
//  227   assert_param(IS_ITC_PRIORITY_OK(PriorityValue));
??ITC_SetSoftwarePriority_0:
        LD        A, S:?b9
        CP        A, #0x2
        JREQ      L:??ITC_SetSoftwarePriority_1
        LD        A, S:?b9
        CP        A, #0x1
        JREQ      L:??ITC_SetSoftwarePriority_1
        TNZ       S:?b9
        JREQ      L:??ITC_SetSoftwarePriority_1
        LD        A, S:?b9
        CP        A, #0x3
        JREQ      L:??ITC_SetSoftwarePriority_1
        LDW       X, #0xe3
        LDW       S:?w1, X
        CLRW      X
        LDW       S:?w0, X
        LDW       X, #`?<Constant "C:\\\\Users\\\\lun55\\\\Deskto...">`
        CALL      L:assert_failed
//  228   
//  229   /* Check if interrupts are disabled */
//  230   assert_param(IS_ITC_INTERRUPTS_DISABLED);
??ITC_SetSoftwarePriority_1:
        CALL      L:ITC_GetSoftIntStatus
        CP        A, #0x28
        JREQ      L:??ITC_SetSoftwarePriority_2
        LDW       X, #0xe6
        LDW       S:?w1, X
        CLRW      X
        LDW       S:?w0, X
        LDW       X, #`?<Constant "C:\\\\Users\\\\lun55\\\\Deskto...">`
        CALL      L:assert_failed
//  231   
//  232   /* Define the mask corresponding to the bits position in the SPR register */
//  233   /* The mask is reversed in order to clear the 2 bits after more easily */
//  234   Mask = (uint8_t)(~(uint8_t)(0x03U << (((uint8_t)IrqNum % 4U) * 2U)));
??ITC_SetSoftwarePriority_2:
        LD        A, #0x4
        CLRW      X
        RRWA      X, A
        LD        A, S:?b8
        RLWA      X, A
        DIV       X, A
        MOV       S:?b0, #0x2
        LD        XL, A
        LD        A, S:?b0
        MUL       X, A
        LD        A, XL
        LDW       X, #0x3
        CALL      L:?sll16_x_x_a
        EXG       A, XL
        LD        S:?b0, A
        EXG       A, XL
        CPL       S:?b0
//  235   
//  236   /* Define the new priority to write */
//  237   NewPriority = (uint8_t)((uint8_t)(PriorityValue) << (((uint8_t)IrqNum % 4U) * 2U));
        LD        A, #0x4
        CLRW      X
        RRWA      X, A
        LD        A, S:?b8
        RLWA      X, A
        DIV       X, A
        MOV       S:?b1, #0x2
        LD        XL, A
        LD        A, S:?b1
        MUL       X, A
        LD        A, XL
        CLRW      X
        EXG       A, XL
        LD        A, S:?b9
        EXG       A, XL
        CALL      L:?sll16_x_x_a
        EXG       A, XL
        LD        S:?b1, A
        EXG       A, XL
//  238   
//  239   switch (IrqNum)
        LD        A, S:?b8
        TNZ       A
        JREQ      L:??ITC_SetSoftwarePriority_3
        DEC       A
        JREQ      L:??ITC_SetSoftwarePriority_3
        DEC       A
        JREQ      L:??ITC_SetSoftwarePriority_3
        DEC       A
        JREQ      L:??ITC_SetSoftwarePriority_3
        DEC       A
        JREQ      L:??ITC_SetSoftwarePriority_4
        DEC       A
        JREQ      L:??ITC_SetSoftwarePriority_4
        DEC       A
        JREQ      L:??ITC_SetSoftwarePriority_4
        DEC       A
        JREQ      L:??ITC_SetSoftwarePriority_4
        SUB       A, #0x3
        JREQ      L:??ITC_SetSoftwarePriority_5
        DEC       A
        JREQ      L:??ITC_SetSoftwarePriority_5
        DEC       A
        JREQ      L:??ITC_SetSoftwarePriority_6
        DEC       A
        JREQ      L:??ITC_SetSoftwarePriority_6
        DEC       A
        JREQ      L:??ITC_SetSoftwarePriority_6
        DEC       A
        JREQ      L:??ITC_SetSoftwarePriority_6
        DEC       A
        JREQ      L:??ITC_SetSoftwarePriority_7
        DEC       A
        JREQ      L:??ITC_SetSoftwarePriority_7
        DEC       A
        JREQ      L:??ITC_SetSoftwarePriority_7
        DEC       A
        JREQ      L:??ITC_SetSoftwarePriority_7
        SUB       A, #0x3
        JREQ      L:??ITC_SetSoftwarePriority_8
        DEC       A
        JREQ      L:??ITC_SetSoftwarePriority_8
        DEC       A
        JREQ      L:??ITC_SetSoftwarePriority_9
        JP        L:?epilogue_w4
//  240   {
//  241   case ITC_IRQ_TLI: /* TLI software priority can be written but has no meaning */
//  242   case ITC_IRQ_AWU:
//  243   case ITC_IRQ_CLK:
//  244   case ITC_IRQ_PORTA:
//  245     ITC->ISPR1 &= Mask;
??ITC_SetSoftwarePriority_3:
        LD        A, S:?b0
        AND       A, L:0x7f70
        LD        L:0x7f70, A
//  246     ITC->ISPR1 |= NewPriority;
        LD        A, S:?b1
        OR        A, L:0x7f70
        LD        L:0x7f70, A
//  247     break;
        JP        L:?epilogue_w4
//  248     
//  249   case ITC_IRQ_PORTB:
//  250   case ITC_IRQ_PORTC:
//  251   case ITC_IRQ_PORTD:
//  252   case ITC_IRQ_PORTE:
//  253     ITC->ISPR2 &= Mask;
??ITC_SetSoftwarePriority_4:
        LD        A, S:?b0
        AND       A, L:0x7f71
        LD        L:0x7f71, A
//  254     ITC->ISPR2 |= NewPriority;
        LD        A, S:?b1
        OR        A, L:0x7f71
        LD        L:0x7f71, A
//  255     break;
        JP        L:?epilogue_w4
//  256     
//  257 #if defined(STM8S208) || defined(STM8AF52Ax)
//  258   case ITC_IRQ_CAN_RX:
//  259   case ITC_IRQ_CAN_TX:
//  260 #endif /*STM8S208 or STM8AF52Ax */
//  261 #if defined(STM8S903) || defined(STM8AF622x)
//  262   case ITC_IRQ_PORTF:
//  263 #endif /*STM8S903 or STM8AF622x */
//  264   case ITC_IRQ_SPI:
//  265   case ITC_IRQ_TIM1_OVF:
//  266     ITC->ISPR3 &= Mask;
??ITC_SetSoftwarePriority_5:
        LD        A, S:?b0
        AND       A, L:0x7f72
        LD        L:0x7f72, A
//  267     ITC->ISPR3 |= NewPriority;
        LD        A, S:?b1
        OR        A, L:0x7f72
        LD        L:0x7f72, A
//  268     break;
        JP        L:?epilogue_w4
//  269     
//  270   case ITC_IRQ_TIM1_CAPCOM:
//  271 #if defined(STM8S903) || defined(STM8AF622x) 
//  272   case ITC_IRQ_TIM5_OVFTRI:
//  273   case ITC_IRQ_TIM5_CAPCOM:
//  274 #else
//  275   case ITC_IRQ_TIM2_OVF:
//  276   case ITC_IRQ_TIM2_CAPCOM:
//  277 #endif /*STM8S903 or STM8AF622x */
//  278   case ITC_IRQ_TIM3_OVF:
//  279     ITC->ISPR4 &= Mask;
??ITC_SetSoftwarePriority_6:
        LD        A, S:?b0
        AND       A, L:0x7f73
        LD        L:0x7f73, A
//  280     ITC->ISPR4 |= NewPriority;
        LD        A, S:?b1
        OR        A, L:0x7f73
        LD        L:0x7f73, A
//  281     break;
        JP        L:?epilogue_w4
//  282     
//  283   case ITC_IRQ_TIM3_CAPCOM:
//  284 #if defined(STM8S208) ||defined(STM8S207) || defined (STM8S007) || defined(STM8S103) || \ 
//  285     defined(STM8S003) ||defined(STM8S903) || defined (STM8AF52Ax) || defined (STM8AF62Ax)
//  286   case ITC_IRQ_UART1_TX:
//  287   case ITC_IRQ_UART1_RX:
//  288 #endif /*STM8S208 or STM8S207 or STM8S007 or STM8S103 or STM8S003 or STM8S903 or STM8AF52Ax or STM8AF62Ax */ 
//  289 #if defined(STM8AF622x)
//  290   case ITC_IRQ_UART4_TX:
//  291   case ITC_IRQ_UART4_RX:
//  292 #endif /*STM8AF622x */
//  293   case ITC_IRQ_I2C:
//  294     ITC->ISPR5 &= Mask;
??ITC_SetSoftwarePriority_7:
        LD        A, S:?b0
        AND       A, L:0x7f74
        LD        L:0x7f74, A
//  295     ITC->ISPR5 |= NewPriority;
        LD        A, S:?b1
        OR        A, L:0x7f74
        LD        L:0x7f74, A
//  296     break;
        JP        L:?epilogue_w4
//  297     
//  298 #if defined(STM8S105) || defined(STM8S005) || defined(STM8AF626x)
//  299   case ITC_IRQ_UART2_TX:
//  300   case ITC_IRQ_UART2_RX:
//  301 #endif /*STM8S105 or STM8AF626x */
//  302     
//  303 #if defined(STM8S208) || defined(STM8S207) || defined(STM8S007) || defined(STM8AF52Ax) || \ 
//  304     defined(STM8AF62Ax)
//  305   case ITC_IRQ_UART3_TX:
//  306   case ITC_IRQ_UART3_RX:
//  307   case ITC_IRQ_ADC2:
//  308 #endif /*STM8S208 or STM8S207 or STM8AF52Ax or STM8AF62Ax */
//  309     
//  310 #if defined(STM8S105) || defined(STM8S005) || defined(STM8S103) || defined(STM8S003) || \ 
//  311     defined(STM8S903) || defined(STM8AF626x) || defined (STM8AF622x)
//  312   case ITC_IRQ_ADC1:
//  313 #endif /*STM8S105, STM8S005, STM8S103 or STM8S003 or STM8S903 or STM8AF626x or STM8AF622x */
//  314     
//  315 #if defined (STM8S903) || defined (STM8AF622x)
//  316   case ITC_IRQ_TIM6_OVFTRI:
//  317 #else
//  318   case ITC_IRQ_TIM4_OVF:
//  319 #endif /* STM8S903 or STM8AF622x */
//  320     ITC->ISPR6 &= Mask;
??ITC_SetSoftwarePriority_8:
        LD        A, S:?b0
        AND       A, L:0x7f75
        LD        L:0x7f75, A
//  321     ITC->ISPR6 |= NewPriority;
        LD        A, S:?b1
        OR        A, L:0x7f75
        LD        L:0x7f75, A
//  322     break;
        JP        L:?epilogue_w4
//  323     
//  324   case ITC_IRQ_EEPROM_EEC:
//  325     ITC->ISPR7 &= Mask;
??ITC_SetSoftwarePriority_9:
        LD        A, S:?b0
        AND       A, L:0x7f76
        LD        L:0x7f76, A
//  326     ITC->ISPR7 |= NewPriority;
        LD        A, S:?b1
        OR        A, L:0x7f76
        LD        L:0x7f76, A
//  327     break;
//  328     
//  329   default:
//  330     break;
//  331   }
//  332 }
        JP        L:?epilogue_w4

        SECTION VREGS:DATA:REORDER:NOROOT(0)

        SECTION `.near.rodata`:CONST:REORDER:NOROOT(0)
`?<Constant "C:\\\\Users\\\\lun55\\\\Deskto...">`:
        DC8 "C:\\Users\\lun55\\Desktop\\J19B_STM8\\Lib\\stm8s_itc.c"

        END
//  333 
//  334 /**
//  335   * @}
//  336   */
//  337   
//  338 /**
//  339   * @}
//  340   */
//  341   
//  342 
//  343 /************************ (C) COPYRIGHT STMicroelectronics *****END OF FILE****/
// 
//  49 bytes in section .near.rodata
// 610 bytes in section .near_func.text
// 
// 610 bytes of CODE  memory
//  49 bytes of CONST memory
//
//Errors: none
//Warnings: 1
