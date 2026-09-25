# Shell Variables in Bash Scripting

> Source: https://www.geeksforgeeks.org/linux-unix/shell-scripting-shell-variables/

A shell variable is a named container used to store data in memory while a shell script is running. Think of it as a labelled box that holds data during script execution. The stored value can be a string, number, filename or even the output of a command. Variables make shell scripts dynamic and flexible instead of hard-coded and static.
- Store temporary data during script execution
- Accept and process user input
- Store the output of commands
- Control decision-making in loops and conditionals
- Pass arguments between scripts and processes
Types of Shell Variables
Shell variables can be categorized based on their scope, availability and purpose.
1. Local Variables
Local variables are variables that are defined inside a shell or script and exist only for the duration of that shell session or script execution. Once the script finishes or the shell exits, these variables are automatically destroyed.
- Accessible only inside the script or shell where they are defined
- Not available to child processes
- Most commonly used in shell scripts for temporary data
2. Environment Variables
Environment variables are special variables that are stored in the shell environment and are automatically passed to child processes created from that shell. They are used to configure system behavior and application settings.
- Accessible by all child shells and programs
- Usually written in uppercase by convention
- Used to control the behavior of the shell and applications
Examples: PATH, HOME, USER, PWD
3. Built-in Shell Variables
Built-in shell variables are predefined variables that are automatically created and managed by the shell to provide information about the system, shell environment and script execution state.
- Provided by the shell itself
- Used to access system and script-related information
- Often used for scripting logic and debugging
Examples:
- $SHELL: Path to the current shell (e.g., /bin/bash).
- $HOSTNAME: The name of the host machine.
- $?: The exit status (0-255) of the last command (0 indicates success).
- $1, $2: Positional parameters (arguments passed to your script).
Rules for Defining Variables
When creating shell variables, you must follow certain rules to ensure your script runs correctly. Incorrect definitions can cause errors or unexpected behavior.
1. No Spaces Around =
The equals sign (=) must not have spaces on either side.
VAR="Hello"
Note: Shell treats spaces as command separators, so spaces around = break the assignment.
2. Use the Assignment Operator =
- Use = to assign a value to a variable.
- Do not include $ when defining a variable.
Example:
name="John"
3. Variable Naming Rules
- Names can contain letters (a-z, A-Z), numbers (0-9) and underscores (_)
- Names must start with a letter or underscore
- Avoid special characters and punctuation
Conventions:
- Local variables: lowercase or mixed case (user_name, filePath)
- Environment variables: ALL_CAPS (PATH, HOME, USER)
4. Case Sensitivity
- Shell variable names are case-sensitive.
- Var and var are considered different variables.
Accessing Variables
Once a variable is defined, you can use its value in a script by prefixing the variable name with $. This tells the shell to replace the variable name with its stored value.
1. Basic Access
Display or use the value of a variable.
Script:
#!/bin/bash
VAR_1="Devil"
VAR_2="OWL"
echo "$VAR_1$VAR_2"
Output:
- Using quotes ("$VAR_1") ensures spaces and special characters are handled safely.
- Without quotes, the shell may split words or misinterpret special characters.
2. Read only Variables.
These variables are read only i.e., their values could not be modified later in the script. Following is an example:
#!/bin/bash
var1="Devil"
var2=23
readonly var1
echo $var1 $var2
var1=23
echo $var1 $var2
Output:
3. Unsetting Variables
Remove a variable from memory.
#!/bin/bash
var1="Devil"
var2=23
echo $var1 $var2
unset var1
echo $var1 $var2
Output:
Note: The unset command cannot be used to unset read-only variables.
Scenario-Based Examples
1. Store User Input and Calculate Area
Use variables to take input from the user and perform calculations.
#!/bin/bash
echo "Enter the length of the rectangle:"
read length
echo "Enter the width of the rectangle:"
read width
area=$((length * width))
echo "The area of the rectangle is: $area"
- read: Stores user input into variables length and width
- $(( )): Evaluates arithmetic expressions
- area: Holds the calculated result
2. Display Message Based on Time
Store command output in a variable and use it to control logic.
#!/bin/bash
time=$(date +%H)
if [ $time -lt 12 ]; then
message="Good Morning User"
elif [ $time -lt 18 ]; then
message="Good Afternoon User"
else
message="Good Evening User"
fi
echo "$message"
- $(date +%H): Stores the current hour in time
- if statements: Decide the message based on the hour
- message: Variable holds the greeting
3. Combined Shell Script Example
Demonstrates all types of shell variables including local, read-only and unset together in one script.
#!/bin/bash
# Variable definitions (local)
Var_name="Devil"
Var_age=23
# Accessing variables using $
echo "Name is $Var_name and age is $Var_age."
# Read-only variable
var_blood_group="O-"
readonly var_blood_group
echo "Blood group is $var_blood_group and read-only."
echo "Error occurs if trying to modify a read-only variable."
# Attempt to modify read-only variable
var_blood_group="B+"
echo
# Unsetting a variable
unset Var_age
echo "After unsetting Var_age..."
echo
echo "Name is $Var_name, blood group is $var_blood_group and age is $Var_age..."
- Var_name and Var_age: Local variables.
- var_blood_group: read-only, so modifying it causes an error.
- unset Var_age: Removes the variable from the shell, so it no longer exists or holds any value.
- $Var_name, $Var_age and $var_blood_group: Show how variables are accessed.
Output:
Shell and Its Type
A shell is a program that provides a user interface to interact with the operating system. It allows users to execute commands, run scripts and manage system resources. Essentially, the shell is the environment where scripts and programs are executed.
There are several types of shells available, each with its own features and syntax:
- Bourne Shell (sh): The original UNIX shell; simple and widely used for scripting
- C Shell (csh): Syntax similar to the C programming language; popular for interactive use
- Bourne-Again Shell (bash): Most commonly used in Linux and macOS; includes features from sh, csh and ksh
- Korn Shell (ksh): Combines features of sh with additional scripting capabilities
- Z Shell (zsh): Advanced shell with user-friendly features like tab completion and themes
Uses of Shell Variables in Shell Scripting
Shell variables are fundamental to shell scripting because they allow scripts to store, manipulate and pass data dynamically. They make scripts flexible, interactive and capable of handling real-time data. Their main uses include:
- Storing temporary data: Hold values that are used multiple times during script execution
- Accepting user input: Capture input dynamically using commands like read
- Displaying output: Print values or messages using echo
- Storing command output: Save results from commands using command substitution $(command)
- Controlling program flow: Work with loops, conditional statements and functions to control script behavior
- Passing arguments to scripts or commands: Share data between scripts and programs
- Setting environment variables: Configure system behavior or pass information to child processes
- Storing configuration or system data: Maintain constants and important values within scripts
Quick Reference for Shell Variables
- MY_VAR="value": Creates a variable named MY_VAR and assigns it a value. Example: MY_VAR="Hello"
- echo "$MY_VAR": Shows the value stored in the variable safely, keeping spaces and special characters intact. Example: prints Hello
- echo '$MY_VAR': Prints the text $MY_VAR exactly as typed, without replacing it with the value
- echo $MY_VAR: Prints the value, but may break if it contains spaces or special characters
- NOW=$(command): Runs a command and stores its output in a variable. Example: NOW=$(date +%H:%M) stores the current time
- read VAR: Lets the user type input and stores it in the variable VAR. Example: read name then echo "Hello $name"
- readonly VAR: Makes a variable unchangeable after it is set. Example: readonly PI=3.14
- unset VAR: Deletes a variable from memory so it no longer exists
- export VAR: Makes a variable available to other programs or scripts started from this shell
- $?: Shows the exit status of the last command. 0 means success, any other number means error
- $1, $2, …: Hold the arguments passed to a script. Example: running ./script.sh Alice 25 makes $1=Alice and $2=25
