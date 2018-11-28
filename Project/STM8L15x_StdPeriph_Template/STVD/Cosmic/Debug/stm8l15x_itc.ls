   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.8.32 - 23 Mar 2010
   3                     ; Generator V4.3.4 - 23 Mar 2010
   4                     ; Optimizer V4.3.3 - 10 Feb 2010
  50                     ; 56 uint8_t ITC_GetCPUCC(void)
  50                     ; 57 {
  52                     .text:	section	.text,new
  53  0000               _ITC_GetCPUCC:
  57                     ; 59   _asm("push cc");
  60  0000 8a            	push	cc
  62                     ; 60   _asm("pop a");
  65  0001 84            	pop	a
  67                     ; 61   return; /* Ignore compiler warning, the returned value is in A register */
  70  0002 81            	ret	
  93                     ; 87 void ITC_DeInit(void)
  93                     ; 88 {
  94                     .text:	section	.text,new
  95  0000               _ITC_DeInit:
  99                     ; 89   ITC->ISPR1 = ITC_SPRX_RESET_VALUE;
 101  0000 35ff7f70      	mov	32624,#255
 102                     ; 90   ITC->ISPR2 = ITC_SPRX_RESET_VALUE;
 104  0004 35ff7f71      	mov	32625,#255
 105                     ; 91   ITC->ISPR3 = ITC_SPRX_RESET_VALUE;
 107  0008 35ff7f72      	mov	32626,#255
 108                     ; 92   ITC->ISPR4 = ITC_SPRX_RESET_VALUE;
 110  000c 35ff7f73      	mov	32627,#255
 111                     ; 93   ITC->ISPR5 = ITC_SPRX_RESET_VALUE;
 113  0010 35ff7f74      	mov	32628,#255
 114                     ; 94   ITC->ISPR6 = ITC_SPRX_RESET_VALUE;
 116  0014 35ff7f75      	mov	32629,#255
 117                     ; 95   ITC->ISPR7 = ITC_SPRX_RESET_VALUE;
 119  0018 35ff7f76      	mov	32630,#255
 120                     ; 96   ITC->ISPR8 = ITC_SPRX_RESET_VALUE;
 122  001c 35ff7f77      	mov	32631,#255
 123                     ; 97 }
 126  0020 81            	ret	
 151                     ; 104 uint8_t ITC_GetSoftIntStatus(void)
 151                     ; 105 {
 152                     .text:	section	.text,new
 153  0000               _ITC_GetSoftIntStatus:
 157                     ; 106   return ((uint8_t)(ITC_GetCPUCC() & CPU_SOFT_INT_DISABLED));
 159  0000 cd0000        	call	_ITC_GetCPUCC
 161  0003 a428          	and	a,#40
 164  0005 81            	ret	
 469                     .const:	section	.text
 470  0000               L42:
 471  0000 0022          	dc.w	L14
 472  0002 0022          	dc.w	L14
 473  0004 0022          	dc.w	L14
 474  0006 0027          	dc.w	L34
 475  0008 0027          	dc.w	L34
 476  000a 0027          	dc.w	L34
 477  000c 0027          	dc.w	L34
 478  000e 002c          	dc.w	L54
 479  0010 002c          	dc.w	L54
 480  0012 002c          	dc.w	L54
 481  0014 002c          	dc.w	L54
 482  0016 0031          	dc.w	L74
 483  0018 0031          	dc.w	L74
 484  001a 0031          	dc.w	L74
 485  001c 0031          	dc.w	L74
 486  001e 0036          	dc.w	L15
 487  0020 0036          	dc.w	L15
 488  0022 0036          	dc.w	L15
 489  0024 0036          	dc.w	L15
 490  0026 003b          	dc.w	L35
 491  0028 003b          	dc.w	L35
 492  002a 003b          	dc.w	L35
 493  002c 003b          	dc.w	L35
 494  002e 0040          	dc.w	L55
 495  0030 0040          	dc.w	L55
 496  0032 0040          	dc.w	L55
 497  0034 0040          	dc.w	L55
 498  0036 0045          	dc.w	L75
 499  0038 0045          	dc.w	L75
 500                     ; 114 ITC_PriorityLevel_TypeDef ITC_GetSoftwarePriority(IRQn_TypeDef IRQn)
 500                     ; 115 {
 501                     .text:	section	.text,new
 502  0000               _ITC_GetSoftwarePriority:
 504  0000 88            	push	a
 505  0001 89            	pushw	x
 506       00000002      OFST:	set	2
 509                     ; 116   uint8_t Value = 0;
 511  0002 0f02          	clr	(OFST+0,sp)
 512                     ; 117   uint8_t Mask = 0;
 514                     ; 120   assert_param(IS_ITC_IRQ(IRQn));
 516                     ; 123   Mask = (uint8_t)(0x03U << ((IRQn % 4U) * 2U));
 518  0004 a403          	and	a,#3
 519  0006 48            	sll	a
 520  0007 5f            	clrw	x
 521  0008 97            	ld	xl,a
 522  0009 a603          	ld	a,#3
 523  000b 5d            	tnzw	x
 524  000c 2704          	jreq	L61
 525  000e               L02:
 526  000e 48            	sll	a
 527  000f 5a            	decw	x
 528  0010 26fc          	jrne	L02
 529  0012               L61:
 530  0012 6b01          	ld	(OFST-1,sp),a
 531                     ; 125   switch (IRQn)
 533  0014 7b03          	ld	a,(OFST+1,sp)
 535                     ; 223     default:
 535                     ; 224       break;
 536  0016 4a            	dec	a
 537  0017 a11d          	cp	a,#29
 538  0019 2431          	jruge	L122
 539  001b 5f            	clrw	x
 540  001c 97            	ld	xl,a
 541  001d 58            	sllw	x
 542  001e de0000        	ldw	x,(L42,x)
 543  0021 fc            	jp	(x)
 544  0022               L14:
 545                     ; 127     case FLASH_IRQn:
 545                     ; 128     case DMA1_CHANNEL0_1_IRQn:
 545                     ; 129     case DMA1_CHANNEL2_3_IRQn:
 545                     ; 130       Value = (uint8_t)(ITC->ISPR1 & Mask); /* Read software priority */
 547  0022 c67f70        	ld	a,32624
 548                     ; 131       break;
 550  0025 2021          	jp	LC001
 551  0027               L34:
 552                     ; 133     case EXTIE_F_PVD_IRQn:
 552                     ; 134 #if defined (STM8L15X_MD) || defined (STM8L05X_MD_VL) || defined (STM8AL31_L_MD)
 552                     ; 135     case RTC_IRQn:
 552                     ; 136     case EXTIB_IRQn:
 552                     ; 137     case EXTID_IRQn:
 552                     ; 138 #elif defined (STM8L15X_LD) || defined (STM8L05X_LD_VL)
 552                     ; 139     case RTC_CSSLSE_IRQn:
 552                     ; 140     case EXTIB_IRQn:
 552                     ; 141     case EXTID_IRQn:
 552                     ; 142 #elif defined (STM8L15X_HD) || defined (STM8L15X_MDP) || defined (STM8L05X_HD_VL)
 552                     ; 143     case RTC_CSSLSE_IRQn:
 552                     ; 144     case EXTIB_G_IRQn:
 552                     ; 145     case EXTID_H_IRQn:
 552                     ; 146 #endif  /* STM8L15X_MD */
 552                     ; 147       Value = (uint8_t)(ITC->ISPR2 & Mask); /* Read software priority */
 554  0027 c67f71        	ld	a,32625
 555                     ; 148       break;
 557  002a 201c          	jp	LC001
 558  002c               L54:
 559                     ; 150     case EXTI0_IRQn:
 559                     ; 151     case EXTI1_IRQn:
 559                     ; 152     case EXTI2_IRQn:
 559                     ; 153     case EXTI3_IRQn:
 559                     ; 154       Value = (uint8_t)(ITC->ISPR3 & Mask); /* Read software priority */
 561  002c c67f72        	ld	a,32626
 562                     ; 155       break;
 564  002f 2017          	jp	LC001
 565  0031               L74:
 566                     ; 157     case EXTI4_IRQn:
 566                     ; 158     case EXTI5_IRQn:
 566                     ; 159     case EXTI6_IRQn:
 566                     ; 160     case EXTI7_IRQn:
 566                     ; 161       Value = (uint8_t)(ITC->ISPR4 & Mask); /* Read software priority */
 568  0031 c67f73        	ld	a,32627
 569                     ; 162       break;
 571  0034 2012          	jp	LC001
 572  0036               L15:
 573                     ; 167     case SWITCH_CSS_BREAK_DAC_IRQn:
 573                     ; 168 #endif /* STM8L15X_LD */		
 573                     ; 169     case ADC1_COMP_IRQn:
 573                     ; 170 #if defined (STM8L15X_MD) || defined (STM8L05X_MD_VL) || defined (STM8AL31_L_MD)
 573                     ; 171     case LCD_IRQn:
 573                     ; 172     case TIM2_UPD_OVF_TRG_BRK_IRQn:
 573                     ; 173 #elif defined (STM8L15X_LD) || defined (STM8L05X_LD_VL)
 573                     ; 174     case TIM2_UPD_OVF_TRG_BRK_IRQn:
 573                     ; 175 #elif defined (STM8L15X_HD) || defined (STM8L15X_MDP) || defined (STM8L05X_HD_VL)
 573                     ; 176     case LCD_AES_IRQn:
 573                     ; 177     case TIM2_UPD_OVF_TRG_BRK_USART2_TX_IRQn:
 573                     ; 178 #endif  /* STM8L15X_MD */
 573                     ; 179       Value = (uint8_t)(ITC->ISPR5 & Mask); /* Read software priority */
 575  0036 c67f74        	ld	a,32628
 576                     ; 180       break;
 578  0039 200d          	jp	LC001
 579  003b               L35:
 580                     ; 183     case TIM1_UPD_OVF_TRG_IRQn:
 580                     ; 184 #endif /* STM8L15X_LD */		
 580                     ; 185 #if defined (STM8L15X_MD) || defined (STM8L15X_LD) || defined (STM8L05X_MD_VL) ||\
 580                     ; 186  defined (STM8AL31_L_MD) || defined (STM8L05X_LD_VL)
 580                     ; 187     case TIM2_CC_IRQn:
 580                     ; 188     case TIM3_UPD_OVF_TRG_BRK_IRQn :
 580                     ; 189     case TIM3_CC_IRQn:
 580                     ; 190 #elif defined (STM8L15X_HD) || defined (STM8L15X_MDP) || defined (STM8L05X_HD_VL)
 580                     ; 191     case TIM2_CC_USART2_RX_IRQn:
 580                     ; 192     case TIM3_UPD_OVF_TRG_BRK_USART3_TX_IRQn :
 580                     ; 193     case TIM3_CC_USART3_RX_IRQn:
 580                     ; 194 #endif  /* STM8L15X_MD */
 580                     ; 195       Value = (uint8_t)(ITC->ISPR6 & Mask); /* Read software priority */
 582  003b c67f75        	ld	a,32629
 583                     ; 196       break;
 585  003e 2008          	jp	LC001
 586  0040               L55:
 587                     ; 199     case TIM1_CC_IRQn:
 587                     ; 200 #endif /* STM8L15X_LD */	
 587                     ; 201     case TIM4_UPD_OVF_TRG_IRQn:
 587                     ; 202     case SPI1_IRQn:
 587                     ; 203 #if defined (STM8L15X_MD) || defined (STM8L15X_LD) || defined (STM8L05X_MD_VL) ||\
 587                     ; 204  defined (STM8AL31_L_MD) || defined (STM8L05X_LD_VL)
 587                     ; 205     case USART1_TX_IRQn:
 587                     ; 206 #elif defined (STM8L15X_HD) || defined (STM8L15X_MDP) || defined (STM8L05X_HD_VL)
 587                     ; 207     case USART1_TX_TIM5_UPD_OVF_TRG_BRK_IRQn:
 587                     ; 208 #endif  /* STM8L15X_MD || STM8L15X_LD */
 587                     ; 209       Value = (uint8_t)(ITC->ISPR7 & Mask); /* Read software priority */
 589  0040 c67f76        	ld	a,32630
 590                     ; 210       break;
 592  0043 2003          	jp	LC001
 593  0045               L75:
 594                     ; 214     case USART1_RX_IRQn:
 594                     ; 215     case I2C1_IRQn:
 594                     ; 216 #elif defined (STM8L15X_HD) || defined (STM8L15X_MDP) || defined (STM8L05X_HD_VL)
 594                     ; 217     case USART1_RX_TIM5_CC_IRQn:
 594                     ; 218     case I2C1_SPI2_IRQn:
 594                     ; 219 #endif  /* STM8L15X_MD || STM8L15X_LD*/
 594                     ; 220       Value = (uint8_t)(ITC->ISPR8 & Mask); /* Read software priority */
 596  0045 c67f77        	ld	a,32631
 597  0048               LC001:
 598  0048 1401          	and	a,(OFST-1,sp)
 599  004a 6b02          	ld	(OFST+0,sp),a
 600                     ; 221       break;
 602                     ; 223     default:
 602                     ; 224       break;
 604  004c               L122:
 605                     ; 227   Value >>= (uint8_t)((IRQn % 4u) * 2u);
 607  004c 7b03          	ld	a,(OFST+1,sp)
 608  004e a403          	and	a,#3
 609  0050 48            	sll	a
 610  0051 5f            	clrw	x
 611  0052 97            	ld	xl,a
 612  0053 7b02          	ld	a,(OFST+0,sp)
 613  0055 5d            	tnzw	x
 614  0056 2704          	jreq	L62
 615  0058               L03:
 616  0058 44            	srl	a
 617  0059 5a            	decw	x
 618  005a 26fc          	jrne	L03
 619  005c               L62:
 620                     ; 229   return((ITC_PriorityLevel_TypeDef)Value);
 624  005c 5b03          	addw	sp,#3
 625  005e 81            	ret	
 685                     	switch	.const
 686  003a               L64:
 687  003a 0037          	dc.w	L322
 688  003c 0037          	dc.w	L322
 689  003e 0037          	dc.w	L322
 690  0040 0049          	dc.w	L522
 691  0042 0049          	dc.w	L522
 692  0044 0049          	dc.w	L522
 693  0046 0049          	dc.w	L522
 694  0048 005b          	dc.w	L722
 695  004a 005b          	dc.w	L722
 696  004c 005b          	dc.w	L722
 697  004e 005b          	dc.w	L722
 698  0050 006d          	dc.w	L132
 699  0052 006d          	dc.w	L132
 700  0054 006d          	dc.w	L132
 701  0056 006d          	dc.w	L132
 702  0058 007f          	dc.w	L332
 703  005a 007f          	dc.w	L332
 704  005c 007f          	dc.w	L332
 705  005e 007f          	dc.w	L332
 706  0060 0091          	dc.w	L532
 707  0062 0091          	dc.w	L532
 708  0064 0091          	dc.w	L532
 709  0066 0091          	dc.w	L532
 710  0068 00a3          	dc.w	L732
 711  006a 00a3          	dc.w	L732
 712  006c 00a3          	dc.w	L732
 713  006e 00a3          	dc.w	L732
 714  0070 00b5          	dc.w	L142
 715  0072 00b5          	dc.w	L142
 716                     ; 250 void ITC_SetSoftwarePriority(IRQn_TypeDef IRQn, ITC_PriorityLevel_TypeDef ITC_PriorityLevel)
 716                     ; 251 {
 717                     .text:	section	.text,new
 718  0000               _ITC_SetSoftwarePriority:
 720  0000 89            	pushw	x
 721  0001 89            	pushw	x
 722       00000002      OFST:	set	2
 725                     ; 252   uint8_t Mask = 0;
 727                     ; 253   uint8_t NewPriority = 0;
 729                     ; 256   assert_param(IS_ITC_IRQ(IRQn));
 731                     ; 257   assert_param(IS_ITC_PRIORITY(ITC_PriorityLevel));
 733                     ; 260   assert_param(IS_ITC_INTERRUPTS_DISABLED);
 735                     ; 264   Mask = (uint8_t)(~(uint8_t)(0x03U << ((IRQn % 4U) * 2U)));
 737  0002 9e            	ld	a,xh
 738  0003 a403          	and	a,#3
 739  0005 48            	sll	a
 740  0006 5f            	clrw	x
 741  0007 97            	ld	xl,a
 742  0008 a603          	ld	a,#3
 743  000a 5d            	tnzw	x
 744  000b 2704          	jreq	L43
 745  000d               L63:
 746  000d 48            	sll	a
 747  000e 5a            	decw	x
 748  000f 26fc          	jrne	L63
 749  0011               L43:
 750  0011 43            	cpl	a
 751  0012 6b01          	ld	(OFST-1,sp),a
 752                     ; 266   NewPriority = (uint8_t)((uint8_t)(ITC_PriorityLevel) << ((IRQn % 4U) * 2U));
 754  0014 7b03          	ld	a,(OFST+1,sp)
 755  0016 a403          	and	a,#3
 756  0018 48            	sll	a
 757  0019 5f            	clrw	x
 758  001a 97            	ld	xl,a
 759  001b 7b04          	ld	a,(OFST+2,sp)
 760  001d 5d            	tnzw	x
 761  001e 2704          	jreq	L04
 762  0020               L24:
 763  0020 48            	sll	a
 764  0021 5a            	decw	x
 765  0022 26fc          	jrne	L24
 766  0024               L04:
 767  0024 6b02          	ld	(OFST+0,sp),a
 768                     ; 268   switch (IRQn)
 770  0026 7b03          	ld	a,(OFST+1,sp)
 772                     ; 372     default:
 772                     ; 373       break;
 773  0028 4a            	dec	a
 774  0029 a11d          	cp	a,#29
 775  002b 2503cc00c5    	jruge	L572
 776  0030 5f            	clrw	x
 777  0031 97            	ld	xl,a
 778  0032 58            	sllw	x
 779  0033 de003a        	ldw	x,(L64,x)
 780  0036 fc            	jp	(x)
 781  0037               L322:
 782                     ; 270     case FLASH_IRQn:
 782                     ; 271     case DMA1_CHANNEL0_1_IRQn:
 782                     ; 272     case DMA1_CHANNEL2_3_IRQn:
 782                     ; 273       ITC->ISPR1 &= Mask;
 784  0037 c67f70        	ld	a,32624
 785  003a 1401          	and	a,(OFST-1,sp)
 786  003c c77f70        	ld	32624,a
 787                     ; 274       ITC->ISPR1 |= NewPriority;
 789  003f c67f70        	ld	a,32624
 790  0042 1a02          	or	a,(OFST+0,sp)
 791  0044 c77f70        	ld	32624,a
 792                     ; 275       break;
 794  0047 207c          	jra	L572
 795  0049               L522:
 796                     ; 277     case EXTIE_F_PVD_IRQn:
 796                     ; 278 #if defined (STM8L15X_MD) || defined (STM8L05X_MD_VL) || defined (STM8AL31_L_MD)
 796                     ; 279     case RTC_IRQn:
 796                     ; 280     case EXTIB_IRQn:
 796                     ; 281     case EXTID_IRQn:
 796                     ; 282 #elif defined (STM8L15X_LD) || defined (STM8L05X_LD_VL)
 796                     ; 283     case RTC_CSSLSE_IRQn:
 796                     ; 284     case EXTIB_IRQn:
 796                     ; 285     case EXTID_IRQn:
 796                     ; 286 #elif defined (STM8L15X_HD) || defined (STM8L15X_MDP) || defined (STM8L05X_HD_VL)
 796                     ; 287     case RTC_CSSLSE_IRQn:
 796                     ; 288     case EXTIB_G_IRQn:
 796                     ; 289     case EXTID_H_IRQn:
 796                     ; 290 #endif  /* STM8L15X_MD */
 796                     ; 291       ITC->ISPR2 &= Mask;
 798  0049 c67f71        	ld	a,32625
 799  004c 1401          	and	a,(OFST-1,sp)
 800  004e c77f71        	ld	32625,a
 801                     ; 292       ITC->ISPR2 |= NewPriority;
 803  0051 c67f71        	ld	a,32625
 804  0054 1a02          	or	a,(OFST+0,sp)
 805  0056 c77f71        	ld	32625,a
 806                     ; 293       break;
 808  0059 206a          	jra	L572
 809  005b               L722:
 810                     ; 295     case EXTI0_IRQn:
 810                     ; 296     case EXTI1_IRQn:
 810                     ; 297     case EXTI2_IRQn:
 810                     ; 298     case EXTI3_IRQn:
 810                     ; 299       ITC->ISPR3 &= Mask;
 812  005b c67f72        	ld	a,32626
 813  005e 1401          	and	a,(OFST-1,sp)
 814  0060 c77f72        	ld	32626,a
 815                     ; 300       ITC->ISPR3 |= NewPriority;
 817  0063 c67f72        	ld	a,32626
 818  0066 1a02          	or	a,(OFST+0,sp)
 819  0068 c77f72        	ld	32626,a
 820                     ; 301       break;
 822  006b 2058          	jra	L572
 823  006d               L132:
 824                     ; 303     case EXTI4_IRQn:
 824                     ; 304     case EXTI5_IRQn:
 824                     ; 305     case EXTI6_IRQn:
 824                     ; 306     case EXTI7_IRQn:
 824                     ; 307       ITC->ISPR4 &= Mask;
 826  006d c67f73        	ld	a,32627
 827  0070 1401          	and	a,(OFST-1,sp)
 828  0072 c77f73        	ld	32627,a
 829                     ; 308       ITC->ISPR4 |= NewPriority;
 831  0075 c67f73        	ld	a,32627
 832  0078 1a02          	or	a,(OFST+0,sp)
 833  007a c77f73        	ld	32627,a
 834                     ; 309       break;
 836  007d 2046          	jra	L572
 837  007f               L332:
 838                     ; 311     case SWITCH_CSS_BREAK_DAC_IRQn:
 838                     ; 312 #else
 838                     ; 313     case SWITCH_CSS_IRQn:
 838                     ; 314 #endif /*	STM8L15X_LD	*/
 838                     ; 315     case ADC1_COMP_IRQn:
 838                     ; 316 #if defined (STM8L15X_MD) || defined (STM8L05X_MD_VL) || defined (STM8AL31_L_MD)
 838                     ; 317     case LCD_IRQn:
 838                     ; 318     case TIM2_UPD_OVF_TRG_BRK_IRQn:
 838                     ; 319 #elif defined (STM8L15X_LD) || defined (STM8L05X_LD_VL)
 838                     ; 320     case TIM2_UPD_OVF_TRG_BRK_IRQn:
 838                     ; 321 #elif defined (STM8L15X_HD) || defined (STM8L15X_MDP) || defined (STM8L05X_HD_VL)
 838                     ; 322     case LCD_AES_IRQn:
 838                     ; 323     case TIM2_UPD_OVF_TRG_BRK_USART2_TX_IRQn:
 838                     ; 324 #endif  /* STM8L15X_MD */
 838                     ; 325       ITC->ISPR5 &= Mask;
 840  007f c67f74        	ld	a,32628
 841  0082 1401          	and	a,(OFST-1,sp)
 842  0084 c77f74        	ld	32628,a
 843                     ; 326       ITC->ISPR5 |= NewPriority;
 845  0087 c67f74        	ld	a,32628
 846  008a 1a02          	or	a,(OFST+0,sp)
 847  008c c77f74        	ld	32628,a
 848                     ; 327       break;
 850  008f 2034          	jra	L572
 851  0091               L532:
 852                     ; 329     case TIM1_UPD_OVF_TRG_IRQn:
 852                     ; 330 #endif  /* STM8L15X_LD */
 852                     ; 331 #if defined (STM8L15X_MD) || defined (STM8L15X_LD) || defined (STM8L05X_MD_VL) ||\
 852                     ; 332  defined (STM8AL31_L_MD) || defined (STM8L05X_LD_VL)
 852                     ; 333     case TIM2_CC_IRQn:
 852                     ; 334     case TIM3_UPD_OVF_TRG_BRK_IRQn :
 852                     ; 335     case TIM3_CC_IRQn:
 852                     ; 336 #elif defined (STM8L15X_HD) || defined (STM8L15X_MDP) || defined (STM8L05X_HD_VL)
 852                     ; 337     case TIM2_CC_USART2_RX_IRQn:
 852                     ; 338     case TIM3_UPD_OVF_TRG_BRK_USART3_TX_IRQn :
 852                     ; 339     case TIM3_CC_USART3_RX_IRQn:
 852                     ; 340 #endif  /* STM8L15X_MD */
 852                     ; 341       ITC->ISPR6 &= Mask;
 854  0091 c67f75        	ld	a,32629
 855  0094 1401          	and	a,(OFST-1,sp)
 856  0096 c77f75        	ld	32629,a
 857                     ; 342       ITC->ISPR6 |= NewPriority;
 859  0099 c67f75        	ld	a,32629
 860  009c 1a02          	or	a,(OFST+0,sp)
 861  009e c77f75        	ld	32629,a
 862                     ; 343       break;
 864  00a1 2022          	jra	L572
 865  00a3               L732:
 866                     ; 346     case TIM1_CC_IRQn:
 866                     ; 347 #endif  /* STM8L15X_LD */
 866                     ; 348     case TIM4_UPD_OVF_TRG_IRQn:
 866                     ; 349     case SPI1_IRQn:
 866                     ; 350 #if defined (STM8L15X_MD) || defined (STM8L15X_LD) || defined (STM8L05X_MD_VL) ||\
 866                     ; 351  defined (STM8AL31_L_MD) || defined (STM8L05X_LD_VL)
 866                     ; 352     case USART1_TX_IRQn:
 866                     ; 353 #elif defined (STM8L15X_HD) || defined (STM8L15X_MDP) || defined (STM8L05X_HD_VL)
 866                     ; 354     case USART1_TX_TIM5_UPD_OVF_TRG_BRK_IRQn:
 866                     ; 355 #endif  /* STM8L15X_MD */
 866                     ; 356       ITC->ISPR7 &= Mask;
 868  00a3 c67f76        	ld	a,32630
 869  00a6 1401          	and	a,(OFST-1,sp)
 870  00a8 c77f76        	ld	32630,a
 871                     ; 357       ITC->ISPR7 |= NewPriority;
 873  00ab c67f76        	ld	a,32630
 874  00ae 1a02          	or	a,(OFST+0,sp)
 875  00b0 c77f76        	ld	32630,a
 876                     ; 358       break;
 878  00b3 2010          	jra	L572
 879  00b5               L142:
 880                     ; 362     case USART1_RX_IRQn:
 880                     ; 363     case I2C1_IRQn:
 880                     ; 364 #elif defined (STM8L15X_HD) || defined (STM8L15X_MDP) || defined (STM8L05X_HD_VL)
 880                     ; 365     case USART1_RX_TIM5_CC_IRQn:
 880                     ; 366     case I2C1_SPI2_IRQn:
 880                     ; 367 #endif  /* STM8L15X_MD */
 880                     ; 368       ITC->ISPR8 &= Mask;
 882  00b5 c67f77        	ld	a,32631
 883  00b8 1401          	and	a,(OFST-1,sp)
 884  00ba c77f77        	ld	32631,a
 885                     ; 369       ITC->ISPR8 |= NewPriority;
 887  00bd c67f77        	ld	a,32631
 888  00c0 1a02          	or	a,(OFST+0,sp)
 889  00c2 c77f77        	ld	32631,a
 890                     ; 370       break;
 892                     ; 372     default:
 892                     ; 373       break;
 894  00c5               L572:
 895                     ; 375 }
 898  00c5 5b04          	addw	sp,#4
 899  00c7 81            	ret	
 912                     	xdef	_ITC_GetSoftwarePriority
 913                     	xdef	_ITC_SetSoftwarePriority
 914                     	xdef	_ITC_GetSoftIntStatus
 915                     	xdef	_ITC_GetCPUCC
 916                     	xdef	_ITC_DeInit
 935                     	end
