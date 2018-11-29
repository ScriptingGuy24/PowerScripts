# Subnet Calculator that finds the subnet that a certain IP Address is on,
# then breaks down how many hosts can be on the network

#Gets user input for an IP address
$EnteredIP = Read-Host -Prompt "Please enter the ip address"

#Gets user input for a subnet mask
$EnteredMask = Read-Host -Prompt "Please enter the mask"

#Stores the input in new variables
$EnteredIP
$a = 1
$EnteredMask

$IPStore = $EnteredIP -split '\.' | ForEach-Object {
    [System.Convert]::ToString($_,2).PadLeft(8,'0')

}

$bin = $EnteredIP -split '\.' | ForEach-Object {
    <#"Octet $a " +#> [System.Convert]::ToString($_,2).PadLeft(8,'0')
    #$a++

}

$SubnetMaskStore = $EnteredMask -split '\.' | ForEach-Object {
    [System.Convert]::ToString($_,2).PadLeft(8,'0')
    

}

$SubnetMask = $EnteredMask -split '\.' | ForEach-Object {
    <#"Octet $a " +#> [System.Convert]::ToString($_,2).PadLeft(8,'0')
    #$a++

}

"`nThe address $EnteredIP in binary is `n$bin"

"`nThe subnet mask $EnteredMask in binary is `n$SubnetMask`n"



# The below code section successfully converts the binary numbers stored in the array index
# into strings containing binary numbers, and then converts them to decimal numbers so 
# that the Band operation can be successfully performed and then converts the result back to binary
$IP1 = $IPStore[0] 

$IPString1 = "$IP1"

$IP1Result = [Convert]::ToInt32($IPString1,2)


$SB1 = $SubnetMaskStore[0]

$SubString1 = "$SB1"

$Sub1Result = [Convert]::ToInt32($SubString1,2)

$Result1 = $IP1Result -band $SuB1Result

$ZeroHolder1 = ([regex]::Matches($SB1, "0" )).count


# Can use the bellow setup equation to convert the binary strings to numbers and AND them inline, returning a result
# [Convert]::ToInt32($IPString1,2) -band [Convert]::ToInt32($SubString1,2)


$IP2 = $IPStore[1] 

$IPString2 = "$IP2"

$IP2Result = [Convert]::ToInt32($IPString2,2)

$SB2 = $SubnetMaskStore[1]

$Substring2 = "$SB2"

$Sub2Result = [Convert]::ToInt32($SubString2,2)

$Result2 = $IP2Result -band $Sub2Result


$ZeroHolder2 = ([regex]::Matches($SB2, "0" )).count




$IP3 = $IPStore[2] 

$IPString3 = "$IP3"

$IP3Result = [Convert]::ToInt32($IPString3,2)


$SB3 = $SubnetMaskStore[2]

$SubString3 = "$SB3"

$Sub3Result = [Convert]::ToInt32($SubString3,2)

$Result3 = $IP3Result -band $Sub3Result

$ZeroHolder3 = ([regex]::Matches($SB3, "0" )).count






$IP4 = $IPStore[3]

$IPString4 = "$IP4" 

$IP4Result = [Convert]::ToInt32($IPString4,2)


$SB4 = $SubnetMaskStore[3]

$SubString4 = "$SB4"

$Sub4Result = [Convert]::ToInt32($SubString4,2)

$Result4 = $IP4Result -band $Sub4Result

$ZeroHolder4 = ([regex]::Matches($SB4, "0" )).count

"The network of that IP address is $Result1.$Result2.$Result3.$Result4"



$ZeroAmount = $ZeroHolder1 + $ZeroHolder2 + $ZeroHolder3 + $ZeroHolder4

$MaskSlashNotation = 32 - $ZeroAmount

"The subnet mask equals /$MaskSlashNotation" 

function HostEquation($ZeroAmount){
    $Answer = [math]::pow( 2, $ZeroAmount) - 2
    return $Answer
}

"The amount of hosts you can have on this network is: `n"

HostEquation($ZeroAmount)








