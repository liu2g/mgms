/*
* twi_lib.c
*
* Created: 2021-03-19
*/

#include "SHT_lib.h"

float get_temp(uint16_t);
float get_hum(uint16_t);
ret_code_t SHT_send_cmd(uint16_t);

ret_code_t SHT_init(){
    ret_code_t error_code = SUCCESS;
    tw_init(TW_FREQ_250K, true); // set I2C Frequency, enable internal pull-up

    error_code = SHT_send_cmd(CMD_SOFT_RST);
    if (error_code != SUCCESS) return error_code;

    // error_code = SHT_send_cmd(CMD_CLEAR_SREG);
    if (error_code != SUCCESS) return error_code;

    return error_code;
}

ret_code_t SHT_measure(float* temp, float* hum){
    ret_code_t error_code = SUCCESS;
    uint8_t data[6];

    error_code = SHT_send_cmd(HI_REP_WI_STRCH);
    if (error_code != SUCCESS) return error_code;

    _delay_ms (1);

    error_code = tw_master_receive(SHT_ADDR, data, sizeof(data));
    if (error_code != SUCCESS) return error_code;

    *temp = get_temp( data[0] << 8 | data[1] );
    *hum =  get_hum( data[3] << 8 | data[4] );

    return error_code;
}

ret_code_t SHT_check(uint16_t* status){
    ret_code_t error_code = SUCCESS;
    uint8_t data[3] = {0};

    error_code = SHT_send_cmd(CMD_SOFT_RST);
    if (error_code != SUCCESS) return error_code;

    error_code = SHT_send_cmd(CMD_READ_SREG);
    if (error_code != SUCCESS) return error_code;

    _delay_ms (1);

    error_code = tw_master_receive(SHT_ADDR, data, sizeof(data));
    if (error_code != SUCCESS) return error_code;

    *status = data[0] << 8 | data[1] ;

    return error_code;
}


ret_code_t SHT_send_cmd(uint16_t cmd){
    uint8_t data[2] = {cmd >> 8, cmd & 0xFF};
    return tw_master_transmit(SHT_ADDR, data, 2, false);
}


float get_temp(uint16_t temp) {
    return (temp / 65535.00) * 175 - 45;
}

float get_hum(uint16_t hum) {
    return (hum / 65535.0) * 100.0;
}
