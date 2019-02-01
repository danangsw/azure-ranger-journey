#Install module in global scope (required administrator privileges) 
Install-Module -Name Az -AllowClobber

#If you don't have administrator privileges, install in current user
Install-Module -Name Az -AllowClobber -Scope CurrentUser

#By default, the PowerShell gallery isn't configured as a trusted repository for PowerShellGet. Follow the prompt installation by Answer Yes or Yes to All to continue with the installation.

#Set the PowerShell Execution Policy from Restricted to RemoteSigned or Unrestricted to allow local PowerShell scripts to be run. 
Set-ExecutionPolicy RemoteSigned

#If you've disabled module autoloading, you need to manually import the module with
Import-Module Az

#Update the Azure PowerShell module
Update-Module -Name Az

#To start working with Azure PowerShell, sign in with your Azure credentials.
# Connect to Azure with a browser sign in token
Connect-AzAccount
