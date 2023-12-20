[CmdletBinding()]
param (
    [Parameter(mandatory=$true)] 
    [string]$Directory,    
    
    [Parameter(mandatory=$false)]
    [char]$InternalDrive = "F",
    [string]$ExternalDriveName = "Data-Backup"
)

$ErrorActionPreference = "Stop"
. F:/projects/scripts/Add-Dependency.ps1
Add-Dependency "C:\Program Files\WinMerge" "WinMergeU"

$ExternalDriveLetter = (Get-Volume -FriendlyName $ExternalDriveName).DriveLetter
$dotless = Convert-Path $Directory
$folder = Split-Path $dotless -NoQualifier
WinMergeU "$($InternalDrive):$($folder)" "$($ExternalDriveLetter):$($folder)" /r /fl