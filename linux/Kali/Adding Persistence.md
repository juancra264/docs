# Adding Encrypted Persistence to a Kali Linux Live USB Drive

Start by imaging the Kali ISO onto your USB drive.


Check drives:
```
lsblk
```

Create and format an additional partition on the USB drive.

```
usb=/dev/sdX
```

```
sudo fdisk $usb <<< $(printf "p\nn\np\n\n\n\np\nw")
```

```
lsblk
```

Encrypt the partition with LUKS.

```
sudo cryptsetup --verbose --verify-passphrase luksFormat /dev/sdX3
```

```
sudo cryptsetup luksOpen /dev/sdX3 my_usb
```


Create an ext4 filesystem and label it.

```
usb=/dev/sdX
```

```
sudo mkfs.ext4 -L persistence /dev/mapper/my_usb
```

Mount the partition and create your persistence.conf so changes persist across reboots.

```
sudo mkdir -pv /mnt/my_usb
```

```
sudo mount -v /dev/mapper/my_usb /mnt/my_usb
```

```
echo "/ union" | sudo tee /mnt/my_usb/persistence.conf
```

```
sudo umount -v /mnt/my_usb
```

Close the encrypted partition.

```
sudo cryptsetup luksClose /dev/mapper/my_usb
```

Now your USB drive is ready to plug in and reboot into Live USB Encrypted Persistence mode.

```
reboot
```

