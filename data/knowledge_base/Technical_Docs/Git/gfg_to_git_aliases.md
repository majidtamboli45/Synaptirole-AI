# Introduction to Git Aliases

> Source: https://www.geeksforgeeks.org/git/introduction-to-git-aliases/

A Git alias is a shorthand for a Git command or a sequence of commands, allowing you to use shorter and more convenient abbreviations.
- Reduces the need to type long commands, saving time and improving efficiency.
- Minimizes typing errors with shorter, simpler commands.
- Can be customized for frequently used commands
Instead of typing:
git status
You can create an alias:
git gs
Usage of Git Aliases
Git aliases improve productivity by simplifying and standardizing command usage.
- Efficiency: Save time by reducing the amount of typing needed.
- Consistency: Ensure you use the same commands consistently across different projects.
- Customization: Tailor your Git experience to suit your specific workflow.
- Ease of Use: Simplify complex commands into straightforward ones.
Types of Git Aliases
Git aliases are of 2 types:
- Local alias: Works only in the current repository.
- Global alias: Works across all repositories on your system.
By default, if you create an alias without the --global flag, it will be local. Using the --global flag stores it in your global configuration so it’s available everywhere.
Creating Git Aliases
Creating Git aliases is simple and can be done using configuration commands or by editing config files.
1. Using Git Config
You can create aliases directly from the terminal using:
git config --global alias.<name> <command>
Note: --global applies aliases to all repositories. Without --global Alias is local to the repository
2. Editing Git Config Files Directly
You can manually create Git aliases by editing configuration files.
Config File Locations
- Global aliases: Stored in ~/.gitconfig (user home directory).
- Local aliases: Stored in .git/config (inside the repository).
Adding Aliases
- Open the config file and add entries under the [alias] section:
The config file may also contain other details like user name, email, etc.
Example: We have a repository Power-Puff-Girls, having 3 branches.
git br is an alias for git branch and aliases can also combine multiple commands.
Creating Custom Alias Commands
You can combine commands to create new shortcuts:
git config --global alias.unstage 'reset HEAD --'
Combines reset HEAD into an alias, so git unstage app.css equals git reset HEAD -- app.css.
3. Using Aliases To Create New Git Commands
Git aliases can be used to create custom commands that execute a sequence of Git commands.
- Supports combining multiple commands.
- Useful for automating repetitive tasks.
- Improves efficiency and workflow speed.
git config --global alias.<name> '<command>'
Create a shortcut to commit and push in one step:
git config --global alias.gcp '!git commit -m "Work in progress." && git push origin HEAD'
- git gcp performs both commit and push
Examples of Useful Git Aliases
Here are some examples of common Git aliases that can enhance your productivity:
1. Status Alias
Instead of typing git status, you can use:
git config --global alias.st 'status'
Now, simply type git st to check your repository status.
2. Log Alias
Viewing the commit history with git log can be made easier with an alias:
git config --global alias.lg 'log --oneline --graph --all'
This alias (git lg) shows a concise, graphical representation of the commit history.
3. Checkout Alias
Switching branches frequently? Simplify git checkout with:
git config --global alias.co 'checkout'
Now, use git co [branch-name] to switch branches quickly.
4. Commit Alias
For making commits with a short message, use:
git config --global alias.ci 'commit -m'
This allows you to commit changes with git ci "your message".
5. Add Alias
Staging files for commit can be shortened from git add to:
git config --global alias.a 'add'
Use git a [file-name] to add files to the staging area.
6. Push Alias
Pushing changes to the remote repository can be abbreviated from git push to:
git config --global alias.psh 'push'
Use git psh to push your changes.
Benefits of Git Aliases
Git aliases improve productivity by reducing repetitive typing and simplifying command usage.
- Faster workflow: Shorter commands (e.g., git ci instead of git commit) save time and keystrokes.
- Improved readability: Commands become simpler and easier to remember.
- Consistency: Encourages using standardized shortcuts across projects.
- Customization: Adapt Git commands to match your workflow.
- Reduced errors: Less typing lowers the chance of mistakes.
