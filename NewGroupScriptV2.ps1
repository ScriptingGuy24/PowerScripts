$Name = Read-Host -Prompt "Please enter the name of the group "

$Scrope = Read-Host -Prompt "Please enter the scope of $Name "

$Description = Read-Host -Prompt "Please enter a  description for $Name "

$Category = Read-Host -Prompt "Please enter the group category of $Name "

New-ADGroup -Name $Name -GroupScope $Scope -Description $Description -DisplayName $Name -GroupCategory $Category `
-PassThru

$ContinuePrompt = Read-Host -Prompt "Would you like to add a user to the group? "

if ($ContinuePrompt -eq 'yes') {

    while ($MoveInterval -eq 1) {

        $UserName = Read-Host -Prompt "Please enter the name of the user that you would like to move to the group or type 'Done' to finish"

        if ($UserName -eq 'Done') {
            "You are done moving users to $Name"
            $MoverInterval = 0
            continue

        }

        $UserToBeMoved = Get-ADUser Filter * | Where-Object {$_.DistinguishedNAme -match $UserName}

        Add-ADGroupMember -Identity $Name -Members $UserToBeMoved

        continue


    } 


} elseif ($ContinuePRompt -eq 'no') {
"You are done"
quit()
}  