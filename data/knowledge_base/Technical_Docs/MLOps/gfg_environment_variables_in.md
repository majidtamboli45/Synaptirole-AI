# Environment Variables in Python

> Source: https://www.geeksforgeeks.org/python/environment-variables-in-python

Environment variables are key-value pairs that live in our system's environment. Python reads some of these variables at startup to determine how to behave, for example, where to look for modules or whether to enter interactive mode.
If there’s ever a conflict between an environment variable and a command-line argument, the command-line argument is given priority. Let’s explore some of the most frequently used environment variables in Python:
PYTHONPATH
Adds user-defined directories to Python’s module search path (sys.path).
Use Case: Helps Python find modules that aren't installed in standard locations.
Example:
export PYTHONPATH="/home/user/mymodules"
PYTHONHOME
Sets the default location for Python’s standard libraries.
Use Case: Useful when embedding Python or using a custom Python distribution.
Example:
prefix/lib/pythonX.X
exec_prefix/lib/pythonX.X
PYTHONSTARTUP
Whenever the python interpreted is first initialized Python looks for a readable file with the name .pythonrc.py in Unix and executes the commands inside it. The path to the same file is stored in the PYTHONSTARTUP variable. These files are responsible for setting up the PYTHONPATH.
PYTHONINSPECT
Forces Python to enter interactive mode after running a script. It can also make changes to the Python code and force it to enter the inspect mode on program termination. It is equivalent to using the -i command-line option.
Use Case: Helpful during debugging or quick testing.
PYTHONCASEOK (Windows only)
This environment variable is used to ignore all import statements while calling the Python interpreter. It is used to find the first case-insensitive match in an import statement.
Use Case: Useful when working with files on case-sensitive and case-insensitive platforms.
PYTHONVERBOSE
If this variable is set to an empty string, it prints a message every time a module is initialized showing the location of the file or the module from where it has been loaded. It also generates information on module cleanup at the termination of the python program.
Use Case: Helpful for debugging import-related issues.
The above variables are the primary environment variables that are frequently used.
Ways to Run Python Code
There are 3 standard ways of using Python, namely:
- Using Interactive Mode
- Using Command-line
- Using an Integrated Development Environment (IDE)
Let's explore them in detail:
Using Interactive mode:
Python's interactive mode allows us to run code line-by-line directly in the interpreter.
Use these commands to enter interactive mode:
$ python  # Unix/Linux
C:\> python  # Windows
Example:
Here we will enter the interactive mode and ask Python to solve a simple computation. Look at the image below:
Using command-line:
In this method, we need to create a python file first (ignore if file is already available) and then call interpreter to run it.
Example:
Let's make a python file that simply computes the sum of 5 and 10 and returns the result and save it as gfg.py file. This would look somewhat like the below:
Now execute the file by using the below command:
python gfg.py
This will result in the following:
Using an IDE
IDEs like VSCode, PyCharm, Sublime Text or Jupyter Notebook provide a rich environment for writing, testing and debugging Python code.
Example using Jupyter Notebook:
Here we will write a simple python code and ask the IDE to execute it in Python.
Now if wehit the Run Button on the IDE it will call for the interpreter automatically and execute the program. Below is the output:
