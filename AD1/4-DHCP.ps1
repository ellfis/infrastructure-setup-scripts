#Set up DHCP Server
Install-WindowsFeature -Name 'DHCP' –IncludeManagementTools
Add-DhcpServerV4Scope -Name "CORP Scope" -StartRange 10.0.1.10 -EndRange 10.0.1.100 -SubnetMask 255.255.255.0
Set-DhcpServerV4OptionValue -DnsServer 10.0.1.200 -Router 10.0.1.1
Set-DhcpServerv4Scope -ScopeId 10.0.1.200 -LeaseDuration 1.00:00:00
Restart-service dhcpserver
Add-DhcpServerInDC -DnsName corp-ad1.clearviews.biz -IPAddress 10.0.1.200