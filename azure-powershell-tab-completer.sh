#Since version 3.0, PowerShell has supported applying argument completers to cmdlet parameters. 
#To best capture the functionality of the completers, Modify the key binding for “Tab” in the examples below to display all the possible values at once.
#Simply run:
Set-PSReadLineKeyHandler -Key Tab -Function Complete

#Goto:
$IE=new-object -com internetexplorer.application
$IE.navigate2("https://azure.microsoft.com/en-us/blog/completers-in-azure-powershell/")
$IE.visible=$true
