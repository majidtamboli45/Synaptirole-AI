# userdel Command in Linux

> Source: https://www.geeksforgeeks.org/linux-unix/userdel-command-in-linux-with-examples/

The userdel command is used to remove user accounts from the system. It helps administrators delete unused or unauthorized users, ensuring proper access control and maintaining overall system security.
- Removes unused or inactive user accounts
- Revokes access for users who no longer require it
- Helps maintain system security and compliance
- Keeps the system clean and well organized
Example: To delete a user account, open the terminal and run:
Command:
sudo userdel username
Replace "username" with the actual username you want to remove. The 'sudo' command is used to execute the userdel command with administrative privileges.
Common Options for the 'userdel' Command
Syntax:
userdel [options] [username]
Here,
- 'options': Various command options can be used to customize the behavior of user deletion.
- 'username': Specifies the name of the user account to be deleted.
1. userdel -f
Forcefully deletes a user account, even if the user is currently logged in.
Command:
sudo userdel -f neuser
Output:
(no output if successful)
Note: If no output is displayed, it indicates that the command executed successfully.
2. userdel -r
Deletes the user account along with the user’s home directory and mail spool. Files outside the home directory must be removed manually.
Command:
sudo userdel -r newuser2
This will delete the user’s account along with all files in their home directory.
3. userdel -h
Displays the help message with command syntax and available options.
Command:
userdel -h
This will provide a quick reference to the command’s syntax and available options.
4. userdel -R
Applies changes inside the specified CHROOT_DIR and uses configuration files from that directory. Useful in chroot or isolated environments.
Command:
sudo userdel -R /path/to/chroot newuser2
This is useful when managing user accounts in isolated environments, such as containers or recovery environments.
5. userdel -Z
Removes SELinux user mappings associated with the user account.
Command:
sudo userdel -Z newuser2
This ensures the SELinux mapping for the user is also removed from the system.
