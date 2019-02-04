#Sign in
Connect-AzAccount

#Staying Connected to Azure Account
Enable-AzContextAutoSave

#Disconnected from Azure Account
Disable-AzContextAutoSave

#Create a resource group
New-AzResourceGroup -Name TutorialResources -Location eastus

#Output:
#ResourceGroupName : TutorialResources
#Location          : eastus
#ProvisioningState : Succeeded
#Tags              :
#ResourceId        : /subscriptions/XXXXXXXX-XXXX-XXXX-XXXX-XXXXXXXXXXXX/resourceGroups/TutorialResources

#Create admin credentials for the VM
$cred = Get-Credential -Message "Enter a username and password for the virtual machine."

#Output:
#Windows PowerShell credential request.
#Enter a username and password for the virtual machine.
#User: tutorAdmin
#Password for user tutorAdmin: *********

#Create a virtual machine
$vmParams = @{
  ResourceGroupName = 'TutorialResources'
  Name = 'TutorialVM1'
  Location = 'eastus'
  ImageName = 'Win2016Datacenter'
  PublicIpAddressName = 'tutorialPublicIp'
  Credential = $cred
  OpenPorts = 3389
}
$newVM1 = New-AzVM @vmParams

#Output:
#Creating Azure resources
#  39% \
#  [ooooooooooooooooooooooooooooooooooo                                                                 ]
#
#  Creating TutorialVM1 virtual machine.

#View the VM parameter
$newVM1

#Output:
#ResourceGroupName : TutorialResources
#Id                : /subscriptions/XXXXXXXX-XXXX-XXXX-XXXX-XXXXXXXXXXXX/resourceGroups/TutorialResources/providers/Microsoft.Compute/virtualMachines/TutorialVM1
#VmId              : 12345678-9abc-def0-1234-56789abcedf0
#Name              : TutorialVM1
#Type              : Microsoft.Compute/virtualMachines
#Location          : eastus
#Tags              : {}
#HardwareProfile   : {VmSize}
#NetworkProfile    : {NetworkInterfaces}
#OSProfile         : {ComputerName, AdminUsername, WindowsConfiguration, Secrets}
#ProvisioningState : Succeeded
#StorageProfile    : {ImageReference, OsDisk, DataDisks}

#Get VM information with queries
$publicIp = Get-AzPublicIpAddress -Name tutorialPublicIp -ResourceGroupName TutorialResources

$publicIp | Select-Object Name,IpAddress,@{label='FQDN';expression={$_.DnsSettings.Fqdn}}

#Qurey output azure powershell:
https://docs.microsoft.com/en-us/powershell/azure/queries-azureps?view=azps-1.2.0

#Output:
#Name             IpAddress           FQDN
#----             ---------           ----
#tutorialPublicIp <PUBLIC_IP_ADDRESS> tutorialvm1-8a0999.eastus.cloudapp.azure.com

#Connect to the VM over Remote Desktop
#Using user credentials when you create VM for the first time
#You can reset or get the troubleshot when you cannot connect using RDP,
#by follow this URL: https://docs.microsoft.com/en-us/powershell/azure/queries-azureps?view=azps-1.2.0

mstsc.exe /v <PUBLIC_IP_ADDRESS>

