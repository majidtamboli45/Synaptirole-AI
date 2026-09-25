# iptables command in Linux

> Source: https://www.geeksforgeeks.org/linux-unix/iptables-command-in-linux-with-examples/

iptables is a Linux command-line firewall tool used to control and secure network traffic by defining packet-filtering rules. It works with the Netfilter framework in the Linux kernel to decide whether packets are accepted, dropped, or forwarded.
- Controls incoming, outgoing, and forwarded traffic based on IP addresses, ports, and protocols.
- Uses tables, chains, and rules to define how network packets should be handled.
- Performs actions such as ACCEPT, DROP, REJECT, or FORWARD when packets match rules.
- Helps protect servers and networks by allowing trusted traffic and blocking unauthorized access.
Core Components of iptables
iptables works using a structured model consisting of tables, chains, rules, and targets.
Tables in Iptables
Tables are collections of chains that define how packets should be processed for specific purposes, iptables uses different tables for handling various types of packet processing.
- filter: Default used table for packet filtering. It includes chains like INPUT, OUTPUT and FORWARD.
- nat: Related to Network Address Translation. It includes PREROUTING and POSTROUTING chains.
- mangle: For specialised packet alteration. Inbuilt chains include PREROUTING and OUTPUT.
- raw: Configures exemptions from connection tracking. Built-in chains are PREROUTING and OUTPUT.
- security: Used for Mandatory Access Control
Built-in Chains of Tables in Iptables
Chains are ordered lists of rules that determine what action should be taken when a packet matches certain conditions. Each table contains predefined chains
- INPUT: A set of rules for packets destined to localhost sockets.
- FORWARD: For packets routed through the device.
- OUTPUT: It is locally generated packets, meant to be transmitted outside.
- PREROUTING: It is used for modifying packets as they arrive.
- POSTROUTING: IIt helps in modifying packets as they are leaving.
Rules
Rules are the conditions applied to packets within chains. A rule matches a packet if it meets certain criteria. Common criteria include:
- Source IP address: Blocks or allows traffic coming from a specific computer or device. Example: Stop all traffic from 192.168.1.100.
- Destination IP address: Blocks or allows traffic going to a specific computer or device. Example: Allow traffic only to 10.0.0.5.
- Protocol type: Filters traffic based on the type of communication, like TCP (web), UDP, or ICMP (ping).
- Port number: Controls access to certain services or programs on a computer. Example: Allow web traffic on port 80 but block SSH on port 22.
Targets (Actions)
Targets specify what happens when a packet matches a rule:
- ACCEPT: Allow the packet to continue its path.
- DROP: Silently discard the packet with no response.
- REJECT: Discard the packet but send an error response to the sender.
- QUEUE: Send the packet to userspace for custom processing.
- RETURN: Stop processing the current chain and resume at the previous chain.
Example:
Imagine you want to block SSH from a specific IP but allow all other traffic:
iptables -A INPUT -p tcp --dport 22 -s 192.168.1.100 -j DROP
- Chain: INPUT
- Protocol: TCP
- Destination Port: 22 (SSH)
- Source IP: 192.168.1.100
- Target: DROP
Output:
This rule drops incoming SSH connections from 192.168.1.100 while letting other traffic pass normally.
Syntax
iptables [options] [chain] [rule specification] [target]
- options: Specifies the action to perform (like adding, deleting, or listing rules)
- chain: Defines where the rule is applied (INPUT, OUTPUT, FORWARD)
- rule specification: Conditions to match packets (protocol, port, IP address, etc.)
- target: Action to take on matched packets (ACCEPT, DROP, REJECT)
User-Defined Chain Operations
User-defined chains can also be created. The following are the some of the possible one with examples:
1. -A, --append : Add a rule to a chain
Add a rule to a chain
Syntax:
iptables [-t table] --append [chain] [parameters]
Example:
This command drops all the traffic coming on any port.
iptables -t filter --append INPUT -j DROP
Output:
2. -D, --delete : Remove a rule from a chain
Remove a rule from a chain
Syntax:
iptables [-t table] --delete [chain] [rule_number]
Example:
This command deletes the rule 2 from INPUT chain.
iptables -t filter --delete INPUT 2
Output:
3. -C, --check: Check if a rule exists
Check if a rule is present in the chain or not.
Syntax:
iptables [-t table] --check [chain] [parameters]
- Returns 0 if rule exists
- Returns 1 if rule does not exist
Example:
This command checks whether the specified rule is present in the INPUT chain.
iptables -t filter --check INPUT -s 192.168.1.123 -j DROP
Output:
Common Parameters in iptables
The iptables command uses parameters to define which packets to match and what actions to take. These parameters help you control traffic precisely. One of the most important parameters is -p (or --proto), which specifies the protocol of the packet, such as TCP, UDP, or ICMP. This allows you to filter traffic based on how the data is being sent.
1. -p, --proto: Protocol
Is the protocol that the packet follows. Possible values maybe: tcp, udp, icmp, etc.
Syntax:
iptables [-t table] -A [chain] -p {protocol_name} -j {target}
Example:
This command appends a rule in the INPUT chain to drop all udp packets.
sudo iptables -t filter -A INPUT -p udp -j DROP
- -t filter: Use the default filter table
- -A INPUT: Append this rule to the INPUT chain
- -p udp: Match packets using the UDP protocol
- -j DROP: Drop matching packets silently
Output:
This command does not produce a visible output. After running it, all incoming UDP traffic will be blocked according to the rule.
Verifying Command:
iptables --list
2. -s, --source: Source Address
Is used to match with the source address of the packet.
Syntax:
iptables [-t table] -A [chain] -s {source_address} [target]
Example: Accept all packets from 192.168.1.230
This command appends a rule in the INPUT chain to accept all packets originating from 192.168.1.230.
iptables -t filter -A INPUT -s 192.168.1.230 -j ACCEPT
- -t filter: Use the default filter table
- -A INPUT: Add the rule to the INPUT chain
- -s 192.168.1.230: Match packets from this source IP
- -j ACCEPT: Allow matching packets
Output:
- No visible output
Verifying Command:
iptables --list
3. -d, --destination: Destination Address
Matches packets going to a specific IP address.
Syntax:
iptables [-t table] -A [chain] -d {destination_address} [target]
Example: Drop all packets going to 192.168.1.123
This command appends a rule in the OUTPUT chain to drop all packets destined for 192.168.1.123.
iptables -t filter -A OUTPUT -d 192.168.1.123 -j DROP
- -A OUTPUT: Add the rule to the OUTPUT chain
- -d 192.168.1.123: Match packets destined for this IP
- -j DROP: Silently discard matching packets
Output:
- No visible output
Verifying Command:
iptables --list
4. -i, --in-interface: Input Interface
Matches packets with the specified in-interface and takes the action.
Syntax:
iptables [-t table] -A [chain] -i {interface} [target]
Example: Drop all packets coming from the wireless interface wlan0
This command appends a rule in the INPUT chain to drop all packets destined for wireless interface.
iptables -t filter -A INPUT -i wlan0 -j DROP
- -i wlan0: Match packets coming in through this interface
- -j DROP: Block these packets
Output:
- No visible output
Verifying Command:
iptables --list --verbose
5. -o, --out-interface: Output Interface
Matches packets with the specified out-interface.
- Used when filtering outgoing traffic
- Works similar to -i but for outbound packets
Syntax:
iptables [-t table] -A [chain] -o {interface} -j {target}
Example: Allow all packets leaving through the Ethernet interface eth0:
iptables -t filter -A OUTPUT -o eth0 -j ACCEPT
- -o eth0: Match packets leaving through this interface
- -j ACCEPT: Allow these packets
Output:
- No visible output
Verifying Command:
iptables --list
6. -j, --jump: Target Action
This parameter specifies the action to be taken on a match.
Syntax:
iptables [-t table] -A [chain] [parameters] -j {target}
Example: Drop all packets passing through the FORWARD chain
This command adds a rule in the FORWARD chain to drop all packets.
iptables -t filter -A FORWARD -j DROP
- -A FORWARD: Add the rule to the FORWARD chain
- -j DROP: Silently discard all matching packets
Output:
- No visible output
Verifying Command:
iptables --list
Basic iptables Operations
1. Flush All Rules
Removes all rules and user-defined chains
Command:
sudo iptables --flush
Output:
- This command does not produce any text output. It simply removes all rules from all chains in the default table (filter). After this, running sudo iptables -L will show empty chains like:
Chain INPUT (policy ACCEPT)
target     prot opt source               destination         
Chain FORWARD (policy ACCEPT)
target     prot opt source               destination         
Chain OUTPUT (policy ACCEPT)
target     prot opt source               destination
2. Save Configuration
Saves current firewall rules
Command:
sudo iptables-save
Output:
- Displays the current firewall rules in a plain text format that can be saved to a file.
# Generated by iptables-save v1.8.7 on Thu Mar 27 10:00:00 2026
*filter
:INPUT ACCEPT [0:0]
:FORWARD ACCEPT [0:0]
:OUTPUT ACCEPT [0:0]
-A INPUT -p tcp --dport 22 -j ACCEPT
-A OUTPUT -p tcp --sport 22 -j ACCEPT
COMMIT
# Completed on Thu Mar 27 10:00:00 2026
- This can be redirected to a file for backup:
Command:
sudo iptables-save > /etc/iptables/rules.v4
3. Restore Configuration
Restores previously saved rules
Command:
sudo iptables-restore < /etc/iptables/rules.v4
Output:
- This command does not print anything. It reads the saved rules file and restores all chains and rules. Running sudo iptables -L afterward will show the rules as defined in the saved file.
Reasons to chose iptables in Linux
The following are the some of the reasons to use Iptables in Linux:
- Firewall Configuration: It helps in enabling the precise control over the netowrk traffic to protect against unauthorized access and attacks.
- Packet Filtering: It allows in filtering based on the criteria like protocol, IP addresses and prots providing the security.
- Network Address translation (NAT): It facilitates with seamless communication between different network segments.
- Logging and Monitoring: It provides the insights into the network activity for providing feature sof security auditing and troubleshooting.
Benefits of Using iptable Command
The following are the benefits of using iptable command
- Robust Firewall Capabilities: It facilitates with configuration of firewall rules to control incoming and outgoing traffic, enhancing network security.
- Precise Packet Filtering: It provides the filtering based on criteria such as protocol, source/destination IP addresses, and ports, ensuring only authorized traffic passes through.
- Network Address Translation (NAT): It supports NAT functionality for translating IP addresses and ports, essential for network connectivity and management.
- Logging and Monitoring: It provides logging capabilities to monitor and analyze network traffic, aiding in security auditing and troubleshooting.
Features
The following are the some of the features of Iptables:
- Packet Filtering: Iptables facilitates with providing filtering features for network packets based on various criteria such as source and destination IP addresses and ports.
- NAT: Iptables supports the NAT by allowing for the translation of the private IP address to public address making an essential for devices within a private network to establish the communication with external networks.
- Stateful Inspection: Through stateful inspection, iptables helps in tracking the state of network connections with providing the enhanced security by legitimating the traffic that is only allowed.
Use cases
The following are the some of the usecases of Iptables
- Firewall Protection: Blocks unauthorized access while allowing legitimate traffic.
- Traffic Shaping and Control: Manages and prioritizes network traffic to reduce congestion.
- Network Address Translation (NAT): Lets multiple devices share a single public IP address.
- Port Forwarding: Redirects traffic between ports to access internal services externally.
