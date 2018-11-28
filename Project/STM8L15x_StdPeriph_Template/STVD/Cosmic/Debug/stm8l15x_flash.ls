   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.8.32 - 23 Mar 2010
   3                     ; Generator V4.3.4 - 23 Mar 2010
   4                     ; Optimizer V4.3.3 - 10 Feb 2010
  85                     ; 174 void FLASH_SetProgrammingTime(FLASH_ProgramTime_TypeDef FLASH_ProgTime)
  85                     ; 175 {
  87                     .text:	section	.text,new
  88  0000               _FLASH_SetProgrammingTime:
  92                     ; 177   assert_param(IS_FLASH_PROGRAM_TIME(FLASH_ProgTime));
  94                     ; 179   FLASH->CR1 &= (uint8_t)(~FLASH_CR1_FIX);
  96  0000 72115050      	bres	20560,#0
  97                     ; 180   FLASH->CR1 |= (uint8_t)FLASH_ProgTime;
  99  0004 ca5050        	or	a,20560
 100  0007 c75050        	ld	20560,a
 101                     ; 181 }
 104  000a 81            	ret	
 129                     ; 188 FLASH_ProgramTime_TypeDef FLASH_GetProgrammingTime(void)
 129                     ; 189 {
 130                     .text:	section	.text,new
 131  0000               _FLASH_GetProgrammingTime:
 135                     ; 190   return((FLASH_ProgramTime_TypeDef)(FLASH->CR1 & FLASH_CR1_FIX));
 137  0000 c65050        	ld	a,20560
 138  0003 a401          	and	a,#1
 141  0005 81            	ret	
 197                     ; 203 void FLASH_PowerWaitModeConfig(FLASH_Power_TypeDef FLASH_Power)
 197                     ; 204 {
 198                     .text:	section	.text,new
 199  0000               _FLASH_PowerWaitModeConfig:
 203                     ; 206   assert_param(IS_FLASH_POWER(FLASH_Power));
 205                     ; 209   if(FLASH_Power != FLASH_Power_On)
 207  0000 4a            	dec	a
 208  0001 2705          	jreq	L57
 209                     ; 211     FLASH->CR1 |= (uint8_t)FLASH_CR1_WAITM;
 211  0003 72145050      	bset	20560,#2
 214  0007 81            	ret	
 215  0008               L57:
 216                     ; 216     FLASH->CR1 &= (uint8_t)(~FLASH_CR1_WAITM);
 218  0008 72155050      	bres	20560,#2
 219                     ; 218 }
 222  000c 81            	ret	
 245                     ; 259 void FLASH_DeInit(void)
 245                     ; 260 {
 246                     .text:	section	.text,new
 247  0000               _FLASH_DeInit:
 251                     ; 261   FLASH->CR1 = FLASH_CR1_RESET_VALUE;
 253  0000 725f5050      	clr	20560
 254                     ; 262   FLASH->CR2 = FLASH_CR2_RESET_VALUE;
 256  0004 725f5051      	clr	20561
 257                     ; 263   FLASH->IAPSR = FLASH_IAPSR_RESET_VALUE;
 259  0008 35405054      	mov	20564,#64
 260                     ; 264   (void) FLASH->IAPSR; /* Reading of this register causes the clearing of status flags */
 262  000c c65054        	ld	a,20564
 263                     ; 265 }
 266  000f 81            	ret	
 322                     ; 275 void FLASH_Unlock(FLASH_MemType_TypeDef FLASH_MemType)
 322                     ; 276 {
 323                     .text:	section	.text,new
 324  0000               _FLASH_Unlock:
 326  0000 88            	push	a
 327       00000000      OFST:	set	0
 330                     ; 278   assert_param(IS_FLASH_MEMORY_TYPE(FLASH_MemType));
 332                     ; 281   if(FLASH_MemType == FLASH_MemType_Program)
 334  0001 a1fd          	cp	a,#253
 335  0003 2608          	jrne	L731
 336                     ; 283     FLASH->PUKR = FLASH_RASS_KEY1;
 338  0005 35565052      	mov	20562,#86
 339                     ; 284     FLASH->PUKR = FLASH_RASS_KEY2;
 341  0009 35ae5052      	mov	20562,#174
 342  000d               L731:
 343                     ; 288   if(FLASH_MemType == FLASH_MemType_Data)
 345  000d 7b01          	ld	a,(OFST+1,sp)
 346  000f a1f7          	cp	a,#247
 347  0011 2608          	jrne	L141
 348                     ; 290     FLASH->DUKR = FLASH_RASS_KEY2; /* Warning: keys are reversed on data memory !!! */
 350  0013 35ae5053      	mov	20563,#174
 351                     ; 291     FLASH->DUKR = FLASH_RASS_KEY1;
 353  0017 35565053      	mov	20563,#86
 354  001b               L141:
 355                     ; 293 }
 358  001b 84            	pop	a
 359  001c 81            	ret	
 394                     ; 303 void FLASH_Lock(FLASH_MemType_TypeDef FLASH_MemType)
 394                     ; 304 {
 395                     .text:	section	.text,new
 396  0000               _FLASH_Lock:
 400                     ; 306   assert_param(IS_FLASH_MEMORY_TYPE(FLASH_MemType));
 402                     ; 309   FLASH->IAPSR &= (uint8_t)FLASH_MemType;
 404  0000 c45054        	and	a,20564
 405  0003 c75054        	ld	20564,a
 406                     ; 310 }
 409  0006 81            	ret	
 448                     ; 318 void FLASH_ProgramByte(uint32_t Address, uint8_t Data)
 448                     ; 319 {
 449                     .text:	section	.text,new
 450  0000               _FLASH_ProgramByte:
 452       00000000      OFST:	set	0
 455                     ; 321   assert_param(IS_FLASH_ADDRESS(Address));
 457                     ; 323   *(PointerAttr uint8_t*) (MemoryAddressCast)Address = Data;
 459  0000 1e05          	ldw	x,(OFST+5,sp)
 460  0002 7b07          	ld	a,(OFST+7,sp)
 461  0004 f7            	ld	(x),a
 462                     ; 324 }
 465  0005 81            	ret	
 497                     ; 331 void FLASH_EraseByte(uint32_t Address)
 497                     ; 332 {
 498                     .text:	section	.text,new
 499  0000               _FLASH_EraseByte:
 501       00000000      OFST:	set	0
 504                     ; 334   assert_param(IS_FLASH_ADDRESS(Address));
 506                     ; 336   *(PointerAttr uint8_t*) (MemoryAddressCast)Address = FLASH_CLEAR_BYTE; /* Erase byte */
 508  0000 1e05          	ldw	x,(OFST+5,sp)
 509  0002 7f            	clr	(x)
 510                     ; 337 }
 513  0003 81            	ret	
 552                     ; 345 void FLASH_ProgramWord(uint32_t Address, uint32_t Data)
 552                     ; 346 {
 553                     .text:	section	.text,new
 554  0000               _FLASH_ProgramWord:
 556       00000000      OFST:	set	0
 559                     ; 348   assert_param(IS_FLASH_ADDRESS(Address));
 561                     ; 350   FLASH->CR2 |= FLASH_CR2_WPRG;
 563  0000 721c5051      	bset	20561,#6
 564                     ; 353   *((PointerAttr uint8_t*)(MemoryAddressCast)Address)       = *((uint8_t*)(&Data));   
 566  0004 1e05          	ldw	x,(OFST+5,sp)
 567  0006 7b07          	ld	a,(OFST+7,sp)
 568  0008 f7            	ld	(x),a
 569                     ; 355   *(((PointerAttr uint8_t*)(MemoryAddressCast)Address) + 1) = *((uint8_t*)(&Data) + 1);
 571  0009 7b08          	ld	a,(OFST+8,sp)
 572  000b e701          	ld	(1,x),a
 573                     ; 357   *(((PointerAttr uint8_t*)(MemoryAddressCast)Address) + 2) = *((uint8_t*)(&Data) + 2); 
 575  000d 7b09          	ld	a,(OFST+9,sp)
 576  000f e702          	ld	(2,x),a
 577                     ; 359   *(((PointerAttr uint8_t*)(MemoryAddressCast)Address) + 3) = *((uint8_t*)(&Data) + 3); 
 579  0011 7b0a          	ld	a,(OFST+10,sp)
 580  0013 e703          	ld	(3,x),a
 581                     ; 360 }
 584  0015 81            	ret	
 616                     ; 367 uint8_t FLASH_ReadByte(uint32_t Address)
 616                     ; 368 {
 617                     .text:	section	.text,new
 618  0000               _FLASH_ReadByte:
 620       00000000      OFST:	set	0
 623                     ; 370   return(*(PointerAttr uint8_t *) (MemoryAddressCast)Address);
 625  0000 1e05          	ldw	x,(OFST+5,sp)
 626  0002 f6            	ld	a,(x)
 629  0003 81            	ret	
 670                     ; 417 void FLASH_ProgramOptionByte(uint16_t Address, uint8_t Data)
 670                     ; 418 {
 671                     .text:	section	.text,new
 672  0000               _FLASH_ProgramOptionByte:
 674       00000000      OFST:	set	0
 677                     ; 420   assert_param(IS_OPTION_BYTE_ADDRESS(Address));
 679                     ; 423   FLASH->CR2 |= FLASH_CR2_OPT;
 681  0000 721e5051      	bset	20561,#7
 682  0004 89            	pushw	x
 683                     ; 426   *((PointerAttr uint8_t*)Address) = Data;
 685  0005 1e01          	ldw	x,(OFST+1,sp)
 686  0007 7b05          	ld	a,(OFST+5,sp)
 687  0009 f7            	ld	(x),a
 688                     ; 428   FLASH_WaitForLastOperation(FLASH_MemType_Program);
 690  000a a6fd          	ld	a,#253
 691  000c cd0000        	call	_FLASH_WaitForLastOperation
 693                     ; 431   FLASH->CR2 &= (uint8_t)(~FLASH_CR2_OPT);
 695  000f 721f5051      	bres	20561,#7
 696                     ; 432 }
 699  0013 85            	popw	x
 700  0014 81            	ret	
 734                     ; 439 void FLASH_EraseOptionByte(uint16_t Address)
 734                     ; 440 {
 735                     .text:	section	.text,new
 736  0000               _FLASH_EraseOptionByte:
 740                     ; 442   assert_param(IS_OPTION_BYTE_ADDRESS(Address));
 742                     ; 445   FLASH->CR2 |= FLASH_CR2_OPT;
 744  0000 721e5051      	bset	20561,#7
 745                     ; 448   *((PointerAttr uint8_t*)Address) = FLASH_CLEAR_BYTE;
 747  0004 7f            	clr	(x)
 748                     ; 450   FLASH_WaitForLastOperation(FLASH_MemType_Program);
 750  0005 a6fd          	ld	a,#253
 751  0007 cd0000        	call	_FLASH_WaitForLastOperation
 753                     ; 453   FLASH->CR2 &= (uint8_t)(~FLASH_CR2_OPT);
 755  000a 721f5051      	bres	20561,#7
 756                     ; 454 }
 759  000e 81            	ret	
 816                     ; 462 FunctionalState FLASH_GetReadOutProtectionStatus(void)
 816                     ; 463 {
 817                     .text:	section	.text,new
 818  0000               _FLASH_GetReadOutProtectionStatus:
 820  0000 88            	push	a
 821       00000001      OFST:	set	1
 824                     ; 464   FunctionalState state = DISABLE;
 826                     ; 466   if(OPT->ROP == FLASH_READOUTPROTECTION_KEY)
 828  0001 c64800        	ld	a,18432
 829  0004 a1aa          	cp	a,#170
 830  0006 2604          	jrne	L523
 831                     ; 469     state =  ENABLE;
 833  0008 a601          	ld	a,#1
 835  000a 2001          	jra	L723
 836  000c               L523:
 837                     ; 474     state =  DISABLE;
 839  000c 4f            	clr	a
 840  000d               L723:
 841                     ; 477   return state;
 845  000d 5b01          	addw	sp,#1
 846  000f 81            	ret	
 878                     ; 485 uint16_t FLASH_GetBootSize(void)
 878                     ; 486 {
 879                     .text:	section	.text,new
 880  0000               _FLASH_GetBootSize:
 882  0000 89            	pushw	x
 883       00000002      OFST:	set	2
 886                     ; 487   uint16_t temp = 0;
 888                     ; 490   temp = (uint16_t)((uint16_t)OPT->UBC * (uint16_t)128);
 890  0001 c64802        	ld	a,18434
 891  0004 5f            	clrw	x
 892  0005 97            	ld	xl,a
 893  0006 4f            	clr	a
 894  0007 02            	rlwa	x,a
 895  0008 44            	srl	a
 896  0009 56            	rrcw	x
 897                     ; 493   if(OPT->UBC > 0x7F)
 899  000a c64802        	ld	a,18434
 900  000d a180          	cp	a,#128
 901  000f 2503          	jrult	L543
 902                     ; 495     temp = 8192;
 904  0011 ae2000        	ldw	x,#8192
 905  0014               L543:
 906                     ; 499   return(temp);
 910  0014 5b02          	addw	sp,#2
 911  0016 81            	ret	
 943                     ; 508 uint16_t FLASH_GetCodeSize(void)
 943                     ; 509 {
 944                     .text:	section	.text,new
 945  0000               _FLASH_GetCodeSize:
 947  0000 89            	pushw	x
 948       00000002      OFST:	set	2
 951                     ; 510   uint16_t temp = 0;
 953                     ; 513   temp = (uint16_t)((uint16_t)OPT->PCODESIZE * (uint16_t)128);
 955  0001 c64807        	ld	a,18439
 956  0004 5f            	clrw	x
 957  0005 97            	ld	xl,a
 958  0006 4f            	clr	a
 959  0007 02            	rlwa	x,a
 960  0008 44            	srl	a
 961  0009 56            	rrcw	x
 962                     ; 516   if(OPT->PCODESIZE > 0x7F)
 964  000a c64807        	ld	a,18439
 965  000d a180          	cp	a,#128
 966  000f 2503          	jrult	L363
 967                     ; 518     temp = 8192;
 969  0011 ae2000        	ldw	x,#8192
 970  0014               L363:
 971                     ; 522   return(temp);
 975  0014 5b02          	addw	sp,#2
 976  0016 81            	ret	
1011                     ; 547 void FLASH_ITConfig(FunctionalState NewState)
1011                     ; 548 {
1012                     .text:	section	.text,new
1013  0000               _FLASH_ITConfig:
1017                     ; 550   assert_param(IS_FUNCTIONAL_STATE(NewState));
1019                     ; 552   if(NewState != DISABLE)
1021  0000 4d            	tnz	a
1022  0001 2705          	jreq	L304
1023                     ; 555     FLASH->CR1 |= FLASH_CR1_IE;
1025  0003 72125050      	bset	20560,#1
1028  0007 81            	ret	
1029  0008               L304:
1030                     ; 560     FLASH->CR1 &= (uint8_t)(~FLASH_CR1_IE);
1032  0008 72135050      	bres	20560,#1
1033                     ; 562 }
1036  000c 81            	ret	
1145                     ; 576 FlagStatus FLASH_GetFlagStatus(FLASH_FLAG_TypeDef FLASH_FLAG)
1145                     ; 577 {
1146                     .text:	section	.text,new
1147  0000               _FLASH_GetFlagStatus:
1149  0000 88            	push	a
1150       00000001      OFST:	set	1
1153                     ; 578   FlagStatus status = RESET;
1155                     ; 579   assert_param(IS_FLASH_FLAGS(FLASH_FLAG));
1157                     ; 582   if((FLASH->IAPSR  & (uint8_t)FLASH_FLAG) != (uint8_t)RESET)
1159  0001 c45054        	and	a,20564
1160  0004 2702          	jreq	L754
1161                     ; 584     status = SET; /* Flash_FLAG is set*/
1163  0006 a601          	ld	a,#1
1165  0008               L754:
1166                     ; 588     status = RESET; /* Flash_FLAG is reset*/
1168                     ; 592   return status;
1172  0008 5b01          	addw	sp,#1
1173  000a 81            	ret	
1209                     ; 719 IN_RAM(void FLASH_PowerRunModeConfig(FLASH_Power_TypeDef FLASH_Power))
1209                     ; 720 {
1210                     .text:	section	.text,new
1211  0000               _FLASH_PowerRunModeConfig:
1215                     ; 722   assert_param(IS_FLASH_POWER(FLASH_Power));
1217                     ; 724   if(FLASH_Power != FLASH_Power_On)
1219  0000 4a            	dec	a
1220  0001 2705          	jreq	L105
1221                     ; 726     FLASH->CR1 |= (uint8_t)FLASH_CR1_EEPM;
1223  0003 72165050      	bset	20560,#3
1226  0007 81            	ret	
1227  0008               L105:
1228                     ; 730     FLASH->CR1 &= (uint8_t)(~FLASH_CR1_EEPM);
1230  0008 72175050      	bres	20560,#3
1231                     ; 732 }
1234  000c 81            	ret	
1298                     ; 745 IN_RAM(FLASH_PowerStatus_TypeDef FLASH_GetPowerStatus(void))
1298                     ; 746 {
1299                     .text:	section	.text,new
1300  0000               _FLASH_GetPowerStatus:
1304                     ; 747   return((FLASH_PowerStatus_TypeDef)(FLASH->CR1 & (uint8_t)0x0C));
1306  0000 c65050        	ld	a,20560
1307  0003 a40c          	and	a,#12
1310  0005 81            	ret	
1408                     ; 765 IN_RAM(void FLASH_ProgramBlock(uint16_t BlockNum, FLASH_MemType_TypeDef FLASH_MemType,
1408                     ; 766                         FLASH_ProgramMode_TypeDef FLASH_ProgMode, uint8_t *Buffer))
1408                     ; 767 {
1409                     .text:	section	.text,new
1410  0000               _FLASH_ProgramBlock:
1412  0000 89            	pushw	x
1413  0001 5206          	subw	sp,#6
1414       00000006      OFST:	set	6
1417                     ; 768   uint16_t Count = 0;
1419                     ; 769   uint32_t startaddress = 0;
1421                     ; 772   assert_param(IS_FLASH_MEMORY_TYPE(FLASH_MemType));
1423                     ; 773   assert_param(IS_FLASH_PROGRAM_MODE(FLASH_ProgMode));
1425                     ; 774   if(FLASH_MemType == FLASH_MemType_Program)
1427  0003 7b0b          	ld	a,(OFST+5,sp)
1428  0005 a1fd          	cp	a,#253
1429  0007 2605          	jrne	L575
1430                     ; 776     assert_param(IS_FLASH_PROGRAM_BLOCK_NUMBER(BlockNum));
1432                     ; 777     startaddress = FLASH_PROGRAM_START_PHYSICAL_ADDRESS;
1434  0009 ae8000        	ldw	x,#32768
1436  000c 2003          	jra	L775
1437  000e               L575:
1438                     ; 781     assert_param(IS_FLASH_DATA_EEPROM_BLOCK_NUMBER(BlockNum));
1440                     ; 782     startaddress = FLASH_DATA_EEPROM_START_PHYSICAL_ADDRESS;
1442  000e ae1000        	ldw	x,#4096
1443  0011               L775:
1444  0011 1f03          	ldw	(OFST-3,sp),x
1445  0013 5f            	clrw	x
1446  0014 1f01          	ldw	(OFST-5,sp),x
1447                     ; 786   startaddress = startaddress + ((uint32_t)BlockNum * FLASH_BLOCK_SIZE);
1449  0016 a680          	ld	a,#128
1450  0018 1e07          	ldw	x,(OFST+1,sp)
1451  001a cd0000        	call	c_cmulx
1453  001d 96            	ldw	x,sp
1454  001e 5c            	incw	x
1455  001f cd0000        	call	c_lgadd
1457                     ; 789   if(FLASH_ProgMode == FLASH_ProgramMode_Standard)
1459  0022 7b0c          	ld	a,(OFST+6,sp)
1460  0024 2606          	jrne	L106
1461                     ; 792     FLASH->CR2 |= FLASH_CR2_PRG;
1463  0026 72105051      	bset	20561,#0
1465  002a 2004          	jra	L306
1466  002c               L106:
1467                     ; 797     FLASH->CR2 |= FLASH_CR2_FPRG;
1469  002c 72185051      	bset	20561,#4
1470  0030               L306:
1471                     ; 801   for(Count = 0; Count < FLASH_BLOCK_SIZE; Count++)
1473  0030 5f            	clrw	x
1474  0031 1f05          	ldw	(OFST-1,sp),x
1475  0033               L506:
1476                     ; 803     *((PointerAttr uint8_t*) (MemoryAddressCast)startaddress + Count) = ((uint8_t)(Buffer[Count]));
1478  0033 1e0d          	ldw	x,(OFST+7,sp)
1479  0035 72fb05        	addw	x,(OFST-1,sp)
1480  0038 f6            	ld	a,(x)
1481  0039 1e03          	ldw	x,(OFST-3,sp)
1482  003b 72fb05        	addw	x,(OFST-1,sp)
1483  003e f7            	ld	(x),a
1484                     ; 801   for(Count = 0; Count < FLASH_BLOCK_SIZE; Count++)
1486  003f 1e05          	ldw	x,(OFST-1,sp)
1487  0041 5c            	incw	x
1488  0042 1f05          	ldw	(OFST-1,sp),x
1491  0044 a30080        	cpw	x,#128
1492  0047 25ea          	jrult	L506
1493                     ; 805 }
1496  0049 5b08          	addw	sp,#8
1497  004b 81            	ret	
1556                     ; 817 IN_RAM(void FLASH_EraseBlock(uint16_t BlockNum, FLASH_MemType_TypeDef FLASH_MemType))
1556                     ; 818 {
1557                     .text:	section	.text,new
1558  0000               _FLASH_EraseBlock:
1560  0000 89            	pushw	x
1561  0001 5206          	subw	sp,#6
1562       00000006      OFST:	set	6
1565                     ; 819   uint32_t startaddress = 0;
1567                     ; 829   assert_param(IS_FLASH_MEMORY_TYPE(FLASH_MemType));
1569                     ; 830   if(FLASH_MemType == FLASH_MemType_Program)
1571  0003 7b0b          	ld	a,(OFST+5,sp)
1572  0005 a1fd          	cp	a,#253
1573  0007 2605          	jrne	L146
1574                     ; 832     assert_param(IS_FLASH_PROGRAM_BLOCK_NUMBER(BlockNum));
1576                     ; 833     startaddress = FLASH_PROGRAM_START_PHYSICAL_ADDRESS;
1578  0009 ae8000        	ldw	x,#32768
1580  000c 2003          	jra	L346
1581  000e               L146:
1582                     ; 837     assert_param(IS_FLASH_DATA_EEPROM_BLOCK_NUMBER(BlockNum));
1584                     ; 838     startaddress = FLASH_DATA_EEPROM_START_PHYSICAL_ADDRESS;
1586  000e ae1000        	ldw	x,#4096
1587  0011               L346:
1588  0011 1f05          	ldw	(OFST-1,sp),x
1589  0013 5f            	clrw	x
1590  0014 1f03          	ldw	(OFST-3,sp),x
1591                     ; 844     pwFlash = (PointerAttr uint32_t *)(uint16_t)(startaddress + ((uint32_t)BlockNum * FLASH_BLOCK_SIZE));
1593  0016 a680          	ld	a,#128
1594  0018 1e07          	ldw	x,(OFST+1,sp)
1595  001a cd0000        	call	c_cmulx
1597  001d 96            	ldw	x,sp
1598  001e 1c0003        	addw	x,#OFST-3
1599  0021 cd0000        	call	c_ladd
1601  0024 be02          	ldw	x,c_lreg+2
1602  0026 1f01          	ldw	(OFST-5,sp),x
1603                     ; 851   FLASH->CR2 |= FLASH_CR2_ERASE;
1605                     ; 855     *pwFlash = (uint32_t)0;  
1607  0028 4f            	clr	a
1608  0029 721a5051      	bset	20561,#5
1609  002d e703          	ld	(3,x),a
1610  002f e702          	ld	(2,x),a
1611  0031 e701          	ld	(1,x),a
1612  0033 f7            	ld	(x),a
1613                     ; 863 }
1616  0034 5b08          	addw	sp,#8
1617  0036 81            	ret	
1698                     ; 875 IN_RAM(FLASH_Status_TypeDef FLASH_WaitForLastOperation(FLASH_MemType_TypeDef FLASH_MemType))
1698                     ; 876 {
1699                     .text:	section	.text,new
1700  0000               _FLASH_WaitForLastOperation:
1702  0000 5203          	subw	sp,#3
1703       00000003      OFST:	set	3
1706                     ; 877   uint16_t timeout = OPERATION_TIMEOUT;
1708  0002 aeffff        	ldw	x,#65535
1709  0005 1f01          	ldw	(OFST-2,sp),x
1710                     ; 878   uint8_t flagstatus = 0x00;
1712  0007 0f03          	clr	(OFST+0,sp)
1713                     ; 881   if(FLASH_MemType == FLASH_MemType_Program)
1715  0009 a1fd          	cp	a,#253
1716  000b 2620          	jrne	L717
1718  000d 200a          	jra	L507
1719  000f               L307:
1720                     ; 885       flagstatus = (uint8_t)(FLASH->IAPSR & (uint8_t)(FLASH_IAPSR_EOP |
1720                     ; 886                                                       FLASH_IAPSR_WR_PG_DIS));
1722  000f c65054        	ld	a,20564
1723  0012 a405          	and	a,#5
1724  0014 6b03          	ld	(OFST+0,sp),a
1725                     ; 887       timeout--;
1727  0016 5a            	decw	x
1728  0017 1f01          	ldw	(OFST-2,sp),x
1729  0019               L507:
1730                     ; 883     while((flagstatus == 0x00) && (timeout != 0x00))
1732  0019 7b03          	ld	a,(OFST+0,sp)
1733  001b 2618          	jrne	L317
1735  001d 1e01          	ldw	x,(OFST-2,sp)
1736  001f 26ee          	jrne	L307
1737  0021 2012          	jra	L317
1738  0023               L517:
1739                     ; 894       flagstatus = (uint8_t)(FLASH->IAPSR & (uint8_t)(FLASH_IAPSR_HVOFF |
1739                     ; 895                                                       FLASH_IAPSR_WR_PG_DIS));
1741  0023 c65054        	ld	a,20564
1742  0026 a441          	and	a,#65
1743  0028 6b03          	ld	(OFST+0,sp),a
1744                     ; 896       timeout--;
1746  002a 5a            	decw	x
1747  002b 1f01          	ldw	(OFST-2,sp),x
1748  002d               L717:
1749                     ; 892     while((flagstatus == 0x00) && (timeout != 0x00))
1751  002d 7b03          	ld	a,(OFST+0,sp)
1752  002f 2604          	jrne	L317
1754  0031 1e01          	ldw	x,(OFST-2,sp)
1755  0033 26ee          	jrne	L517
1756  0035               L317:
1757                     ; 900   if(timeout == 0x00)
1759  0035 1e01          	ldw	x,(OFST-2,sp)
1760  0037 2602          	jrne	L527
1761                     ; 902     flagstatus = FLASH_Status_TimeOut;
1763  0039 a602          	ld	a,#2
1764  003b               L527:
1765                     ; 905   return((FLASH_Status_TypeDef)flagstatus);
1769  003b 5b03          	addw	sp,#3
1770  003d 81            	ret	
1783                     	xdef	_FLASH_WaitForLastOperation
1784                     	xdef	_FLASH_EraseBlock
1785                     	xdef	_FLASH_ProgramBlock
1786                     	xdef	_FLASH_GetPowerStatus
1787                     	xdef	_FLASH_PowerRunModeConfig
1788                     	xdef	_FLASH_GetFlagStatus
1789                     	xdef	_FLASH_ITConfig
1790                     	xdef	_FLASH_EraseOptionByte
1791                     	xdef	_FLASH_ProgramOptionByte
1792                     	xdef	_FLASH_GetReadOutProtectionStatus
1793                     	xdef	_FLASH_GetCodeSize
1794                     	xdef	_FLASH_GetBootSize
1795                     	xdef	_FLASH_ReadByte
1796                     	xdef	_FLASH_ProgramWord
1797                     	xdef	_FLASH_EraseByte
1798                     	xdef	_FLASH_ProgramByte
1799                     	xdef	_FLASH_Lock
1800                     	xdef	_FLASH_Unlock
1801                     	xdef	_FLASH_DeInit
1802                     	xdef	_FLASH_PowerWaitModeConfig
1803                     	xdef	_FLASH_SetProgrammingTime
1804                     	xdef	_FLASH_GetProgrammingTime
1805                     	xref.b	c_lreg
1824                     	xref	c_ladd
1825                     	xref	c_lgadd
1826                     	xref	c_cmulx
1827                     	end
