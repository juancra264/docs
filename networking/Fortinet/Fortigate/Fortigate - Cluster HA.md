# Fortigate - HA Cluster

## Configuration using CLI

Change the hostname of the FortiGate:

```shell
config system global
    set hostname Example1_host
end
```

Enable HA

```shell
config system ha
    set mode a-p
    set group-id 1
    set group-name {{name_cluster}}
    set password {{Password_cluster}}
    set hbdev {{HAport1}} 10 {{HAport2}} 20
    set override disable
    set monitor {{MonitorPort}}
    set session-pickup enable
    set session-pickup-connectionless enable
end 
```

Repeat steps on the other FortiGate devices to join the cluster, giving each device a unique hostname.

Force a Manual Sync
You can manually trigger a sync using CLI:

```shell
execute ha synchronize start
```


---

## Show configuration and operation

**Cluster config:**
```shell
show system ha
```

**Viewing cluster status**
```shell
get system ha status
```

```shell
diagnose sys ha status
```

**Check the checksum mismatch**
```shell
diag sys ha checksum show <vdom>
```

```shell
 diag sys ha checksum show <global>
```


**Manage any other firewall within the cluster**
```shell
execute ha manage 1 <admin_user>
```

**Check the checksum - config syncronization.**
```shell
diagnose sys ha checksum show
```

**Cluster failover module:**
```shell
diag sys ha reset-uptime
```

**Force the Slave to re-sync with the Master**
```shell
execute ha synchronize start
```
```shell
diagnose sys ha checksum recalculate
```

**Command to re-calculate the checksum**
```shell
diagnose sys ha checksum recalculate [<vdom-name> | global]
```

**Debug HA logs**
```shell
diag debug app hasync 255
diag debug enable
execute ha synchronize start

diagnose debug application hatalk -1
```
