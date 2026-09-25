# Shell Scripting: Understanding Shebang (#!/bin/bash)

> Source: https://www.geeksforgeeks.org/linux-unix/shell-scripting-define-bin-bash/

Scripts are a powerful way to automate tasks in Linux. A shell provides an interface between the user and the operating system. When working in a Linux terminal, users interact with the system through the shell to execute commands. In shell scripting, the shebang (#!/bin/bash) specifies which interpreter should run a script.
- Helps the system identify the correct shell for script execution
- Ensures scripts run in the intended environment
- Improves script portability and reliability
- Allows scripts to behave like executable programs
Shebang
The shebang is a special character sequence placed at the beginning of a script file. It starts with #! and is followed by the path of the interpreter that should run the script. When a script is executed, the operating system reads the shebang line and uses the specified program to interpret the script.
Purpose of Shebang
The shebang ensures that scripts:
- Run in the correct shell or interpreter
- Follow the right language rules
- Behave like executable programs
- Improve portability and reliability
Note: Without a shebang, the system may not know how to interpret the script correctly.
Format of Shebang
#!/path/to/interpreter
Example:
#!/bin/bash
- #! indicates the start of the shebang
- /bin/bash specifies the Bash interpreter
Example 1: Using #!/bin/bash in a Script
To show how a shebang specifies Bash as the interpreter for a script.
Script (File: hello.sh)
#!/bin/bash
echo "Hello World!"
Command:
chmod +x hello.sh
./hello.sh
- #!/bin/bash tells the system to use Bash to run the script
- chmod +x makes the script executable
- ./hello.sh runs the script directly
- echo prints text on the screen
Output:
Example 2: Running a Script Without Shebang
To show what happens when a script does not contain a shebang.
Script (File: test.sh)
echo "This is a test"
Command:
chmod +x test.sh
./test.sh
- The script does not specify an interpreter
- The system tries to use the default shell
- On some systems, this may cause errors
Note: If the default shell is not compatible, the script may fail.
Output (May Vary):
- Or an error on some systems.
Example 3: Using a Different Interpreter in Shebang
To show how shebang can be used with other shells.
Script (File: sh_script.sh)
#!/bin/sh
echo "Running with sh"
Command:
chmod +x sh_script.sh
./sh_script.sh
- #!/bin/sh tells the system to use the Bourne shell
- The script runs using sh instead of Bash
- This improves portability across systems
Output:
Syntax of Shebang (#!/bin/bash)
The shebang follows a fixed format that must be written correctly for the script to execute properly.
#!/path/to/interpreter [optional-arguments]
- #!: (Shebang Characters)
- Together, #! tells the operating system that this file is a script
- /path/to/interpreter: The absolute path of the program used to run the script.
Note: Without #!, the system will not treat the file as an executable script.
Example:
/bin/bash
- The script should be executed using Bash
- Bash is located in the /bin directory
Note: The path must be correct. If the interpreter does not exist at that location, the script will fail.
Important Rules for Shebang
- It must be the first line of the script
- No spaces are allowed before #!
- It must contain a valid interpreter path
- It works only for executable files
Difference between #!/bin/bash and #!/bin/sh:
#!/bin/bash
- Uses the Bash shell to execute scripts.
- Default shell on most Linux systems.
- Supports advanced Bash-specific features like arrays, functions, and extended scripting syntax.
- Ensures full compatibility for scripts relying on Bash features.
#!/bin/sh
- Uses the system’s default Bourne-compatible shell.
- Provides basic shell functionality.
- May be linked to Bash, Dash, or another shell depending on the system.
- Supports portable scripts but may not work with Bash-specific features.
Other Common Shebangs
1. #!/bin/csh
- Executes the C shell (csh) or compatible shell.
- Commonly used in older Unix scripts or scripts requiring C shell syntax.
- Supports features like aliases and history specific to C shell.
- Best suited when scripts rely on C shell syntax instead of Bash.
2. #!/usr/bin/perl -T
- Executes Perl scripts with taint checks enabled (-T).
- Taint mode enhances security by preventing unsafe data from being used in critical operations.
- Commonly used in system administration or web scripts where user input must be validated.
3. #!/usr/bin/php
- Executes PHP scripts through the command-line interface (CLI).
- Suitable for running server-side PHP scripts outside of a web server.
- Allows automation of tasks, such as generating reports or processing files using PHP.
4. #!/usr/bin/python -O
- Executes Python scripts with optimizations enabled (-O).
- Optimizations can remove assert statements and improve runtime performance slightly.
- Useful for production scripts where minor speed improvements are needed.
5. #!/usr/bin/ruby
- Executes Ruby scripts through the Ruby interpreter.
- Enables automation, scripting, and quick prototyping using Ruby syntax.
- Supports both simple scripts and complex programs, depending on the Ruby runtime.
