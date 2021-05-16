/*
 * SHT35.h
 * Custom Library Supporting SHT35 Sensor  - Adapted from Adafruit Library
 * Zuguang Liu <liu2z2@mail.uc.edu> ; Alan Trester <tresteat@mail.uc.edu>
 */


#ifndef SHT35_H_
#define SHT35_H_

#include <avr/io.h>
#include <util/delay.h>
#include <stdlib.h>
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

ret_code_t SHT_init() ;
//ret_code_t SHT_measure(uint16_t* temp, uint16_t* hum) ;
//ret_code_t SHT_check(uint16_t* status) ;
void UpdateTempHumid(float* RealTemp, char* TempASCII, float* RealHumid,
                     char* HumidASCII) ;

#endif /* SHT35_H_ */