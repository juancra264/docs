# Fortigate - Wireless controller

Show only connected clients

```
diagnose wireless-controller wlac -c sta
```

OID snmp to get the APs information:

| OID | Name | Description |
| --- | --- |--- |
| .1.3.6.1.4.1.12356.101.14.2.3 | fgWcInfoWtpCapacity | Maximum number of APs that can be managed on the Fortigate.|
| .1.3.6.1.4.1.12356.101.14.2.4 | fgWcInfoWtpManaged | Number of APs being managed on the Fortigate. |
| .1.3.6.1.4.1.12356.101.14.2.5 | fgWcInfoWtpSessions | Number of APs that are connecting to the Fortigate. |
| .1.3.6.1.4.1.12356.101.14.2.7 | fgWcInfoStationCount	| Number of Clients that are connected to wireless services. |

Show APs

```
show wireless-controller wtp
```
```
diagnose wireless-controller wlac -d
```
```
diagnose wireless-controll wlac -c 
```
```
diagnose wireless-controller wlac -c vap
```
```
diagnose wireless-controll wlac -d wtp
```
```
diagnose wireless-controll wlac -c  wtp
```