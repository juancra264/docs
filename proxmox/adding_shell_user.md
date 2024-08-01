# Adding a User for ssh and shell access

## Creating user group
```bash
groupadd -g {group_id} {group_name}
```

## Creating user
```bash
useradd -u {user_id} -g {group_id} -d {home_path_folder} -s /bin/bash -G {group_name} {user_name}
```

## Setting user password
```bash
passwd {user_name}
```

## Adding root/sudo privileges
```bash
usermod -aG sudo {user_name}
```
