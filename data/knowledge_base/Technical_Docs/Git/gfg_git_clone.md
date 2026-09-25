# Git Clone

> Source: https://www.geeksforgeeks.org/git/what-is-git-clone/

The git clone command creates a local copy of an existing Git repository. It downloads the complete repository, including its history and branches, to your local system.
- Used to copy a repository from a remote source to a local machine.
- Works with repositories hosted on platforms like GitHub, GitLab, or Bitbucket.
- Downloads the entire project history and all branches.
Syntax:
git clone <repository-link>
Example: If you want to clone the Bootstrap repository, you would run.
git clone https://github.com/twbs/bootstrap
- The Bootstrap repository needs to be cloned to the local system.
- Copy the repository URL to use it for cloning.
- Navigate to the target directory where the repository should be stored using the cd command.
After that, Clone the repository using git clone <repo-link>
git clone https://github.com/twbs/bootstrap
The cloning process starts, displaying progress messages that indicate the percentage of the repository data being downloaded (e.g., 14%, 50%, 100%).
Once the cloning process is complete, you can navigate into the new directory (e.g., cd bootstrap) to start working on the project locally.
If you need to stop the cloning process before it finishes, you can press Ctrl + C to cancel the operation.
Cloning a repository creates a complete local copy of the project, including all branches and commit history, enabling offline development and later synchronization with the remote repository.
Git Clone With Username And Password
When cloning a repository using HTTPS, authentication may be required with your Git hosting account (such as GitHub, GitLab, or Bitbucket).
Syntax:
git clone https://github.com/username/repository
- Replace username and password with your account credentials.
- This allows Git to authenticate and clone the repository successfully.
Note: For security reasons, it is not recommended to include your password in the URL. Instead, you should use a credential manager or access tokens for more secure authentication.
Cloning a Specific Branch
By default, git clone clones the main branch (often named main or master) of a repository. However, if you want to clone a specific branch of the repository, you can use the -b option.
Syntax:
git clone -b <branch-name> <repository-url>
This command clones the specified branch into your local repository instead of the default branch.
Repo-to-Repo Collaboration
Cloning a repository creates a local working copy of a remote project, enabling developers to make changes and contribute to the codebase.
git clone <remote_repository_url>
This downloads the repository to the local system, allowing modifications and later synchronization with the remote repository.
Git Clone --branch
The git clone --branch command is used to clone a specific branch from a remote repository instead of the default branch.
- Allows cloning a specific branch from a remote repository.
- By default, git clone clones the main (or master) branch.
- Useful when you only need to work with a particular branch.
Syntax:
git clone --branch <branch_name> <remote_repository_url>
- <branch_name>: This is the name of the branch you want to clone from the remote repository.
- <repository_url>: This is the URL of the remote repository (either HTTPS or SSH).
For example, if you want to clone the feature-xyz branch from a repository, you would run the following command:
git clone --branch feature-xyz https://github.com/username/repository
Git URLs are used to access or clone repositories from remote locations to a local system. These URLs act as the address of the Git repository.
Types of Git URLs
1. HTTPS URL: Commonly used for cloning and pushing code over HTTP/HTTPS.
https://github.com/username/repository.git
2. SSH URL: A secure method that uses SSH keys for authentication without requiring a username or password each time.
git@github.com:username/repository.git
3. Git Protocol URL: Uses Git’s native protocol and is typically used for read-only access.
git://github.com/username/repository.git
4. Local File System URL: Cloning directly from a repository stored on the local machine.
/path/to/repository
5. Relative File System Path: Cloning a repository using a path relative to the current directory.
Cloning a Repository into a Specific Local Folder
You can specify the local directory where you want the repository to be cloned. Use the following command to clone a repository into a specific folder:
Syntax:
git clone <repository-url> <local-folder-name>
Replace the URL with the repository URL you want to clone, and specify the name of the folder where you want to copy the repository in place of <local_folder>.
For example, to clone a repository into a folder named my-project, use:
git clone https://github.com/username/repository my-project
Git Clone - Mirror Vs Git Clone - Bare
Git supports two specialized cloning methods: mirror cloning and bare cloning.
1. Git Clone - mirror:
A mirror clone creates an exact copy of the remote repository, including all branches, tags, and references.
Use Case: Commonly used for repository backups or migration.
git clone --mirror <repository-url>
2. Git Clone - bare:
A bare clone contains only the repository metadata and version control data without a working directory.
Use Case: Typically used for central repositories on servers for collaboration.
git clone --bare <repository-url>
| Git Clone -mirror | Git Clone -bare | 
|---|---|
| Creates an exact mirror of the remote repository. | Contains only repository metadata without a working directory. | 
| Copies all refs, branches, and configuration. | Stores version control data only. | 
| Mainly used for backups or repository migration. | Used for hosting central repositories on servers. |
