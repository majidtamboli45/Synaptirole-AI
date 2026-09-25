# Nice and Renice Command in Linux

> Source: https://www.geeksforgeeks.org/linux-unix/nice-and-renice-command-in-linux-with-examples/

In Linux, the nice and renice commands are used to manage process priorities, controlling how much CPU time each process receives. These commands help optimize system performance when multiple processes compete for resources.
1. nice Command
- Nice values range from -20 to +19
- A lower nice value means higher scheduling priority
- A higher nice value means lower scheduling priority
Note: The nice value influences scheduler priority; it is not the actual scheduler priority itself
2. renice Command
- Used to change the priority of an already running process.
- Helps dynamically adjust system performance based on current CPU usage.
Working with 'nice' and 'renice' Command
1. To check the nice value of a process
To check the current nice value of a specific process, you can use the 'ps' command combined with 'grep':
Command:
ps -el | grep terminal
Output:
The sixth column (NI) represents the nice value
Note: ps -el lists processes system-wide. Using ps -o pid,ni,cmd alone would show only the current shell’s processes unless combined with -e.
2. To set the priority of a process
To start a new process with a specific nice value
Command:
nice -n 10 gnome-terminal
Output:
This sets the nice value of the gnome-terminal process to '10', lowering its priority compared to processes with a nice value closer to '0' or negative values.
3. To set the negative priority for a process
To give a process higher priority by assigning a negative nice value, use:
Command:
sudo nice --10 gnome-terminal
Output:
Negative nice values increase the process's priority, allowing it to receive more CPU time. This is especially useful for critical tasks that need to run faster.
4. Changing priority of the running process
To modify the priority of an already running process, use the 'renice' command with the process ID (PID):
Command:
sudo renice -n 15 -p 77982
Output:
This will change the priority of the process with pid 77982.
5. To change the priority of all processes of a specific group
You can also adjust the priority of all processes within a specific group by specifying the group ID (GID):
Command:
renice -n 10 -g 4
Output:
This command will set all the processes of gid 4 priority to 10, reducing their CPU time allocation.
6. To change the priority of all processes of a specific user
To change the priority of all processes belonging to a specific user, use the renice command with the user ID (UID):
Command:
sudo renice -n 10 -u 2
Output:
This will set all the processes of user 2 to 10, making them lower priority.
