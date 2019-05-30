///////////////////////////////////////////////////////////////////////////////
//                                                                            /
//                                                      30/May/2019  22:02:36 /
// IAR C/C++ Compiler V1.31.1.20058 [Evaluation] for STM8                     /
// Copyright 2010-2012 IAR Systems AB.                                        /
//                                                                            /
//    Source file  =  E:\Desktop\J19B_4E\USR\stm8s_it.c                       /
//    Command line =  E:\Desktop\J19B_4E\USR\stm8s_it.c -e -Ol --no_cse       /
//                    --no_unroll --no_inline --no_code_motion --no_tbaa      /
//                    --no_cross_call --debug --code_model small              /
//                    --data_model medium -o E:\Desktop\J19B_4E\Debug\Obj\    /
//                    --dlib_config "D:\Program Files (x86)\IAR               /
//                    Systems\Embedded Workbench 6.0                          /
//                    Evaluation\stm8\LIB\dlstm8smf.h" -lcN                   /
//                    E:\Desktop\J19B_4E\Debug\List\ -lB                      /
//                    E:\Desktop\J19B_4E\Debug\List\ -I                       /
//                    E:\Desktop\J19B_4E\Lib\inc\ -I                          /
//                    E:\Desktop\J19B_4E\BSP\led\ -I                          /
//                    E:\Desktop\J19B_4E\BSP\uart\ -I                         /
//                    E:\Desktop\J19B_4E\BSP\AD7798\ -I                       /
//                    E:\Desktop\J19B_4E\BSP\spi\ -I E:\Desktop\J19B_4E\USR\  /
//                    -I E:\Desktop\J19B_4E\BSP\delay\ -I                     /
//                    E:\Desktop\J19B_4E\BSP\tim1\ --vregs 16                 /
//    List file    =  E:\Desktop\J19B_4E\Debug\List\stm8s_it.s                /
//                                                                            /
//                                                                            /
///////////////////////////////////////////////////////////////////////////////

        NAME stm8s_it

        EXTERN ?and32_l0_l0_0x
        EXTERN ?b0
        EXTERN ?b8
        EXTERN ?b9
        EXTERN ?fadd32_l0_l0_dc32
        EXTERN ?fcastf32u32_l0_l0
        EXTERN ?fcasts16f32_x_l0
        EXTERN ?fcmpge32_c_l0_dc32
        EXTERN ?fdiv32_l0_l0_dc32
        EXTERN ?fmul32_l0_l0_0x
        EXTERN ?fmul32_l0_l0_dc32
        EXTERN ?load32_0x_l0
        EXTERN ?load32_l0_0x
        EXTERN ?pop_l0
        EXTERN ?pop_l1
        EXTERN ?pop_w4
        EXTERN ?push_l0
        EXTERN ?push_l1
        EXTERN ?push_w4
        EXTERN ?w0
        EXTERN ?w1
        EXTERN ?w4
        EXTERN AD7798_GetRegisterValue
        EXTERN AD7798_Ready
        EXTERN Delay_ms
        EXTERN GPIO_WriteHigh
        EXTERN GPIO_WriteLow
        EXTERN GPIO_WriteReverse
        EXTERN TIM1_ClearITPendingBit
        EXTERN TIM1_ITConfig
        EXTERN UART1_ClearITPendingBit
        EXTERN UART1_GetFlagStatus
        EXTERN UART1_ITConfig
        EXTERN UART1_ReceiveData8
        EXTERN UART1_SendData8

        PUBLIC ADC1_IRQHandler
        PUBLIC AWU_IRQHandler
        PUBLIC CLK_IRQHandler
        PUBLIC EEPROM_EEC_IRQHandler
        PUBLIC EXTI_PORTA_IRQHandler
        PUBLIC EXTI_PORTB_IRQHandler
        PUBLIC EXTI_PORTC_IRQHandler
        PUBLIC EXTI_PORTD_IRQHandler
        PUBLIC EXTI_PORTE_IRQHandler
        PUBLIC I2C_IRQHandler
        PUBLIC SPI_IRQHandler
        PUBLIC TIM1_CAP_COM_IRQHandler
        PUBLIC TIM1_UPD_OVF_TRG_BRK_IRQHandler
        PUBLIC TIM2_CAP_COM_IRQHandler
        PUBLIC TIM2_UPD_OVF_BRK_IRQHandler
        PUBLIC TIM4_UPD_OVF_IRQHandler
        PUBLIC TLI_IRQHandler
        PUBLIC TRAP_IRQHandler
        PUBLIC UART1_RX_IRQHandler
        PUBLIC UART1_TX_IRQHandler
        PUBLIC _interrupt_1
        PUBLIC _interrupt_12
        PUBLIC _interrupt_13
        PUBLIC _interrupt_14
        PUBLIC _interrupt_15
        PUBLIC _interrupt_16
        PUBLIC _interrupt_19
        PUBLIC _interrupt_2
        PUBLIC _interrupt_20
        PUBLIC _interrupt_21
        PUBLIC _interrupt_24
        PUBLIC _interrupt_25
        PUBLIC _interrupt_26
        PUBLIC _interrupt_3
        PUBLIC _interrupt_4
        PUBLIC _interrupt_5
        PUBLIC _interrupt_6
        PUBLIC _interrupt_7
        PUBLIC _interrupt_8
        PUBLIC _interrupt_9
        PUBLIC ad_data
        PUBLIC i
        PUBLIC is_rev_flag
        PUBLIC j
        PUBLIC raw_data
        PUBLIC rev_num
        PUBLIC rx_buf
        PUBLIC sum
        PUBLIC tx_buf

// E:\Desktop\J19B_4E\USR\stm8s_it.c
//    1 /**
//    2   ******************************************************************************
//    3   * @file    stm8s_it.c
//    4   * @author  MCD Application Team
//    5   * @version V2.2.0
//    6   * @date    30-September-2014
//    7   * @brief   Main Interrupt Service Routines.
//    8   *          This file provides template for all peripherals interrupt service 
//    9   *          routine.
//   10    ******************************************************************************
//   11   * @attention
//   12   *
//   13   * <h2><center>&copy; COPYRIGHT 2014 STMicroelectronics</center></h2>
//   14   *
//   15   * Licensed under MCD-ST Liberty SW License Agreement V2, (the "License");
//   16   * You may not use this file except in compliance with the License.
//   17   * You may obtain a copy of the License at:
//   18   *
//   19   *        http://www.st.com/software_license_agreement_liberty_v2
//   20   *
//   21   * Unless required by applicable law or agreed to in writing, software 
//   22   * distributed under the License is distributed on an "AS IS" BASIS, 
//   23   * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
//   24   * See the License for the specific language governing permissions and
//   25   * limitations under the License.
//   26   *
//   27   ******************************************************************************
//   28   */ 
//   29 
//   30 /* Includes ------------------------------------------------------------------*/
//   31 #include "stm8s_it.h"
//   32 #include "main.h"
//   33 #define abs(x) ((x>0)?(x):(-x))
//   34 /** @addtogroup Template_Project
//   35   * @{
//   36   */

        SECTION `.near.bss`:DATA:REORDER:NOROOT(0)
//   37 int is_rev_flag = 0;
is_rev_flag:
        DS8 2

        SECTION `.near.bss`:DATA:REORDER:NOROOT(0)
//   38 int rev_num = 0;
rev_num:
        DS8 2

        SECTION `.near.bss`:DATA:REORDER:NOROOT(0)
//   39 uint8_t rx_buf[10];
rx_buf:
        DS8 10

        SECTION `.near.bss`:DATA:REORDER:NOROOT(0)
//   40 uint8_t tx_buf[10];
tx_buf:
        DS8 10

        SECTION `.near.bss`:DATA:REORDER:NOROOT(0)
//   41 int i = 0;
i:
        DS8 2
//   42 #ifdef _COSMIC_
//   43 /**
//   44   * @brief Dummy Interrupt routine
//   45   * @par Parameters:
//   46   * None
//   47   * @retval
//   48   * None
//   49 */
//   50 INTERRUPT_HANDLER(NonHandledInterrupt, 25)
//   51 {
//   52   /* In order to detect unexpected events during development,
//   53      it is recommended to set a breakpoint on the following instruction.
//   54   */
//   55 }
//   56 #endif /*_COSMIC_*/
//   57 
//   58 /**
//   59   * @brief TRAP Interrupt routine
//   60   * @param  None
//   61   * @retval None
//   62   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//   63 INTERRUPT_HANDLER_TRAP(TRAP_IRQHandler)
//   64 {
//   65   /* In order to detect unexpected events during development,
//   66      it is recommended to set a breakpoint on the following instruction.
//   67   */
//   68 }
TRAP_IRQHandler:
_interrupt_1:
        IRET
//   69 
//   70 /**
//   71   * @brief Top Level Interrupt routine.
//   72   * @param  None
//   73   * @retval None
//   74   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//   75 INTERRUPT_HANDLER(TLI_IRQHandler, 0)
//   76 
//   77 {
//   78   /* In order to detect unexpected events during development,
//   79      it is recommended to set a breakpoint on the following instruction.
//   80   */
//   81 }
TLI_IRQHandler:
_interrupt_2:
        IRET
//   82 
//   83 /**
//   84   * @brief Auto Wake Up Interrupt routine.
//   85   * @param  None
//   86   * @retval None
//   87   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//   88 INTERRUPT_HANDLER(AWU_IRQHandler, 1)
//   89 {
//   90   /* In order to detect unexpected events during development,
//   91      it is recommended to set a breakpoint on the following instruction.
//   92   */
//   93 }
AWU_IRQHandler:
_interrupt_3:
        IRET
//   94 
//   95 /**
//   96   * @brief Clock Controller Interrupt routine.
//   97   * @param  None
//   98   * @retval None
//   99   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  100 INTERRUPT_HANDLER(CLK_IRQHandler, 2)
//  101 {
//  102   /* In order to detect unexpected events during development,
//  103      it is recommended to set a breakpoint on the following instruction.
//  104   */
//  105 }
CLK_IRQHandler:
_interrupt_4:
        IRET
//  106 
//  107 /**
//  108   * @brief External Interrupt PORTA Interrupt routine.
//  109   * @param  None
//  110   * @retval None
//  111   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  112 INTERRUPT_HANDLER(EXTI_PORTA_IRQHandler, 3)
//  113 {
//  114   /* In order to detect unexpected events during development,
//  115      it is recommended to set a breakpoint on the following instruction.
//  116   */
//  117 }
EXTI_PORTA_IRQHandler:
_interrupt_5:
        IRET
//  118 
//  119 /**
//  120   * @brief External Interrupt PORTB Interrupt routine.
//  121   * @param  None
//  122   * @retval None
//  123   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  124 INTERRUPT_HANDLER(EXTI_PORTB_IRQHandler, 4)
//  125 {
//  126   /* In order to detect unexpected events during development,
//  127      it is recommended to set a breakpoint on the following instruction.
//  128   */
//  129 }
EXTI_PORTB_IRQHandler:
_interrupt_6:
        IRET
//  130 
//  131 /**
//  132   * @brief External Interrupt PORTC Interrupt routine.
//  133   * @param  None
//  134   * @retval None
//  135   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  136 INTERRUPT_HANDLER(EXTI_PORTC_IRQHandler, 5)
//  137 {
//  138   /* In order to detect unexpected events during development,
//  139      it is recommended to set a breakpoint on the following instruction.
//  140   */
//  141 }
EXTI_PORTC_IRQHandler:
_interrupt_7:
        IRET
//  142 
//  143 /**
//  144   * @brief External Interrupt PORTD Interrupt routine.
//  145   * @param  None
//  146   * @retval None
//  147   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  148 INTERRUPT_HANDLER(EXTI_PORTD_IRQHandler, 6)
//  149 {
//  150   /* In order to detect unexpected events during development,
//  151      it is recommended to set a breakpoint on the following instruction.
//  152   */
//  153 }
EXTI_PORTD_IRQHandler:
_interrupt_8:
        IRET
//  154 
//  155 /**
//  156   * @brief External Interrupt PORTE Interrupt routine.
//  157   * @param  None
//  158   * @retval None
//  159   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  160 INTERRUPT_HANDLER(EXTI_PORTE_IRQHandler, 7)
//  161 {
//  162   /* In order to detect unexpected events during development,
//  163      it is recommended to set a breakpoint on the following instruction.
//  164   */
//  165 }
EXTI_PORTE_IRQHandler:
_interrupt_9:
        IRET
//  166 
//  167 #if defined (STM8S903) || defined (STM8AF622x) 
//  168 /**
//  169   * @brief External Interrupt PORTF Interrupt routine.
//  170   * @param  None
//  171   * @retval None
//  172   */
//  173  INTERRUPT_HANDLER(EXTI_PORTF_IRQHandler, 8)
//  174  {
//  175   /* In order to detect unexpected events during development,
//  176      it is recommended to set a breakpoint on the following instruction.
//  177   */
//  178  }
//  179 #endif /* (STM8S903) || (STM8AF622x) */
//  180 
//  181 #if defined (STM8S208) || defined (STM8AF52Ax)
//  182 /**
//  183   * @brief CAN RX Interrupt routine.
//  184   * @param  None
//  185   * @retval None
//  186   */
//  187  INTERRUPT_HANDLER(CAN_RX_IRQHandler, 8)
//  188  {
//  189   /* In order to detect unexpected events during development,
//  190      it is recommended to set a breakpoint on the following instruction.
//  191   */
//  192  }
//  193 
//  194 /**
//  195   * @brief CAN TX Interrupt routine.
//  196   * @param  None
//  197   * @retval None
//  198   */
//  199  INTERRUPT_HANDLER(CAN_TX_IRQHandler, 9)
//  200  {
//  201   /* In order to detect unexpected events during development,
//  202      it is recommended to set a breakpoint on the following instruction.
//  203   */
//  204  }
//  205 #endif /* (STM8S208) || (STM8AF52Ax) */
//  206 
//  207 /**
//  208   * @brief SPI Interrupt routine.
//  209   * @param  None
//  210   * @retval None
//  211   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  212 INTERRUPT_HANDLER(SPI_IRQHandler, 10)
//  213 {
//  214   /* In order to detect unexpected events during development,
//  215      it is recommended to set a breakpoint on the following instruction.
//  216   */
//  217 }
SPI_IRQHandler:
_interrupt_12:
        IRET
//  218 
//  219 /**
//  220   * @brief Timer1 Update/Overflow/Trigger/Break Interrupt routine.
//  221   * @param  None
//  222   * @retval None
//  223   */

        SECTION `.near.bss`:DATA:REORDER:NOROOT(0)
//  224   u32 raw_data;
raw_data:
        DS8 4

        SECTION `.near.bss`:DATA:REORDER:NOROOT(0)
//  225   double ad_data;
ad_data:
        DS8 4

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  226 INTERRUPT_HANDLER(TIM1_UPD_OVF_TRG_BRK_IRQHandler, 11)
//  227 {
TIM1_UPD_OVF_TRG_BRK_IRQHandler:
_interrupt_13:
        PUSH      CC
        POP       A
        AND       A, #0xbf
        PUSH      A
        POP       CC
        CALL      L:?push_l0
        CALL      L:?push_l1
        CALL      L:?push_w4
//  228   GPIO_WriteReverse(GPIOB,(GPIO_Pin_TypeDef)GPIO_PIN_5);
        LD        A, #0x20
        LDW       X, #0x5005
        CALL      L:GPIO_WriteReverse
//  229   TIM1_ClearITPendingBit(TIM1_IT_UPDATE);
        LD        A, #0x1
        CALL      L:TIM1_ClearITPendingBit
//  230   
//  231   if (AD7798_Ready())
        CALL      L:AD7798_Ready
        CP        A, #0x0
        JREQ      L:??TIM1_UPD_OVF_TRG_BRK_IRQHandler_0
//  232   {
//  233     raw_data = AD7798_GetRegisterValue(AD7798_REG_DATA,3);
        MOV       S:?b0, #0x3
        LD        A, #0x3
        CALL      L:AD7798_GetRegisterValue
        LDW       X, #raw_data
        CALL      L:?load32_0x_l0
//  234     ad_data = ((raw_data&0xFFFFFF)/8388608.0 - 1.0)*2.49;
        LDW       Y, #raw_data
        CLRW      X
        DECW      X
        LDW       S:?w1, X
        LDW       X, #0xff
        LDW       S:?w0, X
        LDW       X, Y
        CALL      L:?and32_l0_l0_0x
        CALL      L:?fcastf32u32_l0_l0
        CALL      L:?fdiv32_l0_l0_dc32
        DATA
        DC32      0x4b000000
        CODE
        CALL      L:?fadd32_l0_l0_dc32
        DATA
        DC32      0xffffffffbf800000
        CODE
        CALL      L:?fmul32_l0_l0_dc32
        DATA
        DC32      0x401f5c29
        CODE
        LDW       X, #ad_data
        CALL      L:?load32_0x_l0
//  235   }
//  236     ad_data = abs(ad_data);
??TIM1_UPD_OVF_TRG_BRK_IRQHandler_0:
        LDW       X, #ad_data
        CALL      L:?load32_l0_0x
        CALL      L:?fcmpge32_c_l0_dc32
        DATA
        DC32      0x1
        CODE
        JRC       L:??TIM1_UPD_OVF_TRG_BRK_IRQHandler_1
        LDW       X, #ad_data
        CALL      L:?load32_l0_0x
        LDW       X, #ad_data
        CALL      L:?load32_0x_l0
        JRA       L:??TIM1_UPD_OVF_TRG_BRK_IRQHandler_2
??TIM1_UPD_OVF_TRG_BRK_IRQHandler_1:
        LDW       X, #ad_data
        CALL      L:?load32_l0_0x
        BCPL      S:?b0, #0x7
        LDW       X, #ad_data
        CALL      L:?load32_0x_l0
//  237     int sum = 0;
??TIM1_UPD_OVF_TRG_BRK_IRQHandler_2:
        CLR       S:?b9
        CLR       S:?b8
//  238     tx_buf[0] = 0x5A;
        MOV       L:tx_buf, #0x5a
//  239     tx_buf[1] = 0xA5;
        MOV       L:tx_buf + 1, #0xa5
//  240     tx_buf[2] = 0x04;
        MOV       L:tx_buf + 2, #0x4
//  241     tx_buf[3] = 0xAA;
        MOV       L:tx_buf + 3, #0xaa
//  242     tx_buf[4] = 0x02;
        MOV       L:tx_buf + 4, #0x2
//  243     tx_buf[5] = ((uint16_t)(ad_data*1000))>>8 & 0xFF;
        CLRW      X
        LDW       S:?w1, X
        LDW       X, #0x447a
        LDW       S:?w0, X
        LDW       X, #ad_data
        CALL      L:?fmul32_l0_l0_0x
        CALL      L:?fcasts16f32_x_l0
        CLR       A
        RRWA      X, A
        LD        A, XL
        LD        L:tx_buf + 5, A
//  244     tx_buf[6] = ((uint16_t)(ad_data*1000)) & 0xFF;
        CLRW      X
        LDW       S:?w1, X
        LDW       X, #0x447a
        LDW       S:?w0, X
        LDW       X, #ad_data
        CALL      L:?fmul32_l0_l0_0x
        CALL      L:?fcasts16f32_x_l0
        LD        A, XL
        LD        L:tx_buf + 6, A
//  245     sum = tx_buf[5]+tx_buf[6];
        LD        A, L:tx_buf + 6
        CLRW      X
        LD        XL, A
        LDW       S:?w0, X
        LD        A, L:tx_buf + 5
        CLRW      X
        LD        XL, A
        ADDW      X, S:?w0
        LDW       S:?w4, X
//  246     tx_buf[7] = sum&0xFF;
        LD        A, S:?b9
        LD        L:tx_buf + 7, A
//  247     tx_buf[8] = 0xFF;
        MOV       L:tx_buf + 8, #0xff
//  248     tx_buf[9] = 0xFE;
        MOV       L:tx_buf + 9, #0xfe
//  249     i = 0;
        CLRW      X
        LDW       L:i, X
//  250     GPIO_WriteHigh(GPIOA,(GPIO_Pin_TypeDef)GPIO_PIN_1);
        LD        A, #0x2
        LDW       X, #0x5000
        CALL      L:GPIO_WriteHigh
//  251     Delay_ms(100);
        LDW       X, #0x64
        CALL      L:Delay_ms
//  252     UART1_ITConfig(UART1_IT_TXE, ENABLE);
        LD        A, #0x1
        LDW       X, #0x277
        CALL      L:UART1_ITConfig
//  253     TIM1_ITConfig(TIM1_IT_UPDATE, DISABLE);
        CLR       S:?b0
        LD        A, #0x1
        CALL      L:TIM1_ITConfig
//  254 }
        CALL      L:?pop_w4
        CALL      L:?pop_l1
        CALL      L:?pop_l0
        IRET
//  255 
//  256 /**
//  257   * @brief Timer1 Capture/Compare Interrupt routine.
//  258   * @param  None
//  259   * @retval None
//  260   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  261 INTERRUPT_HANDLER(TIM1_CAP_COM_IRQHandler, 12)
//  262 {
//  263   /* In order to detect unexpected events during development,
//  264      it is recommended to set a breakpoint on the following instruction.
//  265   */
//  266 }
TIM1_CAP_COM_IRQHandler:
_interrupt_14:
        IRET
//  267 
//  268 #if defined (STM8S903) || defined (STM8AF622x)
//  269 /**
//  270   * @brief Timer5 Update/Overflow/Break/Trigger Interrupt routine.
//  271   * @param  None
//  272   * @retval None
//  273   */
//  274  INTERRUPT_HANDLER(TIM5_UPD_OVF_BRK_TRG_IRQHandler, 13)
//  275  {
//  276   /* In order to detect unexpected events during development,
//  277      it is recommended to set a breakpoint on the following instruction.
//  278   */
//  279  }
//  280  
//  281 /**
//  282   * @brief Timer5 Capture/Compare Interrupt routine.
//  283   * @param  None
//  284   * @retval None
//  285   */
//  286  INTERRUPT_HANDLER(TIM5_CAP_COM_IRQHandler, 14)
//  287  {
//  288   /* In order to detect unexpected events during development,
//  289      it is recommended to set a breakpoint on the following instruction.
//  290   */
//  291  }
//  292 
//  293 #else /* (STM8S208) || (STM8S207) || (STM8S105) || (STM8S103) || (STM8AF62Ax) || (STM8AF52Ax) || (STM8AF626x) */
//  294 /**
//  295   * @brief Timer2 Update/Overflow/Break Interrupt routine.
//  296   * @param  None
//  297   * @retval None
//  298   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  299  INTERRUPT_HANDLER(TIM2_UPD_OVF_BRK_IRQHandler, 13)
//  300  {
//  301   /* In order to detect unexpected events during development,
//  302      it is recommended to set a breakpoint on the following instruction.
//  303   */
//  304  }
TIM2_UPD_OVF_BRK_IRQHandler:
_interrupt_15:
        IRET
//  305 
//  306 /**
//  307   * @brief Timer2 Capture/Compare Interrupt routine.
//  308   * @param  None
//  309   * @retval None
//  310   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  311  INTERRUPT_HANDLER(TIM2_CAP_COM_IRQHandler, 14)
//  312  {
//  313   /* In order to detect unexpected events during development,
//  314      it is recommended to set a breakpoint on the following instruction.
//  315   */
//  316  }
TIM2_CAP_COM_IRQHandler:
_interrupt_16:
        IRET
//  317 #endif /* (STM8S903) || (STM8AF622x) */
//  318 
//  319 #if defined (STM8S208) || defined(STM8S207) || defined(STM8S007) || defined(STM8S105) || \ 
//  320     defined(STM8S005) ||  defined (STM8AF62Ax) || defined (STM8AF52Ax) || defined (STM8AF626x)
//  321 /**
//  322   * @brief Timer3 Update/Overflow/Break Interrupt routine.
//  323   * @param  None
//  324   * @retval None
//  325   */
//  326  INTERRUPT_HANDLER(TIM3_UPD_OVF_BRK_IRQHandler, 15)
//  327  {
//  328   /* In order to detect unexpected events during development,
//  329      it is recommended to set a breakpoint on the following instruction.
//  330   */
//  331  }
//  332 
//  333 /**
//  334   * @brief Timer3 Capture/Compare Interrupt routine.
//  335   * @param  None
//  336   * @retval None
//  337   */
//  338  INTERRUPT_HANDLER(TIM3_CAP_COM_IRQHandler, 16)
//  339  {
//  340   /* In order to detect unexpected events during development,
//  341      it is recommended to set a breakpoint on the following instruction.
//  342   */
//  343  }
//  344 #endif /* (STM8S208) || (STM8S207) || (STM8S105) || (STM8AF62Ax) || (STM8AF52Ax) || (STM8AF626x) */
//  345 
//  346 #if defined (STM8S208) || defined(STM8S207) || defined(STM8S007) || defined(STM8S103) || \ 
//  347     defined(STM8S003) ||  defined (STM8AF62Ax) || defined (STM8AF52Ax) || defined (STM8S903)
//  348 /**
//  349   * @brief UART1 TX Interrupt routine.
//  350   * @param  None
//  351   * @retval None
//  352   */

        SECTION `.near.bss`:DATA:REORDER:NOROOT(0)
//  353 int j = 0;
j:
        DS8 2

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  354  INTERRUPT_HANDLER(UART1_TX_IRQHandler, 17)
//  355  {
UART1_TX_IRQHandler:
_interrupt_19:
        PUSH      CC
        POP       A
        AND       A, #0xbf
        PUSH      A
        POP       CC
        CALL      L:?push_l0
        CALL      L:?push_l1
//  356    if(j<10) UART1_SendData8(tx_buf[j++]);
        LDW       X, L:j
        CPW       X, #0xa
        JRSGE     L:??UART1_TX_IRQHandler_0
        LDW       Y, L:j
        LDW       X, Y
        INCW      X
        LDW       L:j, X
        LD        A, (L:tx_buf,Y)
        CALL      L:UART1_SendData8
        JRA       L:??UART1_TX_IRQHandler_1
//  357    else 
//  358    {
//  359       GPIO_WriteLow(GPIOA,(GPIO_Pin_TypeDef)GPIO_PIN_1);
??UART1_TX_IRQHandler_0:
        LD        A, #0x2
        LDW       X, #0x5000
        CALL      L:GPIO_WriteLow
//  360       UART1_ITConfig(UART1_IT_TXE, DISABLE);
        CLR       A
        LDW       X, #0x277
        CALL      L:UART1_ITConfig
//  361       j = 0;
        CLRW      X
        LDW       L:j, X
//  362    }  
//  363  }
??UART1_TX_IRQHandler_1:
        CALL      L:?pop_l1
        CALL      L:?pop_l0
        IRET

        SECTION `.near.bss`:DATA:REORDER:NOROOT(0)
//  364 int sum = 0;
sum:
        DS8 2
//  365 
//  366 /**
//  367   * @brief UART1 RX Interrupt routine.
//  368   * @param  None
//  369   * @retval None
//  370   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  371  INTERRUPT_HANDLER(UART1_RX_IRQHandler, 18)
//  372  {
UART1_RX_IRQHandler:
_interrupt_20:
        PUSH      CC
        POP       A
        AND       A, #0xbf
        PUSH      A
        POP       CC
        CALL      L:?push_l0
        CALL      L:?push_l1
        CALL      L:?push_w4
//  373    char RxBuf;
//  374    if(UART1_GetFlagStatus(UART1_FLAG_RXNE) != RESET)
        LDW       X, #0x20
        CALL      L:UART1_GetFlagStatus
        CP        A, #0x0
        JRNE      ??lb_0
        JP        L:??UART1_RX_IRQHandler_0
//  375    {
//  376     UART1_ClearITPendingBit(UART1_IT_RXNE); 
??lb_0:
        LDW       X, #0x255
        CALL      L:UART1_ClearITPendingBit
//  377     RxBuf = UART1_ReceiveData8();
        CALL      L:UART1_ReceiveData8
//  378     if(RxBuf == 0x5A && is_rev_flag == 0)
        CP        A, #0x5a
        JRNE      L:??UART1_RX_IRQHandler_1
        LDW       X, L:is_rev_flag
        TNZW      X
        JRNE      L:??UART1_RX_IRQHandler_1
//  379     {
//  380       is_rev_flag = 1;
        CLRW      X
        INCW      X
        LDW       L:is_rev_flag, X
//  381       return;
        JP        L:??UART1_RX_IRQHandler_2
//  382     }
//  383     else if(is_rev_flag == 1 && RxBuf == 0xA5)
??UART1_RX_IRQHandler_1:
        LDW       X, L:is_rev_flag
        CPW       X, #0x1
        JRNE      L:??UART1_RX_IRQHandler_3
        CP        A, #0xa5
        JRNE      L:??UART1_RX_IRQHandler_3
//  384     {
//  385       is_rev_flag = 2;
        LDW       X, #0x2
        LDW       L:is_rev_flag, X
//  386       return ;
        JP        L:??UART1_RX_IRQHandler_2
//  387     }
//  388     else if(is_rev_flag == 2 && RxBuf == 0x04)
??UART1_RX_IRQHandler_3:
        LDW       X, L:is_rev_flag
        CPW       X, #0x2
        JRNE      L:??UART1_RX_IRQHandler_4
        CP        A, #0x4
        JRNE      L:??UART1_RX_IRQHandler_4
//  389     { 
//  390        sum += RxBuf;
        CLRW      X
        LD        XL, A
        ADDW      X, L:sum
        LDW       L:sum, X
//  391        is_rev_flag = 3;
        LDW       X, #0x3
        LDW       L:is_rev_flag, X
//  392        return;
        JRA       L:??UART1_RX_IRQHandler_2
//  393     }
//  394     else if(is_rev_flag == 3 && RxBuf == 0xAA)
??UART1_RX_IRQHandler_4:
        LDW       X, L:is_rev_flag
        CPW       X, #0x3
        JRNE      L:??UART1_RX_IRQHandler_5
        CP        A, #0xaa
        JRNE      L:??UART1_RX_IRQHandler_5
//  395     {
//  396       sum += RxBuf;
        CLRW      X
        LD        XL, A
        ADDW      X, L:sum
        LDW       L:sum, X
//  397       is_rev_flag = 4;
        LDW       X, #0x4
        LDW       L:is_rev_flag, X
//  398       return;
        JRA       L:??UART1_RX_IRQHandler_2
//  399     }
//  400     else if(is_rev_flag == 4)
??UART1_RX_IRQHandler_5:
        LDW       X, L:is_rev_flag
        CPW       X, #0x4
        JRNE      L:??UART1_RX_IRQHandler_6
//  401     {
//  402       if(sum == RxBuf)
        CLRW      X
        LD        XL, A
        CPW       X, L:sum
        JRNE      L:??UART1_RX_IRQHandler_7
//  403       {
//  404         sum = 0;
        CLRW      X
        LDW       L:sum, X
//  405         is_rev_flag = 0;
        CLRW      X
        LDW       L:is_rev_flag, X
//  406         TIM1_ITConfig(TIM1_IT_UPDATE, ENABLE); 
        MOV       S:?b0, #0x1
        LD        A, #0x1
        CALL      L:TIM1_ITConfig
//  407         return;
        JRA       L:??UART1_RX_IRQHandler_2
//  408       }else
//  409       {
//  410         sum = 0;
??UART1_RX_IRQHandler_7:
        CLRW      X
        LDW       L:sum, X
//  411         is_rev_flag = 0;
        CLRW      X
        LDW       L:is_rev_flag, X
//  412         return;
        JRA       L:??UART1_RX_IRQHandler_2
//  413       }
//  414     }else
//  415     {
//  416       sum = 0;
??UART1_RX_IRQHandler_6:
        CLRW      X
        LDW       L:sum, X
//  417       is_rev_flag = 0;
        CLRW      X
        LDW       L:is_rev_flag, X
//  418       return ;
        JRA       L:??UART1_RX_IRQHandler_2
//  419     }
//  420    }
//  421    if(UART1->SR & UART1_SR_OR)
??UART1_RX_IRQHandler_0:
        BTJF      L:0x5230, #0x3, L:??UART1_RX_IRQHandler_2
//  422    {
//  423       (void)UART1->SR;
        LD        A, L:0x5230
        LD        S:?b8, A
//  424       (void)UART1->DR;
        LD        A, L:0x5231
        LD        S:?b9, A
//  425        UART1_ClearITPendingBit(UART1_IT_OR); 
        LDW       X, #0x235
        CALL      L:UART1_ClearITPendingBit
//  426    }	
//  427     return ;
??UART1_RX_IRQHandler_2:
        CALL      L:?pop_w4
        CALL      L:?pop_l1
        CALL      L:?pop_l0
        IRET
//  428  }
//  429 #endif /* (STM8S208) || (STM8S207) || (STM8S103) || (STM8S903) || (STM8AF62Ax) || (STM8AF52Ax) */
//  430 
//  431 #if defined(STM8AF622x)
//  432 /**
//  433   * @brief UART4 TX Interrupt routine.
//  434   * @param  None
//  435   * @retval None
//  436   */
//  437  INTERRUPT_HANDLER(UART4_TX_IRQHandler, 17)
//  438  {
//  439     /* In order to detect unexpected events during development,
//  440        it is recommended to set a breakpoint on the following instruction.
//  441     */
//  442  }
//  443 
//  444 /**
//  445   * @brief UART4 RX Interrupt routine.
//  446   * @param  None
//  447   * @retval None
//  448   */
//  449  INTERRUPT_HANDLER(UART4_RX_IRQHandler, 18)
//  450  {
//  451     /* In order to detect unexpected events during development,
//  452        it is recommended to set a breakpoint on the following instruction.
//  453     */
//  454  }
//  455 #endif /* (STM8AF622x) */
//  456 
//  457 /**
//  458   * @brief I2C Interrupt routine.
//  459   * @param  None
//  460   * @retval None
//  461   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  462 INTERRUPT_HANDLER(I2C_IRQHandler, 19)
//  463 {
//  464   /* In order to detect unexpected events during development,
//  465      it is recommended to set a breakpoint on the following instruction.
//  466   */
//  467 }
I2C_IRQHandler:
_interrupt_21:
        IRET
//  468 
//  469 #if defined(STM8S105) || defined(STM8S005) ||  defined (STM8AF626x)
//  470 /**
//  471   * @brief UART2 TX interrupt routine.
//  472   * @param  None
//  473   * @retval None
//  474   */
//  475  INTERRUPT_HANDLER(UART2_TX_IRQHandler, 20)
//  476  {
//  477     /* In order to detect unexpected events during development,
//  478        it is recommended to set a breakpoint on the following instruction.
//  479     */
//  480  }
//  481 
//  482 /**
//  483   * @brief UART2 RX interrupt routine.
//  484   * @param  None
//  485   * @retval None
//  486   */
//  487  INTERRUPT_HANDLER(UART2_RX_IRQHandler, 21)
//  488  {
//  489     /* In order to detect unexpected events during development,
//  490        it is recommended to set a breakpoint on the following instruction.
//  491     */
//  492  }
//  493 #endif /* (STM8S105) || (STM8AF626x) */
//  494 
//  495 #if defined(STM8S207) || defined(STM8S007) || defined(STM8S208) || defined (STM8AF52Ax) || defined (STM8AF62Ax)
//  496 /**
//  497   * @brief UART3 TX interrupt routine.
//  498   * @param  None
//  499   * @retval None
//  500   */
//  501  INTERRUPT_HANDLER(UART3_TX_IRQHandler, 20)
//  502  {
//  503     /* In order to detect unexpected events during development,
//  504        it is recommended to set a breakpoint on the following instruction.
//  505     */
//  506  }
//  507 
//  508 /**
//  509   * @brief UART3 RX interrupt routine.
//  510   * @param  None
//  511   * @retval None
//  512   */
//  513  INTERRUPT_HANDLER(UART3_RX_IRQHandler, 21)
//  514  {
//  515     /* In order to detect unexpected events during development,
//  516        it is recommended to set a breakpoint on the following instruction.
//  517     */
//  518  }
//  519 #endif /* (STM8S208) || (STM8S207) || (STM8AF52Ax) || (STM8AF62Ax) */
//  520 
//  521 #if defined(STM8S207) || defined(STM8S007) || defined(STM8S208) || defined (STM8AF52Ax) || defined (STM8AF62Ax)
//  522 /**
//  523   * @brief ADC2 interrupt routine.
//  524   * @param  None
//  525   * @retval None
//  526   */
//  527  INTERRUPT_HANDLER(ADC2_IRQHandler, 22)
//  528  {
//  529     /* In order to detect unexpected events during development,
//  530        it is recommended to set a breakpoint on the following instruction.
//  531     */
//  532  }
//  533 #else /* STM8S105 or STM8S103 or STM8S903 or STM8AF626x or STM8AF622x */
//  534 /**
//  535   * @brief ADC1 interrupt routine.
//  536   * @par Parameters:
//  537   * None
//  538   * @retval 
//  539   * None
//  540   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  541  INTERRUPT_HANDLER(ADC1_IRQHandler, 22)
//  542  {
//  543     /* In order to detect unexpected events during development,
//  544        it is recommended to set a breakpoint on the following instruction.
//  545     */
//  546  }
ADC1_IRQHandler:
_interrupt_24:
        IRET
//  547 #endif /* (STM8S208) || (STM8S207) || (STM8AF52Ax) || (STM8AF62Ax) */
//  548 
//  549 #if defined (STM8S903) || defined (STM8AF622x)
//  550 /**
//  551   * @brief Timer6 Update/Overflow/Trigger Interrupt routine.
//  552   * @param  None
//  553   * @retval None
//  554   */
//  555 INTERRUPT_HANDLER(TIM6_UPD_OVF_TRG_IRQHandler, 23)
//  556  {
//  557   /* In order to detect unexpected events during development,
//  558      it is recommended to set a breakpoint on the following instruction.
//  559   */
//  560  }
//  561 #else /* STM8S208 or STM8S207 or STM8S105 or STM8S103 or STM8AF52Ax or STM8AF62Ax or STM8AF626x */
//  562 /**
//  563   * @brief Timer4 Update/Overflow Interrupt routine.
//  564   * @param  None
//  565   * @retval None
//  566   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  567  INTERRUPT_HANDLER(TIM4_UPD_OVF_IRQHandler, 23)
//  568  {
//  569   /* In order to detect unexpected events during development,
//  570      it is recommended to set a breakpoint on the following instruction.
//  571   */
//  572  }
TIM4_UPD_OVF_IRQHandler:
_interrupt_25:
        IRET
//  573 #endif /* (STM8S903) || (STM8AF622x)*/
//  574 
//  575 /**
//  576   * @brief Eeprom EEC Interrupt routine.
//  577   * @param  None
//  578   * @retval None
//  579   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  580 INTERRUPT_HANDLER(EEPROM_EEC_IRQHandler, 24)
//  581 {
//  582   /* In order to detect unexpected events during development,
//  583      it is recommended to set a breakpoint on the following instruction.
//  584   */
//  585 }
EEPROM_EEC_IRQHandler:
_interrupt_26:
        IRET

        SECTION VREGS:DATA:REORDER:NOROOT(0)

        END
//  586 
//  587 /**
//  588   * @}
//  589   */
//  590 
//  591 
//  592 /************************ (C) COPYRIGHT STMicroelectronics *****END OF FILE****/
// 
//  38 bytes in section .near.bss
// 584 bytes in section .near_func.text
// 
// 584 bytes of CODE memory
//  38 bytes of DATA memory
//
//Errors: none
//Warnings: none
