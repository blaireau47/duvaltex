#This script uses Install-Module -Name NTFSSecurity

$tenant= Connect-Site -Url https://mytenant-admin.sharepoint.com
$csvFile = "UsersPersonalDrive.csv"


$table = Import-Csv $csvFile -Delimiter ";"
foreach ($row in $table)
{
    $e = $row.Email
    Write-Host "Reatieving user $e  onedrive "
    $oneDrive = Get-OneDriveUrl -Tenant $tenant -Email $row.Email -ProvisionIfRequired

    Connect-Site -Url $oneDrive -UseCredentialsFrom $tenant

    $dstList = Get-List -Name Documents -Site $oneDrive
    
    $copySetting = New-CopySetting 

    Import-Document -SourceFolder $row.PersonalDrive -DestinationList $dstList -CopySettings $copySetting

    RemoveWriteAccess $row.Email $row.$row.PersonalDrive

}


function RemoveWriteAccess ($_UserName, $_Path) {

    Get-ChildItem -Path $_Path -Recurse | Get-NTFSAccess -Account $_UserName -ExcludeInherited |Remove-NTFSAccess
    Get-ChildItem -Path $_Path -Recurse | Add-NTFSAccess NTFSAccess -Account $_UserName  -AccessRights Read

    
    
}