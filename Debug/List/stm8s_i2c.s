///////////////////////////////////////////////////////////////////////////////
//                                                                            /
//                                                      11/Mar/2019  20:52:10 /
// IAR C/C++ Compiler V1.31.1.20058 [Evaluation] for STM8                     /
// Copyright 2010-2012 IAR Systems AB.                                        /
//                                                                            /
//    Source file  =  C:\Users\lun55\Desktop\J19B_STM8\Lib\stm8s_i2c.c        /
//    Command line =  C:\Users\lun55\Desktop\J19B_STM8\Lib\stm8s_i2c.c -e     /
//                    -Ol --no_cse --no_unroll --no_inline --no_code_motion   /
//                    --no_tbaa --no_cross_call --debug --code_model small    /
//                    --data_model medium -o C:\Users\lun55\Desktop\J19B_STM8 /
//                    \Debug\Obj\ --dlib_config "D:\Program Files (x86)\IAR   /
//                    Systems\Embedded Workbench 6.0                          /
//                    Evaluation\stm8\LIB\dlstm8smf.h" -lcN                   /
//                    C:\Users\lun55\Desktop\J19B_STM8\Debug\List\ -lB        /
//                    C:\Users\lun55\Desktop\J19B_STM8\Debug\List\ --vregs 16 /
//    List file    =  C:\Users\lun55\Desktop\J19B_STM8\Debug\List\stm8s_i2c.s /
//                                                                            /
//                                                                            /
///////////////////////////////////////////////////////////////////////////////

        NAME stm8s_i2c

        EXTERN ?b0
        EXTERN ?b1
        EXTERN ?b10
        EXTERN ?b12
        EXTERN ?b13
        EXTERN ?b14
        EXTERN ?b15
        EXTERN ?b3
        EXTERN ?b4
        EXTERN ?b5
        EXTERN ?b6
        EXTERN ?b8
        EXTERN ?b9
        EXTERN ?epilogue_l2_l3
        EXTERN ?epilogue_w4
        EXTERN ?mov_l0_l2
        EXTERN ?mov_l1_l2
        EXTERN ?mov_l2_l0
        EXTERN ?mul16_x_x_w0
        EXTERN ?mul32_l0_l0_dl
        EXTERN ?push_l2
        EXTERN ?push_l3
        EXTERN ?push_w4
        EXTERN ?sdiv16_x_x_y
        EXTERN ?sll32_l0_l0_db
        EXTERN ?udiv32_l0_l0_l1
        EXTERN ?w0
        EXTERN ?w1
        EXTERN ?w4
        EXTERN ?w5
        EXTERN assert_failed

        PUBLIC I2C_AcknowledgeConfig
        PUBLIC I2C_CheckEvent
        PUBLIC I2C_ClearFlag
        PUBLIC I2C_ClearITPendingBit
        PUBLIC I2C_Cmd
        PUBLIC I2C_DeInit
        PUBLIC I2C_FastModeDutyCycleConfig
        PUBLIC I2C_GeneralCallCmd
        PUBLIC I2C_GenerateSTART
        PUBLIC I2C_GenerateSTOP
        PUBLIC I2C_GetFlagStatus
        PUBLIC I2C_GetITStatus
        PUBLIC I2C_GetLastEvent
        PUBLIC I2C_ITConfig
        PUBLIC I2C_Init
        PUBLIC I2C_ReceiveData
        PUBLIC I2C_Send7bitAddress
        PUBLIC I2C_SendData
        PUBLIC I2C_SoftwareResetCmd
        PUBLIC I2C_StretchClockCmd

// C:\Users\lun55\Desktop\J19B_STM8\Lib\stm8s_i2c.c
//    1 /**
//    2   ******************************************************************************
//    3   * @file    stm8s_i2c.c
//    4   * @author  MCD Application Team
//    5   * @version V2.2.0
//    6   * @date    30-September-2014
//    7   * @brief   This file contains all the functions for the I2C peripheral.
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
//   29 #include "stm8s_i2c.h"
//   30 
//   31 /** @addtogroup STM8S_StdPeriph_Driver
//   32   * @{
//   33   */
//   34 /* Private typedef -----------------------------------------------------------*/
//   35 
//   36 /** @defgroup I2C_Private_Defines
//   37   * @{
//   38   */
//   39 /* I2C register mask */
//   40 #define REGISTER_Mask               ((uint16_t)0x3000)
//   41 #define REGISTER_SR1_Index          ((uint16_t)0x0100)
//   42 #define REGISTER_SR2_Index          ((uint16_t)0x0200)
//   43 /* I2C Interrupt Enable mask */
//   44 #define ITEN_Mask                   ((uint16_t)0x0700)
//   45 /* I2C FLAG mask */
//   46 #define FLAG_Mask                   ((uint16_t)0x00FF)
//   47 /**
//   48   * @}
//   49   */
//   50 
//   51 /* Private macro -------------------------------------------------------------*/
//   52 /* Private variables ---------------------------------------------------------*/
//   53 /* Private function prototypes -----------------------------------------------*/
//   54 /* Private functions ---------------------------------------------------------*/
//   55 
//   56 
//   57 /**
//   58   * @addtogroup I2C_Public_Functions
//   59   * @{
//   60   */
//   61 
//   62 /**
//   63   * @brief  Deinitializes the I2C peripheral registers to their default reset values.
//   64   * @param  None
//   65   * @retval None
//   66   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//   67 void I2C_DeInit(void)
//   68 {
//   69   I2C->CR1 = I2C_CR1_RESET_VALUE;
I2C_DeInit:
        MOV       L:0x5210, #0x0
//   70   I2C->CR2 = I2C_CR2_RESET_VALUE;
        MOV       L:0x5211, #0x0
//   71   I2C->FREQR = I2C_FREQR_RESET_VALUE;
        MOV       L:0x5212, #0x0
//   72   I2C->OARL = I2C_OARL_RESET_VALUE;
        MOV       L:0x5213, #0x0
//   73   I2C->OARH = I2C_OARH_RESET_VALUE;
        MOV       L:0x5214, #0x0
//   74   I2C->ITR = I2C_ITR_RESET_VALUE;
        MOV       L:0x521a, #0x0
//   75   I2C->CCRL = I2C_CCRL_RESET_VALUE;
        MOV       L:0x521b, #0x0
//   76   I2C->CCRH = I2C_CCRH_RESET_VALUE;
        MOV       L:0x521c, #0x0
//   77   I2C->TRISER = I2C_TRISER_RESET_VALUE;
        MOV       L:0x521d, #0x2
//   78 }
        RET
//   79 
//   80 /**
//   81   * @brief  Initializes the I2C according to the specified parameters in standard
//   82   *         or fast mode.
//   83   * @param  OutputClockFrequencyHz : Specifies the output clock frequency in Hz.
//   84   * @param  OwnAddress : Specifies the own address.
//   85   * @param  I2C_DutyCycle : Specifies the duty cycle to apply in fast mode.
//   86   *         This parameter can be any of the  @ref I2C_DutyCycle_TypeDef enumeration.
//   87   * @note   This parameter don't have impact when the OutputClockFrequency lower
//   88   *         than 100KHz.
//   89   * @param  Ack : Specifies the acknowledge mode to apply.
//   90   *         This parameter can be any of the  @ref I2C_Ack_TypeDef enumeration.
//   91   * @param  AddMode : Specifies the acknowledge address to apply.
//   92   *         This parameter can be any of the  @ref I2C_AddMode_TypeDef enumeration.
//   93   * @param  InputClockFrequencyMHz : Specifies the input clock frequency in MHz.
//   94   * @retval None
//   95   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//   96 void I2C_Init(uint32_t OutputClockFrequencyHz, uint16_t OwnAddress, 
//   97               I2C_DutyCycle_TypeDef I2C_DutyCycle, I2C_Ack_TypeDef Ack, 
//   98               I2C_AddMode_TypeDef AddMode, uint8_t InputClockFrequencyMHz )
//   99 {
I2C_Init:
        CALL      L:?push_l2
        CALL      L:?push_l3
        PUSHW     X
        PUSH      S:?b5
        CALL      L:?mov_l2_l0
        LD        S:?b15, A
        MOV       S:?b14, S:?b4
        MOV       S:?b12, S:?b6
//  100   uint16_t result = 0x0004;
        LDW       X, #0x4
        LDW       S:?w1, X
//  101   uint16_t tmpval = 0;
        CLRW      X
//  102   uint8_t tmpccrh = 0;
        CLR       S:?b13
//  103 
//  104   /* Check the parameters */
//  105   assert_param(IS_I2C_ACK_OK(Ack));
        TNZ       S:?b14
        JREQ      L:??I2C_Init_0
        LD        A, S:?b14
        CP        A, #0x1
        JREQ      L:??I2C_Init_0
        LD        A, S:?b14
        CP        A, #0x2
        JREQ      L:??I2C_Init_0
        LDW       X, #0x69
        LDW       S:?w1, X
        CLRW      X
        LDW       S:?w0, X
        LDW       X, #`?<Constant "C:\\\\Users\\\\lun55\\\\Deskto...">`
        CALL      L:assert_failed
//  106   assert_param(IS_I2C_ADDMODE_OK(AddMode));
??I2C_Init_0:
        TNZ       (0x1,SP)
        JREQ      L:??I2C_Init_1
        LD        A, (0x1,SP)
        CP        A, #0x80
        JREQ      L:??I2C_Init_1
        LDW       X, #0x6a
        LDW       S:?w1, X
        CLRW      X
        LDW       S:?w0, X
        LDW       X, #`?<Constant "C:\\\\Users\\\\lun55\\\\Deskto...">`
        CALL      L:assert_failed
//  107   assert_param(IS_I2C_OWN_ADDRESS_OK(OwnAddress));
??I2C_Init_1:
        LDW       X, (0x2,SP)
        CPW       X, #0x400
        JRC       L:??I2C_Init_2
        LDW       X, #0x6b
        LDW       S:?w1, X
        CLRW      X
        LDW       S:?w0, X
        LDW       X, #`?<Constant "C:\\\\Users\\\\lun55\\\\Deskto...">`
        CALL      L:assert_failed
//  108   assert_param(IS_I2C_DUTYCYCLE_OK(I2C_DutyCycle));  
??I2C_Init_2:
        TNZ       S:?b15
        JREQ      L:??I2C_Init_3
        LD        A, S:?b15
        CP        A, #0x40
        JREQ      L:??I2C_Init_3
        LDW       X, #0x6c
        LDW       S:?w1, X
        CLRW      X
        LDW       S:?w0, X
        LDW       X, #`?<Constant "C:\\\\Users\\\\lun55\\\\Deskto...">`
        CALL      L:assert_failed
//  109   assert_param(IS_I2C_INPUT_CLOCK_FREQ_OK(InputClockFrequencyMHz));
??I2C_Init_3:
        LD        A, S:?b12
        SUB       A, #0x1
        CP        A, #0x10
        JRC       L:??I2C_Init_4
        LDW       X, #0x6d
        LDW       S:?w1, X
        CLRW      X
        LDW       S:?w0, X
        LDW       X, #`?<Constant "C:\\\\Users\\\\lun55\\\\Deskto...">`
        CALL      L:assert_failed
//  110   assert_param(IS_I2C_OUTPUT_CLOCK_FREQ_OK(OutputClockFrequencyHz));
??I2C_Init_4:
        LDW       X, S:?w4
        CPW       X, #0x0
        JRNE      L:??I2C_Init_5
        LDW       X, S:?w5
        CPW       X, #0x0
??I2C_Init_5:
        JREQ      L:??I2C_Init_6
        LDW       X, S:?w4
        CPW       X, #0x6
        JRNE      L:??I2C_Init_7
        LDW       X, S:?w5
        CPW       X, #0x1a81
??I2C_Init_7:
        JRC       L:??I2C_Init_8
??I2C_Init_6:
        LDW       X, #0x6e
        LDW       S:?w1, X
        CLRW      X
        LDW       S:?w0, X
        LDW       X, #`?<Constant "C:\\\\Users\\\\lun55\\\\Deskto...">`
        CALL      L:assert_failed
//  111 
//  112 
//  113   /*------------------------- I2C FREQ Configuration ------------------------*/
//  114   /* Clear frequency bits */
//  115   I2C->FREQR &= (uint8_t)(~I2C_FREQR_FREQ);
??I2C_Init_8:
        LD        A, L:0x5212
        AND       A, #0xc0
        LD        L:0x5212, A
//  116   /* Write new value */
//  117   I2C->FREQR |= InputClockFrequencyMHz;
        LD        A, S:?b12
        OR        A, L:0x5212
        LD        L:0x5212, A
//  118 
//  119   /*--------------------------- I2C CCR Configuration ------------------------*/
//  120   /* Disable I2C to configure TRISER */
//  121   I2C->CR1 &= (uint8_t)(~I2C_CR1_PE);
        BRES      L:0x5210, #0x0
//  122 
//  123   /* Clear CCRH & CCRL */
//  124   I2C->CCRH &= (uint8_t)(~(I2C_CCRH_FS | I2C_CCRH_DUTY | I2C_CCRH_CCR));
        LD        A, L:0x521c
        AND       A, #0x30
        LD        L:0x521c, A
//  125   I2C->CCRL &= (uint8_t)(~I2C_CCRL_CCR);
        LD        A, L:0x521b
        MOV       L:0x521b, #0x0
//  126 
//  127   /* Detect Fast or Standard mode depending on the Output clock frequency selected */
//  128   if (OutputClockFrequencyHz > I2C_MAX_STANDARD_FREQ) /* FAST MODE */
        LDW       X, S:?w4
        CPW       X, #0x1
        JRNE      L:??I2C_Init_9
        LDW       X, S:?w5
        CPW       X, #0x86a1
??I2C_Init_9:
        JRC       L:??I2C_Init_10
//  129   {
//  130     /* Set F/S bit for fast mode */
//  131     tmpccrh = I2C_CCRH_FS;
        MOV       S:?b13, #0x80
//  132 
//  133     if (I2C_DutyCycle == I2C_DUTYCYCLE_2)
        TNZ       S:?b15
        JRNE      L:??I2C_Init_11
//  134     {
//  135       /* Fast mode speed calculate: Tlow/Thigh = 2 */
//  136       result = (uint16_t) ((InputClockFrequencyMHz * 1000000) / (OutputClockFrequencyHz * 3));
        CALL      L:?mov_l0_l2
        CALL      L:?mul32_l0_l0_dl
        DATA
        DC32      0x3
        CODE
        CALL      L:?mov_l2_l0
        CLRW      X
        EXG       A, XL
        LD        A, S:?b12
        EXG       A, XL
        LDW       S:?w1, X
        CLRW      X
        LDW       S:?w0, X
        CALL      L:?mul32_l0_l0_dl
        DATA
        DC32      0xf4240
        CODE
        CALL      L:?mov_l1_l2
        CALL      L:?udiv32_l0_l0_l1
        JRA       L:??I2C_Init_12
//  137     }
//  138     else /* I2C_DUTYCYCLE_16_9 */
//  139     {
//  140       /* Fast mode speed calculate: Tlow/Thigh = 16/9 */
//  141       result = (uint16_t) ((InputClockFrequencyMHz * 1000000) / (OutputClockFrequencyHz * 25));
??I2C_Init_11:
        CALL      L:?mov_l0_l2
        CALL      L:?mul32_l0_l0_dl
        DATA
        DC32      0x19
        CODE
        CALL      L:?mov_l2_l0
        CLRW      X
        EXG       A, XL
        LD        A, S:?b12
        EXG       A, XL
        LDW       S:?w1, X
        CLRW      X
        LDW       S:?w0, X
        CALL      L:?mul32_l0_l0_dl
        DATA
        DC32      0xf4240
        CODE
        CALL      L:?mov_l1_l2
        CALL      L:?udiv32_l0_l0_l1
//  142       /* Set DUTY bit */
//  143       tmpccrh |= I2C_CCRH_DUTY;
        LD        A, S:?b13
        OR        A, #0x40
        LD        S:?b13, A
//  144     }
//  145 
//  146     /* Verify and correct CCR value if below minimum value */
//  147     if (result < (uint16_t)0x01)
??I2C_Init_12:
        LDW       X, S:?w1
        TNZW      X
        JRNE      L:??I2C_Init_13
//  148     {
//  149       /* Set the minimum allowed value */
//  150       result = (uint16_t)0x0001;
        CLRW      X
        INCW      X
        LDW       S:?w1, X
//  151     }
//  152 
//  153     /* Set Maximum Rise Time: 300ns max in Fast Mode
//  154     = [300ns/(1/InputClockFrequencyMHz.10e6)]+1
//  155     = [(InputClockFrequencyMHz * 3)/10]+1 */
//  156     tmpval = ((InputClockFrequencyMHz * 3) / 10) + 1;
??I2C_Init_13:
        CLRW      X
        EXG       A, XL
        LD        A, S:?b12
        EXG       A, XL
        LDW       Y, X
        LDW       X, #0x3
        LDW       S:?w0, X
        LDW       X, Y
        CALL      L:?mul16_x_x_w0
        LDW       Y, #0xa
        CALL      L:?sdiv16_x_x_y
        INCW      X
//  157     I2C->TRISER = (uint8_t)tmpval;
        LD        A, XL
        LD        L:0x521d, A
        JRA       L:??I2C_Init_14
//  158 
//  159   }
//  160   else /* STANDARD MODE */
//  161   {
//  162 
//  163     /* Calculate standard mode speed */
//  164     result = (uint16_t)((InputClockFrequencyMHz * 1000000) / (OutputClockFrequencyHz << (uint8_t)1));
??I2C_Init_10:
        CALL      L:?mov_l0_l2
        CALL      L:?sll32_l0_l0_db
        DATA
        DC8       0x1
        CODE
        CALL      L:?mov_l2_l0
        CLRW      X
        EXG       A, XL
        LD        A, S:?b12
        EXG       A, XL
        LDW       S:?w1, X
        CLRW      X
        LDW       S:?w0, X
        CALL      L:?mul32_l0_l0_dl
        DATA
        DC32      0xf4240
        CODE
        CALL      L:?mov_l1_l2
        CALL      L:?udiv32_l0_l0_l1
//  165 
//  166     /* Verify and correct CCR value if below minimum value */
//  167     if (result < (uint16_t)0x0004)
        LDW       X, S:?w1
        CPW       X, #0x4
        JRNC      L:??I2C_Init_15
//  168     {
//  169       /* Set the minimum allowed value */
//  170       result = (uint16_t)0x0004;
        LDW       X, #0x4
        LDW       S:?w1, X
//  171     }
//  172 
//  173     /* Set Maximum Rise Time: 1000ns max in Standard Mode
//  174     = [1000ns/(1/InputClockFrequencyMHz.10e6)]+1
//  175     = InputClockFrequencyMHz+1 */
//  176     I2C->TRISER = (uint8_t)(InputClockFrequencyMHz + (uint8_t)1);
??I2C_Init_15:
        LD        A, S:?b12
        ADD       A, #0x1
        LD        L:0x521d, A
//  177 
//  178   }
//  179 
//  180   /* Write CCR with new calculated value */
//  181   I2C->CCRL = (uint8_t)result;
??I2C_Init_14:
        LD        A, S:?b3
        LD        L:0x521b, A
//  182   I2C->CCRH = (uint8_t)((uint8_t)((uint8_t)(result >> 8) & I2C_CCRH_CCR) | tmpccrh);
        LDW       X, S:?w1
        CLR       A
        RRWA      X, A
        LD        A, XL
        AND       A, #0xf
        OR        A, S:?b13
        LD        L:0x521c, A
//  183 
//  184   /* Enable I2C */
//  185   I2C->CR1 |= I2C_CR1_PE;
        BSET      L:0x5210, #0x0
//  186 
//  187   /* Configure I2C acknowledgement */
//  188   I2C_AcknowledgeConfig(Ack);
        LD        A, S:?b14
        CALL      L:I2C_AcknowledgeConfig
//  189 
//  190   /*--------------------------- I2C OAR Configuration ------------------------*/
//  191   I2C->OARL = (uint8_t)(OwnAddress);
        LD        A, (0x3,SP)
        LD        L:0x5213, A
//  192   I2C->OARH = (uint8_t)((uint8_t)(AddMode | I2C_OARH_ADDCONF) |
//  193                    (uint8_t)((OwnAddress & (uint16_t)0x0300) >> (uint8_t)7));
        LDW       X, (0x2,SP)
        SLLW      X
        CLR       A
        RLC       A
        RRWA      X, A
        LD        A, XL
        AND       A, #0x6
        PUSH      A
        LD        A, (0x2,SP)
        OR        A, #0x40
        LD        S:?b1, A
        POP       A
        OR        A, S:?b1
        LD        L:0x5214, A
//  194 }
        ADD       SP, #0x3
        JP        L:?epilogue_l2_l3
//  195 
//  196 /**
//  197   * @brief  Enables or disables the I2C peripheral.
//  198   * @param  NewState : Indicate the new I2C peripheral state.
//  199   *         This parameter can be any of the @ref FunctionalState enumeration.
//  200   * @retval None
//  201   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  202 void I2C_Cmd(FunctionalState NewState)
//  203 {
I2C_Cmd:
        PUSH      S:?b8
        LD        S:?b8, A
//  204   /* Check function parameters */
//  205   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
        TNZ       S:?b8
        JREQ      L:??I2C_Cmd_0
        LD        A, S:?b8
        CP        A, #0x1
        JREQ      L:??I2C_Cmd_0
        LDW       X, #0xcd
        LDW       S:?w1, X
        CLRW      X
        LDW       S:?w0, X
        LDW       X, #`?<Constant "C:\\\\Users\\\\lun55\\\\Deskto...">`
        CALL      L:assert_failed
//  206 
//  207   if (NewState != DISABLE)
??I2C_Cmd_0:
        TNZ       S:?b8
        JREQ      L:??I2C_Cmd_1
//  208   {
//  209     /* Enable I2C peripheral */
//  210     I2C->CR1 |= I2C_CR1_PE;
        BSET      L:0x5210, #0x0
        JRA       L:??I2C_Cmd_2
//  211   }
//  212   else /* NewState == DISABLE */
//  213   {
//  214     /* Disable I2C peripheral */
//  215     I2C->CR1 &= (uint8_t)(~I2C_CR1_PE);
??I2C_Cmd_1:
        BRES      L:0x5210, #0x0
//  216   }
//  217 }
??I2C_Cmd_2:
        POP       S:?b8
        RET
//  218 
//  219 /**
//  220   * @brief  Enables or disables the I2C General Call feature.
//  221   * @param  NewState : State of the General Call feature.
//  222   *         This parameter can be any of the @ref FunctionalState enumeration.
//  223   * @retval None
//  224   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  225 void I2C_GeneralCallCmd(FunctionalState NewState)
//  226 {
I2C_GeneralCallCmd:
        PUSH      S:?b8
        LD        S:?b8, A
//  227   /* Check function parameters */
//  228   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
        TNZ       S:?b8
        JREQ      L:??I2C_GeneralCallCmd_0
        LD        A, S:?b8
        CP        A, #0x1
        JREQ      L:??I2C_GeneralCallCmd_0
        LDW       X, #0xe4
        LDW       S:?w1, X
        CLRW      X
        LDW       S:?w0, X
        LDW       X, #`?<Constant "C:\\\\Users\\\\lun55\\\\Deskto...">`
        CALL      L:assert_failed
//  229 
//  230   if (NewState != DISABLE)
??I2C_GeneralCallCmd_0:
        TNZ       S:?b8
        JREQ      L:??I2C_GeneralCallCmd_1
//  231   {
//  232     /* Enable General Call */
//  233     I2C->CR1 |= I2C_CR1_ENGC;
        BSET      L:0x5210, #0x6
        JRA       L:??I2C_GeneralCallCmd_2
//  234   }
//  235   else /* NewState == DISABLE */
//  236   {
//  237     /* Disable General Call */
//  238     I2C->CR1 &= (uint8_t)(~I2C_CR1_ENGC);
??I2C_GeneralCallCmd_1:
        BRES      L:0x5210, #0x6
//  239   }
//  240 }
??I2C_GeneralCallCmd_2:
        POP       S:?b8
        RET
//  241 
//  242 /**
//  243   * @brief  Generates I2C communication START condition.
//  244   * @note   CCR must be programmed, i.e. I2C_Init function must have been called
//  245   *         with a valid I2C_ClockSpeed
//  246   * @param  NewState : Enable or disable the start condition.
//  247   *         This parameter can be any of the @ref FunctionalState enumeration.
//  248   * @retval None
//  249   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  250 void I2C_GenerateSTART(FunctionalState NewState)
//  251 {
I2C_GenerateSTART:
        PUSH      S:?b8
        LD        S:?b8, A
//  252   /* Check function parameters */
//  253   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
        TNZ       S:?b8
        JREQ      L:??I2C_GenerateSTART_0
        LD        A, S:?b8
        CP        A, #0x1
        JREQ      L:??I2C_GenerateSTART_0
        LDW       X, #0xfd
        LDW       S:?w1, X
        CLRW      X
        LDW       S:?w0, X
        LDW       X, #`?<Constant "C:\\\\Users\\\\lun55\\\\Deskto...">`
        CALL      L:assert_failed
//  254 
//  255   if (NewState != DISABLE)
??I2C_GenerateSTART_0:
        TNZ       S:?b8
        JREQ      L:??I2C_GenerateSTART_1
//  256   {
//  257     /* Generate a START condition */
//  258     I2C->CR2 |= I2C_CR2_START;
        BSET      L:0x5211, #0x0
        JRA       L:??I2C_GenerateSTART_2
//  259   }
//  260   else /* NewState == DISABLE */
//  261   {
//  262     /* Disable the START condition generation */
//  263     I2C->CR2 &= (uint8_t)(~I2C_CR2_START);
??I2C_GenerateSTART_1:
        BRES      L:0x5211, #0x0
//  264   }
//  265 }
??I2C_GenerateSTART_2:
        POP       S:?b8
        RET
//  266 
//  267 /**
//  268   * @brief  Generates I2C communication STOP condition.
//  269   * @param   NewState : Enable or disable the stop condition.
//  270   *          This parameter can be any of the @ref FunctionalState enumeration.
//  271   * @retval None
//  272   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  273 void I2C_GenerateSTOP(FunctionalState NewState)
//  274 {
I2C_GenerateSTOP:
        PUSH      S:?b8
        LD        S:?b8, A
//  275   /* Check function parameters */
//  276   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
        TNZ       S:?b8
        JREQ      L:??I2C_GenerateSTOP_0
        LD        A, S:?b8
        CP        A, #0x1
        JREQ      L:??I2C_GenerateSTOP_0
        LDW       X, #0x114
        LDW       S:?w1, X
        CLRW      X
        LDW       S:?w0, X
        LDW       X, #`?<Constant "C:\\\\Users\\\\lun55\\\\Deskto...">`
        CALL      L:assert_failed
//  277 
//  278   if (NewState != DISABLE)
??I2C_GenerateSTOP_0:
        TNZ       S:?b8
        JREQ      L:??I2C_GenerateSTOP_1
//  279   {
//  280     /* Generate a STOP condition */
//  281     I2C->CR2 |= I2C_CR2_STOP;
        BSET      L:0x5211, #0x1
        JRA       L:??I2C_GenerateSTOP_2
//  282   }
//  283   else /* NewState == DISABLE */
//  284   {
//  285     /* Disable the STOP condition generation */
//  286     I2C->CR2 &= (uint8_t)(~I2C_CR2_STOP);
??I2C_GenerateSTOP_1:
        BRES      L:0x5211, #0x1
//  287   }
//  288 }
??I2C_GenerateSTOP_2:
        POP       S:?b8
        RET
//  289 
//  290 /**
//  291   * @brief  Enables or disables I2C software reset.
//  292   * @param  NewState : Specifies the new state of the I2C software reset.
//  293   *         This parameter can be any of the @ref FunctionalState enumeration.
//  294   * @retval None
//  295   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  296 void I2C_SoftwareResetCmd(FunctionalState NewState)
//  297 {
I2C_SoftwareResetCmd:
        PUSH      S:?b8
        LD        S:?b8, A
//  298   /* Check function parameters */
//  299   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
        TNZ       S:?b8
        JREQ      L:??I2C_SoftwareResetCmd_0
        LD        A, S:?b8
        CP        A, #0x1
        JREQ      L:??I2C_SoftwareResetCmd_0
        LDW       X, #0x12b
        LDW       S:?w1, X
        CLRW      X
        LDW       S:?w0, X
        LDW       X, #`?<Constant "C:\\\\Users\\\\lun55\\\\Deskto...">`
        CALL      L:assert_failed
//  300 
//  301   if (NewState != DISABLE)
??I2C_SoftwareResetCmd_0:
        TNZ       S:?b8
        JREQ      L:??I2C_SoftwareResetCmd_1
//  302   {
//  303     /* Peripheral under reset */
//  304     I2C->CR2 |= I2C_CR2_SWRST;
        BSET      L:0x5211, #0x7
        JRA       L:??I2C_SoftwareResetCmd_2
//  305   }
//  306   else /* NewState == DISABLE */
//  307   {
//  308     /* Peripheral not under reset */
//  309     I2C->CR2 &= (uint8_t)(~I2C_CR2_SWRST);
??I2C_SoftwareResetCmd_1:
        BRES      L:0x5211, #0x7
//  310   }
//  311 }
??I2C_SoftwareResetCmd_2:
        POP       S:?b8
        RET
//  312 
//  313 /**
//  314   * @brief  Enables or disables the I2C clock stretching.
//  315   * @param  NewState : Specifies the new state of the I2C Clock stretching.
//  316   *         This parameter can be any of the @ref FunctionalState enumeration.
//  317   * @retval None
//  318   */
//  319 

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  320 void I2C_StretchClockCmd(FunctionalState NewState)
//  321 {
I2C_StretchClockCmd:
        PUSH      S:?b8
        LD        S:?b8, A
//  322   /* Check function parameters */
//  323   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
        TNZ       S:?b8
        JREQ      L:??I2C_StretchClockCmd_0
        LD        A, S:?b8
        CP        A, #0x1
        JREQ      L:??I2C_StretchClockCmd_0
        LDW       X, #0x143
        LDW       S:?w1, X
        CLRW      X
        LDW       S:?w0, X
        LDW       X, #`?<Constant "C:\\\\Users\\\\lun55\\\\Deskto...">`
        CALL      L:assert_failed
//  324 
//  325   if (NewState != DISABLE)
??I2C_StretchClockCmd_0:
        TNZ       S:?b8
        JREQ      L:??I2C_StretchClockCmd_1
//  326   {
//  327     /* Clock Stretching Enable */
//  328     I2C->CR1 &= (uint8_t)(~I2C_CR1_NOSTRETCH);
        BRES      L:0x5210, #0x7
        JRA       L:??I2C_StretchClockCmd_2
//  329 
//  330   }
//  331   else /* NewState == DISABLE */
//  332   {
//  333     /* Clock Stretching Disable (Slave mode) */
//  334     I2C->CR1 |= I2C_CR1_NOSTRETCH;
??I2C_StretchClockCmd_1:
        BSET      L:0x5210, #0x7
//  335   }
//  336 }
??I2C_StretchClockCmd_2:
        POP       S:?b8
        RET
//  337 
//  338 /**
//  339   * @brief  Enable or Disable the I2C acknowledge and position acknowledge feature.
//  340   * @note   This function must be called before data reception start
//  341   * @param  Ack : Specifies the acknowledge mode to apply.
//  342   *         This parameter can be any of the  @ref I2C_Ack_TypeDef enumeration.
//  343   * @retval None
//  344   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  345 void I2C_AcknowledgeConfig(I2C_Ack_TypeDef Ack)
//  346 {
I2C_AcknowledgeConfig:
        PUSH      S:?b8
        LD        S:?b8, A
//  347   /* Check function parameters */
//  348   assert_param(IS_I2C_ACK_OK(Ack));
        TNZ       S:?b8
        JREQ      L:??I2C_AcknowledgeConfig_0
        LD        A, S:?b8
        CP        A, #0x1
        JREQ      L:??I2C_AcknowledgeConfig_0
        LD        A, S:?b8
        CP        A, #0x2
        JREQ      L:??I2C_AcknowledgeConfig_0
        LDW       X, #0x15c
        LDW       S:?w1, X
        CLRW      X
        LDW       S:?w0, X
        LDW       X, #`?<Constant "C:\\\\Users\\\\lun55\\\\Deskto...">`
        CALL      L:assert_failed
//  349 
//  350   if (Ack == I2C_ACK_NONE)
??I2C_AcknowledgeConfig_0:
        TNZ       S:?b8
        JRNE      L:??I2C_AcknowledgeConfig_1
//  351   {
//  352     /* Disable the acknowledgement */
//  353     I2C->CR2 &= (uint8_t)(~I2C_CR2_ACK);
        BRES      L:0x5211, #0x2
        JRA       L:??I2C_AcknowledgeConfig_2
//  354   }
//  355   else
//  356   {
//  357     /* Enable the acknowledgement */
//  358     I2C->CR2 |= I2C_CR2_ACK;
??I2C_AcknowledgeConfig_1:
        BSET      L:0x5211, #0x2
//  359 
//  360     if (Ack == I2C_ACK_CURR)
        LD        A, S:?b8
        CP        A, #0x1
        JRNE      L:??I2C_AcknowledgeConfig_3
//  361     {
//  362       /* Configure (N)ACK on current byte */
//  363       I2C->CR2 &= (uint8_t)(~I2C_CR2_POS);
        BRES      L:0x5211, #0x3
        JRA       L:??I2C_AcknowledgeConfig_2
//  364     }
//  365     else
//  366     {
//  367       /* Configure (N)ACK on next byte */
//  368       I2C->CR2 |= I2C_CR2_POS;
??I2C_AcknowledgeConfig_3:
        BSET      L:0x5211, #0x3
//  369     }
//  370   }
//  371 }
??I2C_AcknowledgeConfig_2:
        POP       S:?b8
        RET
//  372 
//  373 /**
//  374   * @brief  Enables or disables the specified I2C interrupt.
//  375   * @param  ITName : Name of the interrupt to enable or disable.
//  376   *         This parameter can be any of the  @ref I2C_IT_TypeDef enumeration.
//  377   * @param  NewState : State of the interrupt to apply.
//  378   *         This parameter can be any of the @ref FunctionalState enumeration.
//  379   * @retval None
//  380   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  381 void I2C_ITConfig(I2C_IT_TypeDef I2C_IT, FunctionalState NewState)
//  382 {
I2C_ITConfig:
        CALL      L:?push_w4
        LD        S:?b8, A
        MOV       S:?b9, S:?b0
//  383   /* Check functions parameters */
//  384   assert_param(IS_I2C_INTERRUPT_OK(I2C_IT));
        LD        A, S:?b8
        CP        A, #0x1
        JREQ      L:??I2C_ITConfig_0
        LD        A, S:?b8
        CP        A, #0x2
        JREQ      L:??I2C_ITConfig_0
        LD        A, S:?b8
        CP        A, #0x4
        JREQ      L:??I2C_ITConfig_0
        LD        A, S:?b8
        CP        A, #0x3
        JREQ      L:??I2C_ITConfig_0
        LD        A, S:?b8
        CP        A, #0x5
        JREQ      L:??I2C_ITConfig_0
        LD        A, S:?b8
        CP        A, #0x6
        JREQ      L:??I2C_ITConfig_0
        LD        A, S:?b8
        CP        A, #0x7
        JREQ      L:??I2C_ITConfig_0
        LDW       X, #0x180
        LDW       S:?w1, X
        CLRW      X
        LDW       S:?w0, X
        LDW       X, #`?<Constant "C:\\\\Users\\\\lun55\\\\Deskto...">`
        CALL      L:assert_failed
//  385   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
??I2C_ITConfig_0:
        TNZ       S:?b9
        JREQ      L:??I2C_ITConfig_1
        LD        A, S:?b9
        CP        A, #0x1
        JREQ      L:??I2C_ITConfig_1
        LDW       X, #0x181
        LDW       S:?w1, X
        CLRW      X
        LDW       S:?w0, X
        LDW       X, #`?<Constant "C:\\\\Users\\\\lun55\\\\Deskto...">`
        CALL      L:assert_failed
//  386 
//  387   if (NewState != DISABLE)
??I2C_ITConfig_1:
        TNZ       S:?b9
        JREQ      L:??I2C_ITConfig_2
//  388   {
//  389     /* Enable the selected I2C interrupts */
//  390     I2C->ITR |= (uint8_t)I2C_IT;
        LD        A, S:?b8
        OR        A, L:0x521a
        LD        L:0x521a, A
        JP        L:?epilogue_w4
//  391   }
//  392   else /* NewState == DISABLE */
//  393   {
//  394     /* Disable the selected I2C interrupts */
//  395     I2C->ITR &= (uint8_t)(~(uint8_t)I2C_IT);
??I2C_ITConfig_2:
        CPL       S:?b8
        LD        A, S:?b8
        AND       A, L:0x521a
        LD        L:0x521a, A
//  396   }
//  397 }
        JP        L:?epilogue_w4
//  398 
//  399 /**
//  400   * @brief  Selects the specified I2C fast mode duty cycle.
//  401   * @param  I2C_DutyCycle : Specifies the duty cycle to apply.
//  402   *         This parameter can be any of the @ref I2C_DutyCycle_TypeDef enumeration.
//  403   * @retval None
//  404   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  405 void I2C_FastModeDutyCycleConfig(I2C_DutyCycle_TypeDef I2C_DutyCycle)
//  406 {
I2C_FastModeDutyCycleConfig:
        PUSH      S:?b8
        LD        S:?b8, A
//  407   /* Check function parameters */
//  408   assert_param(IS_I2C_DUTYCYCLE_OK(I2C_DutyCycle));
        TNZ       S:?b8
        JREQ      L:??I2C_FastModeDutyCycleConfig_0
        LD        A, S:?b8
        CP        A, #0x40
        JREQ      L:??I2C_FastModeDutyCycleConfig_0
        LDW       X, #0x198
        LDW       S:?w1, X
        CLRW      X
        LDW       S:?w0, X
        LDW       X, #`?<Constant "C:\\\\Users\\\\lun55\\\\Deskto...">`
        CALL      L:assert_failed
//  409 
//  410   if (I2C_DutyCycle == I2C_DUTYCYCLE_16_9)
??I2C_FastModeDutyCycleConfig_0:
        LD        A, S:?b8
        CP        A, #0x40
        JRNE      L:??I2C_FastModeDutyCycleConfig_1
//  411   {
//  412     /* I2C fast mode Tlow/Thigh = 16/9 */
//  413     I2C->CCRH |= I2C_CCRH_DUTY;
        BSET      L:0x521c, #0x6
        JRA       L:??I2C_FastModeDutyCycleConfig_2
//  414   }
//  415   else /* I2C_DUTYCYCLE_2 */
//  416   {
//  417     /* I2C fast mode Tlow/Thigh = 2 */
//  418     I2C->CCRH &= (uint8_t)(~I2C_CCRH_DUTY);
??I2C_FastModeDutyCycleConfig_1:
        BRES      L:0x521c, #0x6
//  419   }
//  420 }
??I2C_FastModeDutyCycleConfig_2:
        POP       S:?b8
        RET
//  421 
//  422 /**
//  423   * @brief  Returns the most recent received data.
//  424   * @param  None
//  425   * @retval uint8_t : The value of the received byte data.
//  426   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  427 uint8_t I2C_ReceiveData(void)
//  428 {
//  429   /* Return the data present in the DR register */
//  430   return ((uint8_t)I2C->DR);
I2C_ReceiveData:
        LD        A, L:0x5216
        RET
//  431 }
//  432 
//  433 /**
//  434   * @brief  Transmits the 7-bit address (to select the) slave device.
//  435   * @param   Address : Specifies the slave address which will be transmitted.
//  436   * @param   Direction : Specifies whether the I2C device will be a Transmitter or a Receiver.
//  437   * This parameter can be any of the @ref I2C_Direction_TypeDef enumeration.
//  438   * @retval None
//  439   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  440 void I2C_Send7bitAddress(uint8_t Address, I2C_Direction_TypeDef Direction)
//  441 {
I2C_Send7bitAddress:
        CALL      L:?push_w4
        LD        S:?b9, A
        MOV       S:?b8, S:?b0
//  442   /* Check function parameters */
//  443   assert_param(IS_I2C_ADDRESS_OK(Address));
        LD        A, S:?b9
        AND       A, #0x1
        CP        A, #0x0
        JREQ      L:??I2C_Send7bitAddress_0
        LDW       X, #0x1bb
        LDW       S:?w1, X
        CLRW      X
        LDW       S:?w0, X
        LDW       X, #`?<Constant "C:\\\\Users\\\\lun55\\\\Deskto...">`
        CALL      L:assert_failed
//  444   assert_param(IS_I2C_DIRECTION_OK(Direction));
??I2C_Send7bitAddress_0:
        TNZ       S:?b8
        JREQ      L:??I2C_Send7bitAddress_1
        LD        A, S:?b8
        CP        A, #0x1
        JREQ      L:??I2C_Send7bitAddress_1
        LDW       X, #0x1bc
        LDW       S:?w1, X
        CLRW      X
        LDW       S:?w0, X
        LDW       X, #`?<Constant "C:\\\\Users\\\\lun55\\\\Deskto...">`
        CALL      L:assert_failed
//  445 
//  446   /* Clear bit0 (direction) just in case */
//  447   Address &= (uint8_t)0xFE;
??I2C_Send7bitAddress_1:
        LD        A, S:?b9
        AND       A, #0xfe
        LD        S:?b9, A
//  448 
//  449   /* Send the Address + Direction */
//  450   I2C->DR = (uint8_t)(Address | (uint8_t)Direction);
        LD        A, S:?b8
        OR        A, S:?b9
        LD        L:0x5216, A
//  451 }
        JP        L:?epilogue_w4
//  452 
//  453 /**
//  454   * @brief  Send a byte by writing in the DR register.
//  455   * @param   Data : Byte to be sent.
//  456   * @retval None
//  457   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  458 void I2C_SendData(uint8_t Data)
//  459 {
//  460   /* Write in the DR register the data to be sent */
//  461   I2C->DR = Data;
I2C_SendData:
        LD        L:0x5216, A
//  462 }
        RET
//  463 
//  464 /**
//  465  * @brief
//  466  ****************************************************************************************
//  467  *
//  468  *                         I2C State Monitoring Functions
//  469  *
//  470  ****************************************************************************************
//  471  * This I2C driver provides three different ways for I2C state monitoring
//  472  *  depending on the application requirements and constraints:
//  473  *
//  474  *
//  475  * 1) Basic state monitoring:
//  476  *    Using I2C_CheckEvent() function:
//  477  *    It compares the status registers (SR1, SR2 and SR3) content to a given event
//  478  *    (can be the combination of one or more flags).
//  479  *    It returns SUCCESS if the current status includes the given flags
//  480  *    and returns ERROR if one or more flags are missing in the current status.
//  481  *    - When to use:
//  482  *      - This function is suitable for most applications as well as for startup
//  483  *      activity since the events are fully described in the product reference manual
//  484  *      (RM0016).
//  485  *      - It is also suitable for users who need to define their own events.
//  486  *    - Limitations:
//  487  *      - If an error occurs (ie. error flags are set besides to the monitored flags),
//  488  *        the I2C_CheckEvent() function may return SUCCESS despite the communication
//  489  *        hold or corrupted real state.
//  490  *        In this case, it is advised to use error interrupts to monitor the error
//  491  *        events and handle them in the interrupt IRQ handler.
//  492  *
//  493  *        @note
//  494  *        For error management, it is advised to use the following functions:
//  495  *          - I2C_ITConfig() to configure and enable the error interrupts (I2C_IT_ERR).
//  496  *          - I2C_IRQHandler() which is called when the I2C interrupts occur.
//  497  *          - I2C_GetFlagStatus() or I2C_GetITStatus() to be called into the
//  498  *           I2C_IRQHandler() function in order to determine which error occurred.
//  499  *          - I2C_ClearFlag() or I2C_ClearITPendingBit() and/or I2C_SoftwareResetCmd()
//  500  *            and/or I2C_GenerateStop() in order to clear the error flag and
//  501  *            source and return to correct communication status.
//  502  *
//  503  *
//  504  *  2) Advanced state monitoring:
//  505  *     Using the function I2C_GetLastEvent() which returns the image of both SR1
//  506  *     & SR3 status registers in a single word (uint16_t) (Status Register 3 value
//  507  *     is shifted left by 8 bits and concatenated to Status Register 1).
//  508  *     - When to use:
//  509  *       - This function is suitable for the same applications above but it allows to
//  510  *         overcome the limitations of I2C_GetFlagStatus() function (see below).
//  511  *         The returned value could be compared to events already defined in the
//  512  *         library (stm8s_i2c.h) or to custom values defined by user.
//  513  *       - This function is suitable when multiple flags are monitored at the same time.
//  514  *       - At the opposite of I2C_CheckEvent() function, this function allows user to
//  515  *         choose when an event is accepted (when all events flags are set and no
//  516  *         other flags are set or just when the needed flags are set like
//  517  *         I2C_CheckEvent() function).
//  518  *     - Limitations:
//  519  *       - User may need to define his own events.
//  520  *       - Same remark concerning the error management is applicable for this
//  521  *         function if user decides to check only regular communication flags (and
//  522  *         ignores error flags).
//  523  *
//  524  *
//  525  *  3) Flag-based state monitoring:
//  526  *     Using the function I2C_GetFlagStatus() which simply returns the status of
//  527  *     one single flag (ie. I2C_FLAG_RXNE ...).
//  528  *     - When to use:
//  529  *        - This function could be used for specific applications or in debug phase.
//  530  *        - It is suitable when only one flag checking is needed (most I2C events
//  531  *          are monitored through multiple flags).
//  532  *     - Limitations:
//  533  *        - When calling this function, the Status register is accessed. Some flags are
//  534  *          cleared when the status register is accessed. So checking the status
//  535  *          of one Flag, may clear other ones.
//  536  *        - Function may need to be called twice or more in order to monitor one
//  537  *          single event.
//  538  *
//  539  *  For detailed description of Events, please refer to section I2C_Events in
//  540  *  stm8s_i2c.h file.
//  541  *
//  542  */
//  543 /**
//  544  *
//  545  *  1) Basic state monitoring
//  546  *******************************************************************************
//  547  */
//  548 
//  549 /**
//  550   * @brief  Checks whether the last I2C Event is equal to the one passed
//  551   *   as parameter.
//  552   * @param  I2C_EVENT: specifies the event to be checked.
//  553   *   This parameter can be one of the following values:
//  554   *     @arg I2C_EVENT_SLAVE_TRANSMITTER_ADDRESS_MATCHED           : EV1
//  555   *     @arg I2C_EVENT_SLAVE_RECEIVER_ADDRESS_MATCHED              : EV1
//  556   *     @arg I2C_EVENT_SLAVE_GENERALCALLADDRESS_MATCHED            : EV1
//  557   *     @arg I2C_EVENT_SLAVE_BYTE_RECEIVED                         : EV2
//  558   *     @arg (I2C_EVENT_SLAVE_BYTE_RECEIVED | I2C_FLAG_GENCALL)    : EV2
//  559   *     @arg I2C_EVENT_SLAVE_BYTE_TRANSMITTED                      : EV3
//  560   *     @arg (I2C_EVENT_SLAVE_BYTE_TRANSMITTED | I2C_FLAG_GENCALL) : EV3
//  561   *     @arg I2C_EVENT_SLAVE_ACK_FAILURE                           : EV3_2
//  562   *     @arg I2C_EVENT_SLAVE_STOP_DETECTED                         : EV4
//  563   *     @arg I2C_EVENT_MASTER_MODE_SELECT                          : EV5
//  564   *     @arg I2C_EVENT_MASTER_TRANSMITTER_MODE_SELECTED            : EV6
//  565   *     @arg I2C_EVENT_MASTER_RECEIVER_MODE_SELECTED               : EV6
//  566   *     @arg I2C_EVENT_MASTER_BYTE_RECEIVED                        : EV7
//  567   *     @arg I2C_EVENT_MASTER_BYTE_TRANSMITTING                    : EV8
//  568   *     @arg I2C_EVENT_MASTER_BYTE_TRANSMITTED                     : EV8_2
//  569   *     @arg I2C_EVENT_MASTER_MODE_ADDRESS10                       : EV9
//  570   *
//  571   * @note: For detailed description of Events, please refer to section
//  572   *    I2C_Events in stm8s_i2c.h file.
//  573   *
//  574   * @retval An ErrorStatus enumeration value:
//  575   * - SUCCESS: Last event is equal to the I2C_EVENT
//  576   * - ERROR: Last event is different from the I2C_EVENT
//  577   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  578 ErrorStatus I2C_CheckEvent(I2C_Event_TypeDef I2C_Event)
//  579 {
I2C_CheckEvent:
        CALL      L:?push_w4
        SUB       SP, #0x2
        LDW       S:?w4, X
//  580   __IO uint16_t lastevent = 0x00;
        CLRW      X
        LDW       (0x1,SP), X
//  581   uint8_t flag1 = 0x00 ;
        CLR       S:?b1
//  582   uint8_t flag2 = 0x00;
        CLR       A
//  583   ErrorStatus status = ERROR;
        CLR       S:?b0
//  584 
//  585   /* Check the parameters */
//  586   assert_param(IS_I2C_EVENT_OK(I2C_Event));
        LDW       X, S:?w4
        CPW       X, #0x682
        JREQ      L:??I2C_CheckEvent_0
        LDW       X, S:?w4
        CPW       X, #0x202
        JREQ      L:??I2C_CheckEvent_0
        LDW       X, S:?w4
        CPW       X, #0x1200
        JREQ      L:??I2C_CheckEvent_0
        LDW       X, S:?w4
        CPW       X, #0x240
        JREQ      L:??I2C_CheckEvent_0
        LDW       X, S:?w4
        CPW       X, #0x350
        JREQ      L:??I2C_CheckEvent_0
        LDW       X, S:?w4
        CPW       X, #0x684
        JREQ      L:??I2C_CheckEvent_0
        LDW       X, S:?w4
        CPW       X, #0x794
        JREQ      L:??I2C_CheckEvent_0
        LDW       X, S:?w4
        CPW       X, #0x4
        JREQ      L:??I2C_CheckEvent_0
        LDW       X, S:?w4
        CPW       X, #0x10
        JREQ      L:??I2C_CheckEvent_0
        LDW       X, S:?w4
        CPW       X, #0x301
        JREQ      L:??I2C_CheckEvent_0
        LDW       X, S:?w4
        CPW       X, #0x782
        JREQ      L:??I2C_CheckEvent_0
        LDW       X, S:?w4
        CPW       X, #0x302
        JREQ      L:??I2C_CheckEvent_0
        LDW       X, S:?w4
        CPW       X, #0x340
        JREQ      L:??I2C_CheckEvent_0
        LDW       X, S:?w4
        CPW       X, #0x784
        JREQ      L:??I2C_CheckEvent_0
        LDW       X, S:?w4
        CPW       X, #0x780
        JREQ      L:??I2C_CheckEvent_0
        LDW       X, S:?w4
        CPW       X, #0x308
        JREQ      L:??I2C_CheckEvent_0
        LDW       X, #0x24a
        LDW       S:?w1, X
        CLRW      X
        LDW       S:?w0, X
        LDW       X, #`?<Constant "C:\\\\Users\\\\lun55\\\\Deskto...">`
        CALL      L:assert_failed
//  587 
//  588   if (I2C_Event == I2C_EVENT_SLAVE_ACK_FAILURE)
??I2C_CheckEvent_0:
        LDW       X, S:?w4
        CPW       X, #0x4
        JRNE      L:??I2C_CheckEvent_1
//  589   {
//  590     lastevent = I2C->SR2 & I2C_SR2_AF;
        LD        A, L:0x5218
        CLRW      X
        LD        XL, A
        RLWA      X, A
        AND       A, #0x0
        RLWA      X, A
        AND       A, #0x4
        RLWA      X, A
        LDW       (0x1,SP), X
        JRA       L:??I2C_CheckEvent_2
//  591   }
//  592   else
//  593   {
//  594     flag1 = I2C->SR1;
??I2C_CheckEvent_1:
        LD        A, L:0x5217
        LD        S:?b1, A
//  595     flag2 = I2C->SR3;
        LD        A, L:0x5219
//  596     lastevent = ((uint16_t)((uint16_t)flag2 << (uint16_t)8) | (uint16_t)flag1);
        CLRW      X
        LD        XL, A
        CLR       A
        RLWA      X, A
        LDW       Y, X
        CLRW      X
        EXG       A, XL
        LD        A, S:?b1
        EXG       A, XL
        LDW       S:?w0, X
        LDW       X, Y
        RRWA      X, A
        OR        A, S:?b1
        RRWA      X, A
        OR        A, S:?b0
        RRWA      X, A
        LDW       (0x1,SP), X
//  597   }
//  598   /* Check whether the last event is equal to I2C_EVENT */
//  599   if (((uint16_t)lastevent & (uint16_t)I2C_Event) == (uint16_t)I2C_Event)
??I2C_CheckEvent_2:
        LDW       X, (0x1,SP)
        RRWA      X, A
        AND       A, S:?b9
        RRWA      X, A
        AND       A, S:?b8
        RRWA      X, A
        CPW       X, S:?w4
        JRNE      L:??I2C_CheckEvent_3
//  600   {
//  601     /* SUCCESS: last event is equal to I2C_EVENT */
//  602     status = SUCCESS;
        MOV       S:?b0, #0x1
        JRA       L:??I2C_CheckEvent_4
//  603   }
//  604   else
//  605   {
//  606     /* ERROR: last event is different from I2C_EVENT */
//  607     status = ERROR;
??I2C_CheckEvent_3:
        CLR       S:?b0
//  608   }
//  609 
//  610   /* Return status */
//  611   return status;
??I2C_CheckEvent_4:
        LD        A, S:?b0
        ADD       SP, #0x2
        JP        L:?epilogue_w4
//  612 }
//  613 
//  614 /**
//  615  *
//  616  *  2) Advanced state monitoring
//  617  *******************************************************************************
//  618  */
//  619 /**
//  620   * @brief  Returns the last I2C Event.
//  621   *
//  622   * @note: For detailed description of Events, please refer to section
//  623   *    I2C_Events in stm8s_i2c.h file.
//  624   *
//  625   * @retval The last event
//  626   *   This parameter can be any of the  @ref I2C_Event_TypeDef enumeration.
//  627   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  628 I2C_Event_TypeDef I2C_GetLastEvent(void)
//  629 {
I2C_GetLastEvent:
        SUB       SP, #0x2
//  630   __IO uint16_t lastevent = 0;
        CLRW      X
        LDW       (0x1,SP), X
//  631   uint16_t flag1 = 0;
        CLRW      Y
//  632   uint16_t flag2 = 0;
        CLRW      X
//  633 
//  634   if ((I2C->SR2 & I2C_SR2_AF) != 0x00)
        BTJF      L:0x5218, #0x2, L:??I2C_GetLastEvent_0
//  635   {
//  636     lastevent = I2C_EVENT_SLAVE_ACK_FAILURE;
        LDW       X, #0x4
        LDW       (0x1,SP), X
        JRA       L:??I2C_GetLastEvent_1
//  637   }
//  638   else
//  639   {
//  640     /* Read the I2C status register */
//  641     flag1 = I2C->SR1;
??I2C_GetLastEvent_0:
        LD        A, L:0x5217
        CLRW      Y
        LD        YL, A
//  642     flag2 = I2C->SR3;
        LD        A, L:0x5219
        CLRW      X
        LD        XL, A
//  643 
//  644     /* Get the last event value from I2C status register */
//  645     lastevent = ((uint16_t)((uint16_t)flag2 << 8) | (uint16_t)flag1);
        CLR       A
        RLWA      X, A
        LDW       S:?w0, Y
        RRWA      X, A
        OR        A, S:?b1
        RRWA      X, A
        OR        A, S:?b0
        RRWA      X, A
        LDW       (0x1,SP), X
//  646   }
//  647   /* Return status */
//  648   return (I2C_Event_TypeDef)lastevent;
??I2C_GetLastEvent_1:
        LDW       X, (0x1,SP)
        ADD       SP, #0x2
        RET
//  649 }
//  650 
//  651 /**
//  652  *
//  653  *  3) Flag-based state monitoring
//  654  *******************************************************************************
//  655  */
//  656 /**
//  657   * @brief  Checks whether the specified I2C flag is set or not.
//  658   * @param  I2C_FLAG: specifies the flag to check.
//  659   *   This parameter can be one of the following values:
//  660   *     @arg I2C_FLAG_GENERALCALL: General call header flag (Slave mode)
//  661   *     @arg I2C_FLAG_TRANSMITTERRECEIVER: Transmitter/Receiver flag
//  662   *     @arg I2C_FLAG_BUSBUSY: Bus busy flag
//  663   *     @arg I2C_FLAG_MASTERSLAVE: Master/Slave flag
//  664   *     @arg I2C_FLAG_WAKEUPFROMHALT: Wake up from HALT flag  
//  665   *     @arg I2C_FLAG_OVERRUNUNDERRUN: Overrun/Underrun flag (Slave mode)
//  666   *     @arg I2C_FLAG_ACKNOWLEDGEFAILURE: Acknowledge failure flag
//  667   *     @arg I2C_FLAG_ARBITRATIONLOSS: Arbitration lost flag (Master mode)
//  668   *     @arg I2C_FLAG_BUSERROR: Bus error flag
//  669   *     @arg I2C_FLAG_TXEMPTY: Data register empty flag (Transmitter)
//  670   *     @arg I2C_FLAG_RXNOTEMPTY: Data register not empty (Receiver) flag
//  671   *     @arg I2C_FLAG_STOPDETECTION: Stop detection flag (Slave mode)
//  672   *     @arg I2C_FLAG_HEADERSENT: 10-bit header sent flag (Master mode)
//  673   *     @arg I2C_FLAG_TRANSFERFINISHED: Byte transfer finished flag
//  674   *     @arg I2C_FLAG_ADDRESSSENTMATCHED: Address sent flag (Master mode) “ADSL”
//  675   *   Address matched flag (Slave mode)”ENDAD”
//  676   *     @arg I2C_FLAG_STARTDETECTION: Start bit flag (Master mode)
//  677   * @retval The new state of I2C_FLAG (SET or RESET).
//  678   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  679 FlagStatus I2C_GetFlagStatus(I2C_Flag_TypeDef I2C_Flag)
//  680 {
I2C_GetFlagStatus:
        CALL      L:?push_w4
        PUSH      S:?b10
        LDW       S:?w4, X
//  681   uint8_t tempreg = 0;
        CLR       S:?b10
//  682   uint8_t regindex = 0;
        CLR       A
//  683   FlagStatus bitstatus = RESET;
        CLR       S:?b0
//  684 
//  685   /* Check the parameters */
//  686   assert_param(IS_I2C_FLAG_OK(I2C_Flag));
        LDW       X, S:?w4
        CPW       X, #0x180
        JREQ      L:??I2C_GetFlagStatus_0
        LDW       X, S:?w4
        CPW       X, #0x140
        JREQ      L:??I2C_GetFlagStatus_0
        LDW       X, S:?w4
        CPW       X, #0x110
        JREQ      L:??I2C_GetFlagStatus_0
        LDW       X, S:?w4
        CPW       X, #0x108
        JREQ      L:??I2C_GetFlagStatus_0
        LDW       X, S:?w4
        CPW       X, #0x104
        JREQ      L:??I2C_GetFlagStatus_0
        LDW       X, S:?w4
        CPW       X, #0x102
        JREQ      L:??I2C_GetFlagStatus_0
        LDW       X, S:?w4
        CPW       X, #0x101
        JREQ      L:??I2C_GetFlagStatus_0
        LDW       X, S:?w4
        CPW       X, #0x220
        JREQ      L:??I2C_GetFlagStatus_0
        LDW       X, S:?w4
        CPW       X, #0x208
        JREQ      L:??I2C_GetFlagStatus_0
        LDW       X, S:?w4
        CPW       X, #0x204
        JREQ      L:??I2C_GetFlagStatus_0
        LDW       X, S:?w4
        CPW       X, #0x202
        JREQ      L:??I2C_GetFlagStatus_0
        LDW       X, S:?w4
        CPW       X, #0x201
        JREQ      L:??I2C_GetFlagStatus_0
        LDW       X, S:?w4
        CPW       X, #0x310
        JREQ      L:??I2C_GetFlagStatus_0
        LDW       X, S:?w4
        CPW       X, #0x304
        JREQ      L:??I2C_GetFlagStatus_0
        LDW       X, S:?w4
        CPW       X, #0x302
        JREQ      L:??I2C_GetFlagStatus_0
        LDW       X, S:?w4
        CPW       X, #0x301
        JREQ      L:??I2C_GetFlagStatus_0
        LDW       X, #0x2ae
        LDW       S:?w1, X
        CLRW      X
        LDW       S:?w0, X
        LDW       X, #`?<Constant "C:\\\\Users\\\\lun55\\\\Deskto...">`
        CALL      L:assert_failed
//  687 
//  688   /* Read flag register index */
//  689   regindex = (uint8_t)((uint16_t)I2C_Flag >> 8);
??I2C_GetFlagStatus_0:
        LDW       X, S:?w4
        CLR       A
        RRWA      X, A
        LD        A, XL
//  690   /* Check SRx index */
//  691   switch (regindex)
        DEC       A
        JREQ      L:??I2C_GetFlagStatus_1
        DEC       A
        JREQ      L:??I2C_GetFlagStatus_2
        DEC       A
        JREQ      L:??I2C_GetFlagStatus_3
        JRA       L:??I2C_GetFlagStatus_4
//  692   {
//  693       /* Returns whether the status register to check is SR1 */
//  694     case 0x01:
//  695       tempreg = (uint8_t)I2C->SR1;
??I2C_GetFlagStatus_1:
        LD        A, L:0x5217
        LD        S:?b10, A
//  696       break;
        JRA       L:??I2C_GetFlagStatus_4
//  697 
//  698       /* Returns whether the status register to check is SR2 */
//  699     case 0x02:
//  700       tempreg = (uint8_t)I2C->SR2;
??I2C_GetFlagStatus_2:
        LD        A, L:0x5218
        LD        S:?b10, A
//  701       break;
        JRA       L:??I2C_GetFlagStatus_4
//  702 
//  703       /* Returns whether the status register to check is SR3 */
//  704     case 0x03:
//  705       tempreg = (uint8_t)I2C->SR3;
??I2C_GetFlagStatus_3:
        LD        A, L:0x5219
        LD        S:?b10, A
//  706       break;
//  707 
//  708     default:
//  709       break;
//  710   }
//  711 
//  712   /* Check the status of the specified I2C flag */
//  713   if ((tempreg & (uint8_t)I2C_Flag ) != 0)
??I2C_GetFlagStatus_4:
        LD        A, S:?b9
        AND       A, S:?b10
        CP        A, #0x0
        JREQ      L:??I2C_GetFlagStatus_5
//  714   {
//  715     /* Flag is set */
//  716     bitstatus = SET;
        MOV       S:?b0, #0x1
        JRA       L:??I2C_GetFlagStatus_6
//  717   }
//  718   else
//  719   {
//  720     /* Flag is reset */
//  721     bitstatus = RESET;
??I2C_GetFlagStatus_5:
        CLR       S:?b0
//  722   }
//  723   /* Return the flag status */
//  724   return bitstatus;
??I2C_GetFlagStatus_6:
        LD        A, S:?b0
        POP       S:?b10
        JP        L:?epilogue_w4
//  725 }
//  726 
//  727 /**
//  728   * @brief  Clear flags
//  729   * @param  I2C_Flag : Specifies the flag to clear
//  730   *   This parameter can be any combination of the following values:
//  731   *                       - I2C_FLAG_WAKEUPFROMHALT: Wakeup from Halt
//  732   *                       - I2C_FLAG_OVERRUNUNDERRUN: Overrun/Underrun flag (Slave mode)
//  733   *                       - I2C_FLAG_ACKNOWLEDGEFAILURE: Acknowledge failure flag
//  734   *                       - I2C_FLAG_ARBITRATIONLOSS: Arbitration lost flag (Master mode)
//  735   *                       - I2C_FLAG_BUSERROR: Bus error flag.
//  736   * @note Notes:
//  737   *                       - STOPF (STOP detection) is cleared by software
//  738   *                         sequence: a read operation to I2C_SR1 register
//  739   *                         (I2C_GetFlagStatus()) followed by a write operation
//  740   *                         to I2C_CR2 register.
//  741   *                       - ADD10 (10-bit header sent) is cleared by software
//  742   *                         sequence: a read operation to I2C_SR1
//  743   *                         (I2C_GetFlagStatus()) followed by writing the
//  744   *                         second byte of the address in DR register.
//  745   *                       - BTF (Byte Transfer Finished) is cleared by software
//  746   *                         sequence: a read operation to I2C_SR1 register
//  747   *                         (I2C_GetFlagStatus()) followed by a read/write to
//  748   *                         I2C_DR register (I2C_SendData()).
//  749   *                       - ADDR (Address sent) is cleared by software sequence:
//  750   *                         a read operation to I2C_SR1 register
//  751   *                         (I2C_GetFlagStatus()) followed by a read operation to
//  752   *                         I2C_SR3 register ((void)(I2C->SR3)).
//  753   *                       - SB (Start Bit) is cleared software sequence: a read
//  754   *                         operation to I2C_SR1 register (I2C_GetFlagStatus())
//  755   *                         followed by a write operation to I2C_DR register
//  756   *                         (I2C_SendData()).
//  757   * @retval None
//  758   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  759 void I2C_ClearFlag(I2C_Flag_TypeDef I2C_FLAG)
//  760 {
I2C_ClearFlag:
        CALL      L:?push_w4
        LDW       S:?w4, X
//  761   uint16_t flagpos = 0;
        CLRW      Y
//  762   /* Check the parameters */
//  763   assert_param(IS_I2C_CLEAR_FLAG_OK(I2C_FLAG));
        LDW       X, S:?w4
        RLWA      X, A
        AND       A, #0xfd
        RLWA      X, A
        AND       A, #0x0
        RLWA      X, A
        TNZW      X
        JRNE      L:??I2C_ClearFlag_0
        LDW       X, S:?w4
        TNZW      X
        JRNE      L:??I2C_ClearFlag_1
??I2C_ClearFlag_0:
        LDW       X, #0x2fb
        LDW       S:?w1, X
        CLRW      X
        LDW       S:?w0, X
        LDW       X, #`?<Constant "C:\\\\Users\\\\lun55\\\\Deskto...">`
        CALL      L:assert_failed
//  764 
//  765   /* Get the I2C flag position */
//  766   flagpos = (uint16_t)I2C_FLAG & FLAG_Mask;
??I2C_ClearFlag_1:
        LDW       X, S:?w4
        RLWA      X, A
        AND       A, #0x0
        RLWA      X, A
        AND       A, #0xff
        RLWA      X, A
        LDW       Y, X
//  767   /* Clear the selected I2C flag */
//  768   I2C->SR2 = (uint8_t)((uint16_t)(~flagpos));
        LD        A, YL
        CPL       A
        LD        L:0x5218, A
//  769 }
        JP        L:?epilogue_w4
//  770 
//  771 /**
//  772   * @brief  Checks whether the specified I2C interrupt has occurred or not.
//  773   * @param  I2C_ITPendingBit: specifies the interrupt source to check.
//  774   *            This parameter can be one of the following values:
//  775   *               - I2C_ITPENDINGBIT_WAKEUPFROMHALT: Wakeup from Halt
//  776   *               - I2C_ITPENDINGBIT_OVERRUNUNDERRUN: Overrun/Underrun flag (Slave mode)
//  777   *               - I2C_ITPENDINGBIT_ACKNOWLEDGEFAILURE: Acknowledge failure flag
//  778   *               - I2C_ITPENDINGBIT_ARBITRATIONLOSS: Arbitration lost flag (Master mode)
//  779   *               - I2C_ITPENDINGBIT_BUSERROR: Bus error flag
//  780   *               - I2C_ITPENDINGBIT_TXEMPTY: Data register empty flag (Transmitter)
//  781   *               - I2C_ITPENDINGBIT_RXNOTEMPTY: Data register not empty (Receiver) flag
//  782   *               - I2C_ITPENDINGBIT_STOPDETECTION: Stop detection flag (Slave mode)
//  783   *               - I2C_ITPENDINGBIT_HEADERSENT: 10-bit header sent flag (Master mode)
//  784   *               - I2C_ITPENDINGBIT_TRANSFERFINISHED: Byte transfer finished flag
//  785   *               - I2C_ITPENDINGBIT_ADDRESSSENTMATCHED: Address sent flag (Master mode) “ADSL”
//  786   *                              Address matched flag (Slave mode)“ENDAD”
//  787   *               - I2C_ITPENDINGBIT_STARTDETECTION: Start bit flag (Master mode)
//  788   * @retval The new state of I2C_ITPendingBit
//  789   *   This parameter can be any of the @ref ITStatus enumeration.
//  790   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  791 ITStatus I2C_GetITStatus(I2C_ITPendingBit_TypeDef I2C_ITPendingBit)
//  792 {
I2C_GetITStatus:
        CALL      L:?push_w4
        SUB       SP, #0x1
        LDW       S:?w4, X
//  793   ITStatus bitstatus = RESET;
        CLR       S:?b0
//  794   __IO uint8_t enablestatus = 0;
        CLR       A
        LD        (0x1,SP), A
//  795   uint16_t tempregister = 0;
        CLRW      X
//  796 
//  797     /* Check the parameters */
//  798     assert_param(IS_I2C_ITPENDINGBIT_OK(I2C_ITPendingBit));
        LDW       Y, S:?w4
        CPW       Y, #0x1680
        JREQ      L:??I2C_GetITStatus_0
        LDW       X, S:?w4
        CPW       X, #0x1640
        JREQ      L:??I2C_GetITStatus_0
        LDW       X, S:?w4
        CPW       X, #0x1210
        JREQ      L:??I2C_GetITStatus_0
        LDW       X, S:?w4
        CPW       X, #0x1208
        JREQ      L:??I2C_GetITStatus_0
        LDW       X, S:?w4
        CPW       X, #0x1204
        JREQ      L:??I2C_GetITStatus_0
        LDW       X, S:?w4
        CPW       X, #0x1202
        JREQ      L:??I2C_GetITStatus_0
        LDW       X, S:?w4
        CPW       X, #0x1201
        JREQ      L:??I2C_GetITStatus_0
        LDW       X, S:?w4
        CPW       X, #0x2220
        JREQ      L:??I2C_GetITStatus_0
        LDW       X, S:?w4
        CPW       X, #0x2108
        JREQ      L:??I2C_GetITStatus_0
        LDW       X, S:?w4
        CPW       X, #0x2104
        JREQ      L:??I2C_GetITStatus_0
        LDW       X, S:?w4
        CPW       X, #0x2102
        JREQ      L:??I2C_GetITStatus_0
        LDW       X, S:?w4
        CPW       X, #0x2101
        JREQ      L:??I2C_GetITStatus_0
        LDW       X, #0x31e
        LDW       S:?w1, X
        CLRW      X
        LDW       S:?w0, X
        LDW       X, #`?<Constant "C:\\\\Users\\\\lun55\\\\Deskto...">`
        CALL      L:assert_failed
//  799 
//  800   tempregister = (uint8_t)( ((uint16_t)((uint16_t)I2C_ITPendingBit & ITEN_Mask)) >> 8);
??I2C_GetITStatus_0:
        LDW       X, S:?w4
        CLR       A
        RRWA      X, A
        LD        A, XL
        AND       A, #0x7
        CLRW      X
        LD        XL, A
//  801 
//  802   /* Check if the interrupt source is enabled or not */
//  803   enablestatus = (uint8_t)(I2C->ITR & ( uint8_t)tempregister);
        LD        A, XL
        AND       A, L:0x521a
        LD        (0x1,SP), A
//  804 
//  805   if ((uint16_t)((uint16_t)I2C_ITPendingBit & REGISTER_Mask) == REGISTER_SR1_Index)
//  806   {
//  807     /* Check the status of the specified I2C flag */
//  808     if (((I2C->SR1 & (uint8_t)I2C_ITPendingBit) != RESET) && enablestatus)
//  809     {
//  810       /* I2C_IT is set */
//  811       bitstatus = SET;
//  812     }
//  813     else
//  814     {
//  815       /* I2C_IT is reset */
//  816       bitstatus = RESET;
//  817     }
//  818   }
//  819   else
//  820   {
//  821     /* Check the status of the specified I2C flag */
//  822     if (((I2C->SR2 & (uint8_t)I2C_ITPendingBit) != RESET) && enablestatus)
        LD        A, S:?b9
        AND       A, L:0x5218
        CP        A, #0x0
        JREQ      L:??I2C_GetITStatus_1
        TNZ       (0x1,SP)
        JREQ      L:??I2C_GetITStatus_1
//  823     {
//  824       /* I2C_IT is set */
//  825       bitstatus = SET;
        MOV       S:?b0, #0x1
        JRA       L:??I2C_GetITStatus_2
//  826     }
//  827     else
//  828     {
//  829       /* I2C_IT is reset */
//  830       bitstatus = RESET;
??I2C_GetITStatus_1:
        CLR       S:?b0
//  831     }
//  832   }
//  833   /* Return the I2C_IT status */
//  834   return  bitstatus;
??I2C_GetITStatus_2:
        LD        A, S:?b0
        ADD       SP, #0x1
        JP        L:?epilogue_w4
//  835 }
//  836 
//  837 /**
//  838   * @brief  Clear IT pending bit
//  839   * @param  I2C_IT: specifies the interrupt pending bit to clear.
//  840   *            This parameter can be any combination of the following values:
//  841   *                 - I2C_ITPENDINGBIT_WAKEUPFROMHALT: Wakeup from Halt
//  842   *                 - I2C_ITPENDINGBIT_OVERRUNUNDERRUN: Overrun/Underrun interrupt (Slave mode)
//  843   *                 - I2C_ITPENDINGBIT_ACKNOWLEDGEFAILURE: Acknowledge failure interrupt
//  844   *                 - I2C_ITPENDINGBIT_ARBITRATIONLOSS: Arbitration lost interrupt (Master mode)
//  845   *                 - I2C_ITPENDINGBIT_BUSERROR: Bus error interrupt
//  846   *
//  847   *             Notes:
//  848   *                  - STOPF (STOP detection) is cleared by software
//  849   *                    sequence: a read operation to I2C_SR1 register
//  850   *                    (I2C_GetITStatus()) followed by a write operation to
//  851   *                    I2C_CR2 register (I2C_AcknowledgeConfig() to configure
//  852   *                    the I2C peripheral Acknowledge).
//  853   *                  - ADD10 (10-bit header sent) is cleared by software
//  854   *                    sequence: a read operation to I2C_SR1
//  855   *                    (I2C_GetITStatus()) followed by writing the second
//  856   *                    byte of the address in I2C_DR register.
//  857   *                  - BTF (Byte Transfer Finished) is cleared by software
//  858   *                    sequence: a read operation to I2C_SR1 register
//  859   *                    (I2C_GetITStatus()) followed by a read/write to
//  860   *                    I2C_DR register (I2C_SendData()).
//  861   *                  - ADDR (Address sent) is cleared by software sequence:
//  862   *                    a read operation to I2C_SR1 register (I2C_GetITStatus())
//  863   *                    followed by a read operation to I2C_SR3 register
//  864   *                    ((void)(I2C->SR3)).
//  865   *                  - SB (Start Bit) is cleared by software sequence: a
//  866   *                    read operation to I2C_SR1 register (I2C_GetITStatus())
//  867   *                    followed by a write operation to I2C_DR register
//  868   *                    (I2C_SendData()).
//  869   * @retval None
//  870   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  871 void I2C_ClearITPendingBit(I2C_ITPendingBit_TypeDef I2C_ITPendingBit)
//  872 {
I2C_ClearITPendingBit:
        CALL      L:?push_w4
        LDW       S:?w4, X
//  873   uint16_t flagpos = 0;
        CLRW      X
//  874 
//  875   /* Check the parameters */
//  876   assert_param(IS_I2C_CLEAR_ITPENDINGBIT_OK(I2C_ITPendingBit));
        LDW       Y, S:?w4
        CPW       Y, #0x2220
        JREQ      L:??I2C_ClearITPendingBit_0
        LDW       X, S:?w4
        CPW       X, #0x2108
        JREQ      L:??I2C_ClearITPendingBit_0
        LDW       X, S:?w4
        CPW       X, #0x2104
        JREQ      L:??I2C_ClearITPendingBit_0
        LDW       X, S:?w4
        CPW       X, #0x2102
        JREQ      L:??I2C_ClearITPendingBit_0
        LDW       X, S:?w4
        CPW       X, #0x2101
        JREQ      L:??I2C_ClearITPendingBit_0
        LDW       X, #0x36c
        LDW       S:?w1, X
        CLRW      X
        LDW       S:?w0, X
        LDW       X, #`?<Constant "C:\\\\Users\\\\lun55\\\\Deskto...">`
        CALL      L:assert_failed
//  877 
//  878   /* Get the I2C flag position */
//  879   flagpos = (uint16_t)I2C_ITPendingBit & FLAG_Mask;
??I2C_ClearITPendingBit_0:
        LDW       X, S:?w4
        RLWA      X, A
        AND       A, #0x0
        RLWA      X, A
        AND       A, #0xff
        RLWA      X, A
//  880 
//  881   /* Clear the selected I2C flag */
//  882   I2C->SR2 = (uint8_t)((uint16_t)~flagpos);
        LD        A, XL
        CPL       A
        LD        L:0x5218, A
//  883 }
        JP        L:?epilogue_w4

        SECTION VREGS:DATA:REORDER:NOROOT(0)

        SECTION `.near.rodata`:CONST:REORDER:NOROOT(0)
`?<Constant "C:\\\\Users\\\\lun55\\\\Deskto...">`:
        DC8 "C:\\Users\\lun55\\Desktop\\J19B_STM8\\Lib\\stm8s_i2c.c"

        END
//  884 
//  885 /**
//  886   * @}
//  887   */
//  888 
//  889 /**
//  890   * @}
//  891   */
//  892 
//  893 /************************ (C) COPYRIGHT STMicroelectronics *****END OF FILE****/
// 
//    49 bytes in section .near.rodata
// 1 869 bytes in section .near_func.text
// 
// 1 869 bytes of CODE  memory
//    49 bytes of CONST memory
//
//Errors: none
//Warnings: none
