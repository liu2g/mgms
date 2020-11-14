# DEVICE ....... The AVR device you compile for
# CLOCK ........ Target AVR clock rate in Hertz
# OBJECTS ...... The object files created from your source files. This list is
#                usually the same as the list of source files with suffix ".o".
# PROGRAMMER ... Options to avrdude which define the hardware you use for
#                uploading to the AVR and the interface where this hardware
#                is connected.
# FUSES ........ Parameters for avrdude to flash the fuses appropriately.

DEVICE     = atmega328p
CLOCK      = 16000000
PROGRAMMER = -c usbtiny -P usb
OBJECTS    = main.o
FUSES      = -U lfuse:w:0x62:m -U hfuse:w:0xD9:m -U efuse:w:0xFF:m -U lock:w:0xFF:m


######################################################################
######################################################################

# Tune the lines below only if you know what you are doing:

AVRDUDE = avrdude -p $(DEVICE) $(PROGRAMMER)
COMPILE = avr-gcc -std=gnu99 -Wall -Os -ffunction-sections -fdata-sections -DF_CPU=$(CLOCK)

# symbolic targets:
all:	main.hex

.c.o:
	$(COMPILE) -c $< -o $@

.S.o:
	$(COMPILE) -x assembler-with-cpp -c $< -o $@
# "-x assembler-with-cpp" should not be necessary since this is the default
# file type for the .S (with capital S) extension. However, upper case
# characters are not always preserved on Windows. To ensure WinAVR
# compatibility define the file type manually.

.c.s:
	$(COMPILE) -S $< -o $@

flash:	all
	$(AVRDUDE) -U flash:w:main.hex:i
	rm -f *.hex *.elf *.o

fuse:
	$(AVRDUDE) $(FUSES)

install: flash fuse

# if you use a bootloader, change the command below appropriately:
load: all
	bootloadHID main.hex

clean:
	rm -f *.hex *.elf *.o

# file targets:
main.elf: $(OBJECTS)
	$(COMPILE) -mmcu=$(DEVICE) -Wl,--gc-sections $(OBJECTS) -o main.elf 

main.hex: main.elf
	rm -f main.hex
	avr-objcopy -j .text -j .data -R .eeprom -O ihex main.elf main.hex
# If you have an EEPROM section, you must also create a hex file for the
# EEPROM and add it to the "flash" target.

# Targets for code debugging and analysis:
disasm:	main.elf
	avr-objdump -d main.elf

cpp:
	$(COMPILE) -E main.c