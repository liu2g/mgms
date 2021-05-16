 //////////////////////////////////////////////////////////////////////////////
 //    MGMS Sensor Module main.cpp
 //    Alan Trester <tresteat@mail.uc.edu> ; Zuguang Liu <liu2z2@mail.uc.edu>
 //    March 14, 2021
 //////////////////////////////////////////////////////////////////////////////

#include <avr/io.h>
#include <avr/interrupt.h>
#include <stdlib.h>         // qsort
#include <stdio.h>          // USART
#include <string.h>
#include <util/delay.h>
#include "AnalogSensors.h"
#include "SHT35.h"

////////////////////////////////////////////////////////////////////////////////
// UART Functions & Vars

volatile char RXBuffer[30] ;
// Populated as new data is received in the RXC ISR. Checked in main()
volatile uint8_t RXByteCount = 0 ;
// Position of next byte to populate in RXBuffer. Used in RXC ISR.

char TXBuffer[30] ;
// Used to transmit data in TX ISR. Set in FullReport()
volatile uint8_t TXByteCount = 1 ;
// Position of next byte to transmit. Used in TX ISR

void memset_volatile(volatile void *s, char c, size_t n) ;
// memset that accepts volatile variables - Needed to reset volatile buffers

// Data Collection Functions & Vars
float SoilTemp ;         // Soil Temperature.
char SoilTempASCII[7] ;

float SoilMoist ;        // Soil Moisture.
char SoilMoistASCII[7] ;

float AirTemp ;          // Air Temperature.
char AirTempASCII[7] ;

float Humidity ;         // Humidity.
char HumidityASCII[7] ;

void FullReport() ;     // Concatenated with all above
char FullReportASCII[28] ;            // 14th byte reserved for \0

///////////////////////////////////////////////////////////////////////////////
// memset_volatile - memset function implementation that accept volatile
// variables as inputs. Found on stackoverflow This is required to be above main
// since it accepts volatile inputs
void memset_volatile(volatile char *s, char c, size_t n)
{
    volatile char *p = s ;
    while (n-- > 0)
    {
        *p++ = c ;
    }
}

///////////////////////////////////////////////////////////////////////////////
// Main Function - Conrol Register Config; Scan RX buffer and react to the
// correct message.
int main(void)
{
        ADC_init() ;
        SHT_init() ;

        // Configure USART
        uint16_t baud = 103 ;  // 9600bps (@16MHz)
        UCSR0B = (1<<TXCIE0) | (1<<RXCIE0) |(1<<TXEN0) | (1<<RXEN0) ;
        // Enable transmitter/receiver/Enable TX/RX Interrupts
        UCSR0C = 0x06 ;        // Frame format = 8 data + 1 stop bit
        UBRR0H = (baud>>8) ;   // Configure baud rate
        UBRR0L = (baud) ;

        // Enable all Interrupts
        sei() ;

        // Main Program
        char RXBufferCpy[30] ;     // Copy stores contents of RXBuffer
        uint8_t RXByteCountCpy ;   // Copy stores contents of RXByteCount
        bool CheckFlag = false ;   // Double checked flag for strings

        while (1)
        {
            strcpy( RXBufferCpy, const_cast<char*>(RXBuffer) ) ;
            // Copies the contents of the RXBuffer into a non-volatile copy
            RXByteCountCpy = RXByteCount ;

            if ( strcmp(RXBufferCpy, "Request Info") == 0)
            {
                UpdateSoilTemp(&SoilTemp, SoilTempASCII) ;
                UpdateSoilMoist(&SoilMoist, SoilMoistASCII) ;
                UpdateTempHumid(&AirTemp, AirTempASCII, &Humidity,
                                HumidityASCII);

                memset_volatile(RXBuffer, 0, 30) ;   // Reset buffer
                CheckFlag = false ;                  // Reset flag
                FullReport() ;
            }
            else if ( RXByteCountCpy == 0 && strcmp(RXBufferCpy, "") != 0 )
            // If the last character was a \r but its the wrong message
            {
                if (CheckFlag)
                {
                    memset_volatile(RXBuffer, 0, 30); // Reset the buffer
                    CheckFlag = false ;
                }
                else
                {
                    CheckFlag = true ;
                }

            }
        }
}

///////////////////////////////////////////////////////////////////////////////
// FullReport - Builds the information string to send and begins TX process
void FullReport()
{
    memset(FullReportASCII, 0, 28) ;                        // Reset the string

    strcpy(FullReportASCII, SoilTempASCII) ;
    strcat(FullReportASCII, ";") ;
    strcat(FullReportASCII, SoilMoistASCII) ;
    strcat(FullReportASCII, ";") ;
    strcat(FullReportASCII, AirTempASCII) ;
    strcat(FullReportASCII, ";") ;
    strcat(FullReportASCII, HumidityASCII) ;

    strcpy(TXBuffer, FullReportASCII) ;
    UDR0 = TXBuffer[0] ;             // Transmit the first byte of data
}

///////////////////////////////////////////////////////////////////////////////
// USART_RX_vect - Triggers whenever the UART module indicates that it has
// received a new byte of data Saves latest byte onto the end of the RXBuffer.
// Changes carriage returns to terminator characters
ISR(USART_RX_vect)
{
    RXBuffer[RXByteCount] = UDR0 ;            // Retrieve the Received Byte

    if( RXBuffer[RXByteCount] == '\r')
    {
        RXBuffer[RXByteCount] = '\0' ;        // Termination character
        RXByteCount = 0 ;                     // Reset the Byte Counter
        //The actual word gets reset in main()
    }
    else if( RXByteCount == 29 )              // At the end of our buffer
    {
        memset_volatile(RXBuffer, 0, 30) ;    // Reset the RXBuffer
        RXByteCount = 0 ;                     // Reset the Byte Counter
    }
    else
    {
        RXByteCount++ ;
    }
}

///////////////////////////////////////////////////////////////////////////////
// USART_TX_vect - Triggers whenever the UART module indicates that an outgoing
// transfer has been completed Transmits the next byte of the TXBuffer
ISR(USART_TX_vect)
{
    if (TXBuffer[TXByteCount] != '\0')        // Not yet at end of the buffer
    {
        UDR0 = TXBuffer[TXByteCount] ;        // Send the next Byte
        TXByteCount++ ;
    }
    else
    {
        TXByteCount = 1 ;
    }
}