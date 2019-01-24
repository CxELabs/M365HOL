Add-Type -AssemblyName Microsoft.VisualBasic

# Store Tenant FQDN and Short name
$tenantfqdn = [Microsoft.VisualBasic.Interaction]::InputBox('Enter the tenant name provided in the instructions','Tenant Name')
$tenant = $tenantfqdn.Split('.')[0]

# Build Licensing SKUs
$office = $tenant+":ENTERPRISEPREMIUM"
$ems = $tenant+":EMSPREMIUM"

$cred = Get-Credential

# Connect to MSOLService for licensing Operations
Connect-MSOLService -Credential $cred

# Remove existing licenses to ensure enough licenses exist for our users
$LicensedUsers = Get-MsolUser -All  | where {$_.isLicensed -eq $true}
$LicensedUsers | foreach {Set-MsolUserLicense -UserPrincipalName $_.UserPrincipalName -RemoveLicenses $office, $ems} -ErrorAction SilentlyContinue


# Connect to Azure AD using stored credentials to create users
Connect-AzureAD -Credential $cred

# Import Users from local csv file
$users = Import-csv C:\users.csv

foreach ($user in $users){

# Store UPN created from csv and tenant
$upn = $user.username+"@"+$tenantfqdn

# Create password profile preventing automatic password change and storing password from csv
$PasswordProfile = New-Object -TypeName Microsoft.Open.AzureAD.Model.PasswordProfile 
$PasswordProfile.ForceChangePasswordNextLogin = $false 
$PasswordProfile.Password = $user.password

# Create new Azure AD user
New-AzureADUser -AccountEnabled $True -DisplayName $user.displayname -PasswordProfile $PasswordProfile -MailNickName $user.username -UserPrincipalName $upn
}

# MCAS user and group creation
$upn = "mcasAdminUS@"+$tenantfqdn
New-AzureADUser -AccountEnabled $True -DisplayName "MCAS US admin" -PasswordProfile $PasswordProfile -MailNickName "mcasadminUS" -UserPrincipalName $upn
New-AzureADGroup -DisplayName "US employees" -MailNickName "USemployees" -SecurityEnabled $true -MailEnabled $false
$groupId = Get-AzureADGroup -SearchString "usemployees"
$userId = Get-AzureADUser -SearchString "mcasadminus"
Add-AzureADGroupMember -RefObjectId $userId.ObjectId -ObjectId $groupId.ObjectId

Start-Sleep -s 10
foreach ($user in $users){

# Store UPN created from csv and tenant
$upn = $user.username+"@"+$tenantfqdn

# Assign Office and EMS licenses to users
Set-MsolUser -UserPrincipalName $upn -UsageLocation US
Set-MsolUserLicense -UserPrincipalName $upn -AddLicenses $office, $ems -ErrorAction SilentlyContinue
}

# Assign Office and EMS licenses to Admin user
$upn = "admin@"+$tenantfqdn
Set-MsolUser -UserPrincipalName $upn -UsageLocation US
Set-MsolUserLicense -UserPrincipalName $upn -AddLicenses $office, $ems -ErrorAction SilentlyContinue

$upn = "mcasadminus@"+$tenantfqdn
Set-MsolUser -UserPrincipalName $upn -UsageLocation US
Set-MsolUserLicense -UserPrincipalName $upn -AddLicenses $office, $ems -ErrorAction SilentlyContinue
