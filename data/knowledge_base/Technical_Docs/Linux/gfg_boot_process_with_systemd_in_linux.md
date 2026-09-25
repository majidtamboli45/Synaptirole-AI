# Boot Process with Systemd in Linux

> Source: https://www.geeksforgeeks.org/linux-unix/boot-process-with-systemd-in-linux/

Systemd is the first user-space process started by the Linux kernel and runs with PID 1. It handles system initialization, service management, and controls the entire boot process in modern Linux systems.
- Starts after the kernel and becomes the parent of all user-space processes
- Manages system services using parallel startup and dependency resolution
- Replaces traditional SysVinit-based boot mechanisms
- Uses targets instead of runlevels to define system states
Linux Boot Process
The Linux boot process is a sequence of stages that prepare the system from power-on to a usable state. Each stage performs a specific task, and control is gradually handed over from firmware to the operating system and finally to systemd.
Boot Process Stages
- BIOS/UEFI: Performs Power-On Self Test (POST) and initializes hardware components
- Boot Loader: Loads the Linux kernel and allows OS or kernel selection
- Kernel: Initializes hardware, mounts the root filesystem, and starts the first user-space process
- systemd: Started by the kernel as PID 1; initializes services and reaches the target system state
Role of systemd in the Boot Process
After the kernel finishes hardware and memory initialization, systemd is launched as the first user-space process with PID 1. It takes full control of system management , orchestrating the initialization of all services, devices, and resources to bring the system into a usable state efficiently.
systemd Responsibilities During Boot
- Reads unit files that define services, mounts, sockets, timers, and device configurations
- Resolves dependencies between units to ensure correct startup order and avoid conflicts
- Starts independent services in parallel, minimizing overall boot time
- Activates services on demand, conserving CPU and memory resources
- Transitions the system to the configured target, such as multi-user, graphical, or rescue mode
- Monitors service status and can automatically restart failed units to maintain system stability
systemd Targets
Systemd uses targets to define system states, replacing traditional runlevels. Targets group services, sockets, and other units required to reach a specific operating mode.
Common systemd Targets
- multi-user.target: Non-graphical system with networking and standard services
- graphical.target: Full graphical environment with display manager
- rescue.target: Single-user mode for system recovery or maintenance
- emergency.target: Minimal environment for critical fixes, with only essential services
Boot Performance Analysis with systemd-analyze
systemd-analyze measures and examines system boot performance, helping identify services or processes that delay startup. It provides detailed insights into the time taken by the kernel, user-space, and individual units, allowing optimization of boot speed.
- Identifies slow-starting services or units
- Measures total boot time for comparison and monitoring
- Helps optimize system startup for performance and efficiency
- Supports troubleshooting of boot delays and dependency issues
Example 1: Check Total Boot Time
Determining total boot time helps monitor system performance and identify unusually slow startups.
Command:
systemd-analyze time
- Measures the time spent in firmware, bootloader, kernel, and user-space
- Useful for detecting delays in overall system initialization
Output:
Example 2: View Service Dependency Chain
Analyzing the service dependency chain shows the order in which critical services start and how they depend on each other.
Command:
systemd-analyze critical-chain
- Displays the boot sequence timeline with service dependencies
- The value after @ indicates when a service is activated (time since boot began)
- The value after + shows how long the service took to start
- Helps pinpoint services that delay reaching the target system state
Output:
Note: This output visualizes which services are critical in the boot process and highlights any potential bottlenecks.
Example 3: Identify Slow Services
Listing slow-starting services helps pinpoint units that delay the boot process, allowing administrators to optimize or disable them.
Command:
systemd-analyze blame
- Lists all system services in descending order of startup time
- Shows the duration each service took to start, making it easy to identify performance bottlenecks
- Useful for optimizing boot by targeting unnecessary or slow services
Output:
Note: The output highlights which services consumed the most time during startup, providing actionable insights for system optimization.
Example 4: Generate a Graphical Boot Chart
A graphical boot chart provides a visual timeline of the boot process, showing how long each service or device took to start.
Command:
systemd-analyze plot > boot.svg
- Creates a graphical representation of the boot sequence in an SVG file
- Each horizontal bar represents a service, mount, or device unit
- Longer bars indicate units that delayed the boot process
- Helps quickly identify performance bottlenecks and resource-intensive services
Output:
- A file named boot.svg is created in the current working directory where the command is run
- Visualization shows startup duration of services like systemd-journald.service and disk devices
Note: Open boot.svg in a browser or image viewer to see the graphical boot timeline.
