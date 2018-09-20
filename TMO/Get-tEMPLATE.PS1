$ProgramName = "Collaboration"
$ProjectName = "Skype"
$ProjectNumber = "22222"


$siteurl = "https://smartworkplace365.sharepoint.com/sites/DemoTMODuvaltex/skype"

$un = "admin@smartworkplace365.onmicrosoft.com"
#$pw = "Faba7245"
#$sp = $pw | ConvertTo-SecureString -AsPlainText -Force
#$plainCred = New-Object system.management.automation.pscredential -ArgumentList $un, $sp

$cred = Get-Credential -UserName  admin@smartworkplace365.onmicrosoft.com

Connect-PnPOnline -Url $siteurl -Credentials $cred

Get-PnPProvisioningTemplate   -Out "ProjectTemplate.xml" -PersistPublishingFiles