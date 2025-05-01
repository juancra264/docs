# KasmVNC on Kali Linux

## Installation

Please choose the package for your distro here (under Assets):
https://github.com/kasmtech/KasmVNC/releases
wget <package_url>

```
wget https://github.com/kasmtech/KasmVNC/releases/download/v1.3.4/kasmvncserver_bookworm_1.3.4_amd64.deb
```
```
sudo apt-get install ./kasmvncserver_*.deb
```

Add your user to the ssl-cert group
```
sudo adduser $USER ssl-cert
```




start KasmVNC, you will be prompted to create a KasmVNC user and select a desktop environment
```
vncserver
```

Check for logs
```
# 
tail -f ~/.vnc/*.log
```