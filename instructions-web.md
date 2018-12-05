# Implementing Microsoft 365 Security Technologies

## INSTRUCTOR LED LAB - M365HOL

### Introduction

This lab is designed to be used as a supplement to Instructor Led Training and has several sections that you will go through over the next few days. Please click the lab below that corresponds to the technology your are working with.  You will have access to this environment for 6 months following the event.

## [Lab Environment Configuration](#lab-environment-configuration)

## [Lab 1: Microsoft 365 Cloud App Security](#microsoft-365-cloud-app-security)

## [Lab 2: Azure Information Protection](#azure-information-protection)

## [Lab 3: Windows Defender Advanced Threat Protection](#windows-defender-advanced-threat-protection)

## [Lab 4: Azure Advanced Threat Protection](#azure-advanced-threat-protection)

## [Lab 5: Azure Security Center](#azure-security-center)

## [Lab 6: Azure Active Directory](#azure-active-directory)

> WARNING: When stopping each section, please ensure that you SAVE the session in between labs rather than END the lab.  If you end the lab, all VM configuration will be reset to initial state and will hinder the experience during future labs.  We have designed this lab to be a good representation of the interoperability between Microsoft 365 Security Technologies so several of the labs will feed information into future labs.


---
# Tips and Tricks
[🔙](#introduction)

There are a few extras throughout this lab that are designed to make your lab experience a smooth and simple process.  Below are some icons you should watch out for that will save you time during each task.

## Interactive Elements

- Each task contains a series of steps required for successful completion of the lab.  To track your progress throughout the lab, check the box to the left of the numbered series.  

	![6mfi1ekm.jpg](https://github.com/kemckinnmsft/M365HOL3001/blob/master/Media/6mfi1ekm.jpg)
- After you check each box, you will see your lab progress at the bottom of the instruction pane.

	![0ggu265u.jpg](https://github.com/kemckinnmsft/M365HOL3001/blob/master/Media/0ggu265u.jpg)
- When you see an instruction for switching computers, click on the **blue link** in the text to have that VM loaded automatically.

	![12i85vgl.jpg](https://github.com/kemckinnmsft/M365HOL3001/blob/master/Media/12i85vgl.jpg)
- Throughout the lab, you will see text with a letter **T** in a square to the left.  This indicates that you can **click on the text** and it will **type it for you** in the VM.  **This will save you lots of time**.

	![cnyu1tdi.jpg](https://github.com/kemckinnmsft/M365HOL3001/blob/master/Media/cnyu1tdi.jpg)

- The last interactive element you will see throughout the lab is the **Open Screenshot** text below many steps.  To reduce clutter, most screenshots have been configured to launch in a popup window.  The only ones left visible are ones that could cause issues if they are missed or if there are multiple elements that are easier to understand with visual representation.

	![n4cqn070.jpg](https://github.com/kemckinnmsft/M365HOL3001/blob/master/Media/n4cqn070.jpg)

## Additional Information

There are also Knowledge Items, Notes, and Hints throughout the lab.

- Knowledge Items are used to provide additional information about a topic related to the task or step.  These are often collapsed to reduce the amount of space they use, but it is recommended that you review these items if you want more information on the subject.

	![8g9nif1j.jpg](https://github.com/kemckinnmsft/M365HOL3001/blob/master/Media/8g9nif1j.jpg)
- Notes are steps that do not require action or modification of any elements.  This includes general observations and reviewing the results of previous steps.

	![kxrbzsr2.jpg](https://github.com/kemckinnmsft/M365HOL3001/blob/master/Media/kxrbzsr2.jpg)
- Hints are recommendations or observations that help with the completion of a step.

	![w11x99oo.jpg](https://github.com/kemckinnmsft/M365HOL3001/blob/master/Media/w11x99oo.jpg)

---
# Lab Environment Configuration
[🔙](#introduction)

There are a few prerequisites that need to be set up to complete all the sections in this lab.  This Exercise will walk you through the items below.

- [Configure Azure AD Connect](#azure-ad-connect-configuration)

- [Redeem Azure Pass](#redeem-azure-pass)

- [Assign User Licenses](#assign-user-licenses)

---
# Azure AD Connect Configuration
[🔙](#lab-environment-configuration)

In this task, we will install Azure AD Connect and configure it using the express settings.

1. Log into Scanner01 by clicking @lab.CtrlAltDelete and using the credentials below:

	**LabUser**

	**Pa$$w0rd**

2.  On the desktop, **double-click** on **AzureADConnect.msi**.
3.  When prompted, click **Run** to continue.
4.  On the Welcome page, **check the box** next to **I agree** and click the **Continue** button.
5.  On the Express Settings page, click **Use express settings**.
6.  On the Connect to Azure AD page, enter the credentials below and press the **Next** button.

	**Global Admin Username**

	**Global Admin Password**

> NOTE: The wizard will connect to the Microsoft Online tenant to verify the credentials.

7.  On the Connect to AD DS page, enter the credentials below then click the **Next** button.

	**Contoso.Azure\LabUser**

	**Pa$$w0rd**
8.  On the Azure AD sign-in page, **check the box** next to **Continue without any verified domains** and click the **Next** button.

> NOTE: Verified domains are primarily for SSO purposes and are not needed for this lab

9.  On the Configure page, click the **Install** button.

> WARNING: **Do not** uncheck the box for initial synchronization

10.  Continue to next task while initial sync is running.
---
# Redeem Azure Pass
[🔙](#lab-environment-configuration)

For several of the exercises in this lab series, you will require an active subscription.  We are providing an Azure Pass for this purpose.  You will be provided with an Azure Pass code to use with the instructions below.

### Creating an Azure Pass subscription is a two step process

- Redeem your Azure Pass Promo Code
- Activate your subscription

##Step 1: Redeeming a Microsoft Azure Pass Promo Code:

1. Log into Client01 by pressing @lab.CtrlAltDelete and using the credentials below:

	**LabUser**

	**Pa$$w0rd**
1. Right-click on **Edge** in the taskbar and click on **New InPrivate window**.

1. In the InPrivate window, navigate to **https://www.microsoftazurepass.com**

1. Click the **Start** button to get started.

	![wdir7lb3.jpg](https://github.com/kemckinnmsft/M365HOL3001/blob/master/Media/wdir7lb3.jpg)
1. Enter the credentials below and select **Sign In**.

	**Global Admin Username**

	**Global Admin Password** 

	![gtg8pvp1.jpg](https://github.com/kemckinnmsft/M365HOL3001/blob/master/Media/gtg8pvp1.jpg)
1. Click **Confirm** if the correct email address is listed.

	![teyx280d.jpg](https://github.com/kemckinnmsft/M365HOL3001/blob/master/Media/teyx280d.jpg)
1. Enter your promo code in the Promo code box using the Type Text functionality of the lab environment and click **Claim Promo Code**.

	![w7cijc7e.jpg](https://github.com/kemckinnmsft/M365HOL3001/blob/master/Media/w7cijc7e.jpg)
	![e1l35ko2.jpg](https://github.com/kemckinnmsft/M365HOL3001/blob/master/Media/e1l35ko2.jpg)
	> NOTE: It may take up to 5 minutes to process the redemption.

1. Click on **Activate** to start setting up your Azure subscription.

	![hsa6yyy7.jpg](https://github.com/kemckinnmsft/M365HOL3001/blob/master/Media/hsa6yyy7.jpg)

## Step 2: Activate your subscription:

1. Enter your account information and click **Next**.

	![ihrjazqi.jpg](https://github.com/kemckinnmsft/M365HOL3001/blob/master/Media/ihrjazqi.jpg)
	> NOTE: You can keep the pre-populated information.

1. Check the box to agree to the terms and click **Sign up**.

	![k2a97g8e.jpg](https://github.com/kemckinnmsft/M365HOL3001/blob/master/Media/k2a97g8e.jpg)
	> NOTE: It may take a few minutes to process the request.

1. When you are redirected to the Azure Portal, the process is complete.
---
# Assign User Licenses
[🔙](#lab-environment-configuration)

In this task, we will assign licenses to users that have been synced to the Office 365 portal.

1. In the InPrivate window, navigate to **https://admin.microsoft.com/AdminPortal/Home#/homepage**.

	>INFO: If needed, log in using the credentials below:
	>
	>**Global Admin Username**
	>
	>**Global Admin Password**

1. In the middle of the homepage, click onn **Active users >**.
1. Check the box to select all users and click **Edit product licenses**.

	![tpq0eb7f.jpg](https://github.com/kemckinnmsft/M365HOL3001/blob/master/Media/tpq0eb7f.jpg)
1. On the Assign products page, click **Next**.

	![nzzweacz.jpg](https://github.com/kemckinnmsft/M365HOL3001/blob/master/Media/nzzweacz.jpg)
1. On the Replace existing products page, turn on licenses for **Enterprise Mobility + Security E5** and **Office 365 Enterprise E5** and click **Replace**.

	IMAGE[Open Screenshot](https://github.com/kemckinnmsft/M365HOL3001/blob/master/Media/9xomkr35.jpg)
	> NOTE: If there are any failures, repeat the process for users that did not get licenses.

---
# Microsoft 365 Cloud App Security
[🔙](#introduction)

This lab will guide you through some of the Microsoft Cloud App Security
(MCAS) capabilities.

We expect you to already have experience with MCAS deployment and
configuration. In the different sections, you will be asked to fulfill
some tasks for which you will receive the requirements but not a step by
step guide to accomplish this task. A lab answer key document can be
provided to those needing it.

Most treat detections capabilities rely on auditing being enabled in your environment.By default, auditing is not enabled in Office 365 and must be turned on using the **Security & Compliance** admin console. In addition, some applications like Exchange Online require extra configuration, like enabling auditing per mailbox ([https://docs.microsoft.com/en-us/office365/securitycompliance/enable-mailbox-auditing?redirectSourcePath=%252fen-us%252farticle%252fenable-mailbox-auditing-in-office-365-aaca8987-5b62-458b-9882-c28476a66918](https://docs.microsoft.com/en-us/office365/securitycompliance/enable-mailbox-auditing?redirectSourcePath=%252fen-us%252farticle%252fenable-mailbox-auditing-in-office-365-aaca8987-5b62-458b-9882-c28476a66918)).

As this operation can take up to 24h, your instructor will provide you access to another environment to review the alerts.

![Security & Compliance Center](urzgmx9v.jpg)

![Enable Auditing](https://github.com/kemckinnmsft/M365HOL3001/blob/master/Media/uku8txme.jpg)

The main sections covered in this Lab are:

- [Cloud Discovery](#cloud-discovery)
- [Threat Detection](#threat-detection)
- [Conditional Access App Control](#conditional-access-app-control)
- [Management](#management)
- [Information Protection](#information-protection)
---
# Connect MCAS to Office 365 
[🔙](#microsoft-365-cloud-app-security)

1. On Client01, open a new tab and go to **https://portal.cloudappsecurity.com**
1. Go to the gear icon and select **App connectors** 

	![GetImage.png](https://github.com/kemckinnmsft/M365HOL3001/blob/master/Media/GetImage.png)
 
1. Click on the **+** button and select Office 365 
 
	![45gka6qw.jpg](https://github.com/kemckinnmsft/M365HOL3001/blob/master/Media/45gka6qw.jpg)
1. Click on **Connect Office 365**
 
	![x58w8p6v.jpg](https://github.com/kemckinnmsft/M365HOL3001/blob/master/Media/x58w8p6v.jpg)
1. Click on **Test now** to validate the configuration 
 
	![a4c31yrk.jpg](https://github.com/kemckinnmsft/M365HOL3001/blob/master/Media/a4c31yrk.jpg)
 
---
# Cloud Discovery
[🔙](#microsoft-365-cloud-app-security)

### Estimated time to complete
30 min

Continuous reports in Cloud Discovery analyze all logs that are
forwarded from your network using Cloud App Security. They provide
improved visibility over all data, and automatically identify anomalous
use using either the Machine Learning anomaly detection engine or by
using custom policies that you define.
To use this capability, you will perform in this lab the configuration
and troubleshooting of the Cloud Discovery feature.

> NOTE: The Docker engine has been pre-installed on LinuxVM using the commands at [https://docs.microsoft.com/en-us/cloud-app-security/discovery-docker-ubuntu](https://docs.microsoft.com/en-us/cloud-app-security/discovery-docker-ubuntu)
---
## Configure and test continuous reports
[🔙](#microsoft-365-cloud-app-security)

1. Switch to Client01.

1. Create a new tab in the InPrivate window and browse to **https://portal.cloudappsecurity.com**.

	>INFO: If necessary, log in using the credentials below:
	>
	>**Global Admin Username**
	>
	>**Global Admin Password**

1. In the Cloud App Security dashboard, click on the **Settings** icon and click **Log collectors**.

	![t9beih5z.jpg](https://github.com/kemckinnmsft/M365HOL3001/blob/master/Media/t9beih5z.jpg)
1. On the **Data sources tab**, click the **Add data source...** button.

	![f1k3bw4e.jpg](https://github.com/kemckinnmsft/M365HOL3001/blob/master/Media/f1k3bw4e.jpg)
1. In the Add data source window, use the settings below:

	>|||
	>|---------|---------|
	>|Name| **Logs**|
    >|Source| **SQUID (Common)**|
	>|Receiver type| **FTP**|
	>|Anonymize private information |**Check the box**|
	>
	>![zby8rfbk.jpg](https://github.com/kemckinnmsft/M365HOL3001/blob/master/Media/zby8rfbk.jpg)

1. While still in the Add data source dialog, click **View sample of expected log file**.

	![2ksenw0c.jpg](https://github.com/kemckinnmsft/M365HOL3001/blob/master/Media/2ksenw0c.jpg)
1. In the Verify your log format dialog, click **Download sample log** and save to your desktop.

	![qdkjwbbr.jpg](https://github.com/kemckinnmsft/M365HOL3001/blob/master/Media/qdkjwbbr.jpg)
1. Minimize the browser and extract the sample log to your desktop.
1. Return to the browser and close the Verify your log format window, then click **Add** in the Add data source dialog.

	![380ig1wx.jpg](https://github.com/kemckinnmsft/M365HOL3001/blob/master/Media/380ig1wx.jpg)
1. Next, click on the **Log collectors tab** and click the **Add log collector...** button.

	![vq2ll67m.jpg](https://github.com/kemckinnmsft/M365HOL3001/blob/master/Media/vq2ll67m.jpg)
1. In the Create log collector dialog, provide the settings below and click the **Update** button.

	|||
	|-----|-----|
	|Name|**LogCollector**
	|Host IP address|**192.168.141.125**
	|Data source(s)|**Logs**

	![aw3yista.jpg](https://github.com/kemckinnmsft/M365HOL3001/blob/master/Media/aw3yista.jpg)
	![v829uq5m.jpg](https://github.com/kemckinnmsft/M365HOL3001/blob/master/Media/v829uq5m.jpg)
	
	> WARNING: Do not dismiss this window!
1. **Minimize** the browser and double-click **Putty (64-bit)** on the desktop.

1. In the PuTTY Configuration window, enter **192.168.141.125** and click **Open**.

	![b0gca8dw.jpg](https://github.com/kemckinnmsft/M365HOL3001/blob/master/Media/b0gca8dw.jpg)
1. Log in using the credentials below.

	**user01**

	**Passw0rd1**

1. Type the command below and press **Enter**.

	```
	sudo -i
	```
1. Next, return to the Create log collector dialog and copy the **collector configuration** comannd from step 2 and run it in the PuTTY window.

	![1j76v7e0.jpg](https://github.com/kemckinnmsft/M365HOL3001/blob/master/Media/1j76v7e0.jpg)
1. Next, launch **WinSCP** from the start-menu.

	![i5bmeqmb.jpg](https://github.com/kemckinnmsft/M365HOL3001/blob/master/Media/i5bmeqmb.jpg)
1. Enter the details below in the WinSCP window:
	|||
	|-----|-----|
	|File Protocol|**FTP**|
	|Host name|**192.168.141.125**|
	|User name|**discovery**|
	|Password|**BP98Jw4Ns*zpTFrH**|

1. Switch to the **Desktop** folder on the left side and double-click on the folder named for your data source (**Logs**).

	![31q5d1ul.jpg](https://github.com/kemckinnmsft/M365HOL3001/blob/master/Media/31q5d1ul.jpg)
1. Select the squid-common demo log and click **Upload**.

	![4hpamv4b.jpg](https://github.com/kemckinnmsft/M365HOL3001/blob/master/Media/4hpamv4b.jpg)
1. In the Upload dialog, click **OK**.

	![xeaix0r8.jpg](https://github.com/kemckinnmsft/M365HOL3001/blob/master/Media/xeaix0r8.jpg)

1. After uploading your logs, return to the MCAS protal and click on **Settings** > **Governance log**. 

	![fruhkk70.jpg](https://github.com/kemckinnmsft/M365HOL3001/blob/master/Media/fruhkk70.jpg)
	
1. You may also verify the **last data received** status on the Data sources tab under **Automatic log upload**.

	![l347jas1.jpg](https://github.com/kemckinnmsft/M365HOL3001/blob/master/Media/l347jas1.jpg)

	> NOTE:  After validating that your logs have been successfully uploaded and
    processed by MCAS, you will not see directly the analysis of your
    data. Why? (hint: verify the "Set up Cloud Discovery" documentation
    page).

---
## How to troubleshoot the Docker log collector
[🔙](#microsoft-365-cloud-app-security)

In this task, you will review possible troubleshooting steps to identify
issues in automatic logs upload from the log collector.

There are several things to test at different locations: in the log
collector, in MCAS, at the network level.

### Useful commands
	
- To navigate in the directories, use the "cd" command.
	Examples: 

	**cd /var/adallom** to go to the specified directory

	**cd /** to go to the root directory

	**cd ..** to go to the parent directory
	
- To display the content of the logs, use the **more file_name** command
- To display the content of the directory, use the **ll** command
- To clear the screen, use the **clear** command

- For saving typing, use the **Tab** key and perform autocompletion.

### Verify the log collector (container) status

1. On Client01, open a session on PuTTY to **192.168.141.125** and use the credentials below.

	**user01**

	**Passw0rd1**

1. Run the following commands:

	```
	sudo -i
	```
	```
	docker stats
	```
	This command will show you the status of the log collector instance:

	![CONTAINER ID 2d7cadgfS4a1 13.14\* CPU 1.22\* MEM USAGE / LIMIT 187
	.1MiB / 1.39GiB NET I/o 10.gMB / 3 .23MB](vl5158cy.jpg)
1. Press **Ctrl-C** to end the command. 
1. Next, run the command below:

	```
	docker logs --details LogCollector
	```

	This command will show you the logs from the log collector to verify if
	it encountered errors when initiating:



	![rootaubuntu-srt: \'hame,\'seb 5 \--dzt.ei15 Setting ftp configuration
	Enter again: Setting syslog Reading configuration.. . Installing
	collector successfully! zenzitive Starting 2018-06-28 2018-06-28
	2018-06-28 2010-06-28 2018-06-28 08 2018-06-28 2018-06-28 seo 2018-06-28
	53B 2018-06-28 €67 2018-06-28 2018-06-28 667 08:28: is, CRIT WARN I NEO
	CR IT I NEO 1 NEO INFO I NEO INSO I NEO INFO I NEO INFO as uzez in file)
	during parsing RBC interface \' supervisor • initialized http without
	HTTP checking Started With pid 1059 spawned: spawned : success : • with
	1062 •rsyslog• with pid 1063 with pid 2064 • Columbus\' with 1065
	rsyslog RUNNING stace, ftpd entered RUNNING state, pza RUNNING scat\* ,
	Stayed up for](4bfomeag.jpg)

	 

#### To go further in the troubleshooting, you can connect to the log collector container to investigates the different logs.

1. Type the following command:

	```
	docker exec -it LogCollector bash
	```

1. You can then explore the container filesystem and inspect the
	**/var/adallom** directory. This directory is where you will investigate
	issues with the syslog or ftp logs being sent to the collector

	![ovjlyn26.jpg](https://github.com/kemckinnmsft/M365HOL3001/blob/master/Media/ovjlyn26.jpg)

-   **/adallom/ftp/discovery**: this folder contains the data source
    folders where you send the log files for automated upload. This is
    also the default folder when logging into the collector with FTP
    credentials.

-   **/adallom/syslog/discovery**: if you setup the log collector to
    receive syslog messages, this is where the flat file of aggregated
    messages will reside until it is uploaded.

-   **/adallom/discoverylogsbackup**: this folder contains the last file
    that was sent to MCAS. This is useful for looking at the raw log in
    case there are parsing issues.

1. To validate that logs are correctly received from the network appliance,
you can also verify the **/var/log/pure-ftpd** directory and check the
transfer log:

	![erx39v7i.jpg](https://github.com/kemckinnmsft/M365HOL3001/blob/master/Media/erx39v7i.jpg)

1. Now, move to the **/var/log/adallom** directory.

	![0h029uih.jpg](https://github.com/kemckinnmsft/M365HOL3001/blob/master/Media/0h029uih.jpg)

-   **/var/log/adallom/columbus**: this folder is where you will find
    log files useful for troubleshooting issues with the collector
    sending files. In the log-archive folder you can copy previous logs
    compressed as .tar.gz files off the collector to send to support.

-   **/var/log/adallom/columbusInstaller**: this is where you will
    investigate issues with the collector itself. You will find here
    logs related to the configuration and bootstrapping of the
    collector. For example, trace.log will show you the bootstrapping
    process:

    ![ks4ttuuq.jpg](https://github.com/kemckinnmsft/M365HOL3001/blob/master/Media/ks4ttuuq.jpg)

 


### Verify the connectivity between the log collector and MCAS

An easy way to test this is to download a sample of your appliance logs
from MCAS and use WinSCP to connect to the log collector to upload that
log and see if it gets uploaded to MCAS.

 

1. Upload the logs in the folder named by your source:

![bqhxmpns.jpg](https://github.com/kemckinnmsft/M365HOL3001/blob/master/Media/bqhxmpns.jpg)

 

1. Then, check in MCAS the status:

	![21pseval.jpg](https://github.com/kemckinnmsft/M365HOL3001/blob/master/Media/21pseval.jpg)

 

	![mt0o095m.jpg](https://github.com/kemckinnmsft/M365HOL3001/blob/master/Media/mt0o095m.jpg)

 

	> NOTE: If the log stays in the source folder, then you know you probably have a
connection issue between the log collector and MCAS.

Another way to validate the connection is to log into the container like
in the previous task and then run *netstat -a* to check if we see
connections to MCAS:

1. In the PuTTY window, type the command below:

	```
	netstat -a
	```
	![rxvauw6e.jpg](https://github.com/kemckinnmsft/M365HOL3001/blob/master/Media/rxvauw6e.jpg)
---
# Threat Detection
[🔙](#microsoft-365-cloud-app-security)

### Estimated time to complete
20 min

Cloud App Security provides several [threats detection
policies](https://docs.microsoft.com/en-us/cloud-app-security/anomaly-detection-policy)
using machine learning and **user behavior analytics** to detect
suspicious activities across your different applications. After an
initial learning period, Cloud App Security will start alerting you when
suspicious actions like activity from anonymous IP addresses, infrequent
country, suspicious IP addresses, impossible travel, ransomware
activity, suspicious inbox forwarding configuration or unusual file
download are detected.

In addition to those policies, you can create your own policies, like
the ones on the next page, that you must create for this lab.
---
## Policies
[🔙](#microsoft-365-cloud-app-security)

### Exchange Online -- monitor mail forwarding configuration

This policy allows you to monitor admin and users mail forwarding
configuration. This policy is covering extra scenarios than the built-in
one.

**Activities to monitor:**

  |App               |Activity category              |Activity
  |----------------- |------------------------------ |---------------
  |Exchange Online   |Create forwarding inbox rule   |New-InboxRule
  |Exchange Online   |Edit mailbox forwarding        |Set-Mailbox
  |Exchange Online   |Edit forwarding inbox rule     |Set-InboxRule

As creating this kind of rules is part of the daily operations in a
company, we could recommend scoping the monitoring to **sensitive
groups** of users to monitor but this is not required for this lab.

![deg5ncg3.jpg](https://github.com/kemckinnmsft/M365HOL3001/blob/master/Media/deg5ncg3.jpg)

### Exchange Online - add user to Exchange administrator role

This policy monitors when a user is added to an Exchange management role
group.

Although this action is usually legit, providing visibility on it is
usually required by security teams.

**Activities to monitor:**
  |App               |Activity category             |Activity
  |----------------- |---- 							|---------------------
  |Exchange Online   |N/A   						|Add-RoleGroupMember

Optionally, you could add as a condition "if IP address category is not
in Corporate".

![ao3du4ms.jpg](https://github.com/kemckinnmsft/M365HOL3001/blob/master/Media/ao3du4ms.jpg)

### Exchange Online - Add management role assignment

This rule monitors possible management role assignments to a management
group.

For example, when someone is adding impersonation capabilities to a
group used to migrate mailboxes to Office 365.

Details about Exchange permissions and roles can be found [at this
address](https://docs.microsoft.com/en-us/exchange/permissions-exo/permissions-exo).

**Activities to monitor:**
  |App               |Activity category                   |Activity
  |----------------- |----------------------------------- |---------------------
  |Exchange Online   |Add impersonation role assignment   |New-ManagementRoleAssignment

![rilw99v2.jpg](https://github.com/kemckinnmsft/M365HOL3001/blob/master/Media/rilw99v2.jpg)

### Exchange Online - New delegated access to sensitive mailbox

This policy monitors when a delegate is added to sensitive mailboxes,
like your CEO or HR team mailboxes or sensitive shared mailboxes.

We monitor two kinds of delegation: at the mailbox level, when an admin
performs the action, and at the client level, when delegation for
folders are added.

**Note**: Exchange logs can take some time before being available,
leading to some delay before the detection.

**Activities to monitor:**

We recommend scoping this policy to specific users only, to avoid too
many alerts, but this is not required for this lab.

  |App               |Activity category                   |Activity
  |----------------- |----------------------------------- |---------------------
  |Exchange Online   |Add mailbox folder permission   	  |Add-MailboxFolderPermission
  |Exchange Online   |Add permission to mailbox       	  |Add-MailboxPermission

![6kcy2xki.jpg](https://github.com/kemckinnmsft/M365HOL3001/blob/master/Media/6kcy2xki.jpg)

### OneDrive -- Ownership granted to another user

This policy helps you to detect when someone is granted full access to
somebody OneDrive for Business site.

**Activities to monitor:**

  |App               |Activity category                   |Activity
  |----------------- |----------------------------------- |---------------------
  |OneDrive   		 |Add site collection administrator   |SiteCollectionAdminAdded

![rb4fqb83.jpg](https://github.com/kemckinnmsft/M365HOL3001/blob/master/Media/rb4fqb83.jpg)

### 3rd party apps delegations

This policy helps you to detect new external apps for which users are
granting access to the select app (Office 365, G Suite, ...).

Detecting those delegations will help in the case of cloud ransomware,
or possible data exfiltration.

**Activities to monitor:**

We will monitor when an uncommon app is granted medium or high
permission level:

![mszki5q9.jpg](https://github.com/kemckinnmsft/M365HOL3001/blob/master/Media/mszki5q9.jpg)

### Investigation in MCAS

Now that we have created those policies, we are going to investigate on
the alerts.

As your environments auditing might not be configured yet and will take
up to 24h before being enabled, those investigations will be performed
in the environment provided by your instructor.

Review the alerts in the environment and investigate to identify the
users and the malicious activities performed.

---
# Conditional Access App Control
[🔙](#microsoft-365-cloud-app-security)

### Estimated time to complete
40 min

Please go through all the steps exactly as described to avoid
complications.

### Configure Salesforce

1.  Create a Salesforce developer account

    1.  On Client01, launch a browser and go to the URL below. 
	
		**https://developer.salesforce.com/signup**

    2.   **Important:** Use your admin user as the Email
        and Username

        **Global Admin Username**

    3.   Fill in the rest of details, click Sign me up, accept the
        verification email, and choose a new password.

1.   Configure Salesforce in Azure AD
    
    1.  In Salesforce, go to **Setup**, search for **My Domain** and
        register a new domain, e.g., ems123456-dev-ed.salesforce.com

        ![f7idpipy.jpg](https://github.com/kemckinnmsft/M365HOL3001/blob/master/Media/f7idpipy.jpg)

    1.  Save **full Salesforce domain name**, including **https://** for the
        next step, e.g., <https://ems123456-dev-ed.salesforce.com>

    1.   Go to **https://portal.azure.com** logging in with the credentials below:

		**Global Admin Username**

		**Global Admin Password**
	
	1.   Go to **Azure Active
        Directory**, click on **Enterprise applications**, choose **+
        New application**, select All, choose **Salesforce**, call it
        **SalesforceCAS**, and click on **Add**

    1.   Go back to **Enterprise applications**, choose **All
        applications**, and click on **SalesforceCAS**, click on
        **Single sign-on**, and choose **SAML-based Sign-on** under
        **Single Sign-on Mode**

    1.   For both **Sign on URL** and **Identifier** set the full
        Salesforce domain name, e.g.,
        <https://ems123456-dev-ed.salesforce.com>

    1.   Under SAML Signing Certificate, make sure that there is a
        certificate present and that the **STATUS** is **Active**

        1. If there is no certificate, click on the **Create new
            certificate** link

        1. If the **STATUS** is **New**, select the **Make new
            certificate active** checkbox. When you click on **Save**,
            you will get a **Rollover certificate** confirmation. Once
            certificate rollover is approved, the certificate STATUS
            will become **Active**.

    1.   Click on **Save**

    1.  Click on **Configure Salesforce** which will open a new blade

    1.   Scroll down to the **Quick Reference** section

        1. **Download the Azure AD Signing Certificate**

        1.  Copy all the other fields in the Quick Reference section for
            the next step in Salesforce

    1.   Go back to Salesforce, under **Setup** go to **Single Sign-On
        Settings**
        ![ao0yrpx8.jpg](https://github.com/kemckinnmsft/M365HOL3001/blob/master/Media/ao0yrpx8.jpg)

    1.   Click on **Edit**, Select **SAML Enabled**, and click on
        **Save**

    1.   In the same **Single Sign-On Settings** page, click on **New**

    1.  Fill in the following fields:

        1. **Name**: write "Azure AD"

        1. **Issuer**: Copy and paste the **Azure AD SAML Entity ID**
            from the Azure AD **Quick Reference** section

        1. **Entity ID**: The full Salesforce domain, e.g.,
            <https://ems123456-dev-ed.salesforce.com>

        1. **Identity Provider Certificate**: upload the certificate
            you've downloaded from Azure AD (**Download Azure AD Signing
            Certificate**)

        1.  **Identity Provider Login URL**: Copy and paste the **Azure
            AD Single Sign-On Service URL** from the Azure AD **Quick
            Reference** section

        1. **Custom Logout URL**: Copy and paste the **Azure AD Sign
            Out URL** from the Azure AD **Quick Reference** section

    1.  Click **Save**

    1.  Go back to **My Domain** in Salesforce

    1.  Under **Authentication Configuration** click Edit, (click
        **Open** if needed), and:

        1. Uncheck the **Login Page** checkbox

        1. Check the **Azure AD** checkbox

        1. Click on **Save**

    1.  Go back to the Azure AD portal, within the **SalesforceCAS**
        app, choose **Users and groups**
        
		![kscnoob4.jpg](https://github.com/kemckinnmsft/M365HOL3001/blob/master/Media/kscnoob4.jpg)

    1.  Click on **+ Add user**, choose the admin as the user (e.g.,
        <admin@ems123456.onmicrosoft.com>), choose **System
        Administrator** as the Role, and click on **Assign**

    1.   Test the setup by going to <https://myapps.microsoft.com>,
        logging in with the credentials below:

		**Global Admin Username**

		**Global Admin Password**
	
		Click on the
        **SalesforceCAS**, verifying that this will result in a
        successful login to Salesforce.

1.   Deploy the proxy for Salesforce

    1. In Azure Active Directory, under **Security**, click
        on **Conditional access**.
        ![b62lha77.jpg](https://github.com/kemckinnmsft/M365HOL3001/blob/master/Media/b62lha77.jpg)

    1.   Click on **New policy** and create a new policy:

        1. Name the policy: Test Cloud App Security proxy

        1. Choose the admin as the user (e.g.,
            <admin@ems123456.onmicrosoft.com>)

        1. Choose SalesforceCAS as the app

        1.  Under **Session** you select **Use proxy enforced
            restrictions**.

        1. Set **Enable policy** to be **On**

        1. Click on **Create**

        1. It should look like this:
            ![qti7w9u6.jpg](https://github.com/kemckinnmsft/M365HOL3001/blob/master/Media/qti7w9u6.jpg)

    1.   After the policy was created successfully, open a new browser,
        ***make sure you are logged out***, and log in to
        SalesforceCAS with the admin user

        1. You can go to **https://myapps.microsoft.com** and click on
            the SalesforceCAS tile

        1.  Make sure you've successfully logged on to Salesforce

    1.   Go to the Cloud App Security portal, and under the settings cog
        choose **Conditional Access App Control
        ![dfmwyegm.jpg](https://github.com/kemckinnmsft/M365HOL3001/blob/master/Media/dfmwyegm.jpg)

    1.   You should see a message letting you know that new Azure AD apps
        were discovered. Click on the **View new apps** link.
        ![qz9mx11x.jpg](https://github.com/kemckinnmsft/M365HOL3001/blob/master/Media/qz9mx11x.jpg)

        1. If the message does not appear, go back to step c. (After
            the policy was created...) this time, close the browser and
            open a new browser in Incognito mode.

    1.   In the dialog that opens, you should see Salesforce. Click on
        the + sign, and then click **Add**.
        ![iy3f8gro.jpg](https://github.com/kemckinnmsft/M365HOL3001/blob/master/Media/iy3f8gro.jpg)

### Configure device authentication

1.  Go to the settings cog and choose **Device identification**.

2.   Upload the CASTestCA.crt certificate from the Client Certificate
     folder within the **E:\Demofiles.zip** file you've received as the
     certificate authority root certificate

	![rlkp1xvp.jpg](https://github.com/kemckinnmsft/M365HOL3001/blob/master/Media/rlkp1xvp.jpg)
### Create a session policy

1.  In the Cloud App Security portal, select **Control** followed
     by **Policies**.

2.   In the **Policies** page, click **Create policy** and
     select **Session policy**.

     ![6lh61nkl.jpg](https://github.com/kemckinnmsft/M365HOL3001/blob/master/Media/6lh61nkl.jpg)

3.   In the **Session policy** window, assign a name for your policy,
     such as *Block download of sensitive documents to unmanaged
     devices.*
     ![a6i9js1x.jpg](https://github.com/kemckinnmsft/M365HOL3001/blob/master/Media/a6i9js1x.jpg)

4.   In the **Session control type** field Select **Control file download
     (with DLP)** 
	 ![j9pxy1lm.jpg](https://github.com/kemckinnmsft/M365HOL3001/blob/master/Media/j9pxy1lm.jpg)

5.   Under **Activity source** in the **Activities matching all of the
     following** section, select the following activity filters to
     apply to the policy:

    1. **Device tags** does not equal **Valid client certificate**

    2. **App** equals **Salesforce**
    ![6wwuqlcz.jpg](https://github.com/kemckinnmsft/M365HOL3001/blob/master/Media/6wwuqlcz.jpg)

6.   Check the **Enabled** checkbox near **Content inspection**

7.   Check the **Include files that match a preset expression** radio
     button

8.   In the dropdown menu just below the radio button, scroll all the way
     to the end to choose **US: PII: Social security number**

9.   Check the **Don't require relevant context** checkbox, just below
     the dropdown
     menu
	 ![10uz9qp1.jpg](https://github.com/kemckinnmsft/M365HOL3001/blob/master/Media/10uz9qp1.jpg)

10.  Under **Actions**, select **Block**

11. Check the **Customize block message** checkbox, and add a custom
     message in the textbox that has opened, e.g.: "This file is
     sensitive"
    ![dzdsku3w.jpg](https://github.com/kemckinnmsft/M365HOL3001/blob/master/Media/dzdsku3w.jpg)

12.  Click on **Create**

13.  Create a second **Session policy** called *Protect download to
     unmanaged devices.*

14.  In the **Session control type** field Select **Control file download
     (with DLP)** 

	 ![xsznq6n8.jpg](https://github.com/kemckinnmsft/M365HOL3001/blob/master/Media/xsznq6n8.jpg)

15.  Under **Activity source** in the **Activities matching all of the
     following** section, select the following activity filters to
     apply to the policy:

 	**Device tags** does not equal **Valid client certificate**

 	**App** equals **Salesforce**

 	![8s4bu84k.jpg](https://github.com/kemckinnmsft/M365HOL3001/blob/master/Media/8s4bu84k.jpg)

16.  Clear the **Enabled** checkbox near **Content inspection**

17.  Under **Actions**, select **Protect**

    ![c5xhnr87.jpg](https://github.com/kemckinnmsft/M365HOL3001/blob/master/Media/c5xhnr87.jpg)

18.  Click on **Create**

19.  Disable this policy

### Test the user experience

1.  Extract the file **silvia.pfx** from the **Client Certificate**
     folder in **Demo files.zip** file you've received

2.   Double click on the **silvia.pfx** file, click **Next**, **Next**,
     enter the password **acme**, click **Next**, **Next**, **Finish**.

3.   Open a new browser in an Incognito mode

4.   Go to <https://myapps.microsoft.com> and login with the admin user

5.   Click on the **SalesforceCAS** tile

6.   You should now see a certificate prompt. Click on **Cancel**.

     **In a real demo**, you can open two different browsers,
     side by side, and show the user experience from a managed and
     unmanaged device by clicking on **OK** in one browser and
     **Cancel** in the other.

   ![2mj216sm.jpg](https://github.com/kemckinnmsft/M365HOL3001/blob/master/Media/2mj216sm.jpg)

7.   You should then see a Monitored access message, click on **Continue
     to Salesforce** to continue.

    ![h2oyt9fw.jpg](https://github.com/kemckinnmsft/M365HOL3001/blob/master/Media/h2oyt9fw.jpg)

8.   Now you are logged in to Salesforce. Click on + and go to Files

    ![d0ik67yl.jpg](https://github.com/kemckinnmsft/M365HOL3001/blob/master/Media/d0ik67yl.jpg)

9.  Upload the files **Personal employees information.docx** and
     **Protect with Microsoft Cloud App Security proxy.pdf** from the
     **Demo files.zip** file to the Files page in Salesforce

10.  Download the **Protect with Microsoft Cloud App Security proxy.pdf**
     files and see that it is downloaded, and you can open it.

11. Download the **Personal employees information.docx** file and see
     that you get a blocking message and instead of the file, you get a
     Blocked...txt file.

   ![wvk16zl2.jpg](https://github.com/kemckinnmsft/M365HOL3001/blob/master/Media/wvk16zl2.jpg)

### Test the admin experience

1.  Go back to the Cloud App Security portal, and under **Investigate**
    choose **Activity log**

2.   See the login activity that was redirected to the session control,
    the file download that was not blocked, and the file download that
    was blocked because it matched the policy.

    ![j0vuo06k.jpg](https://github.com/kemckinnmsft/M365HOL3001/blob/master/Media/j0vuo06k.jpg)
---
# Management
[🔙](#microsoft-365-cloud-app-security)

### Estimated time to complete
30 min

### Manage admin access 

For this task, you are asked to delegate admin access to other users,
without adding them to the Global Admin management role.

Documentation:
[https://docs.microsoft.com/en-us/cloud-app-security/manage-admins](https://docs.microsoft.com/en-us/cloud-app-security/manage-admins)

#### Delegate user group administration

You are asked to delegate the management of MCAS for US employees to a
new administrator.

By following the explanations in the documentation you have to:

1.  Create a new administrator account "mcasAdminUS"

2.   Create a new Azure AD group "US employees" containing a couple of
    your test users (not your admin account)

3.   Delegate that group management in MCAS to "mcasAdminUS"

4.   Connect to MCAS with "mcasAdminUS" and compare the activities,
    alerts and actions that this admin can perform

#### Delegate MCAS administration to an external admin

As a Managed Security Service Providers (MSSPs), you are asked by your
customer how you could access their environment to manage their alerts
in the Cloud App Security portal.

As the MCAS admin for your company, work with the person next to you to
configure an external access for the Managed Security Service Provider.

### MCAS PowerShell module introduction

To help administrators interact with MCAS in a programmatic way, two
Microsoft employees created a non-official PowerShell module for Cloud
App Security. For this lab, you will install this module and discover
the available cmdlets.

Note: the module relies on the Cloud App Security API. You can find its
documentation in the MCAS portal.

![f847xhzx.jpg](https://github.com/kemckinnmsft/M365HOL3001/blob/master/Media/f847xhzx.jpg)

The module is available in the PowerShell gallery and can be installed
using the *Install-Module mcas* command.

![6j16dgs2.jpg](https://github.com/kemckinnmsft/M365HOL3001/blob/master/Media/6j16dgs2.jpg)

More information on the module is available on GitHub:
[https://github.com/powershellshock/MCAS-Powershell](https://github.com/powershellshock/MCAS-Powershell)

After installing the module, read how to connect to MCAS in the
PowerShell help and start exploring the cmdlets.

Hint: you'll have to create an API token in Cloud App Security.

![0x2tzeqd.jpg](https://github.com/kemckinnmsft/M365HOL3001/blob/master/Media/0x2tzeqd.jpg)

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

---
# Information protection
[🔙](#microsoft-365-cloud-app-security)

15 min

In a perfect world, all your employees understand the importance of information protection and work within your policies. But in a real world, it's probable that a partner who works with accounting uploads a document to your Box repository with the wrong permissions, and a week later you realize that your enterprise's confidential information was leaked to your competition.
Microsoft Cloud App Security helps you prevent this kind of disaster before it happens.

In this task, you will protect a sensitive document library in SharePoint Online using the native integration with Azure Information Protection.

## Integrate MCAS with Azure Information Protection

As explained in the [documentation](https://docs.microsoft.com/en-us/cloud-app-security/azip-integration), configure the integration between the two solutions. 

1. Go to Cloud App Security settings and check the **Automatically scan new files** checkbox.

	![imku224m.jpg](https://github.com/kemckinnmsft/M365HOL3001/blob/master/Media/imku224m.jpg)
2.  Click on the **Save** button.

## Apply AIP classification to SSN documents

3.  Go to **Policies**.

	![i2nnuzsg.jpg](https://github.com/kemckinnmsft/M365HOL3001/blob/master/Media/i2nnuzsg.jpg)
4.  Create a new **File policy**.

	![aoodi6ml.jpg](https://github.com/kemckinnmsft/M365HOL3001/blob/master/Media/aoodi6ml.jpg)
5.  Provide the following settings to that policy:
	1. Policy name: **Protect SSN documents in sensitive site**.
	1. Files matching all of the following: **remove the filters**.
	1. Apply to: **selected folder**.

	> NOTE: Here, select the **Shared Documents** folder from the default SharePoint site.
	
		![mt3guvwp.jpg](https://github.com/kemckinnmsft/M365HOL3001/blob/master/Media/mt3guvwp.jpg)

		![piparayd.jpg](https://github.com/kemckinnmsft/M365HOL3001/blob/master/Media/piparayd.jpg)
	1. Verify that you have one selected folder and click on **Done**.
	
		![ovruaovh.jpg](https://github.com/kemckinnmsft/M365HOL3001/blob/master/Media/ovruaovh.jpg)

		![q67v9yh6.jpg](https://github.com/kemckinnmsft/M365HOL3001/blob/master/Media/q67v9yh6.jpg)
	1. In inspection method, select **Data Classification Service**.
	
		![7fw3fh7n.jpg](https://github.com/kemckinnmsft/M365HOL3001/blob/master/Media/7fw3fh7n.jpg)
	1. Click on sensitive information type, select the **SSN related** ones and click on **Done**.
	
		![2plklsza.jpg](https://github.com/kemckinnmsft/M365HOL3001/blob/master/Media/2plklsza.jpg)
	1. Click on the **Unmask** checkbox.
	
		![a89zd1k2.jpg](https://github.com/kemckinnmsft/M365HOL3001/blob/master/Media/a89zd1k2.jpg)
	1. In the Governance actions, select **Apply classification label**.
	
		![6wfpj4to.jpg](https://github.com/kemckinnmsft/M365HOL3001/blob/master/Media/6wfpj4to.jpg)
	1. Click **Create** to finish the policy creation.

---
# Quarantine sensitive PDF for review
[🔙](#microsoft-365-cloud-app-security)

File policies are a great tool for finding threats to your information protection policies, for instance finding places where users stored sensitive information, credit card numbers and third-party ICAP files in your cloud. With Microsoft Cloud App Security, not only can you detect these unwanted files stored in your cloud that leave you vulnerable, but you can take immediate action to stop them in their tracks and lock down the files that pose a threat. Using Admin quarantine, you can protect your files in the cloud and remediate problems, as well as prevent future leaks from occurring.
This is what we are going to configure in this lab.

1. In Cloud App Security, go to the **Settings**.

	![oqfkh5cw.jpg](https://github.com/kemckinnmsft/M365HOL3001/blob/master/Media/oqfkh5cw.jpg)
2.  In the Information Protection section, go to **Admin quarantine**.

	![pvjk90y0.jpg](https://github.com/kemckinnmsft/M365HOL3001/blob/master/Media/pvjk90y0.jpg)
3.  In the dropdown menu, select your root SharePoint site.

	1. In user notification, type **Your content has been quarantined. Please contact your admin.**
	1. Click on the Save button.

    >NOTE: As best practice, you should define a dedicated site with restricted access as the admin quarantine location.

	![hl55gqvd.jpg](https://github.com/kemckinnmsft/M365HOL3001/blob/master/Media/hl55gqvd.jpg)
4.  Next, go to the policies menu and create a new **file policy**.

	![3xpu3nw7.jpg](https://github.com/kemckinnmsft/M365HOL3001/blob/master/Media/3xpu3nw7.jpg)
5.  Provide the following settings to that policy:
	1. Policy name: **Quarantine sensitive pdf**
	1. Files matching all of the following: **Extension equals pdf**
	
	![2cmlwt55.jpg](https://github.com/kemckinnmsft/M365HOL3001/blob/master/Media/2cmlwt55.jpg)
	1. In Governance actions, select **Put in admin quarantine** and click on the Create button.
	
	![1wlrz08d.jpg](https://github.com/kemckinnmsft/M365HOL3001/blob/master/Media/1wlrz08d.jpg)
 
## Test our policies

To test our files policies, perform the following tasks:

1. On Client01, unzip the content of the **Demo files.zip**.
7.  Go to the **Contoso Team Site** documents library.
8.  Upload the unzipped files to the site.


	![xf5ozmrf.jpg](https://github.com/kemckinnmsft/M365HOL3001/blob/master/Media/xf5ozmrf.jpg)
9.  Cloud App Security will now scan those documents and search for matches to our created policies. The scan can take some minutes before completion.
10.  To monitor the evolution, go back to Cloud App Security and open the **Files** page of the investigations.

	![wb3gbn9w.jpg](https://github.com/kemckinnmsft/M365HOL3001/blob/master/Media/wb3gbn9w.jpg)
11. When a match is discovered, you will see it in this page.

	![6g2kg3vq.jpg](https://github.com/kemckinnmsft/M365HOL3001/blob/master/Media/6g2kg3vq.jpg)
12.  Open the details of the file. You can see there the matched policies and the scan status of the files.

	![rqbu6yyq.jpg](https://github.com/kemckinnmsft/M365HOL3001/blob/master/Media/rqbu6yyq.jpg)
13.  You can also view the related governance actions in the Governance log.

	![bg5romej.jpg](https://github.com/kemckinnmsft/M365HOL3001/blob/master/Media/bg5romej.jpg)
	
	![fbsrlfsk.jpg](https://github.com/kemckinnmsft/M365HOL3001/blob/master/Media/fbsrlfsk.jpg)

14.  You will also notice that the quarantined files will be replaced by placeholders containing your custom message and be moved to the "Quarantine" location we defined.

	![as3niznc.jpg](https://github.com/kemckinnmsft/M365HOL3001/blob/master/Media/as3niznc.jpg)

	![juas1s58.jpg](https://github.com/kemckinnmsft/M365HOL3001/blob/master/Media/juas1s58.jpg)

	![drm0yj0c.jpg](https://github.com/kemckinnmsft/M365HOL3001/blob/master/Media/drm0yj0c.jpg)

---
# Azure Information Protection
[🔙](#introduction)
### Objectives

> WARNING: Please ensure you have completed the steps in the [Lab Environment Configuration](#lab-environment-configuration) before continuing.

After completing this lab, you will be able to:

- [Configure the Azure Information Protection scanner to discover sensitive data](#exercise-1-configuring-aip-scanner-for-discovery)
- [Configure Azure Information Protection labels](#creating-configuring-and-modifying-sub-labels)
- [Configure Azure Information Protection policies](#configuring-global-policy)
- [Classify and protect content with Azure Information Protection in Office applications](#configuring-applications)
- [Configure Exchange Online Mail Flow Rules for AIP](#configuring-exchange-online-mail-flow-rules)
- [Classify and protect sensitive data discovered by the AIP Scanner](#configuring-automatic-conditions)
- [Activate Unified Labeling for the Security and Compliance Center (Optional)](#exercise-7-security-and-compliance-center)
- [Configure SharePoint IRM Libraries (Optional)](#exercise-8-sharepoint-irm-configuration)

---

# Exercise 1: Configuring AIP Scanner for Discovery
[🔙](#azure-information-protection)

Even before configuring an AIP classification taxonomy, customers can scan and identify files containing sensitive information based on the built-in sensitive information types included in the Microsoft Classification Engine.  

![ahwj80dw.jpg](https://github.com/kemckinnmsft/M365HOL3001/blob/master/Media/ahwj80dw.jpg)

Often, this can help drive an appropriate level of urgency and attention to the risk customers face if they delay rolling out AIP classification and protection.  

In this exercise, we will install the AIP scanner and run it against repositories in discovery mode.  Later in this lab (after configuring labels and conditions) we will revisit the scanner to perform automated classification, labeling, and protection of sensitive documents.

---
# Configuring Azure Log Analytics
[🔙](#azure-information-protection)

In order to collect log data from Azure Information Protection clients and services, you must first configure the log analytics workspace.

1. Switch to Client01.
1. In the InPrivate window, navigate to **https://portal.azure.com/**
	>
	>![Open Screenshot](https://github.com/kemckinnmsft/M365HOL3001/blob/master/Media/cznh7i2b.jpg)

	>INFO: If necessary, log in using the username and password below:
	>
	>**Global Admin Username** 
	>
	>**Global Admin Password**
	
1. After logging into the portal, type the word **info** into the **search bar** and press **Enter**, then click on **Azure Information Protection**. 

	![2598c48n.jpg](https://github.com/kemckinnmsft/M365HOL3001/blob/master/Media/2598c48n.jpg)
	
	> NOTE: If you do not see the search bar at the top of the portal, click on the **Magnifying Glass** icon to expand it.
	>
	> ![ny3fd3da.jpg](https://github.com/kemckinnmsft/M365HOL3001/blob/master/Media/ny3fd3da.jpg)

1. In the Azure Information Protection blade, under **Manage**, click **Configure analytics (preview)**.

1. Next, click on **+ Create new workspace**.

	![qu68gqfd.jpg](https://github.com/kemckinnmsft/M365HOL3001/blob/master/Media/qu68gqfd.jpg)
1. In the Log analytics workspace using the values in the table below and click **OK**.

	|||
	|-----|-----|
	|OMS Workspace|**Unique Workspace Name**|
	|Resource Group|**AIP-RG**|
	|Location|**East US**|

	![Open Screenshot](https://github.com/kemckinnmsft/M365HOL3001/blob/master/Media/5butui15.jpg)
1. Next, back in the Configure analytics (preview) blade, **check the box** next to the workspace and click **OK**.

	![gste52sy.jpg](https://github.com/kemckinnmsft/M365HOL3001/blob/master/Media/gste52sy.jpg)
1. Click **Yes**, in the confirmation dialog.

	![zgvmm4el.jpg](https://github.com/kemckinnmsft/M365HOL3001/blob/master/Media/zgvmm4el.jpg)
---



# Installing the AIP Scanner Service
[🔙](#azure-information-protection)

The first step in configuring the AIP Scanner is to install the service and connect the database.  This is done with the Install-AIPScanner cmdlet that is provided by the AIP Client software.  The AIPScanner service account has been pre-staged in Active Directory for convenience.

1. Switch to Scanner01 and (if necessary) click @lab.CtrlAltDelete and log in using the username and password below:

	**@lab.VirtualMachine(Scanner01).Username** 
	
	**@lab.VirtualMachine(Scanner01).Password**

1. Right-click on the **PowerShell** icon in the taskbar and click on **Run as Administrator**.

	![7to6p334.jpg](https://github.com/kemckinnmsft/M365HOL3001/blob/master/Media/7to6p334.jpg)

1. At the PowerShell prompt, type **$SQL = "Scanner01"** and press **Enter**.
1. Next, type **Install-AIPScanner -SQLServerInstance $SQL** and press **Enter**.
1. When prompted, provide the credentials for the AIP scanner service account.
	
	**Contoso\AIPScanner**

	**Somepass1**

	![Open Screenshot](https://github.com/kemckinnmsft/M365HOL3001/blob/master/Media/pc9myg9x.jpg)

	>INFO: You should see a success message like the one below. 
	>
	>![w7goqgop.jpg](https://github.com/kemckinnmsft/M365HOL3001/blob/master/Media/w7goqgop.jpg)
	>

1. Right-click on the **Windows** button in the lower left-hand corner and click on **Run**.
1. In the Run dialog, type **Services.msc** and click **OK**.

	![Open Screenshot](https://github.com/kemckinnmsft/M365HOL3001/blob/master/Media/h0ys0h4u.jpg)
1. In the Services console, double-click on the **Azure Information Protection Scanner** service.
1. On the **Log On** tab of the Azure Information Protection Scanner Service Properties, verify that **Log on as:** is set to the **Contoso\AIPScanner** service account.

	![Open Screenshot](https://github.com/kemckinnmsft/M365HOL3001/blob/master/Media/ek9jsd0a.jpg)

---

# Creating Azure AD Applications for the AIP Scanner
[🔙](#azure-information-protection)

Now that you have installed the scanner bits, you need to get an Azure AD token for the scanner service account to authenticate so that it can run unattended. This requires registering both a Web app and a Native app in Azure Active Directory.  The commands below will do this in an automated fashion rather than needing to go into the Azure portal directly.

1. In PowerShell, run **Connect-AzureAD** and use the username and password below. 
	
	**Global Admin Username**
	
	**Global Admin Password**
1. Next, **type the commands below** and press **Enter** to create a new Web App Registration and Service Principal in Azure AD.

   ```
   New-AzureADApplication -DisplayName AIPOnBehalfOf -ReplyUrls http://localhost
   $WebApp = Get-AzureADApplication -Filter "DisplayName eq 'AIPOnBehalfOf'"
   New-AzureADServicePrincipal -AppId $WebApp.AppId
   $WebAppKey = New-Guid
   $Date = Get-Date
   New-AzureADApplicationPasswordCredential -ObjectId $WebApp.ObjectID -startDate $Date -endDate $Date.AddYears(1) -Value $WebAppKey.Guid -CustomKeyIdentifier "AIPClient"
	```
1. Next, we must build the permissions object for the Native App Registration.  This is done using the commands below.
   
   ```
   $AIPServicePrincipal = Get-AzureADServicePrincipal -All $true | ? {$_.DisplayName -eq 'AIPOnBehalfOf'}
   $AIPPermissions = $AIPServicePrincipal | select -expand Oauth2Permissions
   $Scope = New-Object -TypeName "Microsoft.Open.AzureAD.Model.ResourceAccess" -ArgumentList $AIPPermissions.Id,"Scope"
   $Access = New-Object -TypeName "Microsoft.Open.AzureAD.Model.RequiredResourceAccess"
   $Access.ResourceAppId = $WebApp.AppId
   $Access.ResourceAccess = $Scope
	```
1. Next, we will use the object created above to create the Native App Registration.
   
   ```
   New-AzureADApplication -DisplayName AIPClient -ReplyURLs http://localhost -RequiredResourceAccess $Access -PublicClient $true
   $NativeApp = Get-AzureADApplication -Filter "DisplayName eq 'AIPClient'"
   New-AzureADServicePrincipal -AppId $NativeApp.AppId
	```
   
1. Finally, we will output the Set-AIPAuthentication command by running the commands below.
   
   ```
   "Set-AIPAuthentication -WebAppID " + $WebApp.AppId + " -WebAppKey " + $WebAppKey.Guid + " -NativeAppID " + $NativeApp.AppId | Out-File ~\Desktop\Set-AIPAuthentication.txt
	Start ~\Desktop\Set-AIPAuthentication.txt
	```
1. Copy the command to the clipboard.
1. Click on the Start menu and type **PowerShell**, right-click on the PowerShell program, and click **Run as a different user**.

	![zgt5ikxl.jpg](https://github.com/kemckinnmsft/M365HOL3001/blob/master/Media/zgt5ikxl.jpg)

1. When prompted, enter the username and password below and click **OK**.

	**Contoso\AIPScanner** 

	**Somepass1**

1. Paste the copied **Set-AIPAuthentication** command into this window and run it.
1. When prompted, enter the username and password below:

	**AIPScanner@yourtenant.com**

	**Somepass1**

	![Open Screenshot](https://github.com/kemckinnmsft/M365HOL3001/blob/master/Media/qfxn64vb.jpg)

1. In the Permissions requested window, click **Accept**.

   ![nucv27wb.jpg](https://github.com/kemckinnmsft/M365HOL3001/blob/master/Media/nucv27wb.jpg)
   
	>[!knowledge] You will a message like the one below in the PowerShell window once complete.
	>
	>![y2bgsabe.jpg](https://github.com/kemckinnmsft/M365HOL3001/blob/master/Media/y2bgsabe.jpg)
1. **Return to the admin PowerShell window** and type the command below and press **Enter**.

	**Restart-Service AIPScanner**
   
---

# Configuring Repositories
[🔙](#azure-information-protection)

In this task, we will configure repositories to be scanned by the AIP scanner.  As previously mentioned, these can be any type of CIFS file shares including NAS devices sharing over the CIFS protocol.  Additionally, On premises SharePoint 2010, 2013, and 2016 document libraries and lists (attachements) can be scanned.  You can even scan entire SharePoint sites by providing the root URL of the site.  There are several optional 

> NOTE: SharePoint 2010 is only supported for customers who have extended support for that version of SharePoint.

The next task is to configure repositories to scan.  These can be on-premises SharePoint 2010, 2013, or 2016 document libraries and any accessible CIFS based share.

1. In the PowerShell window on Scanner01 run the commands below

    ```
    Add-AIPScannerRepository -Path http://Scanner01/documents -SetDefaultLabel Off
	```
	```
	Add-AIPScannerRepository -Path \\Scanner01\documents -SetDefaultLabel Off
    ```
	>[!Knowledge] Notice that we added the **-SetDefaultLabel Off** switch to each of these repositories.  This is necessary because our Global policy has a Default label of **General**.  If we did not add this switch, any file that did not match a condition would be labeled as General when we do the enforced scan.

	![Open Screenshot](https://github.com/kemckinnmsft/M365HOL3001/blob/master/Media/00niixfd.jpg)
1. To verify the repositories configured, run the command below.
	
    ```
    Get-AIPScannerRepository
    ```
	![Open Screenshot](https://github.com/kemckinnmsft/M365HOL3001/blob/master/Media/n5hj5e7j.jpg)

---

# Running Sensitive Data Discovery
[🔙](#azure-information-protection)

1. Run the commands below to run a discovery cycle.

    ```
	Set-AIPScannerConfiguration -DiscoverInformationTypes All -Enforce Off
	```
	```
	Start-AIPScan
    ```

	>INFO: Note that we used the DiscoverInformationTypes -All switch before starting the scan.  This causes the scanner to use any custom conditions that you have specified for labels in the Azure Information Protection policy, and the list of information types that are available to specify for labels in the Azure Information Protection policy.  Although the scanner will discover documents to classify, it will not do so because the default configuration for the scanner is Discover only mode.
 	
1. Right-click on the **Windows** button in the lower left-hand corner and click on **Event Viewer**.
 
	![Open Screenshot](https://github.com/kemckinnmsft/M365HOL3001/blob/master/Media/cjvmhaf0.jpg)
1. Expand **Application and Services Logs** and click on **Azure Information Protection**.

	![Open Screenshot](https://github.com/kemckinnmsft/M365HOL3001/blob/master/Media/dy6mnnpv.jpg)
 
	>NOTE: You will see an event like the one below when the scanner completes the cycle.
	>
	>![agnx2gws.jpg](https://github.com/kemckinnmsft/M365HOL3001/blob/master/Media/agnx2gws.jpg)
 
1. Next, switch to Client01, open a **File Explorer** window, and browse to **\\\Scanner01\c$\users\aipscanner\AppData\Local\Microsoft\MSIP\Scanner\Reports** and log on using the credentials below:

	**Contoso\LabUser**

	**Pa$$w0rd**

1. Review the summary txt and detailed csv files available there.  

	>NOTE: Since there are no Automatic conditions configured yet, the scanner found no matches for the 141 files scanned despite 136 of them having sensitive data.
	>
	>![aukjn7zr.jpg](https://github.com/kemckinnmsft/M365HOL3001/blob/master/Media/aukjn7zr.jpg)
	>
	>The details contained in the DetailedReport.csv can be used to identify the types of sensitive data you need to create AIP rules for in the Azure Portal.
	>
	>![9y52ab7u.jpg](https://github.com/kemckinnmsft/M365HOL3001/blob/master/Media/9y52ab7u.jpg)

	>NOTE: We will revisit this information later in the lab to review discovered data and create Sensitive Data Type to Classification mappings.

---

# Exercise 2: Configuring Azure Information Protection Policy
[🔙](#azure-information-protection)

This exercise demonstrates using the Azure Information Protection blade in the Azure portal to configure policies and sub-labels.  We will create a new sub-label and configure protection and then modify an existing sub-label.  We will also create a label that will be scoped to a specific group.  

Next, we will configure AIP Global Policy to use the General sub-label as default, and finally, we will configure a scoped policy to use the new scoped label by default for Word, Excel, and PowerPoint while still using General as default for Outlook.
---
# Creating, Configuring, and Modifying Sub-Labels
[🔙](#azure-information-protection)

In this task, we will configure a label protected for internal audiences that can be used to help secure sensitive data within your company.  By limiting the audience of a specific label to only internal employees, you can dramatically reduce the risk of unintentional disclosure of sensitive data and help reduce the risk of successful data exfiltration by bad actors.  

However, there are times when external collaboration is required, so we will configure a label to match the name and functionality of the Do Not Forward button in Outlook.  This will allow users to more securely share sensitive information outside the company to any recipient.  By using the name Do Not Forward, the functionality will also be familiar to what previous users of AD RMS or Azure RMS may have used in the past.

1. In the Azure Information Protection blade, under **classifications** in the left pane, click on **Labels** to load the Azure Information Protection – Labels blade.

	![Open Screenshot](https://github.com/kemckinnmsft/M365HOL3001/blob/master/Media/mhocvtih.jpg)

1. In the Azure Information Protection – Labels blade, right-click on **Confidential** and click **Add a sub-label**.

	![Open Screenshot](https://github.com/kemckinnmsft/M365HOL3001/blob/master/Media/uktfuwuk.jpg)

1. In the Sub-label blade, type **Contoso Internal** for the **Label display name** and for **Description** enter text similar to **Confidential data that requires protection, which allows Contoso Internal employees full permissions. Data owners can track and revoke content.**

	![Open Screenshot](https://github.com/kemckinnmsft/M365HOL3001/blob/master/Media/4luorc0u.jpg)

1. Then, under **Set permissions for documents and emails containing this label**, click **Protect**, and under **Protection**, click on **Azure (cloud key)**.

	![Open Screenshot](https://github.com/kemckinnmsft/M365HOL3001/blob/master/Media/tp97a19d.jpg)

1. In the Protection blade, click **+ Add Permissions**.

	![Open Screenshot](https://github.com/kemckinnmsft/M365HOL3001/blob/master/Media/layb2pvo.jpg)

1. In the Add permissions blade, click on **+ Add contoso – All members** and click **OK**.

	![Open Screenshot](https://github.com/kemckinnmsft/M365HOL3001/blob/master/Media/zc0iuoyz.jpg)

1. In the Protection blade, click **OK**.

	![Open Screenshot](https://github.com/kemckinnmsft/M365HOL3001/blob/master/Media/u8jv46zo.jpg)

1. In the Sub-label blade, scroll down to the **Set visual marking (such as header or footer)** section and under **Documents with this label have a header**, click **On**.

	> Use the values in the table below to configure the Header.

	| Setting          | Value            |
	|:-----------------|:-----------------|
	| Header text      | **Contoso Internal** |
	| Header font size | **24**               |
	| Header color     | Purple           |
	| Header alignment | Center           |

	> NOTE: These are sample values to demonstrate marking possibilities and **NOT** a best practice.

	![Open Screenshot](https://github.com/kemckinnmsft/M365HOL3001/blob/master/Media/0vdoc6qb.jpg)

1. To complete creation of the new sub-label, click the **Save** button and then click **OK** in the Save settings dialog.

	![Open Screenshot](https://github.com/kemckinnmsft/M365HOL3001/blob/master/Media/89nk9deu.jpg)

1. In the Azure Information Protection - Labels blade, expand **Confidential** (if necessary) and then click on **Recipients Only**.

	![Open Screenshot](https://github.com/kemckinnmsft/M365HOL3001/blob/master/Media/eiiw5zbg.jpg)

1. In the Label: Recipients Only blade, change the **Label display name** from **Recipients Only** to **Do Not Forward**.

	![Open Screenshot](https://github.com/kemckinnmsft/M365HOL3001/blob/master/Media/v54vd4fq.jpg)

1. Next, in the **Set permissions for documents and emails containing this label** section, under **Protection**, click **Azure (cloud key): User defined**.

	![Open Screenshot](https://github.com/kemckinnmsft/M365HOL3001/blob/master/Media/qwyranz0.jpg)

1. In the Protection blade, under **Set user-defined permissions (Preview)**, verify that only the box next to **In Outlook apply Do Not Forward** is checked, then click **OK**.

	![Open Screenshot](https://github.com/kemckinnmsft/M365HOL3001/blob/master/Media/16.png)

	>INFO: Although there is no action added during this step, it is included to show that this label will only display in Outlook and not in Word, Excel, PowerPoint or File Explorer.

1. Click **Save** in the Label: Recipients Only blade and **OK** to the Save settings prompt. 

	![Open Screenshot](https://github.com/kemckinnmsft/M365HOL3001/blob/master/Media/9spkl24i.jpg)

1.  Click the **X** in the upper right corner of the blade to close.

	![Open Screenshot](https://github.com/kemckinnmsft/M365HOL3001/blob/master/Media/98pvhwdv.jpg)

---

# Configuring Global Policy
[🔙](#azure-information-protection)

In this task, we will assign the new sub-label to the Global policy and configure several global policy settings that will increase Azure Information Protection adoption among your users and reduce ambiguity in the user interface.

1. In the Azure Information Protection blade, under **classifications** on the left, click **Policies** then click the **Global** policy.

	![Open Screenshot](https://github.com/kemckinnmsft/M365HOL3001/blob/master/Media/24qjajs5.jpg)

1. In the Policy: Global blade, **wait for the labels to load**.

1. Below the labels, click **Add or remove labels**.

1. In the Policy: Add or remove labels blade, ensure that the boxes next to all Labels are checked and click **OK**.

1. In the Policy: Global blade, under the **Configure settings to display and apply on Information Protection end users** section, configure the policy to match the settings shown in the table and image below.

	| Setting | Value |
	|:--------|:------|
	| Select the default label | General |
	|All documents and emails must have a label…|On
	Users must provide justification to set a lower…|On
	For email messages with attachments, apply a label…|Automatic
	Add the Do Not Forward button to the Outlook ribbon|Off

	![Open Screenshot](https://github.com/kemckinnmsft/M365HOL3001/blob/master/Media/mtqhe3sj.jpg)

1. Click **Save**, then **OK** to complete configuration of the Global policy.

	![Open Screenshot](https://github.com/kemckinnmsft/M365HOL3001/blob/master/Media/1p1q4pxe.jpg)

1. Click the **X** in the upper right corner to close the Policy: Global blade.

	![Open Screenshot](https://github.com/kemckinnmsft/M365HOL3001/blob/master/Media/m6e4r2u2.jpg)

---

# Creating a Scoped Label and Policy
[🔙](#azure-information-protection)

Now that you have learned how to work with global labels and policies, we will create a new scoped label and policy for the Legal team at Contoso.  

1. Under **classifications** on the left, click **Labels**.

	![Open Screenshot](https://github.com/kemckinnmsft/M365HOL3001/blob/master/Media/50joijwb.jpg)

1. In the Azure Information Protection – Labels blade, right-click on **Highly-Confidential** and click **Add a sub-label**.

	![Open Screenshot](https://github.com/kemckinnmsft/M365HOL3001/blob/master/Media/tasz9t0i.jpg)

1. In the Sub-label blade, enter **Legal Only** for the **Label display name** and for **Description** enter **Data is classified and protected. Legal department staff can edit, forward and unprotect.**.

	![Open Screenshot](https://github.com/kemckinnmsft/M365HOL3001/blob/master/Media/lpvruk49.jpg)

1. Then, under **Set permissions for documents and emails containing this label**, click **Protect** and under **Protection**, click **Azure (cloud key)**.

	![Open Screenshot](https://github.com/kemckinnmsft/M365HOL3001/blob/master/Media/6ood4jqu.jpg)

1. In the Protection blade, under **Protection settings**, click the **+ Add permissions** link.

	![ozzumi7l.jpg](https://github.com/kemckinnmsft/M365HOL3001/blob/master/Media/ozzumi7l.jpg)

1. In the Add permissions blade, click **+ Browse directory**.

	![Open Screenshot](https://github.com/kemckinnmsft/M365HOL3001/blob/master/Media/2lvwim24.jpg)

1. In the AAD Users and Groups blade, **wait for the names to load**, then check the boxes next to **Alan Steiner** and **Amy Albers**, and click the **Select** button.

	![Open Screenshot](https://github.com/kemckinnmsft/M365HOL3001/blob/master/Media/uishk9yh.jpg)

	> NOTE: In a production environment, you will typically use a synced or Azure AD Group rather than choosing individuals.

1. In the Add permissions blade, click **OK**.

	![Open Screenshot](https://github.com/kemckinnmsft/M365HOL3001/blob/master/Media/stvnaf4f.jpg)

1. In the Protection blade, under **Allow offline access**, reduce the **Number of days the content is available without an Internet connection** value to **3** and press **OK** .

	>INFO: This value determines how many days a user will have offline access from the time a document is opened, and an initial Use License is acquired.  While this provides convenience for users, it is recommended that this value be set appropriately based on the sensitivity of the content.

	![Open Screenshot](https://github.com/kemckinnmsft/M365HOL3001/blob/master/Media/j8masv1q.jpg)

1. Click **Save** in the Sub-label blade and **OK** to the Save settings prompt to complete the creation of the Legal Only sub-label.

	![Open Screenshot](https://github.com/kemckinnmsft/M365HOL3001/blob/master/Media/dfhoii1x.jpg)

1. In the Azure Information Protection blade, under **Classifications** on the left, click **Policies** then click the **+Add a new policy** link.

	![Open Screenshot](https://github.com/kemckinnmsft/M365HOL3001/blob/master/Media/ospsddz6.jpg)

1. In the Policy blade, for Policy name, type **No Default Label Scoped Policy** and click on **Select which users or groups get this policy. Groups must be email-enabled.**

	![1sjw3mc7.jpg](https://github.com/kemckinnmsft/M365HOL3001/blob/master/Media/1sjw3mc7.jpg)

1. In the AAD Users and Groups blade, click on **Users/Groups**.  
1. Then in the second AAD Users and Groups blade, **wait for the names to load** and check the boxes next to **Alan Steiner**, **Amy Albers**, and **AIPScanner**.

	>NOTE: The **AIPScanner** account is added here to prevent all scanned documents from being labeled with a default label.
1. Click the **Select** button.
1. Finally, click **OK**.

	![Open Screenshot](https://github.com/kemckinnmsft/M365HOL3001/blob/master/Media/onne7won.jpg)

1. In the Policy blade, under the labels, click on **Add or remove labels** to add the scoped label.

	![b6e9nbui.jpg](https://github.com/kemckinnmsft/M365HOL3001/blob/master/Media/b6e9nbui.jpg)

1. In the Policy: Add or remove labels blade, check the box next to **Legal Only** and click **OK**.

	![Open Screenshot](https://github.com/kemckinnmsft/M365HOL3001/blob/master/Media/c2429kv9.jpg)

1. In the Policy blade, under **Configure settings to display and apply on Information Protection end users** section, under **Select the default label**, select **None** as the default label for this scoped policy.

	![4mxceage.jpg](https://github.com/kemckinnmsft/M365HOL3001/blob/master/Media/4mxceage.jpg)

1. Click **Save**, then **OK** to complete creation of the No Default Label Scoped Policy.

	![Open Screenshot](https://github.com/kemckinnmsft/M365HOL3001/blob/master/Media/41jembjf.jpg)

1. Click on the **X** in the upper right-hand corner to close the policy.

---

# Configuring Advanced Policy Settings
[🔙](#azure-information-protection)

There are many advanced policy settings that are useful to tailor your Azure Information Protection deployment to the needs of your environment.  In this task, we will cover one of the settings that is very complimentary when using scoped policies that have no default label or a protected default label.  Because the No Default Label Scoped Policy we created in the previous task uses a protected default label, we will be adding an alternate default label for Outlook to provide a more palatable user experience for those users.

1. In the Azure Information Protection blade, under **classifications** on the left, click on **Labels** and then click on the **General** label.

    ![Open Screenshot](https://github.com/kemckinnmsft/M365HOL3001/blob/master/Media/rvn4xorx.jpg)

1. In the Label: General blade, scroll to the bottom and copy the **Label ID** and close the blade using the **X** in the upper right-hand corner.

    ![8fi1wr4d.jpg](https://github.com/kemckinnmsft/M365HOL3001/blob/master/Media/8fi1wr4d.jpg)

1. In the AIP Portal, under **classifications** on the left, click on **Policies**. Right-click on the **No Default Label Scoped Policy** and click on **Advanced settings**.

    ![Open Screenshot](https://github.com/kemckinnmsft/M365HOL3001/blob/master/Media/2jo71ugb.jpg)

1. In the Advanced settings blade, in the textbox under **NAME**, type **OutlookDefaultLabel**.  In the textbox under **VALUE**, paste the **Label ID** for the **General** label you copied previously, then click **Save and close**.

    > WARNING: CAUTION: Please check to ensure that there are **no spaces** before or after the **Label ID** when pasting as this will cause the setting to not apply.

    ![ezt8sfs3.jpg](https://github.com/kemckinnmsft/M365HOL3001/blob/master/Media/ezt8sfs3.jpg)

	> NOTE: This and additional Advanced Policy Settings can be found at [https://docs.microsoft.com/en-us/azure/information-protection/rms-client/client-admin-guide-customizations ](https://docs.microsoft.com/en-us/azure/information-protection/rms-client/client-admin-guide-customizations)

---

# Defining Recommended and Automatic Conditions
[🔙](#azure-information-protection)

One of the most powerful features of Azure Information Protection is the ability to guide your users in making sound decisions around safeguarding sensitive data.  This can be achieved in many ways through user education or reactive events such as blocking emails containing sensitive data. 

However, helping your users to properly classify and protect sensitive data at the time of creation is a more organic user experience that will achieve better results long term.  In this task, we will define some basic recommended and automatic conditions that will trigger based on certain types of sensitive data.

1. Under **classifications** on the left, click **Labels** then expand **Confidential**, and click on **Contoso Internal**.

	![Open Screenshot](https://github.com/kemckinnmsft/M365HOL3001/blob/master/Media/jyw5vrit.jpg)
1. In the Label: Contoso Internal blade, scroll down to the **Configure conditions for automatically applying this label** section, and click on **+ Add a new condition**.

	![cws1ptfd.jpg](https://github.com/kemckinnmsft/M365HOL3001/blob/master/Media/cws1ptfd.jpg)
1. In the Condition blade, in the **Select information types** search box, type **credit** and check the box next to **Credit Card Number**.

	![Open Screenshot](https://github.com/kemckinnmsft/M365HOL3001/blob/master/Media/9rozp61b.jpg)
1. Click **Save** in the Condition blade and **OK** to the Save settings prompt.

	![Open Screenshot](https://github.com/kemckinnmsft/M365HOL3001/blob/master/Media/41o5ql2y.jpg)

	>INFO: By default the condition is set to Recommended and a policy tip is created with standardized text.
	>
	>  ![qdqjnhki.jpg](https://github.com/kemckinnmsft/M365HOL3001/blob/master/Media/qdqjnhki.jpg)

1. Click **Save** in the Label: Contoso Internal blade and **OK** to the Save settings prompt.

	![Open Screenshot](https://github.com/kemckinnmsft/M365HOL3001/blob/master/Media/rimezmh1.jpg)
1. Press the **X** in the upper right-hand corner to close the Label: Contoso Internal blade.

	![Open Screenshot](https://github.com/kemckinnmsft/M365HOL3001/blob/master/Media/em124f66.jpg)
1. Next, expand **Highly Confidential** and click on the **All Employees** sub-label.

	![Open Screenshot](https://github.com/kemckinnmsft/M365HOL3001/blob/master/Media/2eh6ifj5.jpg)
1. In the Label: All Employees blade, scroll down to the **Configure conditions for automatically applying this label** section, and click on **+ Add a new condition**.

	![Open Screenshot](https://github.com/kemckinnmsft/M365HOL3001/blob/master/Media/8cdmltcj.jpg)
1. In the Condition blade, click on **Custom** and enter **Password** for the **Name** and in the textbox below **Match exact phrase or pattern**, type **pass@word1**.

	![ra7dnyg6.jpg](https://github.com/kemckinnmsft/M365HOL3001/blob/master/Media/ra7dnyg6.jpg)
1. Click **Save** in the Condition blade and **OK** to the Save settings prompt.

	![Open Screenshot](https://github.com/kemckinnmsft/M365HOL3001/blob/master/Media/ie6g5kta.jpg)
1. In the Labels: All Employees blade, in the **Configure conditions for automatically applying this label** section, click **Automatic**.

	![245lpjvk.jpg](https://github.com/kemckinnmsft/M365HOL3001/blob/master/Media/245lpjvk.jpg)
	> NOTE: The policy tip is automatically updated when you switch the condition to Automatic.
1. Click **Save** in the Label: All Employees blade and **OK** to the Save settings prompt.

	![Open Screenshot](https://github.com/kemckinnmsft/M365HOL3001/blob/master/Media/gek63ks8.jpg)
1. Press the **X** in the upper right-hand corner to close the Label: All Employees blade.

	![Open Screenshot](https://github.com/kemckinnmsft/M365HOL3001/blob/master/Media/wzwfc1l4.jpg)

---

# Exercise 3: Client Configuration
[🔙](#azure-information-protection)

Now that we have defined some basic AIP Policies, we need to configure some clients to demonstrate the Discovery, Classification, and Protection capabilities of Azure Information Protection.  In this exercise, we will configure Office 365 Applications for 3 test users to demonstrate these policy actions.  

Office 365 and the latest GA AIP Client (1.37.19.0) have already been installed on these systems to save time in this lab.  In your production environment, you will need to install the AIP Client manually for testing or using an Enterprise Deployment Tool like System Center Configuration Manager for widespread deployment.

We will also be disabling a mail flow rule in the Exchange Admin Center to allow mail to be sent outside the tenant.  This will allow us to test Do Not Forward and Office 365 Message Encryption scenarios.
---
# Configuring Applications
[🔙](#azure-information-protection)
 
In this task, we will configure Word and Outlook for 3 test users.  These users are Alan Steiner (Alan) and Amy Alberts (Amy) who we have defined as members of the Legal group, and Eric Grimes (Eric).  

This will allow us to demonstrate the differences between the global and scoped policy and demonstrate some of the protection features of Azure Information Protection in the next exercise.

1. On Client01, minimize the Edge window and launch **Microsoft Word**.

	![pxyal6hb.jpg](https://github.com/kemckinnmsft/M365HOL3001/blob/master/Media/pxyal6hb.jpg)
	
	>INFO: When Word opens, you may see a prompt to log into **Microsoft Azure Information Protection**.  You may **close this** and continue.  Azure Information Protection will automatically inherit the settings from Word after reloading.
	>
	> ![3gm9oeee.jpg](https://github.com/kemckinnmsft/M365HOL3001/blob/master/Media/3gm9oeee.jpg)

1. In the upper right, click on **Sign in to get the most out of Office**.
	
	![Open Screenshot](https://github.com/kemckinnmsft/M365HOL3001/blob/master/Media/elavdbu1.jpg)
1. In the Sign in dialog, enter **Alan@yourtenant.com** and press **Next**. 

1. In the Enter password dialog, enter **pass@word1** and click **Sign in**.

1. In the Use this account everywhere on your device dialog, click **Yes**.

	![Open Screenshot](https://github.com/kemckinnmsft/M365HOL3001/blob/master/Media/m1e7l6ei.jpg)

1. Finally, click **Done** to complete the setup.
1. **Close Microsoft Word**
1. Next, start **Microsoft Outlook** by clicking on the icon in the taskbar.

	![vlu3sb64.jpg](https://github.com/kemckinnmsft/M365HOL3001/blob/master/Media/vlu3sb64.jpg)
1. Click **Connect** and let Outlook configure.  

	>INFO: Login details for **Alan@yourtenant.com** should be automatically populated. If you still see **LabUser@Contoso.com**, close Microsoft Outlook and reopen.
	>
	> If you receive a prompt to choose an account type, click Office 365.
	>
	> ![13mp3hbw.jpg](https://github.com/kemckinnmsft/M365HOL3001/blob/master/Media/13mp3hbw.jpg)

1. Continue to the next step while Outlook configures.
1. Switch to **Client02**, press @lab.CtrlAltDelete, and log in using the username and password below:

	**LabUser**
	
	**Pa$$w0rd**

1. Launch **Microsoft Word**.

	![pxyal6hb.jpg](https://github.com/kemckinnmsft/M365HOL3001/blob/master/Media/pxyal6hb.jpg)
	
	>INFO: When Word opens, you may see a prompt to log into **Microsoft Azure Information Protection**.  You may **close this** and continue.  Azure Information Protection will automatically inherit the settings from Word after reloading.
	>
	> ![3gm9oeee.jpg](https://github.com/kemckinnmsft/M365HOL3001/blob/master/Media/3gm9oeee.jpg)

1. In the upper right, click on **Sign in to get the most out of Office**.
	
	![Open Screenshot](https://github.com/kemckinnmsft/M365HOL3001/blob/master/Media/elavdbu1.jpg)
1. In the Sign in dialog, enter **Amy@yourtenant.com** and press **Next**. 

1. In the Enter password dialog, enter **pass@word1** and click **Sign in**.

1. In the Use this account everywhere on your device dialog, click **Yes**.

	![Open Screenshot](https://github.com/kemckinnmsft/M365HOL3001/blob/master/Media/m1e7l6ei.jpg)

1. Finally, click **Done** to complete the setup.
1. **Close Microsoft Word**
1. Next, start **Microsoft Outlook** by clicking on the icon in the taskbar.

	![vlu3sb64.jpg](https://github.com/kemckinnmsft/M365HOL3001/blob/master/Media/vlu3sb64.jpg)
1. Click **Connect** and let Outlook configure.  

	>INFO: Login details for **Amy@yourtenant.com** should be automatically populated. If you still see **Install@Contoso.com**, close Microsoft Outlook and reopen.
	>
	> If you receive a prompt to choose an account type, click Office 365.
	>
	> ![13mp3hbw.jpg](https://github.com/kemckinnmsft/M365HOL3001/blob/master/Media/13mp3hbw.jpg)

1. Continue to the next step while Outlook configures.
1. Switch to **Client03**, press @lab.CtrlAltDelete, and log in using the username and password below:

	**LabUser**
	
	**Pa$$w0rd**

1. Launch **Microsoft Word**.

	![pxyal6hb.jpg](https://github.com/kemckinnmsft/M365HOL3001/blob/master/Media/pxyal6hb.jpg)
	
	>INFO: When Word opens, you may see a prompt to log into **Microsoft Azure Information Protection**.  You may **close this** and continue.  Azure Information Protection will automatically inherit the settings from Word after reloading.
	>
	> ![3gm9oeee.jpg](https://github.com/kemckinnmsft/M365HOL3001/blob/master/Media/3gm9oeee.jpg)

1. In the upper right, click on **Sign in to get the most out of Office**.
	
	![Open Screenshot](https://github.com/kemckinnmsft/M365HOL3001/blob/master/Media/elavdbu1.jpg)
1. In the Sign in dialog, enter **Eric@yourtenant.com** and press **Next**. 

1. In the Enter password dialog, enter **pass@word1** and click **Sign in**.

1. In the Use this account everywhere on your device dialog, click **Yes**.

	![Open Screenshot](https://github.com/kemckinnmsft/M365HOL3001/blob/master/Media/m1e7l6ei.jpg)

1. Finally, click **Done** to complete the setup.
1. Wait for the Getting Office ready for you dialog to close and then **Close Microsoft Word**
1. Next, start **Microsoft Outlook** by clicking on the icon in the taskbar.

	![vlu3sb64.jpg](https://github.com/kemckinnmsft/M365HOL3001/blob/master/Media/vlu3sb64.jpg)
1. Click **Connect** and let Outlook configure.  

	>INFO: Login details for **Eric@yourtenant.com** should be automatically populated. If you still see **Install@Contoso.com**, close Microsoft Outlook and reopen.
	>
	> If you receive a prompt to choose an account type, click Office 365.
	>
	> ![13mp3hbw.jpg](https://github.com/kemckinnmsft/M365HOL3001/blob/master/Media/13mp3hbw.jpg)


---

# Exercise 4: Testing AIP Policies
[🔙](#azure-information-protection)

Now that you have 3 test systems with users being affected by different policies configured, we can start testing these policies.  This exercise will run through various scenarios to demonstrate the use of AIP global and scoped policies and show the functionality of recommended and automatic labeling.
---
# Testing User Defined Permissions
[🔙](#azure-information-protection)

One of the most common use cases for AIP is the ability to send emails using User Defined Permissions (Do Not Forward). In this task, we will send an email using the Do Not Forward label to test that functionality.


1. On Client03, in Microsoft Outlook, click on the **New email** button.

	![6wan9me1.jpg](https://github.com/kemckinnmsft/M365HOL3001/blob/master/Media/6wan9me1.jpg)

	>INFO: Note that the **Sensitivity** is set to **General** by default.
	>
	> ![5esnhwkw.jpg](https://github.com/kemckinnmsft/M365HOL3001/blob/master/Media/5esnhwkw.jpg)

1. Send an email to **Alan** and **Amy** (**Alan;Amy**). You may **optionally add an external email address** (preferably from a major social provider like gmail, yahoo, or outlook.com) to test the external recipient experience. For the **Subject** and **Body** type **Test Do Not Forward Email**.

	![Open Screenshot](https://github.com/kemckinnmsft/M365HOL3001/blob/master/Media/h0eh40nk.jpg)

1. In the Sensitivity Toolbar, click on the **pencil** icon to change the Sensitivity label.

	![901v6vpa.jpg](https://github.com/kemckinnmsft/M365HOL3001/blob/master/Media/901v6vpa.jpg)

	> NOTE: If the AIP toolbar is not signed in, click **Sign In** and wait for it to use SSO and download policies (about 30 seconds).

1. Click on **Confidential** and then the **Do Not Forward** sub-label and click **Send**.

	![w8j1w1lm.jpg](https://github.com/kemckinnmsft/M365HOL3001/blob/master/Media/w8j1w1lm.jpg)

	>INFO: If you receive the error message below, click on the Confidential \ Contoso Internal sub-label to force the download of your AIP identity certificates, then follow the steps above to change the label to Confidential \ Do Not Forward.
	>
	> ![6v6duzbd.jpg](https://github.com/kemckinnmsft/M365HOL3001/blob/master/Media/6v6duzbd.jpg)

1. Switch over to Client01 or Client02 and review the email in Alan or Amy’s Outlook.  You will notice that the email is automatically shown in Outlook natively.

	![0xby56qt.jpg](https://github.com/kemckinnmsft/M365HOL3001/blob/master/Media/0xby56qt.jpg)

	> NOTE: The **Do Not Forward** protection template will normally prevent the sharing of the screen and taking screenshots when protected documents or emails are loaded.  However, since this screenshot was taken within a VM, the operating system was unaware of the protected content and could not prevent the capture.  
	>
	>It is important to understand that although we put controls in place to reduce risk, if a user has view access to a document or email they can take a picture with their smartphone or even retype the message. That said, if the user is not authorized to read the message then it will not even render and we will demonstrate that next.

	>INFO: If you elected to send a Do Not Forward message to an external email, you will have an experience similar to the images below.  These captures are included to demonstrate the functionality for those that chose not to send an external message.
	>
	> ![tzj04wi9.jpg](https://github.com/kemckinnmsft/M365HOL3001/blob/master/Media/tzj04wi9.jpg)
	> 
	> Here the user has received an email from Eric Grimes and they can click on the **Read the message** button.
	>
	>![wiefwcho.jpg](https://github.com/kemckinnmsft/M365HOL3001/blob/master/Media/wiefwcho.jpg)
	>
	>Next, the user is given the option to either log in using the social identity provider (**Sign in with Google**, Yahoo, Microsoft Account), or to **sign in with a one-time passcode**.
	>
	>If they choose the social identity provider login, it should use the token previously cached by their browser and display the message directly.
	>
	>If they choose one-time passcode, they will receive an email like the one below with the one-time passcode.
	>
	>![m6voa9xi.jpg](https://github.com/kemckinnmsft/M365HOL3001/blob/master/Media/m6voa9xi.jpg)
	>
	>They can then use this code to authenticate to the Office 365 Message Encryption portal.
	>
	>![8pllxint.jpg](https://github.com/kemckinnmsft/M365HOL3001/blob/master/Media/8pllxint.jpg)
	>
	>After using either of these authentication methods, the user will see a portal experience like the one shown below.
	>
	>![3zi4dlk9.jpg](https://github.com/kemckinnmsft/M365HOL3001/blob/master/Media/3zi4dlk9.jpg)
---

# Testing Global Policy
[🔙](#azure-information-protection)

In this task, we will create a document and send an email to demonstrate the functionality defined in the Global Policy.

1. Switch to Client03.
1. In Microsoft Outlook, click on the **New email** button.

	![Open Screenshot](https://github.com/kemckinnmsft/M365HOL3001/blob/master/Media/6wan9me1.jpg)

1. Send an email to Alan, Amy, and yourself (**Alan;Amy;@lab.User.Email**).  For the **Subject** and **Body** type **Test Contoso Internal Email**.

	![Open Screenshot](https://github.com/kemckinnmsft/M365HOL3001/blob/master/Media/9gkqc9uy.jpg)

1. In the Sensitivity Toolbar, click on the **pencil** icon to change the Sensitivity label.

	![Open Screenshot](https://github.com/kemckinnmsft/M365HOL3001/blob/master/Media/901v6vpa.jpg)

1. Click on **Confidential** and then **Contoso Internal** and click **Send**.

	![Open Screenshot](https://github.com/kemckinnmsft/M365HOL3001/blob/master/Media/yhokhtkv.jpg)
1. On Client01 or Client02, observe that you are able to open the email natively in the Outlook client. Also observe the **header text** that was defined in the label settings.

	![bxz190x2.jpg](https://github.com/kemckinnmsft/M365HOL3001/blob/master/Media/bxz190x2.jpg)
	
1. In your email, note that you will be unable to open this message.  This experience will vary depending on the client you use (the image below is from Outlook 2016 for Mac) but they should have similar messages after presenting credentials. Since this is not the best experience for the recipient, later in the lab we will configure Exchange Online Mail Flow Rules to prevent content classified with internal only labels from being sent to external users.
	
	![52hpmj51.jpg](https://github.com/kemckinnmsft/M365HOL3001/blob/master/Media/52hpmj51.jpg)

---

# Testing Scoped Policy
[🔙](#azure-information-protection)

In this task, we will create a document and send an email from one of the users in the Legal group to demonstrate the functionality defined in the first exercise. We will also show the behavior of the No Default Label policy on documents.

1. Switch to Client01.
1. In Microsoft Outlook, click on the **New email** button.
	
	![Open Screenshot](https://github.com/kemckinnmsft/M365HOL3001/blob/master/Media/ldjugk24.jpg)
	
1. Send an email to Amy and Eric (**Amy Albers;Eric Gruber**).  For the **Subject** and **Body** type **Test Highly Confidential Legal Email**.
1. In the Sensitivity Toolbar, click on **Highly Confidential** and the **Legal Only** sub-label, then click **Send**.

	![Open Screenshot](https://github.com/kemckinnmsft/M365HOL3001/blob/master/Media/ny1lwv0h.jpg)
1. Switch to Client02 and click on the email.  You should be able to open the message natively in the client as Amy.

	![qeqtd2yr.jpg](https://github.com/kemckinnmsft/M365HOL3001/blob/master/Media/qeqtd2yr.jpg)
1. Switch to Client03 and click on the email. You should be unable to open the message as Eric.

	![6y99u8cl.jpg](https://github.com/kemckinnmsft/M365HOL3001/blob/master/Media/6y99u8cl.jpg)

	>INFO: You may notice that the Office 365 Message Encryption wrapper message is displayed in the preview pane.  It is important to note that the content of the email is not displayed here.  The content of the message is contained within the encrypted message.rpmsg attachment and only authorized users will be able to decrypt this attachment.
	>
	>![w4npbt49.jpg](https://github.com/kemckinnmsft/M365HOL3001/blob/master/Media/w4npbt49.jpg)
	>
	>If an unauthorized recipient clicks on **Read the message** to go to the OME portal, they will be presented with the same wrapper message.  Like the external recipient from the previous task, this is not an ideal experience. So, you may want to use a mail flow rule to manage scoped labels as well.
	>
	>![htjesqwe.jpg](https://github.com/kemckinnmsft/M365HOL3001/blob/master/Media/htjesqwe.jpg)

1. On Client01, open **Microsoft Word**.
1. Create a new **Blank document** and type **This is a test document** and **save the document**.

	> WARNING: When you click **Save**, you will be prompted to choose a classification.  This is a result of having **None** set as the default label in the scoped policy while requiring all documents to be labeled.  This is a useful for driving **active classification decisions** by specific groups within your organization.  Notice that Outlook still has a default of **General** because of the Advanced setting we added to the scoped policy.  **This is recommended** because user send many more emails each day than they create documents. Actively forcing users to classify each email would be an unpleasant user experience whereas they are typically more understanding of having to classify each document if they are in a sensitive department or role.

1. Choose a classification to save the document.
---

# Testing Recommended and Automatic Classification
[🔙](#azure-information-protection)

In this task, we will test the configured recommended and automatic conditions we defined in Exercise 1.  Recommended conditions can be used to help organically train your users to classify sensitive data appropriately and provides a method for testing the accuracy of your dectections prior to switching to automatic classification.  Automatic conditions should be used after thorough testing or with items you are certain need to be protected. Although the examples used here are fairly simple, in production these could be based on complex regex statements or only trigger when a specific quantity of sensitive data is present.

1. Switch to Client03 and launch **Microsoft Word**.
1. In Microsoft Word, create a new **Blank document** and type **My AMEX card number is 344047014854133. The expiration date is 09/28, and the CVV is 4368** and **save** the document.

	> NOTE: This card number is a fake number that was generated using the Credit Card Generator for Testing at [https://developer.paypal.com/developer/creditCardGenerator/](https://developer.paypal.com/developer/creditCardGenerator/).  The Microsoft Classification Engine uses the Luhn Algorithm to prevent false positives so when testing, please make sure to use valid numbers.

1. Notice that you are prompted with a recommendation to change the classification to Confidential \ Contoso Internal. Click on **Change now** to set the classification and protect the document.

	![url9875r.jpg](https://github.com/kemckinnmsft/M365HOL3001/blob/master/Media/url9875r.jpg)
	>INFO: Notice that, like the email in Task 2 of this exercise, the header value configured in the label is added to the document.
	>
	>![dcq31lz1.jpg](https://github.com/kemckinnmsft/M365HOL3001/blob/master/Media/dcq31lz1.jpg)
1. In Microsoft Word, create a new **Blank document** and type **my password is pass@word1** and **save** the document.

	>NOTE: Notice that the document is automatically classified and protected wioth the Highly Confidential \ All Employees label.
	>
	>![6vezzlnj.jpg](https://github.com/kemckinnmsft/M365HOL3001/blob/master/Media/6vezzlnj.jpg)
1. Next, in Microsoft Outlook, click on the **New email** button.
	
	![Open Screenshot](https://github.com/kemckinnmsft/M365HOL3001/blob/master/Media/ldjugk24.jpg)
	
1. Draft an email to Amy and Alan (**Amy;Alan**).  For the **Subject** and **Body** type **Test Highly Confidential All Employees Automation**.

	![Open Screenshot](https://github.com/kemckinnmsft/M365HOL3001/blob/master/Media/4v3wrrop.jpg)
1. Attach the **second document you created** to the email.

	![823tzyfd.jpg](https://github.com/kemckinnmsft/M365HOL3001/blob/master/Media/823tzyfd.jpg)

	> NOTE: Notice that the email was automatically classified as Highly Confidential \ All Employees.  This functionality is highly recommended because matching the email classification to attachments provides a much more cohesive user experience and helps to prevent inadvertent information disclosure in the body of sensitive emails.
	>
	>![yv0afeow.jpg](https://github.com/kemckinnmsft/M365HOL3001/blob/master/Media/yv0afeow.jpg)

1. In the email, click **Send**.
---

# Exercise 5: Exchange Online IRM Capabilities
[🔙](#azure-information-protection)

Exchange Online can work in conjunction with Azure Information Protection to provide advanced capabilities for protecting sensitive data being sent over email.  You can also manage the flow of classified content to ensure that it is not sent to unintended recipients.  

## Configuring Exchange Online Mail Flow Rules

In this task, we will configure a mail flow rule to detect sensitive information traversing the network in the clear and encrypt it using the Encrypt Only RMS Template.  We will also create a mail flow rule to prevent messages classified as Confidential \ Contoso Internal from being sent to external recipients.

1. Switch to Client01 and open an **Admin PowerShell Prompt**.

1. Type the commands below to connect to an Exchange Online PowerShell session.  Use the credentials provided when prompted.

	```
	Set-ExecutionPolicy RemoteSigned
	```

	```
	$UserCredential = Get-Credential
	```

	**Global Admin Username**

	**Global Admin Password**

	```
	$Session = New-PSSession -ConfigurationName Microsoft.Exchange -ConnectionUri https://outlook.office365.com/powershell-liveid/ -Credential $UserCredential -Authentication Basic -AllowRedirection
	Import-PSSession $Session
	```

1. Create a new Exchange Online Mail Flow Rule using the code below:

	```
	New-TransportRule -Name "Encrypt external mails with sensitive content" -SentToScope NotInOrganization -ApplyRightsProtectionTemplate "Encrypt" -MessageContainsDataClassifications @(@{Name="ABA Routing Number"; minCount="1"},@{Name="Credit Card Number"; minCount="1"},@{Name="Drug Enforcement Agency (DEA) Number"; minCount="1"},@{Name="International Classification of Diseases (ICD-10-CM)"; minCount="1"},@{Name="International Classification of Diseases (ICD-9-CM)"; minCount="1"},@{Name="U.S. / U.K. Passport Number"; minCount="1"},@{Name="U.S. Bank Account Number"; minCount="1"},@{Name="U.S. Individual Taxpayer Identification Number (ITIN)"; minCount="1"},@{Name="U.S. Social Security Number (SSN)"; minCount="1"})
	```

	>[!KNOWLEDGE] This mail flow rule can be used to encrypt sensitive data leaving via email.  This can be customized to add additional sensitive data types.
	
	> NOTE: Next, we need to capture the **Label ID** for the **Confidential \ Contoso Internal** label. 

1. Switch to the Azure Portal and under **classifications** click on Labels, then expand **Confidential** and click on **Contoso Internal**.

	![w2w5c7xc.jpg](https://github.com/kemckinnmsft/M365HOL3001/blob/master/Media/w2w5c7xc.jpg)

	> NOTE: If you closed the azure portal, open an Edge InPrivate window and navigate to **https://portal.azure.com**.

1. In the Label: Contoso Internal blade, scroll down to the Label ID and **copy** the value.

	![lypurcn5.jpg](https://github.com/kemckinnmsft/M365HOL3001/blob/master/Media/lypurcn5.jpg)

	> WARNING: Make sure that there are no spaces before or after the Label ID as this will cause the mail flow rule to be ineffective.

1. Next, return to the PowerShell window and type ```$labelid = "``` then paste the **LabelID** for the **Contoso Internal** label, type **"**, and press **Enter**.
1. Now, create another Exchange Online Mail Flow Rule using the code below:

	```
	$labeltext = "MSIP_Label_"+$labelid+"_enabled=true"
	New-TransportRule -name "Block Confidential Contoso Internal" -SentToScope notinorganization -HeaderContainsMessageHeader  "msip_labels" -HeaderContainsWord $labeltext -RejectMessageReasonText “Contoso internal messages cannot be sent to external recipients.”
	```

	>[!KNOWLEDGE] This mail flow rule can be used to prevent inter only communications from being sent to an external audience.

---

# Demonstrating Exchange Online Mail Flow Rules
[🔙](#azure-information-protection)

In this task, we will send emails to demonstrate the results of the Exchange Online mail flow rules we configured in the previous task.  This will demonstrate some ways to protect your sensitive data and ensure a positive user experience with the product.

1. Switch to Client03.
1. In Microsoft Outlook, click on the **New email** button.

	![Open Screenshot](https://github.com/kemckinnmsft/M365HOL3001/blob/master/Media/6wan9me1.jpg)

1. Send an email to Alan, Amy, and yourself (**Alan;Amy;@lab.User.Email**).  For the **Subject**, type **Test Credit Card Email** and for the **Body**, type **My AMEX card number is 344047014854133. The expiration date is 09/28, and the CVV is 4368**, then click **Send**.

	>INFO: Notice that there is a policy tip that has popped up to inform you that there is a credit card number in the email and it is being shared outside the organization.  This type of policy tip can be defined with the Office 365 Security and Compliance center and was pre-staged in the demo tenants we are using.  

1. Switch to Client01 and review the received email.

	![pidqfaa1.jpg](https://github.com/kemckinnmsft/M365HOL3001/blob/master/Media/pidqfaa1.jpg)

	>INFO: Note that there is no encryption applied to the message.  That is because we set up the rule to only apply to external recipients.  If you were to leave that condition out of the mail flow rule, internal recipients would also receive an encrypted copy of the message.  The image below shows the encrypted message that was received externally.
	>
	>![c5foyeji.jpg](https://github.com/kemckinnmsft/M365HOL3001/blob/master/Media/c5foyeji.jpg)
	>
	>Below is another view of the same message received in Outlook Mobile on an iOS device.
	>
	>![599ljwfy.jpg](https://github.com/kemckinnmsft/M365HOL3001/blob/master/Media/599ljwfy.jpg)

	>NOTE: Note that you have received a message from your DLP policy stating that the email was not sent to the external recipient because it contained a credit card number.

1. On Client 1, @[Click here](`cmd.exe/c start shell:AppsFolder\Microsoft.MicrosoftEdge_8wekyb3d8bbwe!MicrosoftEdge -private https://protection.office.com`) to open an Edge InPrivate window to **https://protection.office.com**.
1. In the Security and Compliance Center, expand **Data loss prevention** and click on **Policy**.  Then, in the Policy blade, click on the **Default Office 365 DLP Policy**.
	
	![a2m7ryn4.jpg](https://github.com/kemckinnmsft/M365HOL3001/blob/master/Media/a2m7ryn4.jpg)
1. In the Default Office 365 DLP Policy blade, next to Policy settings, click **Edit**.

	![jsdej5i4.jpg](https://github.com/kemckinnmsft/M365HOL3001/blob/master/Media/jsdej5i4.jpg)
1. In the Editing policy settings blade, disable the switch next to **Items containing 1-9 credit card numbers shared externally** and click **Save**.

![5y5gg696.jpg](https://github.com/kemckinnmsft/M365HOL3001/blob/master/Media/5y5gg696.jpg)
1. Return to Client03.
1. In Microsoft Outlook, click on the **New email** button.

	![Open Screenshot](https://github.com/kemckinnmsft/M365HOL3001/blob/master/Media/6wan9me1.jpg)

1. Send an new email to Alan, Amy, and yourself (**Alan;Amy;@lab.User.Email**).  For the **Subject**, type **Test Credit Card Email 2** and for the **Body**, type **My AMEX card number is 344047014854133. The expiration date is 09/28, and the CVV is 4368**, then click **Send**.
	>NOTE: If you still receive a rejection, please wait a few minutes and try again.

	>[!Knowledge] Notice that you do not receive the error messag this time.  Log into your personal email and you will see that the email has been encrypted in transit by the Exchange Online Mail Flow Rule defined in the previous exercise.
1. Next, in Microsoft Outlook, click on the **New email** button.

	![Open Screenshot](https://github.com/kemckinnmsft/M365HOL3001/blob/master/Media/6wan9me1.jpg)
1. Send an email to Alan, Amy, and yourself (**Alan;Amy;@lab.User.Email**).  For the **Subject** and **Body** type **Another Test Contoso Internal Email**.

	![Open Screenshot](https://github.com/kemckinnmsft/M365HOL3001/blob/master/Media/d476fmpg.jpg)

1. In the Sensitivity Toolbar, click on the **pencil** icon to change the Sensitivity label.

	![Open Screenshot](https://github.com/kemckinnmsft/M365HOL3001/blob/master/Media/901v6vpa.jpg)

1. Click on **Confidential** and then **Contoso Internal** and click **Send**.

	![Open Screenshot](https://github.com/kemckinnmsft/M365HOL3001/blob/master/Media/yhokhtkv.jpg)
1. In about a minute, you should receive an **Undeliverable** message from Exchange with the users that the message did not reach and the message you defined in the previous task.

	![kgjvy7ul.jpg](https://github.com/kemckinnmsft/M365HOL3001/blob/master/Media/kgjvy7ul.jpg)

> NOTE: There are many other use cases for Exchange Online mail flow rules but this should give you a quick view into what is possible and how easy it is to improve the security of your sensitive data through the use of Exchange Online mail flow rules and Azure Information Protection.

---


# Exercise 6: Classification, Labeling, and Protection with the Azure Information Protection Scanner
[🔙](#azure-information-protection)

The Azure Information Protection scanner allows you to  classify and protect sensitive information stored in on-premises CIFS file shares and SharePoint sites.  

In this exercise, you will use the information gathered in Exercise 1 to map sensitive data types discovered to automatic classification rules.  After that, we will run the AIP Scanner in enforce mode to classify and protect the identified sensitive data.

---

# Configuring Automatic Conditions
[🔙](#azure-information-protection)
 
Now that we know what types of sensitive data we need to protect, we will configure some automatic conditions (rules) that the scanner can use to classify and protect content.

1. Switch back to Client01 and open the browser that is logged into the Azure Portal.

1. Under **Dashboards** on the left, click on **Data discovery (Preview)** to view the data collected by the AIP scanner discovery mode run.

	>WARNING: Due to lab environment infrastructure constraints, it is possible that the data will not fully populate by the time you reach this point in the lab. Please continue through the steps using the provided information.  If you set this up in an external lab environment, these steps will work as described.

1. In the Information Types panel, you will see the types of sensitive data that was found during the initial discovery run. We will use a few of these to create Automatic Conditions.

	![x4w16p5g.jpg](https://github.com/kemckinnmsft/M365HOL3001/blob/master/Media/x4w16p5g.jpg)

1. Under **Classifications** on the left, click **Labels** then expand **Confidential**, and click on **Contoso Internal**.

	![Open Screenshot](https://github.com/kemckinnmsft/M365HOL3001/blob/master/Media/jyw5vrit.jpg)
1. In the Label: Contoso Internal blade, scroll down to the **Configure conditions for automatically applying this label** section, and click on **+ Add a new condition**.

	![cws1ptfd.jpg](https://github.com/kemckinnmsft/M365HOL3001/blob/master/Media/cws1ptfd.jpg)
1. In the Condition blade, in the **Select information types** search box, type **International** and check the box next to the **International Classification of Diseases (ICD-10-CM)** entry.

	![Open Screenshot](https://github.com/kemckinnmsft/M365HOL3001/blob/master/Media/j163rbh7.jpg)
1. Next, before saving, replace International in the search bar with **EU** and check the boxes next to the **items shown below**.

	![xaj5hupc.jpg](https://github.com/kemckinnmsft/M365HOL3001/blob/master/Media/xaj5hupc.jpg)
1. Click **Save** in the Condition blade and **OK** to the Save settings prompt.

	![Open Screenshot](https://github.com/kemckinnmsft/M365HOL3001/blob/master/Media/41o5ql2y.jpg)
1. In the Label : Contoso Internal blade, under **Select how this label is applied: automatically or recommended to user**, click **Automatic**.

	![Open Screenshot](https://github.com/kemckinnmsft/M365HOL3001/blob/master/Media/1ifaer4l.jpg)

1. Click **Save** in the Label: Contoso Internal blade and **OK** to the Save settings prompt.

	![Open Screenshot](https://github.com/kemckinnmsft/M365HOL3001/blob/master/Media/rimezmh1.jpg)

1. Press the **X** in the upper right-hand corner to close the Label: Contoso Internal blade.

---

# Enforcing Configured Rules
[🔙](#azure-information-protection)
 
In this task, we will set the AIP scanner to enforce the conditions we set up in the previous task and have it rerun on all files using the Start-AIPScan command.

1. Switch to Scanner01
1. Run the commands below to run an enforced scan using defined policy.

    ```
	Set-AIPScannerConfiguration -Enforce On -DiscoverInformationTypes PolicyOnly
	```
	```
	Start-AIPScan
    ```

	> NOTE: Note that this time we used the DiscoverInformationTypes -PolicyOnly switch before starting the scan. This will have the scanner only evaluate the conditions we have explicitly defined in conditions.  This increases the effeciency of the scanner and thus is much faster.  After reviewing the event log we will see the result of the enforced scan.
	>
	>![k3rox8ew.jpg](https://github.com/kemckinnmsft/M365HOL3001/blob/master/Media/k3rox8ew.jpg)
	>
	>If we switch back to Client03 and look in the reports directory we opened previously at **\\\Scanner01\c$\users\aipscanner\AppData\Local\Microsoft\MSIP\Scanner\Reports**, you will notice that the old scan reports are zipped in the directory and only the most recent results aare showing.  
	>
	>![s8mn092f.jpg](https://github.com/kemckinnmsft/M365HOL3001/blob/master/Media/s8mn092f.jpg)
	>
	>Also, the DetailedReport.csv now shows the files that were protected.
	>
	>
	>![6waou5x3.jpg](https://github.com/kemckinnmsft/M365HOL3001/blob/master/Media/6waou5x3.jpg)
	>
	>![Open Fullscreen](6waou5x3.jpg)

---

# Reviewing Protected Documents
[🔙](#azure-information-protection)

Now that we have Classified and Protected documents using the scanner, we can review the documents we looked at previously to see their change in status.

1. Switch to Client01.
 
2.  Navigate to **\\\Scanner01\documents**. Provide the credentials **Contoso\LabUser** and **Pa$$w0rd** if prompted.
 
	![Open Screenshot](https://github.com/kemckinnmsft/M365HOL3001/blob/master/Media/hipavcx6.jpg)
3.  Open one of the Contoso Purchasing Permissions documents or Run For The Cure spreadsheets.
 
 	
	
	> NOTE: Observe that the same document is now classified as Confidential \ Contoso Internal. 
	>
	>![s1okfpwu.jpg](https://github.com/kemckinnmsft/M365HOL3001/blob/master/Media/s1okfpwu.jpg)


---

# Exercise 7: Security and Compliance Center
[🔙](#azure-information-protection)

In this exercise, we will migrate your AIP Labels and activate them in the Security and Compliance Center.  This will allow you to see the labels in Microsoft Information Protection based clients such as Office 365 for Mac and Mobile Devices.

Although we will not be demonstrating these capabilities in this lab, you can use the tenant information provided to test on your own devices.
 

---
# Activating Unified Labeling
[🔙](#azure-information-protection)
 
In this task, we will activate the labels from the Azure Portal for use in the Security and Compliance Center.

1. On Client01, navigate to **https://portal.azure.com/?ActivateMigration=true#blade/Microsoft_Azure_InformationProtection/DataClassGroupEditBlade/migrationActivationBlade**

1. Click **Activate** and **Yes**.

	![o0ahpimw.jpg](https://github.com/kemckinnmsft/M365HOL3001/blob/master/Media/o0ahpimw.jpg)
	>NOTE: If Activation fails it is likely because of network latency in the lab environment. Browse to **https://protection.office.com/#/tagslibrary** to check if the migration succeeded. In a full demo tenant this should complete successfully.  More detail is available at [https://aka.ms/aipmigration](https://aka.ms/aipmigration).
---
# Exercise 8: SharePoint IRM Configuration
[🔙](#azure-information-protection)

In this exercise, you will configure SharePoint Online Information Rights Management (IRM) and configure a document library with an IRM policy to protect documents that are downloaded from that library.

---
# Enable Information Rights Management in SharePoint Online
[🔙](#azure-information-protection)
 
In this task, we will enable Information Rights Management in SharePoint Online.

1. Switch to Client03, click @lab.CtrlAltDelete and use the credentials below to log in.

	**LabUser**

	**Pa$$w0rd**

1. Launch an Edge InPrivate session to **https://admin.microsoft.com/AdminPortal/Home#/**.
 
1. If needed, log in using the credentials below:

	 **Global Admin Username**
	 
	 **Global Admin Password**
 
1. Hover over the **Admin centers** section of the bar on the left and choose **SharePoint**.

	![r5a21prc.jpg](https://github.com/kemckinnmsft/M365HOL3001/blob/master/Media/r5a21prc.jpg)
 
1. In the SharePoint admin center click on **settings**.

1. Scroll down to the Information Rights Management (IRM) section and select the option button for **Use the IRM service specified in your configuration**.
 
1. Click the **Refresh IRM Settings** button.

	![1qv8p13n.jpg](https://github.com/kemckinnmsft/M365HOL3001/blob/master/Media/1qv8p13n.jpg)

	>NOTE: After the browser refreshes, you can scroll down to the same section and you will see a message stating **We successfully refreshed your setings.**
	>
	>![daeglgk9.jpg](https://github.com/kemckinnmsft/M365HOL3001/blob/master/Media/daeglgk9.jpg)
1. Scroll down and click **OK**.
1. Next, navigate to **https://admin.microsoft.com/AdminPortal/Home#/users**.
1. Click on **Nuck Chorris** and on the profile page, next to Roles, click **Edit**.

	![df6t9nk1.jpg](https://github.com/kemckinnmsft/M365HOL3001/blob/master/Media/df6t9nk1.jpg)
1. On the Edit user roles page, select **Customized administrator**, check the box next to **SharePoint administrator**, and click **Save**.

	![3rj47ym9.jpg](https://github.com/kemckinnmsft/M365HOL3001/blob/master/Media/3rj47ym9.jpg)
1. **Close the Edge InPrivate browser** window to **clear the credentials**.

 
---

# Site Creation and Information Rights Management Integration
[🔙](#azure-information-protection)
 
In this task, we will create a new SharePoint site and enable Information Rights Management in a document library.

1. Launch a new Edge InPrivate session to **https://portal.office.com**.
1. Log in using the credentials below:

	**NuckC@yourtenant.com**

	**NinjaCat123**
1. Click on **SharePoint** in the list.

	![twsp6mvj.jpg](https://github.com/kemckinnmsft/M365HOL3001/blob/master/Media/twsp6mvj.jpg)

1. Dismiss any introductory screens and, at the top of the page, click **+Create site**.

	![7v8wctu2.jpg](https://github.com/kemckinnmsft/M365HOL3001/blob/master/Media/7v8wctu2.jpg)
 
1. On the Create a site page, click **Team site**.

	![Open Screenshot](https://github.com/kemckinnmsft/M365HOL3001/blob/master/Media/406ah98f.jpg)
 
1. On the next page, type **IRM Demo** for **Site name** and for the **Site description**, type **This is a team site for demonstrating SharePoint IRM capabilities** and set the **Privacy settings** to **Public - anyone in the organization can access the site** and click **Next**.

	![Open Screenshot](https://github.com/kemckinnmsft/M365HOL3001/blob/master/Media/ug4tg8cl.jpg)

1. On the Add group members page, click **Finish**.
1. In the newly created site, on the left navigation bar, click **Documents**.

	![Open Screenshot](https://github.com/kemckinnmsft/M365HOL3001/blob/master/Media/yh071obk.jpg)
 
1. In the upper right-hand corner, click the **Settings icon** and click **Library settings**.

	![1qo31rp6.jpg](https://github.com/kemckinnmsft/M365HOL3001/blob/master/Media/1qo31rp6.jpg)
 
1. On the Documents > Settings page, under **Permissions and Management**, click **Information Rights Management**.

	![ie2rmsk2.jpg](https://github.com/kemckinnmsft/M365HOL3001/blob/master/Media/ie2rmsk2.jpg)
 
1. On the Settings > Information Rights Management Settings page, check the box next to Restrict permissions on this library on download and under **Create a permission policy title** type **Contoso IRM Policy**, and under **Add a permission policy description** type **This content contained within this file is for use by Contoso Corporation employees only.**
 
	![Open Screenshot](https://github.com/kemckinnmsft/M365HOL3001/blob/master/Media/m9v7v7ln.jpg)
1. Next, click on **SHOW OPTIONS** below the policy description and in the **Set additional IRM library settings** section, check the boxes next to **Do not allow users to upload documents that do not support IRM** and **Prevent opening documents in the browser for this Document Library**.

	![0m2qqtqn.jpg](https://github.com/kemckinnmsft/M365HOL3001/blob/master/Media/0m2qqtqn.jpg)
	>[!KNOWLEDGE] These setting prevent the upload of documents that cannot be protected using Information Rights Managment (Azure RMS) and forces protected documents to be opened in the appropriate application rather than rendering in the SharePoint Online Viewer.
 
1. Next, under the **Configure document access rights** section, check the box next to **Allow viewers to run script and screen reader to function on downloaded documents**.

	![72fkz2ds.jpg](https://github.com/kemckinnmsft/M365HOL3001/blob/master/Media/72fkz2ds.jpg)
	>NOTE: Although this setting may reduce the security of the document, this is typically provided for accessibility purposes.
1. Finally, in the **Configure document access rights** section, check the box next to  **Users must verify their credentials using this interval (days)** and type **7** in the text box.

	![tt1quq3f.jpg](https://github.com/kemckinnmsft/M365HOL3001/blob/master/Media/tt1quq3f.jpg)
1. At the bottom of the page, click **OK** to complete the configuration of the protected document library.
1. On the Documents > Settings page, in the left-hand navigation pane, click on **Documents** to return to the document library. section.
 
1. Leave the browser open and continue to the next task.
 
---

# Uploading Content to the Document Library
[🔙](#azure-information-protection)
 
Create an unprotected Word document, label it as Internal, and upload it to the document library. 

1. Launch **Microsoft Word**.
1. Create a new **Blank document**.

	>NOTE: Notice that by default the document is labeled as the unprotected classification **General**.
 
1. In the Document, type **This is a test document**.
 
1. **Save** the document and **close Microsoft Word**.
1. Return to the IRM Demo protected document library and click on **Upload > Files**.

	![m95ixvv1.jpg](https://github.com/kemckinnmsft/M365HOL3001/blob/master/Media/m95ixvv1.jpg)
1. Navigate to the location where you saved the document, select it and click **Open** to upload the file.
 
	>NOTE: Note that despite this document being labeled, the Sensitivity is not listed.
 
1. To resolve this, on the right-hand side of the document library, click on the **+ Add column** header and click on **More...**.

	![y8h1vf7o.jpg](https://github.com/kemckinnmsft/M365HOL3001/blob/master/Media/y8h1vf7o.jpg)
1. In the Settings > Create Column page, under **Column name:**, type **Sensitivity**.  Verify that **The type of information in this column is:** is set to **Single line of text**, and click **OK**. 

	![66hzke2b.jpg](https://github.com/kemckinnmsft/M365HOL3001/blob/master/Media/66hzke2b.jpg)
1. In the document library, click on the **Show actions** button to the right of the uploaded document and click **Delete**.

	![gt7sjulo.jpg](https://github.com/kemckinnmsft/M365HOL3001/blob/master/Media/gt7sjulo.jpg)
	>NOTE: This is only necessary to expedite the appearance of the Sensitivity metadata.  In production, this would be unnecessary.
1. Re-upload the document and you will see that the Sensitivity column is populated.

	![0yr96t56.jpg](https://github.com/kemckinnmsft/M365HOL3001/blob/master/Media/0yr96t56.jpg)
1. Next, minimize the browser window and right-click on the desktop. Hover over **New >** and click on **Microsoft Access Database**. Name the database **BadFile**.

	![e3nxt4a2.jpg](https://github.com/kemckinnmsft/M365HOL3001/blob/master/Media/e3nxt4a2.jpg)
1. Return to the document library and attempt to upload the file.

	>[!KNOWLEDGE] Notice that you are unable to upload the file because it cannot be protected.
	>	
	>![432hu3pi.jpg](https://github.com/kemckinnmsft/M365HOL3001/blob/master/Media/432hu3pi.jpg)
---

# SharePoint IRM Functionality
[🔙](#azure-information-protection)
 
Files that are uploaded to a SharePoint IRM protected document library are protected upon download based on the user's access rights to the document library.  In this task, we will share a document with Amy Alberts and review the access rights provided.

1. Select the uploaded document and click **Share** in the action bar.

	![1u2jsod7.jpg](https://github.com/kemckinnmsft/M365HOL3001/blob/master/Media/1u2jsod7.jpg)
1. In the Send Link dialog, type **Amy** and click on **Amy Alberts** then **Send**.

	![j6w1v4z9.jpg](https://github.com/kemckinnmsft/M365HOL3001/blob/master/Media/j6w1v4z9.jpg)
1. Switch to Client02.
1. Open Outlook and click on the email from CIE Administrator, then click on the **Open** link.

	![Open Screenshot](https://github.com/kemckinnmsft/M365HOL3001/blob/master/Media/v39ez284.jpg)
1. This will launch the IRM Demo document library.  Click on the document to open it in Microsoft Word.

	![xmv9dmvk.jpg](https://github.com/kemckinnmsft/M365HOL3001/blob/master/Media/xmv9dmvk.jpg)
1. After the document opens, you will be able to observe that it is protected.  Click on the View Permissions button to review the restrictions set on the document.

	![4uya6mro.jpg](https://github.com/kemckinnmsft/M365HOL3001/blob/master/Media/4uya6mro.jpg)
	>NOTE: These permissions are based on the level of access that they user has to the document library.  In a production environment most users would likely have less rights than shown in this example.

---
# Windows Defender Advanced Threat Protection
[🔙](#introduction)

## Link Windows Defender ATP Licenses

In this task, we will link Windows Defender ATP licenses to your demo tenant.

1. Log into Client01 using the credentials below:

	**LabUser**

	**Pa$$w0rd**
1. Right-click on **Edge** in the taskbar and click on **New InPrivate window**.

1. In the InPrivate window, use the provided Windows Defender Advanced Threat Protection Trial Sign up link.

1. Click **Sign in** and use the credentials below:

	**Global Admin Username**

	**Global Admin Password**

	>INFO: If you were already signed into your tenant with Global Admin credentials, you will see an image like the one below.  Click **Yes, add it to my account**.
	>
	> ![upx8fn9o.jpg](https://github.com/kemckinnmsft/M365HOL3001/blob/master/Media/upx8fn9o.jpg)
1. On the Check out page, click **Try now**.

	![wlgzkp40.jpg](https://github.com/kemckinnmsft/M365HOL3001/blob/master/Media/wlgzkp40.jpg)
1. On the Order Receipt page, click **Continue**.

1. Next, navigate to **https://admin.microsoft.com/AdminPortal/Home#/users**.

1. If necessary, log in using the credentials below:

	**Global Admin Username**

	**Global Admin Password**
1. Click on MOD Administrator, and in the details page, click **Edit** next to Product licenses.

	![fe5k7wwn.jpg](https://github.com/kemckinnmsft/M365HOL3001/blob/master/Media/fe5k7wwn.jpg)
1. Toggle the **WD ATP** license to On and click **Save**.

	![6crecugz.jpg](https://github.com/kemckinnmsft/M365HOL3001/blob/master/Media/6crecugz.jpg)
	> NOTE: This license allows up to 100 systems to connect to the WD ATP service.
---
# Windows Defender ATP Onboarding
[🔙](#introduction)

In this task, we will perform initial setup of WD ATP and onboard 2 machines.

1. On Client01, navigate to **https://securitycenter.windows.com**.

1. If necessary, log in using the credentials below:

	**Global Admin Username**

	**Global Admin Password**

1. On Step 1, click **Next**.
1. On Step 2, choose a data storage location and click **Next**.
1. On Step 3, click **Next** several times until the Create your cloud instance dialog pops up, then click **Continue**.
1. On Step 4, click the **Download package** button and save the package to your desktop.
1. Right-click on **WindowsDefenderATPLocalOnboardingScript** and click **Run as Administrator**.
1. In the Windows protected your PC dialog, click the **More info** link and click **Run anyway**.
1. In the UAC prompt, provide the credentials below and press OK.

	**.\ContosoAdmin**

	**Password123!@#**
1. Press **(Y)** to confirm onboarding.
1. Browse to **\\\Contosodc\sysvol\Contoso.Azure\scripts** and copy the onboarding package there.
1. Switch to VictimPC and log in with the credentials below.

	**.\ContosoAdmin**

	**Password123!@#**

1. Browse to **\\\Contosodc\sysvol\Contoso.Azure\scripts** and log in using the credentials below.

	**JeffV**

	**Password$fun**

1. Copy **WindowsDefenderATPLocalOnboardingScript** to the desktop.
1. Right-click on the start menu and click on **Windows PowerShell (Admin)**.
1. In the UAC prompt, provide the credentials below and press OK.

	**.\ContosoAdmin**

	**Password123!@#**
1. Type **CD ~\\Desktop** and press **Enter**.
1. Type **.\WindowsDefenderATPLocalOnboardingScript.cmd** and press **Enter**.
1. Press **(Y)** to confirm onboarding.
1. Open a PowerShell window and run the code below:

	
	**[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12;$xor = [System.Text.Encoding]::UTF8.GetBytes('WinATP-Intro-Injection');$base64String = (Invoke-WebRequest -URI https://winatpmanagement.windows.com/client/management/static/WinATP-Intro-Fileless.txt -UseBasicParsing).Content;Try{ $contentBytes = [System.Convert]::FromBase64String($base64String) } Catch { $contentBytes = [System.Convert]::FromBase64String($base64String.Substring(3)) };$i = 0; $decryptedBytes = @();$contentBytes.foreach{ $decryptedBytes += $_ -bxor $xor[$i]; $i++; if ($i -eq $xor.Length) {$i = 0} };Invoke-Expression ([System.Text.Encoding]::UTF8.GetString($decryptedBytes))**

1. Sign out of VictimPC
1. Switch to AdminPC and click **Start using Windows Defender ATP**.
1. In the Windows Defender Security Center, click on **Settings > Advanced Features** and toggle the switches on for **Azure ATP integration** and **Microsoft Cloud App Security**.
	![g47p8c30.jpg](https://github.com/kemckinnmsft/M365HOL3001/blob/master/Media/g47p8c30.jpg)

---
# Azure Advanced Threat Protection
[🔙](#introduction)

## Create and configure Azure ATP Workspace

1.	Login into AdminPC by clicking @lab.CtrlAltDelete and using the credentials below: 
	
	**NuckC**

	**NinjaCat123**

2. 	Open Edge and browse to **https://portal.atp.azure.com** and login with the following credentials. 
   
   **Global Admin UserName**

   **Global Admin Password**
   
3. 	Click **Create workspace**
	1.	Enter name for the workspace: for example, your last name with 001 at the end (levitz001).
	1.	Select your Geolocation.
	1.	Click **Create**.
4. 	Click on the **workspace name** to open the Azure ATP workspace portal.
5. 	Click **Provide a username and password to connect to your Active Directory forest**. 
	1.	On the Directory Services page enter the following and click **Save**:

		|||
		|-----|-----|
		|Username|**aatpservice**|
		|Password|**Password123!@#**|
		|Domain|**contoso.azure**|


---
## Deploy the Azure ATP Sensor 
[🔙](#azure-advanced-threat-protection)

1.	Login to ContosoDC server by clicking @lab.CtrlAltDelete and using the credentials below: 

	**@lab.VirtualMachine(ContosoDC).Username**

	**@lab.VirtualMachine(ContosoDC).Password**
2. 	Open IE and browse to https://{workspacename}.atp.azure.com and login with the following credentials. 
  
   **Global Admin UserName**

   **Global Admin Password**
3. 	Click the **Download Sensor Setup** link.
	
	> NOTE: **Do not** download the sensor setup package
1. On the Desktop, open the Azure ATP Sensor folder and right click the **SensorInstallationConfiguration.json** file and select **Open with** and select **Notepad**.
	1. Modify the **Address** line to read {workspacename}sensorapi.atp.azure.com For example: *levitz001sensorapi.atp.azure.com*.
	1. Replace the **WorkspaceID** with the WorkspaceID from **Azure ATP Console Help**. 
1. Go back to the Azure ATP Console and **copy the Access key**.
4.  On the Desktop **open the Azure ATP Sensor Setup folder** and double click **Azure ATP Sensor Setup.exe**.  (We downloaded the Sensor setup for you to save some time. If you run the lab and you get an error deploying the  Sensor, re-download the Sensor and try again).
	1.	Click **Run** in the Open File Security Warning page.
	1.	Select the installation language of choice and click **Next**.
	1.	Click **Next** on the Sensor deployment type page. 
	1.	**Paste the Access key** copied from above and click **Install**. 

## Configure Domain Synchronizer
1.	In the Azure ATP console **click on the deployed Sensor** and **toggle the Domain synchronizer candidate switch** to **On** and click **Save**.

---
## Adding Guest User access to Azure ATP Console. 
[🔙](#azure-advanced-threat-protection)

To allow users not in the companies Azure Active Directory to access the Azure ATP console you configure a guest user and then add them to the proper Azure ATP AAD group. 

1.	On ContosoDC open a new tab in IE and browse to **https://portal.azure.com**. You should be automatically logged in. If not, login with the following credentials. 
  
   **Global Admin UserName**

   **Global Admin Password**

2. 	Close any popup windows that might have opened. 
3. 	Click **Azure Active Directory**.
4. 	Click **Users**.
5. 	Click **New guest user**.
6. 	Enter email address for guest user such as **@lab.User.Email** and click **Invite**.
7. 	 Close the Users blade by clicking the **X** in the right-hand side. 
8. 	Click **Groups**.
9. 	Click **Azure ATP {workspace name} Administrators group**.
10. 	Click **Members**.
11.	Click **Add members**.
12. 	Select the **guest user added above** and click **Select**.

> NOTE:	After the user accepts the invitation the user will be able to access the Azure ATP console for this workspace using their email account. 

---
## Azure ATP Immersion Lab
[🔙](#azure-advanced-threat-protection)

The rest of the lab will be instructor led via PowerPoint. 
---
# Azure Security Center
[🔙](#introduction)

### Please see externally provided instructions for this lab.

---
# Azure Active Directory
[🔙](#introduction)

> WARNING: Please ensure you have completed the steps in the [Lab Environment Configuration](#lab-environment-configuration) before continuing.

## Identity Protection and Risk Policies

**Reference: User chart**

|User		|Are they in **IP Users** Group?	|Registered for MFA/SSPR during setup?
|-------	|-------							|-------
|Alan		|YES								|YES
|Ben		|YES								|NO
|Amy		|YES								|YES 
|Eric		|NO									|NO

---
# Prerequisites
[🔙](#azure-active-directory)

### Create group of users

1. On Client01, navigate to **https://portal.azure.com**.

1. If necessary, log in using the credentials below:

	**Global Admin Username**

	**Global Admin Password**

2. 	Browse to **Azure Active Directory > Groups > New group**.
3. 	Create a Security group named **Identity Protection Users** with assigned membership type.
4. 	Click **Create**, then add Alan, Ben, and Amy to the group.

### Enable Self Service Password Reset (SSPR)

1.	Navigate to **Azure Active Directory > Password reset**.
2. 	From the Properties page, under the option Self Service Password Reset Enabled, choose **All**.
4. 	Click Save.
5. 	From the Authentication methods page, make the following choices:
6. 	Number of methods required to reset: **1**
	1.	Methods available to users:
		1.	**Mobile app code (preview)**
		1.	**Mobile phone**
		1.	**Office phone**
	1.	Click **Save**.

### Enable converged registration for MFA and SSPR

2. 	Navigate to Azure Active Directory > User settings > Manage settings for access panel preview features.
3. 	Under Users can use preview features for registering and managing security info, you can choose to enable for a Selected group of users or for All users.

------
---
# Configure MFA registration policy
[🔙](#azure-active-directory)

1.	Navigate to **Azure Active Directory > Security > MFA registration policy**.
2. 	Under Assignments, select **Identity Protection Users**.
3. 	Set **Enforce Policy** to **On**.

### Register Alan for MFA

1.	In a **new InPrivate window**, log in to **https://portal.office.com** using the credentials below

	**Alan@yourtenant.com**

	**pass@word1**

2. 	Alan will be prompted to register for MFA.
3.    Close the InPrivate window.

### Register Amy for MFA

1.	In a **new InPrivate window**, log in to **https://portal.office.com** using the credentials below

	**Amy@yourtenant.com**

	**pass@word1**

2. 	Amy will be prompted to register for MFA.
3.    Close the InPrivate window.

---
# Configure risk policies
[🔙](#azure-active-directory)

##First, we are going to configure the sign-in risk policy

1.	On Client01, navigate to **https://portal.azure.com/?Microsoft_AAD_IAM_ipcv2=true&Microsoft_AAD_IAM_securityarea=true#blade/Microsoft_AAD_IAM/ActiveDirectoryMenuBlade/Security** 
2. 	Click on the **Security** blade and then select **Sign-in risk policy**
3. 	Under **Assignments** **users**, click on **Select individuals and groups** and then select the **Identity Protection Users** group. Click **Done**
4. 	Under **Conditions**, ensure that sign-in risk is set to **Medium and above**
5. 	Under **Controls**, ensure that access is set to **require multi-factor authentication**
6. 	Set **Enforce Policy** to **On**

##Now, let’s configure the user-risk policy

1.	Navigate to **https://portal.azure.com/?Microsoft_AAD_IAM_ipcv2=true&Microsoft_AAD_IAM_securityarea=true#blade/Microsoft_AAD_IAM/ActiveDirectoryMenuBlade/Security** 
2. 	Click on the **Security** blade and then select **User risk policy**
3. 	Under **Assignments** **users**, click on **Select individuals and groups** and then select the **Identity Protection Users** group. Click **Done**
4. 	Under **Conditions**, set user risk is set to **High**
5. 	Under **Controls**, ensure that access is set to **require password change**
6. 	Set **Enforce Policy** to **On**

---
# Simulate risky sign-ins experience
[🔙](#azure-active-directory)

Let’s see what happens when users try to sign in from the Tor Browser, which anonymizes their IP and can be used by malicious actors.

1.	Log in to Client03 and launch Tor Browser
2. 	Navigate to **https://portal.office.com** and log-in with the credentials below:

	**Eric@yourtenant.com**

	**pass@word1**

	1.	Notice how they are not blocked because they are not targeted by the risky sign-ins policies
3. 	Now, open a new Tor window and log-in to **https://portal.office.com with the credentials below
		
		**Alan@yourtenant.com**

		**pass@word1**

	1.	Notice how you are prompted for MFA due to the risky sign-ins policy
4. 	To generate an additional risky sign-in, open a new Tor window and log-in to **https://portal.office.com++ with **Amy@yourtenant.com**
	1.	Notice how you are prompted for MFA due to the risky sign-ins policy

##What happens if a user is targeted by the risky sign-ins policy but has not yet registered for MFA?

1.	Open a new Tor window and log-in to **https://portal.office.com** with the credentials below:

	**Ben@yourtenant.com**

	**pass@word1**
	
	1.	Notice how you are blocked because the user has not registered for MFA yet and is thus unable to beat the MFA challenge prompted by the risky sign-ins policy
6. 	So that Ben can respond to future MFA attempts, open an Edge browser window and now navigate to portal.office.com and log-in as Ben
	1.	You will be prompted to register for MFA
---
# Pull data from APIs
[🔙](#azure-active-directory)

## Get Started with the API

There are four steps to accessing Identity Protection data through Microsoft Graph:


1.	Create a new app registration. 
3. 	Use this secret and a few other pieces of information to authenticate to Microsoft Graph, where you receive an authentication token. 
4. 	Use this token to make requests to the API endpoint and get Identity Protection data back.

## Create a new app registration

1.	On the Active Directory page, in the Manage section, click App registrations.

	![h5fd84va.jpg](https://github.com/kemckinnmsft/M365HOL3001/blob/master/Media/h5fd84va.jpg)
2. 	In the menu on the top, click New application registration.
 
	![vptami21.jpg](https://github.com/kemckinnmsft/M365HOL3001/blob/master/Media/vptami21.jpg)
3. 	On the Create page, perform the following steps:
 
	![uh5cjkmi.jpg](https://github.com/kemckinnmsft/M365HOL3001/blob/master/Media/uh5cjkmi.jpg)
	1. In the Name textbox, type a name for your application (e.g.: AADIP Risk Event API Application).
	1. As Type, select Web Application And / Or Web API.
	1. In the Sign-on URL textbox, type **http://localhost**.
	1. Click Create.
4. 	To open the Settings page, in the applications list, click your newly created app registration. 
5. 	Copy the Application ID and paste it into a new text document. This will be needed later in the lab.

---
## Grant your application permission to use the API
[🔙](#azure-active-directory)

1.	On the Settings page, click Required permissions.
 
	![87aolleh.jpg](https://github.com/kemckinnmsft/M365HOL3001/blob/master/Media/87aolleh.jpg)
2. 	On the Required permissions page, in the toolbar on the top, click Add.
  
	![3yfprrsu.jpg](https://github.com/kemckinnmsft/M365HOL3001/blob/master/Media/3yfprrsu.jpg)
3. 	On the Add API access page, click Select an API.
 
	![dwvs40oh.jpg](https://github.com/kemckinnmsft/M365HOL3001/blob/master/Media/dwvs40oh.jpg)
4. 	On the Select an API page, select Microsoft Graph, and then click Select.
 
	![c2wo5n3e.jpg](https://github.com/kemckinnmsft/M365HOL3001/blob/master/Media/c2wo5n3e.jpg)
5. 	On the Add API access page, click Select permissions.
 
	![k275899m.jpg](https://github.com/kemckinnmsft/M365HOL3001/blob/master/Media/k275899m.jpg)
6. 	On the Enable Access page, click Read all identity risk information, and then click Select.
 
	![wlcqechy.jpg](https://github.com/kemckinnmsft/M365HOL3001/blob/master/Media/wlcqechy.jpg)
7. 	On the Add API access page, click Done.
8. 	On the Required Permissions page, click Grant Permissions, and then click Yes.

	![3i07c4dz.jpg](https://github.com/kemckinnmsft/M365HOL3001/blob/master/Media/3i07c4dz.jpg)
---
## Get an access key
[🔙](#azure-active-directory)

1.	On the Settings page, click Keys.
 
	![to0mwhls.jpg](https://github.com/kemckinnmsft/M365HOL3001/blob/master/Media/to0mwhls.jpg)
2. 	On the Keys page, perform the following steps:
 
	![3xrwo38o.jpg](https://github.com/kemckinnmsft/M365HOL3001/blob/master/Media/3xrwo38o.jpg)
	1. In the Key description textbox, type a description (for example, AADIP Risk Event).
	1. As Duration, select In 1 year.
	1. Click Save.
	1. Copy the key value, and then paste it into a safe location. 

	Since we will use this value later on, copy the Client Secret into the text file where you stored the client id.

	> NOTE: If you lose this key, you will have to return to this section and create a new key. Keep this key a secret: anyone who has it can access your data.
---
## Authenticate to Microsoft Graph and query the Identity Risk Events API
[🔙](#azure-active-directory)

At this point, you should have specified the following values in your text file:

- The client ID 

- The key 

## Querying the API using PowerShell

Now that we have configured the app registration and retrieved the values needed to authenticate, we can query the IdentityRiskEvents API using PowerShell.

## See medium-risk and  high-risk events

First, let’s assess how many risk events we have that are medium or high risk. These are the events that have the capability to trigger the sign-in or user-risk policies. Since they have a medium or high likelihood of user compromise, remediating these events should be a priority. 

1. Open a **PowerShell ISE** window and, in the **script pane**, type the PowerShell code below.  

1. Insert the saved **Client ID** and **key** for the values of **ClientID** and **ClientSecret** variable and click **Run**.

	```
	##Get all your medium or high-risk risk events

	$ClientID       = "ClientID"        # Should be a ~36 hex character string; insert your info here
	$ClientSecret   = "ClientSecret"    # Should be a ~44 character string; insert your info here
	$tenantdomain   = "yourtenant.com"    # For example, contoso.onmicrosoft.com

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

Since we know that Alan had some risky-sign ins, let’s query their risk events.

1. In the **PowerShell ISE**, open a new file and, in the **script pane**, type the PowerShell code below.

1. Insert the saved **Client ID** and **key** for the values of **ClientID** and **ClientSecret** variable and click **Run**.

	```
	##Get a specific user's risk events

	$ClientID       = "ClientID"        # Should be a ~36 hex character string; insert your info here
	$ClientSecret   = "ClientSecret"    # Should be a ~44 character string; insert your info here
	$tenantdomain   = "yourtenant.com"    # For example, contoso.onmicrosoft.com

	$loginURL       = "https://login.microsoft.com"
	$resource       = "https://graph.microsoft.com"
	$body      = @{grant_type="client_credentials";resource=$resource;client_id=$ClientID;client_secret=$ClientSecret}
	$oauth     = Invoke-RestMethod -Method Post -Uri $loginURL/$tenantdomain/oauth2/token?api-version=beta -Body $body
	Write-Output $oauth
	if ($oauth.access_token -ne $null) {
	$headerParams = @{'Authorization'="$($oauth.token_type) $($oauth.access_token)"}
	$url = "https://graph.microsoft.com/beta/identityRiskEvents?`$filter=userID eq '<Alan’s user ID>'"
	Write-Output $url
	$myReport = (Invoke-WebRequest -UseBasicParsing -Headers $headerParams -Uri $url)
	foreach ($event in ($myReport.Content | ConvertFrom-Json).value) {
		Write-Output $event
	}
	} else {
	Write-Host "ERROR: No Access Token"
	} 
	```
---
# Simulate risky user experience
[🔙](#azure-active-directory)

Remember our risky sign-ins from earlier? Let’s take a look at them in the Azure portal

1.	Navigate to **https://portal.azure.com/?Microsoft_AAD_IAM_ipcv2=true&Microsoft_AAD_IAM_securityarea=true#blade/Microsoft_AAD_IAM/ActiveDirectoryMenuBlade/Security**
2. 	Click on the **Security** blade and then select **Risky sign-ins**
3. 	You should see the Tor sign ins from Alan, Ben, and Eric. To dive deeper, click on a specific sign-in record
4. 	In the details drawer, you can toggle through the basic info, device info, risk info tabs to learn more about that particular sign-in

Now that we have taken a look at risky sign-ins, let’s find out what happens if Identity Protection detects a high-risk user. For the purposes of this lab, we will force a user to go to **high-risk**

1.	Navigate to **https://portal.azure.com/?Microsoft_AAD_IAM_ipcv2=true&Microsoft_AAD_IAM_securityarea=true#blade/Microsoft_AAD_IAM/ActiveDirectoryMenuBlade/Security**
2. 	Click on the **Security** blade and then select **Risky sign-ins**
3. 	Click on the risky sign-in record for Ben and select **confirmed compromise**
4. 	Now, open a new InPrivate window and try to log-in to portal.office.com as Ben
	1.	You will be prompted to reset Ben’s password


