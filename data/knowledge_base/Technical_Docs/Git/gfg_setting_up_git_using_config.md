# Setting Up Git Using git config

> Source: https://www.geeksforgeeks.org/git/how-to-set-up-git-using-git-config/

Git configuration helps set up your identity and preferences so Git can track changes correctly and work according to your workflow.
- Defines user identity (name and email) for commits.
- Allows customization of Git behavior and defaults.
- Ensures consistent and efficient version control usage.
Working of Git Configuration
- Git settings are stored in different configuration files at system, global, and local levels, defining how Git behaves.
- Local configurations take priority over global configurations, and global configurations override system configurations.
- Git provides the git config command to set and modify various settings related to user identity, repository behavior, and preferences.
- The git config --list command allows users to see currently applied settings from all configuration levels.
- Users can create aliases, define default branches, and set up preferences to enhance workflow efficiency and usability.
Steps To Setup Git using Git Config
Step 1: Install git
The first thing you have to do is install git in your system to proceed further. Follow these articles according to your system.
Step 2: Check for git version
Now, if you have successfully installed Git, you can verify and check its version using the following command.
git --version
Step 3: Set global username
Set your name for all repositories using the command
git config --global user.name 'username'
Step 4: Set global email
Set your email for all repositories by using the command
git config --global user.email 'user email'
Step 5: Set local username and email
Set your name for the current repository before that you have to initialize a empty git repository. And then set the username and email.
git init
git config --local user.name 'username'
git config --local user.email 'email'
Step 6: Configuring the Default Branch Name
By default, Git used to initialize repositories with the master branch. You can change this to main or any preferred name.
git config --global init.defaultBranch main
Step 7: Create an alias for a command
Git aliases allow you to shorten commonly used commands. Allowing git st instead of git status to work the same
Step 8: View all configurations
Shows all Git settings that have been made by the current user
git config --list
Step 9: Removing or Resetting Configurations
If you need to remove or reset any configurations, use:
git config --global --unset user.email
Or reset all settings to default:
rm ~/.gitconfig  # For Linux/Mac
del %USERPROFILE%\.gitconfig # For Windows
