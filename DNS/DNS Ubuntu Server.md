Edit DNS settings:

```shell
sudo vim /etc/systemd/resolved.conf
```

Set:

```sh
DNSStubListener=no
```


or just run this command:

```shell
sudo sed -i 's/#DNSStubListener=yes/DNSStubListener=no/g' /etc/systemd/resolved.conf
```

Check the open ports:

```shell
sudo netstat -peanut | grep :53
```

