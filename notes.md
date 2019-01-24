1. [] Switch to @lab.VirtualMachine(VictimPC).SelectLink and log in with the password +++@lab.VirtualMachine(VictimPC).Password+++.

1. [] Switch to @lab.VirtualMachine(AdminPC).SelectLink and log in with the password +++@lab.VirtualMachine(AdminPC).Password+++.

1. [] Switch to @lab.VirtualMachine(ContosoDC).SelectLink and log in with the password +++@lab.VirtualMachine(ContosoDC).Password+++.

1. [] Switch to @lab.VirtualMachine(Scanner01).SelectLink and log in with the password +++@lab.VirtualMachine(Scanner01).Password+++.

1. [] Switch to @lab.VirtualMachine(Client01).SelectLink and log in with the password +++@lab.VirtualMachine(Client01).Password+++.

1. [] Switch to @lab.VirtualMachine(Client02).SelectLink and log in with the password +++@lab.VirtualMachine(Client02).Password+++.

1. [] Switch to @lab.VirtualMachine(Client03).SelectLink and log in with the password +++@lab.VirtualMachine(Client03).Password+++.

1. [] Log in using the credentials below:

	+++@lab.CloudCredential(134).Username+++

	+++@lab.CloudCredential(134).Password+++

Removed from WorkplaceJoin Setup

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

Add to

	Swap MCAS and AATP order in lab as MCAS is day 2

	Change instruction to Windows E5 Trial Code

    Update in MCAS instructions

	prep

	step 4 fix horizontal images
	Fix numbering by indenting 2nd warn block
	Open admin powershell
	Delete Open PS image as icon does not exist on Client01
	Add credentials for get-cred
	remove extra close paren in reference

	need steps to sign up for a box developer account
	go to ```https://developer.box.com```
	Click Get Started
	Enter the values below in the fields, check the box, and solve the captcha.  Then click Submit
	In a new tab, go to ```https://outlook.office365.com/OWA```
	Choose a time zone and click save
	In the inbox, click on Other mail and click the Verify Email link sent from Box
	In the window that opens, enter ```@lab.CloudCredential(134).password``` in each of the boxes and click the Update button

	fix a/b numbering under BOX section
	remove first under box 
	Change second to read, Click the plus to add a second connector
	Note about if the test now does not come up, close the dialog and click on Box to see the Test now link

	AIP section
	line break before first image
	Note that there is now also an option to search within AIP protected files. Not doing that in this lab, but good to know this option exists.


	Delegate access
	Consider moving the section unless necessary to ensure US Employees group imported
	Open a new private tab and connect to the [Cloud App Security portal] https://portal.cloudappsecurity.com with mcasAdminUS an should be
	Close Edge and open a new InPrivate window and connect to ```https://portal.cloudappsecurity.com``` with mcasAdminUS@@lab.cloudcredential(134).TenantName an