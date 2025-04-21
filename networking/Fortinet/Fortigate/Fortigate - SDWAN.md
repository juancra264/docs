```
diagnose sys sdwan member
```
```
diagnose sys sdwan zone
```
```
diagnose netlink interface list | grep index=25
```
Performance SLA:
```
diagnose sys sdwan health-check status
```

Check routing tables and database:
```
get router info routing-table all
```
```
get router info routing-table database
```
Link monitor status:
```
diagnose sys link-monitor interface port1
```
Link monitor passive status:
```
diagnose sys link-monitor-passive admin list
```
Policy Route Table:
```
diagnose firewall proute list
```
Sessions 
```
get system session status
```
```
get system session list
```

Routing Changes and SNAT Sessions (force reevaluation after routing change):
```
config system global
     set snat-route-change enable
end
```