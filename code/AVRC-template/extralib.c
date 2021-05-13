#include "extralib.h"

void blink(){
    PORTB = 0b00100000; //turn on 5th LED bit/pin in PORT B (Pin13 in Arduino)
    _delay_ms (1000); //wait

    PORTB = 0b00000000; //turn off all bits/pins on PB
    _delay_ms (1000); //wait
}