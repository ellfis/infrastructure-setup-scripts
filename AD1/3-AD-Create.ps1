# Create New Forest, add Domain Controller
$domainname = "clearviews.biz"
$netbiosName = "CLEARVIEWS"
$Secure_String = ConvertTo-SecureString "Password1" -AsPlainText -Force
Import-Module ADDSDeployment
Install-ADDSForest -CreateDnsDelegation:$false `
-SafeModeAdministratorPassword $Secure_String `
-DatabasePath "C:\Windows\NTDS" `
-DomainMode "Default" `
-DomainName $domainname `
-DomainNetbiosName $netbiosName `
-ForestMode "Default" `
-InstallDns:$true `
-LogPath "C:\Windows\NTDS" `
-NoRebootOnCompletion:$false `
-SysvolPath "C:\Windows\SYSVOL" `
-Force:$true