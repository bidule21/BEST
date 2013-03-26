-------------- Build: Debug in chronograf ---------------

Compiling: main.c
main.c:36:1: warning: "F_CPU" redefined
<command-line>: warning: this is the location of the previous definition
Linking console executable: bin\Debug\chronograf.elf
Output size is 5,95 KB
Running project post-build steps
avr-objcopy -O ihex -R .eeprom -R .eesafe bin\Debug\chronograf.elf bin\Debug\chronograf.elf.hex
avr-objcopy --no-change-warnings -j .eeprom --change-section-lma .eeprom=0 -O ihex bin\Debug\chronograf.elf bin\Debug\chronograf.elf.eep.hex
avr-objdump -h -S bin\Debug\chronograf.elf > bin\Debug\chronograf.elf.lss
bin\Debug\chronograf.elf:     file format elf32-avr
Sections:
Idx Name          Size      VMA       LMA       File off  Algn
  0 .text         00000376  00000000  00000000  00000094  2**1
                  CONTENTS, ALLOC, LOAD, READONLY, CODE
  1 .data         00000002  00800060  00000376  0000040a  2**0
                  CONTENTS, ALLOC, LOAD, DATA
  2 .bss          00000013  00800062  00800062  0000040c  2**0
                  ALLOC
  3 .debug_aranges 00000020  00000000  00000000  0000040c  2**0
                  CONTENTS, READONLY, DEBUGGING
  4 .debug_pubnames 00000167  00000000  00000000  0000042c  2**0
                  CONTENTS, READONLY, DEBUGGING
  5 .debug_info   000001ab  00000000  00000000  00000593  2**0
                  CONTENTS, READONLY, DEBUGGING
  6 .debug_abbrev 00000081  00000000  00000000  0000073e  2**0
                  CONTENTS, READONLY, DEBUGGING
  7 .debug_line   00000250  00000000  00000000  000007bf  2**0
                  CONTENTS, READONLY, DEBUGGING
  8 .debug_frame  00000060  00000000  00000000  00000a10  2**2
                  CONTENTS, READONLY, DEBUGGING
  9 .debug_str    0000016b  00000000  00000000  00000a70  2**0
                  CONTENTS, READONLY, DEBUGGING
Disassembly of section .text:
00000000 <__vectors>:
   0:	12 c0       	rjmp	.+36     	; 0x26 <__ctors_end>
   2:	2a c0       	rjmp	.+84     	; 0x58 <__bad_interrupt>
   4:	29 c0       	rjmp	.+82     	; 0x58 <__bad_interrupt>
   6:	49 c0       	rjmp	.+146    	; 0x9a <__vector_3>
   8:	27 c0       	rjmp	.+78     	; 0x58 <__bad_interrupt>
   a:	27 c0       	rjmp	.+78     	; 0x5a <__vector_5>
   c:	25 c0       	rjmp	.+74     	; 0x58 <__bad_interrupt>
   e:	24 c0       	rjmp	.+72     	; 0x58 <__bad_interrupt>
  10:	23 c0       	rjmp	.+70     	; 0x58 <__bad_interrupt>
  12:	22 c0       	rjmp	.+68     	; 0x58 <__bad_interrupt>
  14:	21 c0       	rjmp	.+66     	; 0x58 <__bad_interrupt>
  16:	20 c0       	rjmp	.+64     	; 0x58 <__bad_interrupt>
  18:	1f c0       	rjmp	.+62     	; 0x58 <__bad_interrupt>
  1a:	1e c0       	rjmp	.+60     	; 0x58 <__bad_interrupt>
  1c:	1d c0       	rjmp	.+58     	; 0x58 <__bad_interrupt>
  1e:	1c c0       	rjmp	.+56     	; 0x58 <__bad_interrupt>
  20:	1b c0       	rjmp	.+54     	; 0x58 <__bad_interrupt>
  22:	1a c0       	rjmp	.+52     	; 0x58 <__bad_interrupt>
  24:	19 c0       	rjmp	.+50     	; 0x58 <__bad_interrupt>
00000026 <__ctors_end>:
  26:	11 24       	eor	r1, r1
  28:	1f be       	out	0x3f, r1	; 63
  2a:	cf ed       	ldi	r28, 0xDF	; 223
  2c:	cd bf       	out	0x3d, r28	; 61
0000002e <__do_copy_data>:
  2e:	10 e0       	ldi	r17, 0x00	; 0
  30:	a0 e6       	ldi	r26, 0x60	; 96
  32:	b0 e0       	ldi	r27, 0x00	; 0
  34:	e6 e7       	ldi	r30, 0x76	; 118
  36:	f3 e0       	ldi	r31, 0x03	; 3
  38:	02 c0       	rjmp	.+4      	; 0x3e <.do_copy_data_start>
0000003a <.do_copy_data_loop>:
  3a:	05 90       	lpm	r0, Z+
  3c:	0d 92       	st	X+, r0
0000003e <.do_copy_data_start>:
  3e:	a2 36       	cpi	r26, 0x62	; 98
  40:	b1 07       	cpc	r27, r17
  42:	d9 f7       	brne	.-10     	; 0x3a <.do_copy_data_loop>
00000044 <__do_clear_bss>:
  44:	10 e0       	ldi	r17, 0x00	; 0
  46:	a2 e6       	ldi	r26, 0x62	; 98
  48:	b0 e0       	ldi	r27, 0x00	; 0
  4a:	01 c0       	rjmp	.+2      	; 0x4e <.do_clear_bss_start>
0000004c <.do_clear_bss_loop>:
  4c:	1d 92       	st	X+, r1
0000004e <.do_clear_bss_start>:
  4e:	a5 37       	cpi	r26, 0x75	; 117
  50:	b1 07       	cpc	r27, r17
  52:	e1 f7       	brne	.-8      	; 0x4c <.do_clear_bss_loop>
  54:	41 d1       	rcall	.+642    	; 0x2d8 <main>
  56:	8d c1       	rjmp	.+794    	; 0x372 <_exit>
00000058 <__bad_interrupt>:
  58:	d3 cf       	rjmp	.-90     	; 0x0 <__vectors>
0000005a <__vector_5>:
// __Functions:__
//   - IRQ:
ISR(TIMER1_OVF_vect)  // TMR1 overflow interupt
	{
  5a:	1f 92       	push	r1
  5c:	0f 92       	push	r0
  5e:	0f b6       	in	r0, 0x3f	; 63
  60:	0f 92       	push	r0
  62:	11 24       	eor	r1, r1
  64:	8f 93       	push	r24
	if(u8_tmr1_ovf_counter_allowed == 1)
  66:	80 91 63 00 	lds	r24, 0x0063
  6a:	81 30       	cpi	r24, 0x01	; 1
  6c:	29 f4       	brne	.+10     	; 0x78 <__vector_5+0x1e>
    	{
		u8_tmr1_ovf_counter++;
  6e:	80 91 62 00 	lds	r24, 0x0062
  72:	8f 5f       	subi	r24, 0xFF	; 255
  74:	80 93 62 00 	sts	0x0062, r24
		}
	if(u8_tmr1_ovf_counter == 255)     // Too long time for waiting for second interrupt
  78:	80 91 62 00 	lds	r24, 0x0062
  7c:	8f 3f       	cpi	r24, 0xFF	; 255
  7e:	39 f4       	brne	.+14     	; 0x8e <__vector_5+0x34>
        {
        u8_ext_int_counter = 1;
  80:	81 e0       	ldi	r24, 0x01	; 1
  82:	80 93 60 00 	sts	0x0060, r24
        u8_tmr1_ovf_counter_allowed = 0;
  86:	10 92 63 00 	sts	0x0063, r1
		u8_tmr1_ovf_counter = 0;
  8a:	10 92 62 00 	sts	0x0062, r1
        }
	};
  8e:	8f 91       	pop	r24
  90:	0f 90       	pop	r0
  92:	0f be       	out	0x3f, r0	; 63
  94:	0f 90       	pop	r0
  96:	1f 90       	pop	r1
  98:	18 95       	reti
0000009a <__vector_3>:
ISR(TIMER1_CAPT_vect) //external interupt in ICP (PIND6)
	{
  9a:	1f 92       	push	r1
  9c:	0f 92       	push	r0
  9e:	0f b6       	in	r0, 0x3f	; 63
  a0:	0f 92       	push	r0
  a2:	11 24       	eor	r1, r1
  a4:	2f 93       	push	r18
  a6:	8f 93       	push	r24
  a8:	9f 93       	push	r25
	if(u8_ext_int_counter == 1) //first interupt
  aa:	20 91 60 00 	lds	r18, 0x0060
  ae:	21 30       	cpi	r18, 0x01	; 1
  b0:	61 f4       	brne	.+24     	; 0xca <__vector_3+0x30>
		{
		u16_tmr1_start_value = ICR1;
  b2:	84 b5       	in	r24, 0x24	; 36
  b4:	95 b5       	in	r25, 0x25	; 37
  b6:	90 93 66 00 	sts	0x0066, r25
  ba:	80 93 65 00 	sts	0x0065, r24
		u8_ext_int_counter = 2;
  be:	82 e0       	ldi	r24, 0x02	; 2
  c0:	80 93 60 00 	sts	0x0060, r24
		u8_tmr1_ovf_counter_allowed = 1;
  c4:	20 93 63 00 	sts	0x0063, r18
  c8:	0d c0       	rjmp	.+26     	; 0xe4 <__stack+0x5>
		}
	else //u8_ext_int_counter == 2 - second interupt
		{
		u16_tmr1_stop_value = ICR1;
  ca:	84 b5       	in	r24, 0x24	; 36
  cc:	95 b5       	in	r25, 0x25	; 37
  ce:	90 93 68 00 	sts	0x0068, r25
  d2:	80 93 67 00 	sts	0x0067, r24
		u8_ext_int_counter = 1;
  d6:	81 e0       	ldi	r24, 0x01	; 1
  d8:	80 93 60 00 	sts	0x0060, r24
		u8_tmr1_ovf_counter_allowed = 0;
  dc:	10 92 63 00 	sts	0x0063, r1
		u8_calc_func_allowed = 1;
  e0:	80 93 64 00 	sts	0x0064, r24
		};
	};
  e4:	9f 91       	pop	r25
  e6:	8f 91       	pop	r24
  e8:	2f 91       	pop	r18
  ea:	0f 90       	pop	r0
  ec:	0f be       	out	0x3f, r0	; 63
  ee:	0f 90       	pop	r0
  f0:	1f 90       	pop	r1
  f2:	18 95       	reti
000000f4 <Calculate_function>:
void Calculate_function()
    {
    u32_time_betwen_pulse = u8_tmr1_ovf_counter * 65535;   //old value is overwrite
  f4:	60 91 62 00 	lds	r22, 0x0062
  f8:	70 e0       	ldi	r23, 0x00	; 0
  fa:	80 e0       	ldi	r24, 0x00	; 0
  fc:	90 e0       	ldi	r25, 0x00	; 0
  fe:	2f ef       	ldi	r18, 0xFF	; 255
 100:	3f ef       	ldi	r19, 0xFF	; 255
 102:	40 e0       	ldi	r20, 0x00	; 0
 104:	50 e0       	ldi	r21, 0x00	; 0
 106:	1c d1       	rcall	.+568    	; 0x340 <__mulsi3>
 108:	60 93 69 00 	sts	0x0069, r22
 10c:	70 93 6a 00 	sts	0x006A, r23
 110:	80 93 6b 00 	sts	0x006B, r24
 114:	90 93 6c 00 	sts	0x006C, r25
    u32_time_betwen_pulse = u32_time_betwen_pulse + u16_tmr1_stop_value;
 118:	20 91 69 00 	lds	r18, 0x0069
 11c:	30 91 6a 00 	lds	r19, 0x006A
 120:	40 91 6b 00 	lds	r20, 0x006B
 124:	50 91 6c 00 	lds	r21, 0x006C
 128:	80 91 67 00 	lds	r24, 0x0067
 12c:	90 91 68 00 	lds	r25, 0x0068
 130:	a0 e0       	ldi	r26, 0x00	; 0
 132:	b0 e0       	ldi	r27, 0x00	; 0
 134:	82 0f       	add	r24, r18
 136:	93 1f       	adc	r25, r19
 138:	a4 1f       	adc	r26, r20
 13a:	b5 1f       	adc	r27, r21
 13c:	80 93 69 00 	sts	0x0069, r24
 140:	90 93 6a 00 	sts	0x006A, r25
 144:	a0 93 6b 00 	sts	0x006B, r26
 148:	b0 93 6c 00 	sts	0x006C, r27
    u32_time_betwen_pulse = u32_time_betwen_pulse - u16_tmr1_start_value;
 14c:	20 91 69 00 	lds	r18, 0x0069
 150:	30 91 6a 00 	lds	r19, 0x006A
 154:	40 91 6b 00 	lds	r20, 0x006B
 158:	50 91 6c 00 	lds	r21, 0x006C
 15c:	80 91 65 00 	lds	r24, 0x0065
 160:	90 91 66 00 	lds	r25, 0x0066
 164:	a0 e0       	ldi	r26, 0x00	; 0
 166:	b0 e0       	ldi	r27, 0x00	; 0
 168:	28 1b       	sub	r18, r24
 16a:	39 0b       	sbc	r19, r25
 16c:	4a 0b       	sbc	r20, r26
 16e:	5b 0b       	sbc	r21, r27
 170:	20 93 69 00 	sts	0x0069, r18
 174:	30 93 6a 00 	sts	0x006A, r19
 178:	40 93 6b 00 	sts	0x006B, r20
 17c:	50 93 6c 00 	sts	0x006C, r21
    u32_temp = u32_time_betwen_pulse;
 180:	80 91 69 00 	lds	r24, 0x0069
 184:	90 91 6a 00 	lds	r25, 0x006A
 188:	a0 91 6b 00 	lds	r26, 0x006B
 18c:	b0 91 6c 00 	lds	r27, 0x006C
 190:	80 93 6d 00 	sts	0x006D, r24
 194:	90 93 6e 00 	sts	0x006E, r25
 198:	a0 93 6f 00 	sts	0x006F, r26
 19c:	b0 93 70 00 	sts	0x0070, r27
    u32_temp >>= 16;
 1a0:	80 91 6d 00 	lds	r24, 0x006D
 1a4:	90 91 6e 00 	lds	r25, 0x006E
 1a8:	a0 91 6f 00 	lds	r26, 0x006F
 1ac:	b0 91 70 00 	lds	r27, 0x0070
 1b0:	cd 01       	movw	r24, r26
 1b2:	aa 27       	eor	r26, r26
 1b4:	bb 27       	eor	r27, r27
 1b6:	80 93 6d 00 	sts	0x006D, r24
 1ba:	90 93 6e 00 	sts	0x006E, r25
 1be:	a0 93 6f 00 	sts	0x006F, r26
 1c2:	b0 93 70 00 	sts	0x0070, r27
    u8_time_part_3 = (char)u32_temp; // high byte
 1c6:	80 91 6d 00 	lds	r24, 0x006D
 1ca:	90 91 6e 00 	lds	r25, 0x006E
 1ce:	a0 91 6f 00 	lds	r26, 0x006F
 1d2:	b0 91 70 00 	lds	r27, 0x0070
 1d6:	80 93 74 00 	sts	0x0074, r24
	u32_temp = u32_time_betwen_pulse;
 1da:	80 91 69 00 	lds	r24, 0x0069
 1de:	90 91 6a 00 	lds	r25, 0x006A
 1e2:	a0 91 6b 00 	lds	r26, 0x006B
 1e6:	b0 91 6c 00 	lds	r27, 0x006C
 1ea:	80 93 6d 00 	sts	0x006D, r24
 1ee:	90 93 6e 00 	sts	0x006E, r25
 1f2:	a0 93 6f 00 	sts	0x006F, r26
 1f6:	b0 93 70 00 	sts	0x0070, r27
    u32_temp >>= 8;
 1fa:	80 91 6d 00 	lds	r24, 0x006D
 1fe:	90 91 6e 00 	lds	r25, 0x006E
 202:	a0 91 6f 00 	lds	r26, 0x006F
 206:	b0 91 70 00 	lds	r27, 0x0070
 20a:	89 2f       	mov	r24, r25
 20c:	9a 2f       	mov	r25, r26
 20e:	ab 2f       	mov	r26, r27
 210:	bb 27       	eor	r27, r27
 212:	80 93 6d 00 	sts	0x006D, r24
 216:	90 93 6e 00 	sts	0x006E, r25
 21a:	a0 93 6f 00 	sts	0x006F, r26
 21e:	b0 93 70 00 	sts	0x0070, r27
	u32_temp &= 0b11111111;
 222:	80 91 6d 00 	lds	r24, 0x006D
 226:	90 91 6e 00 	lds	r25, 0x006E
 22a:	a0 91 6f 00 	lds	r26, 0x006F
 22e:	b0 91 70 00 	lds	r27, 0x0070
 232:	90 70       	andi	r25, 0x00	; 0
 234:	a0 70       	andi	r26, 0x00	; 0
 236:	b0 70       	andi	r27, 0x00	; 0
 238:	80 93 6d 00 	sts	0x006D, r24
 23c:	90 93 6e 00 	sts	0x006E, r25
 240:	a0 93 6f 00 	sts	0x006F, r26
 244:	b0 93 70 00 	sts	0x0070, r27
	u8_time_part_2 = (char)u32_temp; // middle byte
 248:	80 91 6d 00 	lds	r24, 0x006D
 24c:	90 91 6e 00 	lds	r25, 0x006E
 250:	a0 91 6f 00 	lds	r26, 0x006F
 254:	b0 91 70 00 	lds	r27, 0x0070
 258:	80 93 73 00 	sts	0x0073, r24
	u32_temp = u32_time_betwen_pulse;
 25c:	80 91 69 00 	lds	r24, 0x0069
 260:	90 91 6a 00 	lds	r25, 0x006A
 264:	a0 91 6b 00 	lds	r26, 0x006B
 268:	b0 91 6c 00 	lds	r27, 0x006C
 26c:	80 93 6d 00 	sts	0x006D, r24
 270:	90 93 6e 00 	sts	0x006E, r25
 274:	a0 93 6f 00 	sts	0x006F, r26
 278:	b0 93 70 00 	sts	0x0070, r27
	u32_temp &= 0b11111111;
 27c:	80 91 6d 00 	lds	r24, 0x006D
 280:	90 91 6e 00 	lds	r25, 0x006E
 284:	a0 91 6f 00 	lds	r26, 0x006F
 288:	b0 91 70 00 	lds	r27, 0x0070
 28c:	90 70       	andi	r25, 0x00	; 0
 28e:	a0 70       	andi	r26, 0x00	; 0
 290:	b0 70       	andi	r27, 0x00	; 0
 292:	80 93 6d 00 	sts	0x006D, r24
 296:	90 93 6e 00 	sts	0x006E, r25
 29a:	a0 93 6f 00 	sts	0x006F, r26
 29e:	b0 93 70 00 	sts	0x0070, r27
    u8_time_part_1 = (char)u32_temp; // low byte
 2a2:	80 91 6d 00 	lds	r24, 0x006D
 2a6:	90 91 6e 00 	lds	r25, 0x006E
 2aa:	a0 91 6f 00 	lds	r26, 0x006F
 2ae:	b0 91 70 00 	lds	r27, 0x0070
 2b2:	80 93 72 00 	sts	0x0072, r24
    };
 2b6:	08 95       	ret
000002b8 <Send_function>:
void Send_function()
	{
	UDR = u8_time_part_3; /* Put data into buffer, sends the data */
 2b8:	80 91 74 00 	lds	r24, 0x0074
 2bc:	8c b9       	out	0x0c, r24	; 12
	while ( !( UCSRA & (1<<UDRE)) );// Wait for empty transmit buffer
 2be:	5d 9b       	sbis	0x0b, 5	; 11
 2c0:	fe cf       	rjmp	.-4      	; 0x2be <Send_function+0x6>
	UDR = u8_time_part_2; /* Put data into buffer, sends the data */
 2c2:	80 91 73 00 	lds	r24, 0x0073
 2c6:	8c b9       	out	0x0c, r24	; 12
	while ( !( UCSRA & (1<<UDRE)) );
 2c8:	5d 9b       	sbis	0x0b, 5	; 11
 2ca:	fe cf       	rjmp	.-4      	; 0x2c8 <Send_function+0x10>
	UDR = u8_time_part_1; /* Put data into buffer, sends the data */
avr-objdump: Warning: '>' is not an ordinary file
avr-objdump: bin\Debug\chronograf.elf.lss: File format not recognized
 2cc:	80 91 72 00 	lds	r24, 0x0072
 2d0:	8c b9       	out	0x0c, r24	; 12
	while ( !( UCSRA & (1<<UDRE)) );
 2d2:	5d 9b       	sbis	0x0b, 5	; 11
 2d4:	fe cf       	rjmp	.-4      	; 0x2d2 <Send_function+0x1a>
	};
 2d6:	08 95       	ret
000002d8 <main>:
    // Variables:
    //unsigned char u8_temp = 0;
    // Ports settings:
    DDRB = 0b11111110;
 2d8:	8e ef       	ldi	r24, 0xFE	; 254
 2da:	87 bb       	out	0x17, r24	; 23
	DDRD = 0b0000000;
 2dc:	11 ba       	out	0x11, r1	; 17
    // Timer1 settings:
    TCNT1 = 0;// high an low TMR1 value register
 2de:	1d bc       	out	0x2d, r1	; 45
 2e0:	1c bc       	out	0x2c, r1	; 44
	TCCR1B = 0b01000001; //TMR1 start, prescaler 1:1
 2e2:	81 e4       	ldi	r24, 0x41	; 65
 2e4:	8e bd       	out	0x2e, r24	; 46
	// UART settings:
    u8_temp = 0b00000000;
 2e6:	10 92 71 00 	sts	0x0071, r1
    UBRRH = u8_temp;
 2ea:	80 91 71 00 	lds	r24, 0x0071
 2ee:	82 b9       	out	0x02, r24	; 2
    u8_temp = 0b10000001;
 2f0:	81 e8       	ldi	r24, 0x81	; 129
 2f2:	80 93 71 00 	sts	0x0071, r24
	UBRRL = u8_temp;		//baudrate 9600
 2f6:	80 91 71 00 	lds	r24, 0x0071
 2fa:	89 b9       	out	0x09, r24	; 9
	u8_temp = 0b00000000;
 2fc:	10 92 71 00 	sts	0x0071, r1
	UCSRA = u8_temp;
 300:	80 91 71 00 	lds	r24, 0x0071
 304:	8b b9       	out	0x0b, r24	; 11
	u8_temp = 0b00001000;
 306:	88 e0       	ldi	r24, 0x08	; 8
 308:	80 93 71 00 	sts	0x0071, r24
	UCSRB = u8_temp;		//Tx on
 30c:	80 91 71 00 	lds	r24, 0x0071
 310:	8a b9       	out	0x0a, r24	; 10
	u8_temp = 0b00001110;
 312:	8e e0       	ldi	r24, 0x0E	; 14
 314:	80 93 71 00 	sts	0x0071, r24
	UCSRC = u8_temp;		//8 data bits, no parity, async.
 318:	80 91 71 00 	lds	r24, 0x0071
 31c:	83 b9       	out	0x03, r24	; 3
	//interupts settings
	TIMSK = 0b10001000; //Input Capture Interrupt Enable
 31e:	88 e8       	ldi	r24, 0x88	; 136
 320:	89 bf       	out	0x39, r24	; 57
	GIMSK = 0b01000000;// ext int on PIND2 allowed
 322:	80 e4       	ldi	r24, 0x40	; 64
 324:	8b bf       	out	0x3b, r24	; 59
	MCUCR = 0b00000011;// interrupt start when rising edge on PIND2
 326:	83 e0       	ldi	r24, 0x03	; 3
 328:	85 bf       	out	0x35, r24	; 53
    sei(); //globall interupts allowed
 32a:	78 94       	sei
    {
        while(u8_calc_func_allowed == 0);       // wait until time has measured
 32c:	80 91 64 00 	lds	r24, 0x0064
 330:	88 23       	and	r24, r24
 332:	e1 f3       	breq	.-8      	; 0x32c <main+0x54>
		cli();	//globall interupts disabled
 334:	f8 94       	cli
        Calculate_function();
 336:	de de       	rcall	.-580    	; 0xf4 <Calculate_function>
        //Send_function();  //for simulate
		//_delay_ms(1000);    //for real test
		u8_calc_func_allowed = 0;
 338:	10 92 64 00 	sts	0x0064, r1
		sei();  //globall interupts allowed
 33c:	78 94       	sei
 33e:	f6 cf       	rjmp	.-20     	; 0x32c <main+0x54>
00000340 <__mulsi3>:
 340:	ff 27       	eor	r31, r31
 342:	ee 27       	eor	r30, r30
 344:	bb 27       	eor	r27, r27
 346:	aa 27       	eor	r26, r26
00000348 <__mulsi3_loop>:
 348:	60 ff       	sbrs	r22, 0
 34a:	04 c0       	rjmp	.+8      	; 0x354 <__mulsi3_skip1>
 34c:	a2 0f       	add	r26, r18
 34e:	b3 1f       	adc	r27, r19
 350:	e4 1f       	adc	r30, r20
 352:	f5 1f       	adc	r31, r21
00000354 <__mulsi3_skip1>:
 354:	22 0f       	add	r18, r18
 356:	33 1f       	adc	r19, r19
 358:	44 1f       	adc	r20, r20
 35a:	55 1f       	adc	r21, r21
 35c:	96 95       	lsr	r25
 35e:	87 95       	ror	r24
 360:	77 95       	ror	r23
 362:	67 95       	ror	r22
 364:	89 f7       	brne	.-30     	; 0x348 <__mulsi3_loop>
 366:	00 97       	sbiw	r24, 0x00	; 0
 368:	76 07       	cpc	r23, r22
 36a:	71 f7       	brne	.-36     	; 0x348 <__mulsi3_loop>
0000036c <__mulsi3_exit>:
 36c:	cf 01       	movw	r24, r30
 36e:	bd 01       	movw	r22, r26
 370:	08 95       	ret
00000372 <_exit>:
 372:	f8 94       	cli
00000374 <__stop_program>:
 374:	ff cf       	rjmp	.-2      	; 0x374 <__stop_program>
Process terminated with status 1 (0 minutes, 5 seconds)
0 errors, 3 warnings
