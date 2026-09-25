# Linux Firewall

> Source: https://www.geeksforgeeks.org/linux-unix/linux-firewall/

Linux Firewall is a security system that monitors and controls incoming and outgoing network traffic based on predefined rules. It protects your system from unauthorized access, malicious traffic, and potential attacks. The two most commonly used firewall tools in modern Linux distributions are firewalld (default in RHEL, CentOS, Fedora) and iptables (traditional, widely used).
- Controls inbound and outbound network traffic.
- Allows or blocks traffic based on IP addresses, ports, protocols, and services.
- Supports dynamic rule management without restarting the service.
- Works with zones (firewalld) and chains/tables (iptables).
- Helps secure servers, desktops, and embedded Linux systems.
Dynamic Firewall Management in Linux
firewalld is a dynamic firewall management tool in Linux that uses the concept of zones to define trust levels for network connections. Zones can represent different environments, such as public, home, work, or internal. Each zone has its own set of rules, and firewalld allows real-time changes without interrupting existing connections.
- Zone-Based Management: Assign different rules to different network zones based on trust level.
- Dynamic Updates: Modify firewall rules on the fly without restarting services.
- Service and Port Control: Open or close ports and services per zone.
- Rich Rules Support: Advanced rules for specific IP addresses or protocols.
Checking firewalld Status
Command:
sudo systemctl status firewalld
- Checks whether firewalld is running
If inactive need to start it using:
Command:
sudo systemctl start firewalld.
Output:
Example 1: Allowing SSH (Secure Shell or Secure Socket Shell) traffic
SSH (Secure Shell) is a protocol used to securely access and manage remote servers over an encrypted connection. Enabling SSH in the firewall ensures administrators can remotely log in to the system safely.
- This command adds a firewall rule to allow incoming SSH traffic in the public zone by enabling the predefined SSH service (port 22/tcp).
Command:
sudo firewall-cmd --zone=public --add-service=ssh --permanent
sudo firewall-cmd --reload
- firewall-cmd: The command-line utility to configure firewalld.
- --zone=public: Specifies the network zone to apply the rule (e.g., public, home, work).
- --add-service=ssh: Adds the predefined ssh service, which automatically opens port 22/tcp.
- --permanent: Makes the rule persist across reboots.
- --reload: Applies the changes immediately without restarting firewalld.
Output:
Example 2: Allowing incoming traffic on a specific port
Some applications run on non-standard ports instead of predefined services. Allowing a specific port enables external users to access such applications while keeping other ports restricted.
- This command creates a firewall rule to allow incoming TCP traffic on port 8080 in the public zone.
- Commonly used for web apps, dashboards, or test servers running on custom ports.
Command:
sudo firewall-cmd --zone=public --add-port=8080/tcp --permanent
sudo firewall-cmd --reload
- --add-port=8080/tcp: Opens TCP traffic on port 8080.
- 8080: The port number to open.
- tcp: Specifies the protocol (TCP or UDP).
- Useful when deploying applications using non-standard ports, like internal dashboards or testing servers.
Output:
Example 3: Blocking incoming traffic on a specific IP address
Blocking a specific IP address helps prevent unauthorized access or mitigate malicious activity such as brute-force attacks. firewalld uses rich rules for advanced filtering based on IP, protocol, or other conditions.
- This command adds a rich rule to block all incoming IPv4 traffic from a specific IP address.
Command:
sudo firewall-cmd --zone=public --add-rich-rule='rule family="ipv4" source address="192.168.52.1" reject' --permanent
sudo firewall-cmd --reload
- --add-rich-rule: Adds a detailed rule with multiple conditions.
- rule family="ipv4": Specifies the IP version (IPv4 or IPv6).
- source address="192.168.52.1": The IP address to block.
- reject: Denies access and optionally sends a rejection notice.
Output:
Example 4: Remove a Rule
Removing unnecessary rules keeps your firewall clean and reduces security risks. It also helps avoid conflicts if services change over time.
- This command removes an existing firewall rule that allows SSH traffic in the public zone.
- It is used to revoke previously granted access.
Commands:
sudo firewall-cmd --zone=public --remove-service=ssh --permanent
sudo firewall-cmd --reload
- --remove-service=ssh: Deletes the predefined SSH service rule.
Example 5: View Active Rules
Verifying active firewall rules is crucial to ensure security policies are correctly applied. This command provides a summary of all ports, services, and rich rules in a specific zone.
- This command displays all currently active firewall rules for the default zone.
- Useful for auditing firewall settings and confirming that rules are correctly applied.
Command:
sudo firewall-cmd --list-all
- --list-all: Displays all current services, ports, and rich rules for the selected zone.
Types of Linux Firewalls
Linux provides several firewall solutions, each with different levels of complexity and usability.
- firewalld: A modern, dynamic firewall management tool that uses zones to manage trust levels. It allows real-time rule updates without restarting the service and is the default in RHEL, CentOS, and Fedora.
- iptables: A traditional and powerful firewall utility based on rules, tables, and chains. It provides fine-grained control over network traffic and is widely used in servers and legacy systems.
- UFW (Uncomplicated Firewall): A simplified frontend for iptables, designed to make firewall configuration easier. Commonly used in Ubuntu and beginner-friendly environments.
- nftables: A newer firewall framework that replaces iptables. It offers improved performance, simplified syntax, and better integration with modern Linux kernels.
iptables Traditional Firewall
iptables is a Linux software utility used for controlling network traffic. It performs packet filtering, NAT (Network Address Translation), and packet manipulation, allowing administrators to define rules for incoming and outgoing traffic.
Working of iptables
When a packet reaches a Linux system, it passes through a structured framework of tables, chains, and rules
- A packet enters the system.
- It is processed by a table, depending on the type of operation.
- Within the table, it passes through a chain (stage of processing).
- Matching rules determine whether the packet is accepted, dropped, or modified.
Predefined tables in iptables
- Security Table: The security table integrates with security frameworks like SELinux to enforce system security. It applies MAC (Mandatory Access Control) rules and access control policies, helping administrators manage permissions and security labels. Its built-in chains are INPUT, OUTPUT, FORWARD, and SECMARK.
- Mangle Table: The mangle table is used to modify packet headers and set packet marks. It supports advanced traffic management, routing decisions, and Quality of Service (QoS) features such as ToS and DSCP. Its built-in chains include PREROUTING, INPUT, FORWARD, OUTPUT, and POSTROUTING.
- NAT Table: The NAT (Network Address Translation) table allows multiple devices to share a single public IP address by translating source or destination addresses. It is commonly used in routers and gateway systems. Its built-in chains are PREROUTING, POSTROUTING, and OUTPUT.
- Raw Table: The raw table processes packets before connection tracking begins. It is used for low-level packet handling and creating exceptions to standard tracking rules. Its built-in chains are PREROUTING and OUTPUT.
- Filter Table: The filter table is the default table for packet filtering, controlling traffic flow to and from the system. It evaluates rules based on source and destination IP, port, and protocol. Its built-in chains include INPUT, OUTPUT, and FORWARD.
Chains in iptables
chains define the stage at which packets are processed within a table. Each chain consists of a series of rules that determine how matching packets are handled. The three main built-in chains are INPUT, OUTPUT, and FORWARD, each serving a distinct purpose in packet filtering and traffic control.
- INPUT: The INPUT chain handles all incoming packets destined for the local system. Rules in this chain determine whether external traffic is allowed to reach the server or is blocked, providing a first line of defense for system security.
- OUTPUT: The OUTPUT chain processes packets generated by the local system. Rules here control what outgoing traffic can leave the system, ensuring sensitive data or system communications follow defined security policies.
- FORWARD: The FORWARD chain is used when the system routes packets between networks. Packets that pass through the system to another network interface are evaluated against rules in this chain, which is particularly important for systems functioning as routers or gateways.
Note: Each chain uses rules specifying source/destination IP, protocol, and port, with actions like ACCEPT (allow), DROP (discard), or REJECT (block with notification).
Installation and Configuration of a Firewall
Before using iptables or switching firewall tools, ensure the required packages are installed and properly configured.
Install iptables
For RHEL / CentOS / Fedora:
sudo dnf install iptables iptables-services
- Installs iptables along with service management utilities.
For Ubuntu / Debian:
sudo apt install iptables
- Installs iptables package for Debian-based systems.
Start and Enable iptables Service (RHEL-based systems)
sudo systemctl start iptables
sudo systemctl enable iptables
- Starts the iptables service
- Ensures it runs automatically after reboot
Disable firewalld (If Using iptables)
Avoid conflicts between firewalld and iptables, as both manage firewall rules.
sudo systemctl stop firewalld
sudo systemctl disable firewalld
- Stops the firewalld service
- Prevents it from starting on boot
Notes:
- Do not run firewalld and iptables together, as they can overwrite each other’s rules.
- On modern systems, firewalld or nftables is recommended over raw iptables.
- Always ensure SSH access is allowed before applying restrictive rules.
Basic Examples of iptables
Example 1: Allow ICMP (Ping) Traffic
Allow ICMP traffic so the server can respond to ping requests for connectivity testing and network diagnostics.
Syntax:
sudo iptables -I/-A chain_name -s source_ip -p protocol --dport port_number -j action
Example Command:
sudo iptables -A INPUT -p icmp -j ACCEPT
- iptables: Command-line utility to configure firewall rules
- -A INPUT: Appends the rule to the INPUT chain (incoming traffic)
- -p icmp: Matches ICMP protocol (used by ping)
- -j ACCEPT: Allows the matching packets
Output:
Example 2: Allow SSH from a Specific IP
Restrict SSH access so that only a trusted IP address can connect to the server, improving security.
sudo iptables -A INPUT -s 192.168.160.51 -p tcp --dport 22 -j ACCEPT
- -A INPUT: Adds the rule to incoming traffic
- -s 192.168.160.51: Specifies the allowed source IP address
- -p tcp: Matches TCP protocol
- --dport 22: Matches destination port 22 (SSH)
- -j ACCEPT: Allows the connection
Output:
Example 3: Drop All Traffic from an IP
Block all incoming traffic from a specific IP address, typically used to stop malicious or unwanted access.
Syntax:
sudo iptables -A chain_name -s source_ip -j action
- -A chain_name: Applies rule to a chain
- -s source_ip: Specifies the IP address to match
- -j action: Action to perform (DROP blocks silently)
Command:
sudo iptables -A INPUT -s 192.168.52.1 -j DROP
- -A INPUT: Applies the rule to incoming traffic
- -s 192.168.52.1: Specifies the IP address to block
- -j DROP: Silently discards packets without sending a response
Output:
Example 4: List All Rules
Display all active firewall rules to verify configuration and monitor traffic handling.
Command:
sudo iptables -L -v -n
- -L: Lists all rules in each chain
- -v: Shows detailed (verbose) output including packet and byte counts
- -n: Displays numeric IP addresses and ports (faster, no DNS lookup)
Example 5: Flush (Reset) All Rules
Remove all existing firewall rules to reset the configuration, typically used during troubleshooting or reconfiguration.
Command:
sudo iptables -F
- -F: Flushes (deletes) all rules from all chains
Output:
