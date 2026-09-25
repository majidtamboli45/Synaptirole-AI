# Configuring Network Interfaces in CentOS

> Source: https://www.geeksforgeeks.org/linux-unix/how-to-configure-network-interfaces-in-centos/

A network interface is a connection point between a computer and a network (private or public). It is typically implemented using a Network Interface Card (NIC), which can be physical hardware or software-based. For example, loopback addresses like 127.0.0.1 (IPv4) and ::1 (IPv6) are virtual interfaces used internally by the system.
- Network interfaces can be physical (hardware NIC) or virtual (loopback, VLAN, etc.)
- CentOS 9 uses NetworkManager with keyfile format instead of older ifcfg files
- Interfaces can be configured using Static IP (manual) or DHCP (automatic)
- Interface names are based on hardware location and type, making them predictable
- Configuration can be done via CLI (nmcli) or GUI (nmtui) tools
Network Interface naming
Network interface names are assigned based on both their physical and virtual characteristics.
1. Physical Interfaces
Physical interfaces are associated with actual hardware (NICs) installed in the system. Their names are based on the slot number and port number of the adapter.
Format:
e<slot_number><port_number>
Examples:
- e0, e1: Single-port adapters
- e0c, e0d: Multi-port adapters
2. Virtual Interfaces
Virtual interfaces are software-based and do not correspond to physical hardware. These are commonly used for internal communication or advanced networking setups like VLANs.
VLAN Interface Format
<physical_interface>-<vlan_id>
<interface_group>-<vlan_id>
- VLAN interfaces are created by combining a base interface name with a VLAN ID.
Examples:
- e7-2
- ifgrp1-2
3. Interface group names
Interface groups are user-defined and must follow these rules:
- Must begin with a letter
- Spaces are not allowed
- Maximum length is 15 characters
- Must be unique (not already in use)
Examples:
- web_ifgrp
- ifgrp3
Method 1: Network Configuration via Command Line (CentOS 9)
We will configure network interfaces for Static IP and DHCP using the command line. It is important to note that in older versions of CentOS (below 9), network configuration files used the ifcfg format, which is now deprecated.
- CentOS 9 uses the keyfile format, managed by NetworkManager.
Configuration of a static IP and DHCP
Step 1: List Available Network Devices
Before configuring the network, you need to identify available network interfaces.
Command:
nmcli  d
- nmcli: Command-line tool for NetworkManager
- d: Displays all network devices
Output:
Note: Before configuring the network, you need to identify available network interfaces.
Step 2: Locate Network Configuration Files
Access existing network configuration files stored by NetworkManager. There you can see the current information about your network.
Command:
cd /etc/NetworkManager/system-connections
ls
- /etc/NetworkManager/system-connections: Directory where keyfile-based configurations are stored
- ls: Lists available configuration files
Output:
Step 3: Configure Network Interface
In this step, we configure key network parameters such as IP address, gateway, DNS, and interface mode.
Example 1: Set Static IP Address (IPv4 Address)
Assign a fixed IP address to the interface
Command:
nmcli connection modify enp0s3 ipv4.addresses 10.0.2.15/24
- connection modify: Modifies an existing connection
- enp0s3: Interface name (may vary on your system)
- ipv4.addresses: Sets the IP address
- /24: Subnet mask (equivalent to 255.255.255.0)
Output:
Example 2: Set Gateway
Define the default gateway for outbound traffic
Command:
nmcli connection modify enp0s3 ipv4.gateway 10.0.2.2
Output:
Example 3: Configure DNS Server
Set DNS server for domain name resolution
Command:
nmcli connection modify enp0s3 ipv4.dns "8.8.8.8"
For multiple DNS:
nmcli connection modify enp0s3 ipv4.dns "8.8.8.8 8.8.4.4"
- ipv4.dns: Specifies DNS server(s)
- Multiple DNS values are separated by space
Example 4: Set Interface Mode (Static or DHCP)
Define whether IP configuration is manual or automatic
Static IP (Manual) Command:
nmcli connection modify enp0s3 ipv4.method manual
DHCP (Automatic) Command:
nmcli connection modify enp0s3 ipv4.method auto
- manual: Requires IP, gateway, DNS to be set manually
- auto: Uses DHCP to automatically assign network settings
Output:
Step 4: Restart Network Connection
Apply the changes by restarting the connection.
Command:
nmcli connection down enp0s3
nmcli connection up enp0s3
- connection down: Deactivates the network connection
- connection up: Reactivates it with updated settings
Output:
Step 5: Verify the Configuration
Ensure that the network settings have been applied correctly
Command:
nmcli device show enp0s3
- Displays detailed information about the interface
Output:
Method 2: GUI( Graphical user interface way)
CentOS also allows network configuration using a graphical interface through the nmtui tool. This is a terminal-based text GUI that simplifies setting IP addresses, gateways, DNS, and switching between static and DHCP modes.
Install NetworkManager TUI (if not installed)
Ensure the GUI tool is available for configuration
Command:
sudo yum -y install NetworkManager-tui
- Installs the nmtui tool via the YUM package manager
- Now that the Network Manager tool is installed follow the below steps to set the interface through GUI.
Step 1: Open Network Manager (nmtui)
Open the text-based GUI interface for network management
Command:
nmtui
- nmtui launches a terminal-based GUI for NetworkManager
- Provides menus to edit connections, activate interfaces, and set system hostname
Output:
Step 2: Choose “Edit a Connection”
- Select “Edit a connection” and press Enter
- Choose your network interface (like enp0s3)
- Press Enter to edit
Output:
Note: Interface names may vary depending on your system. This menu allows configuration of IP address, gateway, DNS, and connection method (Static or DHCP)
Step 3: Configure Network Interface
Set IP address, gateway, DNS, and connection method through GUI
For Static IP:
- Set IPv4 Configuration: Manual
Enter:
- IP Address (with subnet, like 10.0.2.15/24)
- Gateway (like 10.0.2.2)
- DNS servers (like 8.8.8.8, 8.8.4.4)
Output:
DHCP Configuration:
- Set IPv4 Configuration: Automatic
- No need to manually enter IP, gateway, or DNS
Output:
Note: Make sure to select the correct method depending on whether you want manual or automatic IP assignment
Step 4: Enable Required Options
Ensure the following options are enabled, these settings ensure stable and automatic network connectivity.
- Automatically connect: Enables auto-connection at system boot
- Available to all users: Optional but recommended for shared systems
Output:
Step 5: Save and Apply Changes
Apply and persist all configuration changes
- Select OK to save changes in the nmtui interface
- Exit the nmtui tool
Step 6: Restart Network Connection
Apply the changes by restarting the connection
Command:
service network restart
Output:
Step 7: Verify the Configuration
Confirm that the network settings have been applied correctly
Commands Using nmcli:
nmcli device show enp0s3
- nmcli device show: Displays detailed information about the selected interface
Commands Using ip:
ip addr show enp0s3
- ip addr show: Shows IP addresses and network state
