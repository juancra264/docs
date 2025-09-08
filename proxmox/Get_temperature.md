# Get temperature

## Install sensors
```
apt install xsensors
```

## Get temperature
```
sensors | grep Composite | awk -F "+" '{ print $2 }' | awk -F "." '{ print $1 }'
```