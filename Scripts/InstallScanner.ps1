Add-Type -AssemblyName Microsoft.VisualBasic
$SQL = [Microsoft.VisualBasic.Interaction]::InputBox('Enter the name of your SQL Server or Server\Instance', 'SQL Server', "Scanner01")
Install-AIPScanner -SQLServerInstance $SQL