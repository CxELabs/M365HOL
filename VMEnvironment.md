# VM Environment Setup

The labs in this course are designed to run with minimal infrastructure.  The simplest way to set up this environment is to use the Quick Create function of Windows 10 Client Hyper-V. If this is not available, you can accomplish a similar setup using a trial Windows 10 ISO from microsoft.com. To complete all labs in the MCAS section you will also need a linux VM.  We will walk through building an Ubuntu VM using the Quick Create function of Windows 10 Client Hyper-V.

## VM Build Out
In this step, we will build out the VMs necessary to complete the Hands-On labs.  On a host Virtualization Platform, create new Windows 10 and Ubuntu VMs.  To do this using Windows 10 Client Hyper-V, follow the instructions below.

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




Download zip package and extract to C:\Scripts folder