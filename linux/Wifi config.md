Identify the name of our system’s network interface

```
ls /sys/class/net
```

Edit the Netplan configuraton file.

```
sudo vim /etc/netplan/50-cloud-init.yaml
```

Configuration example.

```
    wifis:
        wlan0:
            optional: true
            access-points:
                "SSID-NAME-HERE":
                    password: "PASSWORD-HERE"
            dhcp4: true
```

After saving your changes to the file and exiting, apply the new Netplan configuration:

```
sudo netplan apply
```

You will be able to see your wireless adapter connected to the wireless network

```
ip a
```


## Troubleshooting Netplan Errors

Run the apply command with debug activated:

```
sudo netplan --debug apply
```

