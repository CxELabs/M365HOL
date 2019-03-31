# Azure Security Center
[:arrow_left: Home](#introduction)

Azure Security Center is a unified infrastructure security management system that strengthens the security posture of your data centers, and provides advanced threat protection across your hybrid workloads in the cloud - whether they're in Azure or not - as well as on premises.

Keeping your resources safe is a joint effort between your cloud provider, Azure, and you, the customer. You have to make sure your workloads are secure as you move to the cloud, and at the same time, when you move to IaaS (infrastructure as a service) there is more customer responsibility than there was in PaaS (platform as a service), and SaaS (software as a service). Azure Security Center provides you the tools needed to harden your network, secure your services and make sure you're on top of your security posture.

> !IMAGE[Map](\Media\sc-net-map.png)

### Azure Security Center addresses the three most urgent security challenges:

- **Rapidly changing workloads** – It’s both a strength and a challenge of the cloud. On the one hand, end users are empowered to do more. On the other, how do you make sure that the ever-changing services people are using and creating are up to your security standards and follow security best practices?
	> !IMAGE[score](\Media\sc-secure-score.png)

- **Increasingly sophisticated attacks** - Wherever you run your workloads, the attacks keep getting more sophisticated. You have to secure your public cloud workloads, which are, in effect, an Internet facing workload that can leave you even more vulnerable if you don't follow security best practices.
	> !IMAGE[score](\Media\sc-recommendations.png)

- **Security skills are in short supply** - The number of security alerts and alerting systems far outnumbers the number of administrators with the necessary background and experience far to make sure your environments are protected. Staying up-to-date with the latest attacks is a constant challenge, making it impossible to stay in place while the world of security is an ever-changing front.
	
	> !IMAGE[Attacks](\Media\sc-brute-force.png)
	
### To help you protect yourself against these challenges, Security Center provides you with the tools to:

- **Strengthen security posture**: Security Center assesses your environment and enables you to understand the status of your resources, are they secure or not?
	
	> !IMAGE[Dashboard](\Media\sc-dashboard.png)

- **Protect against threats**: Security Center assesses your workloads and raises threat prevention recommendations and threat detection alerts.
	
	> !IMAGE[sc-attack-recommendation.png](\Media\sc-attack-recommendation.png)

- **Get secure faster**: In Security Center, everything is done in cloud speed. Because it is natively integrated, deployment of Security Center is easy, providing you with autoprovisioning and protection with Azure services.

The Azure Security Center labs are divided into 2 tracks, a beginner (level 50/100) and an advanced (level 300+) track. 

## [Beginner Track](#beginner-track)

## [Advanced Track](#policy-and-compliance) 

---

===
# Beginner Track
[:arrow_left: Home](#azure-security-center)

Welcome to the labs which will guide you through Azure Security Center (ASC). 
The labs are intended to make you familiar with the different Security Center's features. 

### Exploring the Security Center Overview blade
1. [] Switch to @lab.VirtualMachine(Client01).SelectLink and log in with the password +++@lab.VirtualMachine(Client01).Password+++.
1. [] Navigate to the Azure portal at ```https://portal.azure.com``` and click on **Security Center**.

	> [!NOTE] If necessary, log in using the credentials below:
	> 
	> ```@lab.CloudCredential(134).Username```
	>
	> ```@lab.CloudCredential(134).Password```

2. [] In the Overview blade note the **Policy & compliance** section. This provides an overview of your **secure score**, based on your **resources**, **regulatory standards** and your **subscription coverage**: 

	> !IMAGE[alt text](\Media\policy_compliancy_tile.png)
3. [] Click on the **Subscription coverage** tile.

	> !IMAGE[alt text](\Media\subscription_coverage.png)
	> [!NOTE] This shows you the number of subscriptions and the coverage type.
	> In this lab you will only have one subscription which should be under **Standard coverage** 
    > This view will help you find subscriptions that are not covered by ASC to help identify "shadow IT" subscriptions.
4. [] Go back to the overview blade and note the **Secure Score** tile under Policy & compliance. When you **click on the Secure Score tile**, you can explore your **Secure score by category** by clicking on each tile:

	> !IMAGE[alt text](\Media\secure_score_dashboard.png)

### Security Center Policies

1. [] In the Security Center Overview, click on **Security policy** and then click on your subscription (Azure Pass):

	> !IMAGE[alt text](\Media\policy_setting1.png)

	> [!NOTE] This brings you to the **Security policy settings** for your subscription (*note: if your subscription is not showing, refresh your browser*):  
	> If you click on your subscription for the first time, you will be prompted to enable Security Center's default policy iniative. Click on the button **Assign security policy** to assign it: 
	>
	> !IMAGE[alt text](\Media\security_policy_enable.png)
	>
	> This brings you to the ASC policy settings - which are Azure policies - where you can set the parameters for each policy definition. This is where you can enable or disable a specific policy definition by clicking on the parameter setting:
	>
	> !IMAGE[alt text](\Media\policy_settings_parameters.png)

1. [] Scroll down to the bottom and click on **Assign** to save the Policy initiative.

### Edit Subscription settings (including Data Collection settings)
1. [] Go back to the **Security Policy** blade and under **Policy Management** click on **Edit settings:**

	> !IMAGE[alt text](\Media\subscription_settings.png)
2. [] Notice the 4 options:

	> !IMAGE[alt text](\Media\policy_setting3.png)
	
	- The Auto Provisioning settings - if set to On - will take care of automatic installation of the Microsoft Monitoring Agent (MMA) for all VM's in your subscription, either existing or new.
	
	- **Threat detection** is the new integration with **Microsoft Cloud App Security** (MCAS) and **Windows Defender ATP** (WDATP):

	> !IMAGE[alt text](\Media\policy_setting4.png)

	- **Email notifications** allows you to configure one or more email addresses to be used to send high severity alerts.

	- **Pricing Tier** shows you the difference between what's offered in the Free and Standard tier (it should be set to Standard for our labs):

	> !IMAGE[alt text](\Media\policy_setting5.png)

	> [!NOTE] Notice that there are different pricing plans for **VM's, SQL servers** and **App Services**:
	>
	> !IMAGE[alt text](\Media\policy_setting6.png)

### Edit workspace settings (Including Data Collection settings)
1. [] Go back one more time to the **Security policy** blade, but this time click on **Edit settings** on the line where your **workspace** is listed:

	> !IMAGE[alt text](\Media\policy_setting7.png)
	
	> [!NOTE] This allows you to configure the Windows security events collection settings for your workspace and helps you to perform auditing, investigation and and analysis.
	> Notice that the options are potentially grayed out.
	> If so, you first need to set the workspace Pricing tier to Standard.
2. [] Click on **Pricing tier** and set the pricing tier to **Standard** and click on **Save**
3. [] Click on **Data collection**, you should now be able to configure the Windows security events collection
4. [] Set the collection to **All Events** and click on **Save**

	> !IMAGE[alt text](\Media\policy_setting8.png)
	
	> [!NOTE] You don't have to change the setting **None** to receive alerts in Security Center, change this setting only if you want to do investigations and analysis of your threats in Log Analytics.

### Secure Score

In the beginning of this lab, you explored briefly the **Secure Score** tile. Let's look a little bit deeper into it. 

Security Center mimics the work of the security analyst, reviewing your security recommendations and applying advanced algorithms to determine how crucial each recommendation is.

1. [] Go to the **Security Center Overview** blade
2. [] Click on the **Secure score** tile and then under **Secure score by category** click on **Compute & apps**

	> !IMAGE[alt text](\Media\secure_score_dashboard.png)
3. [] Observe the number under the **Secure score impact column** and the affected **Resource** column. This helps in prioritizing working on the recommendations, the higher the number, the greater the impact 
4. [] Click on a recommendation, for example **Install endpoint protection solution on virtual machines**

	> !IMAGE[alt text](\Media\install_endpoint_protection1.png)
5. [] Click on **Install on 1 VMs**:

	> !IMAGE[alt text](\Media\install_endpoint_protection2.png)
6. [] Select **Microsoft Antimalware** and click on **Create** (scroll down if you don't see the Create button):

	> !IMAGE[alt text](\Media\install_endpoint_protection3.png)

	1. [] Provide your settings of choice, then click **OK**, this starts the endpoint protection installation.

	> [!NOTE] Another example which might not exist in your lab environment is a recommendation for containers:
	>
	> !IMAGE[alt text](\Media\secure_score3.png)

The example above is based on Container security monitoring (you have a lab that deploys a docker container). It shows the **Recommendation impact**, the **Threats** found and the **Remediation steps**

### Continue with the next lab

---

===
# Policy and Compliance
[:arrow_left: Home](#azure-security-center)

##### Estimated lab time: 10 minutes

This lab covers ASC Policy and Regulatory Compliance and guides you through some preview features.

### Regulatory Compliance (Preview)

1. [] From the Azure Security Center overview blade, click on the **Least compliant regulatory standards** tile: 
	
	> !IMAGE[alt text](\Media\policy_compliance_dashboard.png)

1. [] Explore the different Compliance Controls for every Regulatory Compliance: 

	> !IMAGE[alt text](\Media\policy_compliance_details.png)

1. [] When you click on **All** you will see an overview of all the Regulatory Compliance controls per subscription:

	> !IMAGE[alt text](\Media\policy_compliance_all.png)

### Policy Management
This exercise guides you through the current Security Center policies, based on Azure Policy, and shows you where to enable or disable Security Center polices. 

> [!NOTE] At this time we only support out-of-the-box Security Center policies. Support for custom policies is coming in the near future*

1. [] Within the Azure portal, navigate to the **Policy** blade 

	> [!Note] If you can't find Policy, click in the search bar on top of the Azure portal and search for **Policy**
	
	> !IMAGE[alt text](\Media\search_policy.png)

2. [] Click on **Assignments** (under Authoring)
3. [] Notice the 80 policy definitions under that initiative. Click on the **[Preview]: Enable Monitoring in Azure Security Center** initiative:

	> !IMAGE[alt text](\Media\policy_assignment.png)
4. [] Clicking on the initiative allows you to disable the definition:

	> !IMAGE[alt text](\Media\disable_definition.png)

	> [!NOTE] In the near future we will provide custom policies which will support deployIfNotExists type of policies*


### Continue with the next lab

---

===
# VM Protection with Just in Time (JIT) access
[:arrow_left: Home](#azure-security-center)

##### Estimated lab time: 15 minutes

***Requirements**:*
Make sure before continuing with this lab that:
1. [] The VM's that you have deployed earlier are showing as **Monitored by Azure Security Center**. You can find this setting under **Security Center>Compute & Apps***
2. [] You have completed the **Policy and Compliance** lab (specifically implementing the missing NSG recommendation)

	> [!NOTE] In this lab you will protect your VMs with Just-In-Time (JIT) access. JIT has been released, but in this lab we will show you an additional JIT feature, showcasing the JIT integration with Azure
	>
	> The steps below are showcasing a preview feature which needs to be executed using a feature flag

### Enable JIT on a VM in ASC
1. [] Open the Azure portal at ```https://ms.portal.azure.com/?feature.canmodifystamps=true&feature.jitconnect=true```.

2. [] Navigate to **ASC > Just in time VM access** (under Advanced Cloud Defense)
3. [] Under **Recommended** select a VM which you have deployed earlier and click on the button **Enable JIT on**.
4. [] Optionally: add/delete ports by clicking on the 3 dots (...) on the right.
5. [] Click **Save**.
6. [] In the Azure portal (using the same session), navigate to **Virtual Machines**.
7. [] Select the VM you have enabled for JIT and in the Overview blade, click on **Connect**.
8. [] On the opened blade at the right, notice the banner saying **This VM has a just-in-time access policy**.

	> !IMAGE[alt text](\Media\ConnectVM_JIT_Enabled.png)

9. [] Click on the button **Request access**.
10. [] When you have the proper permission, access will be granted and you can now connect to the VM.

### Enable JIT on a VM from the Virtual Machine blade
1. [] In the same browser session, navigate to the **Virtual Machine** blade.
2. [] Select a VM for which you have not enabled JIT.
3. [] Click on **Connect** in the Overview blade.
4. [] Notice the banner saying **To improve security, enable just-in-time access**.

	> !IMAGE[alt text](\Media\EnableJITfromVMblade.png)
5. [] Click on the arrow pointing to the right (as shown in the previous image) and click on the button **Enable just-in-time policy**.

	> !IMAGE[alt text](\Media\EnableJITbutton.png)
6. [] You have now enabled JIT for this VM. You can click on the link **Open Azure Security Center** to edit or disable the policy.
7. [] When you have clicked on the link in the previous step, notice the column last access. That should say Active now, since we just enable JIT access to a VM in the previous steps.

	> !IMAGE[alt text](\Media\JitActiveNow.png)

### [Optional Lab] Enable custom JIT ports with PowerShell
***Requirements**:*

To enable JIT through PowerShell you can leverage the following syntax:
```
$myVM = Get-AzureRmVM -Name <VMname> -ResourceGroupName <resourceGroupName>
Set-AzureRmJitNetworkAccessPolicy -ResourceGroupName "<rescourceGroupName>" -Location "<location>" -Name "default" -VirtualMachine $myVM -Kind "Basic"
```
**In the following excercise you are going to enable JIT for a specific VM, configuring custom ports.**
1. [] Paste the PS code below into in your favorite PowerShell editor.

	```
	$AzureSubID = "<YourAzureSubscriptionID>"
	$vmName = "<YourVMName>"
	$resourceGroupName = "YourResourceGroupName"
	$location = "<YourLocation>"
	$duration = "PT3H" #=3hrs

	$JitPolicy = (@{
		id="/subscriptions/$AzureSubID/resourceGroups/$resourceGroupName/providers/Microsoft.Compute/virtualMachines/$vmName"
	ports=(@{
		number=22;
		protocol="*";
		allowedSourceAddressPrefix=@("*");
		maxRequestAccessDuration=$duration},
		@{
		number=3389;
		protocol="*";
		allowedSourceAddressPrefix=@("*");
		maxRequestAccessDuration= $duration})})

	$JitPolicyArray=@($JitPolicy)

	Set-AzureRmJitNetworkAccessPolicy -Kind "Basic" -Location $location -Name "default" -ResourceGroupName $resourceGroupName -VirtualMachine $JitPolicyArray
	```

2. [] Make sure you replace all the variables within **<>** and update the script with your required ports
3. [] Make sure that you are logged into Azure and that you have selected the Azure subscription which has been given to you
4. [] Excute the script. Make sure that you refresh the Azure portal after executing the script
5. [] Explore in ASC that the custom ports have been added to your JIT enabled VM



### Continue with the next lab

---

===
# Linux Detections
[:arrow_left: Home](#azure-security-center)

##### Estimated lab time: 25 minutes
*The following lab is based on the* <a href="https://gallery.technet.microsoft.com/Azure-Security-Center-0ac8a5ef" target="_blank">Linux Detections playbook</a> *written by Yuri Diogenes. This playbook provides a more comphrensive explanation than is covered in this lab*

In this lab we will explore the new Linux detection's in ASC by executing attacks in a Kali Linux VM that you are going to deploy. You will connect to your deployed Linux VM (Linux-0) leveraging SSH. In case you don't have a SSH client installed, you can install the free edition of MobaXterm <a href="https://mobaxterm.mobatek.net/download.html" target="_blank">here</a>.

#### Create a Kali Linux VM

> [!NOTE] The time to create the Kali Linux VM is approx 5 minutes. Make sure to add a port that enables you to connect.

1. [] In the Azure portal, click on **Create a resource** and search for **Kali Linux** and **create** the VM

	> !IMAGE[alt text](\Media\kali_marketplace.png)

	> [!NOTE] you don't have to wait until the deployment is complete. Proceed with the next exercise*

#### Create Linux users 
1. [] Connect to your Linux VM (Linux-0) that you have deployed earlier (note: not the Kali VM), using your favorite SSH tool
2. [] Create 5 users with the names user1, user2, user3, user4, user5, by leveraging the following Linux command 
	> [!NOTE] Replace "userName" by user1, user2, etc. Set the password to "mypassword1" for user1, "mypassword2" for user2, etc.*

```
sudo adduser <userName>
```


#### Executing a brute force attack
1. [] Connect to the Kali Linux VM with SSH (ensure that your VM deployment in step 1 was successful)
2. [] Navigate to the folder **/usr/share/wordlists**
3. [] Upload the **<a href="https://raw.githubusercontent.com/tianderturpijn/Azure-Security-Center/master/Labs/05%20-%20Linux%20Detections/Files/lab_users.txt" target="_blank">lab_users.txt</a>** and **<a href="https://raw.githubusercontent.com/tianderturpijn/Azure-Security-Center/master/Labs/05%20-%20Linux%20Detections/Files/lab_pass.txt" target="_blank">lab_pass.txt</a>** files to this folder by executing:

+++sudo wget https://raw.githubusercontent.com/tianderturpijn/Azure-Security-Center/master/Labs/05%20-%20Linux%20Detections/Files/lab_users.txt+++

and

+++sudo wget https://raw.githubusercontent.com/tianderturpijn/Azure-Security-Center/master/Labs/05%20-%20Linux%20Detections/Files/lab_pass.txt+++

4. [] Copy the IP address from the Linux Victim VM that you have deployed earlier. We are going to brute force attack this VM
5. [] Type the command below in your Kali VM, and replace "**IP**" with **yourLinuxVM** public IP address

+++hydra -I -L lab_users.txt -P lab_pass.txt <IP> -t 4 ssh+++

6. [] Wait until it finishes, and the result should show you the username and the password that was found

#### Simulate capturing credentials and other useful information
1. [] Run the command below in the Linux Victim VM to simulate an attacker that is trying to start logkeys to set up the system to capture credentials and other useful information: 

	+++logkeys --start+++

	> [!NOTE] Ignore the error message if you don't have logkeys installed. Security Center will detect this attack anyway*

#### Simulate an attack against a web server
Assuming that the attacker has already performed some internal recon using nmap, you are going to simulate an attack against a web server
1. [] Run the command below in the Linux Victim VM:

	+++perl slowloris.pl -dns server.contoso.com+++

	> [!NOTE] Ignore the error message if you don't have this script on your system. Security Center will detect this attack anyway*

#### Command & Control (C2) simulation
Attackers usually will communicate with command and control (C2) to transfer data or to download more  malicious software.
For this example, you will download the EICAR malware test file using WGET for the IP address.  The commands that follows must be executed in the Linux Victim VM:

1. [] First, obtain the IP address of the target:

+++nslookup eicar.com+++

2. [] Now replace the XXX.XXX.XXX.XXX on the command below with the IP obtained from nslookup: 

	+++wget http://XXX.XXX.XXX.XXX/download/eicar.com+++

	> [!NOTE]  if you have issues download eicar.com, try download eicar.txt (same command line, just change the extension).*

#### Review Security Center alerts
1. [] Navigate to the **Security Center>Security Alerts** blade (under Threat Protection)
2. [] Organize the alerts by date by clicking on the Date column, and review the alerts that were generated during this lab, it should look similar like this:

	> !IMAGE[alt text](\Media\Security_incident_detected_Linux.png)

	> !IMAGE[alt text](\Media\Security_incident_detected_Linux2.png)


### Continue with the next lab

---

===
# Logic Apps integration
[:arrow_left: Home](#azure-security-center)

##### Estimated lab time: 25 minutes
In this lab you are going to explore the Security Center integration with Logic Apps.

> [!NOTE] More comprehensive guidance can be found <a href="https://techcommunity.microsoft.com/t5/Security-Identity/Automate-Azure-Security-Center-actions-with-Playbooks-and/td-p/264843" target="_blank">here</a>.

The most asked automation integration use case is how Security Center integrates with ITSM solutions like ServiceNow, so in this lab we are going to explore exactly that integration.

#### Create an ASC test alert

> [!NOTE] if you want to run more validation steps to simulate attacks in VMs/Computers monitored by Azure Security Center (out of scope for this lab) <a href="https://gallery.technet.microsoft.com/Azure-Security-Center-549aa7a4" target="_blank">go here</a>

Before you are going to create the playbook, let's make sure that we have an ASC alert we can act upon.
1. [] Login to your Windows VM that you have created earlier and is monitored by Security Center
2. [] Create a temp folder on c: (c:\temp)
3. [] Copy **calc.exe** from **c:\windows\system32** to **c:\temp**
4. [] Rename **calc.exe** to **ASC_AlertTest_662jfi039N.exe**
5. [] Open a command prompt and execute this file as follows (this will generate an ASC test alert):

	```
	ASC_AlertTest_662jfi039N.exe -foo
	```

6. [] Close the calculator window

### ServiceNow integration
Skip the following steps if you already have a ServiceNow instance 

If you don't want to create an instance of your own and want to leverage a shared environment, make a note of the following:

**Please ask your instructor for the shared ServiceNow URL, username and password**

#### Create a ServiceNow developer instance
1. [] Navigate to ```https://signon.service-now.com/ssoregister.do?redirectUri=https://developer.servicenow.com``` and create a developer instance
2. [] Go through all the steps until you have a developer instance which is active and running
3. [] Take a note of the following information, because you will need that in the following steps:
- The URL of your developer instance, similar to

	**https://dev12345.service-now.com**

	- admin account name & password 

#### Create the ServiceNow playbook


1. [] Navigate to **Security Center>Playbooks** (under Automation & Orchestration)
2. [] Click on **Add Playbook**
3. [] Give your playbook a name like "ASC-Alert-To-ServiceNow", choose your **subscription**, create or choose your **resource group**, select a location and click on **Create**
4. [] When the playbook has been created, select the playbook. This should bring you to the **Logic Apps Designer** (if that does not happen, click on your playbook and click on **Edit**)
5. [] Under Templates, select the **Blank Logic App**
6. [] In the **Seach connectors and triggers field**, type in security center and select **When a response to an Azure Security Center alert is triggered** 

	> !IMAGE[alt text](\Media\asc_trigger.png)
7. [] Click on **+ New Step**
8. [] In the **Seach connectors and triggers field** search for **ServiceNow**
9. [] Under **Actions**, select **Create Record**

	> !IMAGE[alt text](\Media\ServiceNowConnection.png)
10. [] Provide a **Connection Name** and fill in the ServiceNow **Instance Name**, **Username** and **Password** that you have captured in the previous steps and click on **Create**
11. [] Click on **Show advanced options**, as shown below:

	> !IMAGE[alt text](\Media\snow_advanced_options.png)
12. Under **Record Type** dropdown box, select **Incident** (this collapses the incident options)
13. [] In the **Record fields**, scroll down, click once in the fields highlighted below and select the values as shown below:
	
	> [!Note] if you are using a shared ServiceNow environment, put your name in the Short description field as well

	> !IMAGE[alt text](\Media\incident_fields.png)
14. [] Click on **Save**

#### Invoke the ServiceNow playbook from an ASC alert
1. [] Navigate to **Security Center>Security Alerts**
2. [] Look for the Azure Security Center test alert and click on it

	> !IMAGE[alt text](\Media\test_alert.png)
3. [] Under Attacked Resource, click on your VM
4. [] On the bottom of the alert properties, click on **View playbooks**

	> !IMAGE[alt text](\Media\view_playbooks_button.png)

5. [] Click on **Run playbook**

	> !IMAGE[alt text](\Media\run_playbook.png)
6. [] Switch to the playbook history and notice the status, but you can also click on the playbook to see details and even runtime information 

	> !IMAGE[alt text](\Media\playbook_history.png) 

	> !IMAGE[alt text](\Media\playbook_history_details.png)

7. [] Switch to your ServiceNow developer instance and check for a new created incident record

	> !IMAGE[alt text](\Media\snow_record.png)

### Continue with the next lab

---

===
# Preview Features
[:arrow_left: Home](#azure-security-center)

##### Estimated lab time: 15 minutes
This optional lab points you to a number of preview features for you to explore.

#### Container Security Monitoring
> [!Note] This exercise also shows you how to use Azure CLI straight from the Azure portal

1. [] In the Azure portal click on the **Cloud Shell** icon in the upper right, next to your account, as shown below 

	> !IMAGE[alt text](\Media\Azure_cli.png) 

2. [] If you are prompted for selecting Bash or PowerShell, select **Bash**

	> !IMAGE[alt text](\Media\bash_selection.png) 

3. [] If you are receiving a message that you have no storage mounted, click on **Create storage**

	> !IMAGE[alt text](\Media\create_storage.png) 

4. [] This creates a cloud shell session: 

	> !IMAGE[alt text](\Media\bash_cloudshell.png) 

5. [] Create a new resource group for your container by typing in the following (replace **myResourceGroup** with your name of choice)

	```
	az group create --name <myResourceGroup> --location eastus
	```

6. [] The following command creates a Docker container with a small web app written in Node.js 
	
	> [!Note] The container name must be in **lowercase**

```
az container create --resource-group <yourResourceGroupName> --name <yourContainerName> --image microsoft/aci-helloworld --dns-name-label <yourDnsLabel> --ports 80
```
7. [] Wait for the container to be deployed

	> !IMAGE[alt text](\Media\container_create.png)

	> !IMAGE[alt text](\Media\container_created.png) 

8. [] Verify that the container has been created under your resource group in the Azure portal: 

	> !IMAGE[alt text](\Media\resourcegroup.png) 

	> [!NOTE] It takes some time for the container to become visible in Security Center* 

#### Explore the new Container tab under Compute & Apps
1. [] The new container view in Security Center is accessible through a feature flag. Copy and paste the following URL in your Azure portal session:
	
	```
	https://aka.ms/asc_containers_preview
	```
	

	**This shows the container in Security Center:** 

	> !IMAGE[alt text](\Media\container_in_asc.png) 

2. [] Clicking on the container shows more details:

	> !IMAGE[alt text](\Media\docker_details.png) 

	> !IMAGE[alt text](\Media\docker_details2.png)



### Continue with the next lab

---

===
# Automation with PowerShell
[:arrow_left: Home](#azure-security-center)

##### Estimated lab time: 15 minutes
In this lab you are going to explore what the ASC automation options with PowerShell are.

#### Requirements
You have received an Azure pass or you have a test environment available. Please don't use these lab exercises in a production environment (or at your own risk) 

For using these labs in combination with Labs On Demand (LOD), open an incognito/in-private browser session on your laptop and login to the Azure portal leveraging the LOD account (like for example admin@ems123456.onmicrosoft.com)

## AzureRm PowerShell cmdlets installation
1. [] Navigate to the Azure portal and click on **Virtual machines**
2. [] Click on your Windows virtual machine (**Win-0**)
3. [] Under **Overview** copy the **Public IP address** of your VM
4. [] Start a remote desktop session (RDP) and login to your VM, note: your default administrator account is is **azureadmin** (unless you have configured an other one)
5. [] Open an administrator PowerShell session
5. [] Install the AzureRm modules by typing in ***Install-Module -Name AzureRM -Verbose***

## Security Center PowerShell cmdlets installation
Security Center provides automation support through PowerShell as well.
The ASC PowerShell cmdlets can be downloaded from <a href="https://www.powershellgallery.com/packages/AzureRM.Security/0.2.0-preview" target="_blank">here</a>.

**Install the Security Center cmdlets in the Azure VM Win-0**
*The ASC cmdlets are in preview. It is recommended to install the ASC cmdlets in the Windows VM (like Win-0) that you have deployed earlier in your lab environment to avoid conflicts which might occur on your system.*

In the same administrator PowerShell session which you have already open on the Win-0 VM, install the ASC cmdlets by typing in the following commands and confirm all with "**yes**" if prompted:

***Tip**: copy and paste the script below in a PowerShell ISE administrator session* 
**Important**: Before executing the last step, make sure that you close the PowerShell session and open a new one

```
#Install NuGet
Install-Module -Name PowerShellGet -Force -Verbose 

#Install AzureRm.Profile
Install-Module -name AzureRM.Profile -Force -Verbose 

#Update the modules to ensure you have the latest versions
Update-Module PowerShellGet -Force -Verbose
Update-Module AzureRM.Profile -Force -Verbose

#Important: close your PowerShell session and open a new one

# Install the AzureRm.Security module
Install-Module -Name AzureRM.Security -AllowPrerelease -Verbose
```

### Exploring the Security Center cmdlets
***Assumptions**:
You have installed the AzureRm and Security Center PowerShell cmdlets, as mentioned in the beginning of this lab* 

Open on the **Win-0** VM an administrator PowerShell session.
Explore the Security Center cmdlets by executing:
```
Get-Command -Module AzureRm.Security
```
#### Configuring email settings

**Note**: make sure that in your favorite PowerShell editor, you are logged into Azure (using Login-AzureRmAccount)*

In the previous exercise we have configured the email notifications through ARM, let's now explore how to configure email settings through PowerShell.
Copy and paste the following script in your PowerShell editor:

```
#Set a security contact for the current scope. For the parameter "-Name", you need to use "default1", "default2", etc.

Set-AzureRmSecurityContact  -Name "default1" -Email "vader@empire.com" -Phone "12345" -AlertAdmin -NotifyOnAlert
```
#### Check the new email settings:
Run the following command:
```
Get-AzureRmSecurityContact
```

### Auto Provisioning settings
ASC's Auto Provisioning settings set to On will install the MMA VM extension automatically. Some customers prefer that to happen automatically, some customers like to control that.

#### Get the current Auto Provisioning settings
To retrieve the current Auto Provisioning settings, run the following:
```
Get-AzureRmSecurityAutoProvisioningSetting
```


#### Set Auto Provisioning to On

Enable automatic MMA VM extension installation:
```
Set-AzureRmSecurityAutoProvisioningSetting -Name "default" -EnableAutoProvision
```

#### Set Auto Provisioning to Off

Disable automatic MMA VM extension installation:
```
Set-AzureRmSecurityAutoProvisioningSetting -Name "default"
```

A sample which contains how to use the AzureRm.Security module can be found <a href="https://github.com/tianderturpijn/ASC/blob/master/PowerShell/Samples/ASC-Samples.ps1" target="_blank">here</a>. 
*In a later lab we will test drive how to configure Just-In-Time (JIT) with PowerShell.* 



### Continue with the next lab

---

===
# Automation with ARM
[:arrow_left: Home](#azure-security-center)

##### Estimated lab time: 15 minutes
In this lab you are going to explore what the ASC automation options are leveraging Azure Resource Manager (ARM) templates

#### Requirements
1. [] You have completed **Automation with PowerShell**
2. [] You have received an Azure pass or you have a test environment available. Please don't use these lab exercises in a production environment (or at your own risk) 

For using these labs in combination with Labs On Demand (LOD), open an incognito/in-private browser session on your laptop and login to the Azure portal leveraging the LOD account (like for example admin@ems123456.onmicrosoft.com)



##  ARM Template deployment

#### Explore the ASC settings in the portal

1. [] Open a browser and login to the  <a href="https://portal.azure.com" target="_blank">Azure Portal</a>
2. [] Click on **Security Center**
3. [] Click on **Security Policy**
4. [] On the line where it shows your subscription, click on **Edit settings**
5. [] Explore the settings, specifically the **email notification settings**.
	
	> !IMAGE[alt text](\Media\asc_emailsettings.png)

For the first ARM deployment exercise we are going to start with configuring the **Email notification** settings

#### Explore the Email Notifications ARM template

1. [] Open the ```https://raw.githubusercontent.com/tianderturpijn/Azure-Security-Center/master/Labs/09%20-%20Automation%20with%20ARM/Files/configureAscEmailNotifications.json``` ARM template for email notifications in a new browser window
2. [] Notice the ARM template **parameter** allowed values. These values are case sensitive and are mandatory.
3. [] Under the ARM resources section  (**Microsoft.Security/securityContacts**), use "default1", "default2", etc. as value for the field name. These are mandatory fields and can only be used in this format

#### Deploy the Email Notifications ARM template

1. [] Open your favorite PowerShell editor
2. [] Login to the Azure Portal by using **Login-AzureRmAccount**
3. [] Make sure that you have selected your Azure subscription which has been provided to you by using **Select-AzureRmSubscription** (only necessary if you have multiple subscriptions)
4. [] ASC resides at the subscription level, so we are going to target our ARM template deployment at the same level (instead of deploying it at the resource group level)
5. [] The syntax is *New-AzureRmDeployment -TemplateFile* `yourArmTemplateFile` (note: we are going to use a prepared ARM template JSON file)
6. [] Copy and paste the below in your PowerShell session and execute it:
**Note**:

- Use a proper email format like luke@skywalker.com
- Use only numbers (no spaces) as a phone number
- Fill in **On** or **Off** for alerts (case sensitive)
- If you receive an error running the New-AzureRmDeployment cmdlet, make sure to run this: **Install-Module -Name AzureRM.Resources**
```
New-AzureRmDeployment -TemplateFile 'https://raw.githubusercontent.com/tianderturpijn/Azure-Security-Center/master/Labs/09%20-%20Automation%20with%20ARM/Files/configureAscEmailNotifications.json -location westus2'
```

7. [] After a successful completion, switch to the Azure portal and **refresh** (Ctrl+F5) the ASC blade and verify that the email settings have been updated according to the values in the template.
8. [] **[Optional exercise]** You can copy the template and use your own values

## Workspace creation

Security Centers stores MMA collected information (and more) in a Log Analytics workspace. ASC can create a default workspace automatically. This exercise is focused on using a custom workspace.

In the next exercise we will create a new workspace which will be used as your default ASC workspace.

#### Create a Log Analytics workspace
> [!NOTE] if you already have deployed a Log Analytics workspace you can skip this exercise, or create a second one to test drive multiple custom workspaces reporting up to ASC.*

You can either create a workspace through the Azure portal, leverage an ARM template, or use PowerShell.
1. [] Navigate to the Azure portal and create a Log Analytics workspace **OR**:
2. [] Copy, paste and run the following PowerShell script "as is" to deploy an ARM template which will deploy the <a href="https://raw.githubusercontent.com/tianderturpijn/Azure-Security-Center/master/Labs/09%20-%20Automation%20with%20ARM/Files/createNewOmsWorkspace.json" target="_blank">newOmsWorkspace</a> ARM template: (optionally you can use your own values in the script below, like location, etc.) 
```
$myGuid = New-Guid
$RG = New-AzureRmResourceGroup -Name 'ASC-Lab-2' -Location 'eastus'

New-AzureRmResourceGroupDeployment -Name myWorkspaceDeploy -ResourceGroupName $RG.ResourceGroupName `
 -TemplateFile 'https://raw.githubusercontent.com/tianderturpijn/Azure-Security-Center/master/Labs/09%20-%20Automation%20with%20ARM/Files/createNewOmsWorkspace.json' `
 -omsWorkspaceName ("ASC-workspace-$myGuid") -omsWorkspaceLocation "eastus" -Verbose
```
3. [] Switch to the Azure portal and open the **Security Center** blade
4. [] Click on **Security policy**
5. [] Your new created workspace should be listed under the **Policy Management** view 

	> [!NOTE] the ARM template deploys a new workspace with concatenating the workspace name with a GUID to ensure uniqueness.*
 
#### Change the Pricing tier and data collection settings of your workspace 
You can set the pricing tier and data collection settings per workspace, which is often not clear to customers, therefore we are going to set it in the portal instead of through automation (although you can automate it)
1. [] In the **Policy Management** view where your workspace is listed, click on **Edit settings** 

	> !IMAGE[alt text](\Media\pricing_workspace1.png)
2. [] Click on **Pricing tier** and note that by default it is set to **Free**
3. [] Click on **Standard** and click on **Save**
4. [] Click on **Data collection**
5. [] Under **Windows security events**, select **All events** (by default it is set to none)
6. [] Click on **Save**

#### Collect the WorkspaceID and WorkspaceKey
For the next (**optional**) exercise where we deploy a more advanced ASC ARM template, we are going to need the workspace details.
1. [] In the Azure portal, navigate to Log Analytics
2. [] Click on your **workspace**
3. [] On the Overview blade, make a note of the **Resource group name** and the **Subscription ID**
4. [] Click on **Advanced settings** and also make a note of the **workspaceID** and the **primaryKey**, since you need those  values for the next exercise

### [Optional Lab] More complex ARM template deployment

#### Deploy a more complex ASC configuration ARM template
Now that you have explored how to deploy an ARM template to configure an ASC setting, you are going to explore how to deploy a more complex ARM template. 
ASC stores MMA collected data (and more) in a Log Analytics workspace. In a more complex environment, you often will find an existing Log Analytics workspace which needs to be integrated with ASC (aka the Central Workspace scenario).
The following lab assumes that a (Central) Log Analytics workspace already exists (although this can be deployed with an ARM template at the same time) and you are going to configure ASC to use the existing Log Analytics workspace. In addition we are going to enable **Auto Provisioning** which will deploy the MMA extension automatically, as you would configure it in the portal, like this:

> !IMAGE[alt text](\Media\autoProvisioning_custom_%20Workspace.png)

Also we will configure ASC policies through the ARM template.

#### Explore the ASC advanced ARM template
1. [] Open the <a href="https://raw.githubusercontent.com/tianderturpijn/Azure-Security-Center/master/Labs/09%20-%20Automation%20with%20ARM/Files/configureAscAdvanced.json" target="_blank">ASC Advanced ARM template</a> in a new browser window and explore it.
2. [] Look closely at the **parameters** and their allowed values
3. [] Under **resources**, observe the several settings that we will configure like autoProvisioning, workspace settings, etc. The recommendation policies can be configured one by one, but in this lab we will set the value to **On** or **Off** for all of them.
4. [] For ARM templates, it is recommended that you use a parameter file to pass values during a deployment if you don't want to type them in. In this lab we will just type them in and paste some values

#### 3 - Deploy the ASC advanced ARM Template

Your are going to deploy an ARM template which will configure a number of ASC settings and you will connect ASC with your workspace.

1. [] Switch to the PowerShell session where you are logged into Azure, with the correct subscription selected and copy & paste the following script. Make sure to update all values with the information you have collected in the previous exercises:
```
New-AzureRmDeployment -TemplateFile 'https://raw.githubusercontent.com/tianderturpijn/Azure-Security-Center/master/Labs/09%20-%20Automation%20with%20ARM/Files/configureAscAdvanced.json' `
-name 'AscAdvancedDeployment' -Location 'eastus' -autoProvisioning 'On' -workspaceName '<yourWorkspaceName>' `
-workspaceSubscriptionId '<yourAzuresubscriptionID>' -workspaceResourceGroup '<resourceGroupNameOfTheWorkspace>' `
-emailSecurityContact 'john@contoso.com' -phoneSecurityContact '12345' -alertNotifications 'On' -alertsToAdmin 'On' `
-securitySettings 'On'
```
*Note: it might take a couple minutes for the Azure portal to catch up and show your updated settings (like autoProvision)*



### Continue with the next lab

---

===
# Additional Labs
[:arrow_left: Home](#azure-security-center)

This lab contains additional exercises. 

### File Integrity Monitoring (FIM)
1. [] Navigate to the Security Center blade in the Azure Portal
2. [] Under Advanced Cloud Defense, click on File Integrity Monitoring: 

	> !IMAGE[alt text](\Media\fim.png) 
3. [] Click on Enable on the line where it lists your workspace

	> !IMAGE[alt text](\Media\fim_enable.png) 
4. [] Keep the default values and click on **Enable File Integrity Monitoring**

	> !IMAGE[alt text](\Media\fim_settings.png) 
5. [] Click on Settings: 

	> !IMAGE[alt text](\Media\fim_settings1.png) 
6. [] Under Windows Files, add folder to be recursively monitored (e.g. c:\ASC-Labs): 

	> !IMAGE[alt text](\Media\windows_file_tracking.png) 
6. [] Login to either your Windows or Linux VM and make some changes (e.g. for Windows, create the c:\asc-labs folder and create a file in that folder)
6. [] Check back later to see the changes made on your system

===