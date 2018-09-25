$ProgramName = "Henley"
$ProjectName = "Sechoir"
$ProjectNumber = "44444"


$siteUrl = "https://smartworkplace365.sharepoint.com/sites/DemoTMODuvaltex/$ProjectName"

$un = "admin@smartworkplace365.onmicrosoft.com"


$cred = Get-Credential -UserName  admin@smartworkplace365.onmicrosoft.com

Connect-PnPOnline -Url $siteUrl -Credentials $cred



Write-Host "Creating project site $ProjectName with number $ProjectNumber under program $ProgramName under site $rootweb"
#New-PnPWeb -Title "$ProjectName" -Url "$ProjectName" -Locale 1033 -Template "STS#3"



#$newProjectWeb = Get-PnPWeb -Identity $ProjectName #$urlNewProjectWeb

Write-Host "Applying configurations to new site $siteUrl" 
Apply-PnPProvisioningTemplate -Path "ProjectTemplate.xml" 


$listName = "Management documentations"
Write-Host "Applying default values for columns in list $listName"
Set-PnPDefaultColumnValues -List "$listName" -Field "Program" -Value "$ProgramName"
Set-PnPDefaultColumnValues -List "$listName" -Field "Project Name" -Value "$ProjectName"
Set-PnPDefaultColumnValues -List "$listName" -Field "Project number" -Value "$ProjectNumber"

$listName = "Documents"
Write-Host "Applying default values for columns in list $listName"
Set-PnPDefaultColumnValues  -List "$listName" -Field "Program" -Value "$ProgramName"
Set-PnPDefaultColumnValues  -List "$listName" -Field "Project Name" -Value "$ProjectName"
Set-PnPDefaultColumnValues  -List "$listName" -Field "Project number" -Value "$ProjectNumber"





