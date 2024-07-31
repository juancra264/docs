# Ubuntu Server Template on Proxmox:

Reference [Video](https://www.youtube.com/watch?v=MJgIm03Jxdo&list=PLT98CRl2KxKHnlbYhtABg6cF50bYa8Ulo&index=20)

[Ubuntu Minimal Cloud Images](https://cloud-images.ubuntu.com/minimal/releases/)  

## Download cloud image

Cloud image for ubuntu 24.04 LTS

```bash
wget https://cloud-images.ubuntu.com/minimal/releases/noble/release-20240709/ubuntu-24.04-minimal-cloudimg-amd64.img
```

## Some tweaks for the vm before to convert into a template

VM ID will be 900, can be change to any ID number.

### Add a serial console to the reference VM
```bash
qm set 900 --serial0 socket --vga serial0
```

### Change the file extension of the image to .qcow2
```bash
mv ubuntu-24.04-minimal-cloudimg-amd64.img ubuntu-24.04.qcow2
```

### Resize the downloaded cloud image
```bash
qemu-img resize ubuntu-24.04.qcow2 32G
```

### Import the cloud image into Proxmox
```bash
qm importdisk 900 ubuntu-24.04.qcow2 local-lvm
```
