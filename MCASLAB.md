# Microsoft Cloud App Security
[:arrow_left: Home](#introduction)

This lab will guide you through the different Microsoft Cloud App Security (MCAS) capabilities.
Although some labs are pretty straight forward ,we expect you to already have some basic experience with Cloud App Security or Office 365 management.

## Lab environment

!IMAGE[Lab environment](\Media\mcaslabenvironment.png "Lab environment")

* **Client01** is a Windows 10 VM that will be used to access Office 365 and Cloud app Security management consoles and configure the log collector running on LinuxVM, using Putty.
* **LinuxVM** is an Ubuntu 18.04 computer on which we install Docker to run the Cloud App Security Discovery log collector.
* Office 365 and Cloud App Security are test tenants for the labs.



### Portals URLs

* Office 365:```https://portal.office.com```
* Cloud App Security: ```https://portal.cloudappsecurity.com```
* Security & Compliance Center: ```https://protection.office.com```
* Windows Defender ATP: ```https://securitycenter.windows.com```

---

## Labs

> [!ALERT] Before going to the different labs section, please complete the **[environment preparation](#mcas-environment-preparation)**. 

The different Cloud App Security capabilities covered in the labs are:

* [Module 01 - Management](#manage-admin-access)
* [Module 02 - Cloud Discovery continuous report](#cloud-app-security-discovery-lab)
* [Module 03 - Information protection](#information-protection)
* [Module 04 - Threat detection](#cloud-app-security-threat-detection-lab)
* [Module 05 - Conditional Access App Control with Office 365](#conditional-access-app-control-with-office-365)

### Optional/follow on labs

* [Module 06a - Management with PowerShell](#management-with-powershell)
* [Module 06b - Cloud Discovery snapshot report](#cloud-discovery-snapshot-report)
* [Module 06c - Log collector troubleshooting](#log-collector-troubleshooting)
* [Module 06d - Conditional Access App Control with 3rd party apps](#conditional-access-app-control-with-3rd-party-apps)

>:question: If you have questions or want to go further in your Cloud App Security journey, join our **[Tech community](https://techcommunity.microsoft.com/t5/Microsoft-Cloud-App-Security/bd-p/MicrosoftCloudAppSecurity)** !
===
# Manage admin access

[:arrow_left: Home](#labs)

[Manage admin access:](#manage-admin-access) :clock10: 5 min

For this task, you are asked to delegate admin access to monitor a dedicated group of users for a specific region, without adding them to the Global Admin management role.


> [!NOTE] Cloud App Security Global admin role is not the same as the Office 365 Global admin role.
> [!NOTE] Although the Office 365 Global admins are automatically granted the Cloud App Security Global admin role, you can grant users           MCAS Global Admin role without adding them to the Office 365 Global admins.



## Delegate User Group Administration

In this lab, we are going to delegate the management of US employees to a new administrator (**mcasadminUS**). This administrator will only see those users alerts and activities for the users bieing members of the group **US employees**.

1. [] On @lab.VirtualMachine(Client01).SelectLink log in with the password +++@lab.VirtualMachine(Client01).Password+++.

2. [] In a in Private Browsing session navigate to the ```https://portal.cloudappsecurity.com```

3. [] Import the **US employees** group.
    
	> [!NOTE] ***The import can take up to one hour. Cloud App Security has to synchronize the Azure AD groups before importing them.***

	**Click on the *Gear* under Data Enrichement, click on *User groups***

    !IMAGE[Import group](\Media\mgmt-import1.png "Import group")

	**Click on *Import user group***

    !IMAGE[Import group](\Media\mgmt-import2.png "Import group")

	**Select an app to import group from: *Office 365(AzureAD)***

    !IMAGE[Import group](\Media\mgmt-import3.png "Import group")

	**The user group will be importing**

    !IMAGE[Import group](\Media\mgmt-import4.png "Import group")

4. [] In the Cloud App Security portal```https://portal.cloudappsecurity.com```, add **mcasAdminUS** as **User group admin** for the **US employees** group.

	**Click on the *Gear* under System, click on *Manage admin access***

    !IMAGE[New admin](\Media\mgmt-admin1.png "New admin")

	**Click on the plus**

    !IMAGE[New admin](\Media\mgmt-admin2.png "New admin")

	> [!NOTE] Use the Office 365 Credentials provided in your tenant 

	 !IMAGE[Tenant](\Media\tenantcredentials.JPG)

	**Type the admin user name**: *Example:mcasadminus@LODSA293123.onmicrosoft.com* 

	**Select Role**: *User group admin*


    !IMAGE[New admin](\Media\mgmt-admin3.png "New admin")

	**Select groups for this admin**: *US employees*

	**Click on Add admin**


    !IMAGE[New admin](\Media\mgmt-admin4.png "New admin")

	**The user should be populated with the *role* and *scope.***

    !IMAGE[New admin](\Media\mgmt-admin5.png "New admin")


5. Open a new **private** tab and connect to the [Cloud App Security portal] ```https://portal.cloudappsecurity.com``` with **mcasAdminUS** and compare the activities, alerts and actions that this scoped admin can perform compared to your regular Global admin account.


---

## Delegate MCAS administration to an external admin

As a **Managed Security Service Providers** (MSSPs), you are asked by your customer how you could access their environment to manage their alerts in the Cloud App Security portal.
In this lab, we will see how to answer to that question.
As the MCAS admin for your company, work with the person next to you to configure an external access for the Managed Security Service Provider to another MCAS tenant.

1. [] Browse to ```https://portal.cloudappsecurity.com```, add the external MCAS admin as **Security reader** in your MCAS tenant.

    **Click on the *Gear* under System, click on *Manage admin access***

    !IMAGE[External admin](\Media\mgmt-admin1.png "External admin")

	**Click on the plus**

    !IMAGE[External admin](\Media\mgmt-admin2.png "External admin")


	**Type Admin user name:**  *Use your neighbors Office 365 credentials provided in their tenant as the external admin* 

	**Select type of role for this admin:** *Security Reader*

	!IMAGE[Tenant Example](\Media\tenantcredentials.JPG)

	**Add Admin**

    !IMAGE[External admin](\Media\mgmt-externaladmin1.png "External admin")

    > [!NOTE] Note here that the icon next to the newly added admin shows that the user is external to the company.

    !IMAGE[External admin](\Media\mgmt-externaladmin2.png "External admin")

2. [] After adding the external admin, **log off** and log on again from Cloud App Security.

    !IMAGE[Log off](\Media\mgmt-switch1.png "Log off")

3. [] Switch to the external Cloud App Security tenant where you have been added as an external admin and look at the actions you can perform.

    !IMAGE[Switch](\Media\mgmt-switch2.png "Switch")
===
# Cloud App Security Discovery lab

[:arrow_left: Home](#labs)

TO EDIT Discovery text/intro

# Cloud Discovery Snapshot Report

[:arrow_left: Home](#labs) :clock10: 10 min

Snapshot Reports are the manual method of uploading files into Cloud App Security. You can upload batches of 20 logs of 1 GB max at a time and they will parse into their own separate report. Any discovery policies you create **will not** apply to these types of reports. Creating Snapshot reports is a great and easy way to validate your logs format of have a quick look at the Cloud App Security Discovery capability.

To create snapshot reports:

1. [] Go to the **Discover** section and click on **Create snapshot report**.

    !IMAGE[Create snapshot](\Media\dis-newsnaphsot.png "Create snapshot")

2. [] In the Add data source window, use the settings below (do not close the window yet) and click on **View and verify...**:

    >|||
    >|---------|---------|
    >|Report Name| **Demo report**|
    >|Description| 
    >|Data Source| **SQUID (Common)**|
    >|Anonymize private information |**Check the Box**|
    >
    !IMAGE[New snapshot](\Media\dis-createsnapshot.png "New snapshot")

3. [] In the **Verify your log format** window, click on the **Download sample log** button and save it to your desktop.

    !IMAGE[Download log](Media\dis-squiddownload.png "Download log")

4. [] Close that window.

5. [] Click on the **Browse** button and in the new window, select the log you downloaded and click **Open**.

    !IMAGE[Browse logs](\Media\dis-browse.png "Browse logs")

    !IMAGE[Select logs](\Media\dis-squidselect.png "Select logs") 

6. [] Now that the log has been selected, click on the **Create** button to create your report.

    !IMAGE[Create snapshot](\Media\dis-squidcreate.png "Create snapshot")

7. [] Your report will then be processed. It will take a couple of minutes before it's marked as **Ready**.

    !IMAGE[Report processing](\Media\dis-processing.png "Report processing")

    !IMAGE[Report processing](\Media\dis-reportready.png "Report processing")

8. [] Now that your report is marked as **ready**, click on the text **Ready**. You will be then redirected to your snapshot report where you can start exploring the discovered apps, users, IPs. Your instructor can give you more details on how to use the dashboard.

    !IMAGE[Report processing](\Media\dis-reportready2.png "Report ready")

    !IMAGE[Report dashboard](\Media\dis-dashboard.png "Report dashboard")

    !IMAGE[Report dashboard -risk](\Media\dis-risk.png "Report dashboard - risk")

===


## Configure and Test Continuous Reports

Continuous reports in Cloud Discovery analyze all logs that are forwarded from your network using Cloud App Security. They provide improved visibility over all data, and automatically identify anomalous use using either the Machine Learning anomaly detection engine or by using custom policies that you define.
To use this capability, you will perform in this lab the configuration and troubleshooting of the Cloud Discovery feature.


>:memo: After completing this portion of the lab and validating that your logs have been successfully uploaded and processed by MCAS, you will not immediately see a loaded Discovery Dashboard. Due to Cloud Discovery logs being  parsed **twice a day**.


 **The Docker engine has been pre-installed on LinuxVM in your lab environment, **Client01*** in this case.**

```
    curl -o /tmp/MCASInstallDocker.sh https://adaprodconsole.blob.core.windows.net/public-files/MCASInstallDocker.sh && chmod +x /tmp/MCASInstallDocker.sh; /tmp/MCASInstallDocker.sh
```

Those commands download a script installing the Docker engine on your host computer (Ubuntu in this case) and pull the latest Cloud App Security collector image from the Docker library.

### Create a data source and a log collector in the Cloud App Security Portal

1. [] Switch to @lab.VirtualMachine(Client01).SelectLink and log in with the password +++@lab.VirtualMachine(Client01).Password+++.


2. [] Create a new tab in the in a  Private window and browse to ```https://portal.cloudappsecurity.com```.

   >INFO: If necessary, log in using the credentials below:
   >
   >```@lab.CloudCredential(134).Username```
   >
   >```@lab.CloudCredential(134).Password```

3. [] In the Cloud App Security dashboard, click on the **Settings** icon and click **Log collectors**.

   !IMAGE[Settings](\Media\dis-settings.png "Settings")

4. [] On the **Data sources tab**, click the **Add data source...** button.

    !IMAGE[New data source](\Media\dis-newsource.png "New data source")

5. [] In the Add data source window, use the settings below (do not close the window yet):

    >|||
    >|---------|---------|
    >|Name| **SquiDLogs**|
    >|Source| **SQUID (Common)**|
    >|Receiver type| **FTP**|
    >|Anonymize private information |**Check the Box**|
    >
    !IMAGE[Squid source](\Media\dis-squidsource.png)

    >:memo: **NOTE:** In this lab we use FTP as the receiver type but usually companies will use Syslog.

6. [] Close the *Verify your log format* window, then click **Add** in the **Add** data source dialog.

    !IMAGE[Add source](\Media\dis-addsource.png "Add source")

    >**INFO:** We just created a data source which is the logical representation of the network appliance data source type the log collector will receive.

7. [] Next, click on the **Log collectors tab** and click the **Add log collector...** button.

    !IMAGE[Add log collector](\Media\dis-addlogcollector.png "Add log collector")

8. [] In the Create log collector dialog, provide the settings below and click the **Update** button.

    |||
    |-----|-----|
    |Name|```LogCollector```
    |Host IP address|```192.168.141.125```
    |Data source(s)|**SquidLogs**

    !IMAGE[Create log collector](\Media\dis-createlogcollector.png "Create log collector")

9. [] After clicking on the **Update** button, you have now the required steps to create your log collector instance on **LinuxVM**.
    >:warning: Do not close this window!

    !IMAGE[Create log collector command](\Media\dis-addlogcollectortoken.png "Create log collector command")

    ``` 
    (echo 1f5b5fb2a0d778e3d57f26ca5ab11574db0751166477940528ccf19a7c4) | docker run --name LogCollector -p 21:21 -p 20000-20099:20000-20099 -e "PUBLICIP='192.168.141.125'" -e "PROXY=" -e "SYSLOG=false" -e "CONSOLE=xyztenant.eu.portal.cloudappsecurity.com" -e "COLLECTOR=LogCollector" --security-opt apparmor:unconfined --cap-add=SYS_ADMIN --restart unless-stopped -a stdin -i microsoft/caslogcollector starter
    ```

    >**INFO:** This command line contains the different parameters to instantiate a new log collector on the Linux host:
    >* An API token to connect to Cloud App Security for uploading the logs: *1f5b5fb2a0d778e3d57f26ca5ab11574db0751166477940528ccf19a7c4*
    >* The docker parameters to configure the log collector container: *docker run ...*

10. [] Copy the command line provided at the end of the previous step and **minimize** the browser. Open **Putty (64-bit)**. You should have the icon on your desktop.

    !IMAGE[Putty](\Media\dis-putty.png "Putty")

11. [] In the PuTTY Configuration window, enter **192.168.141.125** and click **Open**.

    !IMAGE[Putty config](\Media\dis-puttyconfig.png "Putty config")

12. [] At the Putty warning message, click **Yes**.
    >**INFO:** This warning is due to the ssh certificate. You can safely ignore this warning in this lab.

    !IMAGE[Putty warning](\Media\dis-puttywarning.png "Putty warning")

13. Log in using the credentials below.
    >|Username|Password|
    >|---|---|
    >|```user01```|```Passw0rd1```|
    >
    >:warning:The password doesn't appear in the command prompt, you can safely press enter to validate the credentials.

    !IMAGE[Putty prompt](\Media\dis-puttylogin.png)

14. [] Type the command below and press **Enter**. Provide the user password when prompted.
     ``` 
     sudo -i
     ```
     !IMAGE[sudo](\Media\dis-sudo.png)

     >**INFO**: The previous command elevates your permissions in the Linux environment like the UAC prompt would do on a Windows machine.

15. [] Return to the *Create log collector* dialog, copy the **collector configuration** command from step 2 and run it in the PuTTY window.

     !IMAGE[Copy token](\Media\dis-addlogcollectorcopy.png "Copy token")
     !IMAGE[New container](\Media\dis-newcontainer.png "New container")

     >**INFO:** The output of this command is the id of the newly created container/log collector.

16. [] Now, launch **WinSCP** from the start-menu.

    !IMAGE[WinSCP](\Media\dis-winscp.png "WinSCP")

17. [] Use the details below in the WinSCP window to connect to the log collector FTP service.

    |File Protocol|Host name|User name|Password|
    |-----|-----|-----|-----|
    |**FTP**|```192.168.141.125```|```discovery```|```BP98Jw4Ns*zpTFrH```|

    !IMAGE[WinSCP connection](\Media\dis-winscpconnection.png "WinSCP connection")

    >**INFO**: this information was provided during the log collector creation.
    
   

    You should then be able to see a folder with your data source name.

    !IMAGE[WinSCP connection](\Media\dis-winscpfolder.png "WinSCP connection")

    >:warning: If you are **not** able to connect to the log collector FTP service, verify that you successfully created the new log collector instance within Putty in previous steps.

18. [] On the left pane, move to the **Desktop** folder and drag your example Squid log (From Step 7) into the folder named for your data source (**SquidLogs**). After some minutes, the log collector will upload your logs.

    !IMAGE[Log upload](\Media\dis-winscplogupload.png "Log upload")
    !IMAGE[Log upload](\Media\dis-winscplogupload2.png "Log upload")
    !IMAGE[Log upload](\Media\dis-winscplogupload3.png "Log upload")

19. [] Return to the Cloud App Security portal and click on **Settings** > **Governance log**.

    !IMAGE[Settings Governance log](\Media\dis-governancelog.png "Settings Governance log")

20. [] Verify the status of the uploaded logs.

    >**INFO:** The status you see is the parsing status of the logs. Parsing status can be successful, pending or failed.

    !IMAGE[Log uploaded](\Media\dis-loguploaded.png "Log uploaded")

21. [] You can also verify the **last data received** status on the *Data sources* tab under **Automatic log upload** settings.

    !IMAGE[Last data received](\Media\dis-lastreceived.png "Last data received")

22. [] Go to the **Cloud Discovery dashboard** to verify the discovered apps.

    !IMAGE[Discovery dashboard](\Media\dis-discoverydashboard.png "Discovery dashboard")

    !IMAGE[Discovery data](\Media\dis-discoverydata.png "Discovery data")

    
  

===
# Information protection

[:arrow_left: Home](#labs)

In a perfect world, all your employees understand the importance of information protection and work within your policies. But in a real world, it's probable that a partner who works with accounting uploads a document to your Box repository with the wrong permissions, and a week later you realize that your enterprise's confidential information was leaked to your competition.
Microsoft Cloud App Security helps you prevent this kind of disaster before it happens.

## Labs

* [Apply AIP classification to SSN documents:](#apply-aip-classification-to-ssn-documents) :clock10: 10 min
* [Quarantine sensitive PDF for review:](#quarantine-sensitive-pdf-for-review) :clock10: 10 min
* [Test our policies:](#test-our-policies) :clock10: 10 min

---

## Apply AIP classification to SSN documents

In this task, you will protect a specific sensitive document library in SharePoint Online using the native integration with Azure Information Protection.
We will apply an Azure Information Protection template on documents containing social security numbers.

[:arrow_up: Top](#information-protection)

1. [] In the Cloud App Security portal, go to **Control** and then click on **Policies.**

    !IMAGE[Policies](\Media\info-policies.png "Policies")

2. [] Create a new **File policy**.

    !IMAGE[New policy](\Media\info-newpolicy.png "New policy")

3. [] Provide the following settings to that policy:

    >|||
    >|---------|---------|
    >|Policy Name| **Protect SSN documents in sensitive site**|
    >|Files matching all of the following| **remove the filters** |
    >|Apply to| **Selected Folders , All Files(Box)** |


    !IMAGE[Box](\Media\allfilesBox1.JPG)  

4. [] Verify that you have one selected folder and click on **Done**.


5. [] In the inspection method, select **Data Classification Service**.

    > [!NOTE]*Microsoft Data Classification Service provides a **unified** information protection experience across Office 365, Azure Information Protection, and Microsoft Cloud App Security.*

    *The classification service allows you to extend your data classification efforts to the third-party cloud apps protected by Cloud App Security, using the decisions you already made across an even greater number of apps.*

    !IMAGE[DCS](\Media\info-dcs.png "DCS")

6. [] Click on **Choose inspection type** and then on **sensitive information type**. Search and select the **all the SSN's that populate** and click on **Done**.

    !IMAGE[SSN type](\Media\info-type.png "SSN type")
    !IMAGE[SSN type](\Media\info-ssn.png "SSN type")

7. [] Click on the **Unmask** checkBox.

    !IMAGE[Unmask](\Media\info-unmask.png "Unmask")

8. [] In the Governance actions, click on **Box** and select **Apply classification label**. Select the **Highly Confidental Employees Only** label. 

    >:warning: If you are not able to select Azure Information Protection templates, verify that you configured the integration in the prerequisites section or that you waited the 1h for the classifications to sync.

  !IMAGE[gov](\Media\Boxgovssn.JPG)


9. [] Click **Create** to finish the policy creation.

---

## Quarantine sensitive PDF for review

[:arrow_up: Top](#information-protection)

File policies are a great tool for finding threats to your information protection policies, for instance finding places where users stored sensitive information, credit card numbers and third-party ICAP files in your cloud. With Cloud App Security, not only can you detect these unwanted files stored in your cloud that leave you vulnerable, but you can take im/mediate action to stop them in their tracks and lock down the files that pose a threat. Using Admin quarantine, you can protect your files in the cloud and re/mediate problems, as well as prevent future leaks from occurring.
This is what we are going to configure in this lab.

1. [] In Cloud App Security Portal, go to the **Gear** and then **Settings**.

    !IMAGE[Settings](\Media\info-settings.png)

2. [] In the Information Protection section, go to **Admin quarantine**.

    !IMAGE[Settings admin quarantine](\Media\info-adminq1.png "Settings admin quarantine")

3. [] Configure **Admin quarantine**.

    **In the dropdown menu, select your root *Box* site.**

    >:memo: As best practice, you should create and use a **dedicated** site with restricted access as the admin quarantine location.

    * In user notification, type **Your content has been quarantined. Please contact your admin.** and click on the **Save** button.

    >:memo: This message will be provided in the placeholders when a file is put in quarantine.

4. [] Next, go to **Control** and then **Policies** and create a new **File policy**. The following policy will determine which files should be placed in quarantine.

    !IMAGE[Policies](\Media\info-policy1.png "Policies")

    !IMAGE[New policy](\Media\info-policy2.png "New policy")

5. [] Provide the following settings to that policy:

    >|Policy name|Files matching all of the following|
    >|---------|---------|
    >|Quarantine sensitive pdf| Extension equals pdf|

    !IMAGE[New policy](\Media\info-policy3.png "New policy")

6. [] Check the **Create an alert for each matching file** checkBox. In Governance actions of the policy, select **Put in admin quarantine** for Box and click on the **Create** button.

      !IMAGE[Unmask](\Media\Boxgovadmin.JPG)

---

## Test our policies

[:arrow_up: Top](#information-protection)

To test our files policies, perform the following tasks:

1. [] On Client01, unzip the content of the **Demo files.zip**.

2. [] Go to the **Box** documents library. 

3. [] Upload the unzipped files to the site.

4. [] Cloud App Security will now scan those documents and search for matches to our created policies.

    >:memo: The scan can take **several minutes** before completion.



5. [] To monitor the evolution of the scan, go back to Cloud App Security and open the **Files** page of the investigations.

    !IMAGE[Search files](\Media\info-files1.png "Search files")

6. [] You can search for the files you uploaded using different criteria, like **file name**, **type**, ... or just look at all the files discovered by Cloud App Security.

    !IMAGE[Search files](\Media\Boxfilesmatch.JPG)


7. [] When a policy match is discovered, you will see it in this page.

    >:memo: Next to the file name, you have icons showing that an AIP label was applied and that we have a policy match.

	  !IMAGE[PolicyMatch](\Media\Boxmatchedpolicies.JPG)

8. [] To open the details of the file, click on its name. You can see there the matched policies and the scan status of the files.

    !IMAGE[Scan status](\Media\info-files5.png "Scan status")

9. [] You can also view the related governance actions, like applying the Azure Information classification or moving the file to the quarantine folder, at the file level or in the **Governance log**.

    !IMAGE[Governance log](\Media\Boxgovlog.jpg) "Governance log")

10. [] If you go back to **Box**, you will also notice that the quarantined files will be replaced by placeholders containing your custom message. The original file will be moved to the "Quarantine" location we defined in the settings.

!IMAGE[results](\Media\Boxportalresults.jpg)
    
===
# Cloud App Security: Threat Detection Lab

[:arrow_left: Home](#labs)

Cloud App Security provides several threats detection policies using machine learning and **user behavior analytics** to detect suspicious activities across your different applications.
Those policies are enabled by default and after an initial learning period, Cloud App Security will start alerting you when suspicious actions like activity from anonymous IP addresses, infrequent country, suspicious IP addresses, impossible travel, ransomware activity, suspicious inBox forwarding configuration or unusual file download are detected.

>:memo: **It can take up 24 hours for the auditing in Cloud App Security to be configured and for alerts to populate** **For this portion of the lab we will be using a pre-populated tenant to see alerts and have the ability to investigate and remediate them.**

> [!NOTE] **LOG OUT OF YOUR CURRENT CLOUD APP SECURITY TENANT AND LOG BACK IN USING THE CREDENTIALS BELOW**

|Portal               |Username                   |Password
|----------------- |----------------------------------- |---------------------
| ```https://portal.cloudappsecurity.com``` | viewer@emslab.tech |EventP@ssword

**URLs**

* Office 365: ```https://portal.office.com```
* Cloud App Security: ```https://portal.cloudappsecurity.com```

## Labs

* [Anonymous access:](#anonymous-access) :clock10: 5 min
* [Impossible travel:](#impossible-travel) :clock10: 5 min
* [Activity from infrequent country:](#activity-from-infrequent-country) :clock10: 5 min
* [Malware detection:](#malware-detection) :clock10: 5 min
* [Email exfiltration using suspicious inBox forwarding:](#email-exfiltration-using-suspicious-inBox-forwarding) :clock10: 5 min
* [Ransomware activity:](#ransomware-activity) :clock10: 5 min
* [Suspicious application consent:](#suspicious-application-consent) :clock10: 5 min

---

## Anonymous access

[:arrow_up: Top](#cloud-app-security-threat-detection-lab)

This detection identifies that users were active from an IP address that has been identified as an anonymous proxy IP address. These proxies are used by people who want to hide their device’s IP address, and may be used for malicious intent. This detection uses a machine learning algorithm that reduces "false positives", such as mis-tagged IP addresses that are widely used by users in the organization.

### Investigate

As your authentication during the previous steps came from an anonymous IP address, it will be detected as suspicious by Cloud App Security.

1. [] Go back to the Cloud App Security portal and review the alerts.

   !IMAGE[MCAS alerts menu](\Media\td-alerts.png "Security Alerts")

   You will see an alert similar  to this one:

   !IMAGE[TOR alert](\Media\td-toralert.png "TOR alert")

2. [] Click on the alert to open it.
   You see in this page more information on the alert and the related activities:

   !IMAGE[TOR alert](\Media\td-toralert-details.png "TOR alert details")

3. [] Click on the activities to get more information on the specific activity, the user and the IP address:

   !IMAGE[TOR alert](\Media\td-toralert-details-user.png "TOR alert user")
   !IMAGE[TOR alert](\Media\td-toralert-details-ip.png "TOR alert IP address")

4. [] You can go further in your investigation by looking at the related actions performed during that session by clicking on the “investigate in activity log" button:

   !IMAGE[TOR alert](\Media\td-toralert-details-activities.png "TOR alert activities")

5. [] You will then be redirected to the activity log where you will be able to investigate on the actions performed during that session, like configuration changes or data exfiltration.

---

## Impossible travel

[:arrow_up: Top](#cloud-app-security-threat-detection-lab)

This detection identifies two user activities (is a single or multiple sessions) originating from geographically distant locations within a time period shorter than the time it would have taken the user to travel from the first location to the second, indicating that a different user is using the same credentials. This detection uses a machine learning algorithm that ignores obvious "false positives" contributing to the impossible travel condition, such as VPNs and locations regularly used by other users in the organization. The detection has an initial learning period of seven days during which it learns a new user’s activity pattern.

### Investigate

As the first and the second authentication came from distinct locations, Cloud App Security will detect that those time to travel between those two locations was to short and will then alert you.

1. [] Go back to the Cloud App Security portal and review the alerts.

   !IMAGE[MCAS alerts menu](\Media\td-alerts.png "Security Alerts")

   You will see an alert similar  to this one:

   !IMAGE[Impossible travel alert](\Media\td-impossibletravelalert.png "Impossible travel alert")

2. [] The investigation steps are similar to the anonymous access but by looking at the IP address details and the **ISP**, you will be able to determine the possible risk:

   !IMAGE[Impossible travel alert](\Media\td-impossibletravelalert-details.png "Impossible travel alert details")

 	>:memo: To reduce the amount of false positives, edit the impossible travel policy. 
	>  
 	> **You can adjust the policy by clicking on the alert and *Resolve* and click on *Adjust policy.**
	> 
	> Each anomaly detection policy can be independently scoped so that it applies only to the users and 
	groups you want to include and exclude in the policy. For example, you can set the Activity from infrequent county detection to ignore a specific user who travels frequently.
	> 
	> **To scope an anomaly detection policy:**
	> 
    > 1. Click Control and then Policies, and set the Type filter to Anomaly detection policy.
	> 2. Click on the policy you want to scope. 
    > 3. Under Scope, change the drop-down from the default setting of All users and groups, to Specific users and groups. 
	> 4. Select Include to specify the users and groups for whom this policy will apply. Any user or group not selected here won't be    considered a threat and won't generate an alert.
	> 5. Select Exclude to specify users for whom this policy won't apply. Any user selected here won't be considered a threat and won't generate an alert, even if they're members of groups selected under Include.
	> 
	> **Sensitivity Slider:**
	> 
    > You can set the sensitivity slider to determine the level of anomalous behavior needed before an alert is triggered. For example, if you set it to low, it will suppress Impossible Travel alerts from a user’s common locations, and if you set it to high, it will surface such alerts.
	> 
	>  !IMAGE[Impossible Travel Sensitivity Bar](\Media\updatedimpossibletravel.JPG)  

---

## Activity from infrequent country

[:arrow_up: Top](#cloud-app-security-threat-detection-lab)

This detection considers past activity locations to determine new and infrequent locations. The anomaly detection engine stores information about previous locations used by users in the organization. An alert is triggered when an activity occurs from a location that wasn't recently or never visited by any user in the organization.

### Investigate

After an initial learning period, Cloud App Security will detect that this location was not used before by your user or other people within the organization and will then alert you.

1. [] Go back to the Cloud App Security portal and review the alerts.

   !IMAGE[MCAS alerts menu](\Media\td-alerts.png "Security Alerts")

   You will see an alert similar  to this one:

   !IMAGE[Infrequent country alert](\Media\td-infrequentcountryalert.png "Infrequent country alert")

2. [] The investigation steps are similar to the anonymous access but by looking at the IP address details and the ISP, you will be able to determine the possible risk. In this specific example, we see it’s coming from a TOR IP, so this authentication is suspicious:

   !IMAGE[Infrequent country alert](\Media\td-infrequentcountryalert-details.png "Infrequent country alert details")

	> [!NOTE] Possible resolution options are available on the top bar for single click remediation. 

	!IMAGE[Infrequent country alert](\Media\infrequentcountry1.JPG)


---

## Malware detection

[:arrow_up: Top](#cloud-app-security-threat-detection-lab)

This detection identifies malicious files in your cloud storage, whether they're from your Microsoft apps or third-party apps. Microsoft Cloud App Security uses Microsoft's threat intelligence to recognize whether certain files are associated with known malware attacks and are potentially malicious. This built-in policy is disabled by default. Not every file is scanned, but heuristics are used to look for files that are potentially risky. After files are detected, you can then see a list of **Infected files**. Click on the malware file name in the file drawer to open a malware report that provides you with information about that type of malware the file is infected with.

### Investigate

1. [] Go back to the Cloud App Security portal and review the alerts.

   !IMAGE[MCAS alerts menu](\Media\td-alerts.png "Security Alerts")

   You will see an alert similar  to this one:

   !IMAGE[Malware detected alert](\Media\td-malwarealert.png "Malware detected alert")

2. [] Click on the alert to open it. You see in this page more information on the alert and the related activities:

   !IMAGE[Malware detected alert](\Media\td-malwarealert-details.png "Malware detected alert")

3. [] In the alert, you have more information on the file and its location, but also the malware that we identified:

   !IMAGE[Malware family](\Media\td-malwarefamily.png "Malware family")

4. [] Click on the malware type link to have access to the Microsoft Threat Intelligence report regarding this file:

   !IMAGE[Malware family](\Media\td-malwarefamilymti.png "Malware family")

5. [] Back in the alert, you can scroll down to the related activities. There, you will have more information on how the file was uploaded to OneDrive and possibly who downloaded it:

   !IMAGE[Malware family](\Media\td-malwarealert-activities.png "Malware family")

---

## Email exfiltration using suspicious inBox forwarding

[:arrow_up: Top](#cloud-app-security-threat-detection-lab)

This detection looks for suspicious email forwarding rules, for example, if a user created an inBox rule that forwards a copy of all emails to an external address.

### Investigate

As the rules redirects your user’s emails to a suspicious external address, Cloud App Security will detect this rule creation and will then alert you.

1. [] Go back to the Cloud App Security portal and review the alerts.

   !IMAGE[MCAS alerts menu](\Media\td-alerts.png "Security Alerts")

   You will see an alert similar  to this one:

   !IMAGE[Suspicious forwarding alert](\Media\td-suspiciousforwardingalert.png "Suspicious forwarding alert")

2. [] Click on the alert to open it. You see in this page more information on the alert, like the **destination address** and the related activities:

   !IMAGE[Suspicious forwarding alert](\Media\td-suspiciousforwardingalert-details.png "Suspicious forwarding alert")

3. [] With this information, you can now go back to the user to remove this rule but also investigate in Exchange trace logs which emails were sent to that destination address.

---

## Ransomware activity

Cloud App Security extended its ransomware detection capabilities with anomaly detection to ensure a more comprehensive coverage against sophisticated Ransomware attacks. Using our security research expertise to identify behavioral patterns that reflect ransomware activity,Cloud App Security ensures holistic and robust protection. If Cloud App Security identifies, for example, a high rate of file uploads or file deletion activities it may represent an adverse encryption process. This data is collected in the logs received from connected APIs and is then combined with learned behavioral patterns and threat intelligence, for example, known ransomware extensions. For more information about how Cloud App Security detects ransomware, see Protecting your organization against ransomware.

### Investigate

As the rules redirects your user’s emails to a suspicious external address, Cloud App Security will detect this rule creation and will then alert you.

1. [] Go back to the Cloud App Security portal and review the alerts.

   !IMAGE[MCAS alerts menu](\Media\td-alerts.png "Security Alerts")

   You will see an alert similar  to this one:

   !IMAGE[Ransomware alert](\Media\td-ransomwarealert.png "Ransomware alert")

2. [] Click on the alert to open it. You see in this page more information on the impacted user, the number of encrypted files, the location of the files and the related activities:

   !IMAGE[Ransomware alert](\Media\td-ransomwarealert-details.png "Ransomware alert")

3. [] Now that we’ve seen the alert, let’s go back to the policies:

   !IMAGE[Policies](\Media\td-policies.png "Policies")

4. [] Search for the “Ransomware activity” policy and open it:

   !IMAGE[Ransomware policy](\Media\td-policiesransomware.png "Ransomware policies")

5. [] At the bottom of the policy, review the possible alerts and governance actions:

   !IMAGE[Ransomware policy](\Media\td-policiesransomware-governance.png "Ransomware policies")

---

## Suspicious application consent

[:arrow_up: Top](#cloud-app-security-threat-detection-lab)

Many third-party productivity apps that might be installed by business users in your organization request permission to access user information and data and sign in on behalf of the user in other cloud apps, such as Office 365, G Suite and Salesforce. 
When users install these apps, they often click accept without closely reviewing the details in the prompt, including granting permissions to the app. This problem is compounded by the fact that IT may not have enough insight to weigh the security risk of an application against the productivity benefit that it provides.
Because accepting third-party app permissions is a potential security risk to your organization, monitoring the app permissions your users grant gives you the necessary visibility and control to protect your users and your applications. The Microsoft Cloud App Security app permissions enable you to see which user-installed applications have access to Office 365 data, G Suite data and Salesforce data, what permissions the apps have, and which users granted these apps access to their Office 365, G Suite and Salesforce accounts. 

Here is an example of such user consent:

!IMAGE[App consent](\Media\td-appconsent.png "App consent")

### Investigate

1. [] Without even creating policies, Cloud App Security shows you the applications that received permissions from your users:

   !IMAGE[App permissions](\Media\td-oauth.png "App permissions")

2. [] From this page, you can easily see who granted permissions to those apps, if they are commonly used or their permissions level:

   !IMAGE[App commodity](\Media\td-zapiercommodity.png "App commodity")

3. [] If you detect that an application should not be granted access to your environment, you can revoke the app access.
   > **IMPORTANT:** This operation will apply to the **entire** organization:

   !IMAGE[App revoke](\Media\td-apprevoke.png "App revoke")

4. [] When investigating, you can search for apps rarely used in Office 365 which were granted high privileges and create a **policy** to be automatically alerted when such action is performed:

   !IMAGE[App filter](\Media\td-appfilter.png "App filter")

5. [] After clicking on the “New policy from search” button, you can see that your filter will be used to create a new policy:

   !IMAGE[App policy](\Media\td-apppolicy.png "App policy")

6. [] Go down on that page and review the possible alerts and governance automatic actions that you can configure:

   !IMAGE[App policy](\Media\td-apppolicy-governance.png "App policy")

7. [] To go further in your investigation, let’s now pivot to the “Activity log”:

   !IMAGE[Activity log](\Media\td-activitylog.png "Activity log")

8. [] In the activity log, search for "**Consent to application**" activities:

   !IMAGE[Activity log](\Media\td-activitylog-consent01.png "Activity log")

9. [] You will then be able to investigate on who, when and from where your users granted access to applications:

   !IMAGE[Activity log](\Media\td-activitylog-consent02.png "Activity log")

---

## Create your own policies

[:arrow_up: Top](#cloud-app-security-threat-detection-lab)

Now that we reviewed some of the default detection capabilities of Cloud App Security, you should start creating your own policies.
Cloud App Security provides by default many has policies templates to start creating your custom policies.

1. [] To create your policies, go to “Policies”:

   !IMAGE[Policies](\Media\td-policies.png "Policies")

2. [] Click on “Create policy” and select the type of policy you want to create:

   !IMAGE[Policies types](\Media\td-policiestypes.png "Policies types")

3. [] In the policy screen, choose the policy template you want to use:

   !IMAGE[Policies templates](\Media\td-policiestemplates.png "Policies templates")

4. [] Apply the template:

   !IMAGE[Apply template](\Media\td-applytemplate.png "Apply template")

5. [] Cloud App Security will then populate the different properties of the policy:

   !IMAGE[Policy template filter](\Media\td-policytemplatefilter.png "Policy template filter")

6. [] Review those properties and customize them if needed.

7. [] Explore other types of policies and review the proposed templates.

 
===

# Conditional Access App Control with Office 365

[:arrow_left: Home](#labs) :clock10: 15 min

## Introduction

Conditional Access App Control utilizes a reverse proxy architecture and is uniquely integrated with Azure AD conditional access.
Azure AD conditional access allows you to enforce access controls on your organization’s apps based on certain conditions. The conditions define who (for example a user, or group of users) and what (which cloud apps) and where (which locations and networks) a conditional access policy is applied to. After you’ve determined the conditions, you can route users to the Microsoft Cloud App Security where you can protect data with Conditional Access App Control by applying access and session controls.

Conditional Access App Control enables user app access and sessions to be **monitored and controlled in real time** based on access and session policies.

!IMAGE[AAD portal](\Media\caac-overview.png)

> [!NOTE] **App Control Access and Session policies give you the capability to the following:**
* **Block on download**: You can block the download of sensitive documents. For example, on unmanaged devices.
* **Protect on download**: Instead of blocking the download of sensitive documents, you can require documents to be protected via encryption on download. This ensures that the document is protected, and user access is authenticated, if the data is downloaded to an untrusted device.
* **Monitor low-trust user sessions**: Risky users are monitored when they sign into apps and their actions are logged from within the session. You can investigate and analyze user behavior to understand where, and under what conditions, session policies should be applied in the future.
* **Block access**: You can completely block access to specific apps for users coming from unmanaged devices or from non-corporate networks.
* **Create read-only mode**: By monitoring and blocking custom in-app activities you can create a read-only mode to specific apps for specific users.
* **Restrict user sessions from non-corporate networks**: Users accessing a protected app from a location that is not part of your corporate network, are allowed restricted access and the download of sensitive materials is blocked or protected.

===

## Configuration


1. [] Go to the Azure portal ```https://portal.azure.com``` and open the **Azure Active Directory** blade.

   !IMAGE[AAD portal](\Media\aad-1.png)

2. [] Scroll down to **Security** and click on **Conditional Access**. 

   !IMAGE[AAD portal](\Media\aad-2.png)

3. [] Create a new conditional access policy with the following settings:

   |Name|Assignments|Apps|
   |-----|-----|-----|
   |Office365 AppControl|All users|Exchange, SharePoint|

   **Click on "New Policy"**

   !IMAGE[New policy](\Media\cond-policy-1.png)

	**Name: Office365 App Control**
	**Assignments: Click on "All users" and then Done**

   !IMAGE[New policy](\Media\cond-policy-2.png)

   **Go to the next section: Cloud Apps: Select Apps and choose Office 365 Exchange Online and Office 365 SharePoint Online and Done** 

   !IMAGE[New policy](\Media\cond-policy-3.png)
    

   **Click on "Session" and check off "Use Conditional Access App Control"**
 
   !IMAGE[New policy](\Media\cond-policy-4.png)
	
   **Enable the policy and click "Create"**

   !IMAGE[New policy](\Media\cond-policy-5.png)

4. [] Sign out of the Azure Portal and close you browser.

5.  Open your browser and go to the Exchange Web App ```https://outlook.office.com```.

6. Connect using :

   >```@lab.CloudCredential(134).Username```
   >
   >```@lab.CloudCredential(134).Password```

   >:memo: This is done to force the use of conditional access. Once a session has been redirected to Cloud App Security, you will be able to add the application for App Control.

7. [] Go back to Cloud App Security ```https://portal.cloudappsecurity.com```, click on the **gear icon** and click on **Conditional Access App Control.** 

  
   !IMAGE[Menu](\Media\appc-office-1.png)

    **You will see that Exchange Online has appeared as an application and can now be configured.**

   !IMAGE[Menu](\Media\appc-office-2.png)

8. [] Click on **Continue setup** to enable session control and click on **Add**.

   !IMAGE[Setup](\Media\appc-office-3.png)

   !IMAGE[Setup](\Media\appc-office-4.png)
  
   **You're now notified that the application is under Session Control.**

   !IMAGE[Setup](\Media\appc-office-5.png)

9. [] On the left hand side click on Control and then **Policies**.

   !IMAGE[Policies](\Media\appc-office-6.png)

10. [] Create a new session policy with the following settings:

    **Click on "Create Policy" and pick a Session policy.**

    **Name**: *Proxy - Block sensitive files download*

   !IMAGE[Session policy](\Media\appc-office-7.png)

   **Under Session Control Type choose Control filedownload (with DLP)**
 
   !IMAGE[Session policy](\Media\appc-office-8.png)

   **Activity source:**

   **Add Activity Filters:** *Device Tag does not equal Compliant, Domain joined*

   *App equals Office 365 Exchange Online and Office 365 SharePoint Online*

   !IMAGE[Session policy](\Media\appc-office-9.png)

   **Content inspection check "Enabled"**
   **Include files that match a preset expression anc choose US: PII: Social Security Number**


   !IMAGE[Session policy](\Media\appc-office-10.png)

   **Actions:** *Block*

   **Click:** *Customize block message: This file containes SSN information and cannot be downloaded on non-coporate devices.*

   **Click:** *Create an alert for each matching event with the policy's severity*

   **Click:** **Create**

   !IMAGE[Session policy](\Media\appc-office-11.png)

====

# Testing the Session Policy
[:arrow_left: Home](#labs)

Now is time to test our configuration. We will here simulate the userexperience while accessing company apps protected by Cloud App Security from an unmanaged device

1. [] Sign out, close you browser and open the Exchange Web App ```https://outlook.office.com```.
  
   >**Credentials**:
   >```@lab.CloudCredential(134).Username```
   >
   >```@lab.CloudCredential(134).Password```

  **You should receive the following message, as you are redirected through Cloud App Security before accessing the application.*
  
  **Click to continue to Exchange Online.**

   !IMAGE[Warning](\Media\appc-office-12.png)

2. [] You've been directed to Exchange Online and your session is now passing **through** Cloud App Security.

    >:memo: **By taking a look at the the URL, you can verify that your session is actually being redirected to Cloud App Security.**


   !IMAGE[Session](\Media\appc-office-13.png)


3. [] To test our policy, create a new mail and attach the Word document named **Personal employees information.docx** and the Excel spreadsheet named **Workplace Innovation.xlsx** stored on **Client01** desktop. Send the mail to your user, ```@lab.CloudCredential(134).Username```

   !IMAGE[Test](\Media\appc-office-14.png)

4. [] Wait until you receive your email in the webmail. Once the message is received, click on the attached document **Personal employees information.docx**. This will open the file preview.
As you can see, the user can access the document using the Office Online app.

!IMAGE[Warning](\Media\appc-office-15.png)

5. [] Try now to download the **Personal employees information.docx** document. As this file contains social security numbers, the download will be blocked and will trigger an alert in Cloud App Security.

   !IMAGE[Test](\Media\appc-office-16.png)

   !IMAGE[Test](\Media\appc-office-17.png)

6. [] Now let's try to download the **Workplace Innovation.xlsx** spreadsheet. As this file **do not** contain social security numbers, the download will be allowed.

   !IMAGE[Test](\Media\appc-office-18.png)

   !IMAGE[Test](\Media\appc-office-19.png)

   !IMAGE[Test](\Media\appc-office-20.png)

   !IMAGE[Test](\Media\appc-office-21.png)

>:memo: **We just demonstrated App Control capabilities to go further than just allow/block scenarios, based on session risks.**

====

# Reviewing the alerts
[:arrow_left: Home](#labs)

Now that we validated our configuration, let's go back to the admin view.

1. [] Go back to the Cloud App Security console ```https://portal.cloudappsecurity.com```

2. [] Go to the **Alerts** page.

   !IMAGE[Menu](\Media\appc-admin-1.png)

3. [] Click on the alert generated by our policy.

   !IMAGE[Menu](\Media\appc-admin-2.png)

4. [] On the alert page, you can see that the **admin** user tried to download a file named **Personal employees information.docx** but **Session control** blocked the download. You also see the name of the policy that triggered the alert.

   !IMAGE[Menu](\Media\appc-admin-3.png)

5. [] To go further in the investigation, click on  **View all user activity**. This will redirect you to the Activity log where you can see all the user activities.

   !IMAGE[Menu](\Media\appc-admin-4.png)

6. [] By looking at the user activities, you can follow her/his trace:

   > Below, you can see that the user was redirected to Cloud App Security
   !IMAGE[Menu](\Media\appc-admin-5.png)

   > Here, you can see that during her/his session, the user successfuly downloaded a file named **Worplace Innovation.xlsx**, as this file didn't match any blocking policy.
   !IMAGE[Menu](\Media\appc-admin-6.png)

===

# Management with PowerShell

[:arrow_left: Home](#labs) :clock10: 20 min

To help administrators interact with MCAS in a programmatic way, two
Microsoft employees created a non-official PowerShell module for Cloud
App Security. For this lab, you will install this module and discover
the available cmdlets.

Note: the module relies on the Cloud App Security API. You can find its
documentation in the MCAS portal.

!IMAGE[f847xhzx.jpg](\Media\f847xhzx.jpg)

The module is available in the PowerShell gallery and can be installed
using the *Install-Module mcas* command.

!IMAGE[6j16dgs2.jpg](\Media\6j16dgs2.jpg)

More information on the module is available on GitHub:
[https://github.com/powershellshock/MCAS-Powershell](https://github.com/powershellshock/MCAS-Powershell)

After installing the module, read how to connect to MCAS in the
PowerShell help and start exploring the cmdlets.

Hint: you'll have to create an API token in Cloud App Security.

!IMAGE[0x2tzeqd.jpg](\Media\0x2tzeqd.jpg)

Using PowerShell:

1.  [] Review the list of MCAS administrators and when they were granted
    those permissions

2.  [] Review your security alerts and close them in bulk

3.   [] Download a sample SQUID log and send it to MCAS as a snapshot
    report.

4.   [] In the portal, in Discovery, tag some apps as unsanctioned and
    generate a blocking script for your appliance to block access to
    those apps.

5.   [] You are asked to define corporate IP's in MCAS. Subnets go from
    10.50.50.0/24 to 10.50.80.0/24

===

# Log collector troubleshooting

[:arrow_left: Home](#labs) :clock10: 15 min

In this task, you will review possible troubleshooting steps to identify issues in automatic logs upload from the log collector.
There are several things to test at different locations: in the log collector, in MCAS, at the network level.

## Useful commands

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

## Verify the log collector (container) status

1. [] On **Client01**, open a session on PuTTY to **192.168.141.125** and use the credentials below.
    In the PuTTY Configuration window, enter **192.168.141.125** and click **Open**.

    !IMAGE[Putty config](\Media\dis-puttyconfig.png "Putty config")

    Log in using the credentials below.
    >|Username|Password|
    >|---|---|
    >|user01|Passw0rd1|
    >
    >:warning:The password doesn't appear in the command prompt, you can safely press enter to validate the credentials.

2. [] Run the following commands:

    ``` 
    sudo -i
    docker stats
    ```
    !IMAGE[Docker stats](\Media\dis-dockerstats.png "Docker stats")

     >**INFO:** This command will show you the status of the log collector instance.

3. [] Press `Ctrl-C` to end the command.

4. [] Next, run the command below:

    ``` 
    docker logs --details LogCollector
    ```
    !IMAGE[Docker log](\Media\dis-dockerlog.png "Docker log")

     >**INFO:** This command will show you the container logs to verify if it encountered errors when initiating.

### Verify the log collector logs

1. [] Type the following command:

    ``` 
    docker exec -it LogCollector bash
    ```
     >**INFO:** This command will execute the container's bash. You will then be able to execute commands *from inside* of the log collector.

2. [] You can now explore the container filesystem and inspect the **/var/adallom** directory. This directory is where you will investigate most of the issues with the syslog or ftp logs being sent to the log collector.

    ``` 
    cd /var/adallom
    ll
    ```

    !IMAGE[adallom folder](\Media\dis-dockerll.png "adallom folder")

    Go to the following folders and review their log files using `more`:
    * **/adallom/ftp/discovery**: this folder contains the data source folders where you send the log files for automated upload. This is also the default folder when logging into the collector with FTP credentials.
    * **/adallom/syslog/discovery**: if you setup the log collector to receive syslog messages, this is where the flat file of aggregated messages will reside until it is uploaded.
    * **/adallom/discoverylogsbackup**: this folder contains the last file that was sent to MCAS. This is useful for looking at the raw log in case there are parsing issues.

3. [] To validate that logs are correctly received from the network appliance, you can also verify the **/var/log/pure-ftpd** directory and check the transfer log:

    ``` 
    tail transfer.log
    ```

    !IMAGE[FTP logs](\Media\dis-pureftp.png "FTP logs")

4. [] Now, move to the **/var/log/adallom** directory.

    !IMAGE[var log](\Media\dis-varlog.png "var log")

    Go to the following folders and review their content and log files using `ll` and `more` or `tail`:
    * **/var/log/adallom/columbus**: this folder is where you will find log files useful for troubleshooting issues with the collector sending files to Cloud App Security. In the **log-archive** folder you can find previous logs compressed as *.tar.gz* files that could be used to send to support for example.
    * **/var/log/adallom/columbusInstaller**: this is where you will investigate issues with the log collector itself. You will find here logs related to the configuration and bootstrapping of the collector. For example, **trace.log** will show you the bootstrapping process:

    !IMAGE[Bootstrapping log](\Media\dis-bootstrapping.png "bootstrapping log")

## Verify the connectivity between the log collector and Cloud App Security

An easy way to test the connectivity after configuring the log collector is to download a sample of your appliance logs from and use WinSCP to connect to the log collector to upload it and see if it gets uploaded to Cloud App Security, as you did in the previous exercise

!IMAGE[Pending log](\Media\dis-pending.png "Log pending")

>:memo: **NOTE:**  If the log stays in the source folder for too long, then you know you probably have a connection issue between the log collector and Cloud App Security and should go investigate the logs reviewed previously.

===

# Conditional Access App Control with 3rd party apps

[:arrow_left: Home](#labs) :clock10: 45 min

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

[:arrow_up: Top](#conditional-Access-App-Control)

>:warning: As Conditional Access App Control requires the protected app to be federated with your IdP (Azure AD in our case), we will first federate Saleforce with our tenant before moving to the controls configuration. Please go through all the steps exactly as described to avoid any complications further in the lab.

1. [] Create a Salesforce developer account.

    * On Client01, launch a browser and create a Salesforce developer org at this address: [https://developer.salesforce.com/signup](https://developer.salesforce.com/signup).
      This org (or tenant) will allow you to create a test environment to federate with our Azure AD tenant.

      >:memo: Dev Salesforce orgs are available for free but are deleted after extended periods of inactivity.
      >
      > :warning: Use your lab tenant admin user as the Email and Username

      !IMAGE[Dev sign-up](\Media\appc-signup.png "Salesforce sign-up")

    * Fill in the rest of details, click **Sign me up**, accept the **verification email** in your mailBox, and choose a new password. Use the admin password provided in the lab environment if possible.

        !IMAGE[Dev sign-up](\Media\appc-signup2.png "Salesforce sign-up")

        !IMAGE[Dev sign-up](\Media\appc-signup3.png "Salesforce sign-up")

2. [] Configure Salesforce in Azure AD for single sign-on.

    * In Salesforce, go to **Setup**, search for **My Domain** and register a new domain matching your Office 365 lab domain, e.g., **ems123456-dev-ed.salesforce.com**

        !IMAGE[My domain](\Media\sf-mydomain.png "My domain")

        !IMAGE[My domain](\Media\sf-registerdomain.png "My domain")

        !IMAGE[My domain](\Media\sf-registerdomain2.png "My domain")

    * Save **full Salesforce domain name**, including **https://** for the next step, e.g., **https://ems123456-dev-ed.salesforce.com**

        >:warning: Do not close this page !

        !IMAGE[My domain](\Media\sf-registerdomain3.png "My domain")

    * Go to **https://portal.azure.com** were we will add Salesforce as an Enterprise application and configure **single sign-on**, which is a requirement for using App Control.

3. [] Go to **Azure Active Directory**, click on **Enterprise applications**, and add the **Salesforce** application. Call it **SalesforceCAS**, and click on **Add**.

    !IMAGE[Add SF](\Media\appc-app1.png "Add SF")

    !IMAGE[Add SF](\Media\appc-app2.png "Add SF")

    !IMAGE[Add SF](\Media\appc-app3.png "Add SF")

    !IMAGE[Add SF](\Media\appc-app4.png "Add SF")

4. [] Now that Salesforce has been added as an Enterprise application, we have to configure **single sign-on**.

    !IMAGE[Add SF](\Media\appc-app5.png "Add SF")

5. [] Select **SAML** as the SSO method.

    !IMAGE[Add SF](\Media\appc-app6.png "Add SF")

6. [] We will now configure the SAML single sign-on using the information provided by Salesforce when we added our domain.

    >:warning: Do not forget to add **https://** in front of the domain name provided by Salesforce.

    !IMAGE[Add SF](\Media\appc-app7.png "Add SF")

    !IMAGE[Add SF](\Media\appc-app8.png "Add SF")

7. [] Close the pane and go to the **Step 4** of the SSO wizard and click on **View step-by-step instructions**. This page will give you all the required information for configuring Salesforce SSO.

    !IMAGE[Add SF](\Media\appc-app9.png "Add SF")

    !IMAGE[Add SF](\Media\appc-app10.png "Add SF")

8. [] Go back to the **Salesforce admin page** and go to the **Signle sign-on** settings. There, click on the **Edit** button.

    !IMAGE[Add SF](\Media\appc-app11.png "Add SF")

9. [] Enable single sign-on using SAML and click on the **Save** button.

    !IMAGE[Add SF](\Media\appc-app12.png "Add SF")

10. [] Back on the configuration page, under **SAML Single Sign-On Settings**, click on **New**.

    !IMAGE[Add SF](\Media\appc-app13.png "Add SF")

    We will now configure those settings using the information provided in the **Azure AD portal**.

    !IMAGE[Add SF](\Media\appc-app14.png "Add SF")

11. [] For the configuration, you will have to use the information provided at the bottom of the Azure AD **Configure sign-on** pane. Scroll down until you reach the **Quick reference** section.

    !IMAGE[Add SF](\Media\appc-app15.png "Add SF")

12. [] Copy/paste the information from the **Quick reference** to the Salesforce **single sign-on settings** page.

    a.In the Name textBox, type the name of the configuration: **AzureAD**.

    b. Paste **Azure AD SAML Entity ID** value into the **Issuer** textBox.

    c. In the **Entity Id** textBox, type in the **Sign On URL** that you entered in **Step 1**, which should be in this format: **http://company.my.salesforce.com**

    d. Download the **Azure AD Signing Certificate** in the Azure portal and then click **Browse** to upload the downloaded certificate Azure AD Signing Certificate in the **Salesforce setting page**.

    e. As **SAML Identity Type**, select **Assertion contains the Federation ID** from the User object.

    f. As **SAML Identity Location**, select **Identity is in the NameIdentifier element of the Subject statement**.

    g. Paste **Azure AD Single Sign-On Service URL** into the **Identity Provider Login URL** textBox.

    h. Salesforce does not support SAML logout. As a workaround, paste **Azure AD Sign Out URL** into the **Identity Provider Logout URL** textBox.

    i. As **Service Provider Initiated Request Binding**, select **HTTP POST**.

    j. Click Save.

    !IMAGE[Add SF](\Media\appc-app16.png "Add SF")

    !IMAGE[Add SF](\Media\appc-app17.png "Add SF")

13. [] Go back to **My Domain** in Salesforce and in **Authentication Configuration**, click on **Edit**. You will be redirected to another page.

    !IMAGE[Add SF](\Media\appc-app18.png "Add SF")

14. [] In **Authentication Configuration**, un-check the **Login Page** checkBox and check the **Azure AD** checkBox. Click on Save. When back on the configuration page, click on the **login** button to complete the configuration.

    !IMAGE[Add SF](\Media\appc-app19.png "Add SF")

    !IMAGE[Add SF](\Media\appc-app20.png "Add SF")

    !IMAGE[Add SF](\Media\appc-app20a.png "Add SF")

    !IMAGE[Add SF](\Media\appc-app20b.png "Add SF")

---

## Deploy Salesforce to your users

[:arrow_up: Top](#conditional-Access-App-Control)

We will now provide access to our users and validate the SSO experience.

1. [] Go back to the Azure AD portal, within the **SalesforceCAS** app and choose **Users and groups**

    !IMAGE[Assign users](\Media\appc-app21.png "Assign users")

2. [] Click on **+ Add user**. Choose your admin account as the user (e.g.,admin@ems123456.onmicrosoft.com) and select **System Administrator** as the Role. Click on **Assign**

    !IMAGE[Assign users](\Media\appc-app22.png "Assign users")

    !IMAGE[Assign users](\Media\appc-app23.png "Assign users")

    !IMAGE[Assign users](\Media\appc-app24.png "Assign users")

    >:warning: If you want to assign Salesforce to more users, you must create a user for them in Salesforce as we didn't configured **provisionning**. Our admin account already has an an account matching his UPN, created during the Salesforce configuration.

3. [] Test the setup by going to [https://myapps.microsoft.com](https://myapps.microsoft.com) with your admin account and click on the **SalesforceCAS** app. You should then experience SSO to Salesforce.

    !IMAGE[Test SSO](\Media\appc-app25.png "Test SSO")

    !IMAGE[Test SSO](\Media\appc-app26.png "Test SSO")

    :warning: If you receive an error message, verify that you validated the SSO configuration by clicking on the **Log in** button in **step 14**.

---

## Deploy the reverse proxy capability for Salesforce

[:arrow_up: Top](#conditional-Access-App-Control)

The next step of the configuration is to create a Conditional access policy in Azure AD and then complete the configuration in Cloud App Security.

>:memo: Soon, you will be able to perform the full configuration from the Azure AD conditional access policy configuration pane.

1. [] In Azure Active Directory, under **Security**, click on **Conditional access**.

    !IMAGE[Configure policy](\Media\appc-policy1.png "Configure policy")

2. [] Click on **New policy** and create a new policy.

    !IMAGE[Configure policy](\Media\appc-policy2.png "Configure policy")

3. [] Use the following settings in your policy.

    **Name**: Test Cloud App Security proxy
    **Assignment**: choose your admin
    **Cloud apps**: SalesforceCAS
    **Access control / Session**: Use Conditional Access App Control **checkBox**

    !IMAGE[Configure policy](\Media\appc-policy3.png "Configure policy")

    !IMAGE[Configure policy](\Media\appc-policy4.png "Configure policy")

    !IMAGE[Configure policy](\Media\appc-policy5.png "Configure policy")

4. [] Enable your policy and click on **Create**

    !IMAGE[Configure policy](\Media\appc-policy6.png "Configure policy")

    !IMAGE[Configure policy](\Media\appc-policy7.png "Configure policy")

5. [] After the policy was created successfully, open a new browser, ***make sure you are logged out***, go to ```https://myapps.microsoft.com```, connect with the admin user and click on the SalesforceCAS tile.

6. [] Go back to the Cloud App Security portal, and under the settings cog choose **Conditional Access App Control**.

    !IMAGE[Configure policy](\Media\appc-policy8.png "Configure policy")

    You should see know that Salesforce has been discovered and need to continue the setup.

    !IMAGE[Configure policy](\Media\appc-policy9.png "Configure policy")

    >:warning: If the message does not appear, go back to step 5. (After the policy was created...) this time, close the browser and open a new browser in Incognito mode.

    In the dialog that opens, click on **Add**.

    !IMAGE[Configure policy](\Media\appc-policy10.png "Configure policy")

    !IMAGE[Configure policy](\Media\appc-policy11.png "Configure policy")

    The deployment is now **complete**!

---

### Configure device authentication

[:arrow_up: Top](#conditional-Access-App-Control)

Conditional Access App Control is capable to identify company devices using either Azure AD, Intune or certificates (provided by 3rd party MDM for example). We will here simulate the 3rd party MDM scenario, using client certificates.

1. [] Go to the settings and at the bottom of the page, choose **Device identification**.

    !IMAGE[Device authentication](\Media\appc-device1.png "Device authentication")

2. [] Click on the **Browse** button and upload the **CASTestCA.crt** certificate from the **Client Certificate** folder within the **Demofiles.zip** file you've received as the certificate authority root certificate.

    !IMAGE[Device authentication](\Media\appc-device2.png "Device authentication")

    !IMAGE[Device authentication](\Media\appc-device3.png "Device authentication")

    !IMAGE[Device authentication](\Media\appc-device4.png "Device authentication")

---

### Create a session policy

[:arrow_up: Top](#conditional-Access-App-Control)

To control our users sessions to Salesforce, we have now to create a **policy**.

1. [] In the Cloud App Security portal, select **Control** followed by **Policies**.

    !IMAGE[Session policy](\Media\appc-session1.png "Session policy")

2. [] In the **Policies** page, click **Create policy** and select **Session policy**.

    !IMAGE[Session policy](\Media\appc-session2.png "Session policy")

3. [] In the **Session policy** window, assign a name for your policy, such as **Block download of sensitive documents to unmanaged devices** and in the **Session control type** field, select **Control file download (with DLP)**

     !IMAGE[Session policy](\Media\appc-session3.png "Session policy")

4. [] Under **Activity source** in the **Activities matching all of the following** section, select the following activity filters to apply to the policy:

    **Device tags** does not equal **Valid client certificate**
    **App** equals **Salesforce**
    Check the **Enabled** checkBox near **Content inspection**

    !IMAGE[Session policy](\Media\appc-session4.png "Session policy")

5. [] Check the **Include files that match a preset expression** radio button. In the dropdown menu just below the radio button, scroll all the way to the end to choose **US: PII: Social security number** and check the **Don't require relevant context** checkBox, just below the dropdown menu.

    !IMAGE[Session policy](\Media\appc-session5.png "Session policy")

6. [] Under **Actions**, select **Block**. Check the **Customize block message** checkBox, and add a custom message in the textBox that has opened, e.g.: "This file is sensitive"

    !IMAGE[Session policy](\Media\appc-session6.png "Session policy")

7. [] Click on **Create**

8. [] Create a second **Session policy** called **Protect download to unmanaged devices**. In the **Session control type** field Select **Control file download (with DLP)**.

    !IMAGE[Session policy](\Media\appc-session7.png "Session policy")

9. [] Under **Activity source** in the **Activities matching all of the following** section, select the following activity filters to apply to the policy:

    **Device tags** does not equal **Valid client certificate**
    **App** equals **Salesforce**

    !IMAGE[Session policy](\Media\appc-session8.png "Session policy")

10. [] Check the **Enabled** checkBox near **Content inspection**. Under **Actions**, select **Protect**

    !IMAGE[Session policy](\Media\appc-session9.png "Session policy")

11. [] Click on **Create**

12. [] Disable this policy

---

### Test the user experience

[:arrow_up: Top](#conditional-access-app-control)

1. [] Extract the file **silvia.pfx** from the **Client Certificate** folder in **Demo files.zip** file you've received

2. [] Double click on the **silvia.pfx** file, click **Next**, **Next**, enter the password **acme**, click **Next**, **Next**, **Finish**.

3. [] Open a new browser in an Incognito mode

4. [] Go to [https://myapps.microsoft.com](https://myapps.microsoft.com) and login with the admin user.

5. [] Click on the **SalesforceCAS** icon.

6. [] You should now see a certificate prompt. Click on **Cancel**.

    >:memo: This will simulate a connection from an unmannaged device. **In a real demo**, you can open two different browsers, side by side, and show the user experience from a managed and unmanaged device by clicking on **OK** in one browser and **Cancel** in the other.

   !IMAGE[Session policy](\Media\appc-session10.png "Session policy")

7. [] You should then see a Monitored access message, click on **Continue to Salesforce** to continue.

    !IMAGE[Session policy](\Media\appc-session11.png "Session policy")

8. [] Now you are logged in to Salesforce. Click on + and go to Files

    !IMAGE[d0ik67yl.jpg](\Media\d0ik67yl.jpg)

9. [] Upload the files **Personal employees information.docx** and **Protect with Microsoft Cloud App Security proxy.pdf** from the **Demo files.zip** file to the Files page in Salesforce

10. [] Download the **Protect with Microsoft Cloud App Security proxy.pdf** files and see that it is downloaded, and you can open it.

11. [] Download the **Personal employees information.docx** file and see that you get a blocking message and instead of the file, you get a **Blocked...txt** file.

   !IMAGE[wvk16zl2.jpg](\Media\wvk16zl2.jpg)

---

### Test the admin experience

[:arrow_up: Top](#conditional-access-app-control)

1. [] Go back to the Cloud App Security portal, and under **Investigate**  choose **Activity log**

2. [] See the login activity that was redirected to the session control, the file download that was not blocked, and the file download that was blocked because it matched the policy.

    !IMAGE[j0vuo06k.jpg](\Media\j0vuo06k.jpg)
