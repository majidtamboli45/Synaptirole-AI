# Different Shells in Linux

> Source: https://www.geeksforgeeks.org/linux-unix/different-shells-in-linux/

A shell is a program that acts as an interface between the user and the Linux operating system. It allows users to interact with the system by accepting commands and executing them. When a user logs in, the operating system automatically starts a shell session. The shell works with the kernel, which manages hardware, processes, memory and system resources.
- Provides a command-line interface for user interaction
- Acts as a bridge between users and the kernel
- Executes system commands and user programs
- Supports scripting and automation
- Manages environment variables and processes
Shell and Kernel Relationship
In Linux, the operating system mainly consists of two core components: the kernel and the shell. Both work together to allow users to interact with the system.
Kernel
The kernel is the core part of the operating system. It is responsible for:
- Controlling access to hardware devices
- Managing CPU, memory and storage resources
- Handling process scheduling and execution
- Enforcing security and access permissions
Note: Users cannot directly communicate with the kernel.
Shell
The shell acts as an interface between the user and the kernel. Its main functions are:
- Accepting commands from the user
- Interpreting command syntax
- Sending instructions to the kernel
- Displaying output on the screen
Working Flow
The interaction between the user, shell and kernel follows this sequence:
User > Shell > Kernel > Hardware
- The user enters a command.
- The shell processes and interprets it.
- The kernel executes the request.
- The result is returned to the user.
This structure ensures secure and efficient system operation.
Types of Shells in Linux
Linux provides multiple shells, each designed with different features and usage purposes. These shells vary in terms of performance, scripting capability and user interaction. Some shells focus on simplicity and portability, while others emphasize advanced customization and productivity.
Commonly Used Linux Shells
The most widely used shells in Linux systems are:
- Bourne Shell (sh)
- C Shell (csh)
- Korn Shell (ksh)
- GNU Bourne-Again Shell (bash)
- T Shell (tcsh)
- Z Shell (zsh)
Note: This order follows a logical progression based on historical development and feature evolution
Bourne Shell (sh)
The Bourne Shell was developed by Steve Bourne at AT&T Bell Labs. It is the original UNIX shell and forms the foundation for many modern shells. It is designed to be fast, lightweight and suitable for system-level scripting.
- First widely used UNIX shell
- Simple and efficient design
- Suitable for portable shell scripts
- Limited interactive features
- No built-in arithmetic support
Denoted As:
sh
Path:
/bin/sh, /sbin/sh
Non-root Prompt:
$
Root Prompt:
#
C Shell (csh)
The C Shell was developed by Bill Joy at the University of California, Berkeley. It introduced several interactive features that were not available in the original Bourne shell. It is known for its C-like syntax and user-friendly command-line behavior.
- Supports C-style programming syntax
- Provides command history and aliases
- Includes built-in arithmetic operation
- Improves interactive command usage
- Suitable for users familiar with C language
Denoted As:
csh
Path:
/bin/csh
Non-root Prompt:
hostname %
Root Prompt:
hostname #
Korn Shell (ksh)
The Korn Shell was developed by David Korn at AT&T Bell Labs. It is a superset of the Bourne shell, meaning it supports all features of sh and adds advanced capabilities. It combines scripting power with strong interactive features.
- Fully compatible with Bourne shell scripts
- Supports arrays, functions and variables
- Provides built-in arithmetic operations
- Offers command history and job control
- Faster and more efficient than C Shell
Denoted As:
ksh
Path:
/bin/ksh
Non-root Prompt:
$
Root Prompt:
#
GNU Bourne-Again Shell (bash)
The GNU Bourne-Again Shell (Bash) is the most widely used shell in Linux systems. It is compatible with the Bourne shell and also includes features from the Korn shell. Bash is the default shell in most Linux distributions.
- Default shell in most Linux environments
- Supports command history and auto-completion
- Provides job control and signal handling
- Powerful scripting and debugging features
- Highly compatible with POSIX standards
Denoted As:
bash
Path:
/bin/bash
Non-root Prompt:
username@hostname:directory$
Root Prompt:
username@hostname:directory#
T Shell (tcsh)
The T Shell (tcsh) is an enhanced and backward-compatible version of the C Shell. It was originally developed on BSD Unix systems and later ported to Linux and other platforms. Tcsh improves the usability of C Shell by adding modern interactive features.
- Compatible with C Shell syntax
- Provides advanced command-line editing
- Supports improved history handling
- Includes programmable auto-completion
- Better error reporting than C Shell
Denoted As:
tcsh
Path:
/bin/tcsh
Non-root Prompt:
username:~>
Root Prompt:
root@hostname:~#
Z Shell (zsh)
The Z Shell (zsh) is an extended and highly customizable shell based on Bash and Korn shell features. It was created by Paul Falstad in 1990 while he was a student at Princeton University. Zsh is popular among advanced users due to its flexibility and rich plugin ecosystem.
- Advanced auto-completion and globbing
- Plugin and theme support through frameworks
- Powerful scripting capabilities
- Highly customizable prompt system
- Better handling of long commands
Denoted As:
zsh
Path:
/bin/zsh
Non-root Prompt:
username%
Root Prompt:
root@hostname:~#
Comparison of Common Linux Shells
The major Linux shells differ in terms of origin, usability, scripting power and customization.
1. Based On / Origin
- sh (Bourne Shell): The original UNIX shell and the base for most modern shells.
- csh (C Shell): Developed independently with C-like syntax.
- ksh (Korn Shell): Built as an extension of the Bourne shell.
- bash (Bourne-Again Shell): Based on Bourne shell and influenced by Korn shell.
- tcsh (T Shell): An improved version of C Shell.
- zsh (Z Shell): Inspired by Bash and Korn shell with added features.
2. Interactive Features
- sh: Provides very limited interactive support.
- csh: Offers basic command history and aliases.
- ksh: Supports advanced job control and history.
- bash: Includes strong interactive features and auto-completion.
- tcsh: Improves C Shell with better editing and completion.
- zsh: Provides the most advanced interactive environment.
3. Scripting Support
- sh: Suitable only for basic and portable scripts.
- csh: Supports scripting but is not recommended for new projects.
- ksh: Provides strong scripting with built-in programming tools.
- bash: Widely used for automation and system scripts.
- tcsh: Mainly used for interactive purposes.
- zsh: Supports advanced scripting features.
4. Customization Capability
- sh: Very limited customization options.
- csh: Basic customization using aliases.
- ksh: Moderate customization support.
- bash: Supports extensive prompt and environment customization.
- tcsh: Highly customizable for interactive use.
- zsh: Offers the highest level of customization with themes and plugins.
5. Default Usage in Linux
- sh: Used mainly for compatibility and scripting.
- csh: Rarely used as a default shell.
- ksh: Common in enterprise UNIX systems.
- bash: Default shell in most Linux distributions.
- tcsh: Used in limited environments.
- zsh: Often chosen manually by advanced users.
6. Learning Difficulty
- sh: Easy to learn due to simplicity.
- csh: Moderate difficulty because of unique syntax.
- ksh: Moderate learning curve.
- bash: Easy for beginners due to wide documentation.
- tcsh: Moderate for C Shell users.
- zsh: Moderate, but useful once learned.
