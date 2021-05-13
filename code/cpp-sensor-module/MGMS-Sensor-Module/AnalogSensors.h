/*
 * AnalogSensors.h
 * Custom Library Supporting ADC Reads for Soil Temp, Soil Moisture, Sunlight
 * Alan Trester tresteat@mail.uc.edu ; Zuguang Liu liu2z2@mail.uc.edu
 * 3/14/2021
 */ 


#ifndef ANALOGSENSORS_H_
#define ANALOGSENSORS_H_

#include <avr/io.h>
#include <stdlib.h>

void ADC_init() ;										// Initializes the analog pins to correctly do measurements
void UpdateSoilTemp(float* TempMode, char* ASCII) ;		// Reads Soil Temp values from ADC, finds the most likely temperature and reports it.
void UpdateSoilMoist(float* MoistMode, char* ASCII) ;	// Reads Soil Moisture values from ADC, finds the most likely moisture and reports it.

#endif /* ANALOGSENSORS_H_ */