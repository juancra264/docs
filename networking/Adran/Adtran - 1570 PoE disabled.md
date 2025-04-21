Disable poe on a port:
```
configure terminal
  interface {{portname}}
     poe mode disable
     shutdown
  exit
```

Reactivate poe:
```
configure terminal
  interface {{portname}}
    no shutdown
    poe mode enable
  exit
```
