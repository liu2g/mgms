Source code for the integrated sensor module for the project, developed by Alan and Liu.

# Supported Hardware

**Sensors**

- Grove - I2C High Accuracy Temp & Humi Sensor (SHT35), available at https://www.seeedstudio.com/Grove-I2C-High-Accuracy-Temp-Humi-Sensor-SHT35.html.
- Vegetronix VH400 Low-Cost Soil Moisture Sensors, available at https://www.vegetronix.com/Products/VH400/.
- Vegetronix THERM200 Soil Temperature Sensor Probes, available at https://www.vegetronix.com/Products/THERM200/.

**Microcontroller**

ATmega328p embedded on Arduino Uno board, programmed with [USBtinyISP](https://learn.adafruit.com/usbtinyisp).

# Software Description

- `main`: main routine program flashed to the MCU.
- `twi_lib`: base I2C library based off [Sovichea Tep's library](https://github.com/Sovichea/avr-i2c-library).
- `SHT35_lib`: I2C wrapper that sends appropriate command for the specific sensor.
- `AnalogSensors`: library that decodes two analog soil sensors.

# Usage
## Natively in Microchip Studio
This module is developed in [Microchip Studio](https://www.microchip.com/en-us/development-tools-tools-and-software/microchip-studio-for-avr-and-sam-devices) (previously Atmel Studio).
Simply use this directory as a project in the IDE so that it can be built.

Flashing the MCU may need extra setup depending on the programmer chip ([for example](https://www.asensar.com/guide/arduino_atemlstudio/integrate-avrdude-with-atmel-studio.html)).

# With GNU Make
The same [`Makefile`](../make-avr-template/Makefile) was attached along with sources. Follow [this guide](../make-avr-template/README.md) on how to use it.

---
**NOTE:**

Only build was tested. Runtime behavior on the actual hardware was not test for this solution.

---