///////////////////////////////////////////////////////////////////////////////
//                                                                            /
//                                                      11/Mar/2019  20:52:09 /
// IAR C/C++ Compiler V1.31.1.20058 [Evaluation] for STM8                     /
// Copyright 2010-2012 IAR Systems AB.                                        /
//                                                                            /
//    Source file  =  C:\Users\lun55\Desktop\J19B_STM8\Lib\stm8s_flash.c      /
//    Command line =  C:\Users\lun55\Desktop\J19B_STM8\Lib\stm8s_flash.c -e   /
//                    -Ol --no_cse --no_unroll --no_inline --no_code_motion   /
//                    --no_tbaa --no_cross_call --debug --code_model small    /
//                    --data_model medium -o C:\Users\lun55\Desktop\J19B_STM8 /
//                    \Debug\Obj\ --dlib_config "D:\Program Files (x86)\IAR   /
//                    Systems\Embedded Workbench 6.0                          /
//                    Evaluation\stm8\LIB\dlstm8smf.h" -lcN                   /
//                    C:\Users\lun55\Desktop\J19B_STM8\Debug\List\ -lB        /
//                    C:\Users\lun55\Desktop\J19B_STM8\Debug\List\ --vregs 16 /
//    List file    =  C:\Users\lun55\Desktop\J19B_STM8\Debug\List\stm8s_flash /
//                    .s                                                      /
//                                                                            /
//                                                                            /
///////////////////////////////////////////////////////////////////////////////

        NAME stm8s_flash

        EXTERN ?add32_l0_l0_dl
        EXTERN ?add32_l0_l0_l1
        EXTERN ?b0
        EXTERN ?b1
        EXTERN ?b10
        EXTERN ?b12
        EXTERN ?b8
        EXTERN ?b9
        EXTERN ?epilogue_l2
        EXTERN ?epilogue_l2_l3
        EXTERN ?epilogue_w4
        EXTERN ?load32_0x_l0
        EXTERN ?mov_l0_l2
        EXTERN ?mov_l0_l3
        EXTERN ?mov_l1_l0
        EXTERN ?mov_l2_l0
        EXTERN ?mov_l3_l0
        EXTERN ?mov_w1_w5
        EXTERN ?mul16_x_x_w0
        EXTERN ?mul32_l0_l0_dl
        EXTERN ?push_l1
        EXTERN ?push_l2
        EXTERN ?push_l3
        EXTERN ?push_w4
        EXTERN ?sub32_l0_l0_dl
        EXTERN ?w0
        EXTERN ?w1
        EXTERN ?w2
        EXTERN ?w3
        EXTERN ?w4
        EXTERN ?w5
        EXTERN ?w6
        EXTERN ?w7
        EXTERN assert_failed

        PUBLIC FLASH_DeInit
        PUBLIC FLASH_EraseBlock
        PUBLIC FLASH_EraseByte
        PUBLIC FLASH_EraseOptionByte
        PUBLIC FLASH_GetBootSize
        PUBLIC FLASH_GetFlagStatus
        PUBLIC FLASH_GetLowPowerMode
        PUBLIC FLASH_GetProgrammingTime
        PUBLIC FLASH_ITConfig
        PUBLIC FLASH_Lock
        PUBLIC FLASH_ProgramBlock
        PUBLIC FLASH_ProgramByte
        PUBLIC FLASH_ProgramOptionByte
        PUBLIC FLASH_ProgramWord
        PUBLIC FLASH_ReadByte
        PUBLIC FLASH_ReadOptionByte
        PUBLIC FLASH_SetLowPowerMode
        PUBLIC FLASH_SetProgrammingTime
        PUBLIC FLASH_Unlock
        PUBLIC FLASH_WaitForLastOperation

// C:\Users\lun55\Desktop\J19B_STM8\Lib\stm8s_flash.c
//    1 /**
//    2   ******************************************************************************
//    3   * @file    stm8s_flash.c
//    4   * @author  MCD Application Team
//    5   * @version V2.2.0
//    6   * @date    30-September-2014
//    7   * @brief   This file contains all the functions for the FLASH peripheral.
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
//   29 #include "stm8s_flash.h"
//   30 
//   31 /** @addtogroup STM8S_StdPeriph_Driver
//   32   * @{
//   33   */
//   34 /**
//   35 @code
//   36  This driver provides functions to configure and program the Flash memory of all
//   37  STM8S devices.
//   38 
//   39  It includes as well functions that can be either executed from RAM or not, and
//   40  other functions that must be executed from RAM otherwise useless.
//   41 
//   42  The table below lists the functions that can be executed from RAM.
//   43 
//   44  +--------------------------------------------------------------------------------|
//   45  |   Functions prototypes      |    RAM execution            |     Comments       |
//   46  ---------------------------------------------------------------------------------|
//   47  |                             | Mandatory in case of block  | Can be executed    |
//   48  | FLASH_WaitForLastOperation  | Operation:                  | from Flash in case |
//   49  |                             | - Block programming         | of byte and word   |
//   50  |                             | - Block erase               | Operations         |
//   51  |--------------------------------------------------------------------------------|
//   52  | FLASH_ProgramBlock          |       Exclusively           | useless from Flash |
//   53  |--------------------------------------------------------------------------------|
//   54  | FLASH_EraseBlock            |       Exclusively           | useless from Flash |
//   55  |--------------------------------------------------------------------------------|
//   56 
//   57  To be able to execute functions from RAM several steps have to be followed.
//   58  These steps may differ from one toolchain to another.
//   59  A detailed description is available below within this driver.
//   60  You can also refer to the FLASH examples provided within the
//   61  STM8S_StdPeriph_Lib package.
//   62 
//   63 @endcode
//   64 */
//   65 
//   66 
//   67 /* Private typedef -----------------------------------------------------------*/
//   68 /* Private define ------------------------------------------------------------*/
//   69 #define FLASH_CLEAR_BYTE    ((uint8_t)0x00)
//   70 #define FLASH_SET_BYTE      ((uint8_t)0xFF)
//   71 #define OPERATION_TIMEOUT   ((uint16_t)0xFFFF)
//   72 /* Private macro -------------------------------------------------------------*/
//   73 /* Private variables ---------------------------------------------------------*/
//   74 /* Private function prototypes -----------------------------------------------*/
//   75 /* Private Constants ---------------------------------------------------------*/
//   76 
//   77 /** @addtogroup FLASH_Public_functions
//   78   * @{
//   79   */
//   80 
//   81 /**
//   82   * @brief  Unlocks the program or data EEPROM memory
//   83   * @param  FLASH_MemType : Memory type to unlock
//   84   *         This parameter can be a value of @ref FLASH_MemType_TypeDef
//   85   * @retval None
//   86   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//   87 void FLASH_Unlock(FLASH_MemType_TypeDef FLASH_MemType)
//   88 {
FLASH_Unlock:
        PUSH      S:?b8
        LD        S:?b8, A
//   89   /* Check parameter */
//   90   assert_param(IS_MEMORY_TYPE_OK(FLASH_MemType));
        LD        A, S:?b8
        CP        A, #0xfd
        JREQ      L:??FLASH_Unlock_0
        LD        A, S:?b8
        CP        A, #0xf7
        JREQ      L:??FLASH_Unlock_0
        LDW       X, #0x5a
        LDW       S:?w1, X
        CLRW      X
        LDW       S:?w0, X
        LDW       X, #`?<Constant "C:\\\\Users\\\\lun55\\\\Deskto...">`
        CALL      L:assert_failed
//   91   
//   92   /* Unlock program memory */
//   93   if(FLASH_MemType == FLASH_MEMTYPE_PROG)
??FLASH_Unlock_0:
        LD        A, S:?b8
        CP        A, #0xfd
        JRNE      L:??FLASH_Unlock_1
//   94   {
//   95     FLASH->PUKR = FLASH_RASS_KEY1;
        MOV       L:0x5062, #0x56
//   96     FLASH->PUKR = FLASH_RASS_KEY2;
        MOV       L:0x5062, #0xae
        JRA       L:??FLASH_Unlock_2
//   97   }
//   98   /* Unlock data memory */
//   99   else
//  100   {
//  101     FLASH->DUKR = FLASH_RASS_KEY2; /* Warning: keys are reversed on data memory !!! */
??FLASH_Unlock_1:
        MOV       L:0x5064, #0xae
//  102     FLASH->DUKR = FLASH_RASS_KEY1;
        MOV       L:0x5064, #0x56
//  103   }
//  104 }
??FLASH_Unlock_2:
        POP       S:?b8
        RET
//  105 
//  106 /**
//  107   * @brief  Locks the program or data EEPROM memory
//  108   * @param  FLASH_MemType : Memory type
//  109   *         This parameter can be a value of @ref FLASH_MemType_TypeDef
//  110   * @retval None
//  111   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  112 void FLASH_Lock(FLASH_MemType_TypeDef FLASH_MemType)
//  113 {
FLASH_Lock:
        PUSH      S:?b8
        LD        S:?b8, A
//  114   /* Check parameter */
//  115   assert_param(IS_MEMORY_TYPE_OK(FLASH_MemType));
        LD        A, S:?b8
        CP        A, #0xfd
        JREQ      L:??FLASH_Lock_0
        LD        A, S:?b8
        CP        A, #0xf7
        JREQ      L:??FLASH_Lock_0
        LDW       X, #0x73
        LDW       S:?w1, X
        CLRW      X
        LDW       S:?w0, X
        LDW       X, #`?<Constant "C:\\\\Users\\\\lun55\\\\Deskto...">`
        CALL      L:assert_failed
//  116   
//  117   /* Lock memory */
//  118   FLASH->IAPSR &= (uint8_t)FLASH_MemType;
??FLASH_Lock_0:
        LD        A, S:?b8
        AND       A, L:0x505f
        LD        L:0x505f, A
//  119 }
        POP       S:?b8
        RET
//  120 
//  121 /**
//  122   * @brief  DeInitializes the FLASH registers to their default reset values.
//  123   * @param  None
//  124   * @retval None
//  125   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  126 void FLASH_DeInit(void)
//  127 {
//  128   FLASH->CR1 = FLASH_CR1_RESET_VALUE;
FLASH_DeInit:
        MOV       L:0x505a, #0x0
//  129   FLASH->CR2 = FLASH_CR2_RESET_VALUE;
        MOV       L:0x505b, #0x0
//  130   FLASH->NCR2 = FLASH_NCR2_RESET_VALUE;
        MOV       L:0x505c, #0xff
//  131   FLASH->IAPSR &= (uint8_t)(~FLASH_IAPSR_DUL);
        BRES      L:0x505f, #0x3
//  132   FLASH->IAPSR &= (uint8_t)(~FLASH_IAPSR_PUL);
        BRES      L:0x505f, #0x1
//  133   (void) FLASH->IAPSR; /* Reading of this register causes the clearing of status flags */
        LD        A, L:0x505f
//  134 }
        RET
//  135 
//  136 /**
//  137   * @brief  Enables or Disables the Flash interrupt mode
//  138   * @param  NewState : The new state of the flash interrupt mode
//  139   *         This parameter can be a value of @ref FunctionalState enumeration.
//  140   * @retval None
//  141   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  142 void FLASH_ITConfig(FunctionalState NewState)
//  143 {
FLASH_ITConfig:
        PUSH      S:?b8
        LD        S:?b8, A
//  144   /* Check parameter */
//  145   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
        TNZ       S:?b8
        JREQ      L:??FLASH_ITConfig_0
        LD        A, S:?b8
        CP        A, #0x1
        JREQ      L:??FLASH_ITConfig_0
        LDW       X, #0x91
        LDW       S:?w1, X
        CLRW      X
        LDW       S:?w0, X
        LDW       X, #`?<Constant "C:\\\\Users\\\\lun55\\\\Deskto...">`
        CALL      L:assert_failed
//  146   
//  147   if(NewState != DISABLE)
??FLASH_ITConfig_0:
        TNZ       S:?b8
        JREQ      L:??FLASH_ITConfig_1
//  148   {
//  149     FLASH->CR1 |= FLASH_CR1_IE; /* Enables the interrupt sources */
        BSET      L:0x505a, #0x1
        JRA       L:??FLASH_ITConfig_2
//  150   }
//  151   else
//  152   {
//  153     FLASH->CR1 &= (uint8_t)(~FLASH_CR1_IE); /* Disables the interrupt sources */
??FLASH_ITConfig_1:
        BRES      L:0x505a, #0x1
//  154   }
//  155 }
??FLASH_ITConfig_2:
        POP       S:?b8
        RET
//  156 
//  157 /**
//  158   * @brief  Erases one byte in the program or data EEPROM memory
//  159   * @note   PointerAttr define is declared in the stm8s.h file to select if 
//  160   *         the pointer will be declared as near (2 bytes) or far (3 bytes).
//  161   * @param  Address : Address of the byte to erase
//  162   * @retval None
//  163   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  164 void FLASH_EraseByte(uint32_t Address)
//  165 {
FLASH_EraseByte:
        CALL      L:?push_l2
        CALL      L:?mov_l2_l0
//  166   /* Check parameter */
//  167   assert_param(IS_FLASH_ADDRESS_OK(Address));
        CALL      L:?mov_l0_l2
        CALL      L:?sub32_l0_l0_dl
        DATA
        DC32      0x8000
        CODE
        LDW       X, S:?w0
        CPW       X, #0x0
        JRNE      L:??FLASH_EraseByte_0
        LDW       X, S:?w1
        CPW       X, #0x2000
??FLASH_EraseByte_0:
        JRC       L:??FLASH_EraseByte_1
        CALL      L:?mov_l0_l2
        CALL      L:?sub32_l0_l0_dl
        DATA
        DC32      0x4000
        CODE
        LDW       X, S:?w0
        CPW       X, #0x0
        JRNE      L:??FLASH_EraseByte_2
        LDW       X, S:?w1
        CPW       X, #0x280
??FLASH_EraseByte_2:
        JRC       L:??FLASH_EraseByte_1
        LDW       X, #0xa7
        LDW       S:?w1, X
        CLRW      X
        LDW       S:?w0, X
        LDW       X, #`?<Constant "C:\\\\Users\\\\lun55\\\\Deskto...">`
        CALL      L:assert_failed
//  168   
//  169   /* Erase byte */
//  170   *(PointerAttr uint8_t*) (MemoryAddressCast)Address = FLASH_CLEAR_BYTE; 
??FLASH_EraseByte_1:
        CLR       A
        LD        [S:?w5.w], A
//  171 }
        JP        L:?epilogue_l2
//  172 
//  173 /**
//  174   * @brief  Programs one byte in program or data EEPROM memory
//  175   * @note   PointerAttr define is declared in the stm8s.h file to select if 
//  176   *         the pointer will be declared as near (2 bytes) or far (3 bytes).
//  177   * @param  Address : Address where the byte will be programmed
//  178   * @param  Data : Value to be programmed
//  179   * @retval None
//  180   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  181 void FLASH_ProgramByte(uint32_t Address, uint8_t Data)
//  182 {
FLASH_ProgramByte:
        CALL      L:?push_l2
        PUSH      S:?b12
        CALL      L:?mov_l2_l0
        LD        S:?b12, A
//  183   /* Check parameters */
//  184   assert_param(IS_FLASH_ADDRESS_OK(Address));
        CALL      L:?mov_l0_l2
        CALL      L:?sub32_l0_l0_dl
        DATA
        DC32      0x8000
        CODE
        LDW       X, S:?w0
        CPW       X, #0x0
        JRNE      L:??FLASH_ProgramByte_0
        LDW       X, S:?w1
        CPW       X, #0x2000
??FLASH_ProgramByte_0:
        JRC       L:??FLASH_ProgramByte_1
        CALL      L:?mov_l0_l2
        CALL      L:?sub32_l0_l0_dl
        DATA
        DC32      0x4000
        CODE
        LDW       X, S:?w0
        CPW       X, #0x0
        JRNE      L:??FLASH_ProgramByte_2
        LDW       X, S:?w1
        CPW       X, #0x280
??FLASH_ProgramByte_2:
        JRC       L:??FLASH_ProgramByte_1
        LDW       X, #0xb8
        LDW       S:?w1, X
        CLRW      X
        LDW       S:?w0, X
        LDW       X, #`?<Constant "C:\\\\Users\\\\lun55\\\\Deskto...">`
        CALL      L:assert_failed
//  185   *(PointerAttr uint8_t*) (MemoryAddressCast)Address = Data;
??FLASH_ProgramByte_1:
        LD        A, S:?b12
        LD        [S:?w5.w], A
//  186 }
        POP       S:?b12
        JP        L:?epilogue_l2
//  187 
//  188 /**
//  189   * @brief  Reads any byte from flash memory
//  190   * @note   PointerAttr define is declared in the stm8s.h file to select if 
//  191   *         the pointer will be declared as near (2 bytes) or far (3 bytes).
//  192   * @param  Address : Address to read
//  193   * @retval Value of the byte
//  194   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  195 uint8_t FLASH_ReadByte(uint32_t Address)
//  196 {
FLASH_ReadByte:
        CALL      L:?push_l2
        CALL      L:?mov_l2_l0
//  197   /* Check parameter */
//  198   assert_param(IS_FLASH_ADDRESS_OK(Address));
        CALL      L:?mov_l0_l2
        CALL      L:?sub32_l0_l0_dl
        DATA
        DC32      0x8000
        CODE
        LDW       X, S:?w0
        CPW       X, #0x0
        JRNE      L:??FLASH_ReadByte_0
        LDW       X, S:?w1
        CPW       X, #0x2000
??FLASH_ReadByte_0:
        JRC       L:??FLASH_ReadByte_1
        CALL      L:?mov_l0_l2
        CALL      L:?sub32_l0_l0_dl
        DATA
        DC32      0x4000
        CODE
        LDW       X, S:?w0
        CPW       X, #0x0
        JRNE      L:??FLASH_ReadByte_2
        LDW       X, S:?w1
        CPW       X, #0x280
??FLASH_ReadByte_2:
        JRC       L:??FLASH_ReadByte_1
        LDW       X, #0xc6
        LDW       S:?w1, X
        CLRW      X
        LDW       S:?w0, X
        LDW       X, #`?<Constant "C:\\\\Users\\\\lun55\\\\Deskto...">`
        CALL      L:assert_failed
//  199   
//  200   /* Read byte */
//  201   return(*(PointerAttr uint8_t *) (MemoryAddressCast)Address); 
??FLASH_ReadByte_1:
        LDW       X, S:?w5
        LD        A, (X)
        JP        L:?epilogue_l2
//  202 }
//  203 
//  204 /**
//  205   * @brief  Programs one word (4 bytes) in program or data EEPROM memory
//  206   * @note   PointerAttr define is declared in the stm8s.h file to select if 
//  207   *         the pointer will be declared as near (2 bytes) or far (3 bytes).
//  208   * @param  Address : The address where the data will be programmed
//  209   * @param  Data : Value to be programmed
//  210   * @retval None
//  211   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  212 void FLASH_ProgramWord(uint32_t Address, uint32_t Data)
//  213 {
FLASH_ProgramWord:
        CALL      L:?push_l2
        CALL      L:?push_l1
        CALL      L:?mov_l2_l0
//  214   /* Check parameters */
//  215   assert_param(IS_FLASH_ADDRESS_OK(Address));
        CALL      L:?mov_l0_l2
        CALL      L:?sub32_l0_l0_dl
        DATA
        DC32      0x8000
        CODE
        LDW       X, S:?w0
        CPW       X, #0x0
        JRNE      L:??FLASH_ProgramWord_0
        LDW       X, S:?w1
        CPW       X, #0x2000
??FLASH_ProgramWord_0:
        JRC       L:??FLASH_ProgramWord_1
        CALL      L:?mov_l0_l2
        CALL      L:?sub32_l0_l0_dl
        DATA
        DC32      0x4000
        CODE
        LDW       X, S:?w0
        CPW       X, #0x0
        JRNE      L:??FLASH_ProgramWord_2
        LDW       X, S:?w1
        CPW       X, #0x280
??FLASH_ProgramWord_2:
        JRC       L:??FLASH_ProgramWord_1
        LDW       X, #0xd7
        LDW       S:?w1, X
        CLRW      X
        LDW       S:?w0, X
        LDW       X, #`?<Constant "C:\\\\Users\\\\lun55\\\\Deskto...">`
        CALL      L:assert_failed
//  216   
//  217   /* Enable Word Write Once */
//  218   FLASH->CR2 |= FLASH_CR2_WPRG;
??FLASH_ProgramWord_1:
        BSET      L:0x505b, #0x6
//  219   FLASH->NCR2 &= (uint8_t)(~FLASH_NCR2_NWPRG);
        BRES      L:0x505c, #0x6
//  220   
//  221   /* Write one byte - from lowest address*/
//  222   *((PointerAttr uint8_t*)(MemoryAddressCast)Address)       = *((uint8_t*)(&Data));
        LD        A, (0x1,SP)
        LD        [S:?w5.w], A
//  223   /* Write one byte*/
//  224   *(((PointerAttr uint8_t*)(MemoryAddressCast)Address) + 1) = *((uint8_t*)(&Data)+1); 
        LDW       X, S:?w5
        INCW      X
        LD        A, (0x2,SP)
        LD        (X), A
//  225   /* Write one byte*/    
//  226   *(((PointerAttr uint8_t*)(MemoryAddressCast)Address) + 2) = *((uint8_t*)(&Data)+2); 
        LDW       X, S:?w5
        ADDW      X, #0x2
        LD        A, (0x3,SP)
        LD        (X), A
//  227   /* Write one byte - from higher address*/
//  228   *(((PointerAttr uint8_t*)(MemoryAddressCast)Address) + 3) = *((uint8_t*)(&Data)+3); 
        LDW       X, S:?w5
        ADDW      X, #0x3
        LD        A, (0x4,SP)
        LD        (X), A
//  229 }
        ADD       SP, #0x4
        JP        L:?epilogue_l2
//  230 
//  231 /**
//  232   * @brief  Programs option byte
//  233   * @param  Address : option byte address to program
//  234   * @param  Data : Value to write
//  235   * @retval None
//  236   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  237 void FLASH_ProgramOptionByte(uint16_t Address, uint8_t Data)
//  238 {
FLASH_ProgramOptionByte:
        CALL      L:?push_w4
        PUSH      S:?b10
        LDW       S:?w4, X
        LD        S:?b10, A
//  239   /* Check parameter */
//  240   assert_param(IS_OPTION_BYTE_ADDRESS_OK(Address));
        LDW       X, S:?w4
        SUBW      X, #0x4800
        CPW       X, #0x80
        JRC       L:??FLASH_ProgramOptionByte_0
        LDW       X, #0xf0
        LDW       S:?w1, X
        CLRW      X
        LDW       S:?w0, X
        LDW       X, #`?<Constant "C:\\\\Users\\\\lun55\\\\Deskto...">`
        CALL      L:assert_failed
//  241   
//  242   /* Enable write access to option bytes */
//  243   FLASH->CR2 |= FLASH_CR2_OPT;
??FLASH_ProgramOptionByte_0:
        BSET      L:0x505b, #0x7
//  244   FLASH->NCR2 &= (uint8_t)(~FLASH_NCR2_NOPT);
        BRES      L:0x505c, #0x7
//  245   
//  246   /* check if the option byte to program is ROP*/
//  247   if(Address == 0x4800)
        LDW       X, S:?w4
        CPW       X, #0x4800
        JRNE      L:??FLASH_ProgramOptionByte_1
//  248   {
//  249     /* Program option byte*/
//  250     *((NEAR uint8_t*)Address) = Data;
        LD        A, S:?b10
        LD        [S:?w4.w], A
        JRA       L:??FLASH_ProgramOptionByte_2
//  251   }
//  252   else
//  253   {
//  254     /* Program option byte and his complement */
//  255     *((NEAR uint8_t*)Address) = Data;
??FLASH_ProgramOptionByte_1:
        LD        A, S:?b10
        LD        [S:?w4.w], A
//  256     *((NEAR uint8_t*)((uint16_t)(Address + 1))) = (uint8_t)(~Data);
        LDW       X, S:?w4
        INCW      X
        CPL       S:?b10
        LD        A, S:?b10
        LD        (X), A
//  257   }
//  258   FLASH_WaitForLastOperation(FLASH_MEMTYPE_PROG);
??FLASH_ProgramOptionByte_2:
        LD        A, #0xfd
        CALL      L:FLASH_WaitForLastOperation
//  259   
//  260   /* Disable write access to option bytes */
//  261   FLASH->CR2 &= (uint8_t)(~FLASH_CR2_OPT);
        BRES      L:0x505b, #0x7
//  262   FLASH->NCR2 |= FLASH_NCR2_NOPT;
        BSET      L:0x505c, #0x7
//  263 }
        POP       S:?b10
        JP        L:?epilogue_w4
//  264 
//  265 /**
//  266   * @brief  Erases option byte
//  267   * @param  Address : Option byte address to erase
//  268   * @retval None
//  269   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  270 void FLASH_EraseOptionByte(uint16_t Address)
//  271 {
FLASH_EraseOptionByte:
        CALL      L:?push_w4
        LDW       S:?w4, X
//  272   /* Check parameter */
//  273   assert_param(IS_OPTION_BYTE_ADDRESS_OK(Address));
        LDW       X, S:?w4
        SUBW      X, #0x4800
        CPW       X, #0x80
        JRC       L:??FLASH_EraseOptionByte_0
        LDW       X, #0x111
        LDW       S:?w1, X
        CLRW      X
        LDW       S:?w0, X
        LDW       X, #`?<Constant "C:\\\\Users\\\\lun55\\\\Deskto...">`
        CALL      L:assert_failed
//  274   
//  275   /* Enable write access to option bytes */
//  276   FLASH->CR2 |= FLASH_CR2_OPT;
??FLASH_EraseOptionByte_0:
        BSET      L:0x505b, #0x7
//  277   FLASH->NCR2 &= (uint8_t)(~FLASH_NCR2_NOPT);
        BRES      L:0x505c, #0x7
//  278   
//  279   /* check if the option byte to erase is ROP */
//  280   if(Address == 0x4800)
        LDW       X, S:?w4
        CPW       X, #0x4800
        JRNE      L:??FLASH_EraseOptionByte_1
//  281   {
//  282     /* Erase option byte */
//  283     *((NEAR uint8_t*)Address) = FLASH_CLEAR_BYTE;
        CLR       A
        LD        [S:?w4.w], A
        JRA       L:??FLASH_EraseOptionByte_2
//  284   }
//  285   else
//  286   {
//  287     /* Erase option byte and his complement */
//  288     *((NEAR uint8_t*)Address) = FLASH_CLEAR_BYTE;
??FLASH_EraseOptionByte_1:
        CLR       A
        LD        [S:?w4.w], A
//  289     *((NEAR uint8_t*)((uint16_t)(Address + (uint16_t)1 ))) = FLASH_SET_BYTE;
        LDW       X, S:?w4
        INCW      X
        LD        A, #0xff
        LD        (X), A
//  290   }
//  291   FLASH_WaitForLastOperation(FLASH_MEMTYPE_PROG);
??FLASH_EraseOptionByte_2:
        LD        A, #0xfd
        CALL      L:FLASH_WaitForLastOperation
//  292   
//  293   /* Disable write access to option bytes */
//  294   FLASH->CR2 &= (uint8_t)(~FLASH_CR2_OPT);
        BRES      L:0x505b, #0x7
//  295   FLASH->NCR2 |= FLASH_NCR2_NOPT;
        BSET      L:0x505c, #0x7
//  296 }
        JP        L:?epilogue_w4
//  297 
//  298 /**
//  299   * @brief  Reads one option byte
//  300   * @param  Address  option byte address to read.
//  301   * @retval Option byte read value + its complement
//  302   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  303 uint16_t FLASH_ReadOptionByte(uint16_t Address)
//  304 {
FLASH_ReadOptionByte:
        CALL      L:?push_w4
        LDW       S:?w4, X
//  305   uint8_t value_optbyte, value_optbyte_complement = 0;
        CLR       S:?b0
//  306   uint16_t res_value = 0;
        CLRW      Y
//  307   
//  308   /* Check parameter */
//  309   assert_param(IS_OPTION_BYTE_ADDRESS_OK(Address));
        LDW       X, S:?w4
        SUBW      X, #0x4800
        CPW       X, #0x80
        JRC       L:??FLASH_ReadOptionByte_0
        LDW       X, #0x135
        LDW       S:?w1, X
        CLRW      X
        LDW       S:?w0, X
        LDW       X, #`?<Constant "C:\\\\Users\\\\lun55\\\\Deskto...">`
        CALL      L:assert_failed
//  310     
//  311   value_optbyte = *((NEAR uint8_t*)Address); /* Read option byte */
??FLASH_ReadOptionByte_0:
        LD        A, [S:?w4.w]
        LD        S:?b1, A
//  312   value_optbyte_complement = *(((NEAR uint8_t*)Address) + 1); /* Read option byte complement */
        LDW       X, S:?w4
        INCW      X
        LD        A, (X)
        LD        S:?b0, A
//  313   
//  314   /* Read-out protection option byte */
//  315   if(Address == 0x4800)	 
        LDW       X, S:?w4
        CPW       X, #0x4800
        JRNE      L:??FLASH_ReadOptionByte_1
//  316   {
//  317     res_value =	 value_optbyte;
        CLRW      X
        EXG       A, XL
        LD        A, S:?b1
        EXG       A, XL
        LDW       Y, X
        JRA       L:??FLASH_ReadOptionByte_2
//  318   }
//  319   else
//  320   {
//  321     if(value_optbyte == (uint8_t)(~value_optbyte_complement))
??FLASH_ReadOptionByte_1:
        LD        A, S:?b0
        CPL       A
        CP        A, S:?b1
        JRNE      L:??FLASH_ReadOptionByte_3
//  322     {
//  323       res_value = (uint16_t)((uint16_t)value_optbyte << 8);
        CLRW      X
        EXG       A, XL
        LD        A, S:?b1
        EXG       A, XL
        CLR       A
        RLWA      X, A
        LDW       Y, X
//  324       res_value = res_value | (uint16_t)value_optbyte_complement;
        CLRW      X
        EXG       A, XL
        LD        A, S:?b0
        EXG       A, XL
        LDW       S:?w0, X
        LDW       X, Y
        RRWA      X, A
        OR        A, S:?b1
        RRWA      X, A
        OR        A, S:?b0
        RRWA      X, A
        LDW       Y, X
        JRA       L:??FLASH_ReadOptionByte_2
//  325     }
//  326     else
//  327     {
//  328       res_value = FLASH_OPTIONBYTE_ERROR;
??FLASH_ReadOptionByte_3:
        LDW       X, #0x5555
        LDW       Y, X
//  329     }
//  330   }
//  331   return(res_value);
??FLASH_ReadOptionByte_2:
        LDW       X, Y
        JP        L:?epilogue_w4
//  332 }
//  333 
//  334 /**
//  335   * @brief  Select the Flash behaviour in low power mode
//  336   * @param  FLASH_LPMode Low power mode selection
//  337   *         This parameter can be any of the @ref FLASH_LPMode_TypeDef values.
//  338   * @retval None
//  339   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  340 void FLASH_SetLowPowerMode(FLASH_LPMode_TypeDef FLASH_LPMode)
//  341 {
FLASH_SetLowPowerMode:
        PUSH      S:?b8
        LD        S:?b8, A
//  342   /* Check parameter */
//  343   assert_param(IS_FLASH_LOW_POWER_MODE_OK(FLASH_LPMode));
        LD        A, S:?b8
        CP        A, #0x4
        JREQ      L:??FLASH_SetLowPowerMode_0
        LD        A, S:?b8
        CP        A, #0x8
        JREQ      L:??FLASH_SetLowPowerMode_0
        TNZ       S:?b8
        JREQ      L:??FLASH_SetLowPowerMode_0
        LD        A, S:?b8
        CP        A, #0xc
        JREQ      L:??FLASH_SetLowPowerMode_0
        LDW       X, #0x157
        LDW       S:?w1, X
        CLRW      X
        LDW       S:?w0, X
        LDW       X, #`?<Constant "C:\\\\Users\\\\lun55\\\\Deskto...">`
        CALL      L:assert_failed
//  344   
//  345   /* Clears the two bits */
//  346   FLASH->CR1 &= (uint8_t)(~(FLASH_CR1_HALT | FLASH_CR1_AHALT)); 
??FLASH_SetLowPowerMode_0:
        LD        A, L:0x505a
        AND       A, #0xf3
        LD        L:0x505a, A
//  347   
//  348   /* Sets the new mode */
//  349   FLASH->CR1 |= (uint8_t)FLASH_LPMode; 
        LD        A, S:?b8
        OR        A, L:0x505a
        LD        L:0x505a, A
//  350 }
        POP       S:?b8
        RET
//  351 
//  352 /**
//  353   * @brief  Sets the fixed programming time
//  354   * @param  FLASH_ProgTime Indicates the programming time to be fixed
//  355   *         This parameter can be any of the @ref FLASH_ProgramTime_TypeDef values.
//  356   * @retval None
//  357   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  358 void FLASH_SetProgrammingTime(FLASH_ProgramTime_TypeDef FLASH_ProgTime)
//  359 {
FLASH_SetProgrammingTime:
        PUSH      S:?b8
        LD        S:?b8, A
//  360   /* Check parameter */
//  361   assert_param(IS_FLASH_PROGRAM_TIME_OK(FLASH_ProgTime));
        TNZ       S:?b8
        JREQ      L:??FLASH_SetProgrammingTime_0
        LD        A, S:?b8
        CP        A, #0x1
        JREQ      L:??FLASH_SetProgrammingTime_0
        LDW       X, #0x169
        LDW       S:?w1, X
        CLRW      X
        LDW       S:?w0, X
        LDW       X, #`?<Constant "C:\\\\Users\\\\lun55\\\\Deskto...">`
        CALL      L:assert_failed
//  362   
//  363   FLASH->CR1 &= (uint8_t)(~FLASH_CR1_FIX);
??FLASH_SetProgrammingTime_0:
        BRES      L:0x505a, #0x0
//  364   FLASH->CR1 |= (uint8_t)FLASH_ProgTime;
        LD        A, S:?b8
        OR        A, L:0x505a
        LD        L:0x505a, A
//  365 }
        POP       S:?b8
        RET
//  366 
//  367 /**
//  368   * @brief  Returns the Flash behaviour type in low power mode
//  369   * @param  None
//  370   * @retval FLASH_LPMode_TypeDef Flash behaviour type in low power mode
//  371   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  372 FLASH_LPMode_TypeDef FLASH_GetLowPowerMode(void)
//  373 {
//  374   return((FLASH_LPMode_TypeDef)(FLASH->CR1 & (uint8_t)(FLASH_CR1_HALT | FLASH_CR1_AHALT)));
FLASH_GetLowPowerMode:
        LD        A, L:0x505a
        AND       A, #0xc
        RET
//  375 }
//  376 
//  377 /**
//  378   * @brief  Returns the fixed programming time
//  379   * @param  None
//  380   * @retval FLASH_ProgramTime_TypeDef Fixed programming time value
//  381   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  382 FLASH_ProgramTime_TypeDef FLASH_GetProgrammingTime(void)
//  383 {
//  384   return((FLASH_ProgramTime_TypeDef)(FLASH->CR1 & FLASH_CR1_FIX));
FLASH_GetProgrammingTime:
        LD        A, L:0x505a
        AND       A, #0x1
        RET
//  385 }
//  386 
//  387 /**
//  388   * @brief  Returns the Boot memory size in bytes
//  389   * @param  None
//  390   * @retval Boot memory size in bytes
//  391   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  392 uint32_t FLASH_GetBootSize(void)
//  393 {
FLASH_GetBootSize:
        CALL      L:?push_l2
//  394   uint32_t temp = 0;
        CLRW      X
        LDW       S:?w5, X
        LDW       S:?w4, X
//  395   
//  396   /* Calculates the number of bytes */
//  397   temp = (uint32_t)((uint32_t)FLASH->FPR * (uint32_t)512);
        LD        A, L:0x505d
        CLRW      X
        LD        XL, A
        LDW       S:?w1, X
        CLRW      X
        LDW       S:?w0, X
        CALL      L:?mul32_l0_l0_dl
        DATA
        DC32      0x200
        CODE
        CALL      L:?mov_l2_l0
//  398   
//  399   /* Correction because size of 127.5 kb doesn't exist */
//  400   if(FLASH->FPR == 0xFF)
        LD        A, L:0x505d
        CP        A, #0xff
        JRNE      L:??FLASH_GetBootSize_0
//  401   {
//  402     temp += 512;
        CALL      L:?mov_l0_l2
        CALL      L:?add32_l0_l0_dl
        DATA
        DC32      0x200
        CODE
        CALL      L:?mov_l2_l0
//  403   }
//  404   
//  405   /* Return value */
//  406   return(temp);
??FLASH_GetBootSize_0:
        CALL      L:?mov_l0_l2
        JP        L:?epilogue_l2
//  407 }
//  408 
//  409 /**
//  410   * @brief  Checks whether the specified SPI flag is set or not.
//  411   * @param  FLASH_FLAG : Specifies the flag to check.
//  412   *         This parameter can be any of the @ref FLASH_Flag_TypeDef enumeration.
//  413   * @retval FlagStatus : Indicates the state of FLASH_FLAG.
//  414   *         This parameter can be any of the @ref FlagStatus enumeration.
//  415   * @note   This function can clear the EOP, WR_PG_DIS flags in the IAPSR register.
//  416   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  417 FlagStatus FLASH_GetFlagStatus(FLASH_Flag_TypeDef FLASH_FLAG)
//  418 {
FLASH_GetFlagStatus:
        PUSH      S:?b8
        LD        S:?b8, A
//  419   FlagStatus status = RESET;
        CLR       S:?b0
//  420   /* Check parameters */
//  421   assert_param(IS_FLASH_FLAGS_OK(FLASH_FLAG));
        LD        A, S:?b8
        CP        A, #0x8
        JREQ      L:??FLASH_GetFlagStatus_0
        LD        A, S:?b8
        CP        A, #0x4
        JREQ      L:??FLASH_GetFlagStatus_0
        LD        A, S:?b8
        CP        A, #0x2
        JREQ      L:??FLASH_GetFlagStatus_0
        LD        A, S:?b8
        CP        A, #0x1
        JREQ      L:??FLASH_GetFlagStatus_0
        LDW       X, #0x1a5
        LDW       S:?w1, X
        CLRW      X
        LDW       S:?w0, X
        LDW       X, #`?<Constant "C:\\\\Users\\\\lun55\\\\Deskto...">`
        CALL      L:assert_failed
//  422   
//  423   /* Check the status of the specified FLASH flag */
//  424   if((FLASH->IAPSR & (uint8_t)FLASH_FLAG) != (uint8_t)RESET)
??FLASH_GetFlagStatus_0:
        LD        A, S:?b8
        AND       A, L:0x505f
        CP        A, #0x0
        JREQ      L:??FLASH_GetFlagStatus_1
//  425   {
//  426     status = SET; /* FLASH_FLAG is set */
        MOV       S:?b0, #0x1
        JRA       L:??FLASH_GetFlagStatus_2
//  427   }
//  428   else
//  429   {
//  430     status = RESET; /* FLASH_FLAG is reset*/
??FLASH_GetFlagStatus_1:
        CLR       S:?b0
//  431   }
//  432   
//  433   /* Return the FLASH_FLAG status */
//  434   return status;
??FLASH_GetFlagStatus_2:
        LD        A, S:?b0
        POP       S:?b8
        RET
//  435 }
//  436 
//  437 /**
//  438 @code
//  439  All the functions defined below must be executed from RAM exclusively, except
//  440  for the FLASH_WaitForLastOperation function which can be executed from Flash.
//  441 
//  442  Steps of the execution from RAM differs from one toolchain to another:
//  443  - For Cosmic Compiler:
//  444     1- Define a segment FLASH_CODE by the mean of " #pragma section (FLASH_CODE)".
//  445     This segment is defined in the stm8s_flash.c file.
//  446   2- Uncomment the "#define RAM_EXECUTION  (1)" line in the stm8s.h file,
//  447     or define it in Cosmic compiler preprocessor to enable the FLASH_CODE segment
//  448    definition.
//  449   3- In STVD Select Project\Settings\Linker\Category "input" and in the RAM section
//  450     add the FLASH_CODE segment with "-ic" options.
//  451   4- In main.c file call the _fctcpy() function with first segment character as 
//  452     parameter "_fctcpy('F');" to load the declared moveable code segment
//  453     (FLASH_CODE) in RAM before execution.
//  454   5- By default the _fctcpy function is packaged in the Cosmic machine library,
//  455     so the function prototype "int _fctcopy(char name);" must be added in main.c
//  456     file.
//  457 
//  458   - For Raisonance Compiler
//  459    1- Use the inram keyword in the function declaration to specify that it can be
//  460     executed from RAM.
//  461     This is done within the stm8s_flash.c file, and it's conditioned by 
//  462     RAM_EXECUTION definition.
//  463    2- Uncomment the "#define RAM_EXECUTION  (1)" line in the stm8s.h file, or 
//  464    define it in Raisonance compiler preprocessor to enable the access for the 
//  465    inram functions.
//  466    3- An inram function code is copied from Flash to RAM by the C startup code. 
//  467    In some applications, the RAM area where the code was initially stored may be
//  468    erased or corrupted, so it may be desirable to perform the copy again. 
//  469    Depending on the application memory model, the memcpy() or fmemcpy() functions
//  470    should be used to perform the copy.
//  471       • In case your project uses the SMALL memory model (code smaller than 64K),
//  472        memcpy()function is recommended to perform the copy
//  473       • In case your project uses the LARGE memory model, functions can be 
//  474       everywhere in the 24-bits address space (not limited to the first 64KB of
//  475       code), In this case, the use of memcpy() function will not be appropriate,
//  476       you need to use the specific fmemcpy() function (which copies objects with
//  477       24-bit addresses).
//  478       - The linker automatically defines 2 symbols for each inram function:
//  479            • __address__functionname is a symbol that holds the Flash address 
//  480            where the given function code is stored.
//  481            • __size__functionname is a symbol that holds the function size in bytes.
//  482      And we already have the function address (which is itself a pointer)
//  483   4- In main.c file these two steps should be performed for each inram function:
//  484      • Import the "__address__functionname" and "__size__functionname" symbols
//  485        as global variables:
//  486          extern int __address__functionname; // Symbol holding the flash address
//  487          extern int __size__functionname;    // Symbol holding the function size
//  488      • In case of SMALL memory model use, Call the memcpy() function to copy the
//  489       inram function to the RAM destination address:
//  490                 memcpy(functionname, // RAM destination address
//  491                       (void*)&__address__functionname, // Flash source address
//  492                       (int)&__size__functionname); // Code size of the function
//  493      • In case of LARGE memory model use, call the fmemcpy() function to copy 
//  494      the inram function to the RAM destination address:
//  495                  memcpy(functionname, // RAM destination address
//  496                       (void @far*)&__address__functionname, // Flash source address
//  497                       (int)&__size__functionname); // Code size of the function
//  498 
//  499  - For IAR Compiler:
//  500     1- Use the __ramfunc keyword in the function declaration to specify that it 
//  501     can be executed from RAM.
//  502     This is done within the stm8s_flash.c file, and it's conditioned by 
//  503     RAM_EXECUTION definition.
//  504     2- Uncomment the "#define RAM_EXECUTION  (1)" line in the stm8s.h file, or 
//  505    define it in IAR compiler preprocessor to enable the access for the 
//  506    __ramfunc functions.
//  507 
//  508  - Note: 
//  509     1- Ignore the IAR compiler warnings, these warnings don't impact the FLASH Program/Erase
//  510     operations.
//  511     The code performing the Flash Program/erase must be executed from RAM; the variables
//  512     initializations don't necessary require the execution from RAM, only CR2/NCR2 registers 
//  513     configuration and data programing must be executed from RAM.
//  514     2- These warnings depends on IAR compiler: as the code generation is made using many
//  515     runtime library functions to keep code size to a minimum.
//  516     3- It is recommended to use High Speed Optimization with IAR (-Ohs), in order 
//  517     to reduce the runtime library calls in the generated code.
//  518 
//  519 
//  520 
//  521  The FLASH examples given within the STM8S_StdPeriph_Lib package, details all 
//  522  the steps described above.
//  523 
//  524 @endcode
//  525 */
//  526 
//  527 /**
//  528   * @brief
//  529   *******************************************************************************
//  530   *                         Execution from RAM enable
//  531   *******************************************************************************
//  532   *
//  533   * To enable execution from RAM you can either uncomment the following define 
//  534   * in the stm8s.h file or define it in your toolchain compiler preprocessor
//  535   * - #define RAM_EXECUTION  (1) 
//  536   */
//  537   
//  538 #if defined (_COSMIC_) && defined (RAM_EXECUTION)
//  539  #pragma section (FLASH_CODE)
//  540 #endif  /* _COSMIC_ && RAM_EXECUTION */
//  541 /**
//  542   * @brief  Wait for a Flash operation to complete.
//  543   * @note   The call and execution of this function must be done from RAM in case
//  544   *         of Block operation.
//  545   * @param  FLASH_MemType : Memory type
//  546   *         This parameter can be a value of @ref FLASH_MemType_TypeDef
//  547   * @retval FLASH status
//  548   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  549 IN_RAM(FLASH_Status_TypeDef FLASH_WaitForLastOperation(FLASH_MemType_TypeDef FLASH_MemType)) 
//  550 {
//  551   uint8_t flagstatus = 0x00;
FLASH_WaitForLastOperation:
        CLR       A
//  552   uint16_t timeout = OPERATION_TIMEOUT;
        CLRW      X
        DECW      X
        JRA       L:??FLASH_WaitForLastOperation_0
//  553   
//  554   /* Wait until operation completion or write protection page occurred */
//  555 #if defined (STM8S208) || defined(STM8S207) || defined(STM8S007) || defined(STM8S105) || \ 
//  556   defined(STM8S005) || defined(STM8AF52Ax) || defined(STM8AF62Ax) || defined(STM8AF626x)  
//  557     if(FLASH_MemType == FLASH_MEMTYPE_PROG)
//  558     {
//  559       while((flagstatus == 0x00) && (timeout != 0x00))
//  560       {
//  561         flagstatus = (uint8_t)(FLASH->IAPSR & (uint8_t)(FLASH_IAPSR_EOP |
//  562                                                         FLASH_IAPSR_WR_PG_DIS));
//  563         timeout--;
//  564       }
//  565     }
//  566     else
//  567     {
//  568       while((flagstatus == 0x00) && (timeout != 0x00))
//  569       {
//  570         flagstatus = (uint8_t)(FLASH->IAPSR & (uint8_t)(FLASH_IAPSR_HVOFF |
//  571                                                         FLASH_IAPSR_WR_PG_DIS));
//  572         timeout--;
//  573       }
//  574     }
//  575 #else /*STM8S103, STM8S903, STM8AF622x */
//  576   while((flagstatus == 0x00) && (timeout != 0x00))
//  577   {
//  578     flagstatus = (uint8_t)(FLASH->IAPSR & (FLASH_IAPSR_EOP | FLASH_IAPSR_WR_PG_DIS));
??FLASH_WaitForLastOperation_1:
        LD        A, L:0x505f
        AND       A, #0x5
//  579     timeout--;
        DECW      X
//  580   }
??FLASH_WaitForLastOperation_0:
        TNZ       A
        JRNE      L:??FLASH_WaitForLastOperation_2
        TNZW      X
        JRNE      L:??FLASH_WaitForLastOperation_1
//  581 #endif /* STM8S208, STM8S207, STM8S105, STM8AF52Ax, STM8AF62Ax, STM8AF262x */
//  582   
//  583   if(timeout == 0x00 )
??FLASH_WaitForLastOperation_2:
        TNZW      X
        JRNE      L:??FLASH_WaitForLastOperation_3
//  584   {
//  585     flagstatus = FLASH_STATUS_TIMEOUT;
        LD        A, #0x2
//  586   }
//  587   
//  588   return((FLASH_Status_TypeDef)flagstatus);
??FLASH_WaitForLastOperation_3:
        RET
//  589 }
//  590 
//  591 /**
//  592   * @brief  Erases a block in the program or data memory.
//  593   * @note   This function should be executed from RAM.
//  594   * @param  FLASH_MemType :  The type of memory to erase
//  595   * @param  BlockNum : Indicates the block number to erase
//  596   * @retval None.
//  597   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  598 IN_RAM(void FLASH_EraseBlock(uint16_t BlockNum, FLASH_MemType_TypeDef FLASH_MemType))
//  599 {
FLASH_EraseBlock:
        CALL      L:?push_w4
        PUSH      S:?b10
        LDW       S:?w4, X
        LD        S:?b10, A
//  600   uint32_t startaddress = 0;
        CLRW      X
        LDW       S:?w3, X
        LDW       S:?w2, X
//  601   
//  602 #if defined(STM8S105) || defined(STM8S005) || defined(STM8S103) || defined(STM8S003) || \ 
//  603   defined (STM8S903) || defined (STM8AF626x) || defined (STM8AF622x)
//  604     uint32_t PointerAttr  *pwFlash;
//  605 #elif defined (STM8S208) || defined(STM8S207) || defined(STM8S007) || defined (STM8AF62Ax) || defined (STM8AF52Ax) 
//  606   uint8_t PointerAttr  *pwFlash;
//  607 #endif
//  608   
//  609   /* Check parameters */
//  610   assert_param(IS_MEMORY_TYPE_OK(FLASH_MemType));
        LD        A, S:?b10
        CP        A, #0xfd
        JREQ      L:??FLASH_EraseBlock_0
        LD        A, S:?b10
        CP        A, #0xf7
        JREQ      L:??FLASH_EraseBlock_0
        LDW       X, #0x262
        LDW       S:?w1, X
        CLRW      X
        LDW       S:?w0, X
        LDW       X, #`?<Constant "C:\\\\Users\\\\lun55\\\\Deskto...">`
        CALL      L:assert_failed
//  611   if(FLASH_MemType == FLASH_MEMTYPE_PROG)
??FLASH_EraseBlock_0:
        LD        A, S:?b10
        CP        A, #0xfd
        JRNE      L:??FLASH_EraseBlock_1
//  612   {
//  613     assert_param(IS_FLASH_PROG_BLOCK_NUMBER_OK(BlockNum));
        LDW       X, S:?w4
        CPW       X, #0x80
        JRC       L:??FLASH_EraseBlock_2
        LDW       X, #0x265
        LDW       S:?w1, X
        CLRW      X
        LDW       S:?w0, X
        LDW       X, #`?<Constant "C:\\\\Users\\\\lun55\\\\Deskto...">`
        CALL      L:assert_failed
//  614     startaddress = FLASH_PROG_START_PHYSICAL_ADDRESS;
??FLASH_EraseBlock_2:
        LDW       X, #0x8000
        LDW       S:?w3, X
        SLLW      X
        LDW       S:?w2, X
        JRA       L:??FLASH_EraseBlock_3
//  615   }
//  616   else
//  617   {
//  618     assert_param(IS_FLASH_DATA_BLOCK_NUMBER_OK(BlockNum));
??FLASH_EraseBlock_1:
        LDW       X, S:?w4
        CPW       X, #0xa
        JRC       L:??FLASH_EraseBlock_4
        LDW       X, #0x26a
        LDW       S:?w1, X
        CLRW      X
        LDW       S:?w0, X
        LDW       X, #`?<Constant "C:\\\\Users\\\\lun55\\\\Deskto...">`
        CALL      L:assert_failed
//  619     startaddress = FLASH_DATA_START_PHYSICAL_ADDRESS;
??FLASH_EraseBlock_4:
        LDW       X, #0x4000
        LDW       S:?w3, X
        CLRW      X
        LDW       S:?w2, X
//  620   }
//  621   
//  622   /* Point to the first block address */
//  623 #if defined (STM8S208) || defined(STM8S207) || defined(STM8S007) || defined (STM8AF62Ax) || defined (STM8AF52Ax)
//  624   pwFlash = (PointerAttr uint8_t *)(MemoryAddressCast)(startaddress + ((uint32_t)BlockNum * FLASH_BLOCK_SIZE));
//  625 #elif defined(STM8S105) || defined(STM8S005) || defined(STM8S103) || defined(STM8S003) || \ 
//  626   defined (STM8S903) || defined (STM8AF626x) || defined (STM8AF622x)
//  627     pwFlash = (PointerAttr uint32_t *)(MemoryAddressCast)(startaddress + ((uint32_t)BlockNum * FLASH_BLOCK_SIZE));
??FLASH_EraseBlock_3:
        LDW       X, #0x40
        LDW       S:?w0, X
        LDW       X, S:?w4
        CALL      L:?mul16_x_x_w0
        LDW       Y, S:?w3
        LDW       S:?w0, X
        ADDW      Y, S:?w0
//  628 #endif	/* STM8S208, STM8S207 */
//  629   
//  630   /* Enable erase block mode */
//  631   FLASH->CR2 |= FLASH_CR2_ERASE;
        BSET      L:0x505b, #0x5
//  632   FLASH->NCR2 &= (uint8_t)(~FLASH_NCR2_NERASE);
        BRES      L:0x505c, #0x5
//  633   
//  634 #if defined(STM8S105) || defined(STM8S005) || defined(STM8S103) || defined(STM8S003) ||  \ 
//  635   defined (STM8S903) || defined (STM8AF626x) || defined (STM8AF622x)
//  636     *pwFlash = (uint32_t)0;
        CLRW      X
        LDW       S:?w1, X
        LDW       S:?w0, X
        LDW       X, Y
        CALL      L:?load32_0x_l0
//  637 #elif defined (STM8S208) || defined(STM8S207) || defined(STM8S007) || defined (STM8AF62Ax) || \ 
//  638   defined (STM8AF52Ax)
//  639     *pwFlash = (uint8_t)0;
//  640   *(pwFlash + 1) = (uint8_t)0;
//  641   *(pwFlash + 2) = (uint8_t)0;
//  642   *(pwFlash + 3) = (uint8_t)0;    
//  643 #endif
//  644 }
        POP       S:?b10
        JP        L:?epilogue_w4
//  645 
//  646 /**
//  647   * @brief  Programs a memory block
//  648   * @note   This function should be executed from RAM.
//  649   * @param  FLASH_MemType : The type of memory to program
//  650   * @param  BlockNum : The block number
//  651   * @param  FLASH_ProgMode : The programming mode.
//  652   * @param  Buffer : Pointer to buffer containing source data.
//  653   * @retval None.
//  654   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  655 IN_RAM(void FLASH_ProgramBlock(uint16_t BlockNum, FLASH_MemType_TypeDef FLASH_MemType, 
//  656                         FLASH_ProgramMode_TypeDef FLASH_ProgMode, uint8_t *Buffer))
//  657 {
FLASH_ProgramBlock:
        CALL      L:?push_l2
        CALL      L:?push_l3
        PUSHW     Y
        LDW       S:?w5, X
        LD        S:?b8, A
        MOV       S:?b9, S:?b0
//  658   uint16_t Count = 0;
        CLR       S:?b1
        CLR       S:?b0
//  659   uint32_t startaddress = 0;
        CLRW      X
        LDW       S:?w7, X
        LDW       S:?w6, X
//  660   
//  661   /* Check parameters */
//  662   assert_param(IS_MEMORY_TYPE_OK(FLASH_MemType));
        LD        A, S:?b8
        CP        A, #0xfd
        JREQ      L:??FLASH_ProgramBlock_0
        LD        A, S:?b8
        CP        A, #0xf7
        JREQ      L:??FLASH_ProgramBlock_0
        LDW       X, #0x296
        LDW       S:?w1, X
        CLRW      X
        LDW       S:?w0, X
        LDW       X, #`?<Constant "C:\\\\Users\\\\lun55\\\\Deskto...">`
        CALL      L:assert_failed
//  663   assert_param(IS_FLASH_PROGRAM_MODE_OK(FLASH_ProgMode));
??FLASH_ProgramBlock_0:
        TNZ       S:?b9
        JREQ      L:??FLASH_ProgramBlock_1
        LD        A, S:?b9
        CP        A, #0x10
        JREQ      L:??FLASH_ProgramBlock_1
        LDW       X, #0x297
        LDW       S:?w1, X
        CLRW      X
        LDW       S:?w0, X
        LDW       X, #`?<Constant "C:\\\\Users\\\\lun55\\\\Deskto...">`
        CALL      L:assert_failed
//  664   if(FLASH_MemType == FLASH_MEMTYPE_PROG)
??FLASH_ProgramBlock_1:
        LD        A, S:?b8
        CP        A, #0xfd
        JRNE      L:??FLASH_ProgramBlock_2
//  665   {
//  666     assert_param(IS_FLASH_PROG_BLOCK_NUMBER_OK(BlockNum));
        LDW       X, S:?w5
        CPW       X, #0x80
        JRC       L:??FLASH_ProgramBlock_3
        LDW       X, #0x29a
        LDW       S:?w1, X
        CLRW      X
        LDW       S:?w0, X
        LDW       X, #`?<Constant "C:\\\\Users\\\\lun55\\\\Deskto...">`
        CALL      L:assert_failed
//  667     startaddress = FLASH_PROG_START_PHYSICAL_ADDRESS;
??FLASH_ProgramBlock_3:
        LDW       X, #0x8000
        LDW       S:?w7, X
        SLLW      X
        LDW       S:?w6, X
        JRA       L:??FLASH_ProgramBlock_4
//  668   }
//  669   else
//  670   {
//  671     assert_param(IS_FLASH_DATA_BLOCK_NUMBER_OK(BlockNum));
??FLASH_ProgramBlock_2:
        LDW       X, S:?w5
        CPW       X, #0xa
        JRC       L:??FLASH_ProgramBlock_5
        LDW       X, #0x29f
        LDW       S:?w1, X
        CLRW      X
        LDW       S:?w0, X
        LDW       X, #`?<Constant "C:\\\\Users\\\\lun55\\\\Deskto...">`
        CALL      L:assert_failed
//  672     startaddress = FLASH_DATA_START_PHYSICAL_ADDRESS;
??FLASH_ProgramBlock_5:
        LDW       X, #0x4000
        LDW       S:?w7, X
        CLRW      X
        LDW       S:?w6, X
//  673   }
//  674   
//  675   /* Point to the first block address */
//  676   startaddress = startaddress + ((uint32_t)BlockNum * FLASH_BLOCK_SIZE);
??FLASH_ProgramBlock_4:
        CALL      L:?mov_w1_w5
        CLRW      X
        LDW       S:?w0, X
        CALL      L:?mul32_l0_l0_dl
        DATA
        DC32      0x40
        CODE
        CALL      L:?mov_l1_l0
        CALL      L:?mov_l0_l3
        CALL      L:?add32_l0_l0_l1
        CALL      L:?mov_l3_l0
//  677   
//  678   /* Selection of Standard or Fast programming mode */
//  679   if(FLASH_ProgMode == FLASH_PROGRAMMODE_STANDARD)
        TNZ       S:?b9
        JRNE      L:??FLASH_ProgramBlock_6
//  680   {
//  681     /* Standard programming mode */ /*No need in standard mode */
//  682     FLASH->CR2 |= FLASH_CR2_PRG;
        BSET      L:0x505b, #0x0
//  683     FLASH->NCR2 &= (uint8_t)(~FLASH_NCR2_NPRG);
        BRES      L:0x505c, #0x0
        JRA       L:??FLASH_ProgramBlock_7
//  684   }
//  685   else
//  686   {
//  687     /* Fast programming mode */
//  688     FLASH->CR2 |= FLASH_CR2_FPRG;
??FLASH_ProgramBlock_6:
        BSET      L:0x505b, #0x4
//  689     FLASH->NCR2 &= (uint8_t)(~FLASH_NCR2_NFPRG);
        BRES      L:0x505c, #0x4
//  690   }
//  691   
//  692   /* Copy data bytes from RAM to FLASH memory */
//  693   for(Count = 0; Count < FLASH_BLOCK_SIZE; Count++)
??FLASH_ProgramBlock_7:
        CLR       S:?b1
        CLR       S:?b0
        JRA       L:??FLASH_ProgramBlock_8
//  694   {
//  695     *((PointerAttr uint8_t*) (MemoryAddressCast)startaddress + Count) = ((uint8_t)(Buffer[Count]));
??FLASH_ProgramBlock_9:
        LDW       X, S:?w7
        ADDW      X, S:?w0
        LDW       Y, S:?w0
        ADDW      Y, (0x1,SP)
        LD        A, (Y)
        LD        (X), A
//  696   }
        LDW       X, S:?w0
        INCW      X
        LDW       S:?w0, X
??FLASH_ProgramBlock_8:
        LDW       X, S:?w0
        CPW       X, #0x40
        JRC       L:??FLASH_ProgramBlock_9
//  697 }
        ADD       SP, #0x2
        JP        L:?epilogue_l2_l3

        SECTION VREGS:DATA:REORDER:NOROOT(0)

        SECTION `.near.rodata`:CONST:REORDER:NOROOT(0)
`?<Constant "C:\\\\Users\\\\lun55\\\\Deskto...">`:
        DC8 43H, 3AH, 5CH, 55H, 73H, 65H, 72H, 73H
        DC8 5CH, 6CH, 75H, 6EH, 35H, 35H, 5CH, 44H
        DC8 65H, 73H, 6BH, 74H, 6FH, 70H, 5CH, 4AH
        DC8 31H, 39H, 42H, 5FH, 53H, 54H, 4DH, 38H
        DC8 5CH, 4CH, 69H, 62H, 5CH, 73H, 74H, 6DH
        DC8 38H, 73H, 5FH, 66H, 6CH, 61H, 73H, 68H
        DC8 2EH, 63H, 0

        END
//  698 
//  699 #if defined (_COSMIC_) && defined (RAM_EXECUTION)
//  700  /* End of FLASH_CODE section */
//  701  #pragma section ()
//  702 #endif /* _COSMIC_ && RAM_EXECUTION */
//  703 
//  704 
//  705 /**
//  706   * @}
//  707   */
//  708   
//  709 /**
//  710   * @}
//  711   */
//  712   
//  713 
//  714 /************************ (C) COPYRIGHT STMicroelectronics *****END OF FILE****/
// 
//    51 bytes in section .near.rodata
// 1 422 bytes in section .near_func.text
// 
// 1 422 bytes of CODE  memory
//    51 bytes of CONST memory
//
//Errors: none
//Warnings: none
