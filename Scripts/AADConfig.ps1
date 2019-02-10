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

"Removing Existing Licensing. This many take 1-2 minutes."

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

"Creating USer Accounts"

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

Start-Sleep -s 15
foreach ($user in $users){

# Store UPN created from csv and tenant
$upn = $user.username+"@"+$tenantfqdn

"Assigning USer Licenses. This many take 1-2 minutes."

# Assign Office and EMS licenses to users
Set-MsolUser -UserPrincipalName $upn -UsageLocation US
Set-MsolUserLicense -UserPrincipalName $upn -AddLicenses $office, $ems -ErrorAction SilentlyContinue
}

# Assign Office and EMS licenses to Admin user
$upn = "admin@"+$tenantfqdn
Set-MsolUser -UserPrincipalName $upn -UsageLocation US
Set-MsolUserLicense -UserPrincipalName $upn -AddLicenses $office, $ems -ErrorAction SilentlyContinue
