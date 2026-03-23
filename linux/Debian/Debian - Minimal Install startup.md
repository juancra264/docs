# Debian - Minimal Install startup 

**Install sudo on Debian**  
If `sudo` is not installed on your Debian system, you must first gain root access using `su -` and then install `sudo` via the package manager.

1. **Switch to root user**:  
   Open a terminal and run:  
   ```bash
   su -
   ```  
   Enter the root password when prompted.

2. **Update package lists and install sudo**:  
   Run the following commands:  
   ```bash
   apt update && apt upgrade
   apt install sudo git
   ```  
   This installs the `sudo` package and its dependencies.

3. **Add your user to the sudo group**:  
   After installation, add your user to the `sudo` group to grant administrative privileges:  
   ```bash
   adduser your_username sudo
   ```  
   Replace `your_username` with your actual username.

4. **Refresh group membership**:  
   Log out and log back in (or use `newgrp sudo`) to apply the new group membership.

5. **Verify sudo access**:  
   Test the setup by running:  
   ```bash
   sudo whoami
   ```  
   You should be prompted for your user password and return `root`.

> **Note**: Debian does not install `sudo` by default in minimal or server installations. If you skipped setting a root password during installation, `sudo` is often pre-configured for your user account.