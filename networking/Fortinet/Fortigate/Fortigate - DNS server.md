# Fortigate - Conditional DNS Forwarder

## CLI Configuration

Configure DNS servers for system

```
config system dns
  set primary 41.74.203.10
  set secondary 41.74.203.11
  set domain "emmirothusa.com"
end
```

Configure DNS database for forward

```
config system dns-database
  edit "internal"
    set domain "example.com"
    set authoriative disable
    set forwarder "10.200.0.110" 10.200.0.10"
    set source-ip 10.26.0.1
  next
end
```

