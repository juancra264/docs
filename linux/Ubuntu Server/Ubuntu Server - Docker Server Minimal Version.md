# Ubuntu Server - Docker Server Minimal Version

Here’s a clean, **step‑by‑step guide** to install a **minimal Ubuntu Server 24.04 LTS** VM in **Proxmox** that is optimized to run **Docker** (lightweight, fast boot, minimal services).

This setup avoids snaps where possible, trims unnecessary packages, and prepares the system for container workloads.

***

# 🧰 **1. Download Ubuntu Server 24.04 LTS ISO (Minimal Install Capable)**

Grab the official ISO:

👉 <https://ubuntu.com/download/server>

Use the **“Live Server”** ISO (it includes the minimal option).

Upload the ISO to Proxmox:

    Datacenter → Node → local (ISO Storage) → Upload

***

# 🖥️ **2. Create the VM in Proxmox**

Go to:

**Create VM →**

### **General**

*   Name: `ubuntu-docker-24.04`

### **OS**

*   Use the uploaded ISO
*   Type: `Linux`
*   Version: `Ubuntu`

### **System**

Recommended for Docker hosts:

*   Machine: **q35**
*   BIOS: **OVMF (UEFI)**
*   SCSI Controller: **VirtIO SCSI**
*   Add EFI Disk → put on local-lvm

*(q35+UEFI boots faster and supports modern virt features)*

### **Disks**

Use as small as you want—Docker grows mostly in `/var/lib/docker`.

*   Bus/Device: **VirtIO Block**
*   Size: **16–40 GB** (plenty for Docker)

### **CPU**

*   Type: **host**
*   Cores: **2–4** recommended

### **Memory**

*   **2–4 GB RAM** for lightweight Docker workloads
*   Enable: **Ballooning**

### **Network**

*   Model: **VirtIO (paravirtualized)**

Finish creation. Then select VM → Start → Console.

***

# 🧪 **3. Install Ubuntu Server (Minimal Mode)**

During setup:

### ✔ Choose “Minimal Installation”

This removes GUI tools, extra utilities, SNAP based apps, etc.

### Recommended installer options:

*   **No Ubuntu Pro** (optional)
*   **OpenSSH server: ON**
*   **All Snap options: OFF**
*   **No featured server snaps**
*   **Filesystem**: Use **ext4** (simpler, faster)
*   **No LVM** unless you prefer it

Complete the install → reboot.

***

# 🧹 **4. Post‑Install Cleanup (Make It Even More Minimal)**

Log in via console or SSH.

Remove cloud-init if you don’t need it:

```bash
sudo apt purge cloud-init -y
sudo rm -rf /etc/cloud /var/lib/cloud
```

Remove snapd (optional but recommended for Docker hosts):

```bash
sudo apt purge snapd -y
sudo rm -rf ~/snap /snap /var/snap /var/lib/snapd
```

Upgrade and clean:

```bash
sudo apt update && sudo apt full-upgrade -y
sudo apt autoremove -y
```

***

# 🐳 **5. Install Docker (Official Method — Recommended)**

Add Docker’s repo:

```bash
sudo apt install ca-certificates curl gnupg -y
sudo install -m 0755 -d /etc/apt/keyrings

curl -fsSL https://download.docker.com/linux/ubuntu/gpg \
  | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg

sudo chmod a+r /etc/apt/keyrings/docker.gpg
```

Add repo:

```bash
echo \
"deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] \
https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" \
| sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
```

Install Docker CE:

```bash
sudo apt update
sudo apt install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin -y
```

Enable Docker:

```bash
sudo systemctl enable --now docker
```

Add your user:

```bash
sudo usermod -aG docker $USER
```

***

# ⚡ **6. Optimize Ubuntu for Docker in Proxmox**

### Enable CPU optimizations:

```bash
sudo apt install qemu-guest-agent -y
sudo systemctl enable --now qemu-guest-agent
```

### Tune kernel for containers (optional):

```bash
echo "net.ipv4.ip_forward=1" | sudo tee -a /etc/sysctl.conf
sudo sysctl -p
```

### Disable unnecessary services:

```bash
sudo systemctl disable --now multipathd.service
sudo systemctl disable --now apport.service
```

***

# 🎯 Your VM is Now a Minimal, Production‑Ready Docker Host

**You now have:**

*   Minimal Ubuntu 24.04 LTS
*   No snaps
*   Lightweight footprint
*   Optimized networking + CPU
*   Clean Docker CE install
*   Configured for Proxmox and container workloads

***

# Want me to create automation?

I can generate:

💠 **Proxmox cloud-init template for Ubuntu 24.04 minimal**  
💠 **Ansible playbook to prepare the VM**  
💠 **Bash bootstrap script**  
💠 **Terraform for Proxmox VM creation**

Just tell me what you prefer!
