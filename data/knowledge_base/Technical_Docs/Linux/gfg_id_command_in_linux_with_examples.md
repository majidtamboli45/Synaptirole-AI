# id command in Linux with examples

> Source: https://www.geeksforgeeks.org/linux-unix/id-command-in-linux-with-examples/

The id command in Linux is used to display a user’s identity information, including the user name, User ID (UID), Group ID (GID), and group memberships. It is commonly used by system administrators to verify user permissions, troubleshoot access issues, and audit user accounts.
- Displays the UID and GID of a user
- Shows all groups a user belongs to (primary and secondary)
- Helps verify user permissions and security context
- Useful for debugging permission-related problems
Example: Display Identity of the Current User
Command:
id
- Shows the UID, primary GID, and all group memberships of the current user
- Most commonly used command for quick identity checks
Output:
Note: Without any options, it prints all identity information (UID, GID, and groups)
Common Options of id Command
Syntax:
id [OPTION]… [USER]
Options:
- -g : Prints only the effective group ID of the user.
- -G : Prints all group IDs associated with the user.
- -n : Displays names instead of numeric IDs.
- -r : Shows the real ID instead of the effective one.
- -u : Prints only the effective user ID.
- --help : Displays help messages for the id command and exits.
- --version : Shows the version information and exits.
1. To find a specific user's GID
Command:
id -g master
Again assuming to find GID of master. This option will show the effective group ID of the user.
Output:
2. List All Groups a User Belongs To
Command:
id -G master
- Prints all group IDs associated with the user.
- Useful when checking access to shared files or directories.
Output:
3. Find the UID of a Specific User
Command:
id -u master
- Displays only the User ID (UID) of the user master.
- Useful when checking ownership or permission mappings.
Output:
4. To find out UID and all groups associated with a username
In this case we will use the user "master" to find UID and all groups associated with it.
Command:
id master
Output:
5. To display a name instead of numbers
By default the 'id' command shows us the UID and GID in numbers which a user may not understand, with use of '-n' option with '-u', '-g' and '-G'.
- This makes output more human-readable.
- Preferred when explaining permissions or auditing users.
Syntax:
id -ng master 
or
id -nu master
or
id -nG master
Output:
6. To display real id instead of effective id
To show the real id with the use of '-r' option with '-g', '-u' and '-G'.
Syntax:
id -r -g master
id -r -u master
id -r -G master
Differences Between id and groups Command
Both id and groups are used to check user and group information in Linux, but they serve different purposes:
| Aspect | id Command | groups Command | 
|---|---|---|
| Purpose | Displays complete user identity information | Displays group memberships only | 
| Output | UID, GID, all groups (numeric or names) | Group names only | 
| User Details | Shows user ID and group IDs | Does not show UID or GID | 
| Real vs Effective IDs | Supports real and effective IDs (-r) | Not supported | 
| Script Usage | Better for scripting and audits | Better for quick checks | 
| Output Format | Structured and detailed | Simple and readable | 
When to Use id
- When you need UID, GID, and group details together.
- When troubleshooting permission or access issues.
- When working with scripts, automation, or security checks.
- When checking real vs effective IDs (sudo/SUID cases).
Example:
id username
When to Use groups
- When you only need to know which groups a user belongs to
- For quick, human-readable output
- During basic administration or learning
Example:
groups username
