# Configuring VTP on cisco devices

## Configure on Server switch:
```
vtp mode server
vtp domain {{vpt_domain}}
vtp pass  {{vpt_password}}
vtp version 3
```

on the global configuration mode (#), set the vtp server primary
```
vtp primary force
```


## Configure on client switches:
```
vtp mode client
vtp domain {{vpt_domain}}
vtp pass  {{vpt_password}}
vtp version 3
```