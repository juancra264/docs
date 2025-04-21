**Clear BGP**
To do soft reset, command is:

```bash
execute router clear bgp all soft (in/out)
```

For a specific BGP neighbor:

```bash
execute router clear bgp ip x.x.x.x soft (in/out)
```

**## BGP Tshoot commands ##**

get router info bgp summary
get router info bgp neighbors
get router info bgp network
get router info routing-table all
get router info bgp neighbors <neighbor IP> advertised-routes
get router info bgp neighbors <neighbor IP> received-routes
get router info bgp neighbors <neighbor IP> routes
get router info routing-table bgp
get router info bgp neighbors 169.254.196.233 received-routes
get router info bgp neighbors 169.254.196.233 advertised-routes
get router info bgp neighbors 169.254.196.233 routes
get router info routing-table bgp | grep 10.198.64.0
get router info bgp network 10.98.13.234
get router info bgp route BGP-local-preference_default

**BGP debug outputs:**

diag debug reset
diagnose ip router bgp all enable
diagnose ip router bgp level info
diagnose debug enable
diagnose debug disable