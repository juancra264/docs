# VNC Server on Kali Linux

## Installing VNC Server
```
sudo apt-get install x11vnc -y
```

## Configure VNC Server

Add this service:
```
sudo vim /lib/systemd/system/x11vnc.service
```

Copy:
```
[Unit]
Description=x11vnc service
After=display-manager.service network.target syslog.target

[Service]
Type=simple
ExecStart=/usr/bin/x11vnc -forever -display :0 -auth guess -passwd CHANGEPASSWORD
ExecStop=/usr/bin/killall x11vnc
Restart=on-failure

[Install]
WantedBy=multi-user.target
```

Run:

```
systemctl daemon-reload
```
```
systemctl enable x11vnc.service
```
```
systemctl start x11vnc.service
```
```
systemctl status x11vnc.service
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
