# Picocom

Minimal dumb-terminal emulator

## Installing Picocom

```
sudo apt install picocom
```

## Using Picocom

### Get the serial port

If your computer is a PC and has the standard on-board RS-233 ports (usually accessible as two male DB9 connectors at the back) then under Linux these are accessed through device nodes most likely named:

```
/dev/ttyS0
```

and

```
/dev/ttyS1
```

If your computer has no on-board serial ports, then you will need a USB-to-Serial adapter (or something similar). Once inserted to a USB port and recognized by Linux, a device node is created for each serial port accessed through the adapter(s). These nodes are most likely named:

```
/dev/ttyUSB0
```

```
/dev/ttyUSB1
```

### Set your user permissions for serial port

Add yourself to the user-group that your system has for allowing access to serial ports. For most Unix-like systems this group is called "dialout". Consult you system's documentation to find out how you can do this (as it differs form system to system). On most Linux systems you can do it like this:

```
sudo usermod -a -G dialout {{username}}
```

### Connecting to a serial port

```
picocom -b 9600 /dev/ttyS0
```

To see all available options run picocom like this:

```
picocom --help
```

To exit picocom you have to type:

```
C-a, C-x
```

Which means you have to type [Control-A] followed by [Control-X]. You can do this by pressing and holding down the [Control] key, then pressing (and releasing) the [A] key and then pressing (and releasing) the [X] key (while you still keep [Control] held down).

This C-a is called the "escape character". It is used to inform picocom that the next character typed is to be interpreted as a command to picocom itself (in this case the exit command) and not to be sent-down to the serial port. There are several other commands (other than C-a, C-x), all prefixed by C-a.
