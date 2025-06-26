# Cisco MPLS IP configuration

## Configuration

### Interfaces Loopbacks and Interfaces with IP scheme
```
interface loopback 0
  ip address 2.2.2.2 255.255.255.255
  no shut
  exit
interface eth0/0
  ip addresss 10.10.20.1 255.255.255.252
  no shut
  exit
interface eth0/1
  ip addresss 10.10.30.1 255.255.255.252
  no shut
  exit
```


### OSPF for the MPLS core (connectivity between PEs and Ps)
On Ps:
```
router ospf 1
  network 10.10.20.0 0.0.0.3 area 0
  network 10.10.30.0 0.0.0.3 area 0
  network 2.2.2.2 0.0.0.0 area 0
  exit
interface eth0/0
  ip ospf 1 area 0
  exit
interface eth0/1
  ip ospf 1 area 0
  exit
!
```

On PEs
```
router ospf 1
  network 10.10.20.0 0.0.0.3 area 0
  network 1.1.1.1 0.0.0.0 area 0
  ! Interface facing the outer edge of the MPLS cloud
  passive-interface eth0/1 
  exit
!
interface eth0/0
  ip ospf 1 area 0
  exit
!
```

### LDP adj between PEs and Ps

```
interface eth0/0
  mpls ip
  exit
interface eth0/1
  mpls ip
  exit
!
```

### VFR with RDs and RTs for each Customer.

on PEs related to the customer:
```
ip vrf CUST-A
  rd 65001:1
  route-target export 65001:1
  route-target import 65001:1
  exit
!
```

```
interface eth0/1
  ip vrf forwarding CUST-A
  ip add 10.10.10.1 255.255.255.252
  no shut
!
```

### iBGP peering using MP-BGP enabling VPNv4 address family

```
router bgp 65001
  neighbor 1.1.1.1 remote-as 65001
  neighbor 1.1.1.1 update-source loopback 0
  address-family vpnv4
     neighbor 1.1.1.1 activate
```

```
router bgp 65001
  neighbor 4.4.4.4 remote-as 65001
  neighbor 4.4.4.4 update-source loopback 0
  address-family vpnv4
     neighbor 4.4.4.4 activate
```

### Redistribute route on the VRFs routing protocols to iBGP on the edge PEs

Using BGP on customer VRF

on CE1:

```
interface loopback 0
  ip address 192.168.11.1 255.255.255.0
  no shut
  exit
router bgp 1
  neighbor 10.10.10.1 remote-as 65001
  network 192.168.11.0 mask 255.255.255.0
  exit
!
```

on PE1 facing CE1:

```
router 65001
  address-family ipv4 vrf CUST-A
    neighbor 10.10.10.2 remote-as 65100
    exit
  exit
!
```

Repeat the same config on the other PEs and CEs related to the customer.

Using OSPF on customer VRF:

on CE1:
```
interface eth0/0
  ip address 10.240.0.2 255.255.255.252
  ip ospf 1 area 2
  no shut
interface loopback 0
  ip address 4.4.4.4 255.255.255.255
  no shut
!
router ospf 1
  router-id 4.4.4.4
  network 4.4.4.4 0.0.0.0 area 2
  network 192.168.1.0 0.0.0.255 area 2
  exit
!
```

on PE1 facing CE1:
```
interface Ethernet0/1
 ip vrf forwarding CUST-A
 ip address 10.240.0.1 255.255.255.252
 ip ospf 2 area 2
 exit
!
router ospf 2 vrf CUST-A
 redistribute bgp 65001 subnets
 exit
!
router bgp 65001
 address-family ipv4 vrf CUST-A
  redistribute ospf 2
 exit-address-family
!
  
```

Repeat the same config on the other PEs and CEs related to the customer.


## Verification

```
show run | s ospf
```

```
show run | s bgp
```

```
show mpls forwarding-table
```

```
show mpls interfaces
```

```
show bgp vpnv4 unicast all summary
```

```
show ip vrf
```

```
show bgp vpnv4 unicast vrf CUST-A
```

```
show bgp vpnv4 unicast all 192.168.12.0
```

```
show ip cef vrf CUST-A 192.168.12.0
```
