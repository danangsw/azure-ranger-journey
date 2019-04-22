#Configure IIS, download and execute a PowerShell script that installs IIS and configures a basic home page.
#Windows
az vm extension set --resource-group [Your Resource Group Name] --vm-name [Your VM Name] --name CustomScriptExtension --publisher Microsoft.Compute --settings "{'fileUris':['https://raw.githubusercontent.com/MicrosoftDocs/mslearn-welcome-to-azure/master/configure-iis.ps1']}" --protected-settings "{'commandToExecute': 'powershell -ExecutionPolicy Unrestricted -File configure-iis.ps1'}"

#Linux
az vm extension set \
  --resource-group 00807a57-e905-46cc-a1c2-ee3eb5e52038 \
  --vm-name myVM \
  --name customScript \
  --publisher Microsoft.Azure.Extensions \
  --settings "{'fileUris':['https://raw.githubusercontent.com/MicrosoftDocs/mslearn-welcome-to-azure/master/configure-nginx.sh']}" \
  --protected-settings "{'commandToExecute': './configure-nginx.sh'}"

#Open port 80 (HTTP) through the firewall.
az vm open-port --name [Your VM Name] --resource-group [Your Resource Group Name] --port 80

#Verify configuration
az vm show --name [Your VM Name] --resource-group [Your Resource Group Name] --show-details --query [publicIps] --output tsv

#Output
52.163.217.24
