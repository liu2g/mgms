#define __AVR_ATmega328P__ //import register names
#include <avr/io.h>
#include <util/delay.h>
// #include "extralib.h" //additional library

int main (void) {
    //init
    DDRB |= (1<<PB5); //1 marks an output

    while (1) {
        // blink() // this is in extralib

        PORTB = 0b00100000; //LED on
        _delay_ms (1000);

        PORTB = 0b00000000; //LED off
        _delay_ms (1000);
    }
    return(0);
}