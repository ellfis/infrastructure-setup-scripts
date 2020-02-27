New-NetIPAddress –InterfaceAlias “Wired Ethernet Connection” –IPv4Address “10.0.1.200” –PrefixLength 24 -DefaultGateway 10.0.1.254
Set-DnsClientServerAddress -InterfaceAlias “Wired Ethernet Connection” -ServerAddresses 127.0.0.1, 1.1.1.1

#config settings
$ipaddress = "10.0.1.200"
$ipprefix = "24"
$ipgw = "10.0.1.1"
$ipdns = "127.0.0.1, 1.1.1.1"
$newname = "CORP-AD1"
$ipif = (Get-NetAdapter).ifIndex
#set static IP address
New-NetIPAddress -IPAddress $ipaddress -PrefixLength $ipprefix `
-InterfaceIndex $ipif -DefaultGateway $ipgw
#set DNS
Set-DnsClientServerAddress -InterfaceIndex $ipif -ServerAddresses "127.0.0.1, 1.1.1.1"
#rename the computer
Rename-Computer -NewName $newname -force
#install features
$featureLogPath = "c:\poshlog\featurelog.txt"
New-Item $featureLogPath -ItemType file -Force
$addsTools = "RSAT-AD-Tools"
Add-WindowsFeature $addsTools
Get-WindowsFeature | Where installed >>$featureLogPath
#restart the computer
Restart-Computer 
