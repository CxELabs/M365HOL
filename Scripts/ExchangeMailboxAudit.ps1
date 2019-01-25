$UserCredential = Get-Credential
$Session = New-PSSession –ConfigurationName Microsoft.Exchange –ConnectionUri https://outlook.office365.com/powershell-liveid/ -Credential $UserCredential –Authentication Basic -AllowRedirection
Import-PSSession $Session
Get-MailBox -ResultSize Unlimited -Filter {RecipientTypeDetails -eq "UserMailBox"} | Set-MailBox -AuditEnabled $true
Get-MailBox admin | Format-List audit*
Pause