   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.8.32 - 23 Mar 2010
   3                     ; Generator V4.3.4 - 23 Mar 2010
   4                     ; Optimizer V4.3.3 - 10 Feb 2010
  50                     ; 111 void COMP_DeInit(void)
  50                     ; 112 {
  52                     .text:	section	.text,new
  53  0000               _COMP_DeInit:
  57                     ; 114   COMP->CSR1 = (uint8_t) COMP_CSR1_RESET_VALUE;
  59  0000 725f5440      	clr	21568
  60                     ; 117   COMP->CSR2 = (uint8_t) COMP_CSR2_RESET_VALUE;
  62  0004 725f5441      	clr	21569
  63                     ; 120   COMP->CSR3 = (uint8_t) COMP_CSR3_RESET_VALUE;
  65  0008 35c05442      	mov	21570,#192
  66                     ; 123   COMP->CSR4 = (uint8_t) COMP_CSR4_RESET_VALUE;
  68  000c 725f5443      	clr	21571
  69                     ; 126   COMP->CSR5 = (uint8_t) COMP_CSR5_RESET_VALUE;
  71  0010 725f5444      	clr	21572
  72                     ; 127 }
  75  0014 81            	ret	
 251                     ; 153 void COMP_Init(COMP_InvertingInput_Typedef COMP_InvertingInput,
 251                     ; 154                COMP_OutputSelect_Typedef COMP_OutputSelect, COMP_Speed_TypeDef COMP_Speed)
 251                     ; 155 {
 252                     .text:	section	.text,new
 253  0000               _COMP_Init:
 255  0000 89            	pushw	x
 256       00000000      OFST:	set	0
 259                     ; 157   assert_param(IS_COMP_INVERTING_INPUT(COMP_InvertingInput));
 261                     ; 158   assert_param(IS_COMP_OUTPUT(COMP_OutputSelect));
 263                     ; 159   assert_param(IS_COMP_SPEED(COMP_Speed));
 265                     ; 162   COMP->CSR3 &= (uint8_t) (~COMP_CSR3_INSEL);
 267  0001 c65442        	ld	a,21570
 268  0004 a4c7          	and	a,#199
 269  0006 c75442        	ld	21570,a
 270                     ; 164   COMP->CSR3 |= (uint8_t) COMP_InvertingInput;
 272  0009 9e            	ld	a,xh
 273  000a ca5442        	or	a,21570
 274  000d c75442        	ld	21570,a
 275                     ; 167   COMP->CSR3 &= (uint8_t) (~COMP_CSR3_OUTSEL);
 277  0010 c65442        	ld	a,21570
 278  0013 a43f          	and	a,#63
 279  0015 c75442        	ld	21570,a
 280                     ; 169   COMP->CSR3 |= (uint8_t) COMP_OutputSelect;
 282  0018 9f            	ld	a,xl
 283  0019 ca5442        	or	a,21570
 284  001c c75442        	ld	21570,a
 285                     ; 172   COMP->CSR2 &= (uint8_t) (~COMP_CSR2_SPEED);
 287  001f 72155441      	bres	21569,#2
 288                     ; 174   COMP->CSR2 |= (uint8_t) COMP_Speed;
 290  0023 c65441        	ld	a,21569
 291  0026 1a05          	or	a,(OFST+5,sp)
 292  0028 c75441        	ld	21569,a
 293                     ; 175 }
 296  002b 85            	popw	x
 297  002c 81            	ret	
 353                     ; 183 void COMP_VrefintToCOMP1Connect(FunctionalState NewState)
 353                     ; 184 {
 354                     .text:	section	.text,new
 355  0000               _COMP_VrefintToCOMP1Connect:
 359                     ; 186   assert_param(IS_FUNCTIONAL_STATE(NewState));
 361                     ; 188   if (NewState != DISABLE)
 363  0000 4d            	tnz	a
 364  0001 2705          	jreq	L341
 365                     ; 191     COMP->CSR3 |= COMP_CSR3_VREFEN;
 367  0003 72145442      	bset	21570,#2
 370  0007 81            	ret	
 371  0008               L341:
 372                     ; 196     COMP->CSR3 &= (uint8_t)(~COMP_CSR3_VREFEN);
 374  0008 72155442      	bres	21570,#2
 375                     ; 198 }
 378  000c 81            	ret	
 473                     ; 212 void COMP_EdgeConfig(COMP_Selection_TypeDef COMP_Selection, COMP_Edge_TypeDef COMP_Edge)
 473                     ; 213 {
 474                     .text:	section	.text,new
 475  0000               _COMP_EdgeConfig:
 477  0000 89            	pushw	x
 478       00000000      OFST:	set	0
 481                     ; 215   assert_param(IS_COMP_ALL_PERIPH(COMP_Selection));
 483                     ; 216   assert_param(IS_COMP_EDGE(COMP_Edge));
 485                     ; 219   if (COMP_Selection == COMP_Selection_COMP1)
 487  0001 9e            	ld	a,xh
 488  0002 4a            	dec	a
 489  0003 2611          	jrne	L312
 490                     ; 222     COMP->CSR1 &= (uint8_t) (~COMP_CSR1_CMP1);
 492  0005 c65440        	ld	a,21568
 493  0008 a4fc          	and	a,#252
 494  000a c75440        	ld	21568,a
 495                     ; 225     COMP->CSR1 |= (uint8_t) COMP_Edge;
 497  000d 9f            	ld	a,xl
 498  000e ca5440        	or	a,21568
 499  0011 c75440        	ld	21568,a
 501  0014 2010          	jra	L512
 502  0016               L312:
 503                     ; 231     COMP->CSR2 &= (uint8_t) (~COMP_CSR2_CMP2);
 505  0016 c65441        	ld	a,21569
 506  0019 a4fc          	and	a,#252
 507  001b c75441        	ld	21569,a
 508                     ; 234     COMP->CSR2 |= (uint8_t) COMP_Edge;
 510  001e c65441        	ld	a,21569
 511  0021 1a02          	or	a,(OFST+2,sp)
 512  0023 c75441        	ld	21569,a
 513  0026               L512:
 514                     ; 236 }
 517  0026 85            	popw	x
 518  0027 81            	ret	
 584                     ; 251 COMP_OutputLevel_TypeDef COMP_GetOutputLevel(COMP_Selection_TypeDef COMP_Selection)
 584                     ; 252 {
 585                     .text:	section	.text,new
 586  0000               _COMP_GetOutputLevel:
 588  0000 88            	push	a
 589       00000001      OFST:	set	1
 592                     ; 256   assert_param(IS_COMP_ALL_PERIPH(COMP_Selection));
 594                     ; 259   if (COMP_Selection == COMP_Selection_COMP1)
 596  0001 4a            	dec	a
 597  0002 2609          	jrne	L742
 598                     ; 262     if ((COMP->CSR1 & COMP_CSR1_CMP1OUT) != (uint8_t) RESET)
 600  0004 7207544002    	btjf	21568,#3,L152
 601                     ; 265       compout = (COMP_OutputLevel_TypeDef) COMP_OutputLevel_High;
 603  0009 2007          	jp	LC002
 604  000b               L152:
 605                     ; 271       compout = (COMP_OutputLevel_TypeDef) COMP_OutputLevel_Low;
 606  000b 2009          	jp	L752
 607  000d               L742:
 608                     ; 278     if ((COMP->CSR2 & COMP_CSR2_CMP2OUT) != (uint8_t) RESET)
 610  000d 7207544104    	btjf	21569,#3,L752
 611                     ; 281       compout = (COMP_OutputLevel_TypeDef) COMP_OutputLevel_High;
 613  0012               LC002:
 615  0012 a601          	ld	a,#1
 617  0014 2001          	jra	L552
 618  0016               L752:
 619                     ; 287       compout = (COMP_OutputLevel_TypeDef) COMP_OutputLevel_Low;
 622  0016 4f            	clr	a
 623  0017               L552:
 624                     ; 292   return (COMP_OutputLevel_TypeDef)(compout);
 628  0017 5b01          	addw	sp,#1
 629  0019 81            	ret	
 664                     ; 324 void COMP_WindowCmd(FunctionalState NewState)
 664                     ; 325 {
 665                     .text:	section	.text,new
 666  0000               _COMP_WindowCmd:
 670                     ; 327   assert_param(IS_FUNCTIONAL_STATE(NewState));
 672                     ; 329   if (NewState != DISABLE)
 674  0000 4d            	tnz	a
 675  0001 2705          	jreq	L103
 676                     ; 332     COMP->CSR3 |= (uint8_t) COMP_CSR3_WNDWE;
 678  0003 72125442      	bset	21570,#1
 681  0007 81            	ret	
 682  0008               L103:
 683                     ; 337     COMP->CSR3 &= (uint8_t)(~COMP_CSR3_WNDWE);
 685  0008 72135442      	bres	21570,#1
 686                     ; 339 }
 689  000c 81            	ret	
 725                     ; 362 void COMP_VrefintOutputCmd(FunctionalState NewState)
 725                     ; 363 {
 726                     .text:	section	.text,new
 727  0000               _COMP_VrefintOutputCmd:
 731                     ; 365   assert_param(IS_FUNCTIONAL_STATE(NewState));
 733                     ; 367   if (NewState != DISABLE)
 735  0000 4d            	tnz	a
 736  0001 2705          	jreq	L323
 737                     ; 370     COMP->CSR3 |= (uint8_t) COMP_CSR3_VREFOUTEN;
 739  0003 72105442      	bset	21570,#0
 742  0007 81            	ret	
 743  0008               L323:
 744                     ; 375     COMP->CSR3 &= (uint8_t) (~COMP_CSR3_VREFOUTEN);
 746  0008 72115442      	bres	21570,#0
 747                     ; 377 }
 750  000c 81            	ret	
 786                     ; 401 void COMP_SchmittTriggerCmd(FunctionalState NewState)
 786                     ; 402 {
 787                     .text:	section	.text,new
 788  0000               _COMP_SchmittTriggerCmd:
 792                     ; 404   assert_param(IS_FUNCTIONAL_STATE(NewState));
 794                     ; 406   if (NewState != DISABLE)
 796  0000 4d            	tnz	a
 797  0001 2705          	jreq	L543
 798                     ; 409     COMP->CSR1 |= (uint8_t) COMP_CSR1_STE;
 800  0003 72145440      	bset	21568,#2
 803  0007 81            	ret	
 804  0008               L543:
 805                     ; 414     COMP->CSR1 &= (uint8_t) (~COMP_CSR1_STE);
 807  0008 72155440      	bres	21568,#2
 808                     ; 416 }
 811  000c 81            	ret	
 931                     ; 435 void COMP_TriggerConfig(COMP_TriggerGroup_TypeDef COMP_TriggerGroup,
 931                     ; 436                         COMP_TriggerPin_TypeDef COMP_TriggerPin,
 931                     ; 437                         FunctionalState NewState)
 931                     ; 438 {
 932                     .text:	section	.text,new
 933  0000               _COMP_TriggerConfig:
 935  0000 89            	pushw	x
 936       00000000      OFST:	set	0
 939                     ; 440   assert_param(IS_COMP_TRIGGERGROUP(COMP_TriggerGroup));
 941                     ; 441   assert_param(IS_COMP_TRIGGERPIN(COMP_TriggerPin));
 943                     ; 443   switch (COMP_TriggerGroup)
 945  0001 9e            	ld	a,xh
 947                     ; 490     default:
 947                     ; 491       break;
 948  0002 4a            	dec	a
 949  0003 270b          	jreq	L153
 950  0005 4a            	dec	a
 951  0006 2717          	jreq	L353
 952  0008 4a            	dec	a
 953  0009 2730          	jreq	L553
 954  000b 4a            	dec	a
 955  000c 2740          	jreq	L753
 956  000e 2058          	jra	L144
 957  0010               L153:
 958                     ; 445     case COMP_TriggerGroup_InvertingInput:
 958                     ; 446 
 958                     ; 447       if (NewState != DISABLE)
 960  0010 7b05          	ld	a,(OFST+5,sp)
 961  0012 2704          	jreq	L344
 962                     ; 449         COMP->CSR4 &= (uint8_t) ~COMP_TriggerPin;
 964  0014 7b02          	ld	a,(OFST+2,sp)
 966  0016 2010          	jp	LC005
 967  0018               L344:
 968                     ; 453         COMP->CSR4 |= (uint8_t) COMP_TriggerPin;
 970  0018 c65443        	ld	a,21571
 971  001b 1a02          	or	a,(OFST+2,sp)
 972  001d 2017          	jp	LC004
 973  001f               L353:
 974                     ; 457     case COMP_TriggerGroup_NonInvertingInput:
 974                     ; 458       if (NewState != DISABLE)
 976  001f 7b05          	ld	a,(OFST+5,sp)
 977  0021 270b          	jreq	L744
 978                     ; 460         COMP->CSR4 &= (uint8_t) ~((uint8_t)(COMP_TriggerPin << 3));
 980  0023 7b02          	ld	a,(OFST+2,sp)
 981  0025 48            	sll	a
 982  0026 48            	sll	a
 983  0027 48            	sll	a
 984  0028               LC005:
 985  0028 43            	cpl	a
 986  0029 c45443        	and	a,21571
 988  002c 2008          	jp	LC004
 989  002e               L744:
 990                     ; 464         COMP->CSR4 |= (uint8_t) (COMP_TriggerPin << 3);
 992  002e 7b02          	ld	a,(OFST+2,sp)
 993  0030 48            	sll	a
 994  0031 48            	sll	a
 995  0032 48            	sll	a
 996  0033 ca5443        	or	a,21571
 997  0036               LC004:
 998  0036 c75443        	ld	21571,a
 999  0039 202d          	jra	L144
1000  003b               L553:
1001                     ; 468     case COMP_TriggerGroup_VREFINTOutput:
1001                     ; 469       if (NewState != DISABLE)
1003  003b 7b05          	ld	a,(OFST+5,sp)
1004  003d 2708          	jreq	L354
1005                     ; 471         COMP->CSR5 &= (uint8_t) ~COMP_TriggerPin;
1007  003f 7b02          	ld	a,(OFST+2,sp)
1008  0041 43            	cpl	a
1009  0042 c45444        	and	a,21572
1011  0045 201e          	jp	LC003
1012  0047               L354:
1013                     ; 475         COMP->CSR5 |= (uint8_t) COMP_TriggerPin;
1015  0047 c65444        	ld	a,21572
1016  004a 1a02          	or	a,(OFST+2,sp)
1017  004c 2017          	jp	LC003
1018  004e               L753:
1019                     ; 479     case COMP_TriggerGroup_DACOutput:
1019                     ; 480       if (NewState != DISABLE)
1021  004e 7b05          	ld	a,(OFST+5,sp)
1022  0050 270b          	jreq	L754
1023                     ; 482         COMP->CSR5 &= (uint8_t) ~((uint8_t)(COMP_TriggerPin << 3));
1025  0052 7b02          	ld	a,(OFST+2,sp)
1026  0054 48            	sll	a
1027  0055 48            	sll	a
1028  0056 48            	sll	a
1029  0057 43            	cpl	a
1030  0058 c45444        	and	a,21572
1032  005b 2008          	jp	LC003
1033  005d               L754:
1034                     ; 486         COMP->CSR5 |= (uint8_t) (COMP_TriggerPin << 3);
1036  005d 7b02          	ld	a,(OFST+2,sp)
1037  005f 48            	sll	a
1038  0060 48            	sll	a
1039  0061 48            	sll	a
1040  0062 ca5444        	or	a,21572
1041  0065               LC003:
1042  0065 c75444        	ld	21572,a
1043                     ; 490     default:
1043                     ; 491       break;
1045  0068               L144:
1046                     ; 493 }
1049  0068 85            	popw	x
1050  0069 81            	ret	
1095                     ; 521 void COMP_ITConfig(COMP_Selection_TypeDef COMP_Selection, FunctionalState NewState)
1095                     ; 522 {
1096                     .text:	section	.text,new
1097  0000               _COMP_ITConfig:
1099  0000 89            	pushw	x
1100       00000000      OFST:	set	0
1103                     ; 524   assert_param(IS_COMP_ALL_PERIPH(COMP_Selection));
1105                     ; 525   assert_param(IS_FUNCTIONAL_STATE(NewState));
1107                     ; 528   if (COMP_Selection == COMP_Selection_COMP1)
1109  0001 9e            	ld	a,xh
1110  0002 4a            	dec	a
1111  0003 2610          	jrne	L505
1112                     ; 530     if (NewState != DISABLE)
1114  0005 9f            	ld	a,xl
1115  0006 4d            	tnz	a
1116  0007 2706          	jreq	L705
1117                     ; 533       COMP->CSR1 |= (uint8_t) COMP_CSR1_IE1;
1119  0009 721a5440      	bset	21568,#5
1121  000d 2014          	jra	L315
1122  000f               L705:
1123                     ; 538       COMP->CSR1 &= (uint8_t)(~COMP_CSR1_IE1);
1125  000f 721b5440      	bres	21568,#5
1126  0013 200e          	jra	L315
1127  0015               L505:
1128                     ; 543     if (NewState != DISABLE)
1130  0015 7b02          	ld	a,(OFST+2,sp)
1131  0017 2706          	jreq	L515
1132                     ; 546       COMP->CSR2 |= (uint8_t) COMP_CSR2_IE2;
1134  0019 721a5441      	bset	21569,#5
1136  001d 2004          	jra	L315
1137  001f               L515:
1138                     ; 551       COMP->CSR2 &= (uint8_t)(~COMP_CSR2_IE2);
1140  001f 721b5441      	bres	21569,#5
1141  0023               L315:
1142                     ; 554 }
1145  0023 85            	popw	x
1146  0024 81            	ret	
1212                     ; 564 FlagStatus COMP_GetFlagStatus(COMP_Selection_TypeDef COMP_Selection)
1212                     ; 565 {
1213                     .text:	section	.text,new
1214  0000               _COMP_GetFlagStatus:
1216  0000 88            	push	a
1217       00000001      OFST:	set	1
1220                     ; 566   FlagStatus bitstatus = RESET;
1222                     ; 569   assert_param(IS_COMP_ALL_PERIPH(COMP_Selection));
1224                     ; 572   if (COMP_Selection == COMP_Selection_COMP1)
1226  0001 4a            	dec	a
1227  0002 2609          	jrne	L355
1228                     ; 574     if ((COMP->CSR1 & COMP_CSR1_EF1) != (uint8_t) RESET)
1230  0004 7209544002    	btjf	21568,#4,L555
1231                     ; 577       bitstatus = SET;
1233  0009 2007          	jp	LC007
1234  000b               L555:
1235                     ; 582       bitstatus = RESET;
1236  000b 2009          	jp	L365
1237  000d               L355:
1238                     ; 587     if ((COMP->CSR2 & COMP_CSR2_EF2) != (uint8_t) RESET)
1240  000d 7209544104    	btjf	21569,#4,L365
1241                     ; 590       bitstatus = SET;
1243  0012               LC007:
1245  0012 a601          	ld	a,#1
1247  0014 2001          	jra	L165
1248  0016               L365:
1249                     ; 595       bitstatus = RESET;
1252  0016 4f            	clr	a
1253  0017               L165:
1254                     ; 600   return (FlagStatus)(bitstatus);
1258  0017 5b01          	addw	sp,#1
1259  0019 81            	ret	
1294                     ; 611 void COMP_ClearFlag(COMP_Selection_TypeDef COMP_Selection)
1294                     ; 612 {
1295                     .text:	section	.text,new
1296  0000               _COMP_ClearFlag:
1300                     ; 614   assert_param(IS_COMP_ALL_PERIPH(COMP_Selection));
1302                     ; 616   if (COMP_Selection == COMP_Selection_COMP1)
1304  0000 4a            	dec	a
1305  0001 2605          	jrne	L506
1306                     ; 619     COMP->CSR1 &= (uint8_t) (~COMP_CSR1_EF1);
1308  0003 72195440      	bres	21568,#4
1311  0007 81            	ret	
1312  0008               L506:
1313                     ; 624     COMP->CSR2 &= (uint8_t) (~COMP_CSR2_EF2);
1315  0008 72195441      	bres	21569,#4
1316                     ; 626 }
1319  000c 81            	ret	
1379                     ; 636 ITStatus COMP_GetITStatus(COMP_Selection_TypeDef COMP_Selection)
1379                     ; 637 {
1380                     .text:	section	.text,new
1381  0000               _COMP_GetITStatus:
1383  0000 89            	pushw	x
1384       00000002      OFST:	set	2
1387                     ; 638   ITStatus bitstatus = RESET;
1389                     ; 639   uint8_t itstatus = 0x00, itenable = 0x00;
1393                     ; 642   assert_param(IS_COMP_ALL_PERIPH(COMP_Selection));
1395                     ; 644   if (COMP_Selection == COMP_Selection_COMP1)
1397  0001 4a            	dec	a
1398  0002 2618          	jrne	L736
1399                     ; 647     itstatus = (uint8_t) (COMP->CSR1 & COMP_CSR1_EF1);
1401  0004 c65440        	ld	a,21568
1402  0007 a410          	and	a,#16
1403  0009 6b01          	ld	(OFST-1,sp),a
1404                     ; 650     itenable = (uint8_t) (COMP->CSR1 & COMP_CSR1_IE1);
1406  000b c65440        	ld	a,21568
1407  000e a420          	and	a,#32
1408  0010 6b02          	ld	(OFST+0,sp),a
1409                     ; 652     if ((itstatus != (uint8_t) RESET) && (itenable != (uint8_t) RESET))
1411  0012 7b01          	ld	a,(OFST-1,sp)
1412  0014 2720          	jreq	L746
1414  0016 7b02          	ld	a,(OFST+0,sp)
1415  0018 271c          	jreq	L746
1416                     ; 655       bitstatus = SET;
1418  001a 2016          	jp	LC009
1419                     ; 660       bitstatus = RESET;
1420  001c               L736:
1421                     ; 666     itstatus = (uint8_t) (COMP->CSR2 & COMP_CSR2_EF2);
1423  001c c65441        	ld	a,21569
1424  001f a410          	and	a,#16
1425  0021 6b01          	ld	(OFST-1,sp),a
1426                     ; 669     itenable = (uint8_t) (COMP->CSR2 & COMP_CSR2_IE2);
1428  0023 c65441        	ld	a,21569
1429  0026 a420          	and	a,#32
1430  0028 6b02          	ld	(OFST+0,sp),a
1431                     ; 671     if ((itstatus != (uint8_t)RESET) && (itenable != (uint8_t)RESET))
1433  002a 7b01          	ld	a,(OFST-1,sp)
1434  002c 2708          	jreq	L746
1436  002e 7b02          	ld	a,(OFST+0,sp)
1437  0030 2704          	jreq	L746
1438                     ; 674       bitstatus = SET;
1440  0032               LC009:
1442  0032 a601          	ld	a,#1
1444  0034 2001          	jra	L546
1445  0036               L746:
1446                     ; 679       bitstatus = RESET;
1449  0036 4f            	clr	a
1450  0037               L546:
1451                     ; 684   return (ITStatus) bitstatus;
1455  0037 85            	popw	x
1456  0038 81            	ret	
1492                     ; 695 void COMP_ClearITPendingBit(COMP_Selection_TypeDef COMP_Selection)
1492                     ; 696 {
1493                     .text:	section	.text,new
1494  0000               _COMP_ClearITPendingBit:
1498                     ; 698   assert_param(IS_COMP_ALL_PERIPH(COMP_Selection));
1500                     ; 700   if (COMP_Selection == COMP_Selection_COMP1)
1502  0000 4a            	dec	a
1503  0001 2605          	jrne	L176
1504                     ; 703     COMP->CSR1 &= (uint8_t) (~COMP_CSR1_EF1);
1506  0003 72195440      	bres	21568,#4
1509  0007 81            	ret	
1510  0008               L176:
1511                     ; 708     COMP->CSR2 &= (uint8_t) (~COMP_CSR2_EF2);
1513  0008 72195441      	bres	21569,#4
1514                     ; 710 }
1517  000c 81            	ret	
1530                     	xdef	_COMP_ClearITPendingBit
1531                     	xdef	_COMP_GetITStatus
1532                     	xdef	_COMP_ClearFlag
1533                     	xdef	_COMP_GetFlagStatus
1534                     	xdef	_COMP_ITConfig
1535                     	xdef	_COMP_TriggerConfig
1536                     	xdef	_COMP_SchmittTriggerCmd
1537                     	xdef	_COMP_VrefintOutputCmd
1538                     	xdef	_COMP_WindowCmd
1539                     	xdef	_COMP_GetOutputLevel
1540                     	xdef	_COMP_EdgeConfig
1541                     	xdef	_COMP_VrefintToCOMP1Connect
1542                     	xdef	_COMP_Init
1543                     	xdef	_COMP_DeInit
1562                     	end
