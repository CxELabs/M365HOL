Add-Type -AssemblyName Microsoft.VisualBasic

$daU = "contoso\AIPScanner"
$daP = "Somepass1" | ConvertTo-SecureString -AsPlainText -Force
$dacred = New-Object System.Management.Automation.PSCredential -ArgumentList $daU, $daP
	
$gacred = get-credential -Message "Enter Global Admin Credentials"
	
Connect-AzureAD -Credential $gacred
	
$SQL = "AdminPC"
	
$ScProfile = [Microsoft.VisualBasic.Interaction]::InputBox('Enter the name of your configured AIP Scanner Profile', 'AIP Scanner Profile', "East US")

"Installing AIP Scanner Service"	
Install-AIPScanner -ServiceUserCredentials $dacred -SqlServerInstance $SQL -Profile $ScProfile
	
$Date = Get-Date -UFormat %m%d%H%M
$DisplayName = "AIPOBO-" + $Date
$CKI = "AIPClient-" + $Date

"Creating Azure AD Applications. This may take 1-2 minutes."	
New-AzureADApplication -DisplayName $DisplayName -ReplyUrls http://localhost
$WebApp = Get-AzureADApplication -Filter "DisplayName eq '$DisplayName'"
New-AzureADServicePrincipal -AppId $WebApp.AppId
$WebAppKey = New-Guid
$Date = Get-Date
New-AzureADApplicationPasswordCredential -ObjectId $WebApp.ObjectID -startDate $Date -endDate $Date.AddYears(1) -Value $WebAppKey.Guid -CustomKeyIdentifier $CKI
	
$AIPServicePrincipal = Get-AzureADServicePrincipal -All $true | Where-Object { $_.DisplayName -eq $DisplayName }
$AIPPermissions = $AIPServicePrincipal | Select-Object -expand Oauth2Permissions
$Scope = New-Object -TypeName "Microsoft.Open.AzureAD.Model.ResourceAccess" -ArgumentList $AIPPermissions.Id, "Scope"
$Access = New-Object -TypeName "Microsoft.Open.AzureAD.Model.RequiredResourceAccess"
$Access.ResourceAppId = $WebApp.AppId
$Access.ResourceAccess = $Scope
	
New-AzureADApplication -DisplayName $CKI -ReplyURLs http://localhost -RequiredResourceAccess $Access -PublicClient $true
$NativeApp = Get-AzureADApplication -Filter "DisplayName eq '$CKI'"
New-AzureADServicePrincipal -AppId $NativeApp.AppId

"Generating Authenitcation Token for AIP Scanner Service"    
Start-Sleep -Seconds 5
"Set-AIPAuthentication -WebAppID " + $WebApp.AppId + " -WebAppKey " + $WebAppKey.Guid + " -NativeAppID " + $NativeApp.AppId | Out-File C:\Scripts\Set-AIPAuthentication.txt
Set-AIPAuthentication -WebAppID $WebApp.AppId -WebAppKey $WebAppKey.Guid -NativeAppID $NativeApp.AppId

"Restarting AIP Scanner Service"
Restart-Service AIPScanner
Start-Sleep -Seconds 15

"Starting initial discovery scan"

Start-AIPScan

While(!(Get-EventLog -LogName 'Azure Information Protection' -InstanceId "911" -ErrorAction SilentlyContinue)){
"Initial Scan in Progress, please wait."
Start-Sleep -Seconds 15}

"Initial Discovery Scan Complete"
Get-EventLog -LogName 'Azure Information Protection' -InstanceId "911" | fl Message