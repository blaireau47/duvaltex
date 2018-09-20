$ProgramName = "Collaboration"
$ProjectName = "Skype"
$ProjectNumber = "22222"


$siteurl = "https://smartworkplace365.sharepoint.com/sites/DemoTMODuvaltex/$ProjectName"

$un = "admin@smartworkplace365.onmicrosoft.com"
#$pw = "Faba7245"
#$sp = $pw | ConvertTo-SecureString -AsPlainText -Force
#$plainCred = New-Object system.management.automation.pscredential -ArgumentList $un, $sp

$cred = Get-Credential -UserName  admin@smartworkplace365.onmicrosoft.com

Connect-PnPOnline -Url $siteUrl -Credentials $cred



Write-Host "Creating project site $ProjectName with number $ProjectNumber under program $ProgramName under site $rootweb"
#New-PnPWeb -Title "$ProjectName" -Url "$ProjectName" -Locale 1033 -Template "STS#3"



#$newProjectWeb = Get-PnPWeb -Identity $ProjectName #$urlNewProjectWeb

Write-Host "Applying configurations to new site $siteurl" 
Apply-PnPProvisioningTemplate -Path "ProjectTemplate.xml" 


$listName = "Management documentations"
Write-Host "Applying default values for columns in list $listName"
Set-PnPDefaultColumnValues -Web $newProjectWeb -List "$listName" -Field "Program" -Value "$ProgramName"
Set-PnPDefaultColumnValues -Web $newProjectWeb -List "$listName" -Field "Project Name" -Value "$ProjectName"
Set-PnPDefaultColumnValues -Web $newProjectWeb -List "$listName" -Field "Project number" -Value "$ProjectNumber"

$listName = "Documents"
Write-Host "Applying default values for columns in list $listName"
Set-PnPDefaultColumnValues -Web $newProjectWeb -List "$listName" -Field "Program" -Value "$ProgramName"
Set-PnPDefaultColumnValues -Web $newProjectWeb -List "$listName" -Field "Project Name" -Value "$ProjectName"
Set-PnPDefaultColumnValues -Web $newProjectWeb -List "$listName" -Field "Project number" -Value "$ProjectNumber"


$listName = "Weekly Updates"
Write-Host "Applying default values for columns in list $listName"
Set-PnPDefaultColumnValues -Web $newProjectWeb -List "$listName" -Field "Program" -Value "$ProgramName"
Set-PnPDefaultColumnValues -Web $newProjectWeb -List "$listName" -Field "Project Name" -Value "$ProjectName"
Set-PnPDefaultColumnValues -Web $newProjectWeb -List "$listName" -Field "Project number" -Value "$ProjectNumber"



$listName = "Gate status"
Write-Host "Applying default values for columns in list $listName"
Set-PnPDefaultColumnValues -Web $newProjectWeb -List "$listName" -Field "Program" -Value "$ProgramName"
Set-PnPDefaultColumnValues -Web $newProjectWeb -List "$listName" -Field "Project Name" -Value "$ProjectName"
Set-PnPDefaultColumnValues -Web $newProjectWeb -List "$listName" -Field "Project number" -Value "$ProjectNumber"


