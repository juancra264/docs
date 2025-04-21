execute dhcp lease-list

execute dhcp lease-list <interface>

execute dhcp lease-clear 192.168.1.5


If FortiGate is the DHCP server:

diag debug reset
diag debug application dhcps -1  
diag debug enable 


To stop the debug:  

diag debug reset
diag debug disable


Or, in the CLI, enter the following:  

diag sniffer packet <interface_name/any> "port 67 or port 68" 6 0 1
