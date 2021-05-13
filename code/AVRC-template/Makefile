# DEVICE ....... The AVR device you compile for
# CLOCK ........ Target AVR clock rate in Hertz
# PROGRAMMER ... Options to avrdude which define the hardware you use for
#                uploading to the AVR and the interface where this hardware
#                is connected.

DEVICE     = atmega328p
CLOCK      = 16000000
PROGRAMMER = usbtiny
PORT       = usb
FUSES      = -U lfuse:w:0x62:m -U hfuse:w:0xD9:m -U efuse:w:0xFF:m -U lock:w:0xFF:m

######################################################################
######################################################################
# Tune the lines below only if you know what you are doing:

ifdef verbose
VERB = -v
else
VERB =
endif

AVRDUDE = avrdude -p $(DEVICE) -c $(PROGRAMMER) -P $(PORT) $(VERB)
COMPILE = avr-gcc -std=gnu99 -Wall -Os -ffunction-sections -fdata-sections -mmcu=$(DEVICE) -DF_CPU=$(CLOCK) $(VERB)

# Generate lookup table in project directory
SOURCES = $(wildcard *.c)
OBJECTS = $(patsubst %.c, %.o, $(SOURCES))

# High level rules

help:
	@echo "all         Build main.c, leaves main.o, main.elf and main.hex here"
	@echo "clean       Remove built files such as main.o, main.elf and main.hex"
	@echo "flash       Build source and flashes to AVR chip, then removes the built files"
	@echo "flashrm    Build source and flashes to AVR chip, but leaves all the files here"
	@echo "config      Print the current build configurations"
	@echo "NOTE: clean and flashrm IS BROKEN UNDER WINDOWS UNLESS USING WSL OR CYGWIN"

config:
	@echo "DEVICE     : $(DEVICE)"
	@echo "CLOCK      : $(CLOCK)"
	@echo "PROGRAMMER : $(PROGRAMMER)"
	@echo "PORT       : $(PORT)"


flash:
	$(MAKE) clean
	$(MAKE) build
	@echo "==========FLASHING=========="
	$(AVRDUDE) -U flash:w:main.hex:i

flashrm:	flash
	$(MAKE) clean


# Step-by-step rules
build:
	@echo "==========BUILDING=========="
	$(MAKE) all

clean:
	@echo "==========CLEANING=========="
	rm -f *.hex *.elf *.o

# File targets
all:	main.hex

%.o: %.c
	@echo "----------compile----------"
	$(COMPILE) -c $< -o $@


main.elf: $(OBJECTS)
	@echo "----------link objects----------"
	$(COMPILE) -Wl,--gc-sections $(OBJECTS) -o main.elf 

main.hex: main.elf
	@echo "----------generate bin----------"
	avr-objcopy -j .text -j .data -R .eeprom -O ihex main.elf main.hex


# Debugging and analysis
disasm:	main.elf
	avr-objdump -d main.elf

cpp:
	$(COMPILE) -E main.c