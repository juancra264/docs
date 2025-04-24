Become the root user:

```
sudo -i
```

Go to:
```
cd /root
```

Create the following file script: 

```
vim backup_home.sh
```

Copy and paste the commands:

```bash
#!/bin/sh
backup_date=$(date +"%Y%m%d_%H%M%S")
home_path="/home/juanramirez"
home_user="juanramirez"
backup_tar="backupHome.tar.gz"
# Take a Home backup
tar -cvpzf $backup_tar $home_path
# Start all other containers
chown $home_user:$home_user $backup_tar
# Moving tar file
mv $backup_tar $home_path

```

Run like:

```
sh backup_home.sh
```