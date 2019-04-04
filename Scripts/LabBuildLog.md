# Lab Build Log

## Host System

- Disabled IE ESC for Admin
- Installed Hyper-V and Remote Access Roles
    > Username **LabUser**\
    > Password **M3654life!**
- Downloaded Google Chrome
- Open guest window
- Downloaded ISO Images
    - Windows 10 Enterprise 1809
    - Windows Server 2016
    - SQL Server 2017
    - Ubuntu Desktop 18.04 LTS
- Opened HV Manager and created Internal Switch LabInternal

- Assigned IP Address 192.168.0.254/24 to virtual ethernet adapter for LabInternal
- Install DHCP and DNS server roles
- Configure DNS to only server to labinternal adapter
- Add forwarder to lab DNS
- Create new scope for DCHP
- Lab host as router and DNS
- Installed Windows 10 VM as parent disk
    > Username **LabUser**\
    > Password **M3654life!**\
    > Answer to all questions **Microsoft**