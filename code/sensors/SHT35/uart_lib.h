#define __AVR_ATmega328P__ 
#include <avr/io.h> //defines pins, ports etc
#include <util/delay.h> //functions for wasting time
#include <string.h>

void UART_init(unsigned int ubrr){
/*Set baud rate */
    UBRR0H = (char)(ubrr>>8);
    UBRR0L = (char) ubrr;
    /* Enable receiver and transmitter */
    UCSR0B = (1<<RXEN0)|(1<<TXEN0);
    /* Set frame format: 8data, 2stop bit */
    UCSR0C = (1<<USBS0)|(3<<UCSZ00);
}

void UART_transmit(char msg[]){
    unsigned int i = 0;
    while(msg[i] != 0) /* print the String  "Hello from ATmega328p" */
    {
        while (!( UCSR0A & (1<<UDRE0))); /* Wait for empty transmit buffer       */
        
                                            /* When UDRE0 = 0,data transmisson ongoing.                         */
                                            /* So NOT{[UCSR0A & (1<<UDRE0)] = 0} = 1 ,While(1) loop stays there */
                                            
                                            /* When UDRE0 = 1,data transmisson completed.                       */
                                            /* So NOT{[UCSR0A & (1<<UDRE0)] = 1} = 0 ,While(0) loop fails       */
                                            
        UDR0 = msg[i];					 /* Put data into buffer, sends the data */
        i++;                             /* increment counter                    */
    }
    
    memset(msg, 0, strlen(msg));
}

void UART_transmit_ln(char msg[]){
    unsigned int i = 0;
    while(msg[i] != 0) /* print the String  "Hello from ATmega328p" */
    {
        while (!( UCSR0A & (1<<UDRE0))); /* Wait for empty transmit buffer       */
        
                                            /* When UDRE0 = 0,data transmisson ongoing.                         */
                                            /* So NOT{[UCSR0A & (1<<UDRE0)] = 0} = 1 ,While(1) loop stays there */
                                            
                                            /* When UDRE0 = 1,data transmisson completed.                       */
                                            /* So NOT{[UCSR0A & (1<<UDRE0)] = 1} = 0 ,While(0) loop fails       */
                                            
        UDR0 = msg[i];					 /* Put data into buffer, sends the data */
        i++;                             /* increment counter                    */
    }
    
    memset(msg, 0, strlen(msg));

    /* Sending '\n'  '\r' Character pair helps to format the output properly on console putty Screen */
    /*************************************************************************************************/
    /* Send "\n" Character */
        while (!( UCSR0A & (1<<UDRE0)));   /* Wait for empty transmit buffer       */
        UDR0 = '\n';					    /* Put data into buffer, sends the data */
    
    /* Send "\r" Character */
        while (!( UCSR0A & (1<<UDRE0)));   /* Wait for empty transmit buffer       */
        UDR0 = '\r';					    /* Put data into buffer, sends the data */
}