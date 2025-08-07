# Fortigate - Conditional DNS Forwarder

## CLI Configuration

Enable DNS server on the firewall

```
config system settings
    set gui-dns-database enable 
end
```


Configure DNS servers for system

```
config system dns
  set primary {primaryDNS}
  set secondary {secondayDNS}
  set domain "{searchDomain}"
end
```

Configure DNS database for forward

```
config system dns-database
  edit "internal"
    set domain "{example.com}"
    set authoriative disable
    set forwarder "{internalDNS1resolver}" "{internalDNS2resolver}"
    set source-ip "{internalSourceIP}"
  next
end
```

Interface that DNS response:

```
config system dns-server
    edit "{interface_name}"
    next
end
```

