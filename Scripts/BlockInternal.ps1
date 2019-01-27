$UserCredential = Get-Credential
$Session = New-PSSession -ConfigurationName Microsoft.Exchange -ConnectionUri https://outlook.office365.com/powershell-liveid/ -Credential $UserCredential -Authentication Basic -AllowRedirection
Import-PSSession $Session

If(Get-TransportRule *Delete*){Remove-TransportRule *Delete*}

Add-Type -AssemblyName Microsoft.VisualBasic
$labelid = [Microsoft.VisualBasic.Interaction]::InputBox('Enter the LabelId for your All Employees Label', 'LabelId')
$labeltext = "MSIP_Label_"+$labelid+"_enabled=true"
New-TransportRule -name "Block Confidential Contoso All Employees" -SentToScope notinorganization -HeaderContainsMessageHeader  "msip_labels" -HeaderContainsWord $labeltext -RejectMessageReasonText “Contoso internal messages cannot be sent to external recipients.”