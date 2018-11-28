   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.8.32 - 23 Mar 2010
   3                     ; Generator V4.3.4 - 23 Mar 2010
   4                     ; Optimizer V4.3.3 - 10 Feb 2010
  50                     ; 93 void AES_DeInit(void)
  50                     ; 94 {
  51                     .text:	section	.text,new
  52  0000               f_AES_DeInit:
  56                     ; 96   AES->CR = AES_CR_ERRC | AES_CR_CCFC;
  58  0000 351853d0      	mov	21456,#24
  59                     ; 97   AES->DINR = AES_DINR_RESET_VALUE;       /* Set AES_DINR to reset value 0x00 */
  61  0004 725f53d2      	clr	21458
  62                     ; 98   AES->DOUTR = AES_DOUTR_RESET_VALUE;     /* Set AES_DOUTR to reset value 0x00 */
  64  0008 725f53d3      	clr	21459
  65                     ; 99 }
  68  000c 87            	retf	
 141                     ; 112 void AES_OperationModeConfig(AES_Operation_TypeDef AES_Operation)
 141                     ; 113 {
 142                     .text:	section	.text,new
 143  0000               f_AES_OperationModeConfig:
 145  0000 88            	push	a
 146       00000000      OFST:	set	0
 149                     ; 115   assert_param(IS_AES_MODE(AES_Operation));
 151                     ; 118   AES->CR &= (uint8_t) (~AES_CR_MODE);
 153  0001 c653d0        	ld	a,21456
 154  0004 a4f9          	and	a,#249
 155  0006 c753d0        	ld	21456,a
 156                     ; 121   AES->CR |= (uint8_t) (AES_Operation);
 158  0009 c653d0        	ld	a,21456
 159  000c 1a01          	or	a,(OFST+1,sp)
 160  000e c753d0        	ld	21456,a
 161                     ; 122 }
 164  0011 84            	pop	a
 165  0012 87            	retf	
 219                     ; 132 void AES_Cmd(FunctionalState NewState)
 219                     ; 133 {
 220                     .text:	section	.text,new
 221  0000               f_AES_Cmd:
 225                     ; 135   assert_param(IS_FUNCTIONAL_STATE(NewState));
 227                     ; 137   if (NewState != DISABLE)
 229  0000 4d            	tnz	a
 230  0001 2705          	jreq	L101
 231                     ; 139     AES->CR |= (uint8_t) AES_CR_EN;   /**< AES Enable */
 233  0003 721053d0      	bset	21456,#0
 236  0007 87            	retf	
 237  0008               L101:
 238                     ; 143     AES->CR &= (uint8_t)(~AES_CR_EN);  /**< AES Disable */
 240  0008 721153d0      	bres	21456,#0
 241                     ; 145 }
 244  000c 87            	retf	
 275                     ; 170 void AES_WriteSubData(uint8_t Data)
 275                     ; 171 {
 276                     .text:	section	.text,new
 277  0000               f_AES_WriteSubData:
 281                     ; 173   AES->DINR = Data;
 283  0000 c753d2        	ld	21458,a
 284                     ; 174 }
 287  0003 87            	retf	
 318                     ; 183 void AES_WriteSubKey(uint8_t Key)
 318                     ; 184 {
 319                     .text:	section	.text,new
 320  0000               f_AES_WriteSubKey:
 324                     ; 186   AES->DINR = Key;
 326  0000 c753d2        	ld	21458,a
 327                     ; 187 }
 330  0003 87            	retf	
 352                     ; 195 uint8_t AES_ReadSubData(void)
 352                     ; 196 {
 353                     .text:	section	.text,new
 354  0000               f_AES_ReadSubData:
 358                     ; 197   return AES->DOUTR;
 360  0000 c653d3        	ld	a,21459
 363  0003 87            	retf	
 385                     ; 206 uint8_t AES_ReadSubKey(void)
 385                     ; 207 {
 386                     .text:	section	.text,new
 387  0000               f_AES_ReadSubKey:
 391                     ; 208   return AES->DOUTR;
 393  0000 c653d3        	ld	a,21459
 396  0003 87            	retf	
 454                     ; 237 void AES_DMAConfig(AES_DMATransfer_TypeDef AES_DMATransfer, FunctionalState NewState)
 454                     ; 238 {
 455                     .text:	section	.text,new
 456  0000               f_AES_DMAConfig:
 458  0000 89            	pushw	x
 459       00000000      OFST:	set	0
 462                     ; 240   assert_param(IS_AES_DMATRANSFER(AES_DMATransfer));
 464                     ; 242   if (NewState != DISABLE)
 466  0001 9f            	ld	a,xl
 467  0002 4d            	tnz	a
 468  0003 2706          	jreq	L502
 469                     ; 245     AES->CR |= (uint8_t) AES_DMATransfer;
 471  0005 9e            	ld	a,xh
 472  0006 ca53d0        	or	a,21456
 474  0009 2006          	jra	L702
 475  000b               L502:
 476                     ; 250     AES->CR &= (uint8_t)(~AES_DMATransfer);
 478  000b 7b01          	ld	a,(OFST+1,sp)
 479  000d 43            	cpl	a
 480  000e c453d0        	and	a,21456
 481  0011               L702:
 482  0011 c753d0        	ld	21456,a
 483                     ; 252 }
 486  0014 85            	popw	x
 487  0015 87            	retf	
 551                     ; 281 void AES_ITConfig(AES_IT_TypeDef AES_IT, FunctionalState NewState)
 551                     ; 282 {
 552                     .text:	section	.text,new
 553  0000               f_AES_ITConfig:
 555  0000 89            	pushw	x
 556       00000000      OFST:	set	0
 559                     ; 284   assert_param(IS_FUNCTIONAL_STATE(NewState));
 561                     ; 285   assert_param(IS_AES_IT(AES_IT));
 563                     ; 287   if (NewState != DISABLE)
 565  0001 9f            	ld	a,xl
 566  0002 4d            	tnz	a
 567  0003 2706          	jreq	L342
 568                     ; 289     AES->CR |= (uint8_t) AES_IT;    /**< AES_IT Enable */
 570  0005 9e            	ld	a,xh
 571  0006 ca53d0        	or	a,21456
 573  0009 2006          	jra	L542
 574  000b               L342:
 575                     ; 293     AES->CR &= (uint8_t)(~AES_IT);  /**< AES_IT Disable */
 577  000b 7b01          	ld	a,(OFST+1,sp)
 578  000d 43            	cpl	a
 579  000e c453d0        	and	a,21456
 580  0011               L542:
 581  0011 c753d0        	ld	21456,a
 582                     ; 295 }
 585  0014 85            	popw	x
 586  0015 87            	retf	
 678                     ; 307 FlagStatus AES_GetFlagStatus(AES_FLAG_TypeDef AES_FLAG)
 678                     ; 308 {
 679                     .text:	section	.text,new
 680  0000               f_AES_GetFlagStatus:
 682  0000 88            	push	a
 683  0001 88            	push	a
 684       00000001      OFST:	set	1
 687                     ; 309   FlagStatus status = RESET;
 689                     ; 312   assert_param(IS_AES_FLAG(AES_FLAG));
 691                     ; 314   if (AES_FLAG == AES_FLAG_CCF)
 693  0002 4a            	dec	a
 694  0003 2609          	jrne	L313
 695                     ; 316     if ((AES->SR & (uint8_t)AES_FLAG_CCF) != (uint8_t)0x00)
 697  0005 720153d102    	btjf	21457,#0,L513
 698                     ; 319       status = (FlagStatus) SET;
 700  000a 200d          	jpf	LC002
 701  000c               L513:
 702                     ; 324       status = (FlagStatus) RESET;
 703  000c 2018          	jpf	L333
 704  000e               L313:
 705                     ; 327   else if (AES_FLAG == AES_FLAG_RDERR)
 707  000e 7b02          	ld	a,(OFST+1,sp)
 708  0010 a102          	cp	a,#2
 709  0012 260b          	jrne	L323
 710                     ; 329     if ((AES->SR & (uint8_t)AES_FLAG_RDERR) != (uint8_t)0x00)
 712  0014 720353d104    	btjf	21457,#1,L523
 713                     ; 332       status = (FlagStatus) SET;
 715  0019               LC002:
 718  0019 a601          	ld	a,#1
 720  001b 200a          	jra	L123
 721  001d               L523:
 722                     ; 337       status = (FlagStatus) RESET;
 723  001d 2007          	jpf	L333
 724  001f               L323:
 725                     ; 342     if ((AES->SR & (uint8_t)AES_FLAG_WRERR) != (uint8_t)0x00)
 727  001f 720553d102    	btjf	21457,#2,L333
 728                     ; 345       status = (FlagStatus) SET;
 730  0024 20f3          	jpf	LC002
 731  0026               L333:
 732                     ; 350       status = (FlagStatus) RESET;
 736  0026 4f            	clr	a
 737  0027               L123:
 738                     ; 354   return ((FlagStatus) status);
 742  0027 85            	popw	x
 743  0028 87            	retf	
 777                     ; 366 void AES_ClearFlag(AES_FLAG_TypeDef AES_FLAG)
 777                     ; 367 {
 778                     .text:	section	.text,new
 779  0000               f_AES_ClearFlag:
 783                     ; 369   assert_param(IS_AES_FLAG(AES_FLAG));
 785                     ; 372   if (AES_FLAG == AES_FLAG_CCF)
 787  0000 4a            	dec	a
 788  0001 2605          	jrne	L553
 789                     ; 375     AES->CR |= (uint8_t) AES_CR_CCFC;
 791  0003 721653d0      	bset	21456,#3
 794  0007 87            	retf	
 795  0008               L553:
 796                     ; 380     AES->CR |= (uint8_t) AES_CR_ERRC;
 798  0008 721853d0      	bset	21456,#4
 799                     ; 382 }
 802  000c 87            	retf	
 867                     ; 392 ITStatus AES_GetITStatus(AES_IT_TypeDef AES_IT)
 867                     ; 393 {
 868                     .text:	section	.text,new
 869  0000               f_AES_GetITStatus:
 871  0000 88            	push	a
 872  0001 89            	pushw	x
 873       00000002      OFST:	set	2
 876                     ; 394   ITStatus itstatus = RESET;
 878                     ; 395   BitStatus cciebitstatus, ccfbitstatus = RESET;
 880                     ; 398   assert_param(IS_AES_IT(AES_IT));
 882                     ; 400   cciebitstatus = (BitStatus) (AES->CR & AES_CR_CCIE);
 884  0002 c653d0        	ld	a,21456
 885  0005 a420          	and	a,#32
 886  0007 6b01          	ld	(OFST-1,sp),a
 887                     ; 401   ccfbitstatus =  (BitStatus) (AES->SR & AES_SR_CCF);
 889  0009 c653d1        	ld	a,21457
 890  000c a401          	and	a,#1
 891  000e 6b02          	ld	(OFST+0,sp),a
 892                     ; 404   if (AES_IT == AES_IT_CCIE)
 894  0010 7b03          	ld	a,(OFST+1,sp)
 895  0012 a120          	cp	a,#32
 896  0014 260a          	jrne	L314
 897                     ; 407     if (((cciebitstatus) != RESET) && ((ccfbitstatus) != RESET))
 899  0016 7b01          	ld	a,(OFST-1,sp)
 900  0018 2716          	jreq	L524
 902  001a 7b02          	ld	a,(OFST+0,sp)
 903  001c 2712          	jreq	L524
 904                     ; 410       itstatus = (ITStatus) SET;
 906  001e 200c          	jpf	LC004
 907                     ; 415       itstatus = (ITStatus) RESET;
 908  0020               L314:
 909                     ; 421     if ((AES->CR & AES_CR_ERRIE) != RESET)
 911  0020 720d53d00b    	btjf	21456,#6,L524
 912                     ; 424       if ((AES->SR & (uint8_t)(AES_SR_WRERR | AES_SR_RDERR)) != RESET)
 914  0025 c653d1        	ld	a,21457
 915  0028 a506          	bcp	a,#6
 916  002a 2704          	jreq	L524
 917                     ; 427         itstatus = (ITStatus) SET;
 919  002c               LC004:
 921  002c a601          	ld	a,#1
 923  002e 2001          	jra	L124
 924  0030               L524:
 925                     ; 432         itstatus = (ITStatus) RESET;
 926                     ; 438       itstatus = (ITStatus) RESET;
 930  0030 4f            	clr	a
 931  0031               L124:
 932                     ; 443   return ((ITStatus)itstatus);
 936  0031 5b03          	addw	sp,#3
 937  0033 87            	retf	
 972                     ; 454 void AES_ClearITPendingBit(AES_IT_TypeDef AES_IT)
 972                     ; 455 {
 973                     .text:	section	.text,new
 974  0000               f_AES_ClearITPendingBit:
 978                     ; 457   assert_param(IS_AES_IT(AES_IT));
 980                     ; 460   if (AES_IT == AES_IT_CCIE)
 982  0000 a120          	cp	a,#32
 983  0002 2605          	jrne	L154
 984                     ; 463     AES->CR |= (uint8_t) AES_CR_CCFC;
 986  0004 721653d0      	bset	21456,#3
 989  0008 87            	retf	
 990  0009               L154:
 991                     ; 468     AES->CR |= (uint8_t) AES_CR_ERRC;
 993  0009 721853d0      	bset	21456,#4
 994                     ; 470 }
 997  000d 87            	retf	
1009                     	xdef	f_AES_ClearITPendingBit
1010                     	xdef	f_AES_GetITStatus
1011                     	xdef	f_AES_ClearFlag
1012                     	xdef	f_AES_GetFlagStatus
1013                     	xdef	f_AES_ITConfig
1014                     	xdef	f_AES_DMAConfig
1015                     	xdef	f_AES_ReadSubKey
1016                     	xdef	f_AES_ReadSubData
1017                     	xdef	f_AES_WriteSubKey
1018                     	xdef	f_AES_WriteSubData
1019                     	xdef	f_AES_Cmd
1020                     	xdef	f_AES_OperationModeConfig
1021                     	xdef	f_AES_DeInit
1040                     	end
