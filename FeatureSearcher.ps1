$Continuity = 1

While ($Continuity -eq 1){

$InputtedFeature = Read-Host -Prompt "Please type the DisplayName of the feature you'd like to install or type 'done' to finish "

    if ($InputtedFeature -eq 'done') {
        "You are done looking up and adding features."
        $Continuity -eq 0
        Continue
    }   else    {

        "You have typed a name that is not in a feature name or a role name"
            }

$FeatureList = Get-WindowsFeature | where-object {$_.DisplayName -match "$InputtedFeature"}

$FeatureList

$FeatureName = Read-Host -Prompt "`n`nPlease type the feature name that you'd like to install or hit 'search' to look up more features "

    if ($FeatureName -eq 'search') {
    continue
    }
 
 Install-WindowsFeature $FeatureName -IncludeSubFeatures -IncludeManagementTools -Verbose

 Continue
}
