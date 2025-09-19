# Fortigate - Remove Virtual Switch on FG-80F

## Step by step Configuration

**1. Delete Firewall Policies Using the Switch**

```Shell
config firewall policy
  show  
  delete 1  
end
```

**2. Delete DHCP Server Linked to the Switch**

```Shell
config system dhcp server
  show  
  delete 1  
end
```

**3. Delete the virtual switch Interface**
```Shell
config system virtual-switch
  edit internal
  set physical-switch sw0
  config port
    delete internal1
    delete internal2
    delete internal3 
    delete internal4
    delete internal5
    delete internal6
  end
end

```

**4. Reconfigure Physical Interfaces Individually**

```Shell
config system interface
  edit internal2
  set ip 192.168.8.1 255.255.255.0
  set allowaccess ping https ssh
  set alias "local MGMT LAN Port"
  set role lan
  next
end
```