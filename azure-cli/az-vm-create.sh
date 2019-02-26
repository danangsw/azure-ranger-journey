#Commands to create a username and generate a random password.
  USERNAME=azureuser
  PASSWORD=$(openssl rand -base64 32)

#Get region list locations
  az account list-locations

#Get OS list images
  az vm image list --all --output table

#Create VM
  az vm create \  #Command to create VM in azure
  --name myVM \ #The VM is named myVM. This name identifies the VM in Azure. It also becomes the VM's internal hostname, or computer name.
  --resource-group 1b678791-39f7-48c3-abfc-c82e190b4f63 \ #The resource group, or the VM's logical container, is named 1b678791-39f7-48c3-abfc-c82e190b4f63.
  --image Win2016Datacenter \ #Win2016Datacenter specifies the Windows Server 2016 VM image.
  --size Standard_DS2_v2 \  #Standard_DS2_v2 refers to the size of the VM. This size has two virtual CPUs and 7 GB of memory.
  --location eastus \ #eastus is selected region
  --admin-username $USERNAME \
  --admin-password $PASSWORD
  
#Verify your VM is running
  az vm get-instance-view \
  --name myVM \
  --resource-group 1b678791-39f7-48c3-abfc-c82e190b4f63 \
  --output table
  
