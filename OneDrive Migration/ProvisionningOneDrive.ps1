

$tenant = Connect-Site -Url https://mytenant-admin.sharepoint.com 
$csvFile = "UsersPersonalDrive.csv"
$table = Import-Csv $csvFile -Delimiter ";"
foreach ($row in $table)
{
    $e = $row.Email
    Write-Host "Creating user $e  onedrive "
    $oneDrive = Get-OneDriveUrl -Tenant $tenant -Email $row.Email -ProvisionIfRequired 

    Write-Host "OneDrive : $oneDrive"

    Add-SiteCollectionAdministrator -Site $oneDrive
}