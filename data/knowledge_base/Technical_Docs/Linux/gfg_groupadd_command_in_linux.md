# groupadd Command in Linux

> Source: https://www.geeksforgeeks.org/linux-unix/groupadd-command-in-linux-with-examples/

User management is an essential part of system administration. One key task is creating and managing user groups. Groups help organize multiple users and simplify permission management for files and resources. The groupadd command allows administrators to create new groups efficiently.
- Supports assigning a specific group ID (GID)
- Allows creation of system groups
- Provides options for setting encrypted group passwords
- Can override default system configurations for group creation
Syntax
groupadd [options] group_name
- [options]: Optional flags like -g or -r
- group_name: Name of the group to create
Creating a New Group (Step-by-Step)
Follow these steps to create a new group in Linux using the groupadd command:
1. Open a terminal
Launch a terminal on your Linux system. This can usually be done by pressing `Ctrl + Alt + T` or searching for "Terminal" in the application menu.
2. Run the groupadd command
Example:
Create a group named "developers".
Command:
sudo groupadd developers - Uses sudo for administrative privileges
3. Verify Group Creation
Every new group created is registered in the file "/etc/group".
Command:
sudo tail /etc/group
Output:
- The file shows group information in the following format:
group_name:password:group-id:list-of-members
Options Available with`groupadd` command
1. -f, --force
Forces command to exit silently if group already exists.
Syntax:
groupadd -f group_name
Example:
sudo groupadd -f developers
2. -g GID, --gid GID
Assigns a specific numeric GID.
Syntax:
sudo groupadd -g <GID> group_name
- <GID>: Numeric Group ID (must be non-negative).
Example
sudo groupadd -g 2000 developers
Verify:
grep developers /etc/group
Output:
developers:x:2000:
3. -o, --non-unique
Allows duplicate GID. Used when multiple groups must share same GID and it requires -g option.
Syntax:
sudo groupadd -o -g 2000 testgroup
4. -r, --system
Creates a system group.
Syntax:
sudo groupadd -r sysgroup
Output:
sysgroup:x:995:
Notes:
- GID assigned within SYS_GID_MIN and SYS_GID_MAX.
- Used for services and system processes.
5. -p PASSWORD, --password PASSWORD
Sets encrypted password for the group. Password must be encrypted (generated using openssl passwd). Stored in /etc/gshadow. Rarely used in modern systems.
Syntax:
sudo groupadd -p encrypted_password finance
6. -K KEY=VALUE, --key KEY=VALUE
Overrides default values from /etc/login.defs. Useful in custom environment setups.
Syntax:
sudo groupadd -K GID_MIN=500 -K GID_MAX=700 tester
- GID_MIN: Minimum allowed GID.
- GID_MAX: Maximum allowed GID.
- -K: Override default configuration temporarily.
7. -R CHROOT_DIR, --root CHROOT_DIR
Applies changes inside a chroot environment. Useful in container or recovery environments.
Syntax:
sudo groupadd -R /mnt/chroot devgroup
8. -h, --help
Displays help information.
groupadd --help
Examples of groupadd Command
1. Force Create Without Error
Syntax:
groupadd -f developers
Output:
2. Create Group with Specific GID
The -g option allows you to assign a specific numeric GID (Group ID) to the new group instead of letting the system auto-assign one. This is useful when you need consistent GIDs across multiple servers or shared file systems.
Syntax:
sudo groupadd -g <GID> group_name
Example:
If you want to create a group developers with GID 2000:
sudo groupadd -g 2000 developers
This command will create a new group named "developer" with a GID of 2000. Specifying group ID is useful in case when we need to maintain consistency across systems.
3. Setting a Group Password
We can set an encrypted password for a group using the '-p' option.
Syntax:
sudo groupadd -p somepassword finance
- This command creates a new group named "finance" and sets the password for the group as "somepassword"
4. Overriding Default Values Using -K
The -K option allows you to override default configuration values defined in the /etc/login.defs file during group creation. This is useful when you want to temporarily modify the GID range without editing system configuration files.
Syntax:
sudo groupadd -K KEY=VALUE group_name
- sudo: Required administrative privileges.
- groupadd: Command to create a new group.
- -K: Overrides a default value from /etc/login.defs.
- KEY=VALUE: Configuration parameter and its new value.
- group_name: Name of the new group.
You can use multiple -K options in a single command.
Example: Override GID_MIN and GID_MAX
Command:
sudo groupadd -K GID_MIN=500 -K GID_MAX=700 tester
- GID_MIN=500: Sets the minimum allowed GID to 500.
- GID_MAX=700: Sets the maximum allowed GID to 700.
- tester: Name of the group being created.
Output:
Verify using:
grep tester /etc/group
5. To Create a new user in a group, the group is mentioned using -g option in the command useradd.
Syntax:
sudo useradd -g developers new_user note:adds new_user to an existing group "developers"
6. To change group of an existing user, use the usermod command
Syntax:
usermod -aG developers existing_user
Output:
