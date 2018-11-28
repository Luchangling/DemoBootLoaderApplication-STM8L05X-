   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.8.32 - 23 Mar 2010
   3                     ; Generator V4.3.4 - 23 Mar 2010
   4                     ; Optimizer V4.3.3 - 10 Feb 2010
  22                     .const:	section	.text
  23  0000               _SYSDivFactor:
  24  0000 01            	dc.b	1
  25  0001 02            	dc.b	2
  26  0002 04            	dc.b	4
  27  0003 08            	dc.b	8
  28  0004 10            	dc.b	16
  57                     ; 120 void CLK_DeInit(void)
  57                     ; 121 {
  59                     .text:	section	.text,new
  60  0000               _CLK_DeInit:
  64                     ; 122   CLK->ICKCR = CLK_ICKCR_RESET_VALUE;
  66  0000 351150c2      	mov	20674,#17
  67                     ; 123   CLK->ECKCR = CLK_ECKCR_RESET_VALUE;
  69  0004 725f50c6      	clr	20678
  70                     ; 124   CLK->CRTCR = CLK_CRTCR_RESET_VALUE;
  72  0008 725f50c1      	clr	20673
  73                     ; 125   CLK->CBEEPR = CLK_CBEEPR_RESET_VALUE;
  75  000c 725f50cb      	clr	20683
  76                     ; 126   CLK->SWR  = CLK_SWR_RESET_VALUE;
  78  0010 350150c8      	mov	20680,#1
  79                     ; 127   CLK->SWCR = CLK_SWCR_RESET_VALUE;
  81  0014 725f50c9      	clr	20681
  82                     ; 128   CLK->CKDIVR = CLK_CKDIVR_RESET_VALUE;
  84  0018 350350c0      	mov	20672,#3
  85                     ; 129   CLK->PCKENR1 = CLK_PCKENR1_RESET_VALUE;
  87  001c 725f50c3      	clr	20675
  88                     ; 130   CLK->PCKENR2 = CLK_PCKENR2_RESET_VALUE;
  90  0020 358050c4      	mov	20676,#128
  91                     ; 131   CLK->PCKENR3 = CLK_PCKENR3_RESET_VALUE;
  93  0024 725f50d0      	clr	20688
  94                     ; 132   CLK->CSSR  = CLK_CSSR_RESET_VALUE;
  96  0028 725f50ca      	clr	20682
  97                     ; 133   CLK->CCOR = CLK_CCOR_RESET_VALUE;
  99  002c 725f50c5      	clr	20677
 100                     ; 134   CLK->HSITRIMR = CLK_HSITRIMR_RESET_VALUE;
 102  0030 725f50cd      	clr	20685
 103                     ; 135   CLK->HSICALR = CLK_HSICALR_RESET_VALUE;
 105  0034 725f50cc      	clr	20684
 106                     ; 136   CLK->HSIUNLCKR = CLK_HSIUNLCKR_RESET_VALUE;
 108  0038 725f50ce      	clr	20686
 109                     ; 137   CLK->REGCSR = CLK_REGCSR_RESET_VALUE;
 111  003c 35b950cf      	mov	20687,#185
 112                     ; 138 }
 115  0040 81            	ret	
 170                     ; 160 void CLK_HSICmd(FunctionalState NewState)
 170                     ; 161 {
 171                     .text:	section	.text,new
 172  0000               _CLK_HSICmd:
 176                     ; 163   assert_param(IS_FUNCTIONAL_STATE(NewState));
 178                     ; 165   if (NewState != DISABLE)
 180  0000 4d            	tnz	a
 181  0001 2705          	jreq	L74
 182                     ; 168     CLK->ICKCR |= CLK_ICKCR_HSION;
 184  0003 721050c2      	bset	20674,#0
 187  0007 81            	ret	
 188  0008               L74:
 189                     ; 173     CLK->ICKCR &= (uint8_t)(~CLK_ICKCR_HSION);
 191  0008 721150c2      	bres	20674,#0
 192                     ; 175 }
 195  000c 81            	ret	
 229                     ; 188 void CLK_AdjustHSICalibrationValue(uint8_t CLK_HSICalibrationValue)
 229                     ; 189 {
 230                     .text:	section	.text,new
 231  0000               _CLK_AdjustHSICalibrationValue:
 235                     ; 191   CLK->HSIUNLCKR = 0xAC;
 237  0000 35ac50ce      	mov	20686,#172
 238                     ; 192   CLK->HSIUNLCKR = 0x35;
 240  0004 353550ce      	mov	20686,#53
 241                     ; 195   CLK->HSITRIMR = (uint8_t)CLK_HSICalibrationValue;
 243  0008 c750cd        	ld	20685,a
 244                     ; 196 }
 247  000b 81            	ret	
 282                     ; 212 void CLK_LSICmd(FunctionalState NewState)
 282                     ; 213 {
 283                     .text:	section	.text,new
 284  0000               _CLK_LSICmd:
 288                     ; 216   assert_param(IS_FUNCTIONAL_STATE(NewState));
 290                     ; 218   if (NewState != DISABLE)
 292  0000 4d            	tnz	a
 293  0001 2705          	jreq	L501
 294                     ; 221     CLK->ICKCR |= CLK_ICKCR_LSION;
 296  0003 721450c2      	bset	20674,#2
 299  0007 81            	ret	
 300  0008               L501:
 301                     ; 226     CLK->ICKCR &= (uint8_t)(~CLK_ICKCR_LSION);
 303  0008 721550c2      	bres	20674,#2
 304                     ; 228 }
 307  000c 81            	ret	
 369                     ; 249 void CLK_HSEConfig(CLK_HSE_TypeDef CLK_HSE)
 369                     ; 250 {
 370                     .text:	section	.text,new
 371  0000               _CLK_HSEConfig:
 375                     ; 252   assert_param(IS_CLK_HSE(CLK_HSE));
 377                     ; 256   CLK->ECKCR &= (uint8_t)~CLK_ECKCR_HSEON;
 379  0000 721150c6      	bres	20678,#0
 380                     ; 259   CLK->ECKCR &= (uint8_t)~CLK_ECKCR_HSEBYP;
 382  0004 721950c6      	bres	20678,#4
 383                     ; 262   CLK->ECKCR |= (uint8_t)CLK_HSE;
 385  0008 ca50c6        	or	a,20678
 386  000b c750c6        	ld	20678,a
 387                     ; 263 }
 390  000e 81            	ret	
 452                     ; 280 void CLK_LSEConfig(CLK_LSE_TypeDef CLK_LSE)
 452                     ; 281 {
 453                     .text:	section	.text,new
 454  0000               _CLK_LSEConfig:
 458                     ; 283   assert_param(IS_CLK_LSE(CLK_LSE));
 460                     ; 287   CLK->ECKCR &= (uint8_t)~CLK_ECKCR_LSEON;
 462  0000 721550c6      	bres	20678,#2
 463                     ; 290   CLK->ECKCR &= (uint8_t)~CLK_ECKCR_LSEBYP;
 465  0004 721b50c6      	bres	20678,#5
 466                     ; 293   CLK->ECKCR |= (uint8_t)CLK_LSE;
 468  0008 ca50c6        	or	a,20678
 469  000b c750c6        	ld	20678,a
 470                     ; 295 }
 473  000e 81            	ret	
 497                     ; 306 void CLK_ClockSecuritySystemEnable(void)
 497                     ; 307 {
 498                     .text:	section	.text,new
 499  0000               _CLK_ClockSecuritySystemEnable:
 503                     ; 309   CLK->CSSR |= CLK_CSSR_CSSEN;
 505  0000 721050ca      	bset	20682,#0
 506                     ; 310 }
 509  0004 81            	ret	
 545                     ; 317 void CLK_ClockSecuritySytemDeglitchCmd(FunctionalState NewState)
 545                     ; 318 {
 546                     .text:	section	.text,new
 547  0000               _CLK_ClockSecuritySytemDeglitchCmd:
 551                     ; 320   assert_param(IS_FUNCTIONAL_STATE(NewState));
 553                     ; 322   if (NewState != DISABLE)
 555  0000 4d            	tnz	a
 556  0001 2705          	jreq	L712
 557                     ; 325     CLK->CSSR |= CLK_CSSR_CSSDGON;
 559  0003 721850ca      	bset	20682,#4
 562  0007 81            	ret	
 563  0008               L712:
 564                     ; 330     CLK->CSSR &= (uint8_t)(~CLK_CSSR_CSSDGON);
 566  0008 721950ca      	bres	20682,#4
 567                     ; 332 }
 570  000c 81            	ret	
 711                     ; 356 void CLK_CCOConfig(CLK_CCOSource_TypeDef CLK_CCOSource, CLK_CCODiv_TypeDef CLK_CCODiv)
 711                     ; 357 {
 712                     .text:	section	.text,new
 713  0000               _CLK_CCOConfig:
 715  0000 89            	pushw	x
 716       00000000      OFST:	set	0
 719                     ; 359   assert_param(IS_CLK_OUTPUT(CLK_CCOSource));
 721                     ; 360   assert_param(IS_CLK_OUTPUT_DIVIDER(CLK_CCODiv));
 723                     ; 363   CLK->CCOR = (uint8_t)((uint8_t)CLK_CCOSource | (uint8_t)CLK_CCODiv);
 725  0001 9f            	ld	a,xl
 726  0002 1a01          	or	a,(OFST+1,sp)
 727  0004 c750c5        	ld	20677,a
 728                     ; 364 }
 731  0007 85            	popw	x
 732  0008 81            	ret	
 806                     ; 416 void CLK_SYSCLKSourceConfig(CLK_SYSCLKSource_TypeDef CLK_SYSCLKSource)
 806                     ; 417 {
 807                     .text:	section	.text,new
 808  0000               _CLK_SYSCLKSourceConfig:
 812                     ; 419   assert_param(IS_CLK_SOURCE(CLK_SYSCLKSource));
 814                     ; 422   CLK->SWR = (uint8_t)CLK_SYSCLKSource;
 816  0000 c750c8        	ld	20680,a
 817                     ; 423 }
 820  0003 81            	ret	
 845                     ; 435 CLK_SYSCLKSource_TypeDef CLK_GetSYSCLKSource(void)
 845                     ; 436 {
 846                     .text:	section	.text,new
 847  0000               _CLK_GetSYSCLKSource:
 851                     ; 437   return ((CLK_SYSCLKSource_TypeDef)(CLK->SCSR));
 853  0000 c650c7        	ld	a,20679
 856  0003 81            	ret	
 920                     ; 478 uint32_t CLK_GetClockFreq(void)
 920                     ; 479 {
 921                     .text:	section	.text,new
 922  0000               _CLK_GetClockFreq:
 924  0000 5209          	subw	sp,#9
 925       00000009      OFST:	set	9
 928                     ; 480   uint32_t clockfrequency = 0;
 930                     ; 481   uint32_t sourcefrequency = 0;
 932  0002 5f            	clrw	x
 933  0003 1f07          	ldw	(OFST-2,sp),x
 934  0005 1f05          	ldw	(OFST-4,sp),x
 935                     ; 482   CLK_SYSCLKSource_TypeDef clocksource = CLK_SYSCLKSource_HSI;
 937                     ; 483   uint8_t tmp = 0, presc = 0;
 941                     ; 486   clocksource = (CLK_SYSCLKSource_TypeDef)CLK->SCSR;
 943  0007 c650c7        	ld	a,20679
 944  000a 6b09          	ld	(OFST+0,sp),a
 945                     ; 488   if ( clocksource == CLK_SYSCLKSource_HSI)
 947  000c a101          	cp	a,#1
 948                     ; 490     sourcefrequency = HSI_VALUE;
 950  000e 2710          	jreq	LC002
 951                     ; 492   else if ( clocksource == CLK_SYSCLKSource_LSI)
 953  0010 a102          	cp	a,#2
 954  0012 2608          	jrne	L104
 955                     ; 494     sourcefrequency = LSI_VALUE;
 957  0014 ae9470        	ldw	x,#38000
 958  0017 1f07          	ldw	(OFST-2,sp),x
 959  0019 5f            	clrw	x
 961  001a 200c          	jp	LC001
 962  001c               L104:
 963                     ; 496   else if ( clocksource == CLK_SYSCLKSource_HSE)
 965  001c a104          	cp	a,#4
 966  001e 260a          	jrne	L504
 967                     ; 498     sourcefrequency = HSE_VALUE;
 969  0020               LC002:
 971  0020 ae2400        	ldw	x,#9216
 972  0023 1f07          	ldw	(OFST-2,sp),x
 973  0025 ae00f4        	ldw	x,#244
 974  0028               LC001:
 975  0028 1f05          	ldw	(OFST-4,sp),x
 977  002a               L504:
 978                     ; 502     clockfrequency = LSE_VALUE;
 980                     ; 506   tmp = (uint8_t)(CLK->CKDIVR & CLK_CKDIVR_CKM);
 982  002a c650c0        	ld	a,20672
 983  002d a407          	and	a,#7
 984                     ; 507   presc = SYSDivFactor[tmp];
 986  002f 5f            	clrw	x
 987  0030 97            	ld	xl,a
 988  0031 d60000        	ld	a,(_SYSDivFactor,x)
 989  0034 6b09          	ld	(OFST+0,sp),a
 990                     ; 510   clockfrequency = sourcefrequency / presc;
 992  0036 b703          	ld	c_lreg+3,a
 993  0038 3f02          	clr	c_lreg+2
 994  003a 3f01          	clr	c_lreg+1
 995  003c 3f00          	clr	c_lreg
 996  003e 96            	ldw	x,sp
 997  003f 5c            	incw	x
 998  0040 cd0000        	call	c_rtol
1000  0043 96            	ldw	x,sp
1001  0044 1c0005        	addw	x,#OFST-4
1002  0047 cd0000        	call	c_ltor
1004  004a 96            	ldw	x,sp
1005  004b 5c            	incw	x
1006  004c cd0000        	call	c_ludv
1008  004f 96            	ldw	x,sp
1009  0050 1c0005        	addw	x,#OFST-4
1010  0053 cd0000        	call	c_rtol
1012                     ; 512   return((uint32_t)clockfrequency);
1014  0056 96            	ldw	x,sp
1015  0057 1c0005        	addw	x,#OFST-4
1016  005a cd0000        	call	c_ltor
1020  005d 5b09          	addw	sp,#9
1021  005f 81            	ret	
1119                     ; 528 void CLK_SYSCLKDivConfig(CLK_SYSCLKDiv_TypeDef CLK_SYSCLKDiv)
1119                     ; 529 {
1120                     .text:	section	.text,new
1121  0000               _CLK_SYSCLKDivConfig:
1125                     ; 531   assert_param(IS_CLK_SYSTEM_DIVIDER(CLK_SYSCLKDiv));
1127                     ; 533   CLK->CKDIVR = (uint8_t)(CLK_SYSCLKDiv);
1129  0000 c750c0        	ld	20672,a
1130                     ; 534 }
1133  0003 81            	ret	
1169                     ; 541 void CLK_SYSCLKSourceSwitchCmd(FunctionalState NewState)
1169                     ; 542 {
1170                     .text:	section	.text,new
1171  0000               _CLK_SYSCLKSourceSwitchCmd:
1175                     ; 544   assert_param(IS_FUNCTIONAL_STATE(NewState));
1177                     ; 546   if (NewState != DISABLE)
1179  0000 4d            	tnz	a
1180  0001 2705          	jreq	L174
1181                     ; 549     CLK->SWCR |= CLK_SWCR_SWEN;
1183  0003 721250c9      	bset	20681,#1
1186  0007 81            	ret	
1187  0008               L174:
1188                     ; 554     CLK->SWCR &= (uint8_t)(~CLK_SWCR_SWEN);
1190  0008 721350c9      	bres	20681,#1
1191                     ; 556 }
1194  000c 81            	ret	
1340                     ; 616 void CLK_RTCClockConfig(CLK_RTCCLKSource_TypeDef CLK_RTCCLKSource, CLK_RTCCLKDiv_TypeDef CLK_RTCCLKDiv)
1340                     ; 617 {
1341                     .text:	section	.text,new
1342  0000               _CLK_RTCClockConfig:
1344  0000 89            	pushw	x
1345       00000000      OFST:	set	0
1348                     ; 619   assert_param(IS_CLK_CLOCK_RTC(CLK_RTCCLKSource));
1350                     ; 620   assert_param(IS_CLK_CLOCK_RTC_DIV(CLK_RTCCLKDiv));
1352                     ; 623   CLK->CRTCR = (uint8_t)((uint8_t)CLK_RTCCLKSource | (uint8_t)CLK_RTCCLKDiv);
1354  0001 9f            	ld	a,xl
1355  0002 1a01          	or	a,(OFST+1,sp)
1356  0004 c750c1        	ld	20673,a
1357                     ; 624 }
1360  0007 85            	popw	x
1361  0008 81            	ret	
1427                     ; 635 void CLK_BEEPClockConfig(CLK_BEEPCLKSource_TypeDef CLK_BEEPCLKSource)
1427                     ; 636 {
1428                     .text:	section	.text,new
1429  0000               _CLK_BEEPClockConfig:
1433                     ; 638   assert_param(IS_CLK_CLOCK_BEEP(CLK_BEEPCLKSource));
1435                     ; 641   CLK->CBEEPR = (uint8_t)(CLK_BEEPCLKSource);
1437  0000 c750cb        	ld	20683,a
1438                     ; 643 }
1441  0003 81            	ret	
1664                     ; 677 void CLK_PeripheralClockConfig(CLK_Peripheral_TypeDef CLK_Peripheral, FunctionalState NewState)
1664                     ; 678 {
1665                     .text:	section	.text,new
1666  0000               _CLK_PeripheralClockConfig:
1668  0000 89            	pushw	x
1669  0001 88            	push	a
1670       00000001      OFST:	set	1
1673                     ; 679   uint8_t reg = 0;
1675                     ; 682   assert_param(IS_CLK_PERIPHERAL(CLK_Peripheral));
1677                     ; 683   assert_param(IS_FUNCTIONAL_STATE(NewState));
1679                     ; 686   reg = (uint8_t)((uint8_t)CLK_Peripheral & (uint8_t)0xF0);
1681  0002 9e            	ld	a,xh
1682  0003 a4f0          	and	a,#240
1683  0005 6b01          	ld	(OFST+0,sp),a
1684                     ; 688   if ( reg == 0x00)
1686  0007 2629          	jrne	L117
1687                     ; 690     if (NewState != DISABLE)
1689  0009 7b03          	ld	a,(OFST+2,sp)
1690  000b 2712          	jreq	L317
1691                     ; 693       CLK->PCKENR1 |= (uint8_t)((uint8_t)1 << ((uint8_t)CLK_Peripheral & (uint8_t)0x0F));
1693  000d 7b02          	ld	a,(OFST+1,sp)
1694  000f ad72          	call	LC005
1695  0011 2704          	jreq	L64
1696  0013               L05:
1697  0013 48            	sll	a
1698  0014 5a            	decw	x
1699  0015 26fc          	jrne	L05
1700  0017               L64:
1701  0017 ca50c3        	or	a,20675
1702  001a c750c3        	ld	20675,a
1704  001d 2061          	jra	L717
1705  001f               L317:
1706                     ; 698       CLK->PCKENR1 &= (uint8_t)(~(uint8_t)(((uint8_t)1 << ((uint8_t)CLK_Peripheral & (uint8_t)0x0F))));
1708  001f 7b02          	ld	a,(OFST+1,sp)
1709  0021 ad60          	call	LC005
1710  0023 2704          	jreq	L25
1711  0025               L45:
1712  0025 48            	sll	a
1713  0026 5a            	decw	x
1714  0027 26fc          	jrne	L45
1715  0029               L25:
1716  0029 43            	cpl	a
1717  002a c450c3        	and	a,20675
1718  002d c750c3        	ld	20675,a
1719  0030 204e          	jra	L717
1720  0032               L117:
1721                     ; 701   else if (reg == 0x10)
1723  0032 a110          	cp	a,#16
1724  0034 2626          	jrne	L127
1725                     ; 703     if (NewState != DISABLE)
1727  0036 7b03          	ld	a,(OFST+2,sp)
1728  0038 270f          	jreq	L327
1729                     ; 706       CLK->PCKENR2 |= (uint8_t)((uint8_t)1 << ((uint8_t)CLK_Peripheral & (uint8_t)0x0F));
1731  003a 7b02          	ld	a,(OFST+1,sp)
1732  003c ad45          	call	LC005
1733  003e 2704          	jreq	L65
1734  0040               L06:
1735  0040 48            	sll	a
1736  0041 5a            	decw	x
1737  0042 26fc          	jrne	L06
1738  0044               L65:
1739  0044 ca50c4        	or	a,20676
1741  0047 200e          	jp	LC004
1742  0049               L327:
1743                     ; 711       CLK->PCKENR2 &= (uint8_t)(~(uint8_t)(((uint8_t)1 << ((uint8_t)CLK_Peripheral & (uint8_t)0x0F))));
1745  0049 7b02          	ld	a,(OFST+1,sp)
1746  004b ad36          	call	LC005
1747  004d 2704          	jreq	L26
1748  004f               L46:
1749  004f 48            	sll	a
1750  0050 5a            	decw	x
1751  0051 26fc          	jrne	L46
1752  0053               L26:
1753  0053 43            	cpl	a
1754  0054 c450c4        	and	a,20676
1755  0057               LC004:
1756  0057 c750c4        	ld	20676,a
1757  005a 2024          	jra	L717
1758  005c               L127:
1759                     ; 716     if (NewState != DISABLE)
1761  005c 7b03          	ld	a,(OFST+2,sp)
1762  005e 270f          	jreq	L137
1763                     ; 719       CLK->PCKENR3 |= (uint8_t)((uint8_t)1 << ((uint8_t)CLK_Peripheral & (uint8_t)0x0F));
1765  0060 7b02          	ld	a,(OFST+1,sp)
1766  0062 ad1f          	call	LC005
1767  0064 2704          	jreq	L66
1768  0066               L07:
1769  0066 48            	sll	a
1770  0067 5a            	decw	x
1771  0068 26fc          	jrne	L07
1772  006a               L66:
1773  006a ca50d0        	or	a,20688
1775  006d 200e          	jp	LC003
1776  006f               L137:
1777                     ; 724       CLK->PCKENR3 &= (uint8_t)(~(uint8_t)(((uint8_t)1 << ((uint8_t)CLK_Peripheral & (uint8_t)0x0F))));
1779  006f 7b02          	ld	a,(OFST+1,sp)
1780  0071 ad10          	call	LC005
1781  0073 2704          	jreq	L27
1782  0075               L47:
1783  0075 48            	sll	a
1784  0076 5a            	decw	x
1785  0077 26fc          	jrne	L47
1786  0079               L27:
1787  0079 43            	cpl	a
1788  007a c450d0        	and	a,20688
1789  007d               LC003:
1790  007d c750d0        	ld	20688,a
1791  0080               L717:
1792                     ; 727 }
1795  0080 5b03          	addw	sp,#3
1796  0082 81            	ret	
1797  0083               LC005:
1798  0083 a40f          	and	a,#15
1799  0085 5f            	clrw	x
1800  0086 97            	ld	xl,a
1801  0087 a601          	ld	a,#1
1802  0089 5d            	tnzw	x
1803  008a 81            	ret	
1827                     ; 765 void CLK_LSEClockSecuritySystemEnable(void)
1827                     ; 766 {
1828                     .text:	section	.text,new
1829  0000               _CLK_LSEClockSecuritySystemEnable:
1833                     ; 768   CSSLSE->CSR |= CSSLSE_CSR_CSSEN;
1835  0000 72105190      	bset	20880,#0
1836                     ; 769 }
1839  0004 81            	ret	
1863                     ; 777 void CLK_RTCCLKSwitchOnLSEFailureEnable(void)
1863                     ; 778 {
1864                     .text:	section	.text,new
1865  0000               _CLK_RTCCLKSwitchOnLSEFailureEnable:
1869                     ; 780   CSSLSE->CSR |= CSSLSE_CSR_SWITCHEN;
1871  0000 72125190      	bset	20880,#1
1872                     ; 781 }
1875  0004 81            	ret	
1950                     ; 807 void CLK_HaltConfig(CLK_Halt_TypeDef CLK_Halt, FunctionalState NewState)
1950                     ; 808 {
1951                     .text:	section	.text,new
1952  0000               _CLK_HaltConfig:
1954  0000 89            	pushw	x
1955       00000000      OFST:	set	0
1958                     ; 810   assert_param(IS_CLK_HALT(CLK_Halt));
1960                     ; 811   assert_param(IS_FUNCTIONAL_STATE(NewState));
1962                     ; 813   if (NewState != DISABLE)
1964  0001 9f            	ld	a,xl
1965  0002 4d            	tnz	a
1966  0003 2706          	jreq	L1101
1967                     ; 815     CLK->ICKCR |= (uint8_t)(CLK_Halt);
1969  0005 9e            	ld	a,xh
1970  0006 ca50c2        	or	a,20674
1972  0009 2006          	jra	L3101
1973  000b               L1101:
1974                     ; 819     CLK->ICKCR &= (uint8_t)(~CLK_Halt);
1976  000b 7b01          	ld	a,(OFST+1,sp)
1977  000d 43            	cpl	a
1978  000e c450c2        	and	a,20674
1979  0011               L3101:
1980  0011 c750c2        	ld	20674,a
1981                     ; 821 }
1984  0014 85            	popw	x
1985  0015 81            	ret	
2021                     ; 831 void CLK_MainRegulatorCmd(FunctionalState NewState)
2021                     ; 832 {
2022                     .text:	section	.text,new
2023  0000               _CLK_MainRegulatorCmd:
2027                     ; 834   assert_param(IS_FUNCTIONAL_STATE(NewState));
2029                     ; 836   if (NewState != DISABLE)
2031  0000 4d            	tnz	a
2032  0001 2705          	jreq	L3301
2033                     ; 839     CLK->REGCSR &= (uint8_t)(~CLK_REGCSR_REGOFF);
2035  0003 721350cf      	bres	20687,#1
2038  0007 81            	ret	
2039  0008               L3301:
2040                     ; 844     CLK->REGCSR |= CLK_REGCSR_REGOFF;
2042  0008 721250cf      	bset	20687,#1
2043                     ; 846 }
2046  000c 81            	ret	
2118                     ; 875 void CLK_ITConfig(CLK_IT_TypeDef CLK_IT, FunctionalState NewState)
2118                     ; 876 {
2119                     .text:	section	.text,new
2120  0000               _CLK_ITConfig:
2122  0000 89            	pushw	x
2123       00000000      OFST:	set	0
2126                     ; 879   assert_param(IS_CLK_IT(CLK_IT));
2128                     ; 880   assert_param(IS_FUNCTIONAL_STATE(NewState));
2130                     ; 882   if (NewState != DISABLE)
2132  0001 9f            	ld	a,xl
2133  0002 4d            	tnz	a
2134  0003 271d          	jreq	L3701
2135                     ; 884     if (CLK_IT == CLK_IT_SWIF)
2137  0005 9e            	ld	a,xh
2138  0006 a11c          	cp	a,#28
2139  0008 2606          	jrne	L5701
2140                     ; 887       CLK->SWCR |= CLK_SWCR_SWIEN;
2142  000a 721450c9      	bset	20681,#2
2144  000e 202c          	jra	L5011
2145  0010               L5701:
2146                     ; 889     else if (CLK_IT == CLK_IT_LSECSSF)
2148  0010 7b01          	ld	a,(OFST+1,sp)
2149  0012 a12c          	cp	a,#44
2150  0014 2606          	jrne	L1011
2151                     ; 892       CSSLSE->CSR |= CSSLSE_CSR_CSSIE;
2153  0016 72145190      	bset	20880,#2
2155  001a 2020          	jra	L5011
2156  001c               L1011:
2157                     ; 897       CLK->CSSR |= CLK_CSSR_CSSDIE;
2159  001c 721450ca      	bset	20682,#2
2160  0020 201a          	jra	L5011
2161  0022               L3701:
2162                     ; 902     if (CLK_IT == CLK_IT_SWIF)
2164  0022 7b01          	ld	a,(OFST+1,sp)
2165  0024 a11c          	cp	a,#28
2166  0026 2606          	jrne	L7011
2167                     ; 905       CLK->SWCR  &= (uint8_t)(~CLK_SWCR_SWIEN);
2169  0028 721550c9      	bres	20681,#2
2171  002c 200e          	jra	L5011
2172  002e               L7011:
2173                     ; 907     else if (CLK_IT == CLK_IT_LSECSSF)
2175  002e a12c          	cp	a,#44
2176  0030 2606          	jrne	L3111
2177                     ; 910       CSSLSE->CSR &= (uint8_t)(~CSSLSE_CSR_CSSIE);
2179  0032 72155190      	bres	20880,#2
2181  0036 2004          	jra	L5011
2182  0038               L3111:
2183                     ; 915       CLK->CSSR &= (uint8_t)(~CLK_CSSR_CSSDIE);
2185  0038 721550ca      	bres	20682,#2
2186  003c               L5011:
2187                     ; 918 }
2190  003c 85            	popw	x
2191  003d 81            	ret	
2410                     ; 945 FlagStatus CLK_GetFlagStatus(CLK_FLAG_TypeDef CLK_FLAG)
2410                     ; 946 {
2411                     .text:	section	.text,new
2412  0000               _CLK_GetFlagStatus:
2414  0000 88            	push	a
2415  0001 89            	pushw	x
2416       00000002      OFST:	set	2
2419                     ; 947   uint8_t reg = 0;
2421                     ; 948   uint8_t pos = 0;
2423                     ; 949   FlagStatus bitstatus = RESET;
2425                     ; 952   assert_param(IS_CLK_FLAGS(CLK_FLAG));
2427                     ; 955   reg = (uint8_t)((uint8_t)CLK_FLAG & (uint8_t)0xF0);
2429  0002 a4f0          	and	a,#240
2430  0004 6b02          	ld	(OFST+0,sp),a
2431                     ; 958   pos = (uint8_t)((uint8_t)CLK_FLAG & (uint8_t)0x0F);
2433  0006 7b03          	ld	a,(OFST+1,sp)
2434  0008 a40f          	and	a,#15
2435  000a 6b01          	ld	(OFST-1,sp),a
2436                     ; 960   if (reg == 0x00) /* The flag to check is in CRTC Rregister */
2438  000c 7b02          	ld	a,(OFST+0,sp)
2439  000e 2605          	jrne	L7221
2440                     ; 962     reg = CLK->CRTCR;
2442  0010 c650c1        	ld	a,20673
2444  0013 2042          	jra	L1321
2445  0015               L7221:
2446                     ; 964   else if (reg == 0x10) /* The flag to check is in ICKCR register */
2448  0015 a110          	cp	a,#16
2449  0017 2605          	jrne	L3321
2450                     ; 966     reg = CLK->ICKCR;
2452  0019 c650c2        	ld	a,20674
2454  001c 2039          	jra	L1321
2455  001e               L3321:
2456                     ; 968   else if (reg == 0x20) /* The flag to check is in CCOR register */
2458  001e a120          	cp	a,#32
2459  0020 2605          	jrne	L7321
2460                     ; 970     reg = CLK->CCOR;
2462  0022 c650c5        	ld	a,20677
2464  0025 2030          	jra	L1321
2465  0027               L7321:
2466                     ; 972   else if (reg == 0x30) /* The flag to check is in ECKCR register */
2468  0027 a130          	cp	a,#48
2469  0029 2605          	jrne	L3421
2470                     ; 974     reg = CLK->ECKCR;
2472  002b c650c6        	ld	a,20678
2474  002e 2027          	jra	L1321
2475  0030               L3421:
2476                     ; 976   else if (reg == 0x40) /* The flag to check is in SWCR register */
2478  0030 a140          	cp	a,#64
2479  0032 2605          	jrne	L7421
2480                     ; 978     reg = CLK->SWCR;
2482  0034 c650c9        	ld	a,20681
2484  0037 201e          	jra	L1321
2485  0039               L7421:
2486                     ; 980   else if (reg == 0x50) /* The flag to check is in CSSR register */
2488  0039 a150          	cp	a,#80
2489  003b 2605          	jrne	L3521
2490                     ; 982     reg = CLK->CSSR;
2492  003d c650ca        	ld	a,20682
2494  0040 2015          	jra	L1321
2495  0042               L3521:
2496                     ; 984   else if (reg == 0x70) /* The flag to check is in REGCSR register */
2498  0042 a170          	cp	a,#112
2499  0044 2605          	jrne	L7521
2500                     ; 986     reg = CLK->REGCSR;
2502  0046 c650cf        	ld	a,20687
2504  0049 200c          	jra	L1321
2505  004b               L7521:
2506                     ; 988   else if (reg == 0x80) /* The flag to check is in CSSLSE_CSRregister */
2508  004b a180          	cp	a,#128
2509  004d 2605          	jrne	L3621
2510                     ; 990     reg = CSSLSE->CSR;
2512  004f c65190        	ld	a,20880
2514  0052 2003          	jra	L1321
2515  0054               L3621:
2516                     ; 994     reg = CLK->CBEEPR;
2518  0054 c650cb        	ld	a,20683
2519  0057               L1321:
2520  0057 6b02          	ld	(OFST+0,sp),a
2521                     ; 998   if ((reg & (uint8_t)((uint8_t)1 << (uint8_t)pos)) != (uint8_t)RESET)
2523  0059 5f            	clrw	x
2524  005a 7b01          	ld	a,(OFST-1,sp)
2525  005c 97            	ld	xl,a
2526  005d a601          	ld	a,#1
2527  005f 5d            	tnzw	x
2528  0060 2704          	jreq	L211
2529  0062               L411:
2530  0062 48            	sll	a
2531  0063 5a            	decw	x
2532  0064 26fc          	jrne	L411
2533  0066               L211:
2534  0066 1402          	and	a,(OFST+0,sp)
2535  0068 2702          	jreq	L7621
2536                     ; 1000     bitstatus = SET;
2538  006a a601          	ld	a,#1
2540  006c               L7621:
2541                     ; 1004     bitstatus = RESET;
2543                     ; 1008   return((FlagStatus)bitstatus);
2547  006c 5b03          	addw	sp,#3
2548  006e 81            	ret	
2571                     ; 1016 void CLK_ClearFlag(void)
2571                     ; 1017 {
2572                     .text:	section	.text,new
2573  0000               _CLK_ClearFlag:
2577                     ; 1020   CSSLSE->CSR &= (uint8_t)(~CSSLSE_CSR_CSSF);
2579  0000 72175190      	bres	20880,#3
2580                     ; 1021 }
2583  0004 81            	ret	
2629                     ; 1032 ITStatus CLK_GetITStatus(CLK_IT_TypeDef CLK_IT)
2629                     ; 1033 {
2630                     .text:	section	.text,new
2631  0000               _CLK_GetITStatus:
2633  0000 88            	push	a
2634  0001 88            	push	a
2635       00000001      OFST:	set	1
2638                     ; 1035   ITStatus bitstatus = RESET;
2640                     ; 1038   assert_param(IS_CLK_IT(CLK_IT));
2642                     ; 1040   if (CLK_IT == CLK_IT_SWIF)
2644  0002 a11c          	cp	a,#28
2645  0004 2605          	jrne	L5231
2646                     ; 1043     if ((CLK->SWCR & (uint8_t)CLK_IT) == (uint8_t)0x0C)
2648  0006 c450c9        	and	a,20681
2649                     ; 1045       bitstatus = SET;
2651  0009 200b          	jp	LC008
2652                     ; 1049       bitstatus = RESET;
2653  000b               L5231:
2654                     ; 1052   else if (CLK_IT == CLK_IT_LSECSSF)
2656  000b 7b02          	ld	a,(OFST+1,sp)
2657  000d a12c          	cp	a,#44
2658  000f 260d          	jrne	L5331
2659                     ; 1055     if ((CSSLSE->CSR & (uint8_t)CLK_IT) == (uint8_t)0x0C)
2661  0011 c65190        	ld	a,20880
2662  0014 1402          	and	a,(OFST+1,sp)
2663  0016               LC008:
2664  0016 a10c          	cp	a,#12
2665  0018 260d          	jrne	L5431
2666                     ; 1057       bitstatus = SET;
2668  001a               LC007:
2671  001a a601          	ld	a,#1
2673  001c 200a          	jra	L3331
2674                     ; 1061       bitstatus = RESET;
2675  001e               L5331:
2676                     ; 1067     if ((CLK->CSSR & (uint8_t)CLK_IT) == (uint8_t)0x0C)
2678  001e c650ca        	ld	a,20682
2679  0021 1402          	and	a,(OFST+1,sp)
2680  0023 a10c          	cp	a,#12
2681                     ; 1069       bitstatus = SET;
2683  0025 27f3          	jreq	LC007
2684  0027               L5431:
2685                     ; 1073       bitstatus = RESET;
2689  0027 4f            	clr	a
2690  0028               L3331:
2691                     ; 1078   return bitstatus;
2695  0028 85            	popw	x
2696  0029 81            	ret	
2732                     ; 1089 void CLK_ClearITPendingBit(CLK_IT_TypeDef CLK_IT)
2732                     ; 1090 {
2733                     .text:	section	.text,new
2734  0000               _CLK_ClearITPendingBit:
2738                     ; 1093   assert_param(IS_CLK_CLEAR_IT(CLK_IT));
2740                     ; 1095   if ((uint8_t)((uint8_t)CLK_IT & (uint8_t)0xF0) == (uint8_t)0x20)
2742  0000 a4f0          	and	a,#240
2743  0002 a120          	cp	a,#32
2744  0004 2605          	jrne	L7631
2745                     ; 1098     CSSLSE->CSR &= (uint8_t)(~CSSLSE_CSR_CSSF);
2747  0006 72175190      	bres	20880,#3
2750  000a 81            	ret	
2751  000b               L7631:
2752                     ; 1103     CLK->SWCR &= (uint8_t)(~CLK_SWCR_SWIF);
2754  000b 721750c9      	bres	20681,#3
2755                     ; 1105 }
2758  000f 81            	ret	
2783                     	xdef	_SYSDivFactor
2784                     	xdef	_CLK_ClearITPendingBit
2785                     	xdef	_CLK_GetITStatus
2786                     	xdef	_CLK_ClearFlag
2787                     	xdef	_CLK_GetFlagStatus
2788                     	xdef	_CLK_ITConfig
2789                     	xdef	_CLK_MainRegulatorCmd
2790                     	xdef	_CLK_HaltConfig
2791                     	xdef	_CLK_RTCCLKSwitchOnLSEFailureEnable
2792                     	xdef	_CLK_LSEClockSecuritySystemEnable
2793                     	xdef	_CLK_PeripheralClockConfig
2794                     	xdef	_CLK_BEEPClockConfig
2795                     	xdef	_CLK_RTCClockConfig
2796                     	xdef	_CLK_SYSCLKSourceSwitchCmd
2797                     	xdef	_CLK_SYSCLKDivConfig
2798                     	xdef	_CLK_GetClockFreq
2799                     	xdef	_CLK_GetSYSCLKSource
2800                     	xdef	_CLK_SYSCLKSourceConfig
2801                     	xdef	_CLK_CCOConfig
2802                     	xdef	_CLK_ClockSecuritySytemDeglitchCmd
2803                     	xdef	_CLK_ClockSecuritySystemEnable
2804                     	xdef	_CLK_LSEConfig
2805                     	xdef	_CLK_HSEConfig
2806                     	xdef	_CLK_LSICmd
2807                     	xdef	_CLK_AdjustHSICalibrationValue
2808                     	xdef	_CLK_HSICmd
2809                     	xdef	_CLK_DeInit
2810                     	xref.b	c_lreg
2811                     	xref.b	c_x
2830                     	xref	c_ludv
2831                     	xref	c_rtol
2832                     	xref	c_ltor
2833                     	end
