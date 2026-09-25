# Download and Install Python 3 Latest Version

> Source: https://www.geeksforgeeks.org/python/download-and-install-python-3-latest-version/

The first step towards learning Python is to install it on your system. Whether you're using Windows, macOS, or Linux, this guide walks you through the process of downloading and installing the latest Python 3 version.
- Python is released under the Python Software Foundation License (PSF License), an open-source permissive license, and can be downloaded from python.org.
- Most Operating Systems, notably Linux, provide a package manager through which you can directly install Python.
Install on Windows
Note: The following steps apply to both Windows 10 and Windows 11.
Step 1: Download Python for Windows
- Open your browser and visit the Python download page: python.org/downloads.
- Select the latest Python 3 version, such as Python 3.13.1 (or whichever is the latest stable version available).
- Click on the version to download the installer (a .exe file for Windows).
Step 2: Run the Python Installer
Once the download is complete, run the installer program. On Windows, it will typically be a .exe file.
- Make sure to mark Add Python to PATH otherwise you will have to do it explicitly. It will start installing Python on Windows.
- After installation is complete click on Close.
Step 3: Verify Installation
Once the installation is complete, we can check the version of Python installed by using the following command in command prompt:
python --version
If a Python version is displayed, Python is installed successfully. If not, repeat the above installation steps.
Running Python Shell on Windows
After installing Python, we can launch the Python Shell by searching for "IDLE" in the "Start" menu and clicking on it.
Install on MacOS
Installing Python on macOS can be done via Homebrew, a popular package manager for macOS.
Step 1: Install Python Using Homebrew
- Open the Terminal application (located in Applications > Utilities).
- Run the following command to install Python via Homebrew:
brew install python3
Step 2: Verify the Installation
Once the installation is complete, we can check the version of Python installed by using the following command:
python3 --version
The terminal will display the installed version, confirming that Python is ready to use.
Running Python Shell on MacOs
To run Python Shell on MacOs type "python3" in terminal (you can search it using Spotlight) and press enter.
For a more detailed guide on how to install Python on MacOs, visit: Stepwise guide to Install Python on Mac
Install on Linux
Most Linux distributions come with Python pre-installed. If you're running Linux and want to check if Python is installed:
Step 1: Check for Python Installation
Open a terminal using Ctrl+Alt+T and type:
$ python --version
If Python 3 is installed, you'll see something like:
Python 3.x.x
If by any chance, Python is not pre-installed, we can install it by using the following steps:
Step 2: Install or Upgrade Python on Linux
Open the terminal and run the following commands:
sudo apt install software-properties-common -y
sudo add-apt-repository ppa:deadsnakes/ppa
sudo apt update
sudo apt install python3.13
This will install Python 3.13 on your Linux machine.
Step 3: Verify Python Installation
To verify the installation, run the following command:
python3 --version
Running Python Shell on Linux
To launch Python Shell on linux, open the terminal using "Ctrl + Alt + T" and then type "python3" and press enter.
