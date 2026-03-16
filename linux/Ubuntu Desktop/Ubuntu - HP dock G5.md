# Ubuntu Desktop - how to install displaylink-driver for HP dockstation G5

To install displaylink-driver using sudo apt install, follow these steps:

Add the Synaptics APT Repository Keyring
First, download and install the official Synaptics repository keyring package:

```bash
wget https://www.synaptics.com/sites/default/files/Ubuntu/pool/stable/main/all/synaptics-repository-keyring.deb
```
```bash
sudo apt install ./synaptics-repository-keyring.deb
```

Update APT Package Cache
Refresh your package list to include the new repository:

```bash
sudo apt update
```

Install the DisplayLink Driver
Now install the driver with:

```bash
sudo apt install displaylink-driver
```

Reboot Your System
The driver requires a reboot to load properly:

```bash
sudo reboot
```