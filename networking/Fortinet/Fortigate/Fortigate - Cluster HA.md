# Fortigate - HA Cluster

## Configuration using CLI

Change the hostname of the FortiGate:

```
config system global
    set hostname Example1_host
end
```

Enable HA

```
config system ha
    set mode a-p
    set group-id 1
    set group-name {{name_cluster}}
    set password {{Password_cluster}}
    set hbdev Port5 10 Port6 20
    set override disable
    set monitor Port1
    set session-pickup enable
    set session-pickup-connectionless enable
end 
```

Repeat steps on the other FortiGate devices to join the cluster, giving each device a unique hostname.

---

## Show configuration and operation

**Cluster config:**
```bash
show system ha
```

**Viewing cluster status**
```bash
get system ha status
```

```bash
diag ha sys status
```

**Check the checksum mismatch**
```
diag sys ha checksum show <vdom>
```

```
 diag sys ha checksum show <global>
```


**Manage any other firewall within the cluster**
```bash
execute ha manage 1 <admin_user>
```

**Check the checksum - config syncronization.**
```bash
diagnose sys ha checksum show
```

**Cluster failover module:**
```bash
diag sys ha reset-uptime
```

**Force the Slave to re-sync with the Master**
```bash
execute ha synchronize start
```
```bash
diagnose sys ha checksum recalculate
```

**Command to re-calculate the checksum**
```
diagnose sys ha checksum recalculate [<vdom-name> | global]
```

**Debug HA logs**
```
diag debug app hasync 255
diag debug enable
execute ha synchronize start

diagnose debug application hatalk -1
```
