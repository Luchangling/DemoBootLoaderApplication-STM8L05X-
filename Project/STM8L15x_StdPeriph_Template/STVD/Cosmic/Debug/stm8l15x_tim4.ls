   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.8.32 - 23 Mar 2010
   3                     ; Generator V4.3.4 - 23 Mar 2010
   4                     ; Optimizer V4.3.3 - 10 Feb 2010
  50                     ; 130 void TIM4_DeInit(void)
  50                     ; 131 {
  52                     .text:	section	.text,new
  53  0000               _TIM4_DeInit:
  57                     ; 132   TIM4->CR1   = TIM4_CR1_RESET_VALUE;
  59  0000 725f52e0      	clr	21216
  60                     ; 133   TIM4->CR2   = TIM4_CR2_RESET_VALUE;
  62  0004 725f52e1      	clr	21217
  63                     ; 134   TIM4->SMCR   = TIM4_SMCR_RESET_VALUE;
  65  0008 725f52e2      	clr	21218
  66                     ; 135   TIM4->IER   = TIM4_IER_RESET_VALUE;
  68  000c 725f52e4      	clr	21220
  69                     ; 136   TIM4->CNTR   = TIM4_CNTR_RESET_VALUE;
  71  0010 725f52e7      	clr	21223
  72                     ; 137   TIM4->PSCR  = TIM4_PSCR_RESET_VALUE;
  74  0014 725f52e8      	clr	21224
  75                     ; 138   TIM4->ARR   = TIM4_ARR_RESET_VALUE;
  77  0018 35ff52e9      	mov	21225,#255
  78                     ; 139   TIM4->SR1   = TIM4_SR1_RESET_VALUE;
  80  001c 725f52e5      	clr	21221
  81                     ; 140 }
  84  0020 81            	ret	
 250                     ; 165 void TIM4_TimeBaseInit(TIM4_Prescaler_TypeDef TIM4_Prescaler,
 250                     ; 166                        uint8_t TIM4_Period)
 250                     ; 167 {
 251                     .text:	section	.text,new
 252  0000               _TIM4_TimeBaseInit:
 256                     ; 169   assert_param(IS_TIM4_Prescaler(TIM4_Prescaler));
 258                     ; 171   TIM4->ARR = (uint8_t)(TIM4_Period);
 260  0000 9f            	ld	a,xl
 261  0001 c752e9        	ld	21225,a
 262                     ; 173   TIM4->PSCR = (uint8_t)(TIM4_Prescaler);
 264  0004 9e            	ld	a,xh
 265  0005 c752e8        	ld	21224,a
 266                     ; 176   TIM4->EGR = TIM4_EventSource_Update;
 268  0008 350152e6      	mov	21222,#1
 269                     ; 177 }
 272  000c 81            	ret	
 340                     ; 205 void TIM4_PrescalerConfig(TIM4_Prescaler_TypeDef Prescaler,
 340                     ; 206                           TIM4_PSCReloadMode_TypeDef TIM4_PSCReloadMode)
 340                     ; 207 {
 341                     .text:	section	.text,new
 342  0000               _TIM4_PrescalerConfig:
 346                     ; 209   assert_param(IS_TIM4_Prescaler_RELOAD(TIM4_PSCReloadMode));
 348                     ; 210   assert_param(IS_TIM4_Prescaler(Prescaler));
 350                     ; 213   TIM4->PSCR = (uint8_t) Prescaler;
 352  0000 9e            	ld	a,xh
 353  0001 c752e8        	ld	21224,a
 354                     ; 216   if (TIM4_PSCReloadMode == TIM4_PSCReloadMode_Immediate)
 356  0004 9f            	ld	a,xl
 357  0005 4a            	dec	a
 358  0006 2605          	jrne	L731
 359                     ; 218     TIM4->EGR |= TIM4_EGR_UG ;
 361  0008 721052e6      	bset	21222,#0
 364  000c 81            	ret	
 365  000d               L731:
 366                     ; 222     TIM4->EGR &= (uint8_t)(~TIM4_EGR_UG) ;
 368  000d 721152e6      	bres	21222,#0
 369                     ; 224 }
 372  0011 81            	ret	
 404                     ; 232 void TIM4_SetCounter(uint8_t Counter)
 404                     ; 233 {
 405                     .text:	section	.text,new
 406  0000               _TIM4_SetCounter:
 410                     ; 235   TIM4->CNTR = (uint8_t)(Counter);
 412  0000 c752e7        	ld	21223,a
 413                     ; 236 }
 416  0003 81            	ret	
 448                     ; 244 void TIM4_SetAutoreload(uint8_t Autoreload)
 448                     ; 245 {
 449                     .text:	section	.text,new
 450  0000               _TIM4_SetAutoreload:
 454                     ; 247   TIM4->ARR = (uint8_t)(Autoreload);
 456  0000 c752e9        	ld	21225,a
 457                     ; 248 }
 460  0003 81            	ret	
 492                     ; 255 uint8_t TIM4_GetCounter(void)
 492                     ; 256 {
 493                     .text:	section	.text,new
 494  0000               _TIM4_GetCounter:
 496  0000 88            	push	a
 497       00000001      OFST:	set	1
 500                     ; 257   uint8_t tmpcntr = 0;
 502                     ; 258   tmpcntr = TIM4->CNTR;
 504  0001 c652e7        	ld	a,21223
 505                     ; 260   return ((uint8_t)tmpcntr);
 509  0004 5b01          	addw	sp,#1
 510  0006 81            	ret	
 534                     ; 284 TIM4_Prescaler_TypeDef TIM4_GetPrescaler(void)
 534                     ; 285 {
 535                     .text:	section	.text,new
 536  0000               _TIM4_GetPrescaler:
 540                     ; 287   return ((TIM4_Prescaler_TypeDef)TIM4->PSCR);
 542  0000 c652e8        	ld	a,21224
 545  0003 81            	ret	
 601                     ; 296 void TIM4_UpdateDisableConfig(FunctionalState NewState)
 601                     ; 297 {
 602                     .text:	section	.text,new
 603  0000               _TIM4_UpdateDisableConfig:
 607                     ; 299   assert_param(IS_FUNCTIONAL_STATE(NewState));
 609                     ; 302   if (NewState != DISABLE)
 611  0000 4d            	tnz	a
 612  0001 2705          	jreq	L542
 613                     ; 304     TIM4->CR1 |= TIM4_CR1_UDIS ;
 615  0003 721252e0      	bset	21216,#1
 618  0007 81            	ret	
 619  0008               L542:
 620                     ; 308     TIM4->CR1 &= (uint8_t)(~TIM4_CR1_UDIS) ;
 622  0008 721352e0      	bres	21216,#1
 623                     ; 310 }
 626  000c 81            	ret	
 684                     ; 320 void TIM4_UpdateRequestConfig(TIM4_UpdateSource_TypeDef TIM4_UpdateSource)
 684                     ; 321 {
 685                     .text:	section	.text,new
 686  0000               _TIM4_UpdateRequestConfig:
 690                     ; 323   assert_param(IS_TIM4_UPDATE_SOURCE(TIM4_UpdateSource));
 692                     ; 326   if (TIM4_UpdateSource == TIM4_UpdateSource_Regular)
 694  0000 4a            	dec	a
 695  0001 2605          	jrne	L772
 696                     ; 328     TIM4->CR1 |= TIM4_CR1_URS ;
 698  0003 721452e0      	bset	21216,#2
 701  0007 81            	ret	
 702  0008               L772:
 703                     ; 332     TIM4->CR1 &= (uint8_t)(~TIM4_CR1_URS) ;
 705  0008 721552e0      	bres	21216,#2
 706                     ; 334 }
 709  000c 81            	ret	
 745                     ; 342 void TIM4_ARRPreloadConfig(FunctionalState NewState)
 745                     ; 343 {
 746                     .text:	section	.text,new
 747  0000               _TIM4_ARRPreloadConfig:
 751                     ; 345   assert_param(IS_FUNCTIONAL_STATE(NewState));
 753                     ; 348   if (NewState != DISABLE)
 755  0000 4d            	tnz	a
 756  0001 2705          	jreq	L123
 757                     ; 350     TIM4->CR1 |= TIM4_CR1_ARPE ;
 759  0003 721e52e0      	bset	21216,#7
 762  0007 81            	ret	
 763  0008               L123:
 764                     ; 354     TIM4->CR1 &= (uint8_t)(~TIM4_CR1_ARPE) ;
 766  0008 721f52e0      	bres	21216,#7
 767                     ; 356 }
 770  000c 81            	ret	
 827                     ; 366 void TIM4_SelectOnePulseMode(TIM4_OPMode_TypeDef TIM4_OPMode)
 827                     ; 367 {
 828                     .text:	section	.text,new
 829  0000               _TIM4_SelectOnePulseMode:
 833                     ; 369   assert_param(IS_TIM4_OPM_MODE(TIM4_OPMode));
 835                     ; 372   if (TIM4_OPMode == TIM4_OPMode_Single)
 837  0000 4a            	dec	a
 838  0001 2605          	jrne	L353
 839                     ; 374     TIM4->CR1 |= TIM4_CR1_OPM ;
 841  0003 721652e0      	bset	21216,#3
 844  0007 81            	ret	
 845  0008               L353:
 846                     ; 378     TIM4->CR1 &= (uint8_t)(~TIM4_CR1_OPM) ;
 848  0008 721752e0      	bres	21216,#3
 849                     ; 380 }
 852  000c 81            	ret	
 887                     ; 388 void TIM4_Cmd(FunctionalState NewState)
 887                     ; 389 {
 888                     .text:	section	.text,new
 889  0000               _TIM4_Cmd:
 893                     ; 391   assert_param(IS_FUNCTIONAL_STATE(NewState));
 895                     ; 394   if (NewState != DISABLE)
 897  0000 4d            	tnz	a
 898  0001 2705          	jreq	L573
 899                     ; 396     TIM4->CR1 |= TIM4_CR1_CEN ;
 901  0003 721052e0      	bset	21216,#0
 904  0007 81            	ret	
 905  0008               L573:
 906                     ; 400     TIM4->CR1 &= (uint8_t)(~TIM4_CR1_CEN) ;
 908  0008 721152e0      	bres	21216,#0
 909                     ; 402 }
 912  000c 81            	ret	
 977                     ; 430 void TIM4_ITConfig(TIM4_IT_TypeDef TIM4_IT, FunctionalState NewState)
 977                     ; 431 {
 978                     .text:	section	.text,new
 979  0000               _TIM4_ITConfig:
 981  0000 89            	pushw	x
 982       00000000      OFST:	set	0
 985                     ; 433   assert_param(IS_TIM4_IT(TIM4_IT));
 987                     ; 434   assert_param(IS_FUNCTIONAL_STATE(NewState));
 989                     ; 436   if (NewState != DISABLE)
 991  0001 9f            	ld	a,xl
 992  0002 4d            	tnz	a
 993  0003 2706          	jreq	L334
 994                     ; 439     TIM4->IER |= (uint8_t)TIM4_IT;
 996  0005 9e            	ld	a,xh
 997  0006 ca52e4        	or	a,21220
 999  0009 2006          	jra	L534
1000  000b               L334:
1001                     ; 444     TIM4->IER &= (uint8_t)(~(uint8_t)TIM4_IT);
1003  000b 7b01          	ld	a,(OFST+1,sp)
1004  000d 43            	cpl	a
1005  000e c452e4        	and	a,21220
1006  0011               L534:
1007  0011 c752e4        	ld	21220,a
1008                     ; 446 }
1011  0014 85            	popw	x
1012  0015 81            	ret	
1069                     ; 456 void TIM4_GenerateEvent(TIM4_EventSource_TypeDef TIM4_EventSource)
1069                     ; 457 {
1070                     .text:	section	.text,new
1071  0000               _TIM4_GenerateEvent:
1075                     ; 459   assert_param(IS_TIM4_EVENT_SOURCE((uint8_t)TIM4_EventSource));
1077                     ; 462   TIM4->EGR |= (uint8_t)TIM4_EventSource;
1079  0000 ca52e6        	or	a,21222
1080  0003 c752e6        	ld	21222,a
1081                     ; 463 }
1084  0006 81            	ret	
1170                     ; 474 FlagStatus TIM4_GetFlagStatus(TIM4_FLAG_TypeDef TIM4_FLAG)
1170                     ; 475 {
1171                     .text:	section	.text,new
1172  0000               _TIM4_GetFlagStatus:
1174  0000 88            	push	a
1175       00000001      OFST:	set	1
1178                     ; 476   FlagStatus bitstatus = RESET;
1180                     ; 479   assert_param(IS_TIM4_GET_FLAG(TIM4_FLAG));
1182                     ; 481   if ((TIM4->SR1 & (uint8_t)TIM4_FLAG)  != 0)
1184  0001 c452e5        	and	a,21221
1185  0004 2702          	jreq	L725
1186                     ; 483     bitstatus = SET;
1188  0006 a601          	ld	a,#1
1190  0008               L725:
1191                     ; 487     bitstatus = RESET;
1193                     ; 489   return ((FlagStatus)bitstatus);
1197  0008 5b01          	addw	sp,#1
1198  000a 81            	ret	
1233                     ; 500 void TIM4_ClearFlag(TIM4_FLAG_TypeDef TIM4_FLAG)
1233                     ; 501 {
1234                     .text:	section	.text,new
1235  0000               _TIM4_ClearFlag:
1239                     ; 503   assert_param(IS_TIM4_CLEAR_FLAG((uint8_t)TIM4_FLAG));
1241                     ; 505   TIM4->SR1 = (uint8_t)(~((uint8_t)TIM4_FLAG));
1243  0000 43            	cpl	a
1244  0001 c752e5        	ld	21221,a
1245                     ; 506 }
1248  0004 81            	ret	
1308                     ; 518 ITStatus TIM4_GetITStatus(TIM4_IT_TypeDef TIM4_IT)
1308                     ; 519 {
1309                     .text:	section	.text,new
1310  0000               _TIM4_GetITStatus:
1312  0000 88            	push	a
1313  0001 89            	pushw	x
1314       00000002      OFST:	set	2
1317                     ; 520   ITStatus bitstatus = RESET;
1319                     ; 522   uint8_t itStatus = 0x0, itEnable = 0x0;
1323                     ; 525   assert_param(IS_TIM4_GET_IT(TIM4_IT));
1325                     ; 527   itStatus = (uint8_t)(TIM4->SR1 & (uint8_t)TIM4_IT);
1327  0002 c452e5        	and	a,21221
1328  0005 6b01          	ld	(OFST-1,sp),a
1329                     ; 529   itEnable = (uint8_t)(TIM4->IER & (uint8_t)TIM4_IT);
1331  0007 c652e4        	ld	a,21220
1332  000a 1403          	and	a,(OFST+1,sp)
1333  000c 6b02          	ld	(OFST+0,sp),a
1334                     ; 531   if ((itStatus != (uint8_t)RESET ) && (itEnable != (uint8_t)RESET ))
1336  000e 7b01          	ld	a,(OFST-1,sp)
1337  0010 2708          	jreq	L775
1339  0012 7b02          	ld	a,(OFST+0,sp)
1340  0014 2704          	jreq	L775
1341                     ; 533     bitstatus = (ITStatus)SET;
1343  0016 a601          	ld	a,#1
1345  0018 2001          	jra	L106
1346  001a               L775:
1347                     ; 537     bitstatus = (ITStatus)RESET;
1349  001a 4f            	clr	a
1350  001b               L106:
1351                     ; 539   return ((ITStatus)bitstatus);
1355  001b 5b03          	addw	sp,#3
1356  001d 81            	ret	
1392                     ; 550 void TIM4_ClearITPendingBit(TIM4_IT_TypeDef TIM4_IT)
1392                     ; 551 {
1393                     .text:	section	.text,new
1394  0000               _TIM4_ClearITPendingBit:
1398                     ; 553   assert_param(IS_TIM4_IT(TIM4_IT));
1400                     ; 556   TIM4->SR1 = (uint8_t)(~(uint8_t)TIM4_IT);
1402  0000 43            	cpl	a
1403  0001 c752e5        	ld	21221,a
1404                     ; 557 }
1407  0004 81            	ret	
1466                     ; 568 void TIM4_DMACmd( TIM4_DMASource_TypeDef TIM4_DMASource, FunctionalState NewState)
1466                     ; 569 {
1467                     .text:	section	.text,new
1468  0000               _TIM4_DMACmd:
1470  0000 89            	pushw	x
1471       00000000      OFST:	set	0
1474                     ; 571   assert_param(IS_FUNCTIONAL_STATE(NewState));
1476                     ; 572   assert_param(IS_TIM4_DMA_SOURCE(TIM4_DMASource));
1478                     ; 574   if (NewState != DISABLE)
1480  0001 9f            	ld	a,xl
1481  0002 4d            	tnz	a
1482  0003 2706          	jreq	L156
1483                     ; 577     TIM4->DER |= (uint8_t)TIM4_DMASource;
1485  0005 9e            	ld	a,xh
1486  0006 ca52e3        	or	a,21219
1488  0009 2006          	jra	L356
1489  000b               L156:
1490                     ; 582     TIM4->DER &= (uint8_t)~TIM4_DMASource;
1492  000b 7b01          	ld	a,(OFST+1,sp)
1493  000d 43            	cpl	a
1494  000e c452e3        	and	a,21219
1495  0011               L356:
1496  0011 c752e3        	ld	21219,a
1497                     ; 584 }
1500  0014 85            	popw	x
1501  0015 81            	ret	
1525                     ; 607 void TIM4_InternalClockConfig(void)
1525                     ; 608 {
1526                     .text:	section	.text,new
1527  0000               _TIM4_InternalClockConfig:
1531                     ; 610   TIM4->SMCR &=  (uint8_t)(~TIM4_SMCR_SMS);
1533  0000 c652e2        	ld	a,21218
1534  0003 a4f8          	and	a,#248
1535  0005 c752e2        	ld	21218,a
1536                     ; 611 }
1539  0008 81            	ret	
1621                     ; 651 void TIM4_SelectInputTrigger(TIM4_TRGSelection_TypeDef TIM4_InputTriggerSource)
1621                     ; 652 {
1622                     .text:	section	.text,new
1623  0000               _TIM4_SelectInputTrigger:
1625  0000 88            	push	a
1626  0001 88            	push	a
1627       00000001      OFST:	set	1
1630                     ; 653   uint8_t tmpsmcr = 0;
1632                     ; 656   assert_param(IS_TIM4_TRIGGER_SELECTION(TIM4_InputTriggerSource));
1634                     ; 658   tmpsmcr = TIM4->SMCR;
1636  0002 c652e2        	ld	a,21218
1637                     ; 661   tmpsmcr &= (uint8_t)(~TIM4_SMCR_TS);
1639  0005 a48f          	and	a,#143
1640                     ; 662   tmpsmcr |= (uint8_t)TIM4_InputTriggerSource;
1642  0007 1a02          	or	a,(OFST+1,sp)
1643                     ; 664   TIM4->SMCR = (uint8_t)tmpsmcr;
1645  0009 c752e2        	ld	21218,a
1646                     ; 665 }
1649  000c 85            	popw	x
1650  000d 81            	ret	
1723                     ; 676 void TIM4_SelectOutputTrigger(TIM4_TRGOSource_TypeDef TIM4_TRGOSource)
1723                     ; 677 {
1724                     .text:	section	.text,new
1725  0000               _TIM4_SelectOutputTrigger:
1727  0000 88            	push	a
1728  0001 88            	push	a
1729       00000001      OFST:	set	1
1732                     ; 678   uint8_t tmpcr2 = 0;
1734                     ; 681   assert_param(IS_TIM4_TRGO_SOURCE(TIM4_TRGOSource));
1736                     ; 683   tmpcr2 = TIM4->CR2;
1738  0002 c652e1        	ld	a,21217
1739                     ; 686   tmpcr2 &= (uint8_t)(~TIM4_CR2_MMS);
1741  0005 a48f          	and	a,#143
1742                     ; 689   tmpcr2 |=  (uint8_t)TIM4_TRGOSource;
1744  0007 1a02          	or	a,(OFST+1,sp)
1745                     ; 691   TIM4->CR2 = tmpcr2;
1747  0009 c752e1        	ld	21217,a
1748                     ; 692 }
1751  000c 85            	popw	x
1752  000d 81            	ret	
1841                     ; 706 void TIM4_SelectSlaveMode(TIM4_SlaveMode_TypeDef TIM4_SlaveMode)
1841                     ; 707 {
1842                     .text:	section	.text,new
1843  0000               _TIM4_SelectSlaveMode:
1845  0000 88            	push	a
1846  0001 88            	push	a
1847       00000001      OFST:	set	1
1850                     ; 708   uint8_t tmpsmcr = 0;
1852                     ; 711   assert_param(IS_TIM4_SLAVE_MODE(TIM4_SlaveMode));
1854                     ; 713   tmpsmcr = TIM4->SMCR;
1856  0002 c652e2        	ld	a,21218
1857                     ; 716   tmpsmcr &= (uint8_t)(~TIM4_SMCR_SMS);
1859  0005 a4f8          	and	a,#248
1860                     ; 719   tmpsmcr |= (uint8_t)TIM4_SlaveMode;
1862  0007 1a02          	or	a,(OFST+1,sp)
1863                     ; 721   TIM4->SMCR = tmpsmcr;
1865  0009 c752e2        	ld	21218,a
1866                     ; 722 }
1869  000c 85            	popw	x
1870  000d 81            	ret	
1906                     ; 730 void TIM4_SelectMasterSlaveMode(FunctionalState NewState)
1906                     ; 731 {
1907                     .text:	section	.text,new
1908  0000               _TIM4_SelectMasterSlaveMode:
1912                     ; 733   assert_param(IS_FUNCTIONAL_STATE(NewState));
1914                     ; 736   if (NewState != DISABLE)
1916  0000 4d            	tnz	a
1917  0001 2705          	jreq	L7201
1918                     ; 738     TIM4->SMCR |= TIM4_SMCR_MSM;
1920  0003 721e52e2      	bset	21218,#7
1923  0007 81            	ret	
1924  0008               L7201:
1925                     ; 742     TIM4->SMCR &= (uint8_t)(~TIM4_SMCR_MSM);
1927  0008 721f52e2      	bres	21218,#7
1928                     ; 744 }
1931  000c 81            	ret	
1944                     	xdef	_TIM4_SelectMasterSlaveMode
1945                     	xdef	_TIM4_SelectSlaveMode
1946                     	xdef	_TIM4_SelectOutputTrigger
1947                     	xdef	_TIM4_SelectInputTrigger
1948                     	xdef	_TIM4_InternalClockConfig
1949                     	xdef	_TIM4_DMACmd
1950                     	xdef	_TIM4_ClearITPendingBit
1951                     	xdef	_TIM4_GetITStatus
1952                     	xdef	_TIM4_ClearFlag
1953                     	xdef	_TIM4_GetFlagStatus
1954                     	xdef	_TIM4_GenerateEvent
1955                     	xdef	_TIM4_ITConfig
1956                     	xdef	_TIM4_Cmd
1957                     	xdef	_TIM4_SelectOnePulseMode
1958                     	xdef	_TIM4_ARRPreloadConfig
1959                     	xdef	_TIM4_UpdateRequestConfig
1960                     	xdef	_TIM4_UpdateDisableConfig
1961                     	xdef	_TIM4_GetPrescaler
1962                     	xdef	_TIM4_GetCounter
1963                     	xdef	_TIM4_SetAutoreload
1964                     	xdef	_TIM4_SetCounter
1965                     	xdef	_TIM4_PrescalerConfig
1966                     	xdef	_TIM4_TimeBaseInit
1967                     	xdef	_TIM4_DeInit
1986                     	end
