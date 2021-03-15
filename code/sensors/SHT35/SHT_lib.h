#define __AVR_ATmega328P__ //import register names
#include <avr/io.h>
#include <util/delay.h>
#include "twi_lib.h"

#define    SHT_ADDR     0x45
#define    NACK_ON_ADDR         2


#define    CLK_STRETCH_ENABLED    0
#define    CLK_STRETCH_DISABLED   3

#define    MODE_MPS_05       6
#define    MODE_MPS_1        9
#define    MODE_MPS_2        12
#define    MODE_MPS_4        15
#define    MODE_MPS_10       18

#define    REPEAT_HIGH        0
#define    REPEAT_MED         1
#define    REPEAT_LOW         2

#define    CMD_BREAK            0x3093
#define    CMD_SOFT_RST         0x30A2
#define    CMD_READ_SREG        0xF32D
#define    CMD_CLEAR_SREG       0x3041
#define    CMD_FETCH_DATA       0xE000
#define    CMD_READ_SERIAL      0x3780

#define    CMD_READ_HIGH_ALERT_LIMIT_SET_VALUE     0XE11F
#define    CMD_READ_HIGH_ALERT_LIMIT_CLEAR_VALUE   0XE114
#define    CMD_READ_LOW_ALERT_LIMIT_SET_VALUE      0XE102
#define    CMD_READ_LOW_ALERT_LIMIT_CLEAR_VALUE    0XE109

#define    CMD_WRITE_HIGH_ALERT_LIMIT_SET_VALUE    0X611D
#define    CMD_WRITE_HIGH_ALERT_LIMIT_CLEAR_VALUE  0X6116
#define    CMD_WRITE_LOW_ALERT_LIMIT_SET_VALUE     0X6100
#define    CMD_WRITE_LOW_ALERT_LIMIT_CLEAR_VALUE   0X610B

#define    HI_REP_WI_STRCH      0x2C06
#define    MD_REP_WI_STRCH      0x2C0D
#define    LO_REP_WI_STRCH      0x2C10
#define    HI_REP_WO_STRCH      0x2400
#define    MD_REP_WO_STRCH      0x240B
#define    LO_REP_WO_STRCH      0x2416

#define    CMD_HEATER_ON     0x306D
#define    CMD_HEATER_OFF    0x3066

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

ret_code_t SHT_measure(uint16_t* temp, uint16_t* hum){
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

ret_code_t SHT_check(uint16_t* status){
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

ret_code_t SHT_serial(uint16_t* serial){
    ret_code_t error_code = SUCCESS;
    uint8_t data[6] = {0};


    error_code = SHT_send_cmd(CMD_READ_SERIAL);
    if (error_code != SUCCESS) return error_code;

    _delay_ms (20);

    error_code = tw_master_receive(SHT_ADDR, data, sizeof(data));
    if (error_code != SUCCESS) return error_code;

    *serial = (data[4] << 8) | data[5] ;

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