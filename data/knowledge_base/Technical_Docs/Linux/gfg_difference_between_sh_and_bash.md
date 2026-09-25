# Difference between sh and bash

> Source: https://www.geeksforgeeks.org/computer-networks/difference-between-sh-and-bash

In Linux and Unix-like systems, sh and bash are command-line shells used to execute commands and run scripts. A shell acts as an interface between the user and the operating system, allowing users to interact with the system through commands. sh was developed by Stephen R. Bourne, while bash was later developed by Brian Fox as an enhanced replacement.
- sh is the original Bourne Shell and follows POSIX standards.
- bash (Bourne Again Shell) is an extended version of sh with more features.
- sh focuses on portability and minimalism.
- bash provides advanced scripting and interactive capabilities.
Shell
A shell is a command-line interface that acts as an intermediary between the user and the operating system. It interprets textual input and executes commands, enabling interaction with system resources and processes. Different shell flavors include sh, bash, ksh, csh, and zsh, each offering unique features while maintaining core command-line functionality.
- Command Execution: Runs system commands and programs.
- Script Execution: Interprets and runs shell scripts.
- Process and File Management: Handles file operations and process control.
- Automation: Facilitates repetitive tasks through scripting.
sh (Bourne Shell)
sh is the original Bourne Shell, developed by Stephen R. Bourne. It is defined by the POSIX standard and serves as a specification for shell behavior, making it highly portable across Unix and Unix-like systems. Most modern implementations of /bin/sh are symbolic links to shells like dash, ksh, or the original Bourne shell.
- Predecessor of bash
- POSIX-compliant and highly portable
- Commonly implemented as /bin/sh linked to dash, ksh, or Bourne shell
- Scripts written for sh are generally compatible with bash due to backward compatibility
Shebang Example:
#!/bin/sh
Notes: Specifies that the script should run using the sh interpreter.
bash (Bourne Again Shell)
bash is an enhanced version of sh, developed by Brian Fox as part of the GNU Project. It is the default shell on most Linux distributions and provides extended scripting capabilities, interactive features, and better usability compared to sh.
- Successor and superset of sh
- Includes advanced scripting features and interactive capabilities
- Supports job control, command history, aliases, arrays, and extended test conditions
- Scripts written for sh usually run on bash without modification
Shebang Example:
#!/bin/bash
Notes: Specifies that the script should run using the bash interpreter.
Difference between sh and bash
The table highlights the key differences between bash (Bourne Again SHell) and sh (Bourne Shell), comparing their features, functionality, portability, and scripting capabilities.
| Bash | sh | 
|---|---|
| Bourne Again SHell | SHell | 
| Developed by Brian Fox | Developed by Stephen R. Bourne | 
| Successor of sh | Predecessor of bash | 
| Default shell | Not the default shell | 
| Shebang: #!/bin/bash | Shebang: #!/bin/sh | 
| More functionality with upgrades | Less functionality | 
| Supports job control | Does not support job control | 
| Not a valid POSIX shell | Valid POSIX shell | 
| Easy to use | Not as easy as Bash | 
| Less portable | More portable | 
| Extended version of language | Original language | 
| Bash scripting (specific to Bash) | Shell scripting (any shell) | 
| Supports command history | Does not support command history | 
- SH is lightweight and highly portable, whereas Bash is feature rich and suitable for complex scripts.
- SH focuses on compatibility across systems, while Bash allows advanced features such as arrays, aliases, and interactive commands.
- Bash provides job control, command history, and enhanced string and file manipulation, which SH does not support.
Real-World Applications
1. Portable Scripts Across Unix Systems
sh is ideal for scripts that must run on multiple Unix/Linux systems without modification.
Script:
#!/bin/sh
echo "Running a portable shell script"
- Ensures compatibility with minimal Unix environments
- Useful for system initialization scripts or installer scripts
2. Advanced Automation and Interactive Tasks
bash is preferred when scripts require advanced features such as arrays, command history, or job control.
Script:
#!/bin/bash
for i in {1..5}; do
echo "Task $i completed"
done
- Automates repetitive tasks efficiently
- Ideal for Linux system administration, DevOps scripts, and cron jobs
3. System Administration and User Environments
Most Linux distributions use bash as the default login shell:
- Interactive command-line sessions with history and tab completion
- Running complex scripts for backups, monitoring, and user management
- Facilitates easier debugging and development
