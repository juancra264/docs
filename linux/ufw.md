# UFW default firewall linux

## Check UFW status
```shell
sudo ufw status verbose
```

## View UFW rules with numbers
```shell
sudo ufw status numbered
```

## Check UFW logging
```shell
/var/log/ufw.log
```

to check recent logs:
```shell
sudo tail -f /var/log/ufw.log
```

## Check UFW Configuration File
```shell
sudo vim /etc/ufw/ufw.conf
```

## Check Default Policies
```shell
sudo ufw show raw
```

## Check Interface-Specific Rules
```shell
sudo ufw status verbose
```
