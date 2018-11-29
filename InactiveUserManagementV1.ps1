$EnabledUsersOlderThan300Days = Get-ADUser -Filter {Enabled -eq $True } -Properties Name,DisplayName,LastLogOnDate `
| where-object {($_.LastLogOnDate -lt (Get-Date).AddDays(-30)) -and ($_.LastLogOnDAte -ne 0)}

foreach ($i in $EnabledUsersOlderThan300Days){
$DistinguishedName = $i.DistinguishedName 
$DisplayName = $i.Name

if ($DistinguishedName -match $DisplayName) {
Set-ADUser -Identity $DistinguishedName -Enabled $False
Move-ADObject -Identity $DistinguishedName -TargetPath "OU=Disabled,dc=adatum,dc=com"

"$DisplayName's account was disabled today`n" | Out-File -FilePath "C:\Users\Administrator\Desktop\DisabledUsers.txt" -Append

} else {

"$DisplayName's DisplayName did not match the DistinguishedName`n"

}

}

Get-Date | Out-File -FilePath "C:\Users\Administrator\Desktop\DisabledUsers.txt" -Append

