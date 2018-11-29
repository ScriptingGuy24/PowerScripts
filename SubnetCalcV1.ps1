# Subnet Calculator

#Gets user input for an IP address
$EnteredIP = Read-Host -Prompt "Please enter the ip address"

#Gets user input for a subnet mask
$EnteredMask = Read-Host -Prompt "Please enter the mask"

#Stores the input in new variables
$EnteredIP
$a = 1
$EnteredMask

#Creates an array and stores the IP address in binary
$IPStore = $EnteredIP -split '\.' | ForEach-Object {
    [System.Convert]::ToString($_,2).PadLeft(8,'0')

}

#Stores the IP address in a variable, in binary
$bin = $EnteredIP -split '\.' | ForEach-Object {
    [System.Convert]::ToString($_,2).PadLeft(8,'0')
    

}

#Stores the subnet mask in an array in binary
$SubnetMaskStore = $EnteredMask -split '\.' | ForEach-Object {
    [System.Convert]::ToString($_,2).PadLeft(8,'0')
    

}

#Stores the subnet mask in a variable, in binary
$SubnetMask = $EnteredMask -split '\.' | ForEach-Object {
    [System.Convert]::ToString($_,2).PadLeft(8,'0')
   

}

#Prints out the variables holding the inputted IP address and subnet mask and shows them converted into binary
"`nThe address $EnteredIP in binary is `n$bin"

"`nThe subnet mask $EnteredMask in binary is `n$SubnetMask`n"



# The below code section successfully converts the binary numbers stored in the array index
# into strings containing binary numbers, and then converts them to decimal numbers so 
# that the Band operation can be successfully performed and then converts the result back to binary

#The 7 lines below pull the first octet of the IP address and the first octet of the subnet mask from the arrays 
# and perform a BAND operation
$IP1 = $IPStore[0] 

$IPString1 = "$IP1"

$IP1Result = [Convert]::ToInt32($IPString1,2)


$SB1 = $SubnetMaskStore[0]

$SubString1 = "$SB1"

$Sub1Result = [Convert]::ToInt32($SubString1,2)

$Result1 = $IP1Result -band $SuB1Result



# Can use the bellow setup equation to convert the binary strings to numbers and AND them inline, returning a result
# [Convert]::ToInt32($IPString1,2) -band [Convert]::ToInt32($SubString1,2)

#The 7 lines below pull the second octet of the IP address and the second octet of the subnet mask from the arrays 
# and perform a BAND operation

$IP2 = $IPStore[1] 

$IPString2 = "$IP2"

$IP2Result = [Convert]::ToInt32($IPString2,2)

$SB2 = $SubnetMaskStore[1]

$Substring2 = "$SB2"

$Sub2Result = [Convert]::ToInt32($SubString2,2)

$Result2 = $IP2Result -band $Sub2Result




#The 7 lines below pull the third octet of the IP address and the third octet of the subnet mask from the arrays 
# and perform a BAND operation

$IP3 = $IPStore[2] 

$IPString3 = "$IP3"

$IP3Result = [Convert]::ToInt32($IPString3,2)


$SB3 = $SubnetMaskStore[2]

$SubString3 = "$SB3"

$Sub3Result = [Convert]::ToInt32($SubString3,2)

$Result3 = $IP3Result -band $Sub3Result




#The 7 lines below pull the fourth octet of the IP address and the fourth octet of the subnet mask from the arrays 
# and perform a BAND operation

$IP4 = $IPStore[3]

$IPString4 = "$IP4" 

$IP4Result = [Convert]::ToInt32($IPString4,2)


$SB4 = $SubnetMaskStore[3]

$SubString4 = "$SB4"

$Sub4Result = [Convert]::ToInt32($SubString4,2)

$Result4 = $IP4Result -band $Sub4Result

"The network of that IP address is $Result1.$Result2.$Result3.$Result4"










# "The result is: " + $FirstAnd + "." + $SecondAnd + "." + $ThirdAnd + "." + $FourthAnd

