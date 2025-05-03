# Fail2ban

## Installing

RHEL - Oracle Linux based:
```
sudo dnf -y install fail2ban-firewalld
```

Ubuntu/Debian based:
```
sudo apt -y install fail2ban
```

## Configuration

The default configuration is defined in [/etc/fail2ban/jail.conf].

```
sudo vi /etc/fail2ban/jail.conf
```

```
# line 87 : ignore your own local IP
#ignoreself = true

# line 92 : possible to add ignored networks
#ignoreip = 127.0.0.1/8 ::1

# line 101 : number of seconds that a host is banned
# - 1m ⇒ 1 minutes
# - 1h ⇒ 1 houer
# - 1d ⇒ 1 day
# - 1mo ⇒ 1 month
# - 1y ⇒ 1 year
bantime  = 10m

# line 105 : A host is banned if it has generated "maxretry" during the last "findtime"
findtime  = 10m

# line 108 : "maxretry" is the number of failures before a host get banned
maxretry = 5

# line 178 : destination email address if enabling email notification
destemail = root@localhost

# line 181 : sender address if enabling email notification
sender = root@<fq-hostname>

# line 263 : default action
# - %(action_)s ⇒ ban only
# - %(action_mw)s ⇒ band and email notification (includes Whois info)
# - %(action_mwl)s ⇒ band and email notification (includes Whois info and logs)
action = %(action_)s
```

Create new

```
sudo vim /etc/fail2ban/jail.local
```

```
[DEFAULT]
ignoreip = 127.0.0.1/8 ::1
bantime  = 1d
findtime  = 5m
maxretry = 5
banaction = firewallcmd-ipset
banaction_allports = firewallcmd-ipset
```

```
sudo systemctl restart fail2ban
```

```
[sshd]
enabled = true
maxretry = 3
port = ssh
logpath = %(sshd_log)s
backend = %(sshd_backend)s
action = firewallcmd-ipset
```

``` 
systemctl start fail2ban.service
```
```
systemctl enable fail2ban.service
```
 
## Verification

```
firewall-cmd --direct --get-all-rules
```
```
ipset list fail2ban-sshd
```
```
fail2ban-client status
```
```
fail2ban-client status sshd
```
	
Tracking Failed login entries
```
cat /var/log/secure | grep 'Failed password'
```

Checking the banned IPs by Fail2Ban
```
iptables -L -n
```	 
	
Check the Fail2Ban Status
```
systemctl status fail2ban
journalctl -b -u fail2ban
fail2ban-client status
fail2ban-client status sshd
tail -F /var/log/fail2ban.log
```

Unbanning an IP address
```
fail2ban-client set sshd unbanip IPADDRESS
```
