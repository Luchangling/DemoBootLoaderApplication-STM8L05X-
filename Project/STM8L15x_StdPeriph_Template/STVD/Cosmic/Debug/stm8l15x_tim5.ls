   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.8.32 - 23 Mar 2010
   3                     ; Generator V4.3.4 - 23 Mar 2010
   4                     ; Optimizer V4.3.3 - 10 Feb 2010
  50                     ; 168 void TIM5_DeInit(void)
  50                     ; 169 {
  52                     .text:	section	.text,new
  53  0000               _TIM5_DeInit:
  57                     ; 170   TIM5->CR1 = TIM_CR1_RESET_VALUE;
  59  0000 725f5300      	clr	21248
  60                     ; 171   TIM5->CR2 = TIM_CR2_RESET_VALUE;
  62  0004 725f5301      	clr	21249
  63                     ; 172   TIM5->SMCR = TIM_SMCR_RESET_VALUE;
  65  0008 725f5302      	clr	21250
  66                     ; 173   TIM5->ETR = TIM_ETR_RESET_VALUE;
  68  000c 725f5303      	clr	21251
  69                     ; 174   TIM5->IER = TIM_IER_RESET_VALUE;
  71  0010 725f5305      	clr	21253
  72                     ; 175   TIM5->SR2 = TIM_SR2_RESET_VALUE;
  74  0014 725f5307      	clr	21255
  75                     ; 178   TIM5->CCER1 = TIM_CCER1_RESET_VALUE;
  77  0018 725f530b      	clr	21259
  78                     ; 180   TIM5->CCMR1 = 0x01;/*TIM5_ICxSource_TIxFPx */
  80  001c 35015309      	mov	21257,#1
  81                     ; 181   TIM5->CCMR2 = 0x01;/*TIM5_ICxSource_TIxFPx */
  83  0020 3501530a      	mov	21258,#1
  84                     ; 184   TIM5->CCER1 = TIM_CCER1_RESET_VALUE;
  86  0024 725f530b      	clr	21259
  87                     ; 185   TIM5->CCMR1 = TIM_CCMR1_RESET_VALUE;
  89  0028 725f5309      	clr	21257
  90                     ; 186   TIM5->CCMR2 = TIM_CCMR2_RESET_VALUE;
  92  002c 725f530a      	clr	21258
  93                     ; 188   TIM5->CNTRH = TIM_CNTRH_RESET_VALUE;
  95  0030 725f530c      	clr	21260
  96                     ; 189   TIM5->CNTRL = TIM_CNTRL_RESET_VALUE;
  98  0034 725f530d      	clr	21261
  99                     ; 191   TIM5->PSCR = TIM_PSCR_RESET_VALUE;
 101  0038 725f530e      	clr	21262
 102                     ; 193   TIM5->ARRH = TIM_ARRH_RESET_VALUE;
 104  003c 35ff530f      	mov	21263,#255
 105                     ; 194   TIM5->ARRL = TIM_ARRL_RESET_VALUE;
 107  0040 35ff5310      	mov	21264,#255
 108                     ; 196   TIM5->CCR1H = TIM_CCR1H_RESET_VALUE;
 110  0044 725f5311      	clr	21265
 111                     ; 197   TIM5->CCR1L = TIM_CCR1L_RESET_VALUE;
 113  0048 725f5312      	clr	21266
 114                     ; 198   TIM5->CCR2H = TIM_CCR2H_RESET_VALUE;
 116  004c 725f5313      	clr	21267
 117                     ; 199   TIM5->CCR2L = TIM_CCR2L_RESET_VALUE;
 119  0050 725f5314      	clr	21268
 120                     ; 202   TIM5->OISR = TIM_OISR_RESET_VALUE;
 122  0054 725f5316      	clr	21270
 123                     ; 203   TIM5->EGR = 0x01;/* TIM_EGR_UG */
 125  0058 35015308      	mov	21256,#1
 126                     ; 204   TIM5->BKR = TIM_BKR_RESET_VALUE;
 128  005c 725f5315      	clr	21269
 129                     ; 205   TIM5->SR1 = TIM_SR1_RESET_VALUE;
 131  0060 725f5306      	clr	21254
 132                     ; 206 }
 135  0064 81            	ret	
 295                     ; 231 void TIM5_TimeBaseInit(TIM5_Prescaler_TypeDef TIM5_Prescaler,
 295                     ; 232                        TIM5_CounterMode_TypeDef TIM5_CounterMode,
 295                     ; 233                        uint16_t TIM5_Period)
 295                     ; 234 {
 296                     .text:	section	.text,new
 297  0000               _TIM5_TimeBaseInit:
 299  0000 89            	pushw	x
 300       00000000      OFST:	set	0
 303                     ; 236   assert_param(IS_TIM5_PRESCALER(TIM5_Prescaler));
 305                     ; 237   assert_param(IS_TIM5_COUNTER_MODE(TIM5_CounterMode));
 307                     ; 242   TIM5->ARRH = (uint8_t)(TIM5_Period >> 8) ;
 309  0001 7b05          	ld	a,(OFST+5,sp)
 310  0003 c7530f        	ld	21263,a
 311                     ; 243   TIM5->ARRL = (uint8_t)(TIM5_Period);
 313  0006 7b06          	ld	a,(OFST+6,sp)
 314  0008 c75310        	ld	21264,a
 315                     ; 246   TIM5->PSCR = (uint8_t)(TIM5_Prescaler);
 317  000b 9e            	ld	a,xh
 318  000c c7530e        	ld	21262,a
 319                     ; 249   TIM5->CR1 &= (uint8_t)((uint8_t)(~TIM_CR1_CMS)) & ((uint8_t)(~TIM_CR1_DIR));
 321  000f c65300        	ld	a,21248
 322  0012 a48f          	and	a,#143
 323  0014 c75300        	ld	21248,a
 324                     ; 250   TIM5->CR1 |= (uint8_t)(TIM5_CounterMode);
 326  0017 9f            	ld	a,xl
 327  0018 ca5300        	or	a,21248
 328  001b c75300        	ld	21248,a
 329                     ; 253   TIM5->EGR = TIM5_EventSource_Update;
 331  001e 35015308      	mov	21256,#1
 332                     ; 254 }
 335  0022 85            	popw	x
 336  0023 81            	ret	
 404                     ; 274 void TIM5_PrescalerConfig(TIM5_Prescaler_TypeDef Prescaler,
 404                     ; 275                           TIM5_PSCReloadMode_TypeDef TIM5_PSCReloadMode)
 404                     ; 276 {
 405                     .text:	section	.text,new
 406  0000               _TIM5_PrescalerConfig:
 410                     ; 278   assert_param(IS_TIM5_PRESCALER(Prescaler));
 412                     ; 279   assert_param(IS_TIM5_PRESCALER_RELOAD(TIM5_PSCReloadMode));
 414                     ; 282   TIM5->PSCR = (uint8_t)(Prescaler);
 416  0000 9e            	ld	a,xh
 417  0001 c7530e        	ld	21262,a
 418                     ; 285   if (TIM5_PSCReloadMode == TIM5_PSCReloadMode_Immediate)
 420  0004 9f            	ld	a,xl
 421  0005 4a            	dec	a
 422  0006 2605          	jrne	L541
 423                     ; 287     TIM5->EGR |= TIM_EGR_UG ;
 425  0008 72105308      	bset	21256,#0
 428  000c 81            	ret	
 429  000d               L541:
 430                     ; 291     TIM5->EGR &= (uint8_t)(~TIM_EGR_UG) ;
 432  000d 72115308      	bres	21256,#0
 433                     ; 293 }
 436  0011 81            	ret	
 479                     ; 306 void TIM5_CounterModeConfig(TIM5_CounterMode_TypeDef TIM5_CounterMode)
 479                     ; 307 {
 480                     .text:	section	.text,new
 481  0000               _TIM5_CounterModeConfig:
 483  0000 88            	push	a
 484  0001 88            	push	a
 485       00000001      OFST:	set	1
 488                     ; 308   uint8_t tmpcr1 = 0;
 490                     ; 311   assert_param(IS_TIM5_COUNTER_MODE(TIM5_CounterMode));
 492                     ; 313   tmpcr1 = TIM5->CR1;
 494  0002 c65300        	ld	a,21248
 495                     ; 316   tmpcr1 &= (uint8_t)((uint8_t)(~TIM_CR1_CMS) & (uint8_t)(~TIM_CR1_DIR));
 497  0005 a48f          	and	a,#143
 498                     ; 319   tmpcr1 |= (uint8_t)TIM5_CounterMode;
 500  0007 1a02          	or	a,(OFST+1,sp)
 501                     ; 321   TIM5->CR1 = tmpcr1;
 503  0009 c75300        	ld	21248,a
 504                     ; 322 }
 507  000c 85            	popw	x
 508  000d 81            	ret	
 540                     ; 330 void TIM5_SetCounter(uint16_t Counter)
 540                     ; 331 {
 541                     .text:	section	.text,new
 542  0000               _TIM5_SetCounter:
 546                     ; 334   TIM5->CNTRH = (uint8_t)(Counter >> 8);
 548  0000 9e            	ld	a,xh
 549  0001 c7530c        	ld	21260,a
 550                     ; 335   TIM5->CNTRL = (uint8_t)(Counter);
 552  0004 9f            	ld	a,xl
 553  0005 c7530d        	ld	21261,a
 554                     ; 336 }
 557  0008 81            	ret	
 589                     ; 344 void TIM5_SetAutoreload(uint16_t Autoreload)
 589                     ; 345 {
 590                     .text:	section	.text,new
 591  0000               _TIM5_SetAutoreload:
 595                     ; 347   TIM5->ARRH = (uint8_t)(Autoreload >> 8);
 597  0000 9e            	ld	a,xh
 598  0001 c7530f        	ld	21263,a
 599                     ; 348   TIM5->ARRL = (uint8_t)(Autoreload);
 601  0004 9f            	ld	a,xl
 602  0005 c75310        	ld	21264,a
 603                     ; 349 }
 606  0008 81            	ret	
 652                     ; 356 uint16_t TIM5_GetCounter(void)
 652                     ; 357 {
 653                     .text:	section	.text,new
 654  0000               _TIM5_GetCounter:
 656  0000 5204          	subw	sp,#4
 657       00000004      OFST:	set	4
 660                     ; 358   uint16_t tmpcnt = 0;
 662                     ; 361   tmpcntrh = TIM5->CNTRH;
 664  0002 c6530c        	ld	a,21260
 665  0005 6b02          	ld	(OFST-2,sp),a
 666                     ; 362   tmpcntrl = TIM5->CNTRL;
 668  0007 c6530d        	ld	a,21261
 669  000a 6b01          	ld	(OFST-3,sp),a
 670                     ; 364   tmpcnt = (uint16_t)(tmpcntrl);
 672  000c 5f            	clrw	x
 673  000d 97            	ld	xl,a
 674  000e 1f03          	ldw	(OFST-1,sp),x
 675                     ; 365   tmpcnt |= (uint16_t)((uint16_t)tmpcntrh << 8);
 677  0010 5f            	clrw	x
 678  0011 7b02          	ld	a,(OFST-2,sp)
 679  0013 97            	ld	xl,a
 680  0014 7b04          	ld	a,(OFST+0,sp)
 681  0016 01            	rrwa	x,a
 682  0017 1a03          	or	a,(OFST-1,sp)
 683  0019 01            	rrwa	x,a
 684                     ; 367   return ((uint16_t)tmpcnt);
 688  001a 5b04          	addw	sp,#4
 689  001c 81            	ret	
 713                     ; 383 TIM5_Prescaler_TypeDef TIM5_GetPrescaler(void)
 713                     ; 384 {
 714                     .text:	section	.text,new
 715  0000               _TIM5_GetPrescaler:
 719                     ; 386   return ((TIM5_Prescaler_TypeDef)TIM5->PSCR);
 721  0000 c6530e        	ld	a,21262
 724  0003 81            	ret	
 780                     ; 396 void TIM5_UpdateDisableConfig(FunctionalState NewState)
 780                     ; 397 {
 781                     .text:	section	.text,new
 782  0000               _TIM5_UpdateDisableConfig:
 786                     ; 399   assert_param(IS_FUNCTIONAL_STATE(NewState));
 788                     ; 402   if (NewState != DISABLE)
 790  0000 4d            	tnz	a
 791  0001 2705          	jreq	L772
 792                     ; 404     TIM5->CR1 |= TIM_CR1_UDIS;
 794  0003 72125300      	bset	21248,#1
 797  0007 81            	ret	
 798  0008               L772:
 799                     ; 408     TIM5->CR1 &= (uint8_t)(~TIM_CR1_UDIS);
 801  0008 72135300      	bres	21248,#1
 802                     ; 410 }
 805  000c 81            	ret	
 863                     ; 420 void TIM5_UpdateRequestConfig(TIM5_UpdateSource_TypeDef TIM5_UpdateSource)
 863                     ; 421 {
 864                     .text:	section	.text,new
 865  0000               _TIM5_UpdateRequestConfig:
 869                     ; 423   assert_param(IS_TIM5_UPDATE_SOURCE(TIM5_UpdateSource));
 871                     ; 426   if (TIM5_UpdateSource == TIM5_UpdateSource_Regular)
 873  0000 4a            	dec	a
 874  0001 2605          	jrne	L133
 875                     ; 428     TIM5->CR1 |= TIM_CR1_URS ;
 877  0003 72145300      	bset	21248,#2
 880  0007 81            	ret	
 881  0008               L133:
 882                     ; 432     TIM5->CR1 &= (uint8_t)(~TIM_CR1_URS);
 884  0008 72155300      	bres	21248,#2
 885                     ; 434 }
 888  000c 81            	ret	
 924                     ; 442 void TIM5_ARRPreloadConfig(FunctionalState NewState)
 924                     ; 443 {
 925                     .text:	section	.text,new
 926  0000               _TIM5_ARRPreloadConfig:
 930                     ; 445   assert_param(IS_FUNCTIONAL_STATE(NewState));
 932                     ; 448   if (NewState != DISABLE)
 934  0000 4d            	tnz	a
 935  0001 2705          	jreq	L353
 936                     ; 450     TIM5->CR1 |= TIM_CR1_ARPE;
 938  0003 721e5300      	bset	21248,#7
 941  0007 81            	ret	
 942  0008               L353:
 943                     ; 454     TIM5->CR1 &= (uint8_t)(~TIM_CR1_ARPE);
 945  0008 721f5300      	bres	21248,#7
 946                     ; 456 }
 949  000c 81            	ret	
1006                     ; 466 void TIM5_SelectOnePulseMode(TIM5_OPMode_TypeDef TIM5_OPMode)
1006                     ; 467 {
1007                     .text:	section	.text,new
1008  0000               _TIM5_SelectOnePulseMode:
1012                     ; 469   assert_param(IS_TIM5_OPM_MODE(TIM5_OPMode));
1014                     ; 472   if (TIM5_OPMode == TIM5_OPMode_Single)
1016  0000 4a            	dec	a
1017  0001 2605          	jrne	L504
1018                     ; 474     TIM5->CR1 |= TIM_CR1_OPM ;
1020  0003 72165300      	bset	21248,#3
1023  0007 81            	ret	
1024  0008               L504:
1025                     ; 478     TIM5->CR1 &= (uint8_t)(~TIM_CR1_OPM);
1027  0008 72175300      	bres	21248,#3
1028                     ; 480 }
1031  000c 81            	ret	
1066                     ; 488 void TIM5_Cmd(FunctionalState NewState)
1066                     ; 489 {
1067                     .text:	section	.text,new
1068  0000               _TIM5_Cmd:
1072                     ; 491   assert_param(IS_FUNCTIONAL_STATE(NewState));
1074                     ; 494   if (NewState != DISABLE)
1076  0000 4d            	tnz	a
1077  0001 2705          	jreq	L724
1078                     ; 496     TIM5->CR1 |= TIM_CR1_CEN;
1080  0003 72105300      	bset	21248,#0
1083  0007 81            	ret	
1084  0008               L724:
1085                     ; 500     TIM5->CR1 &= (uint8_t)(~TIM_CR1_CEN);
1087  0008 72115300      	bres	21248,#0
1088                     ; 502 }
1091  000c 81            	ret	
1285                     ; 578 void TIM5_OC1Init(TIM5_OCMode_TypeDef TIM5_OCMode,
1285                     ; 579                   TIM5_OutputState_TypeDef TIM5_OutputState,
1285                     ; 580                   uint16_t TIM5_Pulse,
1285                     ; 581                   TIM5_OCPolarity_TypeDef TIM5_OCPolarity,
1285                     ; 582                   TIM5_OCIdleState_TypeDef TIM5_OCIdleState)
1285                     ; 583 {
1286                     .text:	section	.text,new
1287  0000               _TIM5_OC1Init:
1289  0000 89            	pushw	x
1290  0001 88            	push	a
1291       00000001      OFST:	set	1
1294                     ; 584   uint8_t tmpccmr1 = 0;
1296                     ; 587   assert_param(IS_TIM5_OC_MODE(TIM5_OCMode));
1298                     ; 588   assert_param(IS_TIM5_OUTPUT_STATE(TIM5_OutputState));
1300                     ; 589   assert_param(IS_TIM5_OC_POLARITY(TIM5_OCPolarity));
1302                     ; 590   assert_param(IS_TIM5_OCIDLE_STATE(TIM5_OCIdleState));
1304                     ; 592   tmpccmr1 = TIM5->CCMR1;
1306  0002 c65309        	ld	a,21257
1307  0005 6b01          	ld	(OFST+0,sp),a
1308                     ; 595   TIM5->CCER1 &= (uint8_t)(~TIM_CCER1_CC1E);
1310                     ; 597   tmpccmr1 &= (uint8_t)(~TIM_CCMR_OCM);
1312  0007 a48f          	and	a,#143
1313  0009 7211530b      	bres	21259,#0
1314  000d 6b01          	ld	(OFST+0,sp),a
1315                     ; 600   tmpccmr1 |= (uint8_t)TIM5_OCMode;
1317  000f 9e            	ld	a,xh
1318  0010 1a01          	or	a,(OFST+0,sp)
1319  0012 6b01          	ld	(OFST+0,sp),a
1320                     ; 602   TIM5->CCMR1 = tmpccmr1;
1322  0014 c75309        	ld	21257,a
1323                     ; 605   if (TIM5_OutputState == TIM5_OutputState_Enable)
1325  0017 9f            	ld	a,xl
1326  0018 4a            	dec	a
1327  0019 2606          	jrne	L145
1328                     ; 607     TIM5->CCER1 |= TIM_CCER1_CC1E;
1330  001b 7210530b      	bset	21259,#0
1332  001f 2004          	jra	L345
1333  0021               L145:
1334                     ; 611     TIM5->CCER1 &= (uint8_t)(~TIM_CCER1_CC1E);
1336  0021 7211530b      	bres	21259,#0
1337  0025               L345:
1338                     ; 615   if (TIM5_OCPolarity == TIM5_OCPolarity_Low)
1340  0025 7b08          	ld	a,(OFST+7,sp)
1341  0027 4a            	dec	a
1342  0028 2606          	jrne	L545
1343                     ; 617     TIM5->CCER1 |= TIM_CCER1_CC1P;
1345  002a 7212530b      	bset	21259,#1
1347  002e 2004          	jra	L745
1348  0030               L545:
1349                     ; 621     TIM5->CCER1 &= (uint8_t)(~TIM_CCER1_CC1P);
1351  0030 7213530b      	bres	21259,#1
1352  0034               L745:
1353                     ; 625   if (TIM5_OCIdleState == TIM5_OCIdleState_Set)
1355  0034 7b09          	ld	a,(OFST+8,sp)
1356  0036 4a            	dec	a
1357  0037 2606          	jrne	L155
1358                     ; 627     TIM5->OISR |= TIM_OISR_OIS1;
1360  0039 72105316      	bset	21270,#0
1362  003d 2004          	jra	L355
1363  003f               L155:
1364                     ; 631     TIM5->OISR &= (uint8_t)(~TIM_OISR_OIS1);
1366  003f 72115316      	bres	21270,#0
1367  0043               L355:
1368                     ; 635   TIM5->CCR1H = (uint8_t)(TIM5_Pulse >> 8);
1370  0043 7b06          	ld	a,(OFST+5,sp)
1371  0045 c75311        	ld	21265,a
1372                     ; 636   TIM5->CCR1L = (uint8_t)(TIM5_Pulse);
1374  0048 7b07          	ld	a,(OFST+6,sp)
1375  004a c75312        	ld	21266,a
1376                     ; 637 }
1379  004d 5b03          	addw	sp,#3
1380  004f 81            	ret	
1459                     ; 664 void TIM5_OC2Init(TIM5_OCMode_TypeDef TIM5_OCMode,
1459                     ; 665                   TIM5_OutputState_TypeDef TIM5_OutputState,
1459                     ; 666                   uint16_t TIM5_Pulse,
1459                     ; 667                   TIM5_OCPolarity_TypeDef TIM5_OCPolarity,
1459                     ; 668                   TIM5_OCIdleState_TypeDef TIM5_OCIdleState)
1459                     ; 669 {
1460                     .text:	section	.text,new
1461  0000               _TIM5_OC2Init:
1463  0000 89            	pushw	x
1464  0001 88            	push	a
1465       00000001      OFST:	set	1
1468                     ; 670   uint8_t tmpccmr2 = 0;
1470                     ; 673   assert_param(IS_TIM5_OC_MODE(TIM5_OCMode));
1472                     ; 674   assert_param(IS_TIM5_OUTPUT_STATE(TIM5_OutputState));
1474                     ; 675   assert_param(IS_TIM5_OC_POLARITY(TIM5_OCPolarity));
1476                     ; 676   assert_param(IS_TIM5_OCIDLE_STATE(TIM5_OCIdleState));
1478                     ; 678   tmpccmr2 = TIM5->CCMR2;
1480  0002 c6530a        	ld	a,21258
1481  0005 6b01          	ld	(OFST+0,sp),a
1482                     ; 681   TIM5->CCER1 &= (uint8_t)(~TIM_CCER1_CC2E);
1484                     ; 684   tmpccmr2 &= (uint8_t)(~TIM_CCMR_OCM);
1486  0007 a48f          	and	a,#143
1487  0009 7219530b      	bres	21259,#4
1488  000d 6b01          	ld	(OFST+0,sp),a
1489                     ; 687   tmpccmr2 |= (uint8_t)TIM5_OCMode;
1491  000f 9e            	ld	a,xh
1492  0010 1a01          	or	a,(OFST+0,sp)
1493  0012 6b01          	ld	(OFST+0,sp),a
1494                     ; 689   TIM5->CCMR2 = tmpccmr2;
1496  0014 c7530a        	ld	21258,a
1497                     ; 692   if (TIM5_OutputState == TIM5_OutputState_Enable)
1499  0017 9f            	ld	a,xl
1500  0018 4a            	dec	a
1501  0019 2606          	jrne	L316
1502                     ; 694     TIM5->CCER1 |= TIM_CCER1_CC2E;
1504  001b 7218530b      	bset	21259,#4
1506  001f 2004          	jra	L516
1507  0021               L316:
1508                     ; 698     TIM5->CCER1 &= (uint8_t)(~TIM_CCER1_CC2E);
1510  0021 7219530b      	bres	21259,#4
1511  0025               L516:
1512                     ; 702   if (TIM5_OCPolarity == TIM5_OCPolarity_Low)
1514  0025 7b08          	ld	a,(OFST+7,sp)
1515  0027 4a            	dec	a
1516  0028 2606          	jrne	L716
1517                     ; 704     TIM5->CCER1 |= TIM_CCER1_CC2P;
1519  002a 721a530b      	bset	21259,#5
1521  002e 2004          	jra	L126
1522  0030               L716:
1523                     ; 708     TIM5->CCER1 &= (uint8_t)(~TIM_CCER1_CC2P);
1525  0030 721b530b      	bres	21259,#5
1526  0034               L126:
1527                     ; 713   if (TIM5_OCIdleState == TIM5_OCIdleState_Set)
1529  0034 7b09          	ld	a,(OFST+8,sp)
1530  0036 4a            	dec	a
1531  0037 2606          	jrne	L326
1532                     ; 715     TIM5->OISR |= TIM_OISR_OIS2;
1534  0039 72145316      	bset	21270,#2
1536  003d 2004          	jra	L526
1537  003f               L326:
1538                     ; 719     TIM5->OISR &= (uint8_t)(~TIM_OISR_OIS2);
1540  003f 72155316      	bres	21270,#2
1541  0043               L526:
1542                     ; 723   TIM5->CCR2H = (uint8_t)(TIM5_Pulse >> 8);
1544  0043 7b06          	ld	a,(OFST+5,sp)
1545  0045 c75313        	ld	21267,a
1546                     ; 724   TIM5->CCR2L = (uint8_t)(TIM5_Pulse);
1548  0048 7b07          	ld	a,(OFST+6,sp)
1549  004a c75314        	ld	21268,a
1550                     ; 725 }
1553  004d 5b03          	addw	sp,#3
1554  004f 81            	ret	
1752                     ; 754 void TIM5_BKRConfig(TIM5_OSSIState_TypeDef TIM5_OSSIState,
1752                     ; 755                     TIM5_LockLevel_TypeDef TIM5_LockLevel,
1752                     ; 756                     TIM5_BreakState_TypeDef TIM5_BreakState,
1752                     ; 757                     TIM5_BreakPolarity_TypeDef TIM5_BreakPolarity,
1752                     ; 758                     TIM5_AutomaticOutput_TypeDef TIM5_AutomaticOutput)
1752                     ; 759 
1752                     ; 760 {
1753                     .text:	section	.text,new
1754  0000               _TIM5_BKRConfig:
1756  0000 89            	pushw	x
1757  0001 88            	push	a
1758       00000001      OFST:	set	1
1761                     ; 762   assert_param(IS_TIM5_OSSI_STATE(TIM5_OSSIState));
1763                     ; 763   assert_param(IS_TIM5_LOCK_LEVEL(TIM5_LockLevel));
1765                     ; 764   assert_param(IS_TIM5_BREAK_STATE(TIM5_BreakState));
1767                     ; 765   assert_param(IS_TIM5_BREAK_POLARITY(TIM5_BreakPolarity));
1769                     ; 766   assert_param(IS_TIM5_AUTOMATIC_OUTPUT_STATE(TIM5_AutomaticOutput));
1771                     ; 772   TIM5->BKR = (uint8_t)((uint8_t)((uint8_t)((uint8_t)((uint8_t)TIM5_OSSIState | (uint8_t)TIM5_LockLevel) | \
1771                     ; 773                                   (uint8_t)((uint8_t)TIM5_BreakState | (uint8_t)TIM5_BreakPolarity)) | \
1771                     ; 774                                   TIM5_AutomaticOutput));
1773  0002 7b06          	ld	a,(OFST+5,sp)
1774  0004 1a07          	or	a,(OFST+6,sp)
1775  0006 6b01          	ld	(OFST+0,sp),a
1776  0008 9f            	ld	a,xl
1777  0009 1a02          	or	a,(OFST+1,sp)
1778  000b 1a01          	or	a,(OFST+0,sp)
1779  000d 1a08          	or	a,(OFST+7,sp)
1780  000f c75315        	ld	21269,a
1781                     ; 775 }
1784  0012 5b03          	addw	sp,#3
1785  0014 81            	ret	
1821                     ; 783 void TIM5_CtrlPWMOutputs(FunctionalState NewState)
1821                     ; 784 {
1822                     .text:	section	.text,new
1823  0000               _TIM5_CtrlPWMOutputs:
1827                     ; 786   assert_param(IS_FUNCTIONAL_STATE(NewState));
1829                     ; 790   if (NewState != DISABLE)
1831  0000 4d            	tnz	a
1832  0001 2705          	jreq	L757
1833                     ; 792     TIM5->BKR |= TIM_BKR_MOE ;
1835  0003 721e5315      	bset	21269,#7
1838  0007 81            	ret	
1839  0008               L757:
1840                     ; 796     TIM5->BKR &= (uint8_t)(~TIM_BKR_MOE) ;
1842  0008 721f5315      	bres	21269,#7
1843                     ; 798 }
1846  000c 81            	ret	
1911                     ; 818 void TIM5_SelectOCxM(TIM5_Channel_TypeDef TIM5_Channel,
1911                     ; 819                      TIM5_OCMode_TypeDef TIM5_OCMode)
1911                     ; 820 {
1912                     .text:	section	.text,new
1913  0000               _TIM5_SelectOCxM:
1915  0000 89            	pushw	x
1916       00000000      OFST:	set	0
1919                     ; 822   assert_param(IS_TIM5_CHANNEL(TIM5_Channel));
1921                     ; 823   assert_param(IS_TIM5_OCM(TIM5_OCMode));
1923                     ; 825   if (TIM5_Channel == TIM5_Channel_1)
1925  0001 9e            	ld	a,xh
1926  0002 4d            	tnz	a
1927  0003 2615          	jrne	L5101
1928                     ; 828     TIM5->CCER1 &= (uint8_t)(~TIM_CCER1_CC1E);
1930  0005 7211530b      	bres	21259,#0
1931                     ; 831     TIM5->CCMR1 &= (uint8_t)(~TIM_CCMR_OCM);
1933  0009 c65309        	ld	a,21257
1934  000c a48f          	and	a,#143
1935  000e c75309        	ld	21257,a
1936                     ; 834     TIM5->CCMR1 |= (uint8_t)TIM5_OCMode;
1938  0011 9f            	ld	a,xl
1939  0012 ca5309        	or	a,21257
1940  0015 c75309        	ld	21257,a
1942  0018 2014          	jra	L7101
1943  001a               L5101:
1944                     ; 839     TIM5->CCER1 &= (uint8_t)(~TIM_CCER1_CC2E);
1946  001a 7219530b      	bres	21259,#4
1947                     ; 842     TIM5->CCMR2 &= (uint8_t)(~TIM_CCMR_OCM);
1949  001e c6530a        	ld	a,21258
1950  0021 a48f          	and	a,#143
1951  0023 c7530a        	ld	21258,a
1952                     ; 845     TIM5->CCMR2 |= (uint8_t)TIM5_OCMode;
1954  0026 c6530a        	ld	a,21258
1955  0029 1a02          	or	a,(OFST+2,sp)
1956  002b c7530a        	ld	21258,a
1957  002e               L7101:
1958                     ; 847 }
1961  002e 85            	popw	x
1962  002f 81            	ret	
1994                     ; 855 void TIM5_SetCompare1(uint16_t Compare)
1994                     ; 856 {
1995                     .text:	section	.text,new
1996  0000               _TIM5_SetCompare1:
2000                     ; 858   TIM5->CCR1H = (uint8_t)(Compare >> 8);
2002  0000 9e            	ld	a,xh
2003  0001 c75311        	ld	21265,a
2004                     ; 859   TIM5->CCR1L = (uint8_t)(Compare);
2006  0004 9f            	ld	a,xl
2007  0005 c75312        	ld	21266,a
2008                     ; 860 }
2011  0008 81            	ret	
2043                     ; 868 void TIM5_SetCompare2(uint16_t Compare)
2043                     ; 869 {
2044                     .text:	section	.text,new
2045  0000               _TIM5_SetCompare2:
2049                     ; 871   TIM5->CCR2H = (uint8_t)(Compare >> 8);
2051  0000 9e            	ld	a,xh
2052  0001 c75313        	ld	21267,a
2053                     ; 872   TIM5->CCR2L = (uint8_t)(Compare);
2055  0004 9f            	ld	a,xl
2056  0005 c75314        	ld	21268,a
2057                     ; 873 }
2060  0008 81            	ret	
2125                     ; 883 void TIM5_ForcedOC1Config(TIM5_ForcedAction_TypeDef TIM5_ForcedAction)
2125                     ; 884 {
2126                     .text:	section	.text,new
2127  0000               _TIM5_ForcedOC1Config:
2129  0000 88            	push	a
2130  0001 88            	push	a
2131       00000001      OFST:	set	1
2134                     ; 885   uint8_t tmpccmr1 = 0;
2136                     ; 888   assert_param(IS_TIM5_FORCED_ACTION(TIM5_ForcedAction));
2138                     ; 890   tmpccmr1 = TIM5->CCMR1;
2140  0002 c65309        	ld	a,21257
2141                     ; 893   tmpccmr1 &= (uint8_t)(~TIM_CCMR_OCM);
2143  0005 a48f          	and	a,#143
2144                     ; 896   tmpccmr1 |= (uint8_t)TIM5_ForcedAction;
2146  0007 1a02          	or	a,(OFST+1,sp)
2147                     ; 898   TIM5->CCMR1 = tmpccmr1;
2149  0009 c75309        	ld	21257,a
2150                     ; 899 }
2153  000c 85            	popw	x
2154  000d 81            	ret	
2197                     ; 909 void TIM5_ForcedOC2Config(TIM5_ForcedAction_TypeDef TIM5_ForcedAction)
2197                     ; 910 {
2198                     .text:	section	.text,new
2199  0000               _TIM5_ForcedOC2Config:
2201  0000 88            	push	a
2202  0001 88            	push	a
2203       00000001      OFST:	set	1
2206                     ; 911   uint8_t tmpccmr2 = 0;
2208                     ; 914   assert_param(IS_TIM5_FORCED_ACTION(TIM5_ForcedAction));
2210                     ; 916   tmpccmr2 = TIM5->CCMR2;
2212  0002 c6530a        	ld	a,21258
2213                     ; 919   tmpccmr2 &= (uint8_t)(~TIM_CCMR_OCM);
2215  0005 a48f          	and	a,#143
2216                     ; 922   tmpccmr2 |= (uint8_t)TIM5_ForcedAction;
2218  0007 1a02          	or	a,(OFST+1,sp)
2219                     ; 924   TIM5->CCMR2 = tmpccmr2;
2221  0009 c7530a        	ld	21258,a
2222                     ; 925 }
2225  000c 85            	popw	x
2226  000d 81            	ret	
2262                     ; 933 void TIM5_OC1PreloadConfig(FunctionalState NewState)
2262                     ; 934 {
2263                     .text:	section	.text,new
2264  0000               _TIM5_OC1PreloadConfig:
2268                     ; 936   assert_param(IS_FUNCTIONAL_STATE(NewState));
2270                     ; 939   if (NewState != DISABLE)
2272  0000 4d            	tnz	a
2273  0001 2705          	jreq	L7311
2274                     ; 941     TIM5->CCMR1 |= TIM_CCMR_OCxPE ;
2276  0003 72165309      	bset	21257,#3
2279  0007 81            	ret	
2280  0008               L7311:
2281                     ; 945     TIM5->CCMR1 &= (uint8_t)(~TIM_CCMR_OCxPE) ;
2283  0008 72175309      	bres	21257,#3
2284                     ; 947 }
2287  000c 81            	ret	
2323                     ; 955 void TIM5_OC2PreloadConfig(FunctionalState NewState)
2323                     ; 956 {
2324                     .text:	section	.text,new
2325  0000               _TIM5_OC2PreloadConfig:
2329                     ; 958   assert_param(IS_FUNCTIONAL_STATE(NewState));
2331                     ; 961   if (NewState != DISABLE)
2333  0000 4d            	tnz	a
2334  0001 2705          	jreq	L1611
2335                     ; 963     TIM5->CCMR2 |= TIM_CCMR_OCxPE ;
2337  0003 7216530a      	bset	21258,#3
2340  0007 81            	ret	
2341  0008               L1611:
2342                     ; 967     TIM5->CCMR2 &= (uint8_t)(~TIM_CCMR_OCxPE) ;
2344  0008 7217530a      	bres	21258,#3
2345                     ; 969 }
2348  000c 81            	ret	
2383                     ; 977 void TIM5_OC1FastConfig(FunctionalState NewState)
2383                     ; 978 {
2384                     .text:	section	.text,new
2385  0000               _TIM5_OC1FastConfig:
2389                     ; 980   assert_param(IS_FUNCTIONAL_STATE(NewState));
2391                     ; 983   if (NewState != DISABLE)
2393  0000 4d            	tnz	a
2394  0001 2705          	jreq	L3021
2395                     ; 985     TIM5->CCMR1 |= TIM_CCMR_OCxFE ;
2397  0003 72145309      	bset	21257,#2
2400  0007 81            	ret	
2401  0008               L3021:
2402                     ; 989     TIM5->CCMR1 &= (uint8_t)(~TIM_CCMR_OCxFE) ;
2404  0008 72155309      	bres	21257,#2
2405                     ; 991 }
2408  000c 81            	ret	
2443                     ; 1000 void TIM5_OC2FastConfig(FunctionalState NewState)
2443                     ; 1001 {
2444                     .text:	section	.text,new
2445  0000               _TIM5_OC2FastConfig:
2449                     ; 1003   assert_param(IS_FUNCTIONAL_STATE(NewState));
2451                     ; 1006   if (NewState != DISABLE)
2453  0000 4d            	tnz	a
2454  0001 2705          	jreq	L5221
2455                     ; 1008     TIM5->CCMR2 |= TIM_CCMR_OCxFE ;
2457  0003 7214530a      	bset	21258,#2
2460  0007 81            	ret	
2461  0008               L5221:
2462                     ; 1012     TIM5->CCMR2 &= (uint8_t)(~TIM_CCMR_OCxFE) ;
2464  0008 7215530a      	bres	21258,#2
2465                     ; 1014 }
2468  000c 81            	ret	
2504                     ; 1024 void TIM5_OC1PolarityConfig(TIM5_OCPolarity_TypeDef TIM5_OCPolarity)
2504                     ; 1025 {
2505                     .text:	section	.text,new
2506  0000               _TIM5_OC1PolarityConfig:
2510                     ; 1027   assert_param(IS_TIM5_OC_POLARITY(TIM5_OCPolarity));
2512                     ; 1030   if (TIM5_OCPolarity == TIM5_OCPolarity_Low)
2514  0000 4a            	dec	a
2515  0001 2605          	jrne	L7421
2516                     ; 1032     TIM5->CCER1 |= TIM_CCER1_CC1P ;
2518  0003 7212530b      	bset	21259,#1
2521  0007 81            	ret	
2522  0008               L7421:
2523                     ; 1036     TIM5->CCER1 &= (uint8_t)(~TIM_CCER1_CC1P) ;
2525  0008 7213530b      	bres	21259,#1
2526                     ; 1038 }
2529  000c 81            	ret	
2565                     ; 1048 void TIM5_OC2PolarityConfig(TIM5_OCPolarity_TypeDef TIM5_OCPolarity)
2565                     ; 1049 {
2566                     .text:	section	.text,new
2567  0000               _TIM5_OC2PolarityConfig:
2571                     ; 1051   assert_param(IS_TIM5_OC_POLARITY(TIM5_OCPolarity));
2573                     ; 1054   if (TIM5_OCPolarity == TIM5_OCPolarity_Low)
2575  0000 4a            	dec	a
2576  0001 2605          	jrne	L1721
2577                     ; 1056     TIM5->CCER1 |= TIM_CCER1_CC2P ;
2579  0003 721a530b      	bset	21259,#5
2582  0007 81            	ret	
2583  0008               L1721:
2584                     ; 1060     TIM5->CCER1 &= (uint8_t)(~TIM_CCER1_CC2P) ;
2586  0008 721b530b      	bres	21259,#5
2587                     ; 1062 }
2590  000c 81            	ret	
2635                     ; 1074 void TIM5_CCxCmd(TIM5_Channel_TypeDef TIM5_Channel,
2635                     ; 1075                  FunctionalState NewState)
2635                     ; 1076 {
2636                     .text:	section	.text,new
2637  0000               _TIM5_CCxCmd:
2639  0000 89            	pushw	x
2640       00000000      OFST:	set	0
2643                     ; 1078   assert_param(IS_TIM5_CHANNEL(TIM5_Channel));
2645                     ; 1079   assert_param(IS_FUNCTIONAL_STATE(NewState));
2647                     ; 1081   if (TIM5_Channel == TIM5_Channel_1)
2649  0001 9e            	ld	a,xh
2650  0002 4d            	tnz	a
2651  0003 2610          	jrne	L7131
2652                     ; 1084     if (NewState != DISABLE)
2654  0005 9f            	ld	a,xl
2655  0006 4d            	tnz	a
2656  0007 2706          	jreq	L1231
2657                     ; 1086       TIM5->CCER1 |= TIM_CCER1_CC1E ;
2659  0009 7210530b      	bset	21259,#0
2661  000d 2014          	jra	L5231
2662  000f               L1231:
2663                     ; 1090       TIM5->CCER1 &= (uint8_t)(~TIM_CCER1_CC1E) ;
2665  000f 7211530b      	bres	21259,#0
2666  0013 200e          	jra	L5231
2667  0015               L7131:
2668                     ; 1097     if (NewState != DISABLE)
2670  0015 7b02          	ld	a,(OFST+2,sp)
2671  0017 2706          	jreq	L7231
2672                     ; 1099       TIM5->CCER1 |= TIM_CCER1_CC2E;
2674  0019 7218530b      	bset	21259,#4
2676  001d 2004          	jra	L5231
2677  001f               L7231:
2678                     ; 1103       TIM5->CCER1 &= (uint8_t)(~TIM_CCER1_CC2E) ;
2680  001f 7219530b      	bres	21259,#4
2681  0023               L5231:
2682                     ; 1106 }
2685  0023 85            	popw	x
2686  0024 81            	ret	
2848                     ; 1184 void TIM5_ICInit(TIM5_Channel_TypeDef TIM5_Channel,
2848                     ; 1185                  TIM5_ICPolarity_TypeDef TIM5_ICPolarity,
2848                     ; 1186                  TIM5_ICSelection_TypeDef TIM5_ICSelection,
2848                     ; 1187                  TIM5_ICPSC_TypeDef TIM5_ICPrescaler,
2848                     ; 1188                  uint8_t TIM5_ICFilter)
2848                     ; 1189 {
2849                     .text:	section	.text,new
2850  0000               _TIM5_ICInit:
2852  0000 89            	pushw	x
2853       00000000      OFST:	set	0
2856                     ; 1191   assert_param(IS_TIM5_CHANNEL(TIM5_Channel));
2858                     ; 1193   if (TIM5_Channel == TIM5_Channel_1)
2860  0001 9e            	ld	a,xh
2861  0002 4d            	tnz	a
2862  0003 2614          	jrne	L5241
2863                     ; 1196     TI1_Config(TIM5_ICPolarity, TIM5_ICSelection, TIM5_ICFilter);
2865  0005 7b07          	ld	a,(OFST+7,sp)
2866  0007 88            	push	a
2867  0008 7b06          	ld	a,(OFST+6,sp)
2868  000a 97            	ld	xl,a
2869  000b 7b03          	ld	a,(OFST+3,sp)
2870  000d 95            	ld	xh,a
2871  000e cd0000        	call	L3_TI1_Config
2873  0011 84            	pop	a
2874                     ; 1199     TIM5_SetIC1Prescaler(TIM5_ICPrescaler);
2876  0012 7b06          	ld	a,(OFST+6,sp)
2877  0014 cd0000        	call	_TIM5_SetIC1Prescaler
2880  0017 2012          	jra	L7241
2881  0019               L5241:
2882                     ; 1204     TI2_Config(TIM5_ICPolarity, TIM5_ICSelection, TIM5_ICFilter);
2884  0019 7b07          	ld	a,(OFST+7,sp)
2885  001b 88            	push	a
2886  001c 7b06          	ld	a,(OFST+6,sp)
2887  001e 97            	ld	xl,a
2888  001f 7b03          	ld	a,(OFST+3,sp)
2889  0021 95            	ld	xh,a
2890  0022 cd0000        	call	L5_TI2_Config
2892  0025 84            	pop	a
2893                     ; 1207     TIM5_SetIC2Prescaler(TIM5_ICPrescaler);
2895  0026 7b06          	ld	a,(OFST+6,sp)
2896  0028 cd0000        	call	_TIM5_SetIC2Prescaler
2898  002b               L7241:
2899                     ; 1209 }
2902  002b 85            	popw	x
2903  002c 81            	ret	
2993                     ; 1235 void TIM5_PWMIConfig(TIM5_Channel_TypeDef TIM5_Channel,
2993                     ; 1236                      TIM5_ICPolarity_TypeDef TIM5_ICPolarity,
2993                     ; 1237                      TIM5_ICSelection_TypeDef TIM5_ICSelection,
2993                     ; 1238                      TIM5_ICPSC_TypeDef TIM5_ICPrescaler,
2993                     ; 1239                      uint8_t TIM5_ICFilter)
2993                     ; 1240 {
2994                     .text:	section	.text,new
2995  0000               _TIM5_PWMIConfig:
2997  0000 89            	pushw	x
2998  0001 89            	pushw	x
2999       00000002      OFST:	set	2
3002                     ; 1241   uint8_t icpolarity = TIM5_ICPolarity_Rising;
3004                     ; 1242   uint8_t icselection = TIM5_ICSelection_DirectTI;
3006                     ; 1245   assert_param(IS_TIM5_CHANNEL(TIM5_Channel));
3008                     ; 1248   if (TIM5_ICPolarity == TIM5_ICPolarity_Rising)
3010  0002 9f            	ld	a,xl
3011  0003 4d            	tnz	a
3012  0004 2605          	jrne	L1741
3013                     ; 1250     icpolarity = TIM5_ICPolarity_Falling;
3015  0006 4c            	inc	a
3016  0007 6b01          	ld	(OFST-1,sp),a
3018  0009 2002          	jra	L3741
3019  000b               L1741:
3020                     ; 1254     icpolarity = TIM5_ICPolarity_Rising;
3022  000b 0f01          	clr	(OFST-1,sp)
3023  000d               L3741:
3024                     ; 1258   if (TIM5_ICSelection == TIM5_ICSelection_DirectTI)
3026  000d 7b07          	ld	a,(OFST+5,sp)
3027  000f 4a            	dec	a
3028  0010 2604          	jrne	L5741
3029                     ; 1260     icselection = TIM5_ICSelection_IndirectTI;
3031  0012 a602          	ld	a,#2
3033  0014 2002          	jra	L7741
3034  0016               L5741:
3035                     ; 1264     icselection = TIM5_ICSelection_DirectTI;
3037  0016 a601          	ld	a,#1
3038  0018               L7741:
3039  0018 6b02          	ld	(OFST+0,sp),a
3040                     ; 1267   if (TIM5_Channel == TIM5_Channel_1)
3042  001a 7b03          	ld	a,(OFST+1,sp)
3043  001c 2626          	jrne	L1051
3044                     ; 1270     TI1_Config(TIM5_ICPolarity, TIM5_ICSelection,
3044                     ; 1271                TIM5_ICFilter);
3046  001e 7b09          	ld	a,(OFST+7,sp)
3047  0020 88            	push	a
3048  0021 7b08          	ld	a,(OFST+6,sp)
3049  0023 97            	ld	xl,a
3050  0024 7b05          	ld	a,(OFST+3,sp)
3051  0026 95            	ld	xh,a
3052  0027 cd0000        	call	L3_TI1_Config
3054  002a 84            	pop	a
3055                     ; 1274     TIM5_SetIC1Prescaler(TIM5_ICPrescaler);
3057  002b 7b08          	ld	a,(OFST+6,sp)
3058  002d cd0000        	call	_TIM5_SetIC1Prescaler
3060                     ; 1277     TI2_Config((TIM5_ICPolarity_TypeDef)icpolarity, (TIM5_ICSelection_TypeDef)icselection, TIM5_ICFilter);
3062  0030 7b09          	ld	a,(OFST+7,sp)
3063  0032 88            	push	a
3064  0033 7b03          	ld	a,(OFST+1,sp)
3065  0035 97            	ld	xl,a
3066  0036 7b02          	ld	a,(OFST+0,sp)
3067  0038 95            	ld	xh,a
3068  0039 cd0000        	call	L5_TI2_Config
3070  003c 84            	pop	a
3071                     ; 1280     TIM5_SetIC2Prescaler(TIM5_ICPrescaler);
3073  003d 7b08          	ld	a,(OFST+6,sp)
3074  003f cd0000        	call	_TIM5_SetIC2Prescaler
3077  0042 2024          	jra	L3051
3078  0044               L1051:
3079                     ; 1285     TI2_Config(TIM5_ICPolarity, TIM5_ICSelection,
3079                     ; 1286                TIM5_ICFilter);
3081  0044 7b09          	ld	a,(OFST+7,sp)
3082  0046 88            	push	a
3083  0047 7b08          	ld	a,(OFST+6,sp)
3084  0049 97            	ld	xl,a
3085  004a 7b05          	ld	a,(OFST+3,sp)
3086  004c 95            	ld	xh,a
3087  004d cd0000        	call	L5_TI2_Config
3089  0050 84            	pop	a
3090                     ; 1289     TIM5_SetIC2Prescaler(TIM5_ICPrescaler);
3092  0051 7b08          	ld	a,(OFST+6,sp)
3093  0053 cd0000        	call	_TIM5_SetIC2Prescaler
3095                     ; 1292     TI1_Config((TIM5_ICPolarity_TypeDef)icpolarity, (TIM5_ICSelection_TypeDef)icselection, TIM5_ICFilter);
3097  0056 7b09          	ld	a,(OFST+7,sp)
3098  0058 88            	push	a
3099  0059 7b03          	ld	a,(OFST+1,sp)
3100  005b 97            	ld	xl,a
3101  005c 7b02          	ld	a,(OFST+0,sp)
3102  005e 95            	ld	xh,a
3103  005f cd0000        	call	L3_TI1_Config
3105  0062 84            	pop	a
3106                     ; 1295     TIM5_SetIC1Prescaler(TIM5_ICPrescaler);
3108  0063 7b08          	ld	a,(OFST+6,sp)
3109  0065 cd0000        	call	_TIM5_SetIC1Prescaler
3111  0068               L3051:
3112                     ; 1297 }
3115  0068 5b04          	addw	sp,#4
3116  006a 81            	ret	
3162                     ; 1304 uint16_t TIM5_GetCapture1(void)
3162                     ; 1305 {
3163                     .text:	section	.text,new
3164  0000               _TIM5_GetCapture1:
3166  0000 5204          	subw	sp,#4
3167       00000004      OFST:	set	4
3170                     ; 1306   uint16_t tmpccr1 = 0;
3172                     ; 1309   tmpccr1h = TIM5->CCR1H;
3174  0002 c65311        	ld	a,21265
3175  0005 6b02          	ld	(OFST-2,sp),a
3176                     ; 1310   tmpccr1l = TIM5->CCR1L;
3178  0007 c65312        	ld	a,21266
3179  000a 6b01          	ld	(OFST-3,sp),a
3180                     ; 1312   tmpccr1 = (uint16_t)(tmpccr1l);
3182  000c 5f            	clrw	x
3183  000d 97            	ld	xl,a
3184  000e 1f03          	ldw	(OFST-1,sp),x
3185                     ; 1313   tmpccr1 |= (uint16_t)((uint16_t)tmpccr1h << 8);
3187  0010 5f            	clrw	x
3188  0011 7b02          	ld	a,(OFST-2,sp)
3189  0013 97            	ld	xl,a
3190  0014 7b04          	ld	a,(OFST+0,sp)
3191  0016 01            	rrwa	x,a
3192  0017 1a03          	or	a,(OFST-1,sp)
3193  0019 01            	rrwa	x,a
3194                     ; 1315   return ((uint16_t)tmpccr1);
3198  001a 5b04          	addw	sp,#4
3199  001c 81            	ret	
3245                     ; 1323 uint16_t TIM5_GetCapture2(void)
3245                     ; 1324 {
3246                     .text:	section	.text,new
3247  0000               _TIM5_GetCapture2:
3249  0000 5204          	subw	sp,#4
3250       00000004      OFST:	set	4
3253                     ; 1325   uint16_t tmpccr2 = 0;
3255                     ; 1328   tmpccr2h = TIM5->CCR2H;
3257  0002 c65313        	ld	a,21267
3258  0005 6b02          	ld	(OFST-2,sp),a
3259                     ; 1329   tmpccr2l = TIM5->CCR2L;
3261  0007 c65314        	ld	a,21268
3262  000a 6b01          	ld	(OFST-3,sp),a
3263                     ; 1331   tmpccr2 = (uint16_t)(tmpccr2l);
3265  000c 5f            	clrw	x
3266  000d 97            	ld	xl,a
3267  000e 1f03          	ldw	(OFST-1,sp),x
3268                     ; 1332   tmpccr2 |= (uint16_t)((uint16_t)tmpccr2h << 8);
3270  0010 5f            	clrw	x
3271  0011 7b02          	ld	a,(OFST-2,sp)
3272  0013 97            	ld	xl,a
3273  0014 7b04          	ld	a,(OFST+0,sp)
3274  0016 01            	rrwa	x,a
3275  0017 1a03          	or	a,(OFST-1,sp)
3276  0019 01            	rrwa	x,a
3277                     ; 1334   return ((uint16_t)tmpccr2);
3281  001a 5b04          	addw	sp,#4
3282  001c 81            	ret	
3325                     ; 1347 void TIM5_SetIC1Prescaler(TIM5_ICPSC_TypeDef TIM5_IC1Prescaler)
3325                     ; 1348 {
3326                     .text:	section	.text,new
3327  0000               _TIM5_SetIC1Prescaler:
3329  0000 88            	push	a
3330  0001 88            	push	a
3331       00000001      OFST:	set	1
3334                     ; 1349   uint8_t tmpccmr1 = 0;
3336                     ; 1352   assert_param(IS_TIM5_IC_PRESCALER(TIM5_IC1Prescaler));
3338                     ; 1354   tmpccmr1 = TIM5->CCMR1;
3340  0002 c65309        	ld	a,21257
3341                     ; 1357   tmpccmr1 &= (uint8_t)(~TIM_CCMR_ICxPSC);
3343  0005 a4f3          	and	a,#243
3344                     ; 1360   tmpccmr1 |= (uint8_t)TIM5_IC1Prescaler;
3346  0007 1a02          	or	a,(OFST+1,sp)
3347                     ; 1362   TIM5->CCMR1 = tmpccmr1;
3349  0009 c75309        	ld	21257,a
3350                     ; 1363 }
3353  000c 85            	popw	x
3354  000d 81            	ret	
3397                     ; 1375 void TIM5_SetIC2Prescaler(TIM5_ICPSC_TypeDef TIM5_IC2Prescaler)
3397                     ; 1376 {
3398                     .text:	section	.text,new
3399  0000               _TIM5_SetIC2Prescaler:
3401  0000 88            	push	a
3402  0001 88            	push	a
3403       00000001      OFST:	set	1
3406                     ; 1377   uint8_t tmpccmr2 = 0;
3408                     ; 1380   assert_param(IS_TIM5_IC_PRESCALER(TIM5_IC2Prescaler));
3410                     ; 1382   tmpccmr2 = TIM5->CCMR2;
3412  0002 c6530a        	ld	a,21258
3413                     ; 1385   tmpccmr2 &= (uint8_t)(~TIM_CCMR_ICxPSC);
3415  0005 a4f3          	and	a,#243
3416                     ; 1388   tmpccmr2 |= (uint8_t)TIM5_IC2Prescaler;
3418  0007 1a02          	or	a,(OFST+1,sp)
3419                     ; 1390   TIM5->CCMR2 = tmpccmr2;
3421  0009 c7530a        	ld	21258,a
3422                     ; 1391 }
3425  000c 85            	popw	x
3426  000d 81            	ret	
3512                     ; 1422 void TIM5_ITConfig(TIM5_IT_TypeDef TIM5_IT, FunctionalState NewState)
3512                     ; 1423 {
3513                     .text:	section	.text,new
3514  0000               _TIM5_ITConfig:
3516  0000 89            	pushw	x
3517       00000000      OFST:	set	0
3520                     ; 1425   assert_param(IS_TIM5_IT(TIM5_IT));
3522                     ; 1426   assert_param(IS_FUNCTIONAL_STATE(NewState));
3524                     ; 1428   if (NewState != DISABLE)
3526  0001 9f            	ld	a,xl
3527  0002 4d            	tnz	a
3528  0003 2706          	jreq	L5461
3529                     ; 1431     TIM5->IER |= (uint8_t)TIM5_IT;
3531  0005 9e            	ld	a,xh
3532  0006 ca5305        	or	a,21253
3534  0009 2006          	jra	L7461
3535  000b               L5461:
3536                     ; 1436     TIM5->IER &= (uint8_t)(~(uint8_t)TIM5_IT);
3538  000b 7b01          	ld	a,(OFST+1,sp)
3539  000d 43            	cpl	a
3540  000e c45305        	and	a,21253
3541  0011               L7461:
3542  0011 c75305        	ld	21253,a
3543                     ; 1438 }
3546  0014 85            	popw	x
3547  0015 81            	ret	
3628                     ; 1451 void TIM5_GenerateEvent(TIM5_EventSource_TypeDef TIM5_EventSource)
3628                     ; 1452 {
3629                     .text:	section	.text,new
3630  0000               _TIM5_GenerateEvent:
3634                     ; 1454   assert_param(IS_TIM5_EVENT_SOURCE((uint8_t)TIM5_EventSource));
3636                     ; 1457   TIM5->EGR |= (uint8_t)TIM5_EventSource;
3638  0000 ca5308        	or	a,21256
3639  0003 c75308        	ld	21256,a
3640                     ; 1458 }
3643  0006 81            	ret	
3778                     ; 1473 FlagStatus TIM5_GetFlagStatus(TIM5_FLAG_TypeDef TIM5_FLAG)
3778                     ; 1474 {
3779                     .text:	section	.text,new
3780  0000               _TIM5_GetFlagStatus:
3782  0000 89            	pushw	x
3783  0001 89            	pushw	x
3784       00000002      OFST:	set	2
3787                     ; 1475   FlagStatus bitstatus = RESET;
3789                     ; 1476   uint8_t tim5_flag_l = 0, tim5_flag_h = 0;
3793                     ; 1479   assert_param(IS_TIM5_GET_FLAG(TIM5_FLAG));
3795                     ; 1481   tim5_flag_l = (uint8_t)(TIM5->SR1 & (uint8_t)(TIM5_FLAG));
3797  0002 9f            	ld	a,xl
3798  0003 c45306        	and	a,21254
3799  0006 6b01          	ld	(OFST-1,sp),a
3800                     ; 1482   tim5_flag_h = (uint8_t)(TIM5->SR2 & (uint8_t)((uint16_t)TIM5_FLAG >> 8));
3802  0008 c65307        	ld	a,21255
3803  000b 1403          	and	a,(OFST+1,sp)
3804  000d 6b02          	ld	(OFST+0,sp),a
3805                     ; 1484   if ((uint8_t)(tim5_flag_l | tim5_flag_h) != 0)
3807  000f 1a01          	or	a,(OFST-1,sp)
3808  0011 2702          	jreq	L5671
3809                     ; 1486     bitstatus = SET;
3811  0013 a601          	ld	a,#1
3813  0015               L5671:
3814                     ; 1490     bitstatus = RESET;
3816                     ; 1492   return ((FlagStatus)bitstatus);
3820  0015 5b04          	addw	sp,#4
3821  0017 81            	ret	
3856                     ; 1506 void TIM5_ClearFlag(TIM5_FLAG_TypeDef TIM5_FLAG)
3856                     ; 1507 {
3857                     .text:	section	.text,new
3858  0000               _TIM5_ClearFlag:
3860  0000 89            	pushw	x
3861       00000000      OFST:	set	0
3864                     ; 1509   assert_param(IS_TIM5_CLEAR_FLAG((uint16_t)TIM5_FLAG));
3866                     ; 1511   TIM5->SR1 = (uint8_t)(~(uint8_t)(TIM5_FLAG));
3868  0001 9f            	ld	a,xl
3869  0002 43            	cpl	a
3870  0003 c75306        	ld	21254,a
3871                     ; 1512   TIM5->SR2 = (uint8_t)(~(uint8_t)((uint16_t)TIM5_FLAG >> 8));
3873  0006 7b01          	ld	a,(OFST+1,sp)
3874  0008 43            	cpl	a
3875  0009 c75307        	ld	21255,a
3876                     ; 1513 }
3879  000c 85            	popw	x
3880  000d 81            	ret	
3940                     ; 1526 ITStatus TIM5_GetITStatus(TIM5_IT_TypeDef TIM5_IT)
3940                     ; 1527 {
3941                     .text:	section	.text,new
3942  0000               _TIM5_GetITStatus:
3944  0000 88            	push	a
3945  0001 89            	pushw	x
3946       00000002      OFST:	set	2
3949                     ; 1528   ITStatus bitstatus = RESET;
3951                     ; 1530   uint8_t TIM5_itStatus = 0x0, TIM5_itEnable = 0x0;
3955                     ; 1533   assert_param(IS_TIM5_GET_IT(TIM5_IT));
3957                     ; 1535   TIM5_itStatus = (uint8_t)(TIM5->SR1 & (uint8_t)TIM5_IT);
3959  0002 c45306        	and	a,21254
3960  0005 6b01          	ld	(OFST-1,sp),a
3961                     ; 1537   TIM5_itEnable = (uint8_t)(TIM5->IER & (uint8_t)TIM5_IT);
3963  0007 c65305        	ld	a,21253
3964  000a 1403          	and	a,(OFST+1,sp)
3965  000c 6b02          	ld	(OFST+0,sp),a
3966                     ; 1539   if ((TIM5_itStatus != (uint8_t)RESET ) && (TIM5_itEnable != (uint8_t)RESET))
3968  000e 7b01          	ld	a,(OFST-1,sp)
3969  0010 2708          	jreq	L5302
3971  0012 7b02          	ld	a,(OFST+0,sp)
3972  0014 2704          	jreq	L5302
3973                     ; 1541     bitstatus = (ITStatus)SET;
3975  0016 a601          	ld	a,#1
3977  0018 2001          	jra	L7302
3978  001a               L5302:
3979                     ; 1545     bitstatus = (ITStatus)RESET;
3981  001a 4f            	clr	a
3982  001b               L7302:
3983                     ; 1547   return ((ITStatus)bitstatus);
3987  001b 5b03          	addw	sp,#3
3988  001d 81            	ret	
4024                     ; 1561 void TIM5_ClearITPendingBit(TIM5_IT_TypeDef TIM5_IT)
4024                     ; 1562 {
4025                     .text:	section	.text,new
4026  0000               _TIM5_ClearITPendingBit:
4030                     ; 1564   assert_param(IS_TIM5_IT(TIM5_IT));
4032                     ; 1567   TIM5->SR1 = (uint8_t)(~(uint8_t)TIM5_IT);
4034  0000 43            	cpl	a
4035  0001 c75306        	ld	21254,a
4036                     ; 1568 }
4039  0004 81            	ret	
4112                     ; 1581 void TIM5_DMACmd( TIM5_DMASource_TypeDef TIM5_DMASource, FunctionalState NewState)
4112                     ; 1582 {
4113                     .text:	section	.text,new
4114  0000               _TIM5_DMACmd:
4116  0000 89            	pushw	x
4117       00000000      OFST:	set	0
4120                     ; 1584   assert_param(IS_FUNCTIONAL_STATE(NewState));
4122                     ; 1585   assert_param(IS_TIM5_DMA_SOURCE(TIM5_DMASource));
4124                     ; 1587   if (NewState != DISABLE)
4126  0001 9f            	ld	a,xl
4127  0002 4d            	tnz	a
4128  0003 2706          	jreq	L3112
4129                     ; 1590     TIM5->DER |= TIM5_DMASource;
4131  0005 9e            	ld	a,xh
4132  0006 ca5304        	or	a,21252
4134  0009 2006          	jra	L5112
4135  000b               L3112:
4136                     ; 1595     TIM5->DER &= (uint8_t)(~TIM5_DMASource);
4138  000b 7b01          	ld	a,(OFST+1,sp)
4139  000d 43            	cpl	a
4140  000e c45304        	and	a,21252
4141  0011               L5112:
4142  0011 c75304        	ld	21252,a
4143                     ; 1597 }
4146  0014 85            	popw	x
4147  0015 81            	ret	
4182                     ; 1605 void TIM5_SelectCCDMA(FunctionalState NewState)
4182                     ; 1606 {
4183                     .text:	section	.text,new
4184  0000               _TIM5_SelectCCDMA:
4188                     ; 1608   assert_param(IS_FUNCTIONAL_STATE(NewState));
4190                     ; 1610   if (NewState != DISABLE)
4192  0000 4d            	tnz	a
4193  0001 2705          	jreq	L5312
4194                     ; 1613     TIM5->CR2 |= TIM_CR2_CCDS;
4196  0003 72165301      	bset	21249,#3
4199  0007 81            	ret	
4200  0008               L5312:
4201                     ; 1618     TIM5->CR2 &= (uint8_t)(~TIM_CR2_CCDS);
4203  0008 72175301      	bres	21249,#3
4204                     ; 1620 }
4207  000c 81            	ret	
4231                     ; 1644 void TIM5_InternalClockConfig(void)
4231                     ; 1645 {
4232                     .text:	section	.text,new
4233  0000               _TIM5_InternalClockConfig:
4237                     ; 1647   TIM5->SMCR &=  (uint8_t)(~TIM_SMCR_SMS);
4239  0000 c65302        	ld	a,21250
4240  0003 a4f8          	and	a,#248
4241  0005 c75302        	ld	21250,a
4242                     ; 1648 }
4245  0008 81            	ret	
4332                     ; 1665 void TIM5_TIxExternalClockConfig(TIM5_TIxExternalCLK1Source_TypeDef TIM5_TIxExternalCLKSource,
4332                     ; 1666                                  TIM5_ICPolarity_TypeDef TIM5_ICPolarity,
4332                     ; 1667                                  uint8_t ICFilter)
4332                     ; 1668 {
4333                     .text:	section	.text,new
4334  0000               _TIM5_TIxExternalClockConfig:
4336  0000 89            	pushw	x
4337       00000000      OFST:	set	0
4340                     ; 1670   assert_param(IS_TIM5_TIXCLK_SOURCE(TIM5_TIxExternalCLKSource));
4342                     ; 1671   assert_param(IS_TIM5_IC_POLARITY(TIM5_ICPolarity));
4344                     ; 1672   assert_param(IS_TIM5_IC_FILTER(ICFilter));
4346                     ; 1675   if (TIM5_TIxExternalCLKSource == TIM5_TIxExternalCLK1Source_TI2)
4348  0001 9e            	ld	a,xh
4349  0002 a160          	cp	a,#96
4350  0004 260e          	jrne	L7022
4351                     ; 1677     TI2_Config(TIM5_ICPolarity, TIM5_ICSelection_DirectTI, ICFilter);
4353  0006 7b05          	ld	a,(OFST+5,sp)
4354  0008 88            	push	a
4355  0009 ae0001        	ldw	x,#1
4356  000c 7b03          	ld	a,(OFST+3,sp)
4357  000e 95            	ld	xh,a
4358  000f cd0000        	call	L5_TI2_Config
4361  0012 200c          	jra	L1122
4362  0014               L7022:
4363                     ; 1681     TI1_Config(TIM5_ICPolarity, TIM5_ICSelection_DirectTI, ICFilter);
4365  0014 7b05          	ld	a,(OFST+5,sp)
4366  0016 88            	push	a
4367  0017 ae0001        	ldw	x,#1
4368  001a 7b03          	ld	a,(OFST+3,sp)
4369  001c 95            	ld	xh,a
4370  001d cd0000        	call	L3_TI1_Config
4372  0020               L1122:
4373  0020 84            	pop	a
4374                     ; 1685   TIM5_SelectInputTrigger((TIM5_TRGSelection_TypeDef)TIM5_TIxExternalCLKSource);
4376  0021 7b01          	ld	a,(OFST+1,sp)
4377  0023 cd0000        	call	_TIM5_SelectInputTrigger
4379                     ; 1688   TIM5->SMCR |= (uint8_t)(TIM5_SlaveMode_External1);
4381  0026 c65302        	ld	a,21250
4382  0029 aa07          	or	a,#7
4383  002b c75302        	ld	21250,a
4384                     ; 1689 }
4387  002e 85            	popw	x
4388  002f 81            	ret	
4503                     ; 1707 void TIM5_ETRClockMode1Config(TIM5_ExtTRGPSC_TypeDef TIM5_ExtTRGPrescaler,
4503                     ; 1708                               TIM5_ExtTRGPolarity_TypeDef TIM5_ExtTRGPolarity,
4503                     ; 1709                               uint8_t ExtTRGFilter)
4503                     ; 1710 {
4504                     .text:	section	.text,new
4505  0000               _TIM5_ETRClockMode1Config:
4507  0000 89            	pushw	x
4508       00000000      OFST:	set	0
4511                     ; 1712   TIM5_ETRConfig(TIM5_ExtTRGPrescaler, TIM5_ExtTRGPolarity, ExtTRGFilter);
4513  0001 7b05          	ld	a,(OFST+5,sp)
4514  0003 88            	push	a
4515  0004 7b02          	ld	a,(OFST+2,sp)
4516  0006 95            	ld	xh,a
4517  0007 cd0000        	call	_TIM5_ETRConfig
4519  000a 84            	pop	a
4520                     ; 1715   TIM5->SMCR &= (uint8_t)(~TIM_SMCR_SMS);
4522  000b c65302        	ld	a,21250
4523  000e a4f8          	and	a,#248
4524  0010 c75302        	ld	21250,a
4525                     ; 1716   TIM5->SMCR |= (uint8_t)(TIM5_SlaveMode_External1);
4527  0013 c65302        	ld	a,21250
4528  0016 aa07          	or	a,#7
4529  0018 c75302        	ld	21250,a
4530                     ; 1719   TIM5->SMCR &= (uint8_t)(~TIM_SMCR_TS);
4532  001b c65302        	ld	a,21250
4533  001e a48f          	and	a,#143
4534  0020 c75302        	ld	21250,a
4535                     ; 1720   TIM5->SMCR |= (uint8_t)((TIM5_TRGSelection_TypeDef)TIM5_TRGSelection_ETRF);
4537  0023 c65302        	ld	a,21250
4538  0026 aa70          	or	a,#112
4539  0028 c75302        	ld	21250,a
4540                     ; 1721 }
4543  002b 85            	popw	x
4544  002c 81            	ret	
4600                     ; 1739 void TIM5_ETRClockMode2Config(TIM5_ExtTRGPSC_TypeDef TIM5_ExtTRGPrescaler,
4600                     ; 1740                               TIM5_ExtTRGPolarity_TypeDef TIM5_ExtTRGPolarity,
4600                     ; 1741                               uint8_t ExtTRGFilter)
4600                     ; 1742 {
4601                     .text:	section	.text,new
4602  0000               _TIM5_ETRClockMode2Config:
4604  0000 89            	pushw	x
4605       00000000      OFST:	set	0
4608                     ; 1744   TIM5_ETRConfig(TIM5_ExtTRGPrescaler, TIM5_ExtTRGPolarity, ExtTRGFilter);
4610  0001 7b05          	ld	a,(OFST+5,sp)
4611  0003 88            	push	a
4612  0004 7b02          	ld	a,(OFST+2,sp)
4613  0006 95            	ld	xh,a
4614  0007 cd0000        	call	_TIM5_ETRConfig
4616  000a 721c5303      	bset	21251,#6
4617  000e 84            	pop	a
4618                     ; 1747   TIM5->ETR |= TIM_ETR_ECE ;
4620                     ; 1748 }
4623  000f 85            	popw	x
4624  0010 81            	ret	
4738                     ; 1799 void TIM5_SelectInputTrigger(TIM5_TRGSelection_TypeDef TIM5_InputTriggerSource)
4738                     ; 1800 {
4739                     .text:	section	.text,new
4740  0000               _TIM5_SelectInputTrigger:
4742  0000 88            	push	a
4743  0001 88            	push	a
4744       00000001      OFST:	set	1
4747                     ; 1801   uint8_t tmpsmcr = 0;
4749                     ; 1804   assert_param(IS_TIM5_TRIGGER_SELECTION(TIM5_InputTriggerSource));
4751                     ; 1806   tmpsmcr = TIM5->SMCR;
4753  0002 c65302        	ld	a,21250
4754                     ; 1809   tmpsmcr &= (uint8_t)(~TIM_SMCR_TS);
4756  0005 a48f          	and	a,#143
4757                     ; 1810   tmpsmcr |= (uint8_t)TIM5_InputTriggerSource;
4759  0007 1a02          	or	a,(OFST+1,sp)
4760                     ; 1812   TIM5->SMCR = (uint8_t)tmpsmcr;
4762  0009 c75302        	ld	21250,a
4763                     ; 1813 }
4766  000c 85            	popw	x
4767  000d 81            	ret	
4864                     ; 1827 void TIM5_SelectOutputTrigger(TIM5_TRGOSource_TypeDef TIM5_TRGOSource)
4864                     ; 1828 {
4865                     .text:	section	.text,new
4866  0000               _TIM5_SelectOutputTrigger:
4868  0000 88            	push	a
4869  0001 88            	push	a
4870       00000001      OFST:	set	1
4873                     ; 1829   uint8_t tmpcr2 = 0;
4875                     ; 1832   assert_param(IS_TIM5_TRGO_SOURCE(TIM5_TRGOSource));
4877                     ; 1834   tmpcr2 = TIM5->CR2;
4879  0002 c65301        	ld	a,21249
4880                     ; 1837   tmpcr2 &= (uint8_t)(~TIM_CR2_MMS);
4882  0005 a48f          	and	a,#143
4883                     ; 1840   tmpcr2 |=  (uint8_t)TIM5_TRGOSource;
4885  0007 1a02          	or	a,(OFST+1,sp)
4886                     ; 1842   TIM5->CR2 = tmpcr2;
4888  0009 c75301        	ld	21249,a
4889                     ; 1843 }
4892  000c 85            	popw	x
4893  000d 81            	ret	
4974                     ; 1855 void TIM5_SelectSlaveMode(TIM5_SlaveMode_TypeDef TIM5_SlaveMode)
4974                     ; 1856 {
4975                     .text:	section	.text,new
4976  0000               _TIM5_SelectSlaveMode:
4978  0000 88            	push	a
4979  0001 88            	push	a
4980       00000001      OFST:	set	1
4983                     ; 1857   uint8_t tmpsmcr = 0;
4985                     ; 1860   assert_param(IS_TIM5_SLAVE_MODE(TIM5_SlaveMode));
4987                     ; 1862   tmpsmcr = TIM5->SMCR;
4989  0002 c65302        	ld	a,21250
4990                     ; 1865   tmpsmcr &= (uint8_t)(~TIM_SMCR_SMS);
4992  0005 a4f8          	and	a,#248
4993                     ; 1868   tmpsmcr |= (uint8_t)TIM5_SlaveMode;
4995  0007 1a02          	or	a,(OFST+1,sp)
4996                     ; 1870   TIM5->SMCR = tmpsmcr;
4998  0009 c75302        	ld	21250,a
4999                     ; 1871 }
5002  000c 85            	popw	x
5003  000d 81            	ret	
5039                     ; 1879 void TIM5_SelectMasterSlaveMode(FunctionalState NewState)
5039                     ; 1880 {
5040                     .text:	section	.text,new
5041  0000               _TIM5_SelectMasterSlaveMode:
5045                     ; 1882   assert_param(IS_FUNCTIONAL_STATE(NewState));
5047                     ; 1885   if (NewState != DISABLE)
5049  0000 4d            	tnz	a
5050  0001 2705          	jreq	L5642
5051                     ; 1887     TIM5->SMCR |= TIM_SMCR_MSM;
5053  0003 721e5302      	bset	21250,#7
5056  0007 81            	ret	
5057  0008               L5642:
5058                     ; 1891     TIM5->SMCR &= (uint8_t)(~TIM_SMCR_MSM);
5060  0008 721f5302      	bres	21250,#7
5061                     ; 1893 }
5064  000c 81            	ret	
5118                     ; 1911 void TIM5_ETRConfig(TIM5_ExtTRGPSC_TypeDef TIM5_ExtTRGPrescaler,
5118                     ; 1912                     TIM5_ExtTRGPolarity_TypeDef TIM5_ExtTRGPolarity,
5118                     ; 1913                     uint8_t ExtTRGFilter)
5118                     ; 1914 {
5119                     .text:	section	.text,new
5120  0000               _TIM5_ETRConfig:
5122  0000 89            	pushw	x
5123       00000000      OFST:	set	0
5126                     ; 1916   assert_param(IS_TIM5_EXT_PRESCALER(TIM5_ExtTRGPrescaler));
5128                     ; 1917   assert_param(IS_TIM5_EXT_POLARITY(TIM5_ExtTRGPolarity));
5130                     ; 1918   assert_param(IS_TIM5_EXT_FILTER(ExtTRGFilter));
5132                     ; 1921   TIM5->ETR |= (uint8_t)((uint8_t)((uint8_t)TIM5_ExtTRGPrescaler | (uint8_t)TIM5_ExtTRGPolarity)
5132                     ; 1922                          | (uint8_t)ExtTRGFilter);
5134  0001 9f            	ld	a,xl
5135  0002 1a01          	or	a,(OFST+1,sp)
5136  0004 1a05          	or	a,(OFST+5,sp)
5137  0006 ca5303        	or	a,21251
5138  0009 c75303        	ld	21251,a
5139                     ; 1923 }
5142  000c 85            	popw	x
5143  000d 81            	ret	
5250                     ; 1958 void TIM5_EncoderInterfaceConfig(TIM5_EncoderMode_TypeDef TIM5_EncoderMode,
5250                     ; 1959                                  TIM5_ICPolarity_TypeDef TIM5_IC1Polarity,
5250                     ; 1960                                  TIM5_ICPolarity_TypeDef TIM5_IC2Polarity)
5250                     ; 1961 {
5251                     .text:	section	.text,new
5252  0000               _TIM5_EncoderInterfaceConfig:
5254  0000 89            	pushw	x
5255  0001 5203          	subw	sp,#3
5256       00000003      OFST:	set	3
5259                     ; 1962   uint8_t tmpsmcr = 0;
5261                     ; 1963   uint8_t tmpccmr1 = 0;
5263                     ; 1964   uint8_t tmpccmr2 = 0;
5265                     ; 1967   assert_param(IS_TIM5_ENCODER_MODE(TIM5_EncoderMode));
5267                     ; 1968   assert_param(IS_TIM5_IC_POLARITY(TIM5_IC1Polarity));
5269                     ; 1969   assert_param(IS_TIM5_IC_POLARITY(TIM5_IC2Polarity));
5271                     ; 1971   tmpsmcr = TIM5->SMCR;
5273  0003 c65302        	ld	a,21250
5274  0006 6b01          	ld	(OFST-2,sp),a
5275                     ; 1972   tmpccmr1 = TIM5->CCMR1;
5277  0008 c65309        	ld	a,21257
5278  000b 6b02          	ld	(OFST-1,sp),a
5279                     ; 1973   tmpccmr2 = TIM5->CCMR2;
5281  000d c6530a        	ld	a,21258
5282  0010 6b03          	ld	(OFST+0,sp),a
5283                     ; 1976   tmpsmcr &= (uint8_t)(TIM_SMCR_MSM | TIM_SMCR_TS)  ;
5285  0012 7b01          	ld	a,(OFST-2,sp)
5286  0014 a4f0          	and	a,#240
5287  0016 6b01          	ld	(OFST-2,sp),a
5288                     ; 1977   tmpsmcr |= (uint8_t)TIM5_EncoderMode;
5290  0018 9e            	ld	a,xh
5291  0019 1a01          	or	a,(OFST-2,sp)
5292  001b 6b01          	ld	(OFST-2,sp),a
5293                     ; 1980   tmpccmr1 &= (uint8_t)(~TIM_CCMR_CCxS);
5295  001d 7b02          	ld	a,(OFST-1,sp)
5296  001f a4fc          	and	a,#252
5297  0021 6b02          	ld	(OFST-1,sp),a
5298                     ; 1981   tmpccmr2 &= (uint8_t)(~TIM_CCMR_CCxS);
5300  0023 7b03          	ld	a,(OFST+0,sp)
5301  0025 a4fc          	and	a,#252
5302  0027 6b03          	ld	(OFST+0,sp),a
5303                     ; 1982   tmpccmr1 |= TIM_CCMR_TIxDirect_Set;
5305  0029 7b02          	ld	a,(OFST-1,sp)
5306  002b aa01          	or	a,#1
5307  002d 6b02          	ld	(OFST-1,sp),a
5308                     ; 1983   tmpccmr2 |= TIM_CCMR_TIxDirect_Set;
5310  002f 7b03          	ld	a,(OFST+0,sp)
5311  0031 aa01          	or	a,#1
5312  0033 6b03          	ld	(OFST+0,sp),a
5313                     ; 1986   if (TIM5_IC1Polarity == TIM5_ICPolarity_Falling)
5315  0035 9f            	ld	a,xl
5316  0036 4a            	dec	a
5317  0037 2606          	jrne	L3652
5318                     ; 1988     TIM5->CCER1 |= TIM_CCER1_CC1P ;
5320  0039 7212530b      	bset	21259,#1
5322  003d 2004          	jra	L5652
5323  003f               L3652:
5324                     ; 1992     TIM5->CCER1 &= (uint8_t)(~TIM_CCER1_CC1P) ;
5326  003f 7213530b      	bres	21259,#1
5327  0043               L5652:
5328                     ; 1995   if (TIM5_IC2Polarity == TIM5_ICPolarity_Falling)
5330  0043 7b08          	ld	a,(OFST+5,sp)
5331  0045 4a            	dec	a
5332  0046 2606          	jrne	L7652
5333                     ; 1997     TIM5->CCER1 |= TIM_CCER1_CC2P ;
5335  0048 721a530b      	bset	21259,#5
5337  004c 2004          	jra	L1752
5338  004e               L7652:
5339                     ; 2001     TIM5->CCER1 &= (uint8_t)(~TIM_CCER1_CC2P) ;
5341  004e 721b530b      	bres	21259,#5
5342  0052               L1752:
5343                     ; 2004   TIM5->SMCR = tmpsmcr;
5345  0052 7b01          	ld	a,(OFST-2,sp)
5346  0054 c75302        	ld	21250,a
5347                     ; 2005   TIM5->CCMR1 = tmpccmr1;
5349  0057 7b02          	ld	a,(OFST-1,sp)
5350  0059 c75309        	ld	21257,a
5351                     ; 2006   TIM5->CCMR2 = tmpccmr2;
5353  005c 7b03          	ld	a,(OFST+0,sp)
5354  005e c7530a        	ld	21258,a
5355                     ; 2007 }
5358  0061 5b05          	addw	sp,#5
5359  0063 81            	ret	
5395                     ; 2015 void TIM5_SelectHallSensor(FunctionalState NewState)
5395                     ; 2016 {
5396                     .text:	section	.text,new
5397  0000               _TIM5_SelectHallSensor:
5401                     ; 2018   assert_param(IS_FUNCTIONAL_STATE(NewState));
5403                     ; 2021   if (NewState != DISABLE)
5405  0000 4d            	tnz	a
5406  0001 2705          	jreq	L1162
5407                     ; 2023     TIM5->CR2 |= TIM_CR2_TI1S;
5409  0003 721e5301      	bset	21249,#7
5412  0007 81            	ret	
5413  0008               L1162:
5414                     ; 2027     TIM5->CR2 &= (uint8_t)(~TIM_CR2_TI1S);
5416  0008 721f5301      	bres	21249,#7
5417                     ; 2029 }
5420  000c 81            	ret	
5486                     ; 2050 static void TI1_Config(TIM5_ICPolarity_TypeDef TIM5_ICPolarity, \
5486                     ; 2051                        TIM5_ICSelection_TypeDef TIM5_ICSelection, \
5486                     ; 2052                        uint8_t TIM5_ICFilter)
5486                     ; 2053 {
5487                     .text:	section	.text,new
5488  0000               L3_TI1_Config:
5490  0000 89            	pushw	x
5491  0001 89            	pushw	x
5492       00000002      OFST:	set	2
5495                     ; 2054   uint8_t tmpccmr1 = 0;
5497                     ; 2055   uint8_t tmpicpolarity = TIM5_ICPolarity;
5499  0002 9e            	ld	a,xh
5500  0003 6b01          	ld	(OFST-1,sp),a
5501                     ; 2056   tmpccmr1 = TIM5->CCMR1;
5503  0005 c65309        	ld	a,21257
5504  0008 6b02          	ld	(OFST+0,sp),a
5505                     ; 2059   assert_param(IS_TIM5_IC_POLARITY(TIM5_ICPolarity));
5507                     ; 2060   assert_param(IS_TIM5_IC_SELECTION(TIM5_ICSelection));
5509                     ; 2061   assert_param(IS_TIM5_IC_FILTER(TIM5_ICFilter));
5511                     ; 2064   TIM5->CCER1 &=  (uint8_t)(~TIM_CCER1_CC1E);
5513                     ; 2067   tmpccmr1 &= (uint8_t)(~TIM_CCMR_CCxS) & (uint8_t)(~TIM_CCMR_ICxF);
5515  000a a40c          	and	a,#12
5516  000c 7211530b      	bres	21259,#0
5517  0010 6b02          	ld	(OFST+0,sp),a
5518                     ; 2068   tmpccmr1 |= (uint8_t)(((uint8_t)(TIM5_ICSelection)) | ((uint8_t)(TIM5_ICFilter << 4)));
5520  0012 7b07          	ld	a,(OFST+5,sp)
5521  0014 97            	ld	xl,a
5522  0015 a610          	ld	a,#16
5523  0017 42            	mul	x,a
5524  0018 9f            	ld	a,xl
5525  0019 1a04          	or	a,(OFST+2,sp)
5526  001b 1a02          	or	a,(OFST+0,sp)
5527  001d 6b02          	ld	(OFST+0,sp),a
5528                     ; 2070   TIM5->CCMR1 = tmpccmr1;
5530  001f c75309        	ld	21257,a
5531                     ; 2073   if (tmpicpolarity == (uint8_t)(TIM5_ICPolarity_Falling))
5533  0022 7b01          	ld	a,(OFST-1,sp)
5534  0024 4a            	dec	a
5535  0025 2606          	jrne	L5462
5536                     ; 2075     TIM5->CCER1 |= TIM_CCER1_CC1P;
5538  0027 7212530b      	bset	21259,#1
5540  002b 2004          	jra	L7462
5541  002d               L5462:
5542                     ; 2079     TIM5->CCER1 &= (uint8_t)(~TIM_CCER1_CC1P);
5544  002d 7213530b      	bres	21259,#1
5545  0031               L7462:
5546                     ; 2083   TIM5->CCER1 |=  TIM_CCER1_CC1E;
5548  0031 7210530b      	bset	21259,#0
5549                     ; 2084 }
5552  0035 5b04          	addw	sp,#4
5553  0037 81            	ret	
5619                     ; 2101 static void TI2_Config(TIM5_ICPolarity_TypeDef TIM5_ICPolarity,
5619                     ; 2102                        TIM5_ICSelection_TypeDef TIM5_ICSelection,
5619                     ; 2103                        uint8_t TIM5_ICFilter)
5619                     ; 2104 {
5620                     .text:	section	.text,new
5621  0000               L5_TI2_Config:
5623  0000 89            	pushw	x
5624  0001 89            	pushw	x
5625       00000002      OFST:	set	2
5628                     ; 2105   uint8_t tmpccmr2 = 0;
5630                     ; 2106   uint8_t tmpicpolarity = TIM5_ICPolarity;
5632  0002 9e            	ld	a,xh
5633  0003 6b01          	ld	(OFST-1,sp),a
5634                     ; 2109   assert_param(IS_TIM5_IC_POLARITY(TIM5_ICPolarity));
5636                     ; 2110   assert_param(IS_TIM5_IC_SELECTION(TIM5_ICSelection));
5638                     ; 2111   assert_param(IS_TIM5_IC_FILTER(TIM5_ICFilter));
5640                     ; 2113   tmpccmr2 = TIM5->CCMR2;
5642  0005 c6530a        	ld	a,21258
5643  0008 6b02          	ld	(OFST+0,sp),a
5644                     ; 2116   TIM5->CCER1 &=  (uint8_t)(~TIM_CCER1_CC2E);
5646                     ; 2119   tmpccmr2 &= (uint8_t)(~TIM_CCMR_CCxS) & (uint8_t)(~TIM_CCMR_ICxF);
5648  000a a40c          	and	a,#12
5649  000c 7219530b      	bres	21259,#4
5650  0010 6b02          	ld	(OFST+0,sp),a
5651                     ; 2120   tmpccmr2 |= (uint8_t)(((uint8_t)(TIM5_ICSelection)) | ((uint8_t)(TIM5_ICFilter << 4)));
5653  0012 7b07          	ld	a,(OFST+5,sp)
5654  0014 97            	ld	xl,a
5655  0015 a610          	ld	a,#16
5656  0017 42            	mul	x,a
5657  0018 9f            	ld	a,xl
5658  0019 1a04          	or	a,(OFST+2,sp)
5659  001b 1a02          	or	a,(OFST+0,sp)
5660  001d 6b02          	ld	(OFST+0,sp),a
5661                     ; 2122   TIM5->CCMR2 = tmpccmr2;
5663  001f c7530a        	ld	21258,a
5664                     ; 2125   if (tmpicpolarity == TIM5_ICPolarity_Falling)
5666  0022 7b01          	ld	a,(OFST-1,sp)
5667  0024 4a            	dec	a
5668  0025 2606          	jrne	L1072
5669                     ; 2127     TIM5->CCER1 |= TIM_CCER1_CC2P ;
5671  0027 721a530b      	bset	21259,#5
5673  002b 2004          	jra	L3072
5674  002d               L1072:
5675                     ; 2131     TIM5->CCER1 &= (uint8_t)(~TIM_CCER1_CC2P) ;
5677  002d 721b530b      	bres	21259,#5
5678  0031               L3072:
5679                     ; 2135   TIM5->CCER1 |=  TIM_CCER1_CC2E;
5681  0031 7218530b      	bset	21259,#4
5682                     ; 2136 }
5685  0035 5b04          	addw	sp,#4
5686  0037 81            	ret	
5699                     	xdef	_TIM5_SelectHallSensor
5700                     	xdef	_TIM5_EncoderInterfaceConfig
5701                     	xdef	_TIM5_ETRConfig
5702                     	xdef	_TIM5_SelectMasterSlaveMode
5703                     	xdef	_TIM5_SelectSlaveMode
5704                     	xdef	_TIM5_SelectOutputTrigger
5705                     	xdef	_TIM5_SelectInputTrigger
5706                     	xdef	_TIM5_ETRClockMode2Config
5707                     	xdef	_TIM5_ETRClockMode1Config
5708                     	xdef	_TIM5_TIxExternalClockConfig
5709                     	xdef	_TIM5_InternalClockConfig
5710                     	xdef	_TIM5_SelectCCDMA
5711                     	xdef	_TIM5_DMACmd
5712                     	xdef	_TIM5_ClearITPendingBit
5713                     	xdef	_TIM5_GetITStatus
5714                     	xdef	_TIM5_ClearFlag
5715                     	xdef	_TIM5_GetFlagStatus
5716                     	xdef	_TIM5_GenerateEvent
5717                     	xdef	_TIM5_ITConfig
5718                     	xdef	_TIM5_SetIC2Prescaler
5719                     	xdef	_TIM5_SetIC1Prescaler
5720                     	xdef	_TIM5_GetCapture2
5721                     	xdef	_TIM5_GetCapture1
5722                     	xdef	_TIM5_PWMIConfig
5723                     	xdef	_TIM5_ICInit
5724                     	xdef	_TIM5_CCxCmd
5725                     	xdef	_TIM5_OC2PolarityConfig
5726                     	xdef	_TIM5_OC1PolarityConfig
5727                     	xdef	_TIM5_OC2FastConfig
5728                     	xdef	_TIM5_OC1FastConfig
5729                     	xdef	_TIM5_OC2PreloadConfig
5730                     	xdef	_TIM5_OC1PreloadConfig
5731                     	xdef	_TIM5_ForcedOC2Config
5732                     	xdef	_TIM5_ForcedOC1Config
5733                     	xdef	_TIM5_SetCompare2
5734                     	xdef	_TIM5_SetCompare1
5735                     	xdef	_TIM5_SelectOCxM
5736                     	xdef	_TIM5_CtrlPWMOutputs
5737                     	xdef	_TIM5_BKRConfig
5738                     	xdef	_TIM5_OC2Init
5739                     	xdef	_TIM5_OC1Init
5740                     	xdef	_TIM5_Cmd
5741                     	xdef	_TIM5_SelectOnePulseMode
5742                     	xdef	_TIM5_ARRPreloadConfig
5743                     	xdef	_TIM5_UpdateRequestConfig
5744                     	xdef	_TIM5_UpdateDisableConfig
5745                     	xdef	_TIM5_GetPrescaler
5746                     	xdef	_TIM5_GetCounter
5747                     	xdef	_TIM5_SetAutoreload
5748                     	xdef	_TIM5_SetCounter
5749                     	xdef	_TIM5_CounterModeConfig
5750                     	xdef	_TIM5_PrescalerConfig
5751                     	xdef	_TIM5_TimeBaseInit
5752                     	xdef	_TIM5_DeInit
5771                     	end
