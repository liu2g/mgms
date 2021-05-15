A simple template I made to compile and flash the AVR chip, by Liu.

## Usage

1. Copy the folder and rename the folder. You can also use some project template plug-ins/extensions in your IDE/text editor
2. Write code in `main.c` and add extra library like in `extralib.h`
3. Navigate to the main directory, use `make <cmd>` for building
   - `make build` builds `main.c`, leaves `main.o` , `main.elf` and `main.hex` in the folder
   - `make clean` removes built files such as `main.o` , `main.elf` and `main.hex`
   - `make flash` builds source, flashes to ATMega328P
   - `make flashrm` builds source, flashes to ATMega328P, but removes the built files
   - `make help` prints available commands
   - `make config` prints current configurations
   - NOTE: `clean` and `flashrm` IS BROKEN UNDER WINDOWS UNLESS USING WSL OR CYGWIN DUE TO `rm` NOT AVAILABLE
4. In case of any errors, two suggestions on troubleshooting
   - Check if dependencies are installed
   - Give a `verbose=1` argument at the end of the command (eg. `make flash verbose=1`) to see more debug info
   - Edit the header in `Makefiles` to adjust your machine's settings

## Dependencies

The required program is `avr-gcc` toolchain and `avrdude`.
They have availability and the same interface on both Linux and Windows.
To check if they are install, in a terminal, run

```
avr-gcc -v
avr-objcopy -V
make -v
avrdude
```

one line after the other. Basic help info will be printed If all tools are installed.

### On Linux

Installing the tools on Linux are well explained from many sources.
On Ubuntu/Debian, they are  available to install with `apt`, so simply run

```bash
sudo apt install gcc build-essential gcc-avr binutils-avr gdb-avr avr-libc avrdude
```

### On Windows

The tools are bundled in a suite "WinAVR".
This is available to download at http://winavr.sourceforge.net/ or https://sourceforge.net/projects/winavr/files/.
Run the exe installer then all tools should be installed and available with a new terminal.

In addition, the `clean` command uses `rm` that is not available on Windows.
You can use Cygwin shell by downloading [here](https://www.cygwin.com/) or it's bundled with Git Bash from [Git on Windows](https://git-scm.com/download/win). Currently these are only two workarounds.


## USBTiny Driver

### On Linux

Driver for USBTiny is not required on Linux. However, to work with `avrdude`, a USB package called `libusb` is needed.
To install this on Ubuntu/Debian, use `apt`:

```bash
sudo apt install libusb-dev
```

### On Windows

On Windows, driver needs to be installed separately. This is available at https://github.com/adafruit/Adafruit_Windows_Drivers/releases.
After installation, there should be an entry called "LibUSB-Win32 Devices / USBtinyISP AVR Programmer" in Device manager.