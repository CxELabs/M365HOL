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

> [!KNOWLEDGE] The script runs the code below. This script is available online at https://aka.ms/labscripts
	>
	>  

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

Add scripts instructions for 

 ScannerInstall
 AuthToken
 ConfigureRepo
 StartDiscovery
 StartEnforce
 ExchangeMFRs x2


    Update in MCAS instructions


	Delegate access
	Consider moving the section unless necessary to ensure US Employees group imported
	Open a new private tab and connect to the [Cloud App Security portal] https://portal.cloudappsecurity.com with mcasAdminUS an should be
	Close Edge and open a new InPrivate window and connect to ```https://portal.cloudappsecurity.com``` with mcasAdminUS@@lab.cloudcredential(134).TenantName an