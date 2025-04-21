
```bash
show system admin | grep -f noaccess 
```
```bash
execute disconnect-admin-session ?
```
```bash
show system accprofile | grep noaccess 
show system admin | grep accprofile-override
```
```bash
config system admin
  edit "tacacs-all-user"
    set accprofile "noaccess"
  next
end
```