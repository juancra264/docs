# Thing to do after installing proxmox

### Switch Repository to Non-Production Version

```
nano /etc/apt/sources.list
```

Add the following lines to the bottom of the file:

```
# NOT recommended for production use
deb http://download.proxmox.com/debian/pve bookworm pve-no-subscription
# Not for production ceph
deb http://download.proxmox.com/debian/ceph-quincy bookworm no-subscription
```

### Disable the Production Repository

Next, disable the production repository by commenting out these lines in pve-enterprise.list:

```
nano /etc/apt/sources.list.d/pve-enterprise.list
```

Comment out this line:
```
#deb https://enterprise.proxmox.com/debian/pve bookworm pve-enterprise
```

Similarly, disable the enterprise repository for Ceph by commenting out these lines in ceph.list:

```
nano /etc/apt/sources.list.d/ceph.list
```

### VLAN Configuration

- Select your server.
- Go to “Network” in the menu.
- Select the Linux bridge (vmbro#).
- Click “Edit” at the top of the window.
- Check the box that says “VLAN aware.”
- Press “OK.”

### Disable Subscription Popup
To remove the subscription popup, run the following command:

```
sed -Ezi.bak "s/(Ext.Msg.show\(\{\s+title: gettext\('No valid sub)/void\(\{ \/\/\1/g" /usr/share/javascript/proxmox-widget-toolkit/proxmoxlib.js && systemctl restart pveproxy.service
```
Afterward, reboot your server, log out of the Proxmox web GUI, clear your browser cache, and then log back in.

### Configure DNS and Install SSL Certificate.
- Configure DNS hostname like 

```
pve1.domain.local
```

- Upload the certificates or ACME module activation for your domain.

### Setup SMART monitoring for disks

```
smartctl -a /dev/sda
```
### Create the first linux VM and create a Template

Check how to create a template.