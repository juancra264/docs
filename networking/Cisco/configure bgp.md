# BGP on Cisco IOS devices

## Configuration

BGP basic

```cisco
configure terminal
  router bgp {asn}
    bgp router-id {ip-id}
    network {ip-prefix} mask {net-mask}
    neighbor {ip-peer} remote-as {asn-peer}
   address-family ipv4 unicast
   exit
  exit
end
```

BGP route reflector

```cisco
configure terminal
  router bgp {asn}
    bgp router-id {ip-id}
    bgp cluster-id {decimal-id | ip-id}
    neighbor {ip-peer} remote-as {asn-peer}
    address-family ipv4 unicast
      neighbor {ip-peer} route-reflector-client
      neighbor {ip-peer} next-hop-self
      neighbor {ip-peer} activate 
      exit
    network {ip-prefix} mask {net-mask}
  exits
end
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

