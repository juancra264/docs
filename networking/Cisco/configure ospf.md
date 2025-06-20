# OSFP on Cisco IOS devices

## Configuration
```
router ospf {process-id}
 router-id {ip-id}
 network {ip-prefix} {net wildcard} area {area-id}
 exit
```

On the interface with ospf operation:

```
interface {inteface-id}
 ip ospf {process-id} area {area-id}
 exit
```

## Show commands

```
sh ip protocols
```

```
sh ip ospf neighbors
```

```
sh ip route
```