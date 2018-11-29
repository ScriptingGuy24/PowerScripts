#Changes in this version: Added the code to schedule this script to run automatically on Monday, Tuesday, Wednesday, Thursday, Friday at 10:00 AM.

#Selects a list of users who are enabled haven't logged in in 30 days and stores them inside a variable.
$EnabledUsersOlderThan30Days = Get-ADUser -Filter {Enabled -eq $True } -Properties Name,DisplayName,LastLogOnDate |
where-object {($_.LastLogOnDate -lt (Get-Date).AddDays(-30)) -and ($_.LastLogOnDate -ne 0)}

#Selects each DistinguishedName and DisplayName, and stores them each in a variable, from the variable where the
#list of users is stored.
foreach ($i in $EnabledUsersOlderThan30Days){
$DistinguishedName = $i.DistinguishedName 
$DisplayName = $i.Name

    if ($DistinguishedName -match $DisplayName) {

    #If the DisplayName matches the DistinguishedName, set the account of that DistinguishedName to disabled and
    #move the account of that DistinguishedName to the Disabled OU.
    
    Set-ADUser -Identity $DistinguishedName -Enabled $False
    Move-ADObject -Identity $DistinguishedName -TargetPath "ou=Disabled,dc=adatum,dc=com"

    #Adds the DisplayName of the account that was disabled to a file, creating a list.
    "$DisplayName's account was disabled today`n" | Out-File -FilePath "C:\Users\Administrator\Desktop\DisabledUsers.txt" -Append
    } else {

        "The DisplayName didn't match the DistinguishedName (the DisplayName is from a different account than the DistinguishedName)"
    }


}

#Timestamps the list of accounts that have been newly disabled and added to the Disabled OU.
Get-Date | Out-File -FilePath "C:\Users\Administrator\Desktop\DisabledUsers.txt" -Append

#Type this code into the powershell prompt to schedule this script to run:
#$a = New-JobTrigger -Weekly -At "10:00 AM" -DaysOfWeek Monday,Tuesday,Wednesday,Thursday,Friday
#$b = New-ScheduledJobOption -WakeToRun 
#Register-ScheduledJob -Name UserAccountDisabler -FilePath "C:\Users\Administrator\Desktop\UserDisabledAfter30DaysOfInactivity.ps1" -Trigger $a -ScheduledJobOption $b -WhatIf
