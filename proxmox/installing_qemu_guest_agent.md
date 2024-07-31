# Ubuntu Server qemu-guest-agent for PROXMOX

## Installing:

```bash
sudo apt install qemu-guest-agent
```

## Start the service:

```bash
sudo systemctl start qemu-guest-agent
```

## Enable the server for persistance:
```bash
sudo systemctl enable qemu-guest-agent
```
