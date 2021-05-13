Source code for the integrated sensor module for the project, developed by Alan.

# Supported Hardware

**Sensors**

- Grove - I2C High Accuracy Temp & Humi Sensor (SHT35). Available at https://www.seeedstudio.com/Grove-I2C-High-Accuracy-Temp-Humi-Sensor-SHT35.html.
- Vegetronix VH400 Low-Cost Soil Moisture Sensors. Available at https://www.vegetronix.com/Products/VH400/.
- Vegetronix THERM200 Soil Temperature Sensor Probes. Available at https://www.vegetronix.com/Products/THERM200/.

**Microcontroller**

ATmega328p embedded on Arduino Uno board, programmed with [USBtinyISP](https://learn.adafruit.com/usbtinyisp).

# Software Description

`twi_lib` is the base I2C library based off [Sovichea Tep's library](https://github.com/Sovichea/avr-i2c-library).

`SHT35_lib` is I2C wrapper that sends appropriate command for the specific sensor.

`AnalogSensors` is library that decode two analog soil sensors.

# Usage
This module is developed in [Microchip Studio](https://www.microchip.com/en-us/development-tools-tools-and-software/microchip-studio-for-avr-and-sam-devices)(previously Atmel Studio). Simply use this directory as a project in the IDE so that it can be built.

Flashing the device needs extra setup depending on the device ([for example](https://www.asensar.com/guide/arduino_atemlstudio/integrate-avrdude-with-atmel-studio.html)).
