   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.8.32 - 23 Mar 2010
   3                     ; Generator V4.3.4 - 23 Mar 2010
   4                     ; Optimizer V4.3.3 - 10 Feb 2010
 206                     ; 141 void I2C_DeInit(I2C_TypeDef* I2Cx)
 206                     ; 142 {
 208                     .text:	section	.text,new
 209  0000               _I2C_DeInit:
 213                     ; 143   I2Cx->CR1 = I2C_CR1_RESET_VALUE;
 215  0000 7f            	clr	(x)
 216                     ; 144   I2Cx->CR2 = I2C_CR2_RESET_VALUE;
 218  0001 6f01          	clr	(1,x)
 219                     ; 145   I2Cx->FREQR = I2C_FREQR_RESET_VALUE;
 221  0003 6f02          	clr	(2,x)
 222                     ; 146   I2Cx->OARL = I2C_OARL_RESET_VALUE;
 224  0005 6f03          	clr	(3,x)
 225                     ; 147   I2Cx->OARH = I2C_OARH_RESET_VALUE;
 227  0007 6f04          	clr	(4,x)
 228                     ; 148   I2Cx->OAR2 = I2C_OAR2_RESET_VALUE;
 230  0009 6f05          	clr	(5,x)
 231                     ; 149   I2Cx->ITR = I2C_ITR_RESET_VALUE;
 233  000b 6f0a          	clr	(10,x)
 234                     ; 150   I2Cx->CCRL = I2C_CCRL_RESET_VALUE;
 236  000d 6f0b          	clr	(11,x)
 237                     ; 151   I2Cx->CCRH = I2C_CCRH_RESET_VALUE;
 239  000f 6f0c          	clr	(12,x)
 240                     ; 152   I2Cx->TRISER = I2C_TRISER_RESET_VALUE;
 242  0011 a602          	ld	a,#2
 243  0013 e70d          	ld	(13,x),a
 244                     ; 153 }
 247  0015 81            	ret	
 459                     .const:	section	.text
 460  0000               L21:
 461  0000 000f4240      	dc.l	1000000
 462  0004               L41:
 463  0004 000186a1      	dc.l	100001
 464  0008               L61:
 465  0008 00000004      	dc.l	4
 466                     ; 184 void I2C_Init(I2C_TypeDef* I2Cx, uint32_t OutputClockFrequency, uint16_t OwnAddress,
 466                     ; 185               I2C_Mode_TypeDef I2C_Mode, I2C_DutyCycle_TypeDef I2C_DutyCycle,
 466                     ; 186               I2C_Ack_TypeDef I2C_Ack, I2C_AcknowledgedAddress_TypeDef I2C_AcknowledgedAddress)
 466                     ; 187 {
 467                     .text:	section	.text,new
 468  0000               _I2C_Init:
 470  0000 89            	pushw	x
 471  0001 520c          	subw	sp,#12
 472       0000000c      OFST:	set	12
 475                     ; 188   uint32_t result = 0x0004;
 477                     ; 189   uint16_t tmpval = 0;
 479                     ; 190   uint8_t tmpccrh = 0;
 481  0003 0f07          	clr	(OFST-5,sp)
 482                     ; 191   uint8_t input_clock = 0;
 484                     ; 194   assert_param(IS_I2C_MODE(I2C_Mode));
 486                     ; 195   assert_param(IS_I2C_ACK_STATE(I2C_Ack));
 488                     ; 196   assert_param(IS_I2C_ACKNOWLEDGE_ADDRESS(I2C_AcknowledgedAddress));
 490                     ; 197   assert_param(IS_I2C_DUTY_CYCLE(I2C_DutyCycle));
 492                     ; 198   assert_param(IS_I2C_OWN_ADDRESS(OwnAddress));
 494                     ; 199   assert_param(IS_I2C_OUTPUT_CLOCK_FREQ(OutputClockFrequency));
 496                     ; 203   input_clock = (uint8_t) (CLK_GetClockFreq() / 1000000);
 498  0005 cd0000        	call	_CLK_GetClockFreq
 500  0008 ae0000        	ldw	x,#L21
 501  000b cd0000        	call	c_ludv
 503  000e b603          	ld	a,c_lreg+3
 504  0010 6b08          	ld	(OFST-4,sp),a
 505                     ; 207   I2Cx->FREQR &= (uint8_t)(~I2C_FREQR_FREQ);
 507  0012 1e0d          	ldw	x,(OFST+1,sp)
 508  0014 e602          	ld	a,(2,x)
 509  0016 a4c0          	and	a,#192
 510  0018 e702          	ld	(2,x),a
 511                     ; 209   I2Cx->FREQR |= input_clock;
 513  001a e602          	ld	a,(2,x)
 514  001c 1a08          	or	a,(OFST-4,sp)
 515  001e e702          	ld	(2,x),a
 516                     ; 213   I2Cx->CR1 &= (uint8_t)(~I2C_CR1_PE);
 518  0020 f6            	ld	a,(x)
 519  0021 a4fe          	and	a,#254
 520  0023 f7            	ld	(x),a
 521                     ; 216   I2Cx->CCRH &= (uint8_t)(~(I2C_CCRH_FS | I2C_CCRH_DUTY | I2C_CCRH_CCR));
 523  0024 e60c          	ld	a,(12,x)
 524  0026 a430          	and	a,#48
 525  0028 e70c          	ld	(12,x),a
 526                     ; 217   I2Cx->CCRL &= (uint8_t)(~I2C_CCRL_CCR);
 528  002a 6f0b          	clr	(11,x)
 529                     ; 220   if (OutputClockFrequency > I2C_MAX_STANDARD_FREQ) /* FAST MODE */
 531  002c 96            	ldw	x,sp
 532  002d 1c0011        	addw	x,#OFST+5
 533  0030 cd0000        	call	c_ltor
 535  0033 ae0004        	ldw	x,#L41
 536  0036 cd0000        	call	c_lcmp
 538  0039 2576          	jrult	L742
 539                     ; 223     tmpccrh = I2C_CCRH_FS;
 541  003b a680          	ld	a,#128
 542  003d 6b07          	ld	(OFST-5,sp),a
 543                     ; 225     if (I2C_DutyCycle == I2C_DutyCycle_2)
 545  003f 96            	ldw	x,sp
 546  0040 0d18          	tnz	(OFST+12,sp)
 547  0042 2623          	jrne	L152
 548                     ; 228       result = (uint32_t) ((input_clock * 1000000) / (OutputClockFrequency * 3));
 550  0044 1c0011        	addw	x,#OFST+5
 551  0047 cd0000        	call	c_ltor
 553  004a a603          	ld	a,#3
 554  004c cd0000        	call	c_smul
 556  004f 96            	ldw	x,sp
 557  0050 5c            	incw	x
 558  0051 cd0000        	call	c_rtol
 560  0054 7b08          	ld	a,(OFST-4,sp)
 561  0056 cd012e        	call	LC001
 563  0059 96            	ldw	x,sp
 564  005a 5c            	incw	x
 565  005b cd0000        	call	c_ludv
 567  005e 96            	ldw	x,sp
 568  005f 1c0009        	addw	x,#OFST-3
 569  0062 cd0000        	call	c_rtol
 572  0065 2027          	jra	L352
 573  0067               L152:
 574                     ; 233       result = (uint32_t) ((input_clock * 1000000) / (OutputClockFrequency * 25));
 576  0067 1c0011        	addw	x,#OFST+5
 577  006a cd0000        	call	c_ltor
 579  006d a619          	ld	a,#25
 580  006f cd0000        	call	c_smul
 582  0072 96            	ldw	x,sp
 583  0073 5c            	incw	x
 584  0074 cd0000        	call	c_rtol
 586  0077 7b08          	ld	a,(OFST-4,sp)
 587  0079 cd012e        	call	LC001
 589  007c 96            	ldw	x,sp
 590  007d 5c            	incw	x
 591  007e cd0000        	call	c_ludv
 593  0081 96            	ldw	x,sp
 594  0082 1c0009        	addw	x,#OFST-3
 595  0085 cd0000        	call	c_rtol
 597                     ; 235       tmpccrh |= I2C_CCRH_DUTY;
 599  0088 7b07          	ld	a,(OFST-5,sp)
 600  008a aa40          	or	a,#64
 601  008c 6b07          	ld	(OFST-5,sp),a
 602  008e               L352:
 603                     ; 239     if (result < (uint16_t)0x01)
 605  008e 96            	ldw	x,sp
 606  008f 1c0009        	addw	x,#OFST-3
 607  0092 cd0000        	call	c_lzmp
 609  0095 2608          	jrne	L552
 610                     ; 242       result = (uint16_t)0x0001;
 612  0097 ae0001        	ldw	x,#1
 613  009a 1f0b          	ldw	(OFST-1,sp),x
 614  009c 5f            	clrw	x
 615  009d 1f09          	ldw	(OFST-3,sp),x
 616  009f               L552:
 617                     ; 248     tmpval = ((input_clock * 3) / 10) + 1;
 619  009f 7b08          	ld	a,(OFST-4,sp)
 620  00a1 97            	ld	xl,a
 621  00a2 a603          	ld	a,#3
 622  00a4 42            	mul	x,a
 623  00a5 a60a          	ld	a,#10
 624  00a7 cd0000        	call	c_sdivx
 626  00aa 5c            	incw	x
 627  00ab 1f05          	ldw	(OFST-7,sp),x
 628                     ; 249     I2Cx->TRISER = (uint8_t)tmpval;
 630  00ad 7b06          	ld	a,(OFST-6,sp)
 632  00af 2046          	jra	L752
 633  00b1               L742:
 634                     ; 256     result = (uint16_t)((input_clock * 1000000) / (OutputClockFrequency << (uint8_t)1));
 636  00b1 96            	ldw	x,sp
 637  00b2 1c0011        	addw	x,#OFST+5
 638  00b5 cd0000        	call	c_ltor
 640  00b8 3803          	sll	c_lreg+3
 641  00ba 3902          	rlc	c_lreg+2
 642  00bc 3901          	rlc	c_lreg+1
 643  00be 96            	ldw	x,sp
 644  00bf 3900          	rlc	c_lreg
 645  00c1 5c            	incw	x
 646  00c2 cd0000        	call	c_rtol
 648  00c5 7b08          	ld	a,(OFST-4,sp)
 649  00c7 ad65          	call	LC001
 651  00c9 96            	ldw	x,sp
 652  00ca 5c            	incw	x
 653  00cb cd0000        	call	c_ludv
 655  00ce b602          	ld	a,c_lreg+2
 656  00d0 97            	ld	xl,a
 657  00d1 b603          	ld	a,c_lreg+3
 658  00d3 cd0000        	call	c_uitol
 660  00d6 96            	ldw	x,sp
 661  00d7 1c0009        	addw	x,#OFST-3
 662  00da cd0000        	call	c_rtol
 664                     ; 259     if (result < (uint16_t)0x0004)
 666  00dd 96            	ldw	x,sp
 667  00de 1c0009        	addw	x,#OFST-3
 668  00e1 cd0000        	call	c_ltor
 670  00e4 ae0008        	ldw	x,#L61
 671  00e7 cd0000        	call	c_lcmp
 673  00ea 2408          	jruge	L162
 674                     ; 262       result = (uint16_t)0x0004;
 676  00ec ae0004        	ldw	x,#4
 677  00ef 1f0b          	ldw	(OFST-1,sp),x
 678  00f1 5f            	clrw	x
 679  00f2 1f09          	ldw	(OFST-3,sp),x
 680  00f4               L162:
 681                     ; 268     I2Cx->TRISER = (uint8_t)((uint8_t)input_clock + (uint8_t)1);
 683  00f4 7b08          	ld	a,(OFST-4,sp)
 684  00f6 4c            	inc	a
 685  00f7               L752:
 686  00f7 1e0d          	ldw	x,(OFST+1,sp)
 687  00f9 e70d          	ld	(13,x),a
 688                     ; 273   I2Cx->CCRL = (uint8_t)result;
 690  00fb 7b0c          	ld	a,(OFST+0,sp)
 691  00fd e70b          	ld	(11,x),a
 692                     ; 274   I2Cx->CCRH = (uint8_t)((uint8_t)((uint8_t)((uint8_t)result >> 8) & I2C_CCRH_CCR) | tmpccrh);
 694  00ff 7b07          	ld	a,(OFST-5,sp)
 695  0101 e70c          	ld	(12,x),a
 696                     ; 277   I2Cx->CR1 |= (uint8_t)(I2C_CR1_PE | I2C_Mode);
 698  0103 7b17          	ld	a,(OFST+11,sp)
 699  0105 aa01          	or	a,#1
 700  0107 fa            	or	a,(x)
 701  0108 f7            	ld	(x),a
 702                     ; 280   I2Cx->CR2 |= (uint8_t)I2C_Ack;
 704  0109 e601          	ld	a,(1,x)
 705  010b 1a19          	or	a,(OFST+13,sp)
 706  010d e701          	ld	(1,x),a
 707                     ; 283   I2Cx->OARL = (uint8_t)(OwnAddress);
 709  010f 7b16          	ld	a,(OFST+10,sp)
 710  0111 e703          	ld	(3,x),a
 711                     ; 284   I2Cx->OARH = (uint8_t)((uint8_t)(I2C_AcknowledgedAddress | I2C_OARH_ADDCONF ) | \
 711                     ; 285                          (uint8_t)((uint16_t)( (uint16_t)OwnAddress &  (uint16_t)0x0300) >> 7));
 713  0113 7b15          	ld	a,(OFST+9,sp)
 714  0115 a403          	and	a,#3
 715  0117 97            	ld	xl,a
 716  0118 4f            	clr	a
 717  0119 02            	rlwa	x,a
 718  011a 4f            	clr	a
 719  011b 01            	rrwa	x,a
 720  011c 48            	sll	a
 721  011d 59            	rlcw	x
 722  011e 9f            	ld	a,xl
 723  011f 6b04          	ld	(OFST-8,sp),a
 724  0121 7b1a          	ld	a,(OFST+14,sp)
 725  0123 aa40          	or	a,#64
 726  0125 1e0d          	ldw	x,(OFST+1,sp)
 727  0127 1a04          	or	a,(OFST-8,sp)
 728  0129 e704          	ld	(4,x),a
 729                     ; 286 }
 732  012b 5b0e          	addw	sp,#14
 733  012d 81            	ret	
 734  012e               LC001:
 735  012e b703          	ld	c_lreg+3,a
 736  0130 3f02          	clr	c_lreg+2
 737  0132 3f01          	clr	c_lreg+1
 738  0134 3f00          	clr	c_lreg
 739  0136 ae0000        	ldw	x,#L21
 740  0139 cc0000        	jp	c_lmul
 807                     ; 295 void I2C_Cmd(I2C_TypeDef* I2Cx, FunctionalState NewState)
 807                     ; 296 {
 808                     .text:	section	.text,new
 809  0000               _I2C_Cmd:
 811  0000 89            	pushw	x
 812       00000000      OFST:	set	0
 815                     ; 299   assert_param(IS_FUNCTIONAL_STATE(NewState));
 817                     ; 301   if (NewState != DISABLE)
 819  0001 7b05          	ld	a,(OFST+5,sp)
 820  0003 2705          	jreq	L713
 821                     ; 304     I2Cx->CR1 |= I2C_CR1_PE;
 823  0005 f6            	ld	a,(x)
 824  0006 aa01          	or	a,#1
 826  0008 2005          	jra	L123
 827  000a               L713:
 828                     ; 309     I2Cx->CR1 &= (uint8_t)(~I2C_CR1_PE);
 830  000a 1e01          	ldw	x,(OFST+1,sp)
 831  000c f6            	ld	a,(x)
 832  000d a4fe          	and	a,#254
 833  000f               L123:
 834  000f f7            	ld	(x),a
 835                     ; 311 }
 838  0010 85            	popw	x
 839  0011 81            	ret	
 886                     ; 320 void I2C_GeneralCallCmd(I2C_TypeDef* I2Cx, FunctionalState NewState)
 886                     ; 321 {
 887                     .text:	section	.text,new
 888  0000               _I2C_GeneralCallCmd:
 890  0000 89            	pushw	x
 891       00000000      OFST:	set	0
 894                     ; 324   assert_param(IS_FUNCTIONAL_STATE(NewState));
 896                     ; 326   if (NewState != DISABLE)
 898  0001 7b05          	ld	a,(OFST+5,sp)
 899  0003 2705          	jreq	L743
 900                     ; 329     I2Cx->CR1 |= I2C_CR1_ENGC;
 902  0005 f6            	ld	a,(x)
 903  0006 aa40          	or	a,#64
 905  0008 2005          	jra	L153
 906  000a               L743:
 907                     ; 334     I2Cx->CR1 &= (uint8_t)(~I2C_CR1_ENGC);
 909  000a 1e01          	ldw	x,(OFST+1,sp)
 910  000c f6            	ld	a,(x)
 911  000d a4bf          	and	a,#191
 912  000f               L153:
 913  000f f7            	ld	(x),a
 914                     ; 336 }
 917  0010 85            	popw	x
 918  0011 81            	ret	
 965                     ; 347 void I2C_GenerateSTART(I2C_TypeDef* I2Cx, FunctionalState NewState)
 965                     ; 348 {
 966                     .text:	section	.text,new
 967  0000               _I2C_GenerateSTART:
 969  0000 89            	pushw	x
 970       00000000      OFST:	set	0
 973                     ; 351   assert_param(IS_FUNCTIONAL_STATE(NewState));
 975                     ; 353   if (NewState != DISABLE)
 977  0001 7b05          	ld	a,(OFST+5,sp)
 978  0003 2706          	jreq	L773
 979                     ; 356     I2Cx->CR2 |= I2C_CR2_START;
 981  0005 e601          	ld	a,(1,x)
 982  0007 aa01          	or	a,#1
 984  0009 2006          	jra	L104
 985  000b               L773:
 986                     ; 361     I2Cx->CR2 &= (uint8_t)(~I2C_CR2_START);
 988  000b 1e01          	ldw	x,(OFST+1,sp)
 989  000d e601          	ld	a,(1,x)
 990  000f a4fe          	and	a,#254
 991  0011               L104:
 992  0011 e701          	ld	(1,x),a
 993                     ; 363 }
 996  0013 85            	popw	x
 997  0014 81            	ret	
1044                     ; 372 void I2C_GenerateSTOP(I2C_TypeDef* I2Cx, FunctionalState NewState)
1044                     ; 373 {
1045                     .text:	section	.text,new
1046  0000               _I2C_GenerateSTOP:
1048  0000 89            	pushw	x
1049       00000000      OFST:	set	0
1052                     ; 376   assert_param(IS_FUNCTIONAL_STATE(NewState));
1054                     ; 378   if (NewState != DISABLE)
1056  0001 7b05          	ld	a,(OFST+5,sp)
1057  0003 2706          	jreq	L724
1058                     ; 381     I2Cx->CR2 |= I2C_CR2_STOP;
1060  0005 e601          	ld	a,(1,x)
1061  0007 aa02          	or	a,#2
1063  0009 2006          	jra	L134
1064  000b               L724:
1065                     ; 386     I2Cx->CR2 &= (uint8_t)(~I2C_CR2_STOP);
1067  000b 1e01          	ldw	x,(OFST+1,sp)
1068  000d e601          	ld	a,(1,x)
1069  000f a4fd          	and	a,#253
1070  0011               L134:
1071  0011 e701          	ld	(1,x),a
1072                     ; 388 }
1075  0013 85            	popw	x
1076  0014 81            	ret	
1124                     ; 397 void I2C_SoftwareResetCmd(I2C_TypeDef* I2Cx, FunctionalState NewState)
1124                     ; 398 {
1125                     .text:	section	.text,new
1126  0000               _I2C_SoftwareResetCmd:
1128  0000 89            	pushw	x
1129       00000000      OFST:	set	0
1132                     ; 400   assert_param(IS_FUNCTIONAL_STATE(NewState));
1134                     ; 402   if (NewState != DISABLE)
1136  0001 7b05          	ld	a,(OFST+5,sp)
1137  0003 2706          	jreq	L754
1138                     ; 405     I2Cx->CR2 |= I2C_CR2_SWRST;
1140  0005 e601          	ld	a,(1,x)
1141  0007 aa80          	or	a,#128
1143  0009 2006          	jra	L164
1144  000b               L754:
1145                     ; 410     I2Cx->CR2 &= (uint8_t)(~I2C_CR2_SWRST);
1147  000b 1e01          	ldw	x,(OFST+1,sp)
1148  000d e601          	ld	a,(1,x)
1149  000f a47f          	and	a,#127
1150  0011               L164:
1151  0011 e701          	ld	(1,x),a
1152                     ; 412 }
1155  0013 85            	popw	x
1156  0014 81            	ret	
1204                     ; 421 void I2C_StretchClockCmd(I2C_TypeDef* I2Cx, FunctionalState NewState)
1204                     ; 422 {
1205                     .text:	section	.text,new
1206  0000               _I2C_StretchClockCmd:
1208  0000 89            	pushw	x
1209       00000000      OFST:	set	0
1212                     ; 424   assert_param(IS_FUNCTIONAL_STATE(NewState));
1214                     ; 426   if (NewState != DISABLE)
1216  0001 7b05          	ld	a,(OFST+5,sp)
1217  0003 2705          	jreq	L705
1218                     ; 429     I2Cx->CR1 &= (uint8_t)(~I2C_CR1_NOSTRETCH);
1220  0005 f6            	ld	a,(x)
1221  0006 a47f          	and	a,#127
1223  0008 2005          	jra	L115
1224  000a               L705:
1225                     ; 435     I2Cx->CR1 |= I2C_CR1_NOSTRETCH;
1227  000a 1e01          	ldw	x,(OFST+1,sp)
1228  000c f6            	ld	a,(x)
1229  000d aa80          	or	a,#128
1230  000f               L115:
1231  000f f7            	ld	(x),a
1232                     ; 437 }
1235  0010 85            	popw	x
1236  0011 81            	ret	
1283                     ; 446 void I2C_ARPCmd(I2C_TypeDef* I2Cx, FunctionalState NewState)
1283                     ; 447 {
1284                     .text:	section	.text,new
1285  0000               _I2C_ARPCmd:
1287  0000 89            	pushw	x
1288       00000000      OFST:	set	0
1291                     ; 449   assert_param(IS_FUNCTIONAL_STATE(NewState));
1293                     ; 451   if (NewState != DISABLE)
1295  0001 7b05          	ld	a,(OFST+5,sp)
1296  0003 2705          	jreq	L735
1297                     ; 454     I2Cx->CR1 |= I2C_CR1_ARP;
1299  0005 f6            	ld	a,(x)
1300  0006 aa10          	or	a,#16
1302  0008 2005          	jra	L145
1303  000a               L735:
1304                     ; 460     I2Cx->CR1 &= (uint8_t)(~I2C_CR1_ARP);
1306  000a 1e01          	ldw	x,(OFST+1,sp)
1307  000c f6            	ld	a,(x)
1308  000d a4ef          	and	a,#239
1309  000f               L145:
1310  000f f7            	ld	(x),a
1311                     ; 462 }
1314  0010 85            	popw	x
1315  0011 81            	ret	
1363                     ; 471 void I2C_AcknowledgeConfig(I2C_TypeDef* I2Cx, FunctionalState NewState)
1363                     ; 472 {
1364                     .text:	section	.text,new
1365  0000               _I2C_AcknowledgeConfig:
1367  0000 89            	pushw	x
1368       00000000      OFST:	set	0
1371                     ; 474   assert_param(IS_FUNCTIONAL_STATE(NewState));
1373                     ; 476   if (NewState != DISABLE)
1375  0001 7b05          	ld	a,(OFST+5,sp)
1376  0003 2706          	jreq	L765
1377                     ; 479     I2Cx->CR2 |= I2C_CR2_ACK;
1379  0005 e601          	ld	a,(1,x)
1380  0007 aa04          	or	a,#4
1382  0009 2006          	jra	L175
1383  000b               L765:
1384                     ; 484     I2Cx->CR2 &= (uint8_t)(~I2C_CR2_ACK);
1386  000b 1e01          	ldw	x,(OFST+1,sp)
1387  000d e601          	ld	a,(1,x)
1388  000f a4fb          	and	a,#251
1389  0011               L175:
1390  0011 e701          	ld	(1,x),a
1391                     ; 486 }
1394  0013 85            	popw	x
1395  0014 81            	ret	
1447                     ; 494 void I2C_OwnAddress2Config(I2C_TypeDef* I2Cx, uint8_t Address)
1447                     ; 495 {
1448                     .text:	section	.text,new
1449  0000               _I2C_OwnAddress2Config:
1451  0000 89            	pushw	x
1452  0001 88            	push	a
1453       00000001      OFST:	set	1
1456                     ; 496   uint8_t tmpreg = 0;
1458                     ; 499   tmpreg = I2Cx->OAR2;
1460  0002 e605          	ld	a,(5,x)
1461                     ; 502   tmpreg &= (uint8_t)(~I2C_OAR2_ADD2);
1463  0004 a401          	and	a,#1
1464  0006 6b01          	ld	(OFST+0,sp),a
1465                     ; 505   tmpreg |= (uint8_t) ((uint8_t)Address & (uint8_t)0xFE);
1467  0008 7b06          	ld	a,(OFST+5,sp)
1468  000a a4fe          	and	a,#254
1469  000c 1a01          	or	a,(OFST+0,sp)
1470  000e 6b01          	ld	(OFST+0,sp),a
1471                     ; 508   I2Cx->OAR2 = tmpreg;
1473  0010 1e02          	ldw	x,(OFST+1,sp)
1474                     ; 509 }
1477  0012 5b03          	addw	sp,#3
1478  0014 e705          	ld	(5,x),a
1479  0016 81            	ret	
1526                     ; 518 void I2C_DualAddressCmd(I2C_TypeDef* I2Cx, FunctionalState NewState)
1526                     ; 519 {
1527                     .text:	section	.text,new
1528  0000               _I2C_DualAddressCmd:
1530  0000 89            	pushw	x
1531       00000000      OFST:	set	0
1534                     ; 521   assert_param(IS_FUNCTIONAL_STATE(NewState));
1536                     ; 523   if (NewState != DISABLE)
1538  0001 7b05          	ld	a,(OFST+5,sp)
1539  0003 2706          	jreq	L346
1540                     ; 526     I2Cx->OAR2 |= I2C_OAR2_ENDUAL;
1542  0005 e605          	ld	a,(5,x)
1543  0007 aa01          	or	a,#1
1545  0009 2006          	jra	L546
1546  000b               L346:
1547                     ; 531     I2Cx->OAR2 &= (uint8_t)(~I2C_OAR2_ENDUAL);
1549  000b 1e01          	ldw	x,(OFST+1,sp)
1550  000d e605          	ld	a,(5,x)
1551  000f a4fe          	and	a,#254
1552  0011               L546:
1553  0011 e705          	ld	(5,x),a
1554                     ; 533 }
1557  0013 85            	popw	x
1558  0014 81            	ret	
1628                     ; 545 void I2C_AckPositionConfig(I2C_TypeDef* I2Cx, I2C_AckPosition_TypeDef I2C_AckPosition)
1628                     ; 546 {
1629                     .text:	section	.text,new
1630  0000               _I2C_AckPositionConfig:
1632  0000 89            	pushw	x
1633       00000000      OFST:	set	0
1636                     ; 548   assert_param(IS_I2C_ACK_POSITION(I2C_AckPosition));
1638                     ; 551   I2Cx->CR2 &= (uint8_t)(~I2C_CR2_POS);
1640  0001 e601          	ld	a,(1,x)
1641  0003 a4f7          	and	a,#247
1642  0005 e701          	ld	(1,x),a
1643                     ; 553   I2Cx->CR2 |= (uint8_t)I2C_AckPosition;
1645  0007 e601          	ld	a,(1,x)
1646  0009 1a05          	or	a,(OFST+5,sp)
1647  000b e701          	ld	(1,x),a
1648                     ; 554 }
1651  000d 85            	popw	x
1652  000e 81            	ret	
1721                     ; 565 void I2C_SMBusAlertConfig(I2C_TypeDef* I2Cx, I2C_SMBusAlert_TypeDef I2C_SMBusAlert)
1721                     ; 566 {
1722                     .text:	section	.text,new
1723  0000               _I2C_SMBusAlertConfig:
1725  0000 89            	pushw	x
1726       00000000      OFST:	set	0
1729                     ; 569   assert_param(IS_I2C_SMBUS_ALERT(I2C_SMBusAlert));
1731                     ; 571   if (I2C_SMBusAlert != I2C_SMBusAlert_High)
1733  0001 7b05          	ld	a,(OFST+5,sp)
1734  0003 2706          	jreq	L737
1735                     ; 574     I2Cx->CR2 |= (uint8_t)I2C_CR2_ALERT;
1737  0005 e601          	ld	a,(1,x)
1738  0007 aa20          	or	a,#32
1740  0009 2006          	jra	L147
1741  000b               L737:
1742                     ; 579     I2Cx->CR2 &= (uint8_t)(~I2C_CR2_ALERT);
1744  000b 1e01          	ldw	x,(OFST+1,sp)
1745  000d e601          	ld	a,(1,x)
1746  000f a4df          	and	a,#223
1747  0011               L147:
1748  0011 e701          	ld	(1,x),a
1749                     ; 581 }
1752  0013 85            	popw	x
1753  0014 81            	ret	
1801                     ; 592 void I2C_FastModeDutyCycleConfig(I2C_TypeDef* I2Cx, I2C_DutyCycle_TypeDef I2C_DutyCycle)
1801                     ; 593 {
1802                     .text:	section	.text,new
1803  0000               _I2C_FastModeDutyCycleConfig:
1805  0000 89            	pushw	x
1806       00000000      OFST:	set	0
1809                     ; 596   assert_param(IS_I2C_DUTY_CYCLE(I2C_DutyCycle));
1811                     ; 598   if (I2C_DutyCycle == I2C_DutyCycle_16_9)
1813  0001 7b05          	ld	a,(OFST+5,sp)
1814  0003 a140          	cp	a,#64
1815  0005 2606          	jrne	L767
1816                     ; 601     I2Cx->CCRH |= I2C_CCRH_DUTY;
1818  0007 e60c          	ld	a,(12,x)
1819  0009 aa40          	or	a,#64
1821  000b 2006          	jra	L177
1822  000d               L767:
1823                     ; 606     I2Cx->CCRH &= (uint8_t)(~I2C_CCRH_DUTY);
1825  000d 1e01          	ldw	x,(OFST+1,sp)
1826  000f e60c          	ld	a,(12,x)
1827  0011 a4bf          	and	a,#191
1828  0013               L177:
1829  0013 e70c          	ld	(12,x),a
1830                     ; 608 }
1833  0015 85            	popw	x
1834  0016 81            	ret	
1911                     ; 621 void I2C_Send7bitAddress(I2C_TypeDef* I2Cx, uint8_t Address, I2C_Direction_TypeDef I2C_Direction)
1911                     ; 622 {
1912                     .text:	section	.text,new
1913  0000               _I2C_Send7bitAddress:
1915  0000 89            	pushw	x
1916       00000000      OFST:	set	0
1919                     ; 624   assert_param(IS_I2C_ADDRESS(Address));
1921                     ; 625   assert_param(IS_I2C_DIRECTION(I2C_Direction));
1923                     ; 628   if (I2C_Direction != I2C_Direction_Transmitter)
1925  0001 7b06          	ld	a,(OFST+6,sp)
1926  0003 2706          	jreq	L1301
1927                     ; 631     Address |= OAR1_ADD0_Set;
1929  0005 7b05          	ld	a,(OFST+5,sp)
1930  0007 aa01          	or	a,#1
1932  0009 2004          	jra	L3301
1933  000b               L1301:
1934                     ; 636     Address &= OAR1_ADD0_Reset;
1936  000b 7b05          	ld	a,(OFST+5,sp)
1937  000d a4fe          	and	a,#254
1938  000f               L3301:
1939  000f 6b05          	ld	(OFST+5,sp),a
1940                     ; 639   I2Cx->DR = Address;
1942  0011 1e01          	ldw	x,(OFST+1,sp)
1943  0013 e706          	ld	(6,x),a
1944                     ; 640 }
1947  0015 85            	popw	x
1948  0016 81            	ret	
1992                     ; 664 void I2C_SendData(I2C_TypeDef* I2Cx, uint8_t Data)
1992                     ; 665 {
1993                     .text:	section	.text,new
1994  0000               _I2C_SendData:
1996  0000 89            	pushw	x
1997       00000000      OFST:	set	0
2000                     ; 667   I2Cx->DR = Data;
2002  0001 1e01          	ldw	x,(OFST+1,sp)
2003  0003 7b05          	ld	a,(OFST+5,sp)
2004  0005 e706          	ld	(6,x),a
2005                     ; 668 }
2008  0007 85            	popw	x
2009  0008 81            	ret	
2046                     ; 676 uint8_t I2C_ReceiveData(I2C_TypeDef* I2Cx)
2046                     ; 677 {
2047                     .text:	section	.text,new
2048  0000               _I2C_ReceiveData:
2052                     ; 679   return ((uint8_t)I2Cx->DR);
2054  0000 e606          	ld	a,(6,x)
2057  0002 81            	ret	
2104                     ; 705 void I2C_TransmitPEC(I2C_TypeDef* I2Cx, FunctionalState NewState)
2104                     ; 706 {
2105                     .text:	section	.text,new
2106  0000               _I2C_TransmitPEC:
2108  0000 89            	pushw	x
2109       00000000      OFST:	set	0
2112                     ; 708   assert_param(IS_FUNCTIONAL_STATE(NewState));
2114                     ; 710   if (NewState != DISABLE)
2116  0001 7b05          	ld	a,(OFST+5,sp)
2117  0003 2706          	jreq	L3211
2118                     ; 713     I2Cx->CR2 |= I2C_CR2_PEC;
2120  0005 e601          	ld	a,(1,x)
2121  0007 aa10          	or	a,#16
2123  0009 2006          	jra	L5211
2124  000b               L3211:
2125                     ; 718     I2Cx->CR2 &= (uint8_t)(~I2C_CR2_PEC);
2127  000b 1e01          	ldw	x,(OFST+1,sp)
2128  000d e601          	ld	a,(1,x)
2129  000f a4ef          	and	a,#239
2130  0011               L5211:
2131  0011 e701          	ld	(1,x),a
2132                     ; 720 }
2135  0013 85            	popw	x
2136  0014 81            	ret	
2183                     ; 729 void I2C_CalculatePEC(I2C_TypeDef* I2Cx, FunctionalState NewState)
2183                     ; 730 {
2184                     .text:	section	.text,new
2185  0000               _I2C_CalculatePEC:
2187  0000 89            	pushw	x
2188       00000000      OFST:	set	0
2191                     ; 732   assert_param(IS_FUNCTIONAL_STATE(NewState));
2193                     ; 734   if (NewState != DISABLE)
2195  0001 7b05          	ld	a,(OFST+5,sp)
2196  0003 2705          	jreq	L3511
2197                     ; 737     I2Cx->CR1 |= I2C_CR1_ENPEC;
2199  0005 f6            	ld	a,(x)
2200  0006 aa20          	or	a,#32
2202  0008 2005          	jra	L5511
2203  000a               L3511:
2204                     ; 742     I2Cx->CR1 &= (uint8_t)(~I2C_CR1_ENPEC);
2206  000a 1e01          	ldw	x,(OFST+1,sp)
2207  000c f6            	ld	a,(x)
2208  000d a4df          	and	a,#223
2209  000f               L5511:
2210  000f f7            	ld	(x),a
2211                     ; 744 }
2214  0010 85            	popw	x
2215  0011 81            	ret	
2285                     ; 755 void I2C_PECPositionConfig(I2C_TypeDef* I2Cx, I2C_PECPosition_TypeDef I2C_PECPosition)
2285                     ; 756 {
2286                     .text:	section	.text,new
2287  0000               _I2C_PECPositionConfig:
2289  0000 89            	pushw	x
2290       00000000      OFST:	set	0
2293                     ; 758   assert_param(IS_I2C_PEC_POSITION(I2C_PECPosition));
2295                     ; 761   I2Cx->CR2 &= (uint8_t)(~I2C_CR2_POS);
2297  0001 e601          	ld	a,(1,x)
2298  0003 a4f7          	and	a,#247
2299  0005 e701          	ld	(1,x),a
2300                     ; 763   I2Cx->CR2 |= (uint8_t)I2C_PECPosition;
2302  0007 e601          	ld	a,(1,x)
2303  0009 1a05          	or	a,(OFST+5,sp)
2304  000b e701          	ld	(1,x),a
2305                     ; 764 }
2308  000d 85            	popw	x
2309  000e 81            	ret	
2346                     ; 772 uint8_t I2C_GetPEC(I2C_TypeDef* I2Cx)
2346                     ; 773 {
2347                     .text:	section	.text,new
2348  0000               _I2C_GetPEC:
2352                     ; 775   return (I2Cx->PECR);
2354  0000 e60e          	ld	a,(14,x)
2357  0002 81            	ret	
2404                     ; 803 void I2C_DMACmd(I2C_TypeDef* I2Cx, FunctionalState NewState)
2404                     ; 804 {
2405                     .text:	section	.text,new
2406  0000               _I2C_DMACmd:
2408  0000 89            	pushw	x
2409       00000000      OFST:	set	0
2412                     ; 806   assert_param(IS_FUNCTIONAL_STATE(NewState));
2414                     ; 808   if (NewState != DISABLE)
2416  0001 7b05          	ld	a,(OFST+5,sp)
2417  0003 2706          	jreq	L7521
2418                     ; 811     I2Cx->ITR |= I2C_ITR_DMAEN;
2420  0005 e60a          	ld	a,(10,x)
2421  0007 aa08          	or	a,#8
2423  0009 2006          	jra	L1621
2424  000b               L7521:
2425                     ; 816     I2Cx->ITR &= (uint8_t)(~I2C_ITR_DMAEN);
2427  000b 1e01          	ldw	x,(OFST+1,sp)
2428  000d e60a          	ld	a,(10,x)
2429  000f a4f7          	and	a,#247
2430  0011               L1621:
2431  0011 e70a          	ld	(10,x),a
2432                     ; 818 }
2435  0013 85            	popw	x
2436  0014 81            	ret	
2484                     ; 827 void I2C_DMALastTransferCmd(I2C_TypeDef* I2Cx, FunctionalState NewState)
2484                     ; 828 {
2485                     .text:	section	.text,new
2486  0000               _I2C_DMALastTransferCmd:
2488  0000 89            	pushw	x
2489       00000000      OFST:	set	0
2492                     ; 830   assert_param(IS_FUNCTIONAL_STATE(NewState));
2494                     ; 832   if (NewState != DISABLE)
2496  0001 7b05          	ld	a,(OFST+5,sp)
2497  0003 2706          	jreq	L7031
2498                     ; 835     I2Cx->ITR |= I2C_ITR_LAST;
2500  0005 e60a          	ld	a,(10,x)
2501  0007 aa10          	or	a,#16
2503  0009 2006          	jra	L1131
2504  000b               L7031:
2505                     ; 840     I2Cx->ITR &= (uint8_t)(~I2C_ITR_LAST);
2507  000b 1e01          	ldw	x,(OFST+1,sp)
2508  000d e60a          	ld	a,(10,x)
2509  000f a4ef          	and	a,#239
2510  0011               L1131:
2511  0011 e70a          	ld	(10,x),a
2512                     ; 842 }
2515  0013 85            	popw	x
2516  0014 81            	ret	
2705                     ; 954 void I2C_ITConfig(I2C_TypeDef* I2Cx, I2C_IT_TypeDef I2C_IT, FunctionalState NewState)
2705                     ; 955 {
2706                     .text:	section	.text,new
2707  0000               _I2C_ITConfig:
2709  0000 89            	pushw	x
2710       00000000      OFST:	set	0
2713                     ; 957   assert_param(IS_I2C_CONFIG_IT(I2C_IT));
2715                     ; 958   assert_param(IS_FUNCTIONAL_STATE(NewState));
2717                     ; 960   if (NewState != DISABLE)
2719  0001 7b07          	ld	a,(OFST+7,sp)
2720  0003 2706          	jreq	L3141
2721                     ; 963     I2Cx->ITR |= (uint8_t)I2C_IT;
2723  0005 e60a          	ld	a,(10,x)
2724  0007 1a06          	or	a,(OFST+6,sp)
2726  0009 2007          	jra	L5141
2727  000b               L3141:
2728                     ; 968     I2Cx->ITR &= (uint8_t)(~(uint8_t)I2C_IT);
2730  000b 1e01          	ldw	x,(OFST+1,sp)
2731  000d 7b06          	ld	a,(OFST+6,sp)
2732  000f 43            	cpl	a
2733  0010 e40a          	and	a,(10,x)
2734  0012               L5141:
2735  0012 e70a          	ld	(10,x),a
2736                     ; 970 }
2739  0014 85            	popw	x
2740  0015 81            	ret	
2901                     ; 994 uint8_t I2C_ReadRegister(I2C_TypeDef* I2Cx, I2C_Register_TypeDef I2C_Register)
2901                     ; 995 {
2902                     .text:	section	.text,new
2903  0000               _I2C_ReadRegister:
2905  0000 89            	pushw	x
2906  0001 5204          	subw	sp,#4
2907       00000004      OFST:	set	4
2910                     ; 996   __IO uint16_t tmp = 0;
2912  0003 5f            	clrw	x
2913  0004 1f03          	ldw	(OFST-1,sp),x
2914                     ; 998   assert_param(IS_I2C_REGISTER(I2C_Register));
2916                     ; 1000   tmp = (uint16_t) I2Cx;
2918  0006 1e05          	ldw	x,(OFST+1,sp)
2919  0008 1f03          	ldw	(OFST-1,sp),x
2920                     ; 1001   tmp += I2C_Register;
2922  000a 5f            	clrw	x
2923  000b 7b09          	ld	a,(OFST+5,sp)
2924  000d 97            	ld	xl,a
2925  000e 1f01          	ldw	(OFST-3,sp),x
2926  0010 1e03          	ldw	x,(OFST-1,sp)
2927  0012 72fb01        	addw	x,(OFST-3,sp)
2928  0015 1f03          	ldw	(OFST-1,sp),x
2929                     ; 1004   return (*(__IO uint8_t *) tmp);
2931  0017 1e03          	ldw	x,(OFST-1,sp)
2934  0019 5b06          	addw	sp,#6
2935  001b f6            	ld	a,(x)
2936  001c 81            	ret	
3186                     ; 1044 ErrorStatus I2C_CheckEvent(I2C_TypeDef* I2Cx, I2C_Event_TypeDef I2C_Event)
3186                     ; 1045 {
3187                     .text:	section	.text,new
3188  0000               _I2C_CheckEvent:
3190  0000 89            	pushw	x
3191  0001 5206          	subw	sp,#6
3192       00000006      OFST:	set	6
3195                     ; 1046   __IO uint16_t lastevent = 0x00;
3197  0003 5f            	clrw	x
3198  0004 1f04          	ldw	(OFST-2,sp),x
3199                     ; 1047   uint8_t flag1 = 0x00 ;
3201                     ; 1048   uint8_t flag2 = 0x00;
3203                     ; 1049   ErrorStatus status = ERROR;
3205                     ; 1052   assert_param(IS_I2C_EVENT(I2C_Event));
3207                     ; 1054   if (I2C_Event == I2C_EVENT_SLAVE_ACK_FAILURE)
3209  0006 1e0b          	ldw	x,(OFST+5,sp)
3210  0008 a30004        	cpw	x,#4
3211  000b 260a          	jrne	L5261
3212                     ; 1056     lastevent = I2Cx->SR2 & I2C_SR2_AF;
3214  000d 1e07          	ldw	x,(OFST+1,sp)
3215  000f e608          	ld	a,(8,x)
3216  0011 a404          	and	a,#4
3217  0013 5f            	clrw	x
3218  0014 97            	ld	xl,a
3220  0015 201a          	jra	L7261
3221  0017               L5261:
3222                     ; 1060     flag1 = I2Cx->SR1;
3224  0017 1e07          	ldw	x,(OFST+1,sp)
3225  0019 e607          	ld	a,(7,x)
3226  001b 6b03          	ld	(OFST-3,sp),a
3227                     ; 1061     flag2 = I2Cx->SR3;
3229  001d e609          	ld	a,(9,x)
3230  001f 6b06          	ld	(OFST+0,sp),a
3231                     ; 1062     lastevent = ((uint16_t)((uint16_t)flag2 << (uint16_t)8) | (uint16_t)flag1);
3233  0021 5f            	clrw	x
3234  0022 7b03          	ld	a,(OFST-3,sp)
3235  0024 97            	ld	xl,a
3236  0025 1f01          	ldw	(OFST-5,sp),x
3237  0027 5f            	clrw	x
3238  0028 7b06          	ld	a,(OFST+0,sp)
3239  002a 97            	ld	xl,a
3240  002b 7b02          	ld	a,(OFST-4,sp)
3241  002d 01            	rrwa	x,a
3242  002e 1a01          	or	a,(OFST-5,sp)
3243  0030 01            	rrwa	x,a
3244  0031               L7261:
3245  0031 1f04          	ldw	(OFST-2,sp),x
3246                     ; 1065   if (((uint16_t)lastevent & (uint16_t)I2C_Event) == (uint16_t)I2C_Event)
3248  0033 1e04          	ldw	x,(OFST-2,sp)
3249  0035 01            	rrwa	x,a
3250  0036 140c          	and	a,(OFST+6,sp)
3251  0038 01            	rrwa	x,a
3252  0039 140b          	and	a,(OFST+5,sp)
3253  003b 01            	rrwa	x,a
3254  003c 130b          	cpw	x,(OFST+5,sp)
3255  003e 2604          	jrne	L1361
3256                     ; 1068     status = SUCCESS;
3258  0040 a601          	ld	a,#1
3260  0042 2001          	jra	L3361
3261  0044               L1361:
3262                     ; 1073     status = ERROR;
3264  0044 4f            	clr	a
3265  0045               L3361:
3266                     ; 1077   return status;
3270  0045 5b08          	addw	sp,#8
3271  0047 81            	ret	
3332                     ; 1095 I2C_Event_TypeDef I2C_GetLastEvent(I2C_TypeDef* I2Cx)
3332                     ; 1096 {
3333                     .text:	section	.text,new
3334  0000               _I2C_GetLastEvent:
3336  0000 89            	pushw	x
3337  0001 5206          	subw	sp,#6
3338       00000006      OFST:	set	6
3341                     ; 1097   __IO uint16_t lastevent = 0;
3343  0003 5f            	clrw	x
3344  0004 1f05          	ldw	(OFST-1,sp),x
3345                     ; 1098   uint16_t flag1 = 0;
3347                     ; 1099   uint16_t flag2 = 0;
3349                     ; 1101   if ((I2Cx->SR2 & I2C_SR2_AF) != 0x00)
3351  0006 1e07          	ldw	x,(OFST+1,sp)
3352  0008 e608          	ld	a,(8,x)
3353  000a a504          	bcp	a,#4
3354  000c 2705          	jreq	L5661
3355                     ; 1103     lastevent = I2C_EVENT_SLAVE_ACK_FAILURE;
3357  000e ae0004        	ldw	x,#4
3359  0011 2014          	jra	L7661
3360  0013               L5661:
3361                     ; 1108     flag1 = I2Cx->SR1;
3363  0013 e607          	ld	a,(7,x)
3364  0015 5f            	clrw	x
3365  0016 97            	ld	xl,a
3366  0017 1f01          	ldw	(OFST-5,sp),x
3367                     ; 1109     flag2 = I2Cx->SR3;
3369  0019 1e07          	ldw	x,(OFST+1,sp)
3370  001b e609          	ld	a,(9,x)
3371  001d 5f            	clrw	x
3372  001e 97            	ld	xl,a
3373  001f 1f03          	ldw	(OFST-3,sp),x
3374                     ; 1112     lastevent = ((uint16_t)((uint16_t)flag2 << 8) | (uint16_t)flag1);
3376  0021 7b02          	ld	a,(OFST-4,sp)
3377  0023 01            	rrwa	x,a
3378  0024 1a01          	or	a,(OFST-5,sp)
3379  0026 01            	rrwa	x,a
3380  0027               L7661:
3381  0027 1f05          	ldw	(OFST-1,sp),x
3382                     ; 1115   return (I2C_Event_TypeDef)lastevent;
3384  0029 1e05          	ldw	x,(OFST-1,sp)
3387  002b 5b08          	addw	sp,#8
3388  002d 81            	ret	
3641                     ; 1152 FlagStatus I2C_GetFlagStatus(I2C_TypeDef* I2Cx, I2C_FLAG_TypeDef I2C_FLAG)
3641                     ; 1153 {
3642                     .text:	section	.text,new
3643  0000               _I2C_GetFlagStatus:
3645  0000 89            	pushw	x
3646  0001 89            	pushw	x
3647       00000002      OFST:	set	2
3650                     ; 1154   uint8_t tempreg = 0;
3652  0002 0f02          	clr	(OFST+0,sp)
3653                     ; 1155   uint8_t regindex = 0;
3655                     ; 1156   FlagStatus bitstatus = RESET;
3657                     ; 1159   assert_param(IS_I2C_GET_FLAG(I2C_FLAG));
3659                     ; 1162   regindex = (uint8_t)((uint16_t)I2C_FLAG >> 8);
3661  0004 7b07          	ld	a,(OFST+5,sp)
3662  0006 6b01          	ld	(OFST-1,sp),a
3663                     ; 1164   switch (regindex)
3666                     ; 1181     default:
3666                     ; 1182       break;
3667  0008 4a            	dec	a
3668  0009 2708          	jreq	L1761
3669  000b 4a            	dec	a
3670  000c 270b          	jreq	L3761
3671  000e 4a            	dec	a
3672  000f 270e          	jreq	L5761
3673  0011 2012          	jra	L7202
3674  0013               L1761:
3675                     ; 1167     case 0x01:
3675                     ; 1168       tempreg = (uint8_t)I2Cx->SR1;
3677  0013 1e03          	ldw	x,(OFST+1,sp)
3678  0015 e607          	ld	a,(7,x)
3679                     ; 1169       break;
3681  0017 200a          	jp	LC002
3682  0019               L3761:
3683                     ; 1172     case 0x02:
3683                     ; 1173       tempreg = (uint8_t)I2Cx->SR2;
3685  0019 1e03          	ldw	x,(OFST+1,sp)
3686  001b e608          	ld	a,(8,x)
3687                     ; 1174       break;
3689  001d 2004          	jp	LC002
3690  001f               L5761:
3691                     ; 1177     case 0x03:
3691                     ; 1178       tempreg = (uint8_t)I2Cx->SR3;
3693  001f 1e03          	ldw	x,(OFST+1,sp)
3694  0021 e609          	ld	a,(9,x)
3695  0023               LC002:
3696  0023 6b02          	ld	(OFST+0,sp),a
3697                     ; 1179       break;
3699                     ; 1181     default:
3699                     ; 1182       break;
3701  0025               L7202:
3702                     ; 1186   if ((tempreg & (uint8_t)I2C_FLAG ) != 0)
3704  0025 7b08          	ld	a,(OFST+6,sp)
3705  0027 1502          	bcp	a,(OFST+0,sp)
3706  0029 2704          	jreq	L1302
3707                     ; 1189     bitstatus = SET;
3709  002b a601          	ld	a,#1
3711  002d 2001          	jra	L3302
3712  002f               L1302:
3713                     ; 1194     bitstatus = RESET;
3715  002f 4f            	clr	a
3716  0030               L3302:
3717                     ; 1197   return bitstatus;
3721  0030 5b04          	addw	sp,#4
3722  0032 81            	ret	
3776                     ; 1229 void I2C_ClearFlag(I2C_TypeDef* I2Cx, I2C_FLAG_TypeDef I2C_FLAG)
3776                     ; 1230 {
3777                     .text:	section	.text,new
3778  0000               _I2C_ClearFlag:
3780  0000 89            	pushw	x
3781  0001 89            	pushw	x
3782       00000002      OFST:	set	2
3785                     ; 1231   uint16_t flagpos = 0;
3787                     ; 1233   assert_param(IS_I2C_CLEAR_FLAG(I2C_FLAG));
3789                     ; 1236   flagpos = (uint16_t)I2C_FLAG & FLAG_Mask;
3791  0002 7b08          	ld	a,(OFST+6,sp)
3792  0004 5f            	clrw	x
3793  0005 02            	rlwa	x,a
3794  0006 1f01          	ldw	(OFST-1,sp),x
3795                     ; 1238   I2Cx->SR2 = (uint8_t)((uint16_t)(~flagpos));
3797  0008 7b02          	ld	a,(OFST+0,sp)
3798  000a 1e03          	ldw	x,(OFST+1,sp)
3799  000c 43            	cpl	a
3800  000d e708          	ld	(8,x),a
3801                     ; 1239 }
3804  000f 5b04          	addw	sp,#4
3805  0011 81            	ret	
3879                     ; 1264 ITStatus I2C_GetITStatus(I2C_TypeDef* I2Cx, I2C_IT_TypeDef I2C_IT)
3879                     ; 1265 {
3880                     .text:	section	.text,new
3881  0000               _I2C_GetITStatus:
3883  0000 89            	pushw	x
3884  0001 5204          	subw	sp,#4
3885       00000004      OFST:	set	4
3888                     ; 1266   ITStatus bitstatus = RESET;
3890                     ; 1267   __IO uint8_t enablestatus = 0;
3892  0003 0f03          	clr	(OFST-1,sp)
3893                     ; 1268   uint16_t tempregister = 0;
3895                     ; 1271   assert_param(IS_I2C_GET_IT(I2C_IT));
3897                     ; 1273   tempregister = (uint8_t)( ((uint16_t)((uint16_t)I2C_IT & ITEN_Mask)) >> 8);
3899  0005 7b09          	ld	a,(OFST+5,sp)
3900  0007 a407          	and	a,#7
3901  0009 97            	ld	xl,a
3902  000a 4f            	clr	a
3903  000b 02            	rlwa	x,a
3904  000c 4f            	clr	a
3905  000d 01            	rrwa	x,a
3906  000e 9f            	ld	a,xl
3907  000f 5f            	clrw	x
3908  0010 97            	ld	xl,a
3909  0011 1f01          	ldw	(OFST-3,sp),x
3910                     ; 1276   enablestatus = (uint8_t)(I2Cx->ITR & ( uint8_t)tempregister);
3912  0013 1e05          	ldw	x,(OFST+1,sp)
3913  0015 e60a          	ld	a,(10,x)
3914  0017 1402          	and	a,(OFST-2,sp)
3915  0019 6b03          	ld	(OFST-1,sp),a
3916                     ; 1278   if ((uint16_t)((uint16_t)I2C_IT & REGISTER_Mask) == REGISTER_SR1_Index)
3918  001b 7b09          	ld	a,(OFST+5,sp)
3919  001d a430          	and	a,#48
3920  001f 97            	ld	xl,a
3921  0020 4f            	clr	a
3922  0021 02            	rlwa	x,a
3923  0022 a30100        	cpw	x,#256
3924  0025 260e          	jrne	L1212
3925                     ; 1281     if (((I2Cx->SR1 & (uint8_t)I2C_IT) != RESET) && enablestatus)
3927  0027 1e05          	ldw	x,(OFST+1,sp)
3928  0029 e607          	ld	a,(7,x)
3929  002b 150a          	bcp	a,(OFST+6,sp)
3930  002d 2716          	jreq	L1312
3932  002f 0d03          	tnz	(OFST-1,sp)
3933  0031 2712          	jreq	L1312
3934                     ; 1284       bitstatus = SET;
3936  0033 200c          	jp	LC004
3937                     ; 1289       bitstatus = RESET;
3938  0035               L1212:
3939                     ; 1295     if (((I2Cx->SR2 & (uint8_t)I2C_IT) != RESET) && enablestatus)
3941  0035 1e05          	ldw	x,(OFST+1,sp)
3942  0037 e608          	ld	a,(8,x)
3943  0039 150a          	bcp	a,(OFST+6,sp)
3944  003b 2708          	jreq	L1312
3946  003d 0d03          	tnz	(OFST-1,sp)
3947  003f 2704          	jreq	L1312
3948                     ; 1298       bitstatus = SET;
3950  0041               LC004:
3952  0041 a601          	ld	a,#1
3954  0043 2001          	jra	L7212
3955  0045               L1312:
3956                     ; 1303       bitstatus = RESET;
3959  0045 4f            	clr	a
3960  0046               L7212:
3961                     ; 1307   return  bitstatus;
3965  0046 5b06          	addw	sp,#6
3966  0048 81            	ret	
4021                     ; 1340 void I2C_ClearITPendingBit(I2C_TypeDef* I2Cx, I2C_IT_TypeDef I2C_IT)
4021                     ; 1341 {
4022                     .text:	section	.text,new
4023  0000               _I2C_ClearITPendingBit:
4025  0000 89            	pushw	x
4026  0001 89            	pushw	x
4027       00000002      OFST:	set	2
4030                     ; 1342   uint16_t flagpos = 0;
4032                     ; 1345   assert_param(IS_I2C_CLEAR_IT(I2C_IT));
4034                     ; 1348   flagpos = (uint16_t)I2C_IT & FLAG_Mask;
4036  0002 7b08          	ld	a,(OFST+6,sp)
4037  0004 5f            	clrw	x
4038  0005 02            	rlwa	x,a
4039  0006 1f01          	ldw	(OFST-1,sp),x
4040                     ; 1351   I2Cx->SR2 = (uint8_t)((uint16_t)~flagpos);
4042  0008 7b02          	ld	a,(OFST+0,sp)
4043  000a 1e03          	ldw	x,(OFST+1,sp)
4044  000c 43            	cpl	a
4045  000d e708          	ld	(8,x),a
4046                     ; 1352 }
4049  000f 5b04          	addw	sp,#4
4050  0011 81            	ret	
4063                     	xdef	_I2C_ClearITPendingBit
4064                     	xdef	_I2C_GetITStatus
4065                     	xdef	_I2C_ClearFlag
4066                     	xdef	_I2C_GetFlagStatus
4067                     	xdef	_I2C_GetLastEvent
4068                     	xdef	_I2C_CheckEvent
4069                     	xdef	_I2C_ReadRegister
4070                     	xdef	_I2C_ITConfig
4071                     	xdef	_I2C_DMALastTransferCmd
4072                     	xdef	_I2C_DMACmd
4073                     	xdef	_I2C_CalculatePEC
4074                     	xdef	_I2C_TransmitPEC
4075                     	xdef	_I2C_GetPEC
4076                     	xdef	_I2C_PECPositionConfig
4077                     	xdef	_I2C_ReceiveData
4078                     	xdef	_I2C_SendData
4079                     	xdef	_I2C_Send7bitAddress
4080                     	xdef	_I2C_SMBusAlertConfig
4081                     	xdef	_I2C_FastModeDutyCycleConfig
4082                     	xdef	_I2C_AckPositionConfig
4083                     	xdef	_I2C_DualAddressCmd
4084                     	xdef	_I2C_OwnAddress2Config
4085                     	xdef	_I2C_AcknowledgeConfig
4086                     	xdef	_I2C_GenerateSTOP
4087                     	xdef	_I2C_GenerateSTART
4088                     	xdef	_I2C_ARPCmd
4089                     	xdef	_I2C_StretchClockCmd
4090                     	xdef	_I2C_SoftwareResetCmd
4091                     	xdef	_I2C_GeneralCallCmd
4092                     	xdef	_I2C_Cmd
4093                     	xdef	_I2C_Init
4094                     	xdef	_I2C_DeInit
4095                     	xref	_CLK_GetClockFreq
4096                     	xref.b	c_lreg
4097                     	xref.b	c_x
4116                     	xref	c_uitol
4117                     	xref	c_sdivx
4118                     	xref	c_lzmp
4119                     	xref	c_rtol
4120                     	xref	c_smul
4121                     	xref	c_lmul
4122                     	xref	c_lcmp
4123                     	xref	c_ltor
4124                     	xref	c_ludv
4125                     	end
