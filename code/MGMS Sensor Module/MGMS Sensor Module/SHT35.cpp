/*
 * SHT35.cpp
 * Custom Library Supporting SHT35 Sensor  - Adapted from Adafruit Library
 * Zuguang Liu liu2z2@mail.uc.edu ; Alan Trester tresteat@mail.uc.edu 
 */ 

#include "SHT35.h"

static ret_code_t SHT_send_cmd(uint16_t cmd){
	uint8_t data[2] = {cmd >> 8, cmd & 0xFF};
	return tw_master_transmit(SHT_ADDR, data, 2, false);
}


static float get_temp(uint16_t temp) {
	return (temp / 65535.00) * 175 - 45;
}

static float get_hum(uint16_t hum) {
	return (hum / 65535.0) * 100.0;
}

static ret_code_t SHT_measure(uint16_t* temp, uint16_t* hum){
	ret_code_t error_code = SUCCESS;
	uint8_t data[6];

	error_code = SHT_send_cmd(HI_REP_WI_STRCH);
	if (error_code != SUCCESS) return error_code;

	_delay_ms (1);

	error_code = tw_master_receive(SHT_ADDR, data, sizeof(data));
	if (error_code != SUCCESS) return error_code;

	*temp = (uint16_t) data[0] << 8 | data[1];
	*hum = (uint16_t) data[3] << 8 | data[4];

	return error_code;
}

static ret_code_t SHT_check(uint16_t* status){
	ret_code_t error_code = SUCCESS;
	uint8_t data[3] = {0};

	error_code = SHT_send_cmd(CMD_SOFT_RST);
	if (error_code != SUCCESS) return error_code;

	error_code = SHT_send_cmd(CMD_READ_SREG);
	if (error_code != SUCCESS) return error_code;

	_delay_ms (20);

	error_code = tw_master_receive(SHT_ADDR, data, sizeof(data));
	if (error_code != SUCCESS) return error_code;

	*status = data[0] << 8 | data[1] ;

	return error_code;
}

ret_code_t SHT_init(){
	ret_code_t error_code = SUCCESS;
	tw_init(TW_FREQ_250K, true); // set I2C Frequency, enable internal pull-up

	error_code = SHT_send_cmd(CMD_SOFT_RST);
	if (error_code != SUCCESS) return error_code;

	//error_code = SHT_send_cmd(CMD_CLEAR_SREG);
	//if (error_code != SUCCESS) return error_code;

	return error_code;
}

void UpdateTempHumid(float* RealTemp, char* TempASCII, float* RealHumid, char* HumidASCII)
{
	uint16_t RawTemp ;
	uint16_t RawHumid ;
	
	SHT_measure(&RawTemp, &RawHumid) ;
	
	*RealTemp = get_temp(RawTemp) ;
	*RealHumid = get_hum(RawHumid) ;
	
	dtostrf( *RealTemp, 6, 2, TempASCII) ;		// Converts to a 6-character string
	dtostrf( *RealHumid, 6, 2, HumidASCII) ;	// Converts to a 6-character string
}