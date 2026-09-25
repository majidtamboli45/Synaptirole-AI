# Define Bash Variables and its types

> Source: https://www.geeksforgeeks.org/linux-unix/bash-script-define-bash-variables-and-its-types/

Bash variables are used to store data that scripts can access and manipulate during execution. They can hold different types of values including text, numbers, command output and arrays. Variables make scripts dynamic and reusable by allowing values to change based on input or conditions, rather than being hardcoded. Without them, handling user input, storing intermediate results, or controlling script behavior would be significantly harder to manage.
- No explicit type declaration required (untyped by default)
- Scopes include local, global, environment and special variables
- Values are referenced by prefixing the variable name with a dollar sign ($)
- Enable dynamic behavior through parameter expansion and substitution
Working of Bash variables
In Bash scripting, variables act as placeholders for data that can be accessed and modified during script execution. When a script runs, the shell handles variables in the following way:
- Read the script line by line: Bash interprets each line sequentially.
- Identify defined variables: It detects any variable names and their assigned values.
- Substitute values: Variable names are replaced with their current values wherever they are used.
- Execute commands: Commands are run using the substituted values.
- Repeat the process: Bash continues this process until the end of the script.
- To access a variable’s value, use the $ symbol before its name.
Example
#!/bin/bash
myvar="Gfg"
echo $myvar
- $myvar: Retrieves the value stored in the variable myvar.
- Without $, Bash would treat myvar as a literal string instead of a variable.
Output:
Naming Rules for Bash Variables
Proper naming of variables is essential to avoid errors and ensure clarity in scripts. Bash enforces the following rules for variable names:
- Start with a letter or underscore (_): Variables cannot begin with a number.
- Can include letters, numbers and underscores: No other special characters are allowed.
- Case-sensitive: gfg, Gfg and GFG are considered different variables.
- Avoid special characters: Characters like @, !, *, or spaces are invalid in names.
Examples of Valid Variable Names
#!/bin/bash
#Valid Variable Examples
gfg="Value-1"
GFG="Value-2"
_gfg="Value-3"
g_f_g="Value-4"
March6="Value-5"
echo $gfg
echo $GFG
echo $_gfg
echo $g_f_g
echo $March6
Output:
Examples of Invalid Variable Names
#!/bin/bash
#Invalid Variable Examples
6March
!gfg
gfg*GFg
@Gfg
Output:
Note: Using lowercase letters for user-defined variables is recommended to avoid conflicts with system-defined variables.
Declaring and Assigning Variables
Creating a variable in Bash is straightforward. You simply assign a value to a name using the = sign. Bash variables do not require explicit datatype declaration, making them flexible but untyped by default.
Basic Syntax
variableName=value
- No spaces around the = sign.
- If the value contains spaces, enclose it in quotes (" or ').
Correct assignment:
myvar=geeks
myvar="Geeks for Geeks"
Incorrect assignment (causes error):
myvar = geeks
Output:
Using declare to Define Variables
The declare command allows optional enforcement of variable properties such as read-only, integer, or array types.
declare myvar="geeks"
- Useful when you want to explicitly mark a variable’s purpose or data type.
- Supports flags for integers (-i), arrays (-a) and associative arrays (-A).
Local and Global Variables
In Bash, variable scope determines where a variable can be accessed within a script. If scope is not handled properly, it may lead to unexpected behavior, especially when functions are involved.
Global Variables
A global variable is defined outside any function. It is accessible throughout the script, including inside functions (unless a local variable with the same name overrides it).
Example:
#!/bin/bash
myvar=5 # Global variable
function show() {
echo "Inside function: $myvar"
}
show
echo "Outside function: $myvar"
- The variable myvar is defined globally.
- It can be accessed both inside and outside the function.
Output:
Local Variables
A local variable is declared inside a function using the local keyword. It exists only during the execution of that function. Using local variable helps to prevent accidental modification of global variables.
Example:
#!/bin/bash
myvar=5 # Global variable
function calc() {
local myvar=10 # Local variable
(( myvar = myvar * 2 ))
echo "Inside function (local): $myvar"
}
calc
echo "Outside function (global): $myvar"
- The local variable myvar exists only inside calc.
- The global variable remains unchanged.
- Once the function finishes execution, the local variable is destroyed.
Output:
Types of Bash Variables
1. System-Defined (Environment) Variables
These variables are predefined and maintained by the Bash shell. They are automatically loaded whenever a new shell session starts and are generally written in uppercase letters. They store important system-related information such as user details, paths and shell configuration.
- BASH_VERSION: Displays the current Bash version
- PWD: Present Working Directory
- HOME: Home directory of the current user
- USER: Current logged-in user
- HOSTNAME: Name of the system
- PATH: Directories where executable programs are searched
- LANG: System language setting
Viewing Environment Variables
Command:
printenv
or
env
Output:
- These commands display all environment variables available in the current session.
2. User-Defined Variables
These variables are created by the user inside a shell session or script.
- Exist only during the session or script execution
- Are deleted once the script finishes (unless exported)
- Should preferably be written in lowercase to avoid conflicts with system variables
Syntax:
variable_name=value
Example:
myvar="Hello"
echo $myvar
Output:
Built-in Special Variables
Bash provides several predefined special variables that store important runtime information. These variables are automatically managed by the shell and are mainly used for scripting, debugging and handling command-line arguments.
Common Special Variables
- $$: Process ID (PID) of the current shell
- $?: Exit status of the last executed command
- $0: Name of the script being executed
- $1 – $9: First to ninth command-line arguments
- ${10} – ${n}: Tenth to nth argument
- $#: Total number of arguments passed
- $@ or $*: All arguments passed to the script
1. $$: Process ID of Current Shell
This variable returns the PID under which the script or shell is running. Useful for debugging or creating temporary files with unique names.
Command:
echo $$
Output:
2. $?: Exit Status of Last Command
Every command in Linux returns an exit status:
- 0: Success
- Non-zero (1–255): Error or failure
Example:
ls
echo $?
Output:
Common Exit Codes:
- 0: Success
- 1: General error
- 2: Misuse of shell builtins
- 126: Command found but not executable
- 127: Command not found
3. $0, $1, $#, $@: Script Arguments
These are called positional parameters and are used when passing arguments to a script. Special variables make Bash scripts more dynamic and flexible by enabling interaction with system information and user input.
Example Script:
#!/bin/bash
echo "Script name: $0"
echo "First argument: $1"
echo "Second argument: $2"
echo "Total arguments: $#"
echo "All arguments: $@"
Run the script:
bash script.sh Hello World
Output:
Array Variables in Bash
Arrays in Bash allow you to store multiple values in a single variable. Unlike many programming languages, Bash arrays are flexible and can store elements of different types (strings, numbers, etc.). Arrays are especially useful when working with lists of data such as filenames, user inputs, or command outputs.
Declaring an Array
The simplest way to declare an array is by assigning space-separated values inside parentheses.
Syntax:
arrayName=(element1 element2 element3)
- If an element contains spaces, enclose it in quotes:
Syntax:
arrayName=("Bash variables" Linux GFG)
Accessing Array Elements
Each element is accessed using its index number. Indexing in Bash starts from 0.
Syntax:
echo ${arrayName[0]}
- This prints the first element.
Getting the Length of an Array
To find the total number of elements:
echo ${#arrayName[@]}
- #: Returns length
- [@]: Refers to all elements
Example: Iterating Through an Array
#!/bin/bash
declare -a my_data=("Learning" "Bash variables" "GFG")
arrLength=${#my_data[@]}
echo "Total number of elements: $arrLength"
for (( i=0; i<arrLength; i++ ))
do
echo "Element $((i+1)) is '${my_data[$i]}' and its length is ${#my_data[i]}"
done
echo "All elements: ${my_data[@]}"
Output:
Explicitly Declaring Data Types Using declare
In Bash, variables are untyped by default, meaning the shell automatically interprets the type based on the assigned value. However, there are situations where you might want to explicitly define the type of a variable to avoid unexpected behavior or to enforce restrictions. This is done using the declare command with specific flags.
- Enforces data type constraints (integers, arrays).
- Helps avoid unexpected behavior when performing operations.
- Improves readability and maintainability of scripts.
1. Declaring an Integer
The -i option of the declare command defines a variable as an integer type. Bash treats every value assigned to it as an arithmetic expression and automatically evaluates it as an integer.
#!/bin/bash
declare -i myvar
myvar=5
myvar=myvar+10
echo $myvar
- -i: Marks the variable as an integer.
- Any arithmetic operation on myvar is evaluated automatically.
- Assigning a non-integer value will result in 0 or an error depending on the input.
Output:
2. Declaring an Array
The -a option in the declare command defines a variable as a regular indexed array. An indexed array stores multiple values where each element is identified by a numeric index starting from 0.
#!/bin/bash
declare -a myarray=("Linux" "Bash" "GFG")
echo ${myarray[1]}
- -a: Declares a standard array.
- Elements are accessed using index numbers.
Output:
3. Declaring an Associative Array
The -A option defines an associative array, which stores data as key value pairs instead of numeric indices. Associative arrays are useful when you want to access values using meaningful names (keys).
#!/bin/bash
declare -A scores=([Ron]=10 [John]=30 [Ram]=70 [Shyam]=100)
# Print all keys and values
for key in "${!scores[@]}"; do
echo "$key scored: ${scores[$key]}"
done
- -A: Declares an associative array.
- ${!scores[@]}: Returns all keys.
- ${scores[$key]} : Accesses the value corresponding to a key.
Output:
Command-Line Arguments
Command-line arguments, also called positional parameters, allow you to pass input values to a Bash script or command at runtime. They make scripts dynamic, reusable and flexible, eliminating the need to hardcode values.
Syntax
bash script.sh argument1 argument2 argument3 ...
- Arguments are accessed using special variables: $1, $2, ..., $n.
- $#: Total number of arguments
- $@ or $*: All arguments passed
Example 1: Storing Arguments in a Variable
#!/bin/bash
# Store all arguments in an array
myvar=("$@")
le="$#"
echo "Total arguments: $le"
for (( i=0; i<le; i++ )); do
echo "Argument $((i+1)) is => ${myvar[i]}"
done
Run the script:
bash cli_arg_stor.sh Hello Bash GFG
Output:
Example 2: Using Individual Special Variables
#!/bin/bash
echo "Script name: $0"
echo "First argument: $1"
echo "Second argument: $2"
echo "Total number of arguments: $#"
echo "All arguments: $@"
Note: $0 always represents the script itself.
Run the script:
bash cli_arg_stor_2.sh Sahil Linux
Output:
Command Substitution
Command substitution allows you to capture the output of a command and store it in a variable for further use. This makes scripts dynamic by letting you use results from other commands within your script.
Syntax:
There are two common ways to perform command substitution:
varname=`command`
or
varname=$(command)
- Both forms execute the command and replace it with its output.
- The $(...) syntax is preferred for readability and nesting commands.
Example 1: Using ls Output in a Variable
#!/bin/bash
myvar=$(ls)
echo "Files in current directory: $myvar"
Output:
- $(ls) runs the ls command.
- Its output is assigned to myvar.
- Printing $myvar shows all filenames in a single line, space-separated.
