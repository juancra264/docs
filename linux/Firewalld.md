Firewalld Configuration:

```
 sudo firewall-cmd --list-all
```

Get the active zone on the server:

```
sudo firewall-cmd --get-active-zone
```

Adding a service to the firewalld:

```
sudo firewall-cmd --add-service=ftp --permanent
sudo firewall-cmd --reload
```

Adding TCP or UDP port to the firewalld:

```
sudo firewall-cmd --add-port=514/udp --permanent
sudo firewall-cmd --add-port=5140/udp --permanent
sudo firewall-cmd --add-port=514/tcp --permanent
sudo firewall-cmd --reload
```

sudo firewall-cmd --add-port=3100/tcp --permanent
sudo firewall-cmd --add-port=1514/tcp --permanent
sudo firewall-cmd --reload
