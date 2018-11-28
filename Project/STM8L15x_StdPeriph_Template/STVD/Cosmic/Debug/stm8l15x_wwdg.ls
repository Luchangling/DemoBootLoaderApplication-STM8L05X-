   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.8.32 - 23 Mar 2010
   3                     ; Generator V4.3.4 - 23 Mar 2010
   4                     ; Optimizer V4.3.3 - 10 Feb 2010
  66                     ; 119 void WWDG_Init(uint8_t Counter, uint8_t WindowValue)
  66                     ; 120 {
  68                     .text:	section	.text,new
  69  0000               _WWDG_Init:
  71  0000 89            	pushw	x
  72       00000000      OFST:	set	0
  75                     ; 122   assert_param(IS_WWDG_WINDOW_LIMIT_VALUE(WindowValue));
  77                     ; 124   WWDG->WR = WWDG_WR_RESET_VALUE;
  79  0001 357f50d4      	mov	20692,#127
  80                     ; 125   WWDG->CR = (uint8_t)(WWDG_CR_WDGA | Counter);
  82  0005 9e            	ld	a,xh
  83  0006 aa80          	or	a,#128
  84  0008 c750d3        	ld	20691,a
  85                     ; 126   WWDG->WR = (uint8_t)((uint8_t)BIT_MASK & (uint8_t) WindowValue);
  87  000b 7b02          	ld	a,(OFST+2,sp)
  88  000d a47f          	and	a,#127
  89  000f c750d4        	ld	20692,a
  90                     ; 127 }
  93  0012 85            	popw	x
  94  0013 81            	ret	
 136                     ; 135 void WWDG_SetWindowValue(uint8_t WindowValue)
 136                     ; 136 {
 137                     .text:	section	.text,new
 138  0000               _WWDG_SetWindowValue:
 140  0000 88            	push	a
 141       00000001      OFST:	set	1
 144                     ; 137   __IO uint8_t tmpreg = 0;
 146  0001 0f01          	clr	(OFST+0,sp)
 147                     ; 140   assert_param(IS_WWDG_WINDOW_LIMIT_VALUE(WindowValue));
 149                     ; 143   tmpreg |= (uint8_t) (WindowValue & (uint8_t) BIT_MASK);
 151  0003 a47f          	and	a,#127
 152  0005 1a01          	or	a,(OFST+0,sp)
 153  0007 6b01          	ld	(OFST+0,sp),a
 154                     ; 146   WWDG->WR = tmpreg;
 156  0009 7b01          	ld	a,(OFST+0,sp)
 157  000b c750d4        	ld	20692,a
 158                     ; 147 }
 161  000e 84            	pop	a
 162  000f 81            	ret	
 194                     ; 156 void WWDG_SetCounter(uint8_t Counter)
 194                     ; 157 {
 195                     .text:	section	.text,new
 196  0000               _WWDG_SetCounter:
 200                     ; 159   assert_param(IS_WWDG_COUNTER_VALUE(Counter));
 202                     ; 163   WWDG->CR = (uint8_t)(Counter & (uint8_t)BIT_MASK);
 204  0000 a47f          	and	a,#127
 205  0002 c750d3        	ld	20691,a
 206                     ; 164 }
 209  0005 81            	ret	
 241                     ; 187 void WWDG_Enable(uint8_t Counter)
 241                     ; 188 {
 242                     .text:	section	.text,new
 243  0000               _WWDG_Enable:
 247                     ; 190   assert_param(IS_WWDG_COUNTER_VALUE(Counter));
 249                     ; 191   WWDG->CR = (uint8_t)(WWDG_CR_WDGA | Counter);
 251  0000 aa80          	or	a,#128
 252  0002 c750d3        	ld	20691,a
 253                     ; 192 }
 256  0005 81            	ret	
 279                     ; 216 uint8_t WWDG_GetCounter(void)
 279                     ; 217 {
 280                     .text:	section	.text,new
 281  0000               _WWDG_GetCounter:
 285                     ; 218   return(WWDG->CR);
 287  0000 c650d3        	ld	a,20691
 290  0003 81            	ret	
 313                     ; 226 void WWDG_SWReset(void)
 313                     ; 227 {
 314                     .text:	section	.text,new
 315  0000               _WWDG_SWReset:
 319                     ; 228   WWDG->CR = WWDG_CR_WDGA; /* Activate WWDG, with clearing T6 */
 321  0000 358050d3      	mov	20691,#128
 322                     ; 229 }
 325  0004 81            	ret	
 338                     	xdef	_WWDG_SWReset
 339                     	xdef	_WWDG_GetCounter
 340                     	xdef	_WWDG_Enable
 341                     	xdef	_WWDG_SetCounter
 342                     	xdef	_WWDG_SetWindowValue
 343                     	xdef	_WWDG_Init
 362                     	end
