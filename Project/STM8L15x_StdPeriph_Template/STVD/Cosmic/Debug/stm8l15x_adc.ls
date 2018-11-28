   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.8.32 - 23 Mar 2010
   3                     ; Generator V4.3.4 - 23 Mar 2010
   4                     ; Optimizer V4.3.3 - 10 Feb 2010
 181                     ; 135 void ADC_DeInit(ADC_TypeDef* ADCx)
 181                     ; 136 {
 183                     .text:	section	.text,new
 184  0000               _ADC_DeInit:
 188                     ; 138   ADCx->CR1 =  ADC_CR1_RESET_VALUE;
 190  0000 7f            	clr	(x)
 191                     ; 139   ADCx->CR2 =  ADC_CR2_RESET_VALUE;
 193  0001 6f01          	clr	(1,x)
 194                     ; 140   ADCx->CR3 =  ADC_CR3_RESET_VALUE;
 196  0003 a61f          	ld	a,#31
 197  0005 e702          	ld	(2,x),a
 198                     ; 143   ADCx->SR =  (uint8_t)~ADC_SR_RESET_VALUE;
 200  0007 a6ff          	ld	a,#255
 201  0009 e703          	ld	(3,x),a
 202                     ; 146   ADCx->HTRH =  ADC_HTRH_RESET_VALUE;
 204  000b a60f          	ld	a,#15
 205  000d e706          	ld	(6,x),a
 206                     ; 147   ADCx->HTRL =  ADC_HTRL_RESET_VALUE;
 208  000f a6ff          	ld	a,#255
 209  0011 e707          	ld	(7,x),a
 210                     ; 150   ADCx->LTRH =  ADC_LTRH_RESET_VALUE;
 212  0013 6f08          	clr	(8,x)
 213                     ; 151   ADCx->LTRL =  ADC_LTRL_RESET_VALUE;
 215  0015 6f09          	clr	(9,x)
 216                     ; 154   ADCx->SQR[0] =  ADC_SQR1_RESET_VALUE;
 218  0017 6f0a          	clr	(10,x)
 219                     ; 155   ADCx->SQR[1] =  ADC_SQR2_RESET_VALUE;
 221  0019 6f0b          	clr	(11,x)
 222                     ; 156   ADCx->SQR[2] =  ADC_SQR3_RESET_VALUE;
 224  001b 6f0c          	clr	(12,x)
 225                     ; 157   ADCx->SQR[3] =  ADC_SQR4_RESET_VALUE;
 227  001d 6f0d          	clr	(13,x)
 228                     ; 160   ADCx->TRIGR[0] =  ADC_TRIGR1_RESET_VALUE;
 230  001f 6f0e          	clr	(14,x)
 231                     ; 161   ADCx->TRIGR[1] =  ADC_TRIGR2_RESET_VALUE;
 233  0021 6f0f          	clr	(15,x)
 234                     ; 162   ADCx->TRIGR[2] =  ADC_TRIGR3_RESET_VALUE;
 236  0023 6f10          	clr	(16,x)
 237                     ; 163   ADCx->TRIGR[3] =  ADC_TRIGR4_RESET_VALUE;
 239  0025 6f11          	clr	(17,x)
 240                     ; 164 }
 243  0027 81            	ret	
 390                     ; 186 void ADC_Init(ADC_TypeDef* ADCx,
 390                     ; 187               ADC_ConversionMode_TypeDef ADC_ConversionMode,
 390                     ; 188               ADC_Resolution_TypeDef ADC_Resolution,
 390                     ; 189               ADC_Prescaler_TypeDef ADC_Prescaler)
 390                     ; 190 {
 391                     .text:	section	.text,new
 392  0000               _ADC_Init:
 394  0000 89            	pushw	x
 395       00000000      OFST:	set	0
 398                     ; 192   assert_param(IS_ADC_CONVERSION_MODE(ADC_ConversionMode));
 400                     ; 193   assert_param(IS_ADC_RESOLUTION(ADC_Resolution));
 402                     ; 194   assert_param(IS_ADC_PRESCALER(ADC_Prescaler));
 404                     ; 197   ADCx->CR1 &= (uint8_t)~(ADC_CR1_CONT | ADC_CR1_RES);
 406  0001 f6            	ld	a,(x)
 407  0002 a49b          	and	a,#155
 408  0004 f7            	ld	(x),a
 409                     ; 200   ADCx->CR1 |= (uint8_t)((uint8_t)ADC_ConversionMode | (uint8_t)ADC_Resolution);
 411  0005 7b05          	ld	a,(OFST+5,sp)
 412  0007 1a06          	or	a,(OFST+6,sp)
 413  0009 fa            	or	a,(x)
 414  000a f7            	ld	(x),a
 415                     ; 203   ADCx->CR2 &= (uint8_t)~(ADC_CR2_PRESC);
 417  000b e601          	ld	a,(1,x)
 418  000d a47f          	and	a,#127
 419  000f e701          	ld	(1,x),a
 420                     ; 206   ADCx->CR2 |= (uint8_t) ADC_Prescaler;
 422  0011 e601          	ld	a,(1,x)
 423  0013 1a07          	or	a,(OFST+7,sp)
 424  0015 e701          	ld	(1,x),a
 425                     ; 207 }
 428  0017 85            	popw	x
 429  0018 81            	ret	
 496                     ; 216 void ADC_Cmd(ADC_TypeDef* ADCx,
 496                     ; 217              FunctionalState NewState)
 496                     ; 218 {
 497                     .text:	section	.text,new
 498  0000               _ADC_Cmd:
 500  0000 89            	pushw	x
 501       00000000      OFST:	set	0
 504                     ; 220   assert_param(IS_FUNCTIONAL_STATE(NewState));
 506                     ; 222   if (NewState != DISABLE)
 508  0001 7b05          	ld	a,(OFST+5,sp)
 509  0003 2705          	jreq	L142
 510                     ; 225     ADCx->CR1 |= ADC_CR1_ADON;
 512  0005 f6            	ld	a,(x)
 513  0006 aa01          	or	a,#1
 515  0008 2005          	jra	L342
 516  000a               L142:
 517                     ; 230     ADCx->CR1 &= (uint8_t)~ADC_CR1_ADON;
 519  000a 1e01          	ldw	x,(OFST+1,sp)
 520  000c f6            	ld	a,(x)
 521  000d a4fe          	and	a,#254
 522  000f               L342:
 523  000f f7            	ld	(x),a
 524                     ; 232 }
 527  0010 85            	popw	x
 528  0011 81            	ret	
 566                     ; 239 void ADC_SoftwareStartConv(ADC_TypeDef* ADCx)
 566                     ; 240 {
 567                     .text:	section	.text,new
 568  0000               _ADC_SoftwareStartConv:
 572                     ; 242   ADCx->CR1 |= ADC_CR1_START;
 574  0000 f6            	ld	a,(x)
 575  0001 aa02          	or	a,#2
 576  0003 f7            	ld	(x),a
 577                     ; 243 }
 580  0004 81            	ret	
 708                     ; 261 void ADC_ExternalTrigConfig(ADC_TypeDef* ADCx,
 708                     ; 262                             ADC_ExtEventSelection_TypeDef ADC_ExtEventSelection,
 708                     ; 263                             ADC_ExtTRGSensitivity_TypeDef ADC_ExtTRGSensitivity)
 708                     ; 264 {
 709                     .text:	section	.text,new
 710  0000               _ADC_ExternalTrigConfig:
 712  0000 89            	pushw	x
 713       00000000      OFST:	set	0
 716                     ; 266   assert_param(IS_ADC_EXT_EVENT_SELECTION(ADC_ExtEventSelection));
 718                     ; 267   assert_param(IS_ADC_EXT_TRG_SENSITIVITY(ADC_ExtTRGSensitivity));
 720                     ; 270   ADCx->CR2 &= (uint8_t)~(ADC_CR2_TRIGEDGE | ADC_CR2_EXTSEL);
 722  0001 e601          	ld	a,(1,x)
 723  0003 a487          	and	a,#135
 724  0005 e701          	ld	(1,x),a
 725                     ; 274   ADCx->CR2 |= (uint8_t)( (uint8_t)ADC_ExtTRGSensitivity | \
 725                     ; 275                           (uint8_t)ADC_ExtEventSelection);
 727  0007 7b06          	ld	a,(OFST+6,sp)
 728  0009 1a05          	or	a,(OFST+5,sp)
 729  000b ea01          	or	a,(1,x)
 730  000d e701          	ld	(1,x),a
 731                     ; 276 }
 734  000f 85            	popw	x
 735  0010 81            	ret	
1049                     ; 339 void ADC_AnalogWatchdogChannelSelect(ADC_TypeDef* ADCx,
1049                     ; 340                                      ADC_AnalogWatchdogSelection_TypeDef ADC_AnalogWatchdogSelection)
1049                     ; 341 {
1050                     .text:	section	.text,new
1051  0000               _ADC_AnalogWatchdogChannelSelect:
1053  0000 89            	pushw	x
1054       00000000      OFST:	set	0
1057                     ; 343   assert_param(IS_ADC_ANALOGWATCHDOG_SELECTION(ADC_AnalogWatchdogSelection));
1059                     ; 346   ADCx->CR3 &= ((uint8_t)~ADC_CR3_CHSEL);
1061  0001 e602          	ld	a,(2,x)
1062  0003 a4e0          	and	a,#224
1063  0005 e702          	ld	(2,x),a
1064                     ; 349   ADCx->CR3 |= (uint8_t)ADC_AnalogWatchdogSelection;
1066  0007 e602          	ld	a,(2,x)
1067  0009 1a05          	or	a,(OFST+5,sp)
1068  000b e702          	ld	(2,x),a
1069                     ; 350 }
1072  000d 85            	popw	x
1073  000e 81            	ret	
1125                     ; 361 void ADC_AnalogWatchdogThresholdsConfig(ADC_TypeDef* ADCx, uint16_t HighThreshold, uint16_t LowThreshold)
1125                     ; 362 {
1126                     .text:	section	.text,new
1127  0000               _ADC_AnalogWatchdogThresholdsConfig:
1129  0000 89            	pushw	x
1130       00000000      OFST:	set	0
1133                     ; 364   assert_param(IS_ADC_THRESHOLD(HighThreshold));
1135                     ; 365   assert_param(IS_ADC_THRESHOLD(LowThreshold));
1137                     ; 368   ADCx->HTRH = (uint8_t)(HighThreshold >> 8);
1139  0001 1e01          	ldw	x,(OFST+1,sp)
1140  0003 7b05          	ld	a,(OFST+5,sp)
1141  0005 e706          	ld	(6,x),a
1142                     ; 369   ADCx->HTRL = (uint8_t)(HighThreshold);
1144  0007 7b06          	ld	a,(OFST+6,sp)
1145  0009 e707          	ld	(7,x),a
1146                     ; 372   ADCx->LTRH = (uint8_t)(LowThreshold >> 8);
1148  000b 7b07          	ld	a,(OFST+7,sp)
1149  000d e708          	ld	(8,x),a
1150                     ; 373   ADCx->LTRL = (uint8_t)(LowThreshold);
1152  000f 7b08          	ld	a,(OFST+8,sp)
1153  0011 e709          	ld	(9,x),a
1154                     ; 374 }
1157  0013 85            	popw	x
1158  0014 81            	ret	
1221                     ; 412 void ADC_AnalogWatchdogConfig(ADC_TypeDef* ADCx,
1221                     ; 413                               ADC_AnalogWatchdogSelection_TypeDef ADC_AnalogWatchdogSelection,
1221                     ; 414                               uint16_t HighThreshold,
1221                     ; 415                               uint16_t LowThreshold)
1221                     ; 416 {
1222                     .text:	section	.text,new
1223  0000               _ADC_AnalogWatchdogConfig:
1225  0000 89            	pushw	x
1226       00000000      OFST:	set	0
1229                     ; 418   assert_param(IS_ADC_ANALOGWATCHDOG_SELECTION(ADC_AnalogWatchdogSelection));
1231                     ; 419   assert_param(IS_ADC_THRESHOLD(HighThreshold));
1233                     ; 420   assert_param(IS_ADC_THRESHOLD(LowThreshold));
1235                     ; 423   ADCx->CR3 &= ((uint8_t)~ADC_CR3_CHSEL);
1237  0001 e602          	ld	a,(2,x)
1238  0003 a4e0          	and	a,#224
1239  0005 e702          	ld	(2,x),a
1240                     ; 426   ADCx->CR3 |= (uint8_t)ADC_AnalogWatchdogSelection;
1242  0007 e602          	ld	a,(2,x)
1243  0009 1a05          	or	a,(OFST+5,sp)
1244  000b e702          	ld	(2,x),a
1245                     ; 429   ADCx->HTRH = (uint8_t)(HighThreshold >> 8);
1247  000d 1e01          	ldw	x,(OFST+1,sp)
1248  000f 7b06          	ld	a,(OFST+6,sp)
1249  0011 e706          	ld	(6,x),a
1250                     ; 430   ADCx->HTRL = (uint8_t)(HighThreshold);
1252  0013 7b07          	ld	a,(OFST+7,sp)
1253  0015 e707          	ld	(7,x),a
1254                     ; 433   ADCx->LTRH = (uint8_t)(LowThreshold >> 8);
1256  0017 7b08          	ld	a,(OFST+8,sp)
1257  0019 e708          	ld	(8,x),a
1258                     ; 434   ADCx->LTRL = (uint8_t)LowThreshold;
1260  001b 7b09          	ld	a,(OFST+9,sp)
1261  001d e709          	ld	(9,x),a
1262                     ; 435 }
1265  001f 85            	popw	x
1266  0020 81            	ret	
1301                     ; 474 void ADC_TempSensorCmd(FunctionalState NewState)
1301                     ; 475 {
1302                     .text:	section	.text,new
1303  0000               _ADC_TempSensorCmd:
1307                     ; 477   assert_param(IS_FUNCTIONAL_STATE(NewState));
1309                     ; 479   if (NewState != DISABLE)
1311  0000 4d            	tnz	a
1312  0001 2705          	jreq	L165
1313                     ; 482     ADC1->TRIGR[0] |= (uint8_t)(ADC_TRIGR1_TSON);
1315  0003 721a534e      	bset	21326,#5
1318  0007 81            	ret	
1319  0008               L165:
1320                     ; 487     ADC1->TRIGR[0] &= (uint8_t)(~ADC_TRIGR1_TSON);
1322  0008 721b534e      	bres	21326,#5
1323                     ; 489 }
1326  000c 81            	ret	
1361                     ; 497 void ADC_VrefintCmd(FunctionalState NewState)
1361                     ; 498 {
1362                     .text:	section	.text,new
1363  0000               _ADC_VrefintCmd:
1367                     ; 500   assert_param(IS_FUNCTIONAL_STATE(NewState));
1369                     ; 502   if (NewState != DISABLE)
1371  0000 4d            	tnz	a
1372  0001 2705          	jreq	L306
1373                     ; 505     ADC1->TRIGR[0] |= (uint8_t)(ADC_TRIGR1_VREFINTON);
1375  0003 7218534e      	bset	21326,#4
1378  0007 81            	ret	
1379  0008               L306:
1380                     ; 510     ADC1->TRIGR[0] &= (uint8_t)(~ADC_TRIGR1_VREFINTON);
1382  0008 7219534e      	bres	21326,#4
1383                     ; 512 }
1386  000c 81            	ret	
1696                     ; 583 void ADC_ChannelCmd(ADC_TypeDef* ADCx, ADC_Channel_TypeDef ADC_Channels, FunctionalState NewState)
1696                     ; 584 {
1697                     .text:	section	.text,new
1698  0000               _ADC_ChannelCmd:
1700  0000 89            	pushw	x
1701  0001 88            	push	a
1702       00000001      OFST:	set	1
1705                     ; 585   uint8_t regindex = 0;
1707                     ; 587   assert_param(IS_FUNCTIONAL_STATE(NewState));
1709                     ; 589   regindex = (uint8_t)((uint16_t)ADC_Channels >> 8);
1711  0002 7b06          	ld	a,(OFST+5,sp)
1712  0004 6b01          	ld	(OFST+0,sp),a
1713                     ; 591   if (NewState != DISABLE)
1715  0006 0d08          	tnz	(OFST+7,sp)
1716  0008 270d          	jreq	L157
1717                     ; 594     ADCx->SQR[regindex] |= (uint8_t)(ADC_Channels);
1719  000a 01            	rrwa	x,a
1720  000b 1b01          	add	a,(OFST+0,sp)
1721  000d 2401          	jrnc	L23
1722  000f 5c            	incw	x
1723  0010               L23:
1724  0010 02            	rlwa	x,a
1725  0011 e60a          	ld	a,(10,x)
1726  0013 1a07          	or	a,(OFST+6,sp)
1728  0015 2010          	jra	L357
1729  0017               L157:
1730                     ; 599     ADCx->SQR[regindex] &= (uint8_t)(~(uint8_t)(ADC_Channels));
1732  0017 7b02          	ld	a,(OFST+1,sp)
1733  0019 97            	ld	xl,a
1734  001a 7b03          	ld	a,(OFST+2,sp)
1735  001c 1b01          	add	a,(OFST+0,sp)
1736  001e 2401          	jrnc	L43
1737  0020 5c            	incw	x
1738  0021               L43:
1739  0021 02            	rlwa	x,a
1740  0022 7b07          	ld	a,(OFST+6,sp)
1741  0024 43            	cpl	a
1742  0025 e40a          	and	a,(10,x)
1743  0027               L357:
1744  0027 e70a          	ld	(10,x),a
1745                     ; 601 }
1748  0029 5b03          	addw	sp,#3
1749  002b 81            	ret	
1899                     ; 625 void ADC_SamplingTimeConfig(ADC_TypeDef* ADCx,
1899                     ; 626                             ADC_Group_TypeDef ADC_GroupChannels,
1899                     ; 627                             ADC_SamplingTime_TypeDef ADC_SamplingTime)
1899                     ; 628 {
1900                     .text:	section	.text,new
1901  0000               _ADC_SamplingTimeConfig:
1903  0000 89            	pushw	x
1904       00000000      OFST:	set	0
1907                     ; 630   assert_param(IS_ADC_GROUP(ADC_GroupChannels));
1909                     ; 631   assert_param(IS_ADC_SAMPLING_TIME_CYCLES(ADC_SamplingTime));
1911                     ; 633   if ( ADC_GroupChannels != ADC_Group_SlowChannels)
1913  0001 7b05          	ld	a,(OFST+5,sp)
1914  0003 2712          	jreq	L1401
1915                     ; 636     ADCx->CR3 &= (uint8_t)~ADC_CR3_SMPT2;
1917  0005 e602          	ld	a,(2,x)
1918  0007 a41f          	and	a,#31
1919  0009 e702          	ld	(2,x),a
1920                     ; 637     ADCx->CR3 |= (uint8_t)(ADC_SamplingTime << 5);
1922  000b 7b06          	ld	a,(OFST+6,sp)
1923  000d 4e            	swap	a
1924  000e 48            	sll	a
1925  000f a4e0          	and	a,#224
1926  0011 ea02          	or	a,(2,x)
1927  0013 e702          	ld	(2,x),a
1929  0015 200e          	jra	L3401
1930  0017               L1401:
1931                     ; 642     ADCx->CR2 &= (uint8_t)~ADC_CR2_SMPT1;
1933  0017 1e01          	ldw	x,(OFST+1,sp)
1934  0019 e601          	ld	a,(1,x)
1935  001b a4f8          	and	a,#248
1936  001d e701          	ld	(1,x),a
1937                     ; 643     ADCx->CR2 |= (uint8_t)ADC_SamplingTime;
1939  001f e601          	ld	a,(1,x)
1940  0021 1a06          	or	a,(OFST+6,sp)
1941  0023 e701          	ld	(1,x),a
1942  0025               L3401:
1943                     ; 645 }
1946  0025 85            	popw	x
1947  0026 81            	ret	
2012                     ; 691 void ADC_SchmittTriggerConfig(ADC_TypeDef* ADCx, ADC_Channel_TypeDef ADC_Channels,
2012                     ; 692                               FunctionalState NewState)
2012                     ; 693 {
2013                     .text:	section	.text,new
2014  0000               _ADC_SchmittTriggerConfig:
2016  0000 89            	pushw	x
2017  0001 88            	push	a
2018       00000001      OFST:	set	1
2021                     ; 694   uint8_t regindex = 0;
2023                     ; 696   assert_param(IS_FUNCTIONAL_STATE(NewState));
2025                     ; 698   regindex = (uint8_t)((uint16_t)ADC_Channels >> 8);
2027  0002 7b06          	ld	a,(OFST+5,sp)
2028  0004 6b01          	ld	(OFST+0,sp),a
2029                     ; 700   if (NewState != DISABLE)
2031  0006 0d08          	tnz	(OFST+7,sp)
2032  0008 270e          	jreq	L7701
2033                     ; 703     ADCx->TRIGR[regindex] &= (uint8_t)(~(uint8_t)ADC_Channels);
2035  000a 01            	rrwa	x,a
2036  000b 1b01          	add	a,(OFST+0,sp)
2037  000d 2401          	jrnc	L24
2038  000f 5c            	incw	x
2039  0010               L24:
2040  0010 02            	rlwa	x,a
2041  0011 7b07          	ld	a,(OFST+6,sp)
2042  0013 43            	cpl	a
2043  0014 e40e          	and	a,(14,x)
2045  0016 200f          	jra	L1011
2046  0018               L7701:
2047                     ; 708     ADCx->TRIGR[regindex] |= (uint8_t)(ADC_Channels);
2049  0018 7b02          	ld	a,(OFST+1,sp)
2050  001a 97            	ld	xl,a
2051  001b 7b03          	ld	a,(OFST+2,sp)
2052  001d 1b01          	add	a,(OFST+0,sp)
2053  001f 2401          	jrnc	L44
2054  0021 5c            	incw	x
2055  0022               L44:
2056  0022 02            	rlwa	x,a
2057  0023 e60e          	ld	a,(14,x)
2058  0025 1a07          	or	a,(OFST+6,sp)
2059  0027               L1011:
2060  0027 e70e          	ld	(14,x),a
2061                     ; 710 }
2064  0029 5b03          	addw	sp,#3
2065  002b 81            	ret	
2110                     ; 717 uint16_t ADC_GetConversionValue(ADC_TypeDef* ADCx)
2110                     ; 718 {
2111                     .text:	section	.text,new
2112  0000               _ADC_GetConversionValue:
2114  0000 89            	pushw	x
2115  0001 89            	pushw	x
2116       00000002      OFST:	set	2
2119                     ; 719   uint16_t tmpreg = 0;
2121                     ; 722   tmpreg = (uint16_t)(ADCx->DRH);
2123  0002 e604          	ld	a,(4,x)
2124                     ; 723   tmpreg = (uint16_t)((uint16_t)((uint16_t)tmpreg << 8) | ADCx->DRL);
2126  0004 1603          	ldw	y,(OFST+1,sp)
2127  0006 97            	ld	xl,a
2128  0007 90e605        	ld	a,(5,y)
2129  000a 02            	rlwa	x,a
2130                     ; 726   return (uint16_t)(tmpreg) ;
2134  000b 5b04          	addw	sp,#4
2135  000d 81            	ret	
2182                     ; 760 void ADC_DMACmd(ADC_TypeDef* ADCx, FunctionalState NewState)
2182                     ; 761 {
2183                     .text:	section	.text,new
2184  0000               _ADC_DMACmd:
2186  0000 89            	pushw	x
2187       00000000      OFST:	set	0
2190                     ; 763   assert_param(IS_FUNCTIONAL_STATE(NewState));
2192                     ; 765   if (NewState != DISABLE)
2194  0001 7b05          	ld	a,(OFST+5,sp)
2195  0003 2706          	jreq	L1511
2196                     ; 768     ADCx->SQR[0] &= (uint8_t)~ADC_SQR1_DMAOFF;
2198  0005 e60a          	ld	a,(10,x)
2199  0007 a47f          	and	a,#127
2201  0009 2006          	jra	L3511
2202  000b               L1511:
2203                     ; 773     ADCx->SQR[0] |= ADC_SQR1_DMAOFF;
2205  000b 1e01          	ldw	x,(OFST+1,sp)
2206  000d e60a          	ld	a,(10,x)
2207  000f aa80          	or	a,#128
2208  0011               L3511:
2209  0011 e70a          	ld	(10,x),a
2210                     ; 775 }
2213  0013 85            	popw	x
2214  0014 81            	ret	
2298                     ; 831 void ADC_ITConfig(ADC_TypeDef* ADCx, ADC_IT_TypeDef ADC_IT, FunctionalState NewState)
2298                     ; 832 {
2299                     .text:	section	.text,new
2300  0000               _ADC_ITConfig:
2302  0000 89            	pushw	x
2303       00000000      OFST:	set	0
2306                     ; 834   assert_param(IS_FUNCTIONAL_STATE(NewState));
2308                     ; 835   assert_param(IS_ADC_IT(ADC_IT));
2310                     ; 837   if (NewState != DISABLE)
2312  0001 7b06          	ld	a,(OFST+6,sp)
2313  0003 2705          	jreq	L7121
2314                     ; 840     ADCx->CR1 |= (uint8_t) ADC_IT;
2316  0005 f6            	ld	a,(x)
2317  0006 1a05          	or	a,(OFST+5,sp)
2319  0008 2006          	jra	L1221
2320  000a               L7121:
2321                     ; 845     ADCx->CR1 &= (uint8_t)(~ADC_IT);
2323  000a 1e01          	ldw	x,(OFST+1,sp)
2324  000c 7b05          	ld	a,(OFST+5,sp)
2325  000e 43            	cpl	a
2326  000f f4            	and	a,(x)
2327  0010               L1221:
2328  0010 f7            	ld	(x),a
2329                     ; 847 }
2332  0011 85            	popw	x
2333  0012 81            	ret	
2438                     ; 859 FlagStatus ADC_GetFlagStatus(ADC_TypeDef* ADCx, ADC_FLAG_TypeDef ADC_FLAG)
2438                     ; 860 {
2439                     .text:	section	.text,new
2440  0000               _ADC_GetFlagStatus:
2442  0000 89            	pushw	x
2443  0001 88            	push	a
2444       00000001      OFST:	set	1
2447                     ; 861   FlagStatus flagstatus = RESET;
2449                     ; 864   assert_param(IS_ADC_GET_FLAG(ADC_FLAG));
2451                     ; 867   if ((ADCx->SR & ADC_FLAG) != (uint8_t)RESET)
2453  0002 e603          	ld	a,(3,x)
2454  0004 1506          	bcp	a,(OFST+5,sp)
2455  0006 2704          	jreq	L5721
2456                     ; 870     flagstatus = SET;
2458  0008 a601          	ld	a,#1
2460  000a 2001          	jra	L7721
2461  000c               L5721:
2462                     ; 875     flagstatus = RESET;
2464  000c 4f            	clr	a
2465  000d               L7721:
2466                     ; 879   return  flagstatus;
2470  000d 5b03          	addw	sp,#3
2471  000f 81            	ret	
2518                     ; 892 void ADC_ClearFlag(ADC_TypeDef* ADCx,
2518                     ; 893                    ADC_FLAG_TypeDef ADC_FLAG)
2518                     ; 894 {
2519                     .text:	section	.text,new
2520  0000               _ADC_ClearFlag:
2522  0000 89            	pushw	x
2523       00000000      OFST:	set	0
2526                     ; 896   assert_param(IS_ADC_CLEAR_FLAG(ADC_FLAG));
2528                     ; 899   ADCx->SR = (uint8_t)~ADC_FLAG;
2530  0001 7b05          	ld	a,(OFST+5,sp)
2531  0003 1e01          	ldw	x,(OFST+1,sp)
2532  0005 43            	cpl	a
2533  0006 e703          	ld	(3,x),a
2534                     ; 900 }
2537  0008 85            	popw	x
2538  0009 81            	ret	
2610                     ; 912 ITStatus ADC_GetITStatus(ADC_TypeDef* ADCx,
2610                     ; 913                          ADC_IT_TypeDef ADC_IT)
2610                     ; 914 {
2611                     .text:	section	.text,new
2612  0000               _ADC_GetITStatus:
2614  0000 89            	pushw	x
2615  0001 5203          	subw	sp,#3
2616       00000003      OFST:	set	3
2619                     ; 915   ITStatus itstatus = RESET;
2621                     ; 916   uint8_t itmask = 0, enablestatus = 0;
2625                     ; 919   assert_param(IS_ADC_GET_IT(ADC_IT));
2627                     ; 922   itmask = (uint8_t)(ADC_IT >> 3);
2629  0003 7b08          	ld	a,(OFST+5,sp)
2630  0005 44            	srl	a
2631  0006 44            	srl	a
2632  0007 44            	srl	a
2633  0008 6b03          	ld	(OFST+0,sp),a
2634                     ; 923   itmask =  (uint8_t)((uint8_t)((uint8_t)(itmask & (uint8_t)0x10) >> 2) | \
2634                     ; 924                                 (uint8_t)(itmask & (uint8_t)0x03));
2636  000a a403          	and	a,#3
2637  000c 6b01          	ld	(OFST-2,sp),a
2638  000e 7b03          	ld	a,(OFST+0,sp)
2639  0010 a410          	and	a,#16
2640  0012 44            	srl	a
2641  0013 44            	srl	a
2642  0014 1a01          	or	a,(OFST-2,sp)
2643  0016 6b03          	ld	(OFST+0,sp),a
2644                     ; 927   enablestatus = (uint8_t)(ADCx->CR1 & (uint8_t)ADC_IT) ;
2646  0018 f6            	ld	a,(x)
2647  0019 1408          	and	a,(OFST+5,sp)
2648  001b 6b02          	ld	(OFST-1,sp),a
2649                     ; 930   if (((ADCx->SR & itmask) != (uint8_t)RESET) && enablestatus)
2651  001d e603          	ld	a,(3,x)
2652  001f 1503          	bcp	a,(OFST+0,sp)
2653  0021 2708          	jreq	L1631
2655  0023 7b02          	ld	a,(OFST-1,sp)
2656  0025 2704          	jreq	L1631
2657                     ; 933     itstatus = SET;
2659  0027 a601          	ld	a,#1
2661  0029 2001          	jra	L3631
2662  002b               L1631:
2663                     ; 938     itstatus = RESET;
2665  002b 4f            	clr	a
2666  002c               L3631:
2667                     ; 942   return  itstatus;
2671  002c 5b05          	addw	sp,#5
2672  002e 81            	ret	
2727                     ; 955 void ADC_ClearITPendingBit(ADC_TypeDef* ADCx,
2727                     ; 956                            ADC_IT_TypeDef ADC_IT)
2727                     ; 957 {
2728                     .text:	section	.text,new
2729  0000               _ADC_ClearITPendingBit:
2731  0000 89            	pushw	x
2732  0001 89            	pushw	x
2733       00000002      OFST:	set	2
2736                     ; 958   uint8_t itmask = 0;
2738                     ; 961   assert_param(IS_ADC_IT(ADC_IT));
2740                     ; 964   itmask = (uint8_t)(ADC_IT >> 3);
2742  0002 7b07          	ld	a,(OFST+5,sp)
2743  0004 44            	srl	a
2744  0005 44            	srl	a
2745  0006 44            	srl	a
2746  0007 6b02          	ld	(OFST+0,sp),a
2747                     ; 965   itmask =  (uint8_t)((uint8_t)(((uint8_t)(itmask & (uint8_t)0x10)) >> 2) | \
2747                     ; 966                                  (uint8_t)(itmask & (uint8_t)0x03));
2749  0009 a403          	and	a,#3
2750  000b 6b01          	ld	(OFST-1,sp),a
2751  000d 7b02          	ld	a,(OFST+0,sp)
2752  000f a410          	and	a,#16
2753  0011 44            	srl	a
2754  0012 44            	srl	a
2755  0013 1a01          	or	a,(OFST-1,sp)
2756  0015 6b02          	ld	(OFST+0,sp),a
2757                     ; 969   ADCx->SR = (uint8_t)~itmask;
2759  0017 1e03          	ldw	x,(OFST+1,sp)
2760  0019 43            	cpl	a
2761  001a e703          	ld	(3,x),a
2762                     ; 970 }
2765  001c 5b04          	addw	sp,#4
2766  001e 81            	ret	
2779                     	xdef	_ADC_ClearITPendingBit
2780                     	xdef	_ADC_GetITStatus
2781                     	xdef	_ADC_ClearFlag
2782                     	xdef	_ADC_GetFlagStatus
2783                     	xdef	_ADC_ITConfig
2784                     	xdef	_ADC_DMACmd
2785                     	xdef	_ADC_GetConversionValue
2786                     	xdef	_ADC_SchmittTriggerConfig
2787                     	xdef	_ADC_SamplingTimeConfig
2788                     	xdef	_ADC_ChannelCmd
2789                     	xdef	_ADC_VrefintCmd
2790                     	xdef	_ADC_TempSensorCmd
2791                     	xdef	_ADC_AnalogWatchdogConfig
2792                     	xdef	_ADC_AnalogWatchdogThresholdsConfig
2793                     	xdef	_ADC_AnalogWatchdogChannelSelect
2794                     	xdef	_ADC_ExternalTrigConfig
2795                     	xdef	_ADC_SoftwareStartConv
2796                     	xdef	_ADC_Cmd
2797                     	xdef	_ADC_Init
2798                     	xdef	_ADC_DeInit
2817                     	end
