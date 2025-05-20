# Configure SSH on cisco devices

Configure local user:
```
username {{user}} pri 15 secret {{password}}
```

Configure domain:
```
ip domain-name {{domain}}
```

Configure SSH options
```
crypto key generate rsa modulus 2028
ip ssh time-out 60
ip ssh authentication-retries 2
```

Configure the VTY Lines to allow just SSH
```
line vty 0 4
 transport input ssh
 login local
 exec-timeout 0 0
exit
```