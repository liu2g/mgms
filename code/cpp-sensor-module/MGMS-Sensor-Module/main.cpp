 /////////////////////////////////////////////////////////////////////////////////////////////
 //	MGMS Sensor Module
 //	main.cpp
 //	Alan Trester, tresteat@mail.uc.edu ; Zuguang Liu liu2z2@mail.uc.edu 
 //	March 14, 2021
 /////////////////////////////////////////////////////////////////////////////////////////////

#include <avr/io.h>
#include <avr/interrupt.h>			// To use interrupts
#include <stdlib.h>					// qsort function
#include <stdio.h>					// USART stuff
#include <string.h>					// Strings
#include <util/delay.h>				// delay functions
#include "AnalogSensors.h"			// Custom Library Supporting ADC Reads for Soil Temp, Soil Moisture, Sunlight
#include "SHT35.h"					// Custom Library Supporting SHT35 Sensor Operations

/////////////////////////////////////////////////////////////////////////////////////////////

// UART Functions & Vars
////// RX
volatile char RXBuffer[30] ;		// Populated as new data is received in the RXC ISR. Checked in main()
volatile uint8_t RXByteCount = 0 ;	// Position of next byte to populate in RXBuffer. Used in RXC ISR.
////// TX
char TXBuffer[30] ;					// Used to transmit data in TX ISR. Set in FullReport()
volatile uint8_t TXByteCount = 1 ;	// Position of next byte to transmit. Used in TX ISR
////// Other
void memset_volatile(volatile void *s, char c, size_t n) ;		// memset function that accepts volatile variables - Needed to reset volatile buffers

// Data Collection Functions & Vars
float SoilTemp ;					// Soil Temperature.
char SoilTempASCII[7] ;				// 6 Character ASCII representation

float SoilMoist ;					// Soil Moisture.
char SoilMoistASCII[7] ;			// 6 Character ASCII representation. 7th byte for \0

float AirTemp ;						// Air Temperature.
char AirTempASCII[7] ;				// 6 Character ASCII representation

float Humidity ;					// Humidity.
char HumidityASCII[7] ;				// 6 Character ASCII representation

void FullReport() ;					// Compiles a string with all sensor information and begins transmission
char FullReportASCII[28] ;			// Concatenated report garden status. 14th byte for \0

/////////////////////////////////////////////////////////////////////////////////////////////
// memset_volatile - memset function implementation that accept volatile variables as inputs. Found on stackoverflow
// This is required to be above main since it accepts volatile inputs
void memset_volatile(volatile char *s, char c, size_t n)
{
	volatile char *p = s ;
	while (n-- > 0)
	{
		*p++ = c ;
	}
}

/////////////////////////////////////////////////////////////////////////////////////////////
// Main Function - Conrol Register Config; Scan RX buffer and react to the correct message.
int main(void)
{
		ADC_init() ;													// Initialize ADC config
		SHT_init() ;													// Initialize I2C
		
    	// Configure USART
    	uint16_t baud = 103 ;											// 9600bps (@16MHz)
    	UCSR0B = (1<<TXCIE0) | (1<<RXCIE0) |(1<<TXEN0) | (1<<RXEN0) ;	// Enable transmitter/receiver/Enable TX/RX Interrupts
    	UCSR0C = 0x06 ;													// Frame format = 8 data + 1 stop bit
    	UBRR0H = (baud>>8) ;											// Configure baud rate
    	UBRR0L = (baud) ;
    	
    	// Enable all Interrupts
    	sei() ;
    	
    	// Main Program
    	char RXBufferCpy[30] ;															// Copy stores contents of RXBuffer
		uint8_t RXByteCountCpy ;														// Copy stores contents of RXByteCount
		bool CheckFlag = false ;														// Tracks whether a string has already been checked (Need to check twice to avoid bugs)
    	
    	while (1)																		// Loop Forever
    	{
	    	strcpy( RXBufferCpy, const_cast<char*>(RXBuffer) ) ;						// Copies the contents of the RXBuffer into a non-volatile copy
	    	RXByteCountCpy = RXByteCount ;												// Copies the RXByteCount
			
			if ( strcmp(RXBufferCpy, "Request Info") == 0)								// Check the message in the RXBuffer
	    	{
		    	UpdateSoilTemp(&SoilTemp, SoilTempASCII) ;								// Fetch and save the soil temperature
		    	UpdateSoilMoist(&SoilMoist, SoilMoistASCII) ;							// Fetch and save the soil moisture
				UpdateTempHumid(&AirTemp, AirTempASCII, &Humidity, HumidityASCII) ;		// Fetch and save air temp and humidity
		    	
				memset_volatile(RXBuffer, 0, 30) ;										// Reset the RXBuffer
				CheckFlag = false ;														// Reset the CheckFlag
				FullReport() ;
	    	}
	    	else if ( RXByteCountCpy == 0 && strcmp(RXBufferCpy, "") != 0 )				// If the last character was a \r but its the wrong message
	    	{
				if (CheckFlag)
				{
					memset_volatile(RXBuffer, 0, 30) ;										// Reset the RXBuffer
					CheckFlag = false ;
				}
				else
				{
					CheckFlag = true ;
				}
		    	
	    	}
    	}
}

/////////////////////////////////////////////////////////////////////////////////////////////
// FullReport - Builds the information string to send and begins TX process
void FullReport()
{
	memset(FullReportASCII, 0, 28) ;						// Reset the string
	
	strcpy(FullReportASCII, SoilTempASCII) ;				// Copy the contents of SoilTemp into the String
	strcat(FullReportASCII, ";") ;							// Addend ;
	strcat(FullReportASCII, SoilMoistASCII) ;				// Addend Soil Moisture
	strcat(FullReportASCII, ";") ;							// Addend ;
	strcat(FullReportASCII, AirTempASCII) ;					// Addend Air Temperature
	strcat(FullReportASCII, ";") ;							// Addend ;
	strcat(FullReportASCII, HumidityASCII) ;				// Addend Humidity	
		
	strcpy(TXBuffer, FullReportASCII) ;						// Copy the new string into our transmission buffer
	UDR0 = TXBuffer[0] ;									// Transmit the first byte of data
}

/////////////////////////////////////////////////////////////////////////////////////////////
// USART_RX_vect - Triggers whenever the UART module indicates that it has received a new byte of data
// Saves latest byte onto the end of the RXBuffer. Changes carriage returns to terminator characters
ISR(USART_RX_vect)
{
	RXBuffer[RXByteCount] = UDR0 ;			// Retrieve the Received Byte
	
	if( RXBuffer[RXByteCount] == '\r')		// If it's a carriage return character
	{
		RXBuffer[RXByteCount] = '\0' ;		// Change it to a termination character
		RXByteCount = 0 ;					// Reset the Byte Counter (The actual word gets reset in main()
	}
	else if( RXByteCount == 29 )			// If we for some reason reached the end of our buffer
	{
		memset_volatile(RXBuffer, 0, 30) ;	// Reset the RXBuffer
		RXByteCount = 0 ;					// Reset the Byte Counter
	}
	else									// Otherwise
	{
		RXByteCount++ ;						// Increment the Byte Counter
	}
}

/////////////////////////////////////////////////////////////////////////////////////////////
// USART_TX_vect - Triggers whenever the UART module indicates that an outgoing transfer has been completed
// Transmits the next byte of the TXBuffer
ISR(USART_TX_vect)
{
	if (TXBuffer[TXByteCount] != '\0')		// If we haven't reached the end of the buffer
	{
		UDR0 = TXBuffer[TXByteCount] ;		// Send the next Byte
		TXByteCount++ ;						// Increment the counter
	}
	else									// Otherwise
	{
		TXByteCount = 1 ;					// Reset the counter
	}
}