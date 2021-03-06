/*

***********************************
*        Chronograph V1.0         *
*   (counter and sender by UART)  *
*	     	20 MHz Xtal		   	  *
*	    	ATTiny 2313		      *
*   		by Laabicz		  *
*	    last rev. 25.09.2012	  *
***********************************


PINA0: Xtal
PINA1: Xtal
PIND1: UART Tx
PIND6: input ext. with ICP int. start/stop signal


UART parameters:
    8 bit data
    1 bit stop
    no parity
    Rx off
    Tx on
    async.
    9600 baudrate



*/
// __headers:
#include <avr/io.h>
#include <avr/interrupt.h>

#define F_CPU 20000000UL
#include <util/delay.h> // for debugging



// __Variables:__

//   - counters:
volatile unsigned char u8_tmr1_ovf_counter = 0; // 0 - 127
volatile unsigned char u8_ext_int_counter = 1; // 1 - 2

//   - bollean:
volatile unsigned char u8_tmr1_ovf_counter_allowed = 0; // 0 - 1
volatile unsigned char u8_calc_func_allowed = 0; // 0 - 1

//   - others:
volatile unsigned int u16_tmr1_start_value = 0;
volatile unsigned int u16_tmr1_stop_value = 0;
volatile unsigned long u32_time_betwen_pulse = 0;
volatile unsigned long u32_temp = 0;

volatile unsigned char u8_temp = 0;
volatile unsigned char u8_time_part_1 = 0;
volatile unsigned char u8_time_part_2 = 0;
volatile unsigned char u8_time_part_3 = 0;



// __Functions:__

//   - IRQ:

ISR(TIMER1_OVF_vect)  // TMR1 overflow interupt
	{
	if(u8_tmr1_ovf_counter_allowed == 1)
    	{
		u8_tmr1_ovf_counter++;
		}
	if(u8_tmr1_ovf_counter == 255)     // Too long time for waiting for second interrupt
        {
        u8_ext_int_counter = 1;
        u8_tmr1_ovf_counter_allowed = 0;
		u8_tmr1_ovf_counter = 0;
        }
	};



ISR(TIMER1_CAPT_vect) //external interupt in ICP (PIND6)
	{
	if(u8_ext_int_counter == 1) //first interupt
		{
		u16_tmr1_start_value = ICR1;
		u8_ext_int_counter = 2;
		u8_tmr1_ovf_counter_allowed = 1;
		}
	else //u8_ext_int_counter == 2 - second interupt
		{
		u16_tmr1_stop_value = ICR1;
		u8_ext_int_counter = 1;
		u8_tmr1_ovf_counter_allowed = 0;
		u8_calc_func_allowed = 1;
		};
	};



//   - Others:

void Calculate_function()
    {


    u32_time_betwen_pulse = u8_tmr1_ovf_counter * 65535;   //old value is overwrite
    u32_time_betwen_pulse = u32_time_betwen_pulse + u16_tmr1_stop_value;
    u32_time_betwen_pulse = u32_time_betwen_pulse - u16_tmr1_start_value;


    u32_temp = u32_time_betwen_pulse;
    u32_temp >>= 16;
    u8_time_part_3 = (char)u32_temp; // high byte

	u32_temp = u32_time_betwen_pulse;
    u32_temp >>= 8;
	u32_temp &= 0b11111111;
	u8_time_part_2 = (char)u32_temp; // middle byte

	u32_temp = u32_time_betwen_pulse;
	u32_temp &= 0b11111111;
    u8_time_part_1 = (char)u32_temp; // low byte

    };


void Send_function()
	{

	UDR = u8_time_part_3; /* Put data into buffer, sends the data */
	while ( !( UCSRA & (1<<UDRE)) );// Wait for empty transmit buffer
	UDR = u8_time_part_2; /* Put data into buffer, sends the data */
	while ( !( UCSRA & (1<<UDRE)) );
	UDR = u8_time_part_1; /* Put data into buffer, sends the data */
	while ( !( UCSRA & (1<<UDRE)) );
	};



int main(void)
{

    // Variables:
    //unsigned char u8_temp = 0;

    // Ports settings:
    DDRB = 0b11111111;
	DDRD = 0b0000010;


    // Timer1 settings:
    TCNT1 = 0;// high an low TMR1 value register
	TCCR1B = 0b01000001; //TMR1 start, prescaler 1:1




	// UART settings:
    UBRRH = 0b00000000;
	UBRRL = 0b10000001;		//baudrate 9600
	UCSRA = 0b00000000;
	UCSRB = 0b00001000;		//Tx on
	UCSRC = 0b00001110;		//8 data bits, no parity, async.


	//interupts settings
	TIMSK = 0b10001000; //Input Capture Interrupt Enable
	GIMSK = 0b01000000;// ext int on PIND2 allowed
	MCUCR = 0b00000011;// interrupt start when rising edge on PIND2
    sei(); //globall interupts allowed


	while(1)
    {



		UDR = 0b11110000; /* Put data into buffer, sends the data */
		while ( !( UCSRA & (1<<UDRE)) );

		while(u8_calc_func_allowed == 0);       // wait until time has measured

		cli();	//globall interupts disabled

        Calculate_function();
        Send_function();  //for simulate
		//_delay_ms(1000);    //for real test
		u8_calc_func_allowed = 0;

		sei();  //globall interupts allowed
    };

    return 0;
}
