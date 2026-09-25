# free Command in Linux

> Source: https://www.geeksforgeeks.org/linux-unix/free-command-linux-examples/

The free command in Linux is used to display information about system memory usage. It reports the total amount of physical RAM and swap memory, along with how much is used, free, shared, buffered, and cached. This command is commonly used for system monitoring, performance troubleshooting, and resource planning.
- Displays total, used, and free memory
- Shows RAM and swap memory statistics
- Includes buffer and cache memory usage
- Lightweight and safe monitoring utility
Example 1: Display Memory Usage (Default)
Syntax:
free
Command:
free
Output:
- total: Total installed memory
- used: Memory in use, excluding buffers and cache in some explanations; in practice, free output should be read together with buff/cache because Linux can reclaim cache anytime
- free: Completely unallocated memory
- shared: Memory used by tmpfs
- buffers: Memory used by kernel buffers
- cached: Memory used for file caching (reclaimable)
- available: Estimated memory available for new applications
Notes: Default unit is KiB (1024 bytes)
Syntax
free [OPTION]
Options of free Command
1. -h, --human
Displays memory in a human-readable format.
Command:
free -h
Output:
2. -b (Displaying Output in Bytes)
It just displays the output in unit bytes.
Command:
free -b
Output:
3. -k (Displaying Output in Kilobytes)
This option displays the result in kilobytes.
Command:
free -k
Output:
4. -m (Displaying Output in Megabytes)
This option displays the result in megabytes.
Command:
free -m
Output:
5. -g (Displaying Output in Gigabytes)
This option displays the result in gigabytes.
Command:
free -g
Output:
6. -t (Displaying Totals)
This option displays an additional line containing the sum of the total, used and free columns.
Command:
free -t
Output:
7. -s and -c (Continuously Monitoring Memory Usage)
The -s option allows the free command to display memory usage repeatedly at a specified time interval. You must provide a numeric value representing the delay (in seconds) between each update. The -c option is used together with -s to specify how many times the output should be displayed.
Command:
free -s 3 -c 3
- -s 3: Refresh the output every 3 seconds
- -c 3: Display the output 3 times
Output:
- This command will show memory usage every 3 seconds and stop automatically after 3 updates.
Note: If you use -s without -c, the output will continue refreshing indefinitely until you manually stop it (for example, by pressing Ctrl + C).
Importance of Linux free Command
- Real-time Memory Monitoring: Provides the immediate insight regarding the system memory usage. It helps the administrators and users in monitoring the resource allocation.
- Performance Optimization: Allows the users for proactive management by identifying memory-intensive processes or applications, enabling timely adjustments to improve overall system performance.
- Resource Planning: Efficient resource planning and allocation decisions based on accurate data about available, used, and cached memory, ensuring optimal utilization of system resources.
