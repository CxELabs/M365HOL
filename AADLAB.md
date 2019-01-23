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


