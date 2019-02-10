Add-Type -AssemblyName Microsoft.VisualBasic

# Store Tenant FQDN and Short name
$tenantfqdn = [Microsoft.VisualBasic.Interaction]::InputBox('Enter the tenant name provided in the instructions','Tenant Name')
$tenant = $tenantfqdn.Split('.')[0]

# Build Licensing SKUs
$office = $tenant+":ENTERPRISEPREMIUM"
$ems = $tenant+":EMSPREMIUM"

$cred = Get-Credential -Message "Enter Tenant Global Admin Credentials"

# Connect to MSOLService for licensing Operations
Connect-MSOLService -Credential $cred

"Removing Existing Licensing. This may take 1-2 minutes."

# Remove existing licenses to ensure enough licenses exist for our users
$LicensedUsers = Get-MsolUser -All  | Where-Object {$_.isLicensed -eq $true}
foreach($licenseduser in $LicensedUsers) {
$userlicenses = Get-MsolUser -UserPrincipalName $licenseduser.UserPrincipalName
If($userlicenses.licenses.accountskuid -contains $office){
Set-MsolUserLicense -UserPrincipalName $licenseduser.UserPrincipalName -RemoveLicenses $office -ErrorAction SilentlyContinue
} 
If($userlicenses.licenses.accountskuid -contains $ems){
Set-MsolUserLicense -UserPrincipalName $licenseduser.UserPrincipalName -RemoveLicenses $ems -ErrorAction SilentlyContinue
} 
}


# Connect to Azure AD using stored credentials to create users
Connect-AzureAD -Credential $cred

# Import Users from local csv file
$users = Import-csv C:\users.csv

"Creating User Accounts"

foreach ($user in $users){

# Store UPN created from csv and tenant
$upn = $user.username+"@"+$tenantfqdn

# Create password profile preventing automatic password change and storing password from csv
$PasswordProfile = New-Object -TypeName Microsoft.Open.AzureAD.Model.PasswordProfile 
$PasswordProfile.ForceChangePasswordNextLogin = $false 
$PasswordProfile.Password = $user.password

# Create new Azure AD user
$AADUsers = Get-AzureADUser
if($AADUsers.UserPrincipalName -notcontains $upn){
New-AzureADUser -AccountEnabled $True -DisplayName $user.displayname -PasswordProfile $PasswordProfile -MailNickName $user.username -UserPrincipalName $upn}
}

$users | Format-Table username, displayname

"Assigning User Licenses. This may take 1-2 minutes."

Start-Sleep -s 15
foreach ($user in $users){

# Store UPN created from csv and tenant
$upn = $user.username+"@"+$tenantfqdn

# Assign Office and EMS licenses to users
if(Get-MsolUser -UserPrincipalName $upn){
"Assigning Office and EMS licenses to " + $user.displayname
Set-MsolUser -UserPrincipalName $upn -UsageLocation US
Set-MsolUserLicense -UserPrincipalName $upn -AddLicenses $office, $ems -ErrorAction SilentlyContinue
}else{"User " + $user.displayname + "is not yet created. Please rerun c:\scripts\AADConfig.ps1"}
}

# Assign Office and EMS licenses to Admin user
$upn = "admin@"+$tenantfqdn
Set-MsolUser -UserPrincipalName $upn -UsageLocation US
Set-MsolUserLicense -UserPrincipalName $upn -AddLicenses $office, $ems -ErrorAction SilentlyContinue
