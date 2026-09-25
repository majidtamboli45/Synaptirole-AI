# ip Command in Linux

> Source: https://www.geeksforgeeks.org/linux-unix/ip-command-in-linux-with-examples/

The ip command in Linux is used to configure and manage network interfaces, IP addresses, and routing. It is part of the iproute2 package and replaces older networking tools like ifconfig and route.
- Displays and manages IP addresses and network interfaces.
- Used to configure routing tables and network rules.
- Supports both IPv4 and IPv6 networking.
- Provides detailed and real-time network information.
[Example]: Displaying Network Interfaces and IP Addresses
Command:
ip addr show
Output:
This command displays details such as interface names (`eth0`, `wlan0`), MAC addresses, IPv4 and IPv6 addresses, subnet masks, and more.
Syntax
ip [OPTIONS] OBJECT {COMMAND | help}
Where:
- OPTIONS: Additional options that modify the behavior of the command.
- OBJECT: The networking component you want to interact with (e.g., link, address, route).
- COMMAND: The action you want to perform on the specified object.
- help: Displays help information about the specified object or command.
[Approach 1]: Configuring Network Interfaces
For example: to set the IP address of an interface:
sudo ip addr add 192.168.1.100/24 dev eth0
The IP address `192.168.1.100` with a subnet mask of `24` (equivalent to 255.255.255.0) to the eth0 interface.
[Approach 2]: Managing Routing Tables Using 'ip' Command
Example 1: Deleting a Route
sudo ip route delete 10.0.0.0/24 via 192.168.1.1 dev eth0
This command removes the route to the `10.0.0.0/24` network via the gateway `192.168.1.1` through the `eth0` interface.
Example 2: Changing the Default Gateway
sudo ip route add default via 192.168.1.254 dev eth0
This command sets `192.168.1.254` as the new default gateway through the `eth0` interface.
[Approach 3]: Changing Interface State
Example 1: Bringing an Interface Up
sudo ip link set eth0 up
This command brings the `eth0` interface up, enabling it to send and receive network traffic.
Example 2: Changing MTU (Maximum Transmission Unit)
sudo ip link set eth0 mtu 1500
This command sets the MTU of the `eth0` interface to `1500` bytes.
[Approach 4]: Displaying Detailed Interface Statistics
Example 1: Monitoring Interface Traffic
watch -n 1 "ip -s link show eth0 | grep 'RX bytes'"
This command continuously monitors the receive (RX) traffic on the `eth0` interface, updating every second.
Example 2: Displaying Interface Errors
ip -s link show eth0 | grep -E 'errors|dropped'
This command shows statistics related to packet errors and dropped packets on the eth0 interface.
Options available in the IP command
| Options | Description | Example Usage | 
|---|---|---|
| address | Show all IP addresses associated with all network devices. | ip address | 
|  | Show information related to a specific interface. | ip address show (interface) | 
| link | Display link layer information, including characteristics of link layer devices currently available. | ip link | 
|  | Show statistics of various network interfaces. | ip -s link | 
|  | Show statistics of a specific network interface. | ip -s link show (interface) | 
| route | Display routing table, showing the route packets your network will take. | ip route | 
| add | Assign an IP address to an interface. | ip a add (ip_address) dev (interface) | 
| del | Delete an assigned IP address from an interface. | ip a del (ip_address) dev (interface) | 
| up | Enable a network interface. | ip link set (interface) up | 
| down | Disable a network interface. | ip link set (interface) down | 
| monitor | Monitor and display the state of devices, addresses, and routes continuously. | ip monitor | 
| help | Display help information about the `ip` command. | ip help | 
| neighbour | View MAC address of devices connected to the system. | ip neighbour | 
1. address
This option is used to show all IP addresses associated with all network devices.
Command:
ip address
Output:
This will show the information related to all interfaces available on our system.
2. link
It is used to display link layer information; it will fetch characteristics of the link layer devices currently available. Any networking device which has a driver loaded can be classified as an available device.
Command:
ip link
Output:
This link option when used with -s option is used to show the statistics of the various network interfaces.
Command:
ip -s link
Output:
And, to get information about a particular network interface, add an option show followed by the name of the particular network interface.
ip -s link show (interface)
For Example:
ip -s link show enp3s0
Output:
3. monitor
This command can monitor and display the state of devices, addresses and routes continuously.
Command:
ip monitor
Output:
4. neighbour
This command is used to view the MAC address of the devices connected to your system.
Command:
ip neighbour
Output:
- STABLE: This means that the neighbor is valid, but is probably already unreachable, so the kernel will try to check it at the first transmission.
- REACHABLE: This means that the neighbor is valid and reachable.
- DELAY: This means that a packet has been sent to the stable neighbor and the kernel is waiting for confirmation.
Delete an ARP entry:
ip neighbour del (ip_address) dev interface
For Example:
ip neighbour del 192.168.0.200 dev enp3s0
Add an ARP entry:
ip neighbour add (ip_address) dev interface
For Example:
ip neighbour add 192.168.0.200 dev enp3s0
