# Firewalld

## Firewalld Installation
```
sudo apt install firewalld
```


## Firewalld Configuration

```
sudo firewall-cmd --list-all
```

## Get the active zone on the server:

```
sudo firewall-cmd --get-active-zone
```

## Adding a service to the firewalld:

```
sudo firewall-cmd --add-service=ftp --permanent
sudo firewall-cmd --reload
```

## Adding TCP or UDP port to the firewalld:

```
sudo firewall-cmd --add-port=514/udp --permanent
sudo firewall-cmd --add-port=5140/udp --permanent
sudo firewall-cmd --add-port=514/tcp --permanent
sudo firewall-cmd --reload
```

```
sudo firewall-cmd --add-port=3100/tcp --permanent
sudo firewall-cmd --add-port=1514/tcp --permanent
sudo firewall-cmd --reload
```

## Allowing SSH from an IP address
```
sudo firewall-cmd --add-rich-rule 'rule family="ipv4" service name="ssh" source address="10.10.1.125" accept' --permanent
```

```
sudo firewall-cmd --reload
```

## Remove service

```
sudo firewall-cmd --remove-service=ssh --permanent
```
```
sudo firewall-cmd --reload 
```
```
sudo firewall-cmd --list-all
```

## Adding a port range 

Adding port for mosh range

```shell
firewall-cmd --add-port=60000-61000/udp --permanent
```

