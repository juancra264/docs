# VNC Server on Kali Linux

## Installing VNC Server
```
sudo apt install x11vnc -y
```

## Store password for the session
```
sudo x11vnc -storepasswd /etc/vncserver.pass
```

## Configure VNC Server

Add this service:
```
sudo vim /lib/systemd/system/vncserver.service
```

Copy:
```
[Unit]
Description=vncserver service
After=display-manager.service network.target syslog.target
exit
[Service]
Type=simple
ExecStart=/usr/bin/x11vnc -forever -display :0 -auth guess -loop -noxdamage -repeat -rfbauth /etc/vncserver.pass -rfbport 5900 -shared -bg -xrandr
ExecStop=/usr/bin/killall x11vnc
Restart=on-failure

[Install]
WantedBy=multi-user.target
```

Run:

```
sudo systemctl daemon-reload
```
```
sudo systemctl enable vncserver.service
```
```
sudo systemctl start vncserver.service
```
```
sudo systemctl status vncserver.service
```

## Configure the Firewalld

```
sudo firewall-cmd --add-rich-rule 'rule family="ipv4" port port=5900 protocol=tcp source address="x.x.x.x" accept' --permanent
```

```
sudo firewall-cmd --list-rich-rules
```

```
sudo firewall-cmd --reload
```
