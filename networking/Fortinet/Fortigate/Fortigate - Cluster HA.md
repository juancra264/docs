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