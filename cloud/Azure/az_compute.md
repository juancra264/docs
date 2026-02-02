# Azure compute

## Create a resource group
```shell
az group create --name {{resource_group}} --location eastus
```

## Create a Linux virtual machine
```shell
az vm create \
  --resource-group "IntroAzureRG" \
  --name my-vm \
  --size Standard_D2s_v5 \
  --public-ip-sku Standard \
  --image Ubuntu2204 \
  --admin-username azureuser \
  --generate-ssh-keys    
```

## Install Nginx
```shell
az vm extension set \
  --resource-group "IntroAzureRG" \
  --vm-name my-vm \
  --name customScript \
  --publisher Microsoft.Azure.Extensions \
  --version 2.1 \
  --settings '{"fileUris":["https://raw.githubusercontent.com/MicrosoftDocs/mslearn-welcome-to-azure/master/configure-nginx.sh"]}' \
  --protected-settings '{"commandToExecute": "./
```

## Get vm ip address
```shell
IPADDRESS="$(az vm list-ip-addresses \
  --resource-group "IntroAzureRG" \
  --name my-vm \
  --query "[].virtualMachine.network.publicIpAddresses[*].ipAddress" \
  --output tsv)"    
```

## List the current network security group rules
```shell
az network nsg list \
  --resource-group "IntroAzureRG" \
  --query '[].name' \
  --output tsv
```
```shell
az network nsg rule list \
  --resource-group "IntroAzureRG" \
  --nsg-name my-vmNSG \
  --query '[].{Name:name, Priority:priority, Port:destinationPortRange, Access:access}' \
  --output table    
```

## Create the network security rule
```shell
az network nsg rule create \
  --resource-group "IntroAzureRG" \
  --nsg-name my-vmNSG \
  --name allow-http \
  --protocol tcp \
  --priority 100 \
  --destination-port-range 80 \
  --access Allow    
```
```shell
az network nsg rule list \
  --resource-group "IntroAzureRG" \
  --nsg-name my-vmNSG \
  --query '[].{Name:name, Priority:priority, Port:destinationPortRange, Access:access}' \
  --output table
```
