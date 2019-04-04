# VM Environment Setup

The labs in this course are designed to run with minimal infrastructure.  The simplest way to set up this environment is to use the Quick Create function of Windows 10 Client Hyper-V. If this is not available, you can accomplish a similar setup using a trial Windows 10 ISO from microsoft.com. To complete all labs in the MCAS section you will also need a linux VM.  We will walk through building an Ubuntu VM using the Quick Create function of Windows 10 Client Hyper-V.

## VM Build Out
In this step, we will build out the VMs necessary to complete the Hands-On labs.  On a host Virtualization Platform, create new Windows 10 and Ubuntu VMs.  To do this using Windows 10 Client Hyper-V, follow the instructions below. If you use an alternate VM platform, install Windows 10 and Ubuntu and skip to [VM Configuration](#vm-configuration).

1. Launch the Hyper-V Manager
 
1. In the Hyper-V Manager, under the **Actions** pane on the right, click **Quick Create...**

    > ![hvqc](\Media\hvqc.png)
1. In the Create Virtual Machine dialog, under **Select operating system**, select **Windows 10 dev environment**.
1. Click the **Create Virtual Machine** button.

    > ![CVM](\Media\CVM.png)
1. The image will begin downloading. While this is downloading, repeat the process by clicking **Quick Create...** in the Hyper-V actions pane again.
1. This time, select **Ubuntu ##.##.# LTS** and click the **Create Virtual Machine** button.

    > ![CVM2](\Media\CVM2.png)
1. While these VMs build out, return to the Hyper-V Manager, and under the **Actions** pane on the right, click **Virtual Switch Manager...** 

    > ![VSM](\Media\VSM.png)
1. In the Virtual Switch Manager, in the **Create virtual switch** pane, select **Internal** and press the **Create Virtual Switch** button.

    > ![CVS](\Media\CVS.png)
1. In the Virtual Switch Proterties pane, under **Name**, replace **New Virtual Switch** with **LabInternal**, and press **OK**. 


1. Once the VMs have finished provisioning, click **Edit settings...**.

    > ![EditVM](\Media\EditVM.png)
1. In the Settings dialog, under Add Hardware, click on **Network Adapter** in the list and click the **Add** button.

    > ![AddNA](\Media\AddNA.png)
1. In the Network Adapter Properties, in the **Virtual switch** drop-down, select **LabInternal**.

    > ![VSLI](\Media\VSLI.png)
1. Click **OK** to complete modification of the virtual machine settings.
1. Start the Windows VM and step through the initial setup.  When you reach the **Sign in with Microsoft** screen, click **Domain join instead** in the lower left corner.

    > ![DJI](\Media\DJI.png)
1. Create a local user and complete the setup steps.
1. Next, follow the earlier steps to add a **second network adapter** to the **Ubuntu VM** attached to the **LabInternal** virtual network.
1. Step through the initial setup steps for the Ubuntu VM.

---

## VM Configuration
In this step, we will configure the VMs for initial use in the hands on lab environment

1. Log into your **Windows 10 VM** and open **Microsoft Edge**.
1. Browse to the link below to download the scripts and files required for completion of the lab.  

    >```https://aka.ms/M365LabScripts```

1. Create a new folder called **C:\Scripts** on your Windows 10 system and **extract the contents of the downloaded zip file** to this folder.
1. Next browse to ```https://aka.ms/AIPClient``` to download the **AIP Client**.
1. Click on Download and check the box next to **AzInfoProtection_PREVIEW_1.48.1.0.exe** and click **Next**.

