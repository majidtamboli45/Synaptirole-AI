# ifconfig Command in Linux

> Source: https://www.geeksforgeeks.org/linux-unix/ifconfig-command-in-linux-with-examples/

The ifconfig (interface configuration) command is a Linux networking utility used to view and configure network interfaces. It allows administrators to inspect interface details such as IP addresses, MAC addresses, packet statistics and link status.
- Displays network interface details such as IP address, MAC address, MTU and packet statistics
- Allows administrators to enable or disable network interfaces
- Helps in monitoring interface activity and diagnosing network problems
- Can assign IP addresses, netmasks and broadcast addresses
- Part of the net-tools package, commonly used in traditional Linux systems
Example: Finding Your IP Address in Linux
To view information about all network interfaces on your Linux system
Command:
ifconfig
- ifconfig: Without arguments displays all active network interfaces
- Shows important networking information such as IPv4 and IPv6 addresses, MAC address, MTU size, Packet transmission statistics
Output:
Here,
1. eno1 (Wired / Ethernet Network Interface)
eno1: flags=4163<UP,BROADCAST,RUNNING,MULTICAST>  mtu 1500
- eno1: Your wired LAN (Ethernet) card
- UP: Interface is enabled
- RUNNING: Cable is connected & link is active
- BROADCAST: Can send broadcast packets
- MULTICAST: Supports multicast traffic
- mtu 1500: Maximum data size per packet
Practical use:
- Used when your laptop is connected via LAN cable
- MTU value is important for VPN connections, corporate networks and performance tuning
IPv4 Address Information:
inet 192.168.42.0 netmask 255.255.255.0  broadcast 192.168.42.255
- inet: IPv4 address assigned to the interface
- netmask: Defines network range
- broadcast: Address used to communicate with all devices in the network
Practical use:
- Helps identify which network you are connected to
- Used while configuring routers, DHCP, static IPs
IPv6 Address:
inet6 fe80::4d2c:0edb:a219:acf0
- Automatically assigned IPv6 link-local address
Practical use:
- Required for IPv6 communication
- Common in modern networks, cloud environments and IoT devices
MAC Address:
ether c8:4b:d6:62:bb:da
- Hardware address of the network interface.
Practical use:
- MAC filtering in routers
- Network access control
- Device identification
Packet Statistics:
RX packets / TX packets
- RX (Receive): Data packets received
- TX (Transmit): Data packets sent
Practical use:
- Monitor network traffic usage
- Diagnose network performance issues
Error Indicators:
errors dropped overruns frame
- errors: Packet errors detected
- dropped: Packets discarded
- overruns: Buffer overflow
- frame: Frame alignment errors
Practical use:
- Detect faulty cables
- Identify driver problems
- Diagnose hardware interference
2. lo (Loopback Interface)
lo: flags=73<UP,LOOPBACK,RUNNING> mtu 65536
inet 127.0.0.1
- lo: Loopback interface
- Used for internal system communication
- 127.0.0.1 refers to localhost
Practical use:
- Test services locally
- Run applications or servers on the same machine
3. wlp0s20f3 (Wireless / Wi-Fi Interface)
Wireless network interface used for Wi-Fi connections
wlp0s20f3: flags=4163<UP,BROADCAST,RUNNING,MULTICAST>
inet 10.143.75.50
- Your Wi-Fi adapter
- Active and connected
Practical use:
- Provides wireless internet connectivity
- Often used in Kali Linux for wireless penetration testing
Syntax
ifconfig [interface] [options]
- interface: Name of the network interface you want to configure or display information for (e.g., eth0, wlan0).
- options: Various command-line options that can be used to modify the behavior of ifconfig.
Installing ifconfig (net-tools)
Many modern Linux distributions do not include ifconfig by default. If you see the error. You need to install the net-tools package.
For Debian, Ubuntu and related Linux distributions.
Command:
sudo apt install net-tools
For RHEL (Red Hat Enterprise Linux) based Distributions
Command:
dnf install net-tools
Options available in `ifconfig` Command
| Option | Description | Syntax | 
|---|---|---|
| -a | Display all interfaces, including those that are down | ifconfig -a | 
| -s | Display a short list, instead of details | ifconfig -s | 
| -v | Run the command in verbose mode | ifconfig -v | 
| up | Activate the driver for the given interface | ifconfig interface up | 
| down | Deactivate the driver for the given interface | ifconfig interface down | 
| add addr/prefixlen | Add an IPv6 address to an interface | ifconfig interface add addr/prefixlen | 
| del addr/prefixlen | Remove an IPv6 address from an interface | ifconfig interface del addr/prefixlen | 
| [-]arp | Enable/disable the use of ARP protocol on an interface | ifconfig interface [-]arp | 
| [-]promisc | Enable/disable promiscuous mode on an interface | ifconfig interface [-]promisc | 
| [-]allmulti | Enable/disable all-multicast mode for an interface | ifconfig interface [-]allmulti | 
| mtu N | Set the Maximum Transfer Unit (MTU) | ifconfig interface mtu size | 
| --help | Display help related to the ifconfig command | ifconfig --help | 
Public IP Address in Linux
A public IP address is a globally unique identifier assigned to a device that is directly connected to the internet. It enables other devices and services on the internet to locate and communicate with that device. Public IP addresses are assigned by the Internet Assigned Numbers Authority (IANA) through Internet Service Providers (ISPs) and are globally route table across the internet.
Public IPs are commonly required for:
- Web servers and website hosting services
- Cloud servers, APIs and online applications
- Systems that need to be accessed from outside a local network
Example: Viewing the Public IP Address in Linux
Linux systems can retrieve the public IP address by querying external web services using command-line tools.
Command:
curl ifconfig.me
- This command retrieves your public IP address from a web service.
Methods to Display the Public IP Address
1. Using wget with ifconfig.me
Command:
wget -qO- ifconfig.me
Output:
2. Using dig with OpenDNS
This command uses the OpenDNS resolver to query your public IP address.
Command:
dig +short myip.opendns.com @resolver1.opendns.com
Output:
3. Using curl with icanhazip.com
This command queries the icanhazip.com service to obtain your public IP address.
Command:
curl icanhazip.com
Output:
4. Using wget with icanhazip.com
Similar to the curl command, this uses the icanhazip.com service to fetch your public IP address.
Command:
wget -qO- icanhazip.com
Output:
5. Using Google/OpenDNS resolver
This command utilizes the DNS service provided by Google to resolve your public IP address.
Command:
host myip.opendns.com resolver1.opendns.com
Output:
Private IP Address in Linux
A private IP address is used within a local network such as a home, office or organizational intranet. These addresses are not directly accessible from the internet. Private IP addresses are defined by the Internet Engineering Task Force (IETF) in RFC 1918 and are reserved exclusively for internal networking.
Private IP Address Ranges
- 10.0.0.0 – 10.255.255.255 (10.0.0.0/8)
- 172.16.0.0 – 172.31.255.255 (172.16.0.0/12)
- 192.168.0.0 – 192.168.255.255 (192.168.0.0/16)
Devices inside the same private network can communicate directly using these addresses. To access the internet, private IPs rely on Network Address Translation (NAT), which maps them to a shared public IP.
Example: Viewing Private IP Addresses in Linux
Linux provides multiple tools to display private IP addresses assigned to network interfaces.
Command:
ifconfig
or
ip addr
Methods to Display Private IP Addresses
1. Using hostname
The -I option with the hostname command can be used to display the private IP address of your machine.
Command:
hostname -I
Output:
2. Using nmcli (NetworkManager command-line tool)
If you're using NetworkManager, this command filters out IPv4 addresses associated with your network interfaces.
Command:
nmcli dev show | grep IP4.ADDRESS
Output:
3. Using awk with ifconfig
This command uses the awk tool to filter and print only the private IP addresses from the ifconfig output.
Command:
ifconfig | awk '/inet / {print $2}'
Output:
4. Using grep with ip
This command uses grep with Perl-compatible regular expressions to extract private IP addresses from the ip command output.
Command:
ip addr show | grep -oP 'inet \K[\d.]+'
Output:
5. Using ss (socket statistics)
This complex command lists the IP addresses to which the system is listening for incoming connections.
Command:
ss -tunapl | grep LISTEN | awk '{print $5}' | cut -d: -f1 | sort -u
Output:
Linux ifconfig Command Examples
1. Display Specific Network Interface
This command shows detailed information about the specified interface, eth0.
ifconfig eth0
2. Enable a Network Interface
This command activates the specified network interface, eth0.
ifconfig eth0 up
3. Disable a Network Interface
This command deactivates the specified network interface, eth0.
ifconfig eth0 down
4. Assign an IP Address
This command assigns the IP address 192.168.1.10 to the specified network interface, eth0.
ifconfig eth0 192.168.1.10
5. Set a Netmask
This command sets the netmask for the specified network interface, eth0.
ifconfig eth0 netmask 255.255.255.0
6. Set a Broadcast Address
This command sets the broadcast address for the specified network interface, eth0.
ifconfig eth0 broadcast 192.168.1.255
7. Change the MAC Address
This command changes the MAC address of the specified network interface, eth0.
ifconfig eth0 hw ether 00:1a:2b:3c:4d:5e
8. Add an Alias to a Network Interface
This command adds an alias with IP address 192.168.1.20 to the specified network interface, eth0.
ifconfig eth0:0 192.168.1.20
9. Remove an Alias from a Network Interface
This command removes the alias eth0:0 from the specified network interface.
ifconfig eth0:0 down
