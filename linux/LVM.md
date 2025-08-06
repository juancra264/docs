# LVM Operations

## Listing Disk Devices and Partitions:
```
lsblk
```
```
sudo fdisk -l
```
```
sudo lshw -class disk
```

## Monitoring Disk I/O Performance
```
iostat
```
```
iotop
```

## Show Physical Volume (PV),
```
pvs
```
```
pvdisplay
```

## Show Volume Group (VG)
```
vgs
```
```
vgdisplay
```

## Show Logical Volume (LV)
```
lvs
```
```
lvdisplay
```

## Add a new disk to an LVM setup without shutting down the server

### Check the current filesystem size
```
df -h
```

### Identify the new disk
```
fdisk -l
```

### Partition the disk
```
fdisk /dev/sdb
```

1 Primary partition

n for new partition
e for extended
p primary partition
p return


2 Change Type

fdisk /dev/sdb
command: t
type: 8e and return
 to linux LVM

3 Print and Verify
fdisk /dev/sdb
command: p 

4 Write to disk
fdisk /dev/sdb
Command: w 


### Create the Physcal Volume (PV)
```
pvcreate /dev/sdb1
```

### Extend the Volumen group (VG)
```
vgextend {volume_group_name} /dev/sdb1
```

### Extend the Logical Volume (LV)
```
lvextend -l +100%FREE /dev/{volume_group_name}/{logical_volume_name}
```

### Resize the fileslystem:
For ext2/ext3/ext4 filesystems
```
resize2fs /dev/{volume_group_name}/{logical_volume_name} 
```

For XFS
```
xfs_growfs /{mount_point}
```

### Verify the changes
```
df -hT
```

```
cat /etc/fstab
```