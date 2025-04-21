Run these commands to create a syslog server address:
```
config system syslog
  edit New_syslog_server
     set ip <securetrack_server_ip_address>
end
```
Run these commands to configure the syslog server setting and to enable it:
```
config system locallog syslogd3 setting
  set severity information
  set syslog-name New_syslog_server
  set status enable
end
````