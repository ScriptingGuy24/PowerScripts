#Creates a variable for loops.
$LooptyLoop = 1


#Creates a loop which will allow the repeated selection of accounts, unless 'done' is typed, which will cause the script to exit.
while ($LooptyLoop -eq 1){
$UserName = Read-Host -Prompt "Please enter the name of the user that needs to reset their password or enter 'done' to finish telling users to change their passwords at logon "

#Finds the user in Active Directory that corresponds to the user-inserted $UserName variable 
$UserList = Get-ADUser -Filter {Enabled -eq True} -Properties Name,DisplayName,LastLogOnDate | Where-Object {$_.DisplayName -eq "$Username"}

    #Pulls out the distinguished name, stores that in a variable and plugs it into a Set-ADUser command, which will mark the password of that user to be changed at logon.
    foreach ($i in $UserList){
        $DistinguishedName = $i.DistinguishedName 
        Set-ADUser -Identity $DistinguishedName -PasswordNeverExpires $False -ChangePasswordAtLogon $True

        "$UserName's account has been set for them to reset their password at log in" | Out-File -FilePath "C:\Users\Administrator\Desktop\AccountsForPasswordReset.txt" -Append

    }

    #If 'done' ia typed, print out a message, change the condition variable that causes the loop to run infinitely,
    #and re-check the condition, causing it to evaluate to false, which will cause the loop to end.
    if ($UserName -eq 'done'){
        "You are done telling users reset the passwords to their accounts at their next log in"
        $LooptyLoop = 2
    }


}

Get-Date | Out-File -FilePath "C:\Users\Administrator\Desktop\AccountsForPasswordReset.txt" -Append

#For version 2: Find out whose password is about to expire and whose account is about to expire.