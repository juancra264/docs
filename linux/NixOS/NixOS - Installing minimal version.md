# NixOS - Installing minimal version

## Key installation steps include:
- Download the ISO: Obtain the minimal image from https://nixos.org/download/ (e.g., latest-nixos-minimal-x86_64-linux.iso). 

- Partition and Format: Use tools like parted or fdisk to create partitions (e.g., EFI, root, swap), then format them using mkfs.fat, mkfs.ext4, and mkswap.

- Mount and Configure: Mount the root partition to /mnt (and /mnt/boot if separate), then run nixos-generate-config --root /mnt to create configuration files. 

- Edit Configuration: Modify /mnt/etc/nixos/configuration.nix to set your hostname, enable SSH, define users, and specify the boot loader (e.g., boot.loader.grub.device). 

- Install and Reboot: Execute nixos-install to install the system, set the root password, and reboot. 

Para instalar **NixOS** desde la versión mínima (ISO minimal), el proceso es manual pero muy estructurado. Asumiendo que ya has arrancado desde el medio de instalación y tienes acceso a la terminal, estos son los pasos fundamentales:

### 0. Ingresar al usuario Root

    ```bash
    sudo -i
    ```

### 1. Preparación del Disco
Primero, debes particionar el disco. Lo más común es usar **GPT** con una partición **EFI** (arranque) y una partición **Root**.

* **Identificacion de discos:**
    ```bash
    lsblk
    ```

* **Particionamiento (usando `cfdisk`):**
    ```bash
    sudo cfdisk /dev/sda
    ```
    *(Crea una partición de ~512MB tipo "EFI System" y el resto como "Linux root x86-64")*

* **Formateo:**
    ```bash
    # Formatear la partición de arranque (ejemplo /dev/sda1)
    sudo mkfs.fat -F 32 -n boot /dev/sda1

    # Formatear la partición raíz (ejemplo /dev/sda2)
    sudo mkfs.ext4 -L nixos /dev/sda2
    ```

### 2. Montaje de Particiones
Es crucial montar la partición raíz en `/mnt` y la de arranque en `/mnt/boot`.

```bash
sudo mount /dev/disk/by-label/nixos /mnt
sudo mkdir -p /mnt/boot
sudo mount /dev/disk/by-label/boot /mnt/boot
```

### 3. Generación de la Configuración Base
NixOS puede detectar tu hardware y generar los archivos de configuración iniciales por ti.

```bash
sudo nixos-generate-config --root /mnt
```
Esto creará dos archivos en `/mnt/etc/nixos/`:
1.  `hardware-configuration.nix`: (No lo edites manualmente, contiene la info de tus discos).
2.  `configuration.nix`: (Aquí es donde defines tu zona horaria, usuarios, paquetes y el entorno de escritorio).

### 4. Edición de la Configuración
Antes de instalar, abre el archivo principal para habilitar el cargador de arranque (bootloader) y configurar lo básico:

```bash
sudo nano /mnt/etc/nixos/configuration.nix
```
> **Nota:** Asegúrate de que `boot.loader.systemd-boot.enable` esté en `true` si usas UEFI. También puedes configurar tu red con `networking.hostName = "nixos";`.

### 5. Instalación Final
Una vez que el archivo de configuración esté listo, ejecuta el comando de instalación. Este proceso descargará todos los paquetes necesarios.

```bash
sudo nixos-install
```
Al finalizar, te pedirá que ingreses una contraseña para el usuario **root**.

### 6. Reinicio
Si todo salió bien, desmonta y reinicia:
```bash
sudo reboot
```

---

¿Te gustaría que te ayude a configurar una sección específica en el `configuration.nix`, como el soporte para **Nix Flakes** desde el inicio o la configuración de tu red?