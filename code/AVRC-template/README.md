A simple template I made to compile and flash the AVR chip. --Liu

## Usage

1. Copy the folder and rename the folder. You can also use some project template plug-ins/extensions in your IDE/text editor
2. Write code in `main.c` and add extra library like in `extralib.h`
3. Navigate to the main directory, use `make <cmd>` for building
   - `make all` builds `main.c`, leaves `main.o` , `main.elf` and `main.hex` in the folder
   - `make clean` removes built files such as `main.o` , `main.elf` and `main.hex`
   - `make flash` builds source, flashes to ATMega328P, then removes the built files
4. In case of any errors, two suggestions on troubleshooting
   - Check if dependencies are installed
   - Give a `verbose=1` argument at the end of the command (eg. `make flash verbose=1`) to see more debug info
   - Edit the header in `Makefiles` to adjust your machine's settings

## Dependencies

I am planning to make this compatible with both Linux and Windows, but I have not tested Windows yet.

On Linux, `avr-gcc` toolchain and `avrdude` are required for the `Makefile`. To install them with `apt`, simply run

```bash
sudo apt install gcc-avr binutils-avr gdb-avr avr-libc avrdude
```

Windows compatibility is not tested yet.