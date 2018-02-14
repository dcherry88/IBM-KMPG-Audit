<#
Script to output data for IBM Websphere
#>
Import-Module BitsTransfer

$datetime = Get-Date -Format MM-dd-yyyy-hh-mm
$outputfile = "kpmg audit-" + $env:COMPUTERNAME + "-" + $datetime + ".txt"
$outfilepath = "C:\windows\logs\$outputfile"
$destination = "http://server.com/bitsupload/" + $outputfile

"Computer name: $env:COMPUTERNAME" | Out-File $outfilepath -Force -Append
#run command for dspmq executable
Try{
    dspmq | out-file $outfilepath -Force -Append
}
catch{
}

#run command for dspmq executable
Try{
    dspmqver | out-file $outfilepath -Force -Append
}
catch{
}

#upload the file!
$secpasswd = ConvertTo-SecureString "setpasswordhere" -AsPlainText -Force
$cred = New-Object System.Management.Automation.PSCredential ("server\bitsupload", $secpasswd)
Start-BitsTransfer -Source $outfilepath -Destination $destination -TransferType Upload -Credential $cred -Authentication negotiate