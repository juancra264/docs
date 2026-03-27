# Installing by Compiling Kismet


## Clone repository
```
git clone https://www.kismetwireless.net/git/kismet.git
```

## Install dependencies
```
sudo apt-get install build-essential git libmicrohttpd-dev zlib1g-dev libnl-3-dev libnl-genl-3-dev libcap-dev libpcap-dev libncurses5-dev libnm-dev libdw-dev libsqlite3-dev
```
```
sudo apt install libssl-dev libwebsockets-dev libusb-1.0-0-dev librtlsdr-dev libmosquitto-dev lm-sensors -y
```

## Compile process 

```
cd kismet
./configure
```

```
make
```

```
sudo make suidinstall
```

```
sudo usermod -a -G kismet YourUsername
```

## Start kismet

Set the wifi card in monitor mode
```
sudo airmon-ng start YourCardName
```

Start the kismet process
```
kismet -c YourCardNameMon
```
