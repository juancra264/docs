# Ubuntu Server qemu-guest-agent for PROXMOX

## Installing the service:
```bash
sudo apt install qemu-guest-agent
```

## Start the service:
```bash
sudo systemctl start qemu-guest-agent
```

## Enable the service for persistance:
```bash
sudo systemctl enable qemu-guest-agent
```
