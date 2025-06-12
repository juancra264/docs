# RDP Server on Kali Linux

## Installing RDP Server
```
sudo apt-get install xrdp
```

## Configuring RDP Server

add the ssl-cert group so that it has access to secure the connection.

```
sudo adduser xrdp ssl-cert
```

## Enable and Start the RDP Server

```
sudo systemctl restart xrdp
```

```
sudo systemctl enable xrdp
```

## Configuring Firewalld for RDP Server

```
sudo firewall-cmd --add-rich-rule 'rule family="ipv4" port port=3389 protocol=tcp source address="x.x.x.x" accept' --permanent
```

```
sudo firewall-cmd --list-rich-rules
```

```
sudo firewall-cmd --reload
```

The default port for RDP is 3389. You might need to allow this in your firewall in order to access the server.

Simply put in the address of your server, and enter in your username and password for the account you wish to use to connect.
