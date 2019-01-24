Connect-AzureAD
New-AzureADApplication -DisplayName AIPOnBehalfOf -ReplyUrls http://localhost
$WebApp = Get-AzureADApplication -Filter "DisplayName eq 'AIPOnBehalfOf'"
New-AzureADServicePrincipal -AppId $WebApp.AppId
$WebAppKey = New-Guid
$Date = Get-Date
New-AzureADApplicationPasswordCredential -ObjectId $WebApp.ObjectID -startDate $Date -endDate $Date.AddYears(1) -Value $WebAppKey.Guid -CustomKeyIdentifier "AIPClient"

$AIPServicePrincipal = Get-AzureADServicePrincipal -All $true | ? {$_.DisplayName -eq 'AIPOnBehalfOf'}
$AIPPermissions = $AIPServicePrincipal | select -expand Oauth2Permissions
$Scope = New-Object -TypeName "Microsoft.Open.AzureAD.Model.ResourceAccess" -ArgumentList $AIPPermissions.Id,"Scope"
$Access = New-Object -TypeName "Microsoft.Open.AzureAD.Model.RequiredResourceAccess"
$Access.ResourceAppId = $WebApp.AppId
$Access.ResourceAccess = $Scope

New-AzureADApplication -DisplayName AIPClient -ReplyURLs http://localhost -RequiredResourceAccess $Access -PublicClient $true
$NativeApp = Get-AzureADApplication -Filter "DisplayName eq 'AIPClient'"
New-AzureADServicePrincipal -AppId $NativeApp.AppId

"Set-AIPAuthentication -WebAppID " + $WebApp.AppId + " -WebAppKey " + $WebAppKey.Guid + " -NativeAppID " + $NativeApp.AppId | Out-File ~\Desktop\Set-AIPAuthentication.txt
Start ~\Desktop\Set-AIPAuthentication.txt