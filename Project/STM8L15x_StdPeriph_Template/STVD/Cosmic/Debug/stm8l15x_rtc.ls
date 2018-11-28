   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.8.32 - 23 Mar 2010
   3                     ; Generator V4.3.4 - 23 Mar 2010
   4                     ; Optimizer V4.3.3 - 10 Feb 2010
  99                     ; 232 ErrorStatus RTC_DeInit(void)
  99                     ; 233 {
 101                     .text:	section	.text,new
 102  0000               _RTC_DeInit:
 104  0000 5205          	subw	sp,#5
 105       00000005      OFST:	set	5
 108                     ; 234   ErrorStatus status = ERROR;
 110                     ; 235   uint16_t wutwfcount = 0;
 112  0002 5f            	clrw	x
 113  0003 1f02          	ldw	(OFST-3,sp),x
 114                     ; 236   uint16_t recalpfcount = 0;
 116  0005 1f04          	ldw	(OFST-1,sp),x
 117                     ; 239   RTC->WPR = 0xCA;
 119  0007 35ca5159      	mov	20825,#202
 120                     ; 240   RTC->WPR = 0x53;
 122  000b 35535159      	mov	20825,#83
 123                     ; 243   if (RTC_EnterInitMode() == ERROR)
 125  000f cd0000        	call	_RTC_EnterInitMode
 127  0012 4d            	tnz	a
 128  0013 260b          	jrne	L74
 129                     ; 245     status = ERROR;
 131  0015               LC002:
 133  0015 6b01          	ld	(OFST-4,sp),a
 134                     ; 247     RTC->WPR = 0xFF; 
 137  0017               L15:
 140  0017 35ff5159      	mov	20825,#255
 141                     ; 343   return (ErrorStatus)status;
 143  001b 7b01          	ld	a,(OFST-4,sp)
 146  001d 5b05          	addw	sp,#5
 147  001f 81            	ret	
 148  0020               L74:
 149                     ; 252     RTC->TR1 = RTC_TR1_RESET_VALUE;
 151  0020 725f5140      	clr	20800
 152                     ; 253     RTC->TR2 = RTC_TR2_RESET_VALUE;
 154  0024 725f5141      	clr	20801
 155                     ; 254     RTC->TR3 = RTC_TR3_RESET_VALUE;
 157  0028 725f5142      	clr	20802
 158                     ; 257     RTC->DR1 = RTC_DR1_RESET_VALUE;
 160  002c 35015144      	mov	20804,#1
 161                     ; 258     RTC->DR2 = RTC_DR2_RESET_VALUE;
 163  0030 35215145      	mov	20805,#33
 164                     ; 259     RTC->DR3 = RTC_DR3_RESET_VALUE;
 166  0034 725f5146      	clr	20806
 167                     ; 262     RTC->SPRERH = RTC_SPRERH_RESET_VALUE;
 169  0038 725f5150      	clr	20816
 170                     ; 263     RTC->SPRERL = RTC_SPRERL_RESET_VALUE;
 172  003c 35ff5151      	mov	20817,#255
 173                     ; 264     RTC->APRER  = RTC_APRER_RESET_VALUE;
 175  0040 357f5152      	mov	20818,#127
 176                     ; 266     RTC->TCR1 = RTC_TCR1_RESET_VALUE;
 178  0044 725f516c      	clr	20844
 179                     ; 267     RTC->TCR2 = RTC_TCR2_RESET_VALUE;
 181  0048 725f516d      	clr	20845
 182                     ; 271     RTC->CR1 = RTC_CR1_RESET_VALUE;
 184  004c 725f5148      	clr	20808
 185                     ; 272     RTC->CR2 = RTC_CR2_RESET_VALUE;
 187  0050 725f5149      	clr	20809
 188                     ; 273     RTC->CR3 = RTC_CR3_RESET_VALUE;
 190  0054 725f514a      	clr	20810
 192  0058 2007          	jra	L75
 193  005a               L35:
 194                     ; 278       wutwfcount++;
 196  005a 5c            	incw	x
 197  005b 1f02          	ldw	(OFST-3,sp),x
 198                     ; 279       RTC->ISR1 = 0;
 200  005d 725f514c      	clr	20812
 201  0061               L75:
 202                     ; 276     while (((RTC->ISR1 & RTC_ISR1_WUTWF) == RESET) && ( wutwfcount != WUTWF_TIMEOUT))
 204  0061 7204514c07    	btjt	20812,#2,L36
 206  0066 1e02          	ldw	x,(OFST-3,sp)
 207  0068 a3ffff        	cpw	x,#65535
 208  006b 26ed          	jrne	L35
 209  006d               L36:
 210                     ; 282     if ((RTC->ISR1 & RTC_ISR1_WUTWF) == RESET)
 212  006d 7204514c02    	btjt	20812,#2,L56
 213                     ; 284       status = ERROR;
 214                     ; 286       RTC->WPR = 0xFF; 
 216  0072 2061          	jp	L301
 217  0074               L56:
 218                     ; 291       RTC->CR1 = RTC_CR1_RESET_VALUE;
 220  0074 725f5148      	clr	20808
 221                     ; 294       RTC->WUTRH = RTC_WUTRH_RESET_VALUE;
 223  0078 35ff5154      	mov	20820,#255
 224                     ; 295       RTC->WUTRL = RTC_WUTRL_RESET_VALUE;
 226  007c 35ff5155      	mov	20821,#255
 227                     ; 298       RTC->ALRMAR1 = RTC_ALRMAR1_RESET_VALUE;
 229  0080 725f515c      	clr	20828
 230                     ; 299       RTC->ALRMAR2 = RTC_ALRMAR2_RESET_VALUE;
 232  0084 725f515d      	clr	20829
 233                     ; 300       RTC->ALRMAR3 = RTC_ALRMAR3_RESET_VALUE;
 235  0088 725f515e      	clr	20830
 236                     ; 301       RTC->ALRMAR4 = RTC_ALRMAR4_RESET_VALUE;
 238  008c 725f515f      	clr	20831
 239                     ; 303       RTC->ALRMASSRH = RTC_ALRMASSRH_RESET_VALUE;
 241  0090 725f5164      	clr	20836
 242                     ; 304       RTC->ALRMASSRL = RTC_ALRMASSRL_RESET_VALUE;
 244  0094 725f5165      	clr	20837
 245                     ; 305       RTC->ALRMASSMSKR = RTC_ALRMASSMSKR_RESET_VALUE;
 247  0098 725f5166      	clr	20838
 248                     ; 308       RTC->ISR1 = (uint8_t)0x00;
 250  009c 725f514c      	clr	20812
 251                     ; 309       RTC->ISR2 = RTC_ISR2_RESET_VALUE;
 253  00a0 725f514d      	clr	20813
 254                     ; 311       if ((RTC->ISR1 & RTC_ISR1_RECALPF) != RESET)
 256  00a4 7203514c11    	btjf	20812,#1,L17
 258  00a9 2003          	jra	L57
 259  00ab               L37:
 260                     ; 315           recalpfcount++;
 262  00ab 5c            	incw	x
 263  00ac 1f04          	ldw	(OFST-1,sp),x
 264  00ae               L57:
 265                     ; 313         while (((RTC->ISR1 & RTC_ISR1_RECALPF) != RESET) && (recalpfcount != RECALPF_TIMEOUT))
 267  00ae 7203514c07    	btjf	20812,#1,L17
 269  00b3 1e04          	ldw	x,(OFST-1,sp)
 270  00b5 a3ffff        	cpw	x,#65535
 271  00b8 26f1          	jrne	L37
 272  00ba               L17:
 273                     ; 318       if ((RTC->ISR1 & RTC_ISR1_RECALPF) == RESET)
 275  00ba 7202514c16    	btjt	20812,#1,L301
 276                     ; 320         RTC->CALRH = RTC_CALRH_RESET_VALUE;
 278  00bf 725f516a      	clr	20842
 279                     ; 321         RTC->CALRL = RTC_CALRL_RESET_VALUE;
 281  00c3 725f516b      	clr	20843
 282                     ; 323         if (RTC_WaitForSynchro() == ERROR)
 284  00c7 cd0000        	call	_RTC_WaitForSynchro
 286  00ca 4d            	tnz	a
 287                     ; 325           status = ERROR;
 289  00cb 2603cc0015    	jreq	LC002
 290                     ; 329           status = SUCCESS;
 292  00d0 a601          	ld	a,#1
 293  00d2 cc0015        	jp	LC002
 294  00d5               L301:
 295                     ; 334         status = ERROR;
 298  00d5 0f01          	clr	(OFST-4,sp)
 299                     ; 338       RTC->WPR = 0xFF; 
 300  00d7 cc0017        	jra	L15
 400                     ; 359 ErrorStatus RTC_Init(RTC_InitTypeDef* RTC_InitStruct)
 400                     ; 360 {
 401                     .text:	section	.text,new
 402  0000               _RTC_Init:
 404  0000 89            	pushw	x
 405  0001 88            	push	a
 406       00000001      OFST:	set	1
 409                     ; 361   ErrorStatus status = ERROR;
 411                     ; 364   assert_param(IS_RTC_HOUR_FORMAT(RTC_InitStruct->RTC_HourFormat));
 413                     ; 365   assert_param(IS_RTC_ASYNCH_PREDIV(RTC_InitStruct->RTC_AsynchPrediv));
 415                     ; 366   assert_param(IS_RTC_SYNCH_PREDIV(RTC_InitStruct->RTC_SynchPrediv));
 417                     ; 369   RTC->WPR = 0xCA;
 419  0002 35ca5159      	mov	20825,#202
 420                     ; 370   RTC->WPR = 0x53;
 422  0006 35535159      	mov	20825,#83
 423                     ; 373   if (RTC_EnterInitMode() == ERROR)
 425  000a cd0000        	call	_RTC_EnterInitMode
 427  000d 4d            	tnz	a
 428                     ; 375     status = ERROR;
 431  000e 2727          	jreq	L561
 432                     ; 380     RTC->CR1 &= ((uint8_t)~( RTC_CR1_FMT ));
 434  0010 721d5148      	bres	20808,#6
 435                     ; 383     RTC->CR1 |=  ((uint8_t)(RTC_InitStruct->RTC_HourFormat));
 437  0014 1e02          	ldw	x,(OFST+1,sp)
 438  0016 c65148        	ld	a,20808
 439  0019 fa            	or	a,(x)
 440  001a c75148        	ld	20808,a
 441                     ; 386     RTC->SPRERH = (uint8_t)(RTC_InitStruct->RTC_SynchPrediv >> 8);
 443  001d 4f            	clr	a
 444  001e ee02          	ldw	x,(2,x)
 445  0020 01            	rrwa	x,a
 446  0021 9f            	ld	a,xl
 447  0022 c75150        	ld	20816,a
 448                     ; 387     RTC->SPRERL = (uint8_t)(RTC_InitStruct->RTC_SynchPrediv);
 450  0025 1e02          	ldw	x,(OFST+1,sp)
 451  0027 e603          	ld	a,(3,x)
 452  0029 c75151        	ld	20817,a
 453                     ; 388     RTC->APRER =  (uint8_t)(RTC_InitStruct->RTC_AsynchPrediv);
 455  002c e601          	ld	a,(1,x)
 456  002e c75152        	ld	20818,a
 457                     ; 391     RTC->ISR1 &= (uint8_t)~RTC_ISR1_INIT;
 459                     ; 393     status = SUCCESS;
 461  0031 a601          	ld	a,#1
 462  0033 721f514c      	bres	20812,#7
 463  0037               L561:
 464                     ; 397   RTC->WPR = 0xFF; 
 466  0037 35ff5159      	mov	20825,#255
 467                     ; 400   return (ErrorStatus)(status);
 471  003b 5b03          	addw	sp,#3
 472  003d 81            	ret	
 509                     ; 410 void RTC_StructInit(RTC_InitTypeDef* RTC_InitStruct)
 509                     ; 411 {
 510                     .text:	section	.text,new
 511  0000               _RTC_StructInit:
 515                     ; 413   RTC_InitStruct->RTC_HourFormat = RTC_HourFormat_24;
 517  0000 7f            	clr	(x)
 518                     ; 416   RTC_InitStruct->RTC_AsynchPrediv = RTC_APRER_RESET_VALUE;
 520  0001 a67f          	ld	a,#127
 521  0003 e701          	ld	(1,x),a
 522                     ; 419   RTC_InitStruct->RTC_SynchPrediv = RTC_SPRERL_RESET_VALUE;
 524  0005 90ae00ff      	ldw	y,#255
 525  0009 ef02          	ldw	(2,x),y
 526                     ; 420 }
 529  000b 81            	ret	
 585                     ; 430 void RTC_WriteProtectionCmd(FunctionalState NewState)
 585                     ; 431 {
 586                     .text:	section	.text,new
 587  0000               _RTC_WriteProtectionCmd:
 591                     ; 433   assert_param(IS_FUNCTIONAL_STATE(NewState));
 593                     ; 435   if (NewState != DISABLE)
 595  0000 4d            	tnz	a
 596  0001 2705          	jreq	L532
 597                     ; 438     RTC->WPR = RTC_WPR_EnableKey;
 599  0003 35ff5159      	mov	20825,#255
 602  0007 81            	ret	
 603  0008               L532:
 604                     ; 443     RTC->WPR = RTC_WPR_DisableKey1;
 606  0008 35ca5159      	mov	20825,#202
 607                     ; 444     RTC->WPR = RTC_WPR_DisableKey2;
 609  000c 35535159      	mov	20825,#83
 610                     ; 446 }
 613  0010 81            	ret	
 656                     ; 458 ErrorStatus RTC_EnterInitMode(void)
 656                     ; 459 {
 657                     .text:	section	.text,new
 658  0000               _RTC_EnterInitMode:
 660  0000 5203          	subw	sp,#3
 661       00000003      OFST:	set	3
 664                     ; 460   ErrorStatus status = ERROR;
 666                     ; 461   uint16_t initfcount = 0;
 668  0002 5f            	clrw	x
 669  0003 1f02          	ldw	(OFST-1,sp),x
 670                     ; 464   if ((RTC->ISR1 & RTC_ISR1_INITF) == RESET)
 672  0005 720c514c13    	btjt	20812,#6,L162
 673                     ; 467     RTC->ISR1 = (uint8_t)RTC_ISR1_INIT;
 675  000a 3580514c      	mov	20812,#128
 677  000e 2003          	jra	L762
 678  0010               L362:
 679                     ; 472       initfcount++;
 681  0010 5c            	incw	x
 682  0011 1f02          	ldw	(OFST-1,sp),x
 683  0013               L762:
 684                     ; 470     while (((RTC->ISR1 & RTC_ISR1_INITF) == RESET) && ( initfcount != INITF_TIMEOUT))
 686  0013 720c514c05    	btjt	20812,#6,L162
 688  0018 a3ffff        	cpw	x,#65535
 689  001b 26f3          	jrne	L362
 690  001d               L162:
 691                     ; 476   if ((RTC->ISR1 & RTC_ISR1_INITF) == RESET)
 693  001d 720c514c03    	btjt	20812,#6,L572
 694                     ; 478     status = ERROR;
 696  0022 4f            	clr	a
 698  0023 2002          	jra	L772
 699  0025               L572:
 700                     ; 482     status = SUCCESS;
 702  0025 a601          	ld	a,#1
 703  0027               L772:
 704                     ; 485   return (ErrorStatus)status;
 708  0027 5b03          	addw	sp,#3
 709  0029 81            	ret	
 732                     ; 498 void RTC_ExitInitMode(void)
 732                     ; 499 {
 733                     .text:	section	.text,new
 734  0000               _RTC_ExitInitMode:
 738                     ; 501   RTC->ISR1 &= (uint8_t)~RTC_ISR1_INIT;
 740  0000 721f514c      	bres	20812,#7
 741                     ; 502 }
 744  0004 81            	ret	
 787                     ; 527 ErrorStatus RTC_WaitForSynchro(void)
 787                     ; 528 {
 788                     .text:	section	.text,new
 789  0000               _RTC_WaitForSynchro:
 791  0000 5203          	subw	sp,#3
 792       00000003      OFST:	set	3
 795                     ; 529   uint16_t rsfcount = 0;
 797  0002 5f            	clrw	x
 798  0003 1f02          	ldw	(OFST-1,sp),x
 799                     ; 530   ErrorStatus status = ERROR;
 801                     ; 533   RTC->WPR = 0xCA;
 803  0005 35ca5159      	mov	20825,#202
 804                     ; 534   RTC->WPR = 0x53;
 806  0009 35535159      	mov	20825,#83
 807                     ; 537   RTC->ISR1 &= (uint8_t)~(RTC_ISR1_RSF | RTC_ISR1_INIT);
 809  000d c6514c        	ld	a,20812
 810  0010 a45f          	and	a,#95
 811  0012 c7514c        	ld	20812,a
 813  0015 2003          	jra	L333
 814  0017               L133:
 815                     ; 542     rsfcount++;
 817  0017 5c            	incw	x
 818  0018 1f02          	ldw	(OFST-1,sp),x
 819  001a               L333:
 820                     ; 540   while (((RTC->ISR1 & RTC_ISR1_RSF) == RESET) && ( rsfcount != RSF_TIMEOUT))
 822  001a 720a514c05    	btjt	20812,#5,L733
 824  001f a3ffff        	cpw	x,#65535
 825  0022 26f3          	jrne	L133
 826  0024               L733:
 827                     ; 546   if ((RTC->ISR1 & RTC_ISR1_RSF) != RESET)
 829  0024 720b514c06    	btjf	20812,#5,L143
 830                     ; 548     status = SUCCESS;
 832  0029 a601          	ld	a,#1
 833  002b 6b01          	ld	(OFST-2,sp),a
 835  002d 2002          	jra	L343
 836  002f               L143:
 837                     ; 552     status = ERROR;
 839  002f 0f01          	clr	(OFST-2,sp)
 840  0031               L343:
 841                     ; 556   RTC->WPR = 0xFF; 
 843  0031 35ff5159      	mov	20825,#255
 844                     ; 558   return (ErrorStatus)status;
 846  0035 7b01          	ld	a,(OFST-2,sp)
 849  0037 5b03          	addw	sp,#3
 850  0039 81            	ret	
 885                     ; 568 void RTC_RatioCmd(FunctionalState NewState)
 885                     ; 569 {
 886                     .text:	section	.text,new
 887  0000               _RTC_RatioCmd:
 891                     ; 571   assert_param(IS_FUNCTIONAL_STATE(NewState));
 893                     ; 574   RTC->WPR = 0xCA;
 895  0000 35ca5159      	mov	20825,#202
 896                     ; 575   RTC->WPR = 0x53;
 898  0004 35535159      	mov	20825,#83
 899                     ; 577   if (NewState != DISABLE)
 901  0008 4d            	tnz	a
 902  0009 2706          	jreq	L363
 903                     ; 580     RTC->CR1 |= (uint8_t)RTC_CR1_RATIO;
 905  000b 721a5148      	bset	20808,#5
 907  000f 2004          	jra	L563
 908  0011               L363:
 909                     ; 585     RTC->CR1 &= (uint8_t)~RTC_CR1_RATIO;
 911  0011 721b5148      	bres	20808,#5
 912  0015               L563:
 913                     ; 589   RTC->WPR = 0xFF; 
 915  0015 35ff5159      	mov	20825,#255
 916                     ; 590 }
 919  0019 81            	ret	
 955                     ; 598 void RTC_BypassShadowCmd(FunctionalState NewState)
 955                     ; 599 {
 956                     .text:	section	.text,new
 957  0000               _RTC_BypassShadowCmd:
 961                     ; 601   assert_param(IS_FUNCTIONAL_STATE(NewState));
 963                     ; 604   RTC->WPR = 0xCA;
 965  0000 35ca5159      	mov	20825,#202
 966                     ; 605   RTC->WPR = 0x53;
 968  0004 35535159      	mov	20825,#83
 969                     ; 607   if (NewState != DISABLE)
 971  0008 4d            	tnz	a
 972  0009 2706          	jreq	L504
 973                     ; 610     RTC->CR1 |= (uint8_t)RTC_CR1_BYPSHAD;
 975  000b 72185148      	bset	20808,#4
 977  000f 2004          	jra	L704
 978  0011               L504:
 979                     ; 615     RTC->CR1 &= (uint8_t)~RTC_CR1_BYPSHAD;
 981  0011 72195148      	bres	20808,#4
 982  0015               L704:
 983                     ; 619   RTC->WPR = 0xFF; 
 985  0015 35ff5159      	mov	20825,#255
 986                     ; 620 }
 989  0019 81            	ret	
1135                     ; 659 ErrorStatus RTC_SetTime(RTC_Format_TypeDef RTC_Format,
1135                     ; 660                         RTC_TimeTypeDef* RTC_TimeStruct)
1135                     ; 661 {
1136                     .text:	section	.text,new
1137  0000               _RTC_SetTime:
1139  0000 88            	push	a
1140  0001 88            	push	a
1141       00000001      OFST:	set	1
1144                     ; 662   ErrorStatus status = ERROR;
1146                     ; 663   uint8_t temp = 0;
1148                     ; 666   assert_param(IS_RTC_FORMAT(RTC_Format));
1150                     ; 668   if (RTC_Format == RTC_Format_BIN)
1152                     ; 671     if ((RTC->CR1 & RTC_CR1_FMT) != RESET)
1153                     ; 673       assert_param(IS_RTC_HOUR12_MAX(RTC_TimeStruct->RTC_Hours));
1155                     ; 674       assert_param(IS_RTC_HOUR12_MIN(RTC_TimeStruct->RTC_Hours));
1158                     ; 678       assert_param(IS_RTC_HOUR24(RTC_TimeStruct->RTC_Hours));
1160                     ; 680     assert_param(IS_RTC_MINUTES(RTC_TimeStruct->RTC_Minutes));
1162                     ; 681     assert_param(IS_RTC_SECONDS(RTC_TimeStruct->RTC_Seconds));
1165                     ; 686     if ((RTC->CR1 & RTC_CR1_FMT) != RESET)
1167                     ; 688       assert_param(IS_RTC_HOUR12_MAX(Bcd2ToByte(RTC_TimeStruct->RTC_Hours)));
1169                     ; 689       assert_param(IS_RTC_HOUR12_MIN(Bcd2ToByte(RTC_TimeStruct->RTC_Hours)));
1173  0002 c65148        	ld	a,20808
1174                     ; 693       assert_param(IS_RTC_HOUR24(Bcd2ToByte(RTC_TimeStruct->RTC_Hours)));
1176                     ; 695     assert_param(IS_RTC_MINUTES(Bcd2ToByte(RTC_TimeStruct->RTC_Minutes)));
1178                     ; 696     assert_param(IS_RTC_SECONDS(Bcd2ToByte(RTC_TimeStruct->RTC_Seconds)));
1180                     ; 701   RTC->WPR = 0xCA;
1182  0005 35ca5159      	mov	20825,#202
1183                     ; 702   RTC->WPR = 0x53;
1185  0009 35535159      	mov	20825,#83
1186                     ; 705   if (RTC_EnterInitMode() == ERROR)
1188  000d cd0000        	call	_RTC_EnterInitMode
1190  0010 4d            	tnz	a
1191  0011 2606          	jrne	L515
1192                     ; 707     status = ERROR;
1194                     ; 709     RTC->WPR = 0xFF; 
1196  0013 35ff5159      	mov	20825,#255
1198  0017 2059          	jra	L715
1199  0019               L515:
1200                     ; 714     if ((RTC->CR1 & RTC_CR1_FMT) != RESET)
1202  0019 720d514808    	btjf	20808,#6,L125
1203                     ; 716       assert_param(IS_RTC_H12(RTC_TimeStruct->RTC_H12));
1205                     ; 717       temp = RTC_TimeStruct->RTC_H12;
1207  001e 1e05          	ldw	x,(OFST+4,sp)
1208  0020 e603          	ld	a,(3,x)
1209  0022 6b01          	ld	(OFST+0,sp),a
1211  0024 2002          	jra	L325
1212  0026               L125:
1213                     ; 721       temp = 0;
1215  0026 0f01          	clr	(OFST+0,sp)
1216  0028               L325:
1217                     ; 724     if (RTC_Format != RTC_Format_BIN)
1219  0028 7b02          	ld	a,(OFST+1,sp)
1220  002a 270f          	jreq	L525
1221                     ; 726       RTC->TR1 = (uint8_t)(RTC_TimeStruct->RTC_Seconds);
1223  002c 1e05          	ldw	x,(OFST+4,sp)
1224  002e e602          	ld	a,(2,x)
1225  0030 c75140        	ld	20800,a
1226                     ; 727       RTC->TR2 = (uint8_t)(RTC_TimeStruct->RTC_Minutes) ;
1228  0033 e601          	ld	a,(1,x)
1229  0035 c75141        	ld	20801,a
1230                     ; 728       RTC->TR3 = (uint8_t)( temp | RTC_TimeStruct->RTC_Hours) ;
1232  0038 f6            	ld	a,(x)
1234  0039 201a          	jra	L725
1235  003b               L525:
1236                     ; 732       RTC->TR1 = (uint8_t)(ByteToBcd2(RTC_TimeStruct->RTC_Seconds));
1238  003b 1e05          	ldw	x,(OFST+4,sp)
1239  003d e602          	ld	a,(2,x)
1240  003f cd0000        	call	L3_ByteToBcd2
1242  0042 c75140        	ld	20800,a
1243                     ; 733       RTC->TR2 = (uint8_t)(ByteToBcd2(RTC_TimeStruct->RTC_Minutes)) ;
1245  0045 1e05          	ldw	x,(OFST+4,sp)
1246  0047 e601          	ld	a,(1,x)
1247  0049 cd0000        	call	L3_ByteToBcd2
1249  004c c75141        	ld	20801,a
1250                     ; 734       RTC->TR3 = (uint8_t)( temp | ByteToBcd2(RTC_TimeStruct->RTC_Hours));
1252  004f 1e05          	ldw	x,(OFST+4,sp)
1253  0051 f6            	ld	a,(x)
1254  0052 cd0000        	call	L3_ByteToBcd2
1256  0055               L725:
1257  0055 1a01          	or	a,(OFST+0,sp)
1258  0057 c75142        	ld	20802,a
1259                     ; 737     (void)(RTC->DR3);
1261  005a c65146        	ld	a,20806
1262                     ; 740     RTC->ISR1 &= (uint8_t)~RTC_ISR1_INIT;
1264  005d 721f514c      	bres	20812,#7
1265                     ; 743     RTC->WPR = 0xFF; 
1267  0061 35ff5159      	mov	20825,#255
1268                     ; 746     if ((RTC->CR1 & RTC_CR1_BYPSHAD) == RESET)
1270  0065 7208514806    	btjt	20808,#4,L135
1271                     ; 748       if (RTC_WaitForSynchro() == ERROR)
1273  006a cd0000        	call	_RTC_WaitForSynchro
1275  006d 4d            	tnz	a
1276                     ; 750         status = ERROR;
1279  006e 2702          	jreq	L715
1280                     ; 754         status = SUCCESS;
1281  0070               L135:
1282                     ; 759       status = SUCCESS;
1285  0070 a601          	ld	a,#1
1286  0072               L715:
1287                     ; 763   return (ErrorStatus)status;
1291  0072 85            	popw	x
1292  0073 81            	ret	
1329                     ; 775 void RTC_TimeStructInit(RTC_TimeTypeDef* RTC_TimeStruct)
1329                     ; 776 {
1330                     .text:	section	.text,new
1331  0000               _RTC_TimeStructInit:
1335                     ; 778   RTC_TimeStruct->RTC_H12 = RTC_H12_AM;
1337  0000 6f03          	clr	(3,x)
1338                     ; 779   RTC_TimeStruct->RTC_Hours = 0;
1340  0002 7f            	clr	(x)
1341                     ; 780   RTC_TimeStruct->RTC_Minutes = 0;
1343  0003 6f01          	clr	(1,x)
1344                     ; 781   RTC_TimeStruct->RTC_Seconds = 0;
1346  0005 6f02          	clr	(2,x)
1347                     ; 782 }
1350  0007 81            	ret	
1405                     ; 798 void RTC_GetTime(RTC_Format_TypeDef RTC_Format,
1405                     ; 799                  RTC_TimeTypeDef* RTC_TimeStruct)
1405                     ; 800 {
1406                     .text:	section	.text,new
1407  0000               _RTC_GetTime:
1409  0000 88            	push	a
1410  0001 88            	push	a
1411       00000001      OFST:	set	1
1414                     ; 801   uint8_t  tmpreg = 0;
1416                     ; 804   assert_param(IS_RTC_FORMAT(RTC_Format));
1418                     ; 808   RTC_TimeStruct->RTC_Seconds = RTC->TR1;
1420  0002 1e05          	ldw	x,(OFST+4,sp)
1421  0004 c65140        	ld	a,20800
1422  0007 e702          	ld	(2,x),a
1423                     ; 811   RTC_TimeStruct->RTC_Minutes = RTC->TR2;
1425  0009 c65141        	ld	a,20801
1426  000c e701          	ld	(1,x),a
1427                     ; 814   tmpreg = (uint8_t)RTC->TR3;
1429  000e c65142        	ld	a,20802
1430  0011 6b01          	ld	(OFST+0,sp),a
1431                     ; 817   (void) (RTC->DR3) ;
1433  0013 c65146        	ld	a,20806
1434                     ; 821   RTC_TimeStruct->RTC_Hours = (uint8_t)(tmpreg & (uint8_t)~(RTC_TR3_PM));
1436  0016 7b01          	ld	a,(OFST+0,sp)
1437  0018 a4bf          	and	a,#191
1438  001a f7            	ld	(x),a
1439                     ; 824   RTC_TimeStruct->RTC_H12 = (RTC_H12_TypeDef)(tmpreg & RTC_TR3_PM);
1441  001b 7b01          	ld	a,(OFST+0,sp)
1442  001d a440          	and	a,#64
1443  001f e703          	ld	(3,x),a
1444                     ; 827   if (RTC_Format == RTC_Format_BIN)
1446  0021 7b02          	ld	a,(OFST+1,sp)
1447  0023 2619          	jrne	L706
1448                     ; 830     RTC_TimeStruct->RTC_Hours = (uint8_t)Bcd2ToByte(RTC_TimeStruct->RTC_Hours);
1450  0025 f6            	ld	a,(x)
1451  0026 cd0000        	call	L5_Bcd2ToByte
1453  0029 1e05          	ldw	x,(OFST+4,sp)
1454  002b f7            	ld	(x),a
1455                     ; 831     RTC_TimeStruct->RTC_Minutes = (uint8_t)Bcd2ToByte(RTC_TimeStruct->RTC_Minutes);
1457  002c e601          	ld	a,(1,x)
1458  002e cd0000        	call	L5_Bcd2ToByte
1460  0031 1e05          	ldw	x,(OFST+4,sp)
1461  0033 e701          	ld	(1,x),a
1462                     ; 832     RTC_TimeStruct->RTC_Seconds = (uint8_t)Bcd2ToByte(RTC_TimeStruct->RTC_Seconds);
1464  0035 e602          	ld	a,(2,x)
1465  0037 cd0000        	call	L5_Bcd2ToByte
1467  003a 1e05          	ldw	x,(OFST+4,sp)
1468  003c e702          	ld	(2,x),a
1469  003e               L706:
1470                     ; 834 }
1473  003e 85            	popw	x
1474  003f 81            	ret	
1520                     ; 845 uint16_t RTC_GetSubSecond(void)
1520                     ; 846 {
1521                     .text:	section	.text,new
1522  0000               _RTC_GetSubSecond:
1524  0000 5206          	subw	sp,#6
1525       00000006      OFST:	set	6
1528                     ; 847   uint8_t ssrhreg = 0, ssrlreg = 0;
1532                     ; 848   uint16_t ssrreg = 0;
1534                     ; 851   ssrhreg = RTC->SSRH;
1536  0002 c65157        	ld	a,20823
1537  0005 6b03          	ld	(OFST-3,sp),a
1538                     ; 852   ssrlreg = RTC->SSRL;
1540  0007 c65158        	ld	a,20824
1541  000a 6b04          	ld	(OFST-2,sp),a
1542                     ; 855   (void) (RTC->DR3);
1544  000c c65146        	ld	a,20806
1545                     ; 858   ssrreg = (uint16_t)((uint16_t)((uint16_t)ssrhreg << 8) | (uint16_t)(ssrlreg));
1547  000f 7b04          	ld	a,(OFST-2,sp)
1548  0011 5f            	clrw	x
1549  0012 97            	ld	xl,a
1550  0013 1f01          	ldw	(OFST-5,sp),x
1551  0015 5f            	clrw	x
1552  0016 7b03          	ld	a,(OFST-3,sp)
1553  0018 97            	ld	xl,a
1554  0019 7b02          	ld	a,(OFST-4,sp)
1555  001b 01            	rrwa	x,a
1556  001c 1a01          	or	a,(OFST-5,sp)
1557  001e 01            	rrwa	x,a
1558                     ; 859   return (uint16_t)(ssrreg);
1562  001f 5b06          	addw	sp,#6
1563  0021 81            	ret	
1815                     ; 876 ErrorStatus RTC_SetDate(RTC_Format_TypeDef RTC_Format,
1815                     ; 877                         RTC_DateTypeDef* RTC_DateStruct)
1815                     ; 878 {
1816                     .text:	section	.text,new
1817  0000               _RTC_SetDate:
1819  0000 88            	push	a
1820  0001 89            	pushw	x
1821       00000002      OFST:	set	2
1824                     ; 879   ErrorStatus status = ERROR;
1826                     ; 881   if ((RTC_Format == RTC_Format_BIN) && ((RTC_DateStruct->RTC_Month & TEN_VALUE_BCD) == TEN_VALUE_BCD))
1828  0002 4d            	tnz	a
1829  0003 2610          	jrne	L757
1831  0005 1e06          	ldw	x,(OFST+4,sp)
1832  0007 e601          	ld	a,(1,x)
1833  0009 a410          	and	a,#16
1834  000b 2708          	jreq	L757
1835                     ; 883     RTC_DateStruct->RTC_Month = (RTC_Month_TypeDef)((RTC_DateStruct->RTC_Month & (uint8_t)~(TEN_VALUE_BCD)) + TEN_VALUE_BIN);
1837  000d e601          	ld	a,(1,x)
1838  000f a4ef          	and	a,#239
1839  0011 ab0a          	add	a,#10
1840  0013 e701          	ld	(1,x),a
1841  0015               L757:
1842                     ; 887   assert_param(IS_RTC_FORMAT(RTC_Format));
1844                     ; 888   if (RTC_Format == RTC_Format_BIN)
1846                     ; 890     assert_param(IS_RTC_YEAR(RTC_DateStruct->RTC_Year));
1848                     ; 891     assert_param(IS_RTC_MONTH_MIN(RTC_DateStruct->RTC_Month));
1850                     ; 892     assert_param(IS_RTC_MONTH_MAX(RTC_DateStruct->RTC_Month));
1852                     ; 893     assert_param(IS_RTC_DATE_MIN(RTC_DateStruct->RTC_Date));
1854                     ; 894     assert_param(IS_RTC_DATE_MAX(RTC_DateStruct->RTC_Date));
1857                     ; 898     assert_param(IS_RTC_YEAR(Bcd2ToByte(RTC_DateStruct->RTC_Year)));
1859                     ; 899     assert_param(IS_RTC_MONTH_MAX(Bcd2ToByte((uint8_t)RTC_DateStruct->RTC_Month)));
1861                     ; 900     assert_param(IS_RTC_MONTH_MIN(Bcd2ToByte((uint8_t)RTC_DateStruct->RTC_Month)));
1863                     ; 901     assert_param(IS_RTC_DATE_MIN(Bcd2ToByte((uint8_t)RTC_DateStruct->RTC_Date)));
1865                     ; 902     assert_param(IS_RTC_DATE_MAX(Bcd2ToByte((uint8_t)RTC_DateStruct->RTC_Date)));
1867                     ; 904   assert_param(IS_RTC_WEEKDAY(RTC_DateStruct->RTC_WeekDay));
1869                     ; 907   RTC->WPR = 0xCA;
1871  0015 35ca5159      	mov	20825,#202
1872                     ; 908   RTC->WPR = 0x53;
1874  0019 35535159      	mov	20825,#83
1875                     ; 911   if (RTC_EnterInitMode() == ERROR)
1877  001d cd0000        	call	_RTC_EnterInitMode
1879  0020 4d            	tnz	a
1880  0021 2606          	jrne	L567
1881                     ; 913     status = ERROR;
1883                     ; 915     RTC->WPR = 0xFF; 
1885  0023 35ff5159      	mov	20825,#255
1887  0027 205e          	jra	L767
1888  0029               L567:
1889                     ; 919     (void)(RTC->TR1);
1891  0029 c65140        	ld	a,20800
1892                     ; 922     if (RTC_Format != RTC_Format_BIN)
1894  002c 7b03          	ld	a,(OFST+1,sp)
1895  002e 2718          	jreq	L177
1896                     ; 924       RTC->DR1 = (uint8_t)(RTC_DateStruct->RTC_Date);
1898  0030 1e06          	ldw	x,(OFST+4,sp)
1899  0032 e602          	ld	a,(2,x)
1900  0034 c75144        	ld	20804,a
1901                     ; 925       RTC->DR2 = (uint8_t)((RTC_DateStruct->RTC_Month) | (uint8_t)((RTC_DateStruct->RTC_WeekDay) << 5));
1903  0037 f6            	ld	a,(x)
1904  0038 97            	ld	xl,a
1905  0039 a620          	ld	a,#32
1906  003b 42            	mul	x,a
1907  003c 9f            	ld	a,xl
1908  003d 1e06          	ldw	x,(OFST+4,sp)
1909  003f ea01          	or	a,(1,x)
1910  0041 c75145        	ld	20805,a
1911                     ; 926       RTC->DR3 = (uint8_t)((RTC_DateStruct->RTC_Year));
1913  0044 e603          	ld	a,(3,x)
1915  0046 2027          	jra	L377
1916  0048               L177:
1917                     ; 930       RTC->DR1 = (uint8_t)(ByteToBcd2 ((uint8_t)RTC_DateStruct->RTC_Date));
1919  0048 1e06          	ldw	x,(OFST+4,sp)
1920  004a e602          	ld	a,(2,x)
1921  004c cd0000        	call	L3_ByteToBcd2
1923  004f c75144        	ld	20804,a
1924                     ; 931       RTC->DR2 = (uint8_t)((ByteToBcd2((uint8_t)RTC_DateStruct->RTC_Month)) | (uint8_t)((RTC_DateStruct->RTC_WeekDay) << 5));
1926  0052 1e06          	ldw	x,(OFST+4,sp)
1927  0054 f6            	ld	a,(x)
1928  0055 97            	ld	xl,a
1929  0056 a620          	ld	a,#32
1930  0058 42            	mul	x,a
1931  0059 9f            	ld	a,xl
1932  005a 6b01          	ld	(OFST-1,sp),a
1933  005c 1e06          	ldw	x,(OFST+4,sp)
1934  005e e601          	ld	a,(1,x)
1935  0060 cd0000        	call	L3_ByteToBcd2
1937  0063 1a01          	or	a,(OFST-1,sp)
1938  0065 c75145        	ld	20805,a
1939                     ; 932       RTC->DR3 = (uint8_t)(ByteToBcd2((uint8_t)RTC_DateStruct->RTC_Year));
1941  0068 1e06          	ldw	x,(OFST+4,sp)
1942  006a e603          	ld	a,(3,x)
1943  006c cd0000        	call	L3_ByteToBcd2
1945  006f               L377:
1946  006f c75146        	ld	20806,a
1947                     ; 936     RTC->ISR1 &= (uint8_t)~RTC_ISR1_INIT;
1949  0072 721f514c      	bres	20812,#7
1950                     ; 939     RTC->WPR = 0xFF; 
1952  0076 35ff5159      	mov	20825,#255
1953                     ; 942     if ((RTC->CR1 & RTC_CR1_BYPSHAD) == RESET)
1955  007a 7208514806    	btjt	20808,#4,L577
1956                     ; 944       if (RTC_WaitForSynchro() == ERROR)
1958  007f cd0000        	call	_RTC_WaitForSynchro
1960  0082 4d            	tnz	a
1961                     ; 946         status = ERROR;
1964  0083 2702          	jreq	L767
1965                     ; 950         status = SUCCESS;
1966  0085               L577:
1967                     ; 955       status = SUCCESS;
1970  0085 a601          	ld	a,#1
1971  0087               L767:
1972                     ; 959   return (ErrorStatus)status;
1976  0087 5b03          	addw	sp,#3
1977  0089 81            	ret	
2014                     ; 968 void RTC_DateStructInit(RTC_DateTypeDef* RTC_DateStruct)
2014                     ; 969 {
2015                     .text:	section	.text,new
2016  0000               _RTC_DateStructInit:
2020                     ; 971   RTC_DateStruct->RTC_WeekDay = RTC_Weekday_Monday;
2022  0000 a601          	ld	a,#1
2023  0002 f7            	ld	(x),a
2024                     ; 972   RTC_DateStruct->RTC_Date = 1;
2026  0003 e702          	ld	(2,x),a
2027                     ; 973   RTC_DateStruct->RTC_Month = RTC_Month_January;
2029  0005 e701          	ld	(1,x),a
2030                     ; 974   RTC_DateStruct->RTC_Year = 0;
2032  0007 6f03          	clr	(3,x)
2033                     ; 975 }
2036  0009 81            	ret	
2091                     ; 988 void RTC_GetDate(RTC_Format_TypeDef RTC_Format,
2091                     ; 989                  RTC_DateTypeDef* RTC_DateStruct)
2091                     ; 990 {
2092                     .text:	section	.text,new
2093  0000               _RTC_GetDate:
2095  0000 88            	push	a
2096  0001 88            	push	a
2097       00000001      OFST:	set	1
2100                     ; 991   uint8_t tmpreg = 0;
2102                     ; 994   assert_param(IS_RTC_FORMAT(RTC_Format));
2104                     ; 997   (void) (RTC->TR1) ;
2106  0002 c65140        	ld	a,20800
2107                     ; 998   RTC_DateStruct->RTC_Date = (uint8_t)(RTC->DR1);
2109  0005 1e05          	ldw	x,(OFST+4,sp)
2110  0007 c65144        	ld	a,20804
2111  000a e702          	ld	(2,x),a
2112                     ; 999   tmpreg = (uint8_t)RTC->DR2;
2114  000c c65145        	ld	a,20805
2115  000f 6b01          	ld	(OFST+0,sp),a
2116                     ; 1000   RTC_DateStruct->RTC_Year = (uint8_t)(RTC->DR3);
2118  0011 c65146        	ld	a,20806
2119  0014 e703          	ld	(3,x),a
2120                     ; 1003   RTC_DateStruct->RTC_Month = (RTC_Month_TypeDef)(tmpreg & (uint8_t)(RTC_DR2_MT | RTC_DR2_MU));
2122  0016 7b01          	ld	a,(OFST+0,sp)
2123  0018 a41f          	and	a,#31
2124  001a e701          	ld	(1,x),a
2125                     ; 1004   RTC_DateStruct->RTC_WeekDay = (RTC_Weekday_TypeDef)((uint8_t)((uint8_t)tmpreg & (uint8_t)(RTC_DR2_WDU)) >> (uint8_t)5);
2127  001c 7b01          	ld	a,(OFST+0,sp)
2128  001e 4e            	swap	a
2129  001f a40e          	and	a,#14
2130  0021 44            	srl	a
2131  0022 f7            	ld	(x),a
2132                     ; 1007   if (RTC_Format == RTC_Format_BIN)
2134  0023 7b02          	ld	a,(OFST+1,sp)
2135  0025 261b          	jrne	L3501
2136                     ; 1010     RTC_DateStruct->RTC_Year = (uint8_t)Bcd2ToByte((uint8_t)RTC_DateStruct->RTC_Year);
2138  0027 e603          	ld	a,(3,x)
2139  0029 cd0000        	call	L5_Bcd2ToByte
2141  002c 1e05          	ldw	x,(OFST+4,sp)
2142  002e e703          	ld	(3,x),a
2143                     ; 1011     RTC_DateStruct->RTC_Month = (RTC_Month_TypeDef)Bcd2ToByte((uint8_t)RTC_DateStruct->RTC_Month);
2145  0030 e601          	ld	a,(1,x)
2146  0032 cd0000        	call	L5_Bcd2ToByte
2148  0035 1e05          	ldw	x,(OFST+4,sp)
2149  0037 e701          	ld	(1,x),a
2150                     ; 1012     RTC_DateStruct->RTC_Date = (uint8_t)(Bcd2ToByte((uint8_t)RTC_DateStruct->RTC_Date));
2152  0039 e602          	ld	a,(2,x)
2153  003b cd0000        	call	L5_Bcd2ToByte
2155  003e 1e05          	ldw	x,(OFST+4,sp)
2156  0040 e702          	ld	(2,x),a
2157  0042               L3501:
2158                     ; 1014 }
2161  0042 85            	popw	x
2162  0043 81            	ret	
2303                     ; 1044 void RTC_SetAlarm(RTC_Format_TypeDef RTC_Format,
2303                     ; 1045                   RTC_AlarmTypeDef* RTC_AlarmStruct)
2303                     ; 1046 {
2304                     .text:	section	.text,new
2305  0000               _RTC_SetAlarm:
2307  0000 88            	push	a
2308  0001 5205          	subw	sp,#5
2309       00000005      OFST:	set	5
2312                     ; 1047   uint8_t tmpreg1 = 0;
2314                     ; 1048   uint8_t tmpreg2 = 0;
2316                     ; 1049   uint8_t tmpreg3 = 0;
2318                     ; 1050   uint8_t tmpreg4 = 0;
2320                     ; 1053   assert_param(IS_RTC_ALARM_MASK(RTC_AlarmStruct->RTC_AlarmMask));
2322                     ; 1054   assert_param(IS_RTC_FORMAT(RTC_Format));
2324                     ; 1055   assert_param(IS_RTC_H12(RTC_AlarmStruct->RTC_AlarmTime.RTC_H12));
2326                     ; 1056   assert_param(IS_RTC_ALARM_DATEWEEKDAY_SEL(RTC_AlarmStruct->RTC_AlarmDateWeekDaySel));
2328                     ; 1059   if (RTC_Format == RTC_Format_BIN)
2330                     ; 1062     if ((RTC->CR1 & RTC_CR1_FMT) != RESET)
2331                     ; 1064       assert_param(IS_RTC_HOUR12_MAX(RTC_AlarmStruct->RTC_AlarmTime.RTC_Hours));
2333                     ; 1065       assert_param(IS_RTC_HOUR12_MIN(RTC_AlarmStruct->RTC_AlarmTime.RTC_Hours));
2336                     ; 1069       assert_param(IS_RTC_HOUR24(RTC_AlarmStruct->RTC_AlarmTime.RTC_Hours));
2338                     ; 1071     assert_param(IS_RTC_MINUTES(RTC_AlarmStruct->RTC_AlarmTime.RTC_Minutes));
2340                     ; 1072     assert_param(IS_RTC_SECONDS(RTC_AlarmStruct->RTC_AlarmTime.RTC_Seconds));
2343                     ; 1077     if ((RTC->CR1 & RTC_CR1_FMT) != RESET)
2345                     ; 1079       assert_param(IS_RTC_HOUR12_MAX(Bcd2ToByte(RTC_AlarmStruct->RTC_AlarmTime.RTC_Hours)));
2347                     ; 1080       assert_param(IS_RTC_HOUR12_MIN(Bcd2ToByte(RTC_AlarmStruct->RTC_AlarmTime.RTC_Hours)));
2351  0003 c65148        	ld	a,20808
2352                     ; 1084       assert_param(IS_RTC_HOUR24(Bcd2ToByte(RTC_AlarmStruct->RTC_AlarmTime.RTC_Hours)));
2354                     ; 1087     assert_param(IS_RTC_MINUTES(Bcd2ToByte(RTC_AlarmStruct->RTC_AlarmTime.RTC_Minutes)));
2356                     ; 1089     assert_param(IS_RTC_SECONDS(Bcd2ToByte(RTC_AlarmStruct->RTC_AlarmTime.RTC_Seconds)));
2358                     ; 1094   if ((RTC_AlarmStruct->RTC_AlarmMask & RTC_AlarmMask_DateWeekDay) == RESET )
2360                     ; 1096     if (RTC_AlarmStruct->RTC_AlarmDateWeekDaySel == RTC_AlarmDateWeekDaySel_WeekDay)
2362                     ; 1098       assert_param(IS_RTC_WEEKDAY(RTC_AlarmStruct->RTC_AlarmDateWeekDay));
2365                     ; 1102       assert_param(IS_RTC_DATE_MIN(RTC_AlarmStruct->RTC_AlarmDateWeekDay));
2367                     ; 1103       assert_param(IS_RTC_DATE_MAX(RTC_AlarmStruct->RTC_AlarmDateWeekDay));
2369                     ; 1108   RTC->WPR = 0xCA;
2371  0006 35ca5159      	mov	20825,#202
2372                     ; 1109   RTC->WPR = 0x53;
2374  000a 35535159      	mov	20825,#83
2375                     ; 1113   if (RTC_Format != RTC_Format_BIN)
2377  000e 7b06          	ld	a,(OFST+1,sp)
2378  0010 272d          	jreq	L3611
2379                     ; 1115     tmpreg1 = (uint8_t)((uint8_t)(RTC_AlarmStruct->RTC_AlarmTime.RTC_Seconds) | \
2379                     ; 1116                         (uint8_t)((uint8_t)(RTC_AlarmStruct->RTC_AlarmMask) & (uint8_t)RTC_ALRMAR1_MSK1));
2381  0012 1e09          	ldw	x,(OFST+4,sp)
2382  0014 e604          	ld	a,(4,x)
2383  0016 a480          	and	a,#128
2384  0018 ea02          	or	a,(2,x)
2385  001a 6b02          	ld	(OFST-3,sp),a
2386                     ; 1118     tmpreg2 = (uint8_t)((uint8_t)(RTC_AlarmStruct->RTC_AlarmTime.RTC_Minutes) | \
2386                     ; 1119                         (uint8_t)((uint8_t)(RTC_AlarmStruct->RTC_AlarmMask << 1) & (uint8_t)RTC_ALRMAR2_MSK2));
2388  001c e604          	ld	a,(4,x)
2389  001e 48            	sll	a
2390  001f a480          	and	a,#128
2391  0021 ea01          	or	a,(1,x)
2392  0023 6b03          	ld	(OFST-2,sp),a
2393                     ; 1121     tmpreg3 = (uint8_t)((uint8_t)((uint8_t)(RTC_AlarmStruct->RTC_AlarmTime.RTC_Hours) | \
2393                     ; 1122                                   (uint8_t)(RTC_AlarmStruct->RTC_AlarmTime.RTC_H12)) | \
2393                     ; 1123                         (uint8_t)((uint8_t)(RTC_AlarmStruct->RTC_AlarmMask << 2) & (uint8_t)RTC_ALRMAR3_MSK3));
2395  0025 ad7e          	call	LC006
2396  0027 a480          	and	a,#128
2397  0029 6b01          	ld	(OFST-4,sp),a
2398  002b e603          	ld	a,(3,x)
2399  002d fa            	or	a,(x)
2400  002e 1a01          	or	a,(OFST-4,sp)
2401  0030 6b04          	ld	(OFST-1,sp),a
2402                     ; 1125     tmpreg4 = (uint8_t)((uint8_t)((uint8_t)(RTC_AlarmStruct->RTC_AlarmDateWeekDay) | \
2402                     ; 1126                                   (uint8_t)(RTC_AlarmStruct->RTC_AlarmDateWeekDaySel)) | \
2402                     ; 1127                         (uint8_t)((uint8_t)(RTC_AlarmStruct->RTC_AlarmMask << 3) & (uint8_t)RTC_ALRMAR4_MSK4));
2404  0032 ad71          	call	LC006
2405  0034 48            	sll	a
2406  0035 a480          	and	a,#128
2407  0037 6b01          	ld	(OFST-4,sp),a
2408  0039 e605          	ld	a,(5,x)
2409  003b ea06          	or	a,(6,x)
2411  003d 2047          	jra	L5611
2412  003f               L3611:
2413                     ; 1132     tmpreg1 = (uint8_t)((ByteToBcd2(RTC_AlarmStruct->RTC_AlarmTime.RTC_Seconds)) | \
2413                     ; 1133                         (uint8_t)(RTC_AlarmStruct->RTC_AlarmMask & RTC_ALRMAR1_MSK1));
2415  003f 1e09          	ldw	x,(OFST+4,sp)
2416  0041 e604          	ld	a,(4,x)
2417  0043 a480          	and	a,#128
2418  0045 6b01          	ld	(OFST-4,sp),a
2419  0047 e602          	ld	a,(2,x)
2420  0049 cd0000        	call	L3_ByteToBcd2
2422  004c 1a01          	or	a,(OFST-4,sp)
2423  004e 6b02          	ld	(OFST-3,sp),a
2424                     ; 1135     tmpreg2 = (uint8_t)((ByteToBcd2(RTC_AlarmStruct->RTC_AlarmTime.RTC_Minutes)) | \
2424                     ; 1136                         (uint8_t)((uint8_t)(RTC_AlarmStruct->RTC_AlarmMask << 1) & (uint8_t)RTC_ALRMAR2_MSK2));
2426  0050 1e09          	ldw	x,(OFST+4,sp)
2427  0052 e604          	ld	a,(4,x)
2428  0054 48            	sll	a
2429  0055 a480          	and	a,#128
2430  0057 6b01          	ld	(OFST-4,sp),a
2431  0059 e601          	ld	a,(1,x)
2432  005b cd0000        	call	L3_ByteToBcd2
2434  005e 1a01          	or	a,(OFST-4,sp)
2435  0060 6b03          	ld	(OFST-2,sp),a
2436                     ; 1138     tmpreg3 = (uint8_t)((uint8_t)((ByteToBcd2(RTC_AlarmStruct->RTC_AlarmTime.RTC_Hours)) | \
2436                     ; 1139                                   (uint8_t)(RTC_AlarmStruct->RTC_AlarmTime.RTC_H12)) | \
2436                     ; 1140                         (uint8_t)((uint8_t)(RTC_AlarmStruct->RTC_AlarmMask << 2) & (uint8_t)RTC_ALRMAR3_MSK3));
2438  0062 1e09          	ldw	x,(OFST+4,sp)
2439  0064 ad3f          	call	LC006
2440  0066 a480          	and	a,#128
2441  0068 6b01          	ld	(OFST-4,sp),a
2442  006a f6            	ld	a,(x)
2443  006b cd0000        	call	L3_ByteToBcd2
2445  006e 1e09          	ldw	x,(OFST+4,sp)
2446  0070 ea03          	or	a,(3,x)
2447  0072 1a01          	or	a,(OFST-4,sp)
2448  0074 6b04          	ld	(OFST-1,sp),a
2449                     ; 1142     tmpreg4 = (uint8_t)((uint8_t)((ByteToBcd2(RTC_AlarmStruct->RTC_AlarmDateWeekDay)) | \
2449                     ; 1143                                   (uint8_t)(RTC_AlarmStruct->RTC_AlarmDateWeekDaySel)) | \
2449                     ; 1144                         (uint8_t)((uint8_t)(RTC_AlarmStruct->RTC_AlarmMask << 3) & (uint8_t)(RTC_ALRMAR4_MSK4)));
2451  0076 ad2d          	call	LC006
2452  0078 48            	sll	a
2453  0079 a480          	and	a,#128
2454  007b 6b01          	ld	(OFST-4,sp),a
2455  007d e606          	ld	a,(6,x)
2456  007f cd0000        	call	L3_ByteToBcd2
2458  0082 1e09          	ldw	x,(OFST+4,sp)
2459  0084 ea05          	or	a,(5,x)
2460  0086               L5611:
2461  0086 1a01          	or	a,(OFST-4,sp)
2462  0088 6b05          	ld	(OFST+0,sp),a
2463                     ; 1148   RTC->ALRMAR1 = tmpreg1;
2465  008a 7b02          	ld	a,(OFST-3,sp)
2466  008c c7515c        	ld	20828,a
2467                     ; 1149   RTC->ALRMAR2 = tmpreg2;
2469  008f 7b03          	ld	a,(OFST-2,sp)
2470  0091 c7515d        	ld	20829,a
2471                     ; 1150   RTC->ALRMAR3 = tmpreg3;
2473  0094 7b04          	ld	a,(OFST-1,sp)
2474  0096 c7515e        	ld	20830,a
2475                     ; 1151   RTC->ALRMAR4 = tmpreg4;
2477  0099 7b05          	ld	a,(OFST+0,sp)
2478  009b c7515f        	ld	20831,a
2479                     ; 1154   RTC->WPR = 0xFF; 
2481  009e 35ff5159      	mov	20825,#255
2482                     ; 1155 }
2485  00a2 5b06          	addw	sp,#6
2486  00a4 81            	ret	
2487  00a5               LC006:
2488  00a5 e604          	ld	a,(4,x)
2489  00a7 48            	sll	a
2490  00a8 48            	sll	a
2491  00a9 81            	ret	
2529                     ; 1165 void RTC_AlarmStructInit(RTC_AlarmTypeDef* RTC_AlarmStruct)
2529                     ; 1166 {
2530                     .text:	section	.text,new
2531  0000               _RTC_AlarmStructInit:
2535                     ; 1168   RTC_AlarmStruct->RTC_AlarmTime.RTC_H12 = RTC_H12_AM;
2537  0000 6f03          	clr	(3,x)
2538                     ; 1169   RTC_AlarmStruct->RTC_AlarmTime.RTC_Hours = 0;
2540  0002 7f            	clr	(x)
2541                     ; 1170   RTC_AlarmStruct->RTC_AlarmTime.RTC_Minutes = 0;
2543  0003 6f01          	clr	(1,x)
2544                     ; 1171   RTC_AlarmStruct->RTC_AlarmTime.RTC_Seconds = 0;
2546  0005 6f02          	clr	(2,x)
2547                     ; 1174   RTC_AlarmStruct->RTC_AlarmDateWeekDaySel = RTC_AlarmDateWeekDaySel_Date;
2549  0007 6f05          	clr	(5,x)
2550                     ; 1175   RTC_AlarmStruct->RTC_AlarmDateWeekDay = 1;
2552  0009 a601          	ld	a,#1
2553  000b e706          	ld	(6,x),a
2554                     ; 1178   RTC_AlarmStruct->RTC_AlarmMask = RTC_AlarmMask_All;
2556  000d a6f0          	ld	a,#240
2557  000f e704          	ld	(4,x),a
2558                     ; 1179 }
2561  0011 81            	ret	
2644                     ; 1188 void RTC_GetAlarm(RTC_Format_TypeDef RTC_Format,
2644                     ; 1189                   RTC_AlarmTypeDef* RTC_AlarmStruct)
2644                     ; 1190 {
2645                     .text:	section	.text,new
2646  0000               _RTC_GetAlarm:
2648  0000 88            	push	a
2649  0001 5204          	subw	sp,#4
2650       00000004      OFST:	set	4
2653                     ; 1191   uint8_t tmpreg1 = 0;
2655                     ; 1192   uint8_t tmpreg2 = 0;
2657                     ; 1193   uint8_t tmpreg3 = 0;
2659                     ; 1194   uint8_t tmpreg4 = 0;
2661                     ; 1195   uint8_t alarmmask = 0;
2663                     ; 1198   assert_param(IS_RTC_FORMAT(RTC_Format));
2665                     ; 1201   tmpreg1 = (uint8_t)RTC->ALRMAR1;
2667  0003 c6515c        	ld	a,20828
2668  0006 6b04          	ld	(OFST+0,sp),a
2669                     ; 1202   tmpreg2 = (uint8_t)RTC->ALRMAR2;
2671  0008 c6515d        	ld	a,20829
2672  000b 6b01          	ld	(OFST-3,sp),a
2673                     ; 1203   tmpreg3 = (uint8_t)RTC->ALRMAR3;
2675  000d c6515e        	ld	a,20830
2676  0010 6b02          	ld	(OFST-2,sp),a
2677                     ; 1204   tmpreg4 = (uint8_t)RTC->ALRMAR4;
2679  0012 c6515f        	ld	a,20831
2680  0015 6b03          	ld	(OFST-1,sp),a
2681                     ; 1207   RTC_AlarmStruct->RTC_AlarmTime.RTC_Seconds = (uint8_t)((uint8_t)tmpreg1 & (uint8_t)((uint8_t)RTC_ALRMAR1_ST | (uint8_t)RTC_ALRMAR1_SU));
2683  0017 7b04          	ld	a,(OFST+0,sp)
2684  0019 1e08          	ldw	x,(OFST+4,sp)
2685  001b a47f          	and	a,#127
2686  001d e702          	ld	(2,x),a
2687                     ; 1208   alarmmask = (uint8_t)(tmpreg1 & RTC_ALRMAR1_MSK1);
2689  001f 7b04          	ld	a,(OFST+0,sp)
2690  0021 a480          	and	a,#128
2691  0023 6b04          	ld	(OFST+0,sp),a
2692                     ; 1211   RTC_AlarmStruct->RTC_AlarmTime.RTC_Minutes = (uint8_t)((uint8_t)tmpreg2 & (uint8_t)((uint8_t)RTC_ALRMAR2_MNT | (uint8_t)RTC_ALRMAR2_MNU));
2694  0025 7b01          	ld	a,(OFST-3,sp)
2695  0027 a47f          	and	a,#127
2696  0029 e701          	ld	(1,x),a
2697                     ; 1212   alarmmask = (uint8_t)((alarmmask) | (uint8_t)((uint8_t)(tmpreg2 & RTC_ALRMAR2_MSK2) >> 1));
2699  002b 7b01          	ld	a,(OFST-3,sp)
2700  002d a480          	and	a,#128
2701  002f 44            	srl	a
2702  0030 1a04          	or	a,(OFST+0,sp)
2703  0032 6b04          	ld	(OFST+0,sp),a
2704                     ; 1215   RTC_AlarmStruct->RTC_AlarmTime.RTC_Hours = (uint8_t)((uint8_t)tmpreg3 & (uint8_t)((uint8_t)RTC_ALRMAR3_HT | (uint8_t)RTC_ALRMAR3_HU));
2706  0034 7b02          	ld	a,(OFST-2,sp)
2707  0036 a43f          	and	a,#63
2708  0038 f7            	ld	(x),a
2709                     ; 1216   RTC_AlarmStruct->RTC_AlarmTime.RTC_H12 = (RTC_H12_TypeDef)((uint8_t)tmpreg3 & (uint8_t)RTC_ALRMAR3_PM);
2711  0039 7b02          	ld	a,(OFST-2,sp)
2712  003b a440          	and	a,#64
2713  003d e703          	ld	(3,x),a
2714                     ; 1217   alarmmask = (uint8_t)((alarmmask) | (uint8_t)((uint8_t)((uint8_t)tmpreg3 & (uint8_t)RTC_ALRMAR3_MSK3) >> 2));
2716  003f 7b02          	ld	a,(OFST-2,sp)
2717  0041 a480          	and	a,#128
2718  0043 44            	srl	a
2719  0044 44            	srl	a
2720  0045 1a04          	or	a,(OFST+0,sp)
2721  0047 6b04          	ld	(OFST+0,sp),a
2722                     ; 1220   RTC_AlarmStruct->RTC_AlarmDateWeekDay = (uint8_t)((uint8_t)tmpreg4 & (uint8_t)((uint8_t)RTC_ALRMAR4_DT | (uint8_t)RTC_ALRMAR4_DU));
2724  0049 7b03          	ld	a,(OFST-1,sp)
2725  004b a43f          	and	a,#63
2726  004d e706          	ld	(6,x),a
2727                     ; 1221   RTC_AlarmStruct->RTC_AlarmDateWeekDaySel = (RTC_AlarmDateWeekDaySel_TypeDef)((uint8_t)tmpreg4 & (uint8_t)RTC_ALRMAR4_WDSEL);
2729  004f 7b03          	ld	a,(OFST-1,sp)
2730  0051 a440          	and	a,#64
2731  0053 e705          	ld	(5,x),a
2732                     ; 1222   alarmmask = (uint8_t)((alarmmask) | (uint8_t)((uint8_t)((uint8_t)tmpreg4 & RTC_ALRMAR4_MSK4) >> 3));
2734  0055 7b03          	ld	a,(OFST-1,sp)
2735  0057 a480          	and	a,#128
2736  0059 44            	srl	a
2737  005a 44            	srl	a
2738  005b 44            	srl	a
2739  005c 1a04          	or	a,(OFST+0,sp)
2740  005e 6b04          	ld	(OFST+0,sp),a
2741                     ; 1224   RTC_AlarmStruct->RTC_AlarmMask = alarmmask;
2743  0060 e704          	ld	(4,x),a
2744                     ; 1226   if (RTC_Format == RTC_Format_BIN)
2746  0062 7b05          	ld	a,(OFST+1,sp)
2747  0064 2622          	jrne	L5421
2748                     ; 1228     RTC_AlarmStruct->RTC_AlarmTime.RTC_Hours = Bcd2ToByte(RTC_AlarmStruct->RTC_AlarmTime.RTC_Hours);
2750  0066 f6            	ld	a,(x)
2751  0067 cd0000        	call	L5_Bcd2ToByte
2753  006a 1e08          	ldw	x,(OFST+4,sp)
2754  006c f7            	ld	(x),a
2755                     ; 1229     RTC_AlarmStruct->RTC_AlarmTime.RTC_Minutes = Bcd2ToByte(RTC_AlarmStruct->RTC_AlarmTime.RTC_Minutes);
2757  006d e601          	ld	a,(1,x)
2758  006f cd0000        	call	L5_Bcd2ToByte
2760  0072 1e08          	ldw	x,(OFST+4,sp)
2761  0074 e701          	ld	(1,x),a
2762                     ; 1230     RTC_AlarmStruct->RTC_AlarmTime.RTC_Seconds = Bcd2ToByte(RTC_AlarmStruct->RTC_AlarmTime.RTC_Seconds);
2764  0076 e602          	ld	a,(2,x)
2765  0078 cd0000        	call	L5_Bcd2ToByte
2767  007b 1e08          	ldw	x,(OFST+4,sp)
2768  007d e702          	ld	(2,x),a
2769                     ; 1231     RTC_AlarmStruct->RTC_AlarmDateWeekDay = Bcd2ToByte(RTC_AlarmStruct->RTC_AlarmDateWeekDay);
2771  007f e606          	ld	a,(6,x)
2772  0081 cd0000        	call	L5_Bcd2ToByte
2774  0084 1e08          	ldw	x,(OFST+4,sp)
2775  0086 e706          	ld	(6,x),a
2776  0088               L5421:
2777                     ; 1233 }
2780  0088 5b05          	addw	sp,#5
2781  008a 81            	ret	
2843                     ; 1242 ErrorStatus RTC_AlarmCmd(FunctionalState NewState)
2843                     ; 1243 {
2844                     .text:	section	.text,new
2845  0000               _RTC_AlarmCmd:
2847  0000 5203          	subw	sp,#3
2848       00000003      OFST:	set	3
2851                     ; 1244   __IO uint16_t alrawfcount = 0;
2853  0002 5f            	clrw	x
2854  0003 1f01          	ldw	(OFST-2,sp),x
2855                     ; 1245   ErrorStatus status = ERROR;
2857                     ; 1246   uint8_t temp1 = 0;
2859                     ; 1249   assert_param(IS_FUNCTIONAL_STATE(NewState));
2861                     ; 1252   RTC->WPR = 0xCA;
2863  0005 35ca5159      	mov	20825,#202
2864                     ; 1253   RTC->WPR = 0x53;
2866  0009 35535159      	mov	20825,#83
2867                     ; 1256   if (NewState != DISABLE)
2869  000d 4d            	tnz	a
2870  000e 2711          	jreq	L7721
2871                     ; 1258     RTC->CR2 |= (uint8_t)(RTC_CR2_ALRAE);
2873  0010 72105149      	bset	20809,#0
2874                     ; 1259     status = SUCCESS;
2876  0014               LC007:
2878  0014 a601          	ld	a,#1
2879  0016 6b03          	ld	(OFST+0,sp),a
2881  0018               L1031:
2882                     ; 1283   RTC->WPR = 0xFF; 
2884  0018 35ff5159      	mov	20825,#255
2885                     ; 1286   return (ErrorStatus)status;
2887  001c 7b03          	ld	a,(OFST+0,sp)
2890  001e 5b03          	addw	sp,#3
2891  0020 81            	ret	
2892  0021               L7721:
2893                     ; 1263     RTC->CR2 &= (uint8_t)~(RTC_CR2_ALRAE) ;
2895  0021 72115149      	bres	20809,#0
2896                     ; 1266     temp1 = (uint8_t)(RTC->ISR1 & RTC_ISR1_ALRAWF);
2898  0025 c6514c        	ld	a,20812
2899  0028 a401          	and	a,#1
2900  002a 6b03          	ld	(OFST+0,sp),a
2902  002c 2005          	jra	L7031
2903  002e               L3031:
2904                     ; 1269       alrawfcount++;
2906  002e 1e01          	ldw	x,(OFST-2,sp)
2907  0030 5c            	incw	x
2908  0031 1f01          	ldw	(OFST-2,sp),x
2909  0033               L7031:
2910                     ; 1267     while ((alrawfcount != ALRAWF_TIMEOUT) && (temp1 == RESET))
2912  0033 1e01          	ldw	x,(OFST-2,sp)
2913  0035 a3ffff        	cpw	x,#65535
2914  0038 2704          	jreq	L3131
2916  003a 7b03          	ld	a,(OFST+0,sp)
2917  003c 27f0          	jreq	L3031
2918  003e               L3131:
2919                     ; 1272     if ((RTC->ISR1 &  RTC_ISR1_ALRAWF) == RESET)
2921  003e 7200514c04    	btjt	20812,#0,L5131
2922                     ; 1274       status = ERROR;
2924  0043 0f03          	clr	(OFST+0,sp)
2926  0045 20d1          	jra	L1031
2927  0047               L5131:
2928                     ; 1278       status = SUCCESS;
2929  0047 20cb          	jp	LC007
3126                     ; 1298 ErrorStatus RTC_AlarmSubSecondConfig(uint16_t RTC_AlarmSubSecondValue,
3126                     ; 1299                                      RTC_AlarmSubSecondMask_TypeDef RTC_AlarmSubSecondMask)
3126                     ; 1300 {
3127                     .text:	section	.text,new
3128  0000               _RTC_AlarmSubSecondConfig:
3130  0000 89            	pushw	x
3131  0001 88            	push	a
3132       00000001      OFST:	set	1
3135                     ; 1301   uint8_t alarmstatus = 0;
3137                     ; 1302   ErrorStatus status = ERROR;
3139                     ; 1305   assert_param(IS_RTC_ALARM_SS_VALUE(RTC_AlarmSubSecondValue));
3141                     ; 1306   assert_param(IS_RTC_ALARM_SS_MASK(RTC_AlarmSubSecondMask));
3143                     ; 1309   RTC->WPR = 0xCA;
3145  0002 35ca5159      	mov	20825,#202
3146                     ; 1310   RTC->WPR = 0x53;
3148  0006 35535159      	mov	20825,#83
3149                     ; 1313   if ((RTC->ISR1 & RTC_ISR1_INITF) == RESET)
3151  000a 720c514c26    	btjt	20812,#6,L3141
3152                     ; 1316     alarmstatus = (uint8_t)(RTC->CR2 | RTC_CR2_ALRAE);
3154  000f c65149        	ld	a,20809
3155  0012 aa01          	or	a,#1
3156  0014 6b01          	ld	(OFST+0,sp),a
3157                     ; 1319     RTC->CR2 &= (uint8_t)~(RTC_CR2_ALRAE);
3159                     ; 1322     RTC->ALRMASSRH = (uint8_t)(RTC_AlarmSubSecondValue >> 8);
3161  0016 9e            	ld	a,xh
3162  0017 72115149      	bres	20809,#0
3163  001b c75164        	ld	20836,a
3164                     ; 1323     RTC->ALRMASSRL = (uint8_t)(RTC_AlarmSubSecondValue);
3166  001e 9f            	ld	a,xl
3167  001f c75165        	ld	20837,a
3168                     ; 1324     RTC->ALRMASSMSKR = (uint8_t)RTC_AlarmSubSecondMask;
3170  0022 7b06          	ld	a,(OFST+5,sp)
3171  0024 c75166        	ld	20838,a
3172                     ; 1327     RTC->CR2 |= alarmstatus;
3174  0027 c65149        	ld	a,20809
3175  002a 1a01          	or	a,(OFST+0,sp)
3176  002c c75149        	ld	20809,a
3177                     ; 1329     status = SUCCESS;
3179  002f a601          	ld	a,#1
3180  0031 6b01          	ld	(OFST+0,sp),a
3182  0033 2002          	jra	L5141
3183  0035               L3141:
3184                     ; 1333     status = ERROR;
3186  0035 0f01          	clr	(OFST+0,sp)
3187  0037               L5141:
3188                     ; 1337   RTC->WPR = 0xFF; 
3190  0037 35ff5159      	mov	20825,#255
3191                     ; 1339   return (ErrorStatus)status;
3193  003b 7b01          	ld	a,(OFST+0,sp)
3196  003d 5b03          	addw	sp,#3
3197  003f 81            	ret	
3287                     ; 1369 void RTC_WakeUpClockConfig(RTC_WakeUpClock_TypeDef RTC_WakeUpClock)
3287                     ; 1370 {
3288                     .text:	section	.text,new
3289  0000               _RTC_WakeUpClockConfig:
3291  0000 88            	push	a
3292       00000000      OFST:	set	0
3295                     ; 1373   assert_param(IS_RTC_WAKEUP_CLOCK(RTC_WakeUpClock));
3297                     ; 1376   RTC->WPR = 0xCA;
3299  0001 35ca5159      	mov	20825,#202
3300                     ; 1377   RTC->WPR = 0x53;
3302  0005 35535159      	mov	20825,#83
3303                     ; 1380   RTC->CR2 &= (uint8_t)~RTC_CR2_WUTE;
3305  0009 72155149      	bres	20809,#2
3306                     ; 1383   RTC->CR1 &= (uint8_t)~RTC_CR1_WUCKSEL;
3308  000d c65148        	ld	a,20808
3309  0010 a4f8          	and	a,#248
3310  0012 c75148        	ld	20808,a
3311                     ; 1386   RTC->CR1 |= (uint8_t)RTC_WakeUpClock;
3313  0015 c65148        	ld	a,20808
3314  0018 1a01          	or	a,(OFST+1,sp)
3315  001a c75148        	ld	20808,a
3316                     ; 1389   RTC->WPR = 0xFF; 
3318  001d 35ff5159      	mov	20825,#255
3319                     ; 1390 }
3322  0021 84            	pop	a
3323  0022 81            	ret	
3356                     ; 1400 void RTC_SetWakeUpCounter(uint16_t RTC_WakeupCounter)
3356                     ; 1401 {
3357                     .text:	section	.text,new
3358  0000               _RTC_SetWakeUpCounter:
3362                     ; 1403   RTC->WPR = 0xCA;
3364  0000 35ca5159      	mov	20825,#202
3365                     ; 1404   RTC->WPR = 0x53;
3367  0004 35535159      	mov	20825,#83
3368                     ; 1408   RTC->WUTRH = (uint8_t)(RTC_WakeupCounter >> 8);
3370  0008 9e            	ld	a,xh
3371  0009 c75154        	ld	20820,a
3372                     ; 1409   RTC->WUTRL = (uint8_t)(RTC_WakeupCounter);
3374  000c 9f            	ld	a,xl
3375  000d c75155        	ld	20821,a
3376                     ; 1412   RTC->WPR = 0xFF; 
3378  0010 35ff5159      	mov	20825,#255
3379                     ; 1413 }
3382  0014 81            	ret	
3415                     ; 1420 uint16_t RTC_GetWakeUpCounter(void)
3415                     ; 1421 {
3416                     .text:	section	.text,new
3417  0000               _RTC_GetWakeUpCounter:
3419  0000 89            	pushw	x
3420       00000002      OFST:	set	2
3423                     ; 1422   uint16_t tmpreg = 0;
3425                     ; 1425   tmpreg = ((uint16_t)RTC->WUTRH) << 8;
3427  0001 c65154        	ld	a,20820
3428  0004 97            	ld	xl,a
3429  0005 4f            	clr	a
3430  0006 02            	rlwa	x,a
3431  0007 1f01          	ldw	(OFST-1,sp),x
3432                     ; 1426   tmpreg |= RTC->WUTRL;
3434  0009 5f            	clrw	x
3435  000a c65155        	ld	a,20821
3436  000d 97            	ld	xl,a
3437  000e 01            	rrwa	x,a
3438  000f 1a02          	or	a,(OFST+0,sp)
3439  0011 01            	rrwa	x,a
3440  0012 1a01          	or	a,(OFST-1,sp)
3441  0014 01            	rrwa	x,a
3442                     ; 1429   return (uint16_t)tmpreg;
3446  0015 5b02          	addw	sp,#2
3447  0017 81            	ret	
3500                     ; 1440 ErrorStatus RTC_WakeUpCmd(FunctionalState NewState)
3500                     ; 1441 {
3501                     .text:	section	.text,new
3502  0000               _RTC_WakeUpCmd:
3504  0000 5203          	subw	sp,#3
3505       00000003      OFST:	set	3
3508                     ; 1442   ErrorStatus status = ERROR;
3510                     ; 1443   uint16_t wutwfcount = 0;
3512  0002 5f            	clrw	x
3513  0003 1f02          	ldw	(OFST-1,sp),x
3514                     ; 1446   assert_param(IS_FUNCTIONAL_STATE(NewState));
3516                     ; 1449   RTC->WPR = 0xCA;
3518  0005 35ca5159      	mov	20825,#202
3519                     ; 1450   RTC->WPR = 0x53;
3521  0009 35535159      	mov	20825,#83
3522                     ; 1452   if (NewState != DISABLE)
3524  000d 4d            	tnz	a
3525  000e 2711          	jreq	L1351
3526                     ; 1455     RTC->CR2 |= (uint8_t)RTC_CR2_WUTE;
3528  0010 72145149      	bset	20809,#2
3529                     ; 1457     status = SUCCESS;
3531  0014               LC008:
3533  0014 a601          	ld	a,#1
3534  0016 6b01          	ld	(OFST-2,sp),a
3536  0018               L3351:
3537                     ; 1482   RTC->WPR = 0xFF; 
3539  0018 35ff5159      	mov	20825,#255
3540                     ; 1485   return (ErrorStatus)status;
3542  001c 7b01          	ld	a,(OFST-2,sp)
3545  001e 5b03          	addw	sp,#3
3546  0020 81            	ret	
3547  0021               L1351:
3548                     ; 1462     RTC->CR2 &= (uint8_t)~RTC_CR2_WUTE;
3550  0021 72155149      	bres	20809,#2
3552  0025 2003          	jra	L7351
3553  0027               L5351:
3554                     ; 1467       wutwfcount++;
3556  0027 5c            	incw	x
3557  0028 1f02          	ldw	(OFST-1,sp),x
3558  002a               L7351:
3559                     ; 1465     while (((RTC->ISR1 & RTC_ISR1_WUTWF) == RESET) && ( wutwfcount != WUTWF_TIMEOUT))
3561  002a 7204514c05    	btjt	20812,#2,L3451
3563  002f a3ffff        	cpw	x,#65535
3564  0032 26f3          	jrne	L5351
3565  0034               L3451:
3566                     ; 1471     if ((RTC->ISR1 & RTC_ISR1_WUTWF) == RESET)
3568  0034 7204514c04    	btjt	20812,#2,L5451
3569                     ; 1473       status = ERROR;
3571  0039 0f01          	clr	(OFST-2,sp)
3573  003b 20db          	jra	L3351
3574  003d               L5451:
3575                     ; 1477       status = SUCCESS;
3576  003d 20d5          	jp	LC008
3666                     ; 1522 void RTC_DayLightSavingConfig(RTC_DayLightSaving_TypeDef RTC_DayLightSaving,
3666                     ; 1523                               RTC_StoreOperation_TypeDef RTC_StoreOperation)
3666                     ; 1524 {
3667                     .text:	section	.text,new
3668  0000               _RTC_DayLightSavingConfig:
3670  0000 89            	pushw	x
3671       00000000      OFST:	set	0
3674                     ; 1526   assert_param(IS_RTC_DAYLIGHT_SAVING(RTC_DayLightSaving));
3676                     ; 1527   assert_param(IS_RTC_STORE_OPERATION(RTC_StoreOperation));
3678                     ; 1530   RTC->WPR = 0xCA;
3680  0001 35ca5159      	mov	20825,#202
3681                     ; 1531   RTC->WPR = 0x53;
3683  0005 35535159      	mov	20825,#83
3684                     ; 1534   RTC->CR3 &= (uint8_t)~(RTC_CR3_BCK);
3686                     ; 1537   RTC->CR3 |= (uint8_t)((uint8_t)RTC_DayLightSaving | (uint8_t)RTC_StoreOperation);
3688  0009 7215514a      	bres	20810,#2
3689  000d 9f            	ld	a,xl
3690  000e 1a01          	or	a,(OFST+1,sp)
3691  0010 ca514a        	or	a,20810
3692  0013 c7514a        	ld	20810,a
3693                     ; 1540   RTC->WPR = 0xFF; 
3695  0016 35ff5159      	mov	20825,#255
3696                     ; 1541 }
3699  001a 85            	popw	x
3700  001b 81            	ret	
3725                     ; 1549 RTC_StoreOperation_TypeDef  RTC_GetStoreOperation(void)
3725                     ; 1550 {
3726                     .text:	section	.text,new
3727  0000               _RTC_GetStoreOperation:
3731                     ; 1552   return (RTC_StoreOperation_TypeDef)(RTC->CR3 & RTC_CR3_BCK);
3733  0000 c6514a        	ld	a,20810
3734  0003 a404          	and	a,#4
3737  0005 81            	ret	
3831                     ; 1587 void RTC_OutputConfig(RTC_Output_TypeDef RTC_Output,
3831                     ; 1588                       RTC_OutputPolarity_TypeDef RTC_OutputPolarity)
3831                     ; 1589 {
3832                     .text:	section	.text,new
3833  0000               _RTC_OutputConfig:
3835  0000 89            	pushw	x
3836       00000000      OFST:	set	0
3839                     ; 1591   assert_param(IS_RTC_OUTPUT_SEL(RTC_Output));
3841                     ; 1592   assert_param(IS_RTC_OUTPUT_POL(RTC_OutputPolarity));
3843                     ; 1595   RTC->WPR = 0xCA;
3845  0001 35ca5159      	mov	20825,#202
3846                     ; 1596   RTC->WPR = 0x53;
3848  0005 35535159      	mov	20825,#83
3849                     ; 1599   RTC->CR3 &= (uint8_t)~(RTC_CR3_OSEL | RTC_CR3_POL);
3851  0009 c6514a        	ld	a,20810
3852  000c a48f          	and	a,#143
3853  000e c7514a        	ld	20810,a
3854                     ; 1602   RTC->CR3 |= (uint8_t)((uint8_t)RTC_Output | (uint8_t)RTC_OutputPolarity);
3856  0011 9f            	ld	a,xl
3857  0012 1a01          	or	a,(OFST+1,sp)
3858  0014 ca514a        	or	a,20810
3859  0017 c7514a        	ld	20810,a
3860                     ; 1605   RTC->WPR = 0xFF; 
3862  001a 35ff5159      	mov	20825,#255
3863                     ; 1606 }
3866  001e 85            	popw	x
3867  001f 81            	ret	
3956                     ; 1639 ErrorStatus RTC_SynchroShiftConfig(RTC_ShiftAdd1S_TypeDef RTC_ShiftAdd1S,
3956                     ; 1640                                    uint16_t RTC_ShiftSubFS)
3956                     ; 1641 {
3957                     .text:	section	.text,new
3958  0000               _RTC_SynchroShiftConfig:
3960  0000 88            	push	a
3961  0001 5203          	subw	sp,#3
3962       00000003      OFST:	set	3
3965                     ; 1642   uint8_t shiftrhreg = 0;
3967                     ; 1643   ErrorStatus status = ERROR;
3969                     ; 1644   uint16_t shpfcount = 0;
3971  0003 5f            	clrw	x
3972  0004 1f02          	ldw	(OFST-1,sp),x
3973                     ; 1647   assert_param(IS_RTC_SHIFT_ADD1S(RTC_ShiftAdd1S));
3975                     ; 1648   assert_param(IS_RTC_SHIFT_SUBFS(RTC_ShiftSubFS));
3977                     ; 1651   RTC->WPR = 0xCA;
3979  0006 35ca5159      	mov	20825,#202
3980                     ; 1652   RTC->WPR = 0x53;
3982  000a 35535159      	mov	20825,#83
3983                     ; 1655   if ((RTC->ISR1 & RTC_ISR1_SHPF) != RESET)
3985  000e 7207514c0f    	btjf	20812,#3,L7271
3987  0013 2003          	jra	L3371
3988  0015               L1371:
3989                     ; 1660       shpfcount++;
3991  0015 5c            	incw	x
3992  0016 1f02          	ldw	(OFST-1,sp),x
3993  0018               L3371:
3994                     ; 1658     while (((RTC->ISR1 & RTC_ISR1_SHPF) != RESET) && (shpfcount != SHPF_TIMEOUT))
3996  0018 7207514c05    	btjf	20812,#3,L7271
3998  001d a3ffff        	cpw	x,#65535
3999  0020 26f3          	jrne	L1371
4000  0022               L7271:
4001                     ; 1665   if ((RTC->ISR1 & RTC_ISR1_SHPF) == RESET)
4003  0022 7206514c12    	btjt	20812,#3,L1471
4004                     ; 1668     shiftrhreg = (uint8_t)((uint8_t)(RTC_ShiftSubFS >> 8) | (uint8_t)(RTC_ShiftAdd1S));
4006  0027 7b07          	ld	a,(OFST+4,sp)
4007  0029 1a04          	or	a,(OFST+1,sp)
4008                     ; 1669     RTC->SHIFTRH = (uint8_t)(shiftrhreg);
4010  002b c7515a        	ld	20826,a
4011                     ; 1670     RTC->SHIFTRL = (uint8_t)(RTC_ShiftSubFS);
4013  002e 7b08          	ld	a,(OFST+5,sp)
4014  0030 c7515b        	ld	20827,a
4015                     ; 1672     status = SUCCESS;
4017  0033 a601          	ld	a,#1
4018  0035 6b01          	ld	(OFST-2,sp),a
4020  0037 2002          	jra	L3471
4021  0039               L1471:
4022                     ; 1676     status = ERROR;
4024  0039 0f01          	clr	(OFST-2,sp)
4025  003b               L3471:
4026                     ; 1680   RTC->WPR = 0xFF; 
4028  003b 35ff5159      	mov	20825,#255
4029                     ; 1682   return (ErrorStatus)(status);
4031  003f 7b01          	ld	a,(OFST-2,sp)
4034  0041 5b04          	addw	sp,#4
4035  0043 81            	ret	
4161                     ; 1718 ErrorStatus RTC_SmoothCalibConfig(RTC_SmoothCalibPeriod_TypeDef RTC_SmoothCalibPeriod,
4161                     ; 1719                                   RTC_SmoothCalibPlusPulses_TypeDef RTC_SmoothCalibPlusPulses,
4161                     ; 1720                                   uint16_t RTC_SmouthCalibMinusPulsesValue)
4161                     ; 1721 {
4162                     .text:	section	.text,new
4163  0000               _RTC_SmoothCalibConfig:
4165  0000 89            	pushw	x
4166  0001 5203          	subw	sp,#3
4167       00000003      OFST:	set	3
4170                     ; 1722   ErrorStatus status = ERROR;
4172                     ; 1723   uint16_t recalpfcount = 0;
4174  0003 5f            	clrw	x
4175  0004 1f02          	ldw	(OFST-1,sp),x
4176                     ; 1726   assert_param(IS_RTC_SMOOTH_CALIB_PERIOD(RTC_SmoothCalibPeriod));
4178                     ; 1727   assert_param(IS_RTC_SMOOTH_CALIB_PLUS(RTC_SmoothCalibPlusPulses));
4180                     ; 1728   assert_param(IS_RTC_SMOOTH_CALIB_MINUS(RTC_SmouthCalibMinusPulsesValue));
4182                     ; 1731   RTC->WPR = 0xCA;
4184  0006 35ca5159      	mov	20825,#202
4185                     ; 1732   RTC->WPR = 0x53;
4187  000a 35535159      	mov	20825,#83
4188                     ; 1735   if ((RTC->ISR1 & RTC_ISR1_RECALPF) != RESET)
4190  000e 7203514c0f    	btjf	20812,#1,L1202
4192  0013 2003          	jra	L5202
4193  0015               L3202:
4194                     ; 1740       recalpfcount++;
4196  0015 5c            	incw	x
4197  0016 1f02          	ldw	(OFST-1,sp),x
4198  0018               L5202:
4199                     ; 1738     while (((RTC->ISR1 & RTC_ISR1_RECALPF) != RESET) && (recalpfcount != RECALPF_TIMEOUT))
4201  0018 7203514c05    	btjf	20812,#1,L1202
4203  001d a3ffff        	cpw	x,#65535
4204  0020 26f3          	jrne	L3202
4205  0022               L1202:
4206                     ; 1746   if ((RTC->ISR1 & RTC_ISR1_RECALPF) == RESET)
4208  0022 7202514c14    	btjt	20812,#1,L3302
4209                     ; 1749     RTC->CALRH = (uint8_t)((uint8_t)((uint8_t)RTC_SmoothCalibPeriod | \
4209                     ; 1750                            (uint8_t)RTC_SmoothCalibPlusPulses) | \
4209                     ; 1751                            (uint8_t)((uint16_t)RTC_SmouthCalibMinusPulsesValue >> 8));
4211  0027 7b04          	ld	a,(OFST+1,sp)
4212  0029 1a05          	or	a,(OFST+2,sp)
4213  002b 1a08          	or	a,(OFST+5,sp)
4214  002d c7516a        	ld	20842,a
4215                     ; 1752     RTC->CALRL = (uint8_t)(RTC_SmouthCalibMinusPulsesValue);
4217  0030 7b09          	ld	a,(OFST+6,sp)
4218  0032 c7516b        	ld	20843,a
4219                     ; 1754     status = SUCCESS;
4221  0035 a601          	ld	a,#1
4222  0037 6b01          	ld	(OFST-2,sp),a
4224  0039 2002          	jra	L5302
4225  003b               L3302:
4226                     ; 1758     status = ERROR;
4228  003b 0f01          	clr	(OFST-2,sp)
4229  003d               L5302:
4230                     ; 1762   RTC->WPR = 0xFF; 
4232  003d 35ff5159      	mov	20825,#255
4233                     ; 1764   return (ErrorStatus)(status);
4235  0041 7b01          	ld	a,(OFST-2,sp)
4238  0043 5b05          	addw	sp,#5
4239  0045 81            	ret	
4297                     ; 1790 void RTC_CalibOutputConfig(RTC_CalibOutput_TypeDef RTC_CalibOutput)
4297                     ; 1791 {
4298                     .text:	section	.text,new
4299  0000               _RTC_CalibOutputConfig:
4303                     ; 1793   assert_param(IS_RTC_CALOUTPUT_SELECT(RTC_CalibOutput));
4305                     ; 1796   RTC->WPR = 0xCA;
4307  0000 35ca5159      	mov	20825,#202
4308                     ; 1797   RTC->WPR = 0x53;
4310  0004 35535159      	mov	20825,#83
4311                     ; 1799   if (RTC_CalibOutput != RTC_CalibOutput_512Hz)
4313  0008 4d            	tnz	a
4314  0009 2706          	jreq	L5602
4315                     ; 1802     RTC->CR3 |= (uint8_t)RTC_CR3_COSEL;
4317  000b 7216514a      	bset	20810,#3
4319  000f 2004          	jra	L7602
4320  0011               L5602:
4321                     ; 1807     RTC->CR3 &= (uint8_t)~RTC_CR3_COSEL;
4323  0011 7217514a      	bres	20810,#3
4324  0015               L7602:
4325                     ; 1811   RTC->WPR = 0xFF; 
4327  0015 35ff5159      	mov	20825,#255
4328                     ; 1812 }
4331  0019 81            	ret	
4366                     ; 1820 void RTC_CalibOutputCmd(FunctionalState NewState)
4366                     ; 1821 {
4367                     .text:	section	.text,new
4368  0000               _RTC_CalibOutputCmd:
4372                     ; 1823   assert_param(IS_FUNCTIONAL_STATE(NewState));
4374                     ; 1826   RTC->WPR = 0xCA;
4376  0000 35ca5159      	mov	20825,#202
4377                     ; 1827   RTC->WPR = 0x53;
4379  0004 35535159      	mov	20825,#83
4380                     ; 1829   if (NewState != DISABLE)
4382  0008 4d            	tnz	a
4383  0009 2706          	jreq	L7012
4384                     ; 1832     RTC->CR3 |= (uint8_t)RTC_CR3_COE;
4386  000b 721e514a      	bset	20810,#7
4388  000f 2004          	jra	L1112
4389  0011               L7012:
4390                     ; 1837     RTC->CR3 &= (uint8_t)~RTC_CR3_COE;
4392  0011 721f514a      	bres	20810,#7
4393  0015               L1112:
4394                     ; 1841   RTC->WPR = 0xFF; 
4396  0015 35ff5159      	mov	20825,#255
4397                     ; 1842 }
4400  0019 81            	ret	
4495                     ; 1871 void RTC_TamperLevelConfig(RTC_Tamper_TypeDef RTC_Tamper,
4495                     ; 1872                            RTC_TamperLevel_TypeDef RTC_TamperLevel)
4495                     ; 1873 {
4496                     .text:	section	.text,new
4497  0000               _RTC_TamperLevelConfig:
4499  0000 89            	pushw	x
4500       00000000      OFST:	set	0
4503                     ; 1875   assert_param(IS_RTC_TAMPER((uint8_t)RTC_Tamper));
4505                     ; 1876   assert_param(IS_RTC_TAMPER_LEVEL(RTC_TamperLevel));
4507                     ; 1879   RTC->WPR = 0xCA;
4509  0001 35ca5159      	mov	20825,#202
4510                     ; 1880   RTC->WPR = 0x53;
4512  0005 35535159      	mov	20825,#83
4513                     ; 1882   if (RTC_TamperLevel != RTC_TamperLevel_Low)
4515  0009 9f            	ld	a,xl
4516  000a 4d            	tnz	a
4517  000b 2707          	jreq	L7512
4518                     ; 1885     RTC->TCR1 |= (uint8_t)(RTC_Tamper << 1);
4520  000d 9e            	ld	a,xh
4521  000e 48            	sll	a
4522  000f ca516c        	or	a,20844
4524  0012 2007          	jra	L1612
4525  0014               L7512:
4526                     ; 1890     RTC->TCR1 &= (uint8_t)~(uint8_t)(RTC_Tamper << 1);
4528  0014 7b01          	ld	a,(OFST+1,sp)
4529  0016 48            	sll	a
4530  0017 43            	cpl	a
4531  0018 c4516c        	and	a,20844
4532  001b               L1612:
4533  001b c7516c        	ld	20844,a
4534                     ; 1894   RTC->WPR = 0xFF; 
4536  001e 35ff5159      	mov	20825,#255
4537                     ; 1895 }
4540  0022 85            	popw	x
4541  0023 81            	ret	
4615                     ; 1903 void RTC_TamperFilterConfig(RTC_TamperFilter_TypeDef RTC_TamperFilter)
4615                     ; 1904 {
4616                     .text:	section	.text,new
4617  0000               _RTC_TamperFilterConfig:
4619  0000 88            	push	a
4620       00000000      OFST:	set	0
4623                     ; 1907   assert_param(IS_RTC_TAMPER_FILTER(RTC_TamperFilter));
4625                     ; 1910   RTC->WPR = 0xCA;
4627  0001 35ca5159      	mov	20825,#202
4628                     ; 1911   RTC->WPR = 0x53;
4630  0005 35535159      	mov	20825,#83
4631                     ; 1914   RTC->TCR2 &= (uint8_t)~(RTC_TCR2_TAMPFLT);
4633  0009 c6516d        	ld	a,20845
4634  000c a4e7          	and	a,#231
4635  000e c7516d        	ld	20845,a
4636                     ; 1917   RTC->TCR2 |= (uint8_t)RTC_TamperFilter;
4638  0011 c6516d        	ld	a,20845
4639  0014 1a01          	or	a,(OFST+1,sp)
4640  0016 c7516d        	ld	20845,a
4641                     ; 1920   RTC->WPR = 0xFF; 
4643  0019 35ff5159      	mov	20825,#255
4644                     ; 1922 }
4647  001d 84            	pop	a
4648  001e 81            	ret	
4761                     ; 1931 void RTC_TamperSamplingFreqConfig(RTC_TamperSamplingFreq_TypeDef RTC_TamperSamplingFreq)
4761                     ; 1932 {
4762                     .text:	section	.text,new
4763  0000               _RTC_TamperSamplingFreqConfig:
4765  0000 88            	push	a
4766       00000000      OFST:	set	0
4769                     ; 1934   assert_param(IS_RTC_TAMPER_SAMPLING_FREQ(RTC_TamperSamplingFreq));
4771                     ; 1937   RTC->WPR = 0xCA;
4773  0001 35ca5159      	mov	20825,#202
4774                     ; 1938   RTC->WPR = 0x53;
4776  0005 35535159      	mov	20825,#83
4777                     ; 1941   RTC->TCR2 &= (uint8_t)~(RTC_TCR2_TAMPFREQ);
4779  0009 c6516d        	ld	a,20845
4780  000c a4f8          	and	a,#248
4781  000e c7516d        	ld	20845,a
4782                     ; 1944   RTC->TCR2 |= (uint8_t)RTC_TamperSamplingFreq;
4784  0011 c6516d        	ld	a,20845
4785  0014 1a01          	or	a,(OFST+1,sp)
4786  0016 c7516d        	ld	20845,a
4787                     ; 1947   RTC->WPR = 0xFF; 
4789  0019 35ff5159      	mov	20825,#255
4790                     ; 1948 }
4793  001d 84            	pop	a
4794  001e 81            	ret	
4877                     ; 1958 void RTC_TamperPinsPrechargeDuration(RTC_TamperPrechargeDuration_TypeDef RTC_TamperPrechargeDuration)
4877                     ; 1959 {
4878                     .text:	section	.text,new
4879  0000               _RTC_TamperPinsPrechargeDuration:
4881  0000 88            	push	a
4882       00000000      OFST:	set	0
4885                     ; 1961   assert_param(IS_RTC_TAMPER_PINS_PRECHAR_DURATION(RTC_TamperPrechargeDuration));
4887                     ; 1964   RTC->WPR = 0xCA;
4889  0001 35ca5159      	mov	20825,#202
4890                     ; 1965   RTC->WPR = 0x53;
4892  0005 35535159      	mov	20825,#83
4893                     ; 1968   RTC->TCR2 &= (uint8_t)~(RTC_TCR2_TAMPPUDIS | RTC_TCR2_TAMPPRCH);
4895  0009 c6516d        	ld	a,20845
4896  000c a41f          	and	a,#31
4897  000e c7516d        	ld	20845,a
4898                     ; 1971   RTC->TCR2 |= (uint8_t)RTC_TamperPrechargeDuration;
4900  0011 c6516d        	ld	a,20845
4901  0014 1a01          	or	a,(OFST+1,sp)
4902  0016 c7516d        	ld	20845,a
4903                     ; 1974   RTC->WPR = 0xFF; 
4905  0019 35ff5159      	mov	20825,#255
4906                     ; 1975 }
4909  001d 84            	pop	a
4910  001e 81            	ret	
4955                     ; 1987 void RTC_TamperCmd(RTC_Tamper_TypeDef RTC_Tamper,
4955                     ; 1988                    FunctionalState NewState)
4955                     ; 1989 {
4956                     .text:	section	.text,new
4957  0000               _RTC_TamperCmd:
4959  0000 89            	pushw	x
4960       00000000      OFST:	set	0
4963                     ; 1992   assert_param(IS_RTC_TAMPER((uint8_t)RTC_Tamper));
4965                     ; 1993   assert_param(IS_FUNCTIONAL_STATE(NewState));
4967                     ; 1996   RTC->WPR = 0xCA;
4969  0001 35ca5159      	mov	20825,#202
4970                     ; 1997   RTC->WPR = 0x53;
4972  0005 35535159      	mov	20825,#83
4973                     ; 2000   if (NewState != DISABLE)
4975  0009 9f            	ld	a,xl
4976  000a 4d            	tnz	a
4977  000b 2706          	jreq	L5332
4978                     ; 2003     RTC->TCR1 |= (uint8_t)RTC_Tamper;
4980  000d 9e            	ld	a,xh
4981  000e ca516c        	or	a,20844
4983  0011 2006          	jra	L7332
4984  0013               L5332:
4985                     ; 2008     RTC->TCR1 &= (uint8_t)~RTC_Tamper;
4987  0013 7b01          	ld	a,(OFST+1,sp)
4988  0015 43            	cpl	a
4989  0016 c4516c        	and	a,20844
4990  0019               L7332:
4991  0019 c7516c        	ld	20844,a
4992                     ; 2013   RTC->WPR = 0xFF; 
4994  001c 35ff5159      	mov	20825,#255
4995                     ; 2014 }
4998  0020 85            	popw	x
4999  0021 81            	ret	
5071                     ; 2058 void RTC_ITConfig(RTC_IT_TypeDef RTC_IT, FunctionalState NewState)
5071                     ; 2059 {
5072                     .text:	section	.text,new
5073  0000               _RTC_ITConfig:
5075  0000 89            	pushw	x
5076       00000000      OFST:	set	0
5079                     ; 2061   assert_param(IS_RTC_CONFIG_IT(RTC_IT));
5081                     ; 2062   assert_param(IS_FUNCTIONAL_STATE(NewState));
5083                     ; 2065   RTC->WPR = 0xCA;
5085  0001 35ca5159      	mov	20825,#202
5086                     ; 2066   RTC->WPR = 0x53;
5088  0005 35535159      	mov	20825,#83
5089                     ; 2068   if (NewState != DISABLE)
5091  0009 7b05          	ld	a,(OFST+5,sp)
5092  000b 2712          	jreq	L5732
5093                     ; 2071     RTC->CR2 |= (uint8_t)((uint16_t)RTC_IT & (uint16_t)0x00F0);
5095  000d 9f            	ld	a,xl
5096  000e a4f0          	and	a,#240
5097  0010 ca5149        	or	a,20809
5098  0013 c75149        	ld	20809,a
5099                     ; 2072     RTC->TCR1 |= (uint8_t)((uint16_t)RTC_IT & RTC_TCR1_TAMPIE);
5101  0016 7b02          	ld	a,(OFST+2,sp)
5102  0018 a401          	and	a,#1
5103  001a ca516c        	or	a,20844
5105  001d 2013          	jra	L7732
5106  001f               L5732:
5107                     ; 2077     RTC->CR2  &= (uint8_t)~(uint8_t)((uint16_t)RTC_IT & (uint16_t)0x00F0);
5109  001f 7b02          	ld	a,(OFST+2,sp)
5110  0021 a4f0          	and	a,#240
5111  0023 43            	cpl	a
5112  0024 c45149        	and	a,20809
5113  0027 c75149        	ld	20809,a
5114                     ; 2078     RTC->TCR1 &= (uint8_t)~(uint8_t)((uint16_t)RTC_IT & (uint16_t)RTC_TCR1_TAMPIE);
5116  002a 7b02          	ld	a,(OFST+2,sp)
5117  002c a401          	and	a,#1
5118  002e 43            	cpl	a
5119  002f c4516c        	and	a,20844
5120  0032               L7732:
5121  0032 c7516c        	ld	20844,a
5122                     ; 2082   RTC->WPR = 0xFF; 
5124  0035 35ff5159      	mov	20825,#255
5125                     ; 2083 }
5128  0039 85            	popw	x
5129  003a 81            	ret	
5299                     ; 2090 FlagStatus RTC_GetFlagStatus(RTC_Flag_TypeDef RTC_FLAG)
5299                     ; 2091 {
5300                     .text:	section	.text,new
5301  0000               _RTC_GetFlagStatus:
5303  0000 89            	pushw	x
5304  0001 5203          	subw	sp,#3
5305       00000003      OFST:	set	3
5308                     ; 2092   FlagStatus flagstatus = RESET;
5310                     ; 2093   uint16_t tmpreg1 = 0;
5312                     ; 2094   uint16_t tmpreg2 = 0;
5314                     ; 2097   assert_param(IS_RTC_GET_FLAG(RTC_FLAG));
5316                     ; 2100   tmpreg2 = (uint16_t)((uint16_t)RTC->ISR1 << 8);
5318  0003 c6514c        	ld	a,20812
5319  0006 97            	ld	xl,a
5320  0007 4f            	clr	a
5321  0008 02            	rlwa	x,a
5322  0009 1f02          	ldw	(OFST-1,sp),x
5323                     ; 2101   tmpreg1 = (uint16_t)((uint16_t)((uint16_t)(RTC->ISR2)) | tmpreg2);
5325  000b 5f            	clrw	x
5326  000c c6514d        	ld	a,20813
5327  000f 97            	ld	xl,a
5328  0010 01            	rrwa	x,a
5329  0011 1a03          	or	a,(OFST+0,sp)
5330  0013 01            	rrwa	x,a
5331  0014 1a02          	or	a,(OFST-1,sp)
5332  0016 01            	rrwa	x,a
5333  0017 1f02          	ldw	(OFST-1,sp),x
5334                     ; 2104   if ((tmpreg1 & (uint16_t)RTC_FLAG) != RESET)
5336  0019 01            	rrwa	x,a
5337  001a 1405          	and	a,(OFST+2,sp)
5338  001c 01            	rrwa	x,a
5339  001d 1404          	and	a,(OFST+1,sp)
5340  001f 01            	rrwa	x,a
5341  0020 5d            	tnzw	x
5342  0021 2704          	jreq	L3742
5343                     ; 2106     flagstatus = SET;
5345  0023 a601          	ld	a,#1
5347  0025 2001          	jra	L5742
5348  0027               L3742:
5349                     ; 2110     flagstatus = RESET;
5351  0027 4f            	clr	a
5352  0028               L5742:
5353                     ; 2112   return (FlagStatus)flagstatus;
5357  0028 5b05          	addw	sp,#5
5358  002a 81            	ret	
5393                     ; 2122 void RTC_ClearFlag(RTC_Flag_TypeDef RTC_FLAG)
5393                     ; 2123 {
5394                     .text:	section	.text,new
5395  0000               _RTC_ClearFlag:
5397  0000 89            	pushw	x
5398       00000000      OFST:	set	0
5401                     ; 2125   assert_param(IS_RTC_CLEAR_FLAG((uint16_t)RTC_FLAG));
5403                     ; 2128   RTC->ISR2 = (uint8_t)~((uint8_t)RTC_FLAG) ;
5405  0001 9f            	ld	a,xl
5406  0002 43            	cpl	a
5407  0003 c7514d        	ld	20813,a
5408                     ; 2129   RTC->ISR1 = (uint8_t)(((uint8_t)~(uint8_t)((uint16_t)RTC_FLAG >> (uint8_t)8)) & ((uint8_t)~(uint8_t)(RTC_ISR1_INIT)));
5410  0006 7b01          	ld	a,(OFST+1,sp)
5411  0008 43            	cpl	a
5412  0009 a47f          	and	a,#127
5413  000b c7514c        	ld	20812,a
5414                     ; 2130 }
5417  000e 85            	popw	x
5418  000f 81            	ret	
5478                     ; 2138 ITStatus RTC_GetITStatus(RTC_IT_TypeDef RTC_IT)
5478                     ; 2139 {
5479                     .text:	section	.text,new
5480  0000               _RTC_GetITStatus:
5482  0000 89            	pushw	x
5483  0001 89            	pushw	x
5484       00000002      OFST:	set	2
5487                     ; 2140   ITStatus itstatus = RESET;
5489                     ; 2141   uint8_t enablestatus = 0, tmpreg = 0;
5493                     ; 2144   assert_param(IS_RTC_GET_IT(RTC_IT));
5495                     ; 2147   enablestatus = (uint8_t)(RTC->CR2 & (uint16_t)RTC_IT);
5497  0002 9f            	ld	a,xl
5498  0003 c45149        	and	a,20809
5499  0006 6b01          	ld	(OFST-1,sp),a
5500                     ; 2150   tmpreg = (uint8_t)(RTC->ISR2 & (uint8_t)((uint16_t)RTC_IT >> 4));
5502  0008 1e03          	ldw	x,(OFST+1,sp)
5503  000a 54            	srlw	x
5504  000b 54            	srlw	x
5505  000c 54            	srlw	x
5506  000d 54            	srlw	x
5507  000e 9f            	ld	a,xl
5508  000f c4514d        	and	a,20813
5509  0012 6b02          	ld	(OFST+0,sp),a
5510                     ; 2153   if ((enablestatus != (uint8_t)RESET) && (tmpreg != (uint8_t)RESET))
5512  0014 7b01          	ld	a,(OFST-1,sp)
5513  0016 2708          	jreq	L3452
5515  0018 7b02          	ld	a,(OFST+0,sp)
5516  001a 2704          	jreq	L3452
5517                     ; 2155     itstatus = SET;
5519  001c a601          	ld	a,#1
5521  001e 2001          	jra	L5452
5522  0020               L3452:
5523                     ; 2159     itstatus = RESET;
5525  0020 4f            	clr	a
5526  0021               L5452:
5527                     ; 2162   return (ITStatus)itstatus;
5531  0021 5b04          	addw	sp,#4
5532  0023 81            	ret	
5568                     ; 2172 void RTC_ClearITPendingBit(RTC_IT_TypeDef RTC_IT)
5568                     ; 2173 {
5569                     .text:	section	.text,new
5570  0000               _RTC_ClearITPendingBit:
5574                     ; 2175   assert_param(IS_RTC_CLEAR_IT((uint16_t)RTC_IT));
5576                     ; 2178   RTC->ISR2 = (uint8_t)~(uint8_t)((uint16_t)RTC_IT >> 4);
5578  0000 54            	srlw	x
5579  0001 54            	srlw	x
5580  0002 54            	srlw	x
5581  0003 54            	srlw	x
5582  0004 9f            	ld	a,xl
5583  0005 43            	cpl	a
5584  0006 c7514d        	ld	20813,a
5585                     ; 2179 }
5588  0009 81            	ret	
5627                     ; 2202 static uint8_t ByteToBcd2(uint8_t Value)
5627                     ; 2203 {
5628                     .text:	section	.text,new
5629  0000               L3_ByteToBcd2:
5631  0000 88            	push	a
5632  0001 88            	push	a
5633       00000001      OFST:	set	1
5636                     ; 2204   uint8_t bcdhigh = 0;
5638  0002 0f01          	clr	(OFST+0,sp)
5640  0004 7b02          	ld	a,(OFST+1,sp)
5641  0006 2006          	jra	L7062
5642  0008               L3062:
5643                     ; 2208     bcdhigh++;
5645  0008 0c01          	inc	(OFST+0,sp)
5646                     ; 2209     Value -= 10;
5648  000a a00a          	sub	a,#10
5649  000c 6b02          	ld	(OFST+1,sp),a
5650  000e               L7062:
5651                     ; 2206   while (Value >= 10)
5653  000e a10a          	cp	a,#10
5654  0010 24f6          	jruge	L3062
5655                     ; 2212   return  (uint8_t)((uint8_t)(bcdhigh << 4) | Value);
5657  0012 7b01          	ld	a,(OFST+0,sp)
5658  0014 97            	ld	xl,a
5659  0015 a610          	ld	a,#16
5660  0017 42            	mul	x,a
5661  0018 9f            	ld	a,xl
5662  0019 1a02          	or	a,(OFST+1,sp)
5665  001b 85            	popw	x
5666  001c 81            	ret	
5705                     ; 2220 static uint8_t Bcd2ToByte(uint8_t Value)
5705                     ; 2221 {
5706                     .text:	section	.text,new
5707  0000               L5_Bcd2ToByte:
5709  0000 88            	push	a
5710  0001 88            	push	a
5711       00000001      OFST:	set	1
5714                     ; 2222   uint8_t tmp = 0;
5716                     ; 2224   tmp = (uint8_t)((uint8_t)((uint8_t)(Value & (uint8_t)0xF0) >> 4) * (uint8_t)10);
5718  0002 4e            	swap	a
5719  0003 a40f          	and	a,#15
5720  0005 97            	ld	xl,a
5721  0006 a60a          	ld	a,#10
5722  0008 42            	mul	x,a
5723  0009 9f            	ld	a,xl
5724  000a 6b01          	ld	(OFST+0,sp),a
5725                     ; 2226   return (uint8_t)(tmp + (Value & (uint8_t)0x0F));
5727  000c 7b02          	ld	a,(OFST+1,sp)
5728  000e a40f          	and	a,#15
5729  0010 1b01          	add	a,(OFST+0,sp)
5732  0012 85            	popw	x
5733  0013 81            	ret	
5746                     	xdef	_RTC_ClearITPendingBit
5747                     	xdef	_RTC_GetITStatus
5748                     	xdef	_RTC_ClearFlag
5749                     	xdef	_RTC_GetFlagStatus
5750                     	xdef	_RTC_ITConfig
5751                     	xdef	_RTC_TamperCmd
5752                     	xdef	_RTC_TamperPinsPrechargeDuration
5753                     	xdef	_RTC_TamperSamplingFreqConfig
5754                     	xdef	_RTC_TamperFilterConfig
5755                     	xdef	_RTC_TamperLevelConfig
5756                     	xdef	_RTC_CalibOutputCmd
5757                     	xdef	_RTC_CalibOutputConfig
5758                     	xdef	_RTC_SmoothCalibConfig
5759                     	xdef	_RTC_SynchroShiftConfig
5760                     	xdef	_RTC_OutputConfig
5761                     	xdef	_RTC_GetStoreOperation
5762                     	xdef	_RTC_DayLightSavingConfig
5763                     	xdef	_RTC_WakeUpCmd
5764                     	xdef	_RTC_GetWakeUpCounter
5765                     	xdef	_RTC_SetWakeUpCounter
5766                     	xdef	_RTC_WakeUpClockConfig
5767                     	xdef	_RTC_AlarmSubSecondConfig
5768                     	xdef	_RTC_AlarmCmd
5769                     	xdef	_RTC_GetAlarm
5770                     	xdef	_RTC_AlarmStructInit
5771                     	xdef	_RTC_SetAlarm
5772                     	xdef	_RTC_GetDate
5773                     	xdef	_RTC_DateStructInit
5774                     	xdef	_RTC_SetDate
5775                     	xdef	_RTC_GetSubSecond
5776                     	xdef	_RTC_GetTime
5777                     	xdef	_RTC_TimeStructInit
5778                     	xdef	_RTC_SetTime
5779                     	xdef	_RTC_BypassShadowCmd
5780                     	xdef	_RTC_RatioCmd
5781                     	xdef	_RTC_WaitForSynchro
5782                     	xdef	_RTC_ExitInitMode
5783                     	xdef	_RTC_EnterInitMode
5784                     	xdef	_RTC_WriteProtectionCmd
5785                     	xdef	_RTC_StructInit
5786                     	xdef	_RTC_Init
5787                     	xdef	_RTC_DeInit
5806                     	end
