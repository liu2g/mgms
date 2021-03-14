#define __AVR_ATmega328P__ //import register names
#include <avr/io.h>
#include <util/delay.h>
#include <stdlib.h>
#include <stdio.h>
#include <stdint.h>
#include "uart_lib.h"
#include "SHT_lib.h"


#define FOSC 16000000 // Clock Speed
#define BAUD 9600
#define UBRR ((FOSC/16/BAUD) -1)

#define TW_SCL_PIN			PORTC5
#define TW_SDA_PIN			PORTC4

#define DEBUG_MODE  0


int main (void) {
    //init
    // DDRB |= (1<<PB5); //1 marks an output

	UART_init(UBRR);
    uint16_t error_code = SHT_init();
    uint16_t temp = 10;
    uint16_t hum = 10;
    uint16_t status = 10;
    char DataString[20];
    _delay_ms(100);

    while (1) {
        // blink() // this is in extralib

        // PORTB = 0b00100000; //LED on
        // _delay_ms (500);
        // PORTB = 0b00000000; //LED off
        // _delay_ms (500);

        error_code = SHT_check(&status);

        if (DEBUG_MODE) {
            itoa(error_code, DataString, 16); 
            UART_transmit_ln(DataString);
        } 
        else {
            itoa(temp, DataString, 16);
            UART_transmit(DataString);

            DataString[0] = '\t';
            UART_transmit(DataString);

            itoa(hum, DataString, 16);
            UART_transmit(DataString);

            DataString[0] = '\t';
            UART_transmit(DataString);

            itoa(status, DataString, 16);
            UART_transmit_ln(DataString);

        }

        error_code = SHT_measure_debug(&temp, &hum);

        
        _delay_ms (1000);
    }
    return(0);
}

