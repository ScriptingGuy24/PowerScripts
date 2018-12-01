#Gathers the parameters for a new group to be created, with user input

$Name = Read-Host -Prompt "Please enter the name of the group "

$Scrope = Read-Host -PRompt "Please enter the scope of $Name "

$Description = Read-Host -Prompt "Please enter a  description for $Name "

$Category = Read-Host -Prompt "Please enter the group category of $Name "

#Creates a new group with the variables created by the user

New-ADGroup -Name $Name -GroupScope $Scope -Description $Description -DisplayName $Name -GroupCategory $Category `
-PassThru