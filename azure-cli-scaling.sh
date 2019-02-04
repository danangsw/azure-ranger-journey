#Scale up your VM, increase your VM's size to Standard_DS3_v2.
az vm resize \
  --resource-group [your resource group name] \
  --name [Your VM name] \
  --size Standard_DS3_v2

#Verify that your VM is running the new size.
az vm show \
  --resource-group [your resource group name] \
  --name [Your VM name] \
  --query "hardwareProfile" \
  --output tsv
