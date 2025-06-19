# BGP on Cisco IOS devices

## Configuration

BGP basic

```
configure terminal
  router bgp asn
  bgp router-id ip-address
  bgp cluster-id cluster-id
  address-family ipv4 unicast
  neighbor ip-address remote-as as-number
  network ip-prefix
  exit
 ```

BGP route reflector

```
configure terminal
  router bgp asn
  bgp router-id ip-address
  bgp scluster-id cluster-id
  address-family ipv4 unicast
  neighbor ip-address remote-as as-number
    address-family ipv4 { unicast | multicast }
    route-reflector-client 
    exit
  network ip-prefix
  exit
 ```


## Clear commands
```
clear bgp all *
```

```
clear bgp ip { unicast | multicast } { neighbor | * | as-number | peer-template name | prefix } [ vrf vrf-name ]
```

```
clear bgp all dampening 
```

```
clear bgp all flap-statistics
```




## Show commands

```
show bgp all
```

```
show bgp ip { unicast | multicast } neighbors
```

```
 show running-configuration bgp 
```

