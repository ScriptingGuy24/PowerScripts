#Creates OU with user input
$Unit = Read-Host -Prompt "Please entter the name of the new organizational unit "
New-ADOrganizationalUnit -Name $Unit -DisplayName $Unit -Verbose -PassThru -Path "dc=adatum,dc=com" -PassThru -ProtectedFromAccidentalDeletion $True

#Creates file with account information to be stored with user input
$NameOfFile = Read-Host -Prompt "Please enter the name of the file you want the account info to be stored in "
"FirstName,LastName,Department,DefaultPassword,Company`n" | Out-File -FilePath "C:\Users\Administrator\Desktop\$NameOfFile.txt" -Append

#Stores the CSVFile in a variable 
$CSVFile = "C:\Users\Administrator\Desktop\$NameOfFile.txt"

#Stores the OU in a variable
$OU = "ou=$Unit,dc=adatum,dc=com"

#Sets a condition variable to be 1
$Condition = 1

<#Creates a while loop wherein the condition is 1 and will prompt the user for input, store the input in variables, and use the
variables to create a new user account, unless "quit" is typed, which will make the condition false and end the loop
#>
While ($Condition -eq 1){

$FirstName = Read-Host - Prompt "`nPlease enter the first name of the employee "
 if ($FirstName -eq "Quit"){
            "You are done adding accounts."
            $Condition = 0
            break
    } else {
        "Proceeding..."
    }


$LastName = Read-Host -Prompt "`nPlease enter $FirstName's last name "
if ($LastName -eq "Quit"){
            "You are done adding accounts."
            $Condition = 0
            break
    } else {
        "Proceeding..."
    }

    $SecurePass = ConvertTo-SecureString "Pa&&w0rd" -AsPlainText -Force

$DisplayName = $FirstName + " " + $LastName
$Department = Read-Host -Prompt "`nPlease enter $DisplayName's department "
if ($Department -eq "Quit"){
            "You are done adding accounts."
            $Condition = 0
            break
    } else {
        "Proceeding..."
    }
$Company = Read-Host -Prompt "`nPlease enter $DisplayName's company "
if ($Company -eq "Quit"){
            "You are done adding accounts."
            $Condition = 0
            break
    } else {
        "Proceeding..."
    }

"Creating account for $DisplayName"
    

"$FirstName,$LastName,$Department,$SecurePass,$Company`n" | Out-File -FilePath $CSVFile

New-ADUser -Name $DisplayName -DisplayName $DisplayName -GivenName $FirstName `
    -Surname $LastName -Department $Department -Path $OU -Company $Company `
    -AccountPassword $SecurePass -Enabled $true -PassThru

}

#Adds the date to the end of the file, so that documentation of when the accounts were created can be created
Get-Date | Out-File -FilePath $CSVFile 
