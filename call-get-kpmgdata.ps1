<#
    calls script file and deletes it at completion.
#>

$Script = ".\get-kpmgdata.ps1"

.$Script

Remove-Item "get-kpmgdata.ps1"