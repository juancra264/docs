```
system -n {change UpsName} -c helpdesk@emmiroth.com -l {locationName-RackName} -m "You must be an authorized user to login and use this system." -s enable

snmp -S enable -c1 erumon -a1 read -n1 10.200.1.118

dns -OM enable -p 41.74.203.10 -s 41.74.203.11 -d emmirothusa.com -n emmirothusa.com -h {change UpsName} -y enable

date -z -06:00 -f mm/dd/yyyy 

ntp -OM enable -p pool.ntp.org -e enable -u

tcpip6 -S disable
```

Change APC default password:
```
user -n apc -cp apc -pw {NewPassword}
```

Syslog there is not a CLI command for that settings:

Syslog Server:                                10.200.1.118
Port:                                                     5140
Language:                                        English
Protocol:                                           UDP

snmp -c2 erumon -a2 read -n2 10.200.1.111

