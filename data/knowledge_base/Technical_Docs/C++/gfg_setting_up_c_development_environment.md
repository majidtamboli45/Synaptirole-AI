# Setting up C++ Development Environment

> Source: https://www.geeksforgeeks.org/cpp/setting-c-development-environment/

A C++ development environment provides the tools required to write, compile, run, and debug C++ programs. It can be configured on Windows, Linux, and macOS using a compiler and a code editor or IDE.
- Supports both online and local development workflows.
- Includes tools for code editing, compilation, execution, and debugging.
Setting up a C++ Development Environment
A C++ development environment provides the tools required to write, compile, run, and debug C++ programs. The two main components of a C++ environment are:
- C++ Compiler - Converts C++ source code into machine-executable code.
- Code Editor or IDE - Used to write, edit, and manage C++ programs.
Depending on your requirements, you can either use an online IDE or configure a local development environment.
Using an Online IDE
An online IDE allows you to write, compile, and execute C++ programs directly from a web browser without installing any software.
#include <iostream>
using namespace std;
int main()
{
    cout << "Learning C++ at GeekforGeeks";
    return 0;
}
Output
Learning C++ at GeekforGeeks
Explanation: The program prints a message on the screen. Online IDEs compile and execute the code without requiring any local setup.
Time Complexity: O(1)
Auxiliary Space: O(1)
Setting up a Local Environment
To create a local C++ development environment, install: A C++ compiler and A code editor or IDE
1. Installing a C++ Compiler
A compiler translates C++ source code into machine code that the operating system can execute.
Installing GCC on Linux
GCC (GNU Compiler Collection) is one of the most widely used C++ compilers on Linux.
Step 1: Update Package Information
sudo apt-get update
Step 2: Install GCC and G++
sudo apt-get install gcc
sudo apt-get install g++
Alternatively, install all required build tools using:
sudo apt-get install build-essential
Step 3: Verify Installation
Check whether GCC is installed successfully:
g++ --version
The installed compiler version should be displayed.
Step 4: Create a C++ Program
Create a file named helloworld.cpp:
#include <iostream>
using namespace std;
int main() {
    cout << "Hello World";
    return 0;
}
Step 5: Compile the Program
g++ helloworld.cpp -o hello
Step 6: Run the Program
./hello
Output
Hello World
Explanation: The compiler creates an executable file named hello, which is then executed from the terminal.
2. Installing a Code Editor or IDE
A code editor or IDE provides features such as syntax highlighting, debugging, project management, and code completion.
Code::Blocks Installation
Code::Blocks is a free and popular IDE for C++ development.
- Download Code::Blocks from the official website.
- Run the installer and complete the installation process.
- Open Code::Blocks.
- Select File -> New -> Empty File.
- Write your C++ program and save it with a .cpp extension.
- Select Build -> Build and Run to compile and execute the program.
Installing Visual Studio Code on Windows
Visual Studio Code is one of the most widely used editors for C++ development.
Step 1: Install VS Code
Download and install Visual Studio Code from the official website.
Step 2: Install MinGW
Install the MinGW compiler package and ensure the GCC compiler is available on your system.
Step 3: Configure Environment Variables
- Open the MinGW installation directory.
- Copy the path of the bin folder.
- Open:
This PC -> Properties -> Advanced System Settings -> Environment Variables
4. Edit the Path variable and add the copied path.
Step 4: Install Useful Extensions
Install the following extensions from the Extensions Marketplace:
- C/C++
- Code Runner
Step 5: Configure Code Runner
Open:
Settings -> Search "Run In Terminal"
Enable:
Code Runner: Run In Terminal
Step 6: Create and Run a Program
Create a file with the .cpp extension and run it using VS Code.
Installing Visual Studio Code on macOS
Step 1: Install VS Code
Download and install Visual Studio Code for macOS.
Step 2: Install Homebrew
Open Terminal and run:
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
Step 3: Install GCC
brew install gcc
Step 4: Verify Installation
g++ --version
Step 5: Install VS Code Extensions
Install:
- C/C++
- Code Runner
Enable Code Runner: Run In Terminal from VS Code settings.
Step 6: Create and Run Programs
Create .cpp files and compile or run them directly from VS Code.
Installing Xcode on macOS
Xcode provides Apple's development tools and includes support for C++ development.
- Download Xcode from the Mac App Store.
- Launch Xcode after installation.
- Create a new project: File -> New -> Project
- Select: Command Line Tool
- Choose C++ as the programming language.
- Complete project creation.
- Open main.cpp and write your code.
- Run the project using:
Product -> Run
