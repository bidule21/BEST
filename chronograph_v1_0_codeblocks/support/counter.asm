;******************************
;* Counter and sender by UART *
;*		20 MHz Xtal			  *
;*		ATTiny 2313			  *
;*		by M. Labr ml.		  *
;*		rev. 05.06.2012		  *
;******************************
;
;pinb 7 input start counting
;pinb 6 input stop counting
;pinb 5 overflow pin control
;
;pind 1 uart tx
;
;pina 1 xtal
;pina 0 xtal
;
;UART parameters
;8 bit data
;1 bit stop
;no parity
;Rx off
;Tx on
;async.
;9600 baudrate
;
;
.nolist
.include	"tn2313def.inc"
.list

;***************************
;*        Variables        *
;***************************
.def	temp	= r16
.def	tmr1_start	= r17
.def	tmr1_stop	= r18
.def	tmr1_h		= r19
.def	tmr1_l		= r20


;***************************
;*   Interrupts vectors    *
;***************************

.cseg
.org	0x0000
		rjmp init
.org	0x0005
		rjmp tmr1_ovf	 ;isr tmr1 overflow
.org	0x0013


;***************************
;*       Init setting:	   *
;***************************
init:	ldi	temp,low(ramend) ;setting stackpointer
		out	spl,temp


		ldi tmr1_start, 0b00000001
		ldi tmr1_stop, 0b00000000
		ldi temp, 0b00111111	;pinb 7,6  input
		out	ddrb, temp			;others pinb output
		ldi temp, 0b11011111
		out portb, temp			; pull up enable


;***************************
;*       UART setting:	   *
;***************************
		ldi temp, 0b00000000
		out UBRRH, temp
		ldi temp, 0b10000001
		out UBRRL, temp		;baudrate 9600
		ldi temp, 0b00000000
		out UCSRA,temp		;
		ldi temp, 0b00001000
		out UCSRB,temp		;Tx on
		ldi temp, 0b00001110
		out UCSRC,temp		;8 data bits, no parity, async.


;***************************
;*      Main function      *
;***************************

main:	sei						;global interrupt allowed
		ldi temp, 0b10000000
		out TIMSK, temp			;tmr1 ovf interrupt allowed
		ldi temp, 0b00000000
		out TCNT1H, temp		;clearing tmr1 high register
		out TCNT1l, temp		;clearing tmr1 low register
		ldi temp, 0b11011111
		out portb, temp
		;cbi pinb, 5
									

;***************************
;*    Measuring function   *
;***************************

m_start:sbic pinb, 7			;checking start signal on pinb7
		rjmp m_start			;no signal, continue checking
		out TCCR1B, tmr1_start	;recieced signal, start measuring
m_stop:	sbic pinb, 6			;checking for stop signal on pinb6
		rjmp m_stop				;no signal, continue checking
		out TCCR1B, tmr1_stop	;recieved signal, stop measuring
		in tmr1_l, TCNT1L
		in tmr1_h, TCNT1H
		nop
		nop
		nop
		nop


;***************************
;*   Send data by UART     *
;***************************

tx_start:nop
		out UDR, tmr1_l
tx_2:	nop
		sbis UCSRA, 5
		rjmp tx_2			;wait until byte send
		out UDR, tmr1_h
tx_3:	nop
		sbis UCSRA, 5
		rjmp tx_3			;wait until byte send
		rjmp main


;***************************
;*   ISR - TMR1 Overflow   *
;***************************

tmr1_ovf:nop
		
		out TCCR1B, tmr1_stop
		ldi temp, 0b01010101
		out TCNT1L, temp
		out TCNT1H, temp
		sbi pinb, 5
		reti




