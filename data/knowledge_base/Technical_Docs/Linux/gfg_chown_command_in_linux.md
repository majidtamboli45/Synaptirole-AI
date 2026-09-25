# chown Command in Linux

> Source: https://www.geeksforgeeks.org/linux-unix/chown-command-in-linux-with-examples/

The chown command in Linux allows modifying the ownership of files or directories. It can assign a new user, group, or both, either individually or simultaneously. only root or privileged user (via sudo) can change ownership.
- Supports recursive changes with the -R option for directories.
- Can change ownership of single or multiple files at once.
- Offers verbose reporting and conditional ownership change using options.
- Works with symbolic links using dedicated options (-h, -H, -L, -P).
Syntax
chown [options] new_owner[:new_group] file(s)
Here's a breakdown of the components:
- chown: The base command.
- [options]: Optional flags that control the behavior of the command.
- new_owner: Specifies the user who will become the new owner of the file.
- [:new_group]: Specifies the group to be assigned. This part is optional and must be preceded by a colon (:).
- file(s): One or more files or directories whose ownership will be modified.
Understanding User Ownership and Permissions in Linux
Different users in the operating system have ownership and permission to ensure that the files are secure and put restrictions on who can modify the contents of the files. In Linux, different users use the system:
- Root User: It is a superuser who has access to all the directories and files in our system, and it can perform any operation. An important thing to note is that only the root user can perform changing of permissions or ownership of the files that are not owned by them.
- Regular User: These users have limited access to files and directories and can only modify the files that they own.
Ownership and Permissions
To protect and secure files and directories in Linux we use permissions to control what a user can do with a file or directory. Linux uses three types of permissions:
- Read: This permission allows the user to read files in directories, it lets the user read directories and subdirectories stored in it.
- Write: This permission allows a user to modify and delete a file. Also, it allows a user to modify its contents (create, delete, and rename files in it) for the directories.
- Execute: This permission on a file allows it to get executed. For example, if we have a file named php.sh unless it is given execute permission it won't run.
Examples to Change File Ownership in Linux
1. Change the Owner of a File
To Change the owner of a file in Linux. Update file ownership when responsibility or access needs to be transferred to another user, such as after file creation by root or file migration between users.
Syntax:
chown owner_name file_name
Command:
chown master file1.txt
This designates the user "master" as the new owner of file1.txt.
2. Change the Group of a File
Modify the group associated with a file so that users belonging to a specific group can access or manage it according to group permission rules, without altering the file owner.
Command:
chown :group1 file1.txt
- ':' specifies that only the group ownership is updated
- group1: becomes the new group owner
- The existing file owner remains unchanged
In this scenario, the group "group1" is assigned as the new group for the file 'file1.txt'. This operation is handy for managing access permissions within specific groups.
3. Change Owner and Group of a File
Perform a simultaneous change of both the file owner and the group to ensure correct ownership and group association in a single operation.
Command:
chown master:group1 file1.txt
- master: becomes the new file owner
- group1: is assigned as the new group
- Both ownership attributes are updated together
Here, greek1 is a file.
4. Change Owner Only if Current Owner Matches (--from)
Update file ownership only when the current owner matches a specific user, adding a layer of control to prevent unintended changes.
Command:
chown --from=master root greek1
- --from=master: ensures the change occurs only if the current owner is master
- root: becomes the new owner if the condition is met
- greek1: is the target file
This command ensures that ownership is changed from "master" to "root" only when the current owner is "master." It adds an additional layer of control to ownership modifications.
5. Change Group Only if Current Group Matches (--from)
Update the group ownership of a file only when the current group matches a specified value, preventing accidental changes to unrelated files.
Command:
chown --from=:group1 root greek1'
- --from=:group1: ensures the group is changed only if it is currently group1
- root: becomes the new group owner
- greek1: is the target file
This command specifically changes the group of greek1 from "group1" to "root." It is useful when refining group associations.
Here, the group of greek1 is changed to root.
6. Copy Ownership from One File to Another (--reference)
Duplicate the ownership (user and group) from one file to another, ensuring consistent permissions and simplifying bulk ownership management.
Command:
chown --reference=greek1 greek2
- --reference=greek1: uses the ownership of greek1 as the source
- greek2: inherits both the user and group from greek1
- Useful for applying the same ownership to multiple files without manually specifying owner and group
This command copies the ownership details from "greek1" to "greek2," ensuring consistency in ownership between the two files.
7. Change Owner and Group of Multiple Files
Apply ownership changes to several files in a single command, streamlining management of multiple files without repeating the command for each file individually.
Command:
chown master:group greek2 greek3
- master: becomes the owner of both files
- group: is assigned as the new group for both files
Multiple files are listed after the owner:group specification
Options available in 'chown' command in Linux
Here are common options for change owner of file in Linux:
1. Using '-c' Option in 'chown' to Change File Ownership
The '-c' option in the 'chown' command is utilized to report when a file change is made. This option is beneficial when you want to receive notifications about ownership alterations.
Example:
chown -c master file1.txt
This command notifies you when the ownership of 'file1.txt' is changed, providing valuable feedback for tracking modifications.
2. Using '-v' Option in 'chown' to Change File Ownership
The '-v' option enhances the verbosity of the 'chown' command by showing detailed information for every processed file. This is particularly useful when you want a comprehensive log of ownership changes.
Example:
chown -v master file1.txt
By using this command, you get a verbose output, displaying information about each file processed during the ownership change.
3. '-f' Option in 'chown' to File Ownership in Linux.
The '-f' option in the chown command serves to suppress most error messages
chown -f master file1.txt
In this case, the command attempts to change ownership, and any error messages are suppressed, allowing for a more seamless execution.
Additional Useful Options in chown
Here are more options when managing file ownership across different files, directories, and symbolic links.
- -h: Modifies ownership of a symbolic link instead of its referenced file.
- --reference=FILE : Uses another file as a reference to copy ownership.
- --from=OWNER:GROUP : Changes ownership only if file’s current ownership matches given values.
- -R : Recursively change ownership of all files and subdirectories.
- -H, -L, -P : Control how symbolic links are handled during recursive changes.
