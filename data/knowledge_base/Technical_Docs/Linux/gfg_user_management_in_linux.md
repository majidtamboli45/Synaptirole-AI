# User Management in Linux

> Source: https://www.geeksforgeeks.org/linux-unix/user-management-in-linux/

User management is a core function of Linux system administration. Linux supports multi-user environments, making it ideal for everything from personal laptops to large enterprise systems. Efficient user management:
- Secures the system from unauthorized access.
- Ensures users can perform their roles without interfering with others.
- Helps in auditing and tracking user activity.
Understanding Linux User IDs (UIDs)
Linux systems typically support up to 1,000+ users, making them suitable for large-scale use.
Admins manage users by creating, modifying and deleting accounts, setting permissions and enforcing access policies. This ensures users can perform tasks without compromising system integrity.
Types of Users in Linux
Linux is a multi-user operating system, meaning multiple users can access and operate the system simultaneously. Each user type serves a specific purpose and has different levels of access and control. Below are the main types of users you will encounter in Linux:
- Root (Superuser): Full system control. Can install software, change config files and delete anything. Powerful but risky.
- Regular User: Limited access. Can create files, run applications, but not modify system-level settings.
- Sudo User: Regular user with temporary admin rights via the sudo command. Common in modern systems.
- System/Service Account: Non-human accounts used by services (e.g., mysql, nginx). Limited privileges.
- Guest User: Temporary users with minimal privileges. Changes are not saved after logout. (desktop environment specific)
User Groups
A user group is a collection of users. If you give permission to a group, all users in that group get the same access. This makes it easier to manage file and system permissions for many users at once.
1. Primary Group (Default for files)
- Every Linux user is assigned one primary group.
- When a user creates a file, the group ownership of that file is automatically set to their primary group.
- By default, this group usually has the same name as the user.
- It helps manage file ownership cleanly without much extra configuration.
Example: Check Primary Group
id raj
Output:
Here, gid=1000(raj) means the primary group of user raj is raj.
2. Secondary Group(Additional Permissions)
- A user can be a part of multiple secondary groups.
- These groups provide extra access to files, folders or services.
- They are commonly used for team-based access or system-level permissions (e.g., accessing Docker, video devices or running sudo).
Example: Add User to a Secondary Group. This adds raj to the developers group.
sudo usermod -aG developers raj
Check Group Memberships:
groups raj
Output:
This shows that user raj is part of two groups:
- Primary: raj
- Secondary: developers
User Management Files
These files are essential for managing users, groups and permissions on a Linux system and they play a key role in ensuring security and efficient system administration.
The following are different user management files in linux:
1. User Information
/etc/passwd: Stores basic details of all user accounts including:
- Username
- User ID (UID)
- Primary Group ID (GID)
- Home directory
- Default shell
- Full name of the user
/etc/shadow: Stores encrypted user passwords and password-related settings:
- Encrypted passwords
- Last password change date
- Password expiration and inactivity rules
- Account expiration settings
2. Group Management
/etc/group: Defines all groups in the system and user memberships:
- Group name
- Group ID (GID)
- List of users in each group
/etc/gshadow: Secure counterpart to /etc/group, storing:
- Encrypted group passwords
- Group administrators
- Group members
3. Privilege Control
/etc/sudoers: Manages sudo access for users and groups:
- Who can use the sudo command
- What commands they can run
- From which terminals/systems
4. User Home Directory Setup
/etc/skel/: Directory containing default configuration files copied to a new user’s home directory:
- Typically includes .bashrc, .profile, etc.
- Used to provide default shell settings and environment
5. Logs and Auditing
/var/log/auth.log: Records authentication-related events:
- Successful and failed login attempts
- Usage of the sudo command
- Account lock and unlock events
- Other security-related activities
Note:
- On Debian-based systems (Kali, Ubuntu), authentication logs are in /var/log/auth.log
- On RHEL/CentOS/Fedora systems, they are stored in /var/log/secure
- On modern systemd systems, logs can also be viewed using journalctl
User Account Management Commands
1. List all users
To list all the users in Linux, use the awk command with the -F option. This will access the /etc/passwd file and print only the first column, which contains the usernames.
Command:
awk -F':' '{ print $1}' /etc/passwd
Output:
2. Get User ID
The id command provides the user with user ID (UID) and group ID (GID) of the username by default.
Command:
id username
Output:
3. Add a User
The useradd command creates a new user in the system. The user will be assigned an automatic ID based on the system's settings
Command:
sudo useradd geeks
Output:
4. Assign a Password
The passwd command is used to assign a password to the user. After entering the command, you will be prompted to input a new password for the user.
Command:
sudo passwd geeks
Output:
5. Accessing a User Configuration File
To view user details from the /etc/passwd file, use the cat command. This file contains user account information like UID, GID, home directory and login shell.
Command: This command prints the data of the configuration file.
cat /etc/passwd
This file contains information about the user in the format.
Syntax:
username : x : user id : user group id : : /home/username : /bin/bash Output:
Modify User Information
System administrators often need to update user account settings. Below are common usermod and userdel commands used to modify user accounts.
1. Change User ID
To change the user ID (UID) of an existing user, use the usermod command with the -u option.
Syntax:
usermod  -u new_id username
This command can change the user ID of a user. The user with the given username will be assigned with the new ID given in the command and the old ID will be removed.
Command:
sudo usermod -u 1982 test
Output:
2. Change Group ID
To modify the group ID (GID) of a user or move a user to another group, use the usermod command with the -g option.
Syntax:
usermod -g  new_group_id username
This command can change the group ID of a user and hence it can even be used to move a user to an already existing group. It will change the group ID of the user whose username is given and sets the group ID as the given new_group_id.
Command:
sudo usermod -g 1005 test 
Output:
3. Change Login Name
To change a user's login name, use the usermod command with the -l option.
Syntax:
usermod -l new_login_name old_login_name
Command:
sudo usermod -l John_Wick John_Doe 
Output:
4. Change Home Directory
To change a user's home directory, use the usermod command with the -d option. You can specify the new path for the home directory.
Syntax:
usermod -d new_home_directory_path username
Command:
sudo usermod -d new_home_directory test 
Output:
5. Delete a User
The userdel command removes a user from the system. Use the -r option to also delete the user's home directory.
Syntax:
userdel -r username
Command:
sudo userdel -r new_geeks
Output:
Common Issues in User Management in Linux
Managing users in Linux can present various challenges that impact system security and efficiency. The below are some common issues and strategies to address them:
1. Forgotten Passwords
Users may forget their passwords, leading to access issues.
Solution: Administrators can reset passwords using the passwd command.
sudo passwd username
This command prompts for a new password, restoring user access.
2. Account Lockouts
Multiple failed login attempts can lock user accounts.
Solution: Unlock accounts using the usermod command:
sudo usermod -U username
This command unlocks the specified user account.
3. Security Vulnerabilities
Outdated systems can be susceptible to security threats.
Solution: Keep the system updated with the latest patches using the package manager:
sudo apt update && sudo apt upgrade
Regular updates enhance system security.
4. Permission Errors
Incorrect file or directory permissions can restrict user access.
Solution: Adjust permissions using chmod and chown:
sudo chmod 755 /path/to/directory
sudo chown user:group /path/to/file
Proper permissions ensure appropriate access levels.
5. Misconfigured Group Memberships
Users may lack necessary group memberships, limiting access.
Solution: Add users to groups with usermod:
sudo usermod -aG groupname username
This command appends the user to the specified group.
6. Privilege Escalation Risks
Improper configurations can allow unauthorized privilege escalation.
Solution: Review and edit the /etc/sudoers file carefully, preferably using visudo to prevent syntax errors.
sudo visudo
Ensure only authorized users have elevated privileges.
7. Misconfigured User Management Files
Errors in critical files like /etc/passwd and /etc/shadow can disrupt user management.
Solution: Use commands like vipw and vigr to safely edit these files:
sudo vipw
sudo vigr
These commands lock the files during editing, preventing concurrent modifications.
