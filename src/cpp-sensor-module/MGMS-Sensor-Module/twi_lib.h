/*
 * SHT35.h
 * Custom Library Supporting I2C for MGMS  - Adapted from TEP SOVICHEA
 * Zuguang Liu <liu2z2@mail.uc.edu> ; Alan Trester <tresteat@mail.uc.edu>
 */



#ifndef TWI_LIB_H_
#define TWI_LIB_H_

#include <avr/io.h>
#include <util/twi.h>
#include <stdbool.h>

#define SUCCESS				0

#define TW_SCL_PIN			PORTC5
#define TW_SDA_PIN			PORTC4

#define TW_SLA_W(ADDR)		((ADDR << 1) | TW_WRITE)
#define TW_SLA_R(ADDR)		((ADDR << 1) | TW_READ)
#define TW_READ_ACK			1
#define TW_READ_NACK		0

typedef uint16_t ret_code_t;

typedef enum {
    TW_FREQ_100K,
    TW_FREQ_250K,
    TW_FREQ_400K
} twi_freq_mode_t;

void tw_init(twi_freq_mode_t twi_freq_mode, bool pullup_en) ;
ret_code_t tw_master_transmit(uint8_t slave_addr, uint8_t* p_data, uint8_t len,
                              bool repeat_start) ;
ret_code_t tw_master_receive(uint8_t slave_addr, uint8_t* p_data, uint8_t len) ;

#endif /* TWI_LIB_H_ */