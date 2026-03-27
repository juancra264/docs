# Kali linux - Wallpaper error on RPI

If your Kali desktop turned completely black after deleting the default wallpaper, or not changing wallpaper and you’re getting errors like:

Failed to load image file ‘(null)’: Error opening file /usr/share/backgrounds/kali-16x9/default: No such file or directory

It’s because XFCE was still trying to load the missing default wallpaper.

Real Fix (Tested & Working on Pi 4)

Choose any image you want to use as wallpaper.

Rename it exactly to: default (with no extension like .jpg)

Move it to this folder:

```
sudo mv default /usr/share/backgrounds/kali-16x9/
```

Then reboot your system:

```
sudo reboot
```

Boom! The wallpaper is back, and the black screen issue is gone.