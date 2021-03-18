Working firmware prototype for SHT35 air temperature / humidity sensor, by Liu

# Hardware
**Sensor**
Grove - I2C High Accuracy Temp & Humi Sensor (SHT35). Available at https://www.seeedstudio.com/Grove-I2C-High-Accuracy-Temp-Humi-Sensor-SHT35.html.

**Microcontroller**
ATmega328p embedded on Arduino Uno board, programmed with [USBtinyISP](https://learn.adafruit.com/usbtinyisp).

# Software
The program is build with avr-gcc and avr-dude, using custom `Makefile`. 

`twi_lib` is the base I2C library based off [Sovichea Tep's library](https://github.com/Sovichea/avr-i2c-library).
`SHT_lib` is I2C wrapper that sends appropiate command for the specific sensor.
`uart_lib` is simple UART library for debugging purpose.

# Usage
Building the software and flashing device using Makefile is lightweight, with dependencies of avr-gcc, avr-dude and appropiate driver installed. Check `MAKE-README.md` for detialed guide.