# Fortigate SDWAN ADVPN 


## Enable ecmp on fortigate

```
config system sdwan
  set load-balance-mode weight-based
  end
```

```
config system settings
  set ecmp-max-paths 4
  end
```

```
config router bgp
  set ibgp-multipaht enable
end
```  