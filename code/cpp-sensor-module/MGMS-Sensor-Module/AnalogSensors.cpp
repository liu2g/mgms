/*
 * AnalogSensors.cpp
 * Custom Library Supporting ADC Reads for Soil Temp, Soil Moisture, Sunlight
 * Alan Trester tresteat@mail.uc.edu ; Zuguang Liu liu2z2@mail.uc.edu
 * 3/14/2021
 */

#include "AnalogSensors.h"

///////////////////////////////////////////////////////////////////////////////
// Necessary for qsort to work. Compares the values for 2 float values
static int CompareFloat(const void* a, const void* b)
{
    if ( *(float*)a <  *(float*)b ) return -1 ;
    if ( *(float*)a == *(float*)b ) return 0 ;
    if ( *(float*)a >  *(float*)b ) return 1 ;
}

///////////////////////////////////////////////////////////////////////////////
// Initializes the analog pins to correctly do measurements
void ADC_init()
{
    ADMUX = (0<<REFS1)|(1<<REFS0)|(0<<ADLAR)|(0<<MUX3)|(0<<MUX2)|(0<<MUX1)|
            (0<<MUX0);
    // Select Analog Port 0 and Internal Reference Voltage;
    ADCSRA = (1<<ADEN)|(1<<ADIE)|(1<<ADPS2)|(0<<ADPS1)|(0<<ADPS0);
    // Enable A/D, Enable Interrupt, Set A/D Prescalar
    DIDR0 = (1<<ADC0D) | (1<<ADC1D);
    // Disable Input Buffers
}

///////////////////////////////////////////////////////////////////////////////
// Reads Soil Temp values from ADC, reports the most likely temperature
void UpdateSoilTemp(float* TempMode, char* ASCII)
{
    ADMUX = (0<<REFS1)|(1<<REFS0)|(0<<ADLAR)|(0<<MUX3)|(0<<MUX2)|(0<<MUX1)|
            (0<<MUX0);   // Select Analog Port 0 and Internal Reference Voltage

    uint8_t i ;                         // for loop counter
    uint16_t DataH ;                    // ADC High Bits
    uint16_t DataL ;                    // ADC Low Bits
    float DataFloat ;                   // Needed for int -> float cast
    float RawValues[10] ;               // Samples for mode function

    uint8_t Counts[10] ;                // Occurrence of each value in RawData
    uint8_t MaxCount ;                  // Array location of the highest count

    // Take 10 measurements
    for (i = 0 ; i<10 ; i++)
    {
        ADCSRA |= (1<<ADSC) ;           // Begin ADC conversion on Channel 0
        while( ADCSRA & (1<<ADSC)) ;    // Wait for ADC conversion to complete

        DataL = ADCL ;
        DataH = ADCH << 8 ;
        DataH = DataH + DataL ;

        DataFloat = DataH ;             // Cast to Float
        RawValues[i] = ( ( (DataFloat / 1024)  *5 ) * 75.006 ) - 40 ;
                                        // Equation from THERM200 Datasheet
    }

    // Begin finding mode of the measured data

    qsort(RawValues, 10, sizeof(float), CompareFloat) ; // Ascending sort
    // Count occurrence of each value
    Counts[0] = 1 ;                                     // Count the first value
    for (i = 1 ; i<10 ; i++)                            // Count the rest
    {
        if ( RawValues[i] == RawValues[i-1] )
        {
            Counts[i] = Counts[i-1] + 1 ;
        }
        else
        {
            Counts[i] = 1 ;								// restart the count
        }
    }

    // Finds the largest count
    MaxCount = 0 ;                                      // Count the first value
    for (i = 1 ; i<10 ; i++)                            // Count the rest
    {
        if ( Counts[i] > Counts[MaxCount] ) MaxCount = i ;
        // Update the MaxCount as necessary
    }

    *TempMode = RawValues[MaxCount] ;
    dtostrf( RawValues[MaxCount], 6, 2, ASCII) ;
}

///////////////////////////////////////////////////////////////////////////////
// Reads Soil Moisture values from ADC, reports the most likely moisture
void UpdateSoilMoist(float* MoistMode, char* ASCII)
{
    ADMUX = (0<<REFS1)|(1<<REFS0)|(0<<ADLAR)|(0<<MUX3)|(0<<MUX2)|(0<<MUX1)|
            (1<<MUX0) ;
    // Select Analog Port 1 and Internal Reference Voltage;

    uint8_t i ;
    uint16_t DataH ;
    uint16_t DataL ;
    float Voltage ;                      // Voltage for piecewise approximation
    float RawValues[10] ;                // Samples for mode function

    uint8_t Counts[10] ;                 // Occurrence of each value in RawData
    uint8_t MaxCount ;                   // Address of the highest count

    // Take 10 measurements
    for (i = 0 ; i<10 ; i++)
    {
        ADCSRA |= (1<<ADSC) ;            // Begin ADC conversion on Channel 0
        while( ADCSRA & (1<<ADSC)) ;     // Wait for ADC conversion to complete

        DataL = ADCL ;
        DataH = ADCH << 8 ;
        DataH = DataH + DataL ;

        Voltage = DataH ;                // Cast to Float
        Voltage = (Voltage / 1024) * 5 ; // Convert to Voltage

        // Piecewise approximation for Voltage -> VWC from VH400 Datasheet
        if (Voltage < 1.1)            RawValues[i] = (10 * Voltage) - 1 ;
        else if (Voltage < 1.3)        RawValues[i] = (25 * Voltage) - 17.5 ;
        else if (Voltage < 1.8)        RawValues[i] = (48.08 * Voltage) - 47.5 ;
        else if (Voltage < 2.2)        RawValues[i] = (26.32 * Voltage) - 7.89 ;
        else                        RawValues[i] = (62.5 * Voltage) - 7.89 ;
    }

    // Begin finding mode of the measured data

    qsort(RawValues, 10, sizeof(float), CompareFloat) ;// Sorts ascendingly

    // Count occurrence of each value
    Counts[0] = 1 ;
    for (i = 1 ; i<10 ; i++)
    {
        if ( RawValues[i] == RawValues[i-1] )
        {
            Counts[i] = Counts[i-1] + 1 ;
        }
        else
        {
            Counts[i] = 1 ;
        }
    }

    // Finds the largest count
    MaxCount = 0 ;
    for (i = 1 ; i<10 ; i++)
    {
        if ( Counts[i] > Counts[MaxCount] ) MaxCount = i ;
    }

    *MoistMode = RawValues[MaxCount] ;
    dtostrf( RawValues[MaxCount], 6, 2, ASCII) ;
}