# Debian Software Package Management(dpkg) in Linux

> Source: https://www.geeksforgeeks.org/linux-unix/debian-software-package-managementdpkg-in-linux/

Debian Software Package Management(dpkg) is the low-level package management system used in Debian-based Linux operating systems. It installs, removes, configures, and manages software packages in the .deb format without handling dependencies automatically.
- Command-line tool for managing Debian (.deb) packages.
- Installs and configures software directly on the filesystem.
- Maintains a local database of installed packages.
- Acts as the backend for higher-level tools like apt.
Example: Listing the debian packages
dpkg -l
This command displays a list of all installed Debian packages on the system.
Output:
Syntax
dpkg [options] action
- options: optional tags that modify the behavior of dpkg.
- action: specifies what dpkg should do.
Key Features
1. Low-Level Package Control
- Directly installs, removes, and configures .deb packages.
- Provides fine-grained control over individual package operations.
2. Package Database Management
- Maintains a local record of installed packages.
- Tracks the current state of each package on the system.
3. System-Level Operation
- Interacts directly with the Linux filesystem.
- Manages package-related configuration files and scripts.
4. Backend for Higher-Level Tools
- Acts as the core engine for apt and similar tools.
- Executes actual package installation and removal tasks.
Common dpkg Commands
1. Installing a standalone package
To install a package, -i flag is used. To install a standalone package using the Debian package.
Syntax:
sudo dpkg -i name_of_package.deb
Command:
sudo dpkg -i atom-amd64.deb
This command installs a standalone .deb package for Atom, an open-source text editor.
Output:
2. Removing a package
To remove a package, the -r flag is used with the dpkg command.
Syntax:
sudo dpkg -r name_of_package
Command:
sudo dpkg -r atom
This command is used to remove the Atom text editor package from the system while keeping its configuration files intact.
Output:
3. Purging a Package
The -P (purge) flag removes the package along with all configuration files.
Command:
sudo dpkg -P googler
This command completely removes the package and its configuration files from the system.
Output:
4. Finding a Specific Installed Package
To search for a particular package, the output of dpkg -l can be filtered using the grep command.
Command:
dpkg -l | grep atom
This command displays information only about the specified package if it is installed on the system.
Output:
5. Listing All Available dpkg Commands
To list all available options and commands supported by dpkg, the --help option is used.
Command:
dpkg -–help
This command displays a help menu containing all available dpkg commands and options.
Output:
- a few more options of dpkg:
6. View the content of a particular package
To view the content of the particular package -c flag is used
Command:
dpkg -c flashplugin-nonfree_3.2_i386.deb
This command lists all files that will be installed by the specified Debian package.
Output:
7. Printing the System Architecture
The --print-architecture option displays the system architecture
Command:
dpkg --print-architecture
This command outputs the system architecture, such as amd64, i386, or arm64.
Output:
8. Unpacking a Package
To unpack a package without configuring it, the --unpack flag is used.
Command:
dpkg --unpack flashplugin-nonfree_3.2_i386.deb
This command extracts the package files but does not configure the package.
Output:
- To configure it later:
Command:
dpkg --configure flashplugin-nonfree
Output:
9. Checking Whether a Package Is Installed
To check if a particular package is installed or not -s flag is used.
Command:
dpkg -s git
Output:
10. Reconfigure the installed package
To reconfigure the already installed package dpkg-reconfigure command is used
Command:
dpkg-reconfigure [package-name]
This command re-runs the configuration process for the specified package.
11. Locating Installed Package Files
The location of the installed package can be found using -L flag.
Syntax:
dpkg -L [package-name]
Command:
dpkg -L git
Output:
12. Checking for Package Issues
To check for partially installed or broken packages, the --audit option is used.
Command:
dpkg --audit
This command reports any issues related to package installation or configuration.
13. Clearing Available Package Information
To erase stored information about available packages, the --clear-avail option is used.
Command:
dpkg –-clear-avail
This command clears cached information about available packages from the system.
14. Display dpkg version
dpkg –version is used to display dpkg version information.
Command:
sudo dpkg --version
This command shows the current version of the Debian package manager installed on the system.
Output:
