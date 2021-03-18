#ifndef UART_LIB_H_
#define UART_LIB_H_

#include <avr/io.h> //defines pins, ports etc
#include <util/delay.h> //functions for wasting time
#include <string.h>

void UART_init(unsigned int ubrr);
void UART_transmit(char msg[]);
void UART_transmit_ln(char msg[]);


#endif // UART_LIB_H_
