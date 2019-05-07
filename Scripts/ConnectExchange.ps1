$UserCredential = Get-Credential
$Session = New-PSSession -ConfigurationName Microsoft.Exchange -ConnectionUri https://outlook.office365.com/powershell -Credential $UserCredential -Authentication Basic -AllowRedirection
Import-PSSession $Session