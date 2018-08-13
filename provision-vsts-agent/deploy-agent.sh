#!/bin/bash 

# set -euo pipefail

IFS=$'\n\t'
usage() { echo "Usage: "  1>&2; exit 1; }

declare resourceGroup="OH-DevOps-Agent"
declare sshKeyDataPath="/Users/dcaro/.ssh/id_rsa.pub"
declare vmName="ohdevopsagent"
declare AADUserName=""
declare vm=""

# Verify login 


# Create the resource group
az group create --name $resourceGroup --location westus2

# Create the VM to host the agent
az vm create --resource-group $resourceGroup --name $vmName --image Canonical:UbuntuServer:16.04-LTS:latest --custom-data cloud-init.yml --admin-username azureuser --ssh-key-value @/Users/dcaro/.ssh/id_rsa.pub

# Wait for the VM to be ready after reboot
sleep 30

# Install Azure AD Login VM Extension
az vm extension set --publisher Microsoft.Azure.ActiveDirectory.LinuxSSH --name AADLoginForLinux --resource-group $resourceGroup --vm-name $vmName

# Define role assignement for the VM 
AADUserName=$(az account show --query user.name --output tsv)
vm=$(az vm show --resource-group $resourceGroup --name $vmName --query id -o tsv)

az role assignment create --role "Virtual Machine Administrator Login" --assignee $AADUserName --scope $vm

# Attach to the container with docker attach xxxxx
# Detach from the container with Ctrl-p Ctrl-q sequence
