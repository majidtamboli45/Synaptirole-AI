# Configuring Linux Firewall

> Source: https://www.geeksforgeeks.org/linux-unix/how-to-setup-firewall-in-linux/

A Linux firewall is a critical security layer that monitors and controls network traffic, protecting your system from unauthorized access and potential threats. By defining rules, it ensures only legitimate traffic passes while blocking harmful connections. Linux provides tools like iptables and firewalld to effectively manage and secure network communications.
- Acts as a barrier between internal networks and external connections.
- Filters incoming and outgoing traffic based on predefined rules.
- Restricts unauthorized access and prevents data breaches.
- Supports both software and hardware based implementations.
- Ensures legitimate communication without compromising security.
Working of Linux Firewall
A Linux firewall monitors network traffic by inspecting each packet that enters or leaves the system. It applies predefined rules to decide whether the traffic should be allowed, blocked, or redirected, ensuring that only legitimate connections pass through while protecting the system from unauthorized access and attacks. The packet filtering process follows these steps:
- Packet Arrival: A packet enters the system from an external network or is generated internally.
- Rule Evaluation: The firewall checks the packet against its rules, considering the IP address (source or destination), port number (like 80 for HTTP, 22 for SSH), protocol (TCP, UDP, ICMP, etc.), and connection state (new or established).
- Decision Making: The firewall decides the packet’s handling, if it matches an allow rule, it passes or if it matches a deny rule, it is blocked.
- Traffic Forwarding: Allowed packets are delivered to their destination, while blocked packets are discarded or recorded in a log.
Note: Running firewall commands usually requires sudo privileges.
Method 1: Configuring Firewall with iptables
iptables is a powerful Linux utility for managing network traffic. It allows system administrators to filter packets, block unwanted connections, and define custom security rules. This method is best suited for advanced users or those managing complex networks.
How iptables Works
iptables operates using a three-tier structure
1. Tables
Tables are logical groupings of chains in iptables. Each table is designed for a specific type of packet processing, which allows precise control over network traffic. There are four commonly used tables:
- Filter (default table): Handles general packet filtering like blocking or allowing traffic. It contains the default chains INPUT, OUTPUT, and FORWARD.
- NAT (Network Address Translation): Changes packet source or destination addresses for port forwarding, masquerading, or mapping internal to public IPs. Its default chains are PREROUTING, POSTROUTING, and OUTPUT.
- Mangle: Performs advanced packet modifications, such as changing the Type of Service (TOS), Time To Live (TTL), or Quality of Service (QoS). Its chains include PREROUTING, POSTROUTING, INPUT, OUTPUT, and FORWARD.
- Raw: Pre-processes packets before connection tracking. This is useful to bypass tracking for certain packets from being tracked. Its chains are PREROUTING and OUTPUT.
2. Chains
Chains are ordered sequences of rules within a table. Each chain processes packets in a specific direction or scenario. In the filter table, there are three default chains:
- INPUT: Handles packets destined for the local machine, such as SSH connections from a remote system.
- OUTPUT: Handles packets originating from the local machine, for example, HTTP requests sent to external servers.
- FORWARD: Handles packets passing through the system that are not intended for local delivery, such as traffic routed through a Linux server acting as a gateway.
3. Rules
Rules are the instructions in iptables that determine how packets should be handled. Each rule contains conditions (criteria) and an action (target). Common actions include:
- ACCEPT: Allows the packet to continue to its destination. For example, permitting SSH traffic on port 22.
- DROP: Silently discards the packet without sending a response. This is commonly used to block all traffic from a malicious IP.
- REJECT: Blocks the packet and sends an error message to the sender, useful when you want the sender to know the traffic is denied.
- LOG: Records packet details in system logs for monitoring or troubleshooting. For example, logging unauthorized connection attempts.
- JUMP: Redirects the packet to another chain, which can be built-in or user-defined, allowing for modular rule organization.
Note: Rules are evaluated from top to bottom in a chain. Once a packet matches a rule, the corresponding action is applied, and remaining rules are skipped. Proper ordering is crucial; for instance, an ACCEPT rule must come before a DROP rule for the same IP or port, otherwise the packet may be blocked prematurely.
Step 1: Check Current Rules
Before modifying your firewall, it’s important to see the rules currently in place. Most Linux systems start with no predefined rules, but checking ensures you know the current state.
Command:
sudo iptables -L
- -L : Lists all rules in each chain.
Output:
- Target: Action applied to matching packets (ACCEPT, DROP, REJECT).
- Prot: Protocol used (TCP, UDP, ICMP, etc.).
- Source: IP address where the packet originates.
- Destination: IP address where the packet is going.
- Packets/Bytes: Counters showing how many packets/bytes matched the rule.
Step 2: Clear Existing Rules
Before creating new rules, it’s best to flush existing ones to avoid conflicts. This step resets the chains to a clean state.
Command:
sudo iptables -F
- -F : Flushes all rules from all chains, removing them completely.
Step 3: Set Default Policies
Default policies define what happens to packets that do not match any rule in a chain. Setting strict defaults ensures unrecognized traffic is handled safely.
Command:
sudo iptables -P INPUT DROP
sudo iptables -P FORWARD DROP
sudo iptables -P OUTPUT ACCEPT
- -P <CHAIN> <POLICY>: Sets the default policy for the chain.
- INPUT DROP: Blocks all incoming traffic by default.
- FORWARD DROP: Blocks forwarded packets by default.
- OUTPUT ACCEPT: Allows outgoing traffic from the system.
Step 4: Allow Essential Traffic (ACCEPT Rule)
To allow essential traffic (such as SSH) while blocking others, you must explicitly accept packets before DROP rules. This ensures important traffic is processed first.
Syntax:
sudo iptables [-A | -I] <chain_name> -s <source_ip> -p <protocol_name> --dport <port_number> -j <target_action>
- -A <chain_name>: Append the rule to the end of the specified chain (INPUT, OUTPUT, FORWARD).
- -I <chain_name>: Insert the rule at the beginning of the specified chain.
- -s <source_ip>: Matches packets originating from this IP address.
- -p <protocol_name>: Specifies the protocol to match (like tcp, udp).
- --dport <port_number>: Specifies the destination port. This is valid only with -p <protocol_name>.
- -j <target_action>: Defines the action for matching packets (like ACCEPT, DROP, REJECT).
Note: Always insert ACCEPT rules before DROP rules, otherwise they may be blocked.
Example: Allow SSH Traffic from a Specific IP
Suppose we want to allow SSH traffic (default port 22) only from the network 192.168.1.3 while other traffic from this IP is blocked.
Command:
sudo iptables -A INPUT -s 192.168.1.3 -p tcp --dport 22 -j ACCEPT
This command checks for packets:
- Originating from 192.168.1.3
- Using the TCP protocol
- Targeting port 22 on your machine
- If all conditions match, the packet is accepted.
Output:
Troubleshooting ACCEPT Rules
Sometimes, the above command may not allow the packets.
- iptables rules are processed from top to bottom.
- Once a packet matches a rule, it does not continue to the lower rules.
- In our scenario, if a DROP rule for 192.168.1.3 is above the ACCEPT rule, the packet is dropped before it reaches the ACCEPT rule.
Fix: Insert Rule at the Top
Command:
sudo iptables -I INPUT -s 192.168.1.3 -p tcp --dport 22 -j ACCEPT
- -I: Inserts the rule at the beginning of the chain
- This ensures packets from 192.168.1.3 destined for port 22 are checked first and allowed.
Check the iptables configuration:
Command:
sudo iptables -L
Output:
- Now, any packet from 192.168.1.3 going to port 22 is accepted, while other packets follow the remaining rules.
Step 5: Block Unwanted IPs
To protect your system, you can deny access from known malicious or unwanted IP addresses.
Syntax:
sudo iptables [-A | -I] <chain_name> -s <source_ip> -j <target_action>
- -A <chain_name>: Append the rule to the end of the chain (INPUT, OUTPUT, FORWARD).
- -I <chain_name>: Insert the rule at the beginning of the chain.
- -s <source_ip>: The source IP address to match and block.
- -j <target_action>: Action to take on matching packets (e.g., DROP, REJECT, LOG).
Example: Block a Specific IP
Let's assume we want to block the traffic coming from an IP address 192.168.1.3.
Command:
sudo iptables -A INPUT -s 192.168.1.3 -j DROP
- -A INPUT : Append this rule to the end of the INPUT chain.
- -s 192.168.1.3 : Source IP address to block.
- -j DROP : Action to silently discard packets.
Optional: Logging Before Dropping
It’s often useful to log traffic before dropping it to monitor potential attacks:
sudo iptables -A INPUT -s 192.168.1.100 -j LOG --log-prefix "Dropped packet: "
sudo iptables -A INPUT -s 192.168.1.100 -j DROP
- --log-prefix: Adds a prefix to syslog messages.
- Useful for debugging or monitoring potential attacks.
Verify Command:
sudo iptables -L
Output:
- All traffic from 192.168.1.3 is now blocked without notifying the sender.
Step 6: Deleting a Rule (Optional)
If you want to delete the rule which accepts the traffic, Please follow the below example to understand it properly:
Syntax:
sudo iptables -D chain_name rule_number
Example:
Delete the rule that accepts traffic to port 22
Command:
sudo iptables -D INPUT 1
Note: Rule numbers start from 1 in the iptables -L --line-numbers listing.
Output:
Step 7: Saving your Configuration
Saving your iptables configuration is optional on a personal computer, but it is highly recommended on a server. If the server restarts or crashes, unsaved rules will be lost, potentially leaving your system unprotected. The easiest way to persist your firewall rules is by using the iptables-persistent package.
Install iptables-persistent
You can install it from Ubuntu’s default repositories:
Command:
sudo apt-get update
sudo apt-get install iptables-persistent
- During installation, you may be prompted to save your current IPv4 and IPv6 rules. Choose “Yes” to save them.
Save Your Configuration
Once installed, save your current iptables rules with:
sudo invoke-rc.d iptables-persistent save
- This ensures that your firewall rules are automatically restored after a reboot.
Method 2: Configuring Firewall with firewalld
firewalld simplifies firewall management by using zones, which are collections of rules that apply to network interfaces. Common zones include public, work, and home. Zones allow you to define different trust levels for different networks.
Step 1: Install firewalld
Install firewalld and start the service:
Command:
sudo apt-get install firewalld
sudo systemctl start firewalld
sudo systemctl enable firewalld
- sudo apt-get install firewalld: Installs the firewall management tool.
- sudo systemctl start firewalld: Starts the firewalld service immediately.
- sudo systemctl enable firewalld: Ensures firewalld starts automatically on boot.
Step 2: Assign Network Interfaces to Zones
Zones are assigned to network interfaces to define the level of trust.
Example: Assign interface eth0 to the public zone:
Command:
sudo firewall-cmd --zone=public --add-interface=eth0 --permanent
- --zone=public: The zone you want to assign the interface to.
- --add-interface=eth0: Specifies which network interface is assigned.
- --permanent: Makes the assignment persistent across reboots.
Apply changes immediately (reload rules):
sudo firewall-cmd --reload
Step 3: Allow Services in Zones
You can allow predefined services (like HTTP, SSH) within specific zones.
Example: Permit HTTP traffic in the public zone:
Command:
sudo firewall-cmd --zone=public --add-service=http --permanent
sudo firewall-cmd --reload
- --add-service=http: Allows incoming HTTP traffic on port 80.
- --permanent: Ensures the rule persists after reboot.
- --reload: Applies changes without restarting the service.
Note: You can also allow other common services, like ssh, https, smtp using the same command.
Step 4: View Active Zones and Rules
Check which zones are active and what rules are applied:
Command:
sudo firewall-cmd --get-active-zones
sudo firewall-cmd --list-all
- --get-active-zones: Shows currently active zones and associated interfaces.
- --list-all: Lists all rules, services, ports, and settings for a zone.
Step 5: Example Use Case
You can create a home zone that allows only trusted devices while blocking all external access. Assign your home network interface to this zone and allow only necessary services like SSH or HTTP.
sudo firewall-cmd --zone=home --add-interface=eth1 --permanent
sudo firewall-cmd --zone=home --add-service=ssh --permanent
sudo firewall-cmd --reload
Method 3: Configuring Firewall with UFW (Uncomplicated Firewall)
UFW is a beginner-friendly firewall tool for Linux, ideal for quickly securing a personal system. It provides a simple command-line interface to manage firewall rules without the complexity of iptables.
Step 1: Enable UFW
Activate UFW to start filtering traffic:
Command:
sudo ufw enable
- enable: Starts UFW and enables it to start at boot.
Note: If connected via SSH: make sure SSH is allowed first, otherwise you may lock yourself out.
Optional Safety Tip:
This ensures you maintain remote access before enabling the firewall.
sudo ufw allow ssh
sudo ufw enable
Step 2: Allow Specific Services
Permit trusted services to pass through the firewall.
Example: Allow SSH traffic:
Command:
sudo ufw allow ssh
Step 3: Block Traffic to Specific Ports
You can deny traffic to ports that should not be accessed.
Example: Block traffic to port 8080:
Command:
sudo ufw deny 8080
- deny: Blocks incoming traffic to the specified port.
- Useful for preventing unwanted access to services running on non-standard ports.
Step 4: View Firewall Status and Rules
Check the current UFW status and active rules:
Command:
sudo ufw status verbose
- status: Displays which rules are currently applied.
- verbose: Shows detailed information including default policies.
Additional Useful Commands
1. Enable Logging: Track blocked or allowed connections
sudo ufw logging on
sudo ufw logging high # For detailed logs
2. Delete Rules: Remove specific rules
sudo ufw delete allow ssh
sudo ufw delete deny 8080
3. Reset UFW: Clear all rules and restore defaults
sudo ufw reset
Common Mistakes to Avoid
1. Not Saving Rules
Forgetting to save changes can result in loss of firewall configurations after a reboot. Always persist your rules using tools like iptables-persistent (iptables), firewalld --permanent, or UFW’s built-in persistence.
2. Over-Blocking Traffic
Be careful when applying DROP rules or restrictive default policies. Overly strict rules can lock you out of your own system, especially SSH access.
3. Misapplying Zones (firewalld)
Ensure network interfaces are assigned to the correct zone. Assigning an interface to the wrong zone may block legitimate traffic or expose your system unnecessarily.
Tips for Effective Firewall Management
1. Understand Your Network Needs
Identify the services and ports your system actually requires and block everything else. This minimizes potential attack surfaces.
2. Use Logging for Monitoring
Enable logging to track allowed and blocked traffic, which is useful for troubleshooting and security auditing.
For firewalld:
Command:
sudo firewall-cmd --set-log-denied=all
For iptables: Use the LOG target to record dropped packets.
Command:
sudo iptables -A INPUT -s <source_ip> -j LOG --log-prefix "Dropped packet: "
3. Test Firewall Rules
Use tools like nmap to scan your system and verify that only intended ports and services are open. Testing ensures rules are applied correctly and no unintended access exists.
4. Automate Rule Application
Use scripts or automation tools (like Ansible or system startup scripts) to consistently apply firewall rules across reboots or multiple systems. This reduces manual errors and ensures consistency.
