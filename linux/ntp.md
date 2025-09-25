# NTP service on linux

## Install
```shell
sudo apt install ntpsec -y
```

## Run and enable
```shell
sudo systemctl enable ntpsec.service
```

```shell
sudo systemctl restart ntpsec.service
```

## Check the ntp servers and sync
```shell
ntpq -pn
```
