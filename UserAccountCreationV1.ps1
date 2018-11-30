#Creates new organizational unit named NewUnit
New-ADOrganizationalUnit -DisplayName NewUnit -Name NewUnit -PassThru -Verbose -ProtectedFromAccidentalDeletion $true

<#Format in CSV file is as follows:
FirstName,LastName,Department,DefaultPassword
Geoffrey,Stribling,Sales,Pa$$w0rd
#>

"FirstName,LastName,Department,DefaultPassword,Company`n
Geoffrey,Stribling,Sales,Pa&&w0rd,Adatum`n
John,Doe,Sales,Pa&&w0rd,Adatum`n
Jane,Doe,Sales,Pa&&w0rd,Adatum`n" | Out-File -FilePath "C:\Users\Administrator\Desktop\TextFile.csv"

#Path to CSV File goes here 
$csvfile = "C:\Users\Administrator\Desktop\TextFile.csv"

#Path to the OU you want the users added to goes here 
$OU = "ou=NewUnit,dc=adatum,dc=com"

#Pulls the information from the csvfile and stores it as a custom table-like object, 
#where each column is a property of the object
$users = Import-csv $csvfile

#A ForEach loop runs through each row of the table-like object, where each row contains the 
#credentials for a user account, stores those parameters in variables and then plugs them into a
#New-ADuser command and creates the new account, which is stored in the OU created at the top
Foreach ($i in $users) {
    $DisplayName = $i.FirstName + " " + $i.LastName
    $SecurePass = ConvertTo-SecureString $i.DefaultPassword -AsPlainText -Force
    New-ADUser -Name $DisplayName -Given $i.FirstName -surname $i.LastName `
    -DisplayName $DisplayName -Department $i.Department -Path $OU `
    -AccountPassword $SecurePass -Enabled $true -PassThru