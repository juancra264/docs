# Docker upgrade container image using Docker compose

This is a script to upgrade the container image after changing the version on a docker compose file.

```bash
!/bin/sh
## Set some Colors
red=$(tput setaf 1)
green=$(tput setaf 2)
blue=$(tput setaf 4)
magenta=$(tput setaf 5)
cyan=$(tput setaf 6)
reset=$(tput sgr0)

echo -e "*****************************************************************************"
echo "${magenta}Starting Zabbix System upgrade${reset}"
sleep 1

echo -e "${red}STOPPING all Zabbix Containers${reset}"
docker compose down
echo -e "*****************************************************************************"

echo -e "${red}REMOVING old Zabbix Containers Images${reset}"
docker compose rm -f
echo -e "*****************************************************************************"

echo -e "${blue}PULLING all Zabbix Containers Images${reset}"
docker compose pull
echo -e "*****************************************************************************"

echo -e "${green}STARTING new Zabbix Containers${reset}"
docker compose up -d
echo -e "*****************************************************************************"
```