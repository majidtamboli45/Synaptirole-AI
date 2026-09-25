# Optimizing Git for Large Binary Files

> Source: https://www.geeksforgeeks.org/git/optimizing-git-for-large-binary-files/

Version Control Systems are a category of software tools that help in recording changes made to files by keeping track of modifications done in the code.
Purpose of Version Control System:
- Multiple people can work simultaneously on a single project. Everyone works on and edits their copy of the files and it is up to them when they wish to share the changes made by them with the rest of the team.
- Version control provides access to the historical versions of a project. This is insurance against computer crashes or data loss. If any mistake is made, you can easily roll back to a previous version. It is also possible to undo specific edits that too without losing the work done in the meantime. It can be easily known when, why, and by whom any part of a file was edited.
Git is a free and open-source distributed version control system designed to handle everything from small to very large projects with speed and efficiency. When you do actions in Git, nearly all of them only add data to the Git database.
What is large binary files?
Large binary files or Binary File Objects (BLOBS) are complex large files, any external assets you add to your projects like images, videos, and animated content (.blb, .fbx), unlike other data strings that only contain letters and numbers.
The Challenge of Large Binary Files in Git
Git was originally designed to handle primarily text-based files efficiently. While it excels at managing source code, it can struggle with large binary files such as images, videos, compiled binaries, or datasets. These files can significantly increase repository size, making cloning, pushing, and pulling operations slower and more resource-intensive. Moreover, storing large files directly in the Git repository can lead to performance degradation over time, impacting the productivity of development teams.
Why do we need to optimize binary files in Git?
Let us consider a scenario now, Suppose you are working on a large-scale multi-modules project, and the project itself contains some large files or generates some large files in some of its phases.
But Github limits the size of files allowed in repositories. (A repository is a place where you can store your code, your files, and each file's revision history.) If you exceed the per-file limit, the file will rejected silently by GIT LFS.
Strategy for optimizing Git for Large Binary Files:
Approach 1: Using Git LFS:
Github has file size limits of 100MB. Files with a size of 50MB trigger a warning message but can still be pushed through.
Git Large File Storage (LFS) is an open-source Git extension that allows users to store large files and binary files separately in the main Git repository. Instead of storing actual files or Binary Large Objects (blobs) in the Git repository itself, Git LFS replaces them with text pointers. The actual file contents are stored on a remote server, such as GitHub.com or GitHub Enterprise. This allows users to work with large files in a Git repository without bloating the repository size.
Example:
If there are existing large files in your repository that resist Git further from accepting your changes and you would like to keep them in GitHub. In that scenario, you need to first remove those files from the repository and then add them to Git LFS locally. Let us see those steps in detail.
Step 1: Install Git LFS on your system.
(i) Download Git LFS.  
(ii) Locate the downloaded file and install Git-LFS on your system.
(iii) Verify that the installation was successful:
C:\Windows\System32>git lfs install
Git LFS initialized.
Step 2: Configure Git Large File Storage.
    (i) Open Git Bash.
    (ii) Set the directory path to an existing repository path, where you want to use Git LFS.
    (iii)  Select the file types you would like Git LFS to manage, You can configure additional file extensions at any time by using the        following command:      
git lfs track For example, to associate a .psd file, enter the following command:
git lfs track "*.psd"                Here I want to track a .glb file. Let's try to configure it.
Step 3:
 (i) Commit your local .gitattributes file into your repository.
    (ii) Add a file to the repository matching the extension you've associated:
    (iii) Commit and push your changes into remote.
Now, we will add a .glb file and with this .gitattributes file into our repo.
git add path/to/file.glb
git add .gitattributes
Changes we make in the remote repository.
We Didn't get much of what was happening, only added the local files to the remote server.
Git LFS handles large files by storing references to the file in the repository, but not the actual file itself. To work around Git's architecture, Git LFS creates a pointer file that acts as a reference to the actual file (which is stored somewhere else). GitHub manages this pointer file in your repository. When you clone the repository down, GitHub uses the pointer file as a map to go and find the large file for you.
One important point is to remember, to commit your local .gitattributes file into your repository.
Relying on a global .gitattributes file associated with Git LFS may cause conflicts when contributing to other Git projects.
In each Git repository where you want to use Git LFS, select the file types you'd like Git LFS to manage (or directly edit your .gitattributes). You can configure additional file extensions at any time.
Approach 2: Using Git-Annex
git-annex is an annotated git repository. git-annex is a distributed file synchronization system (development began in 2010). It aims to solve the problem of sharing and synchronizing collections of large files independent of a commercial service or even a central server.
A repository, or Git project, enclose the entire collection of files and folders associated with a project, along with each file's revision history. The file history appears as snapshots in time called commits. The commits can be organized into multiple lines of development called branches. git-annex provides as a supplement to this, A way of storing files alongside a git repo without checking them in. (git-annex manages files with git, without checking their contents into git.)
Big files are sometimes a problem and if you would like to capture large files, you can use it.
How does it work?
git-annex needs to be installed both on the server and client side. 
Supported OS:  Debian, Ubuntu, Fedora, Android, MacOS, Windows, Linux etc.
Note: The documentation says that git-annex on Windows is still in beta.
To download git-annex on Windows, it is recommended to download first Python on your machine. 
There are two convenient ways to install git-annex. The first is downloading the installer from git-annex’ homepage. The other is to deploy git-annex via the DataLad installer. The latter option requires the installation of the datalad-installer Python package. Once Python is available, it can be done with the Python package manager pip. Open a command prompt and run:
Step 1:  Download datalad-installer.
C:\Windows\System32>python -m pip install datalad-installer
Collecting datalad-installer
Downloading datalad_installer-1.0.5-py3-none-any.whl.metadata (23 kB)
Downloading datalad_installer-1.0.5-py3-none-any.whl (31 kB)
Installing collected packages: datalad-installer
Successfully installed datalad-installer-1.0.5
Step 2: Afterwards, open another command prompt in administrator mode and run:
C:\Windows\System32>datalad-installer git-annex -m datalad/git-annex:release
2024-04-27T12:32:19+0530 [INFO ] datalad_installer: Writing environment modifications to C:\Users\DELL\AppData\Local
\Temp\dl-env-k4bfxefa.sh
2024-04-27T12:32:19+0530 [INFO ] datalad_installer: Installing git-annex via datalad/git-annex:release
2024-04-27T12:32:19+0530 [INFO ] datalad_installer: Version: None
2024-04-27T12:32:20+0530 [INFO ] datalad_installer: Downloading https://github.com/datalad/git-annex/releases/
download/10.20240227/git-annex-installer_10.20240227_x64.exe
2024-04-27T12:32:25+0530 [INFO ] datalad_installer: Running: 'C:\Users\DELL\AppData\Local\Temp\tmp9kbisx43\
git-annex-installer_10.20240227_x64.exe' /S
2024-04-27T12:32:25+0530 [INFO ] datalad_installer: git-annex is now installed at C:\Program Files\Git\usr\bin\git-annex.exe
This will download a recent git-annex, and configure it for your Git installation. The admin command prompt can be closed afterwards, all other steps do not need it.
It is recommended to also set the following git-annex configuration:
git config --global filter.annex.process "git-annex filter-process"
Example:
In the following example, we will create a storage named database it is a directory on a storage server where we are going to keep a copy of all our large binary files with the help of git and git-annex.
Step 1: After you have a git repository, you run git annex init to set up the git-annex metadata. This is run once in each repository in the git-annex network:
Step 2: Check for available branches and try to switch to the master branch.
Step 3: Configure git-annex storage server
Content and changes can be created on remote clones of the repository, i.e. local computers of lab members and collaborators. Such contents and changes need to be pushed to the storage-server, to be shared. For this reason, the storage server needs to be properly configured to allow that, in two steps. The first is:
git config receive.denyCurrentBranch updateInstead
If you do not plan to push changes from remote, then you do not need this configuration. Notice that, if you push changes to the repository after enabling the previous configuration, the working tree of the repository will not be updated. See below how to enable the automatic update of the working tree. The second step is:
git annex wanted . standard
git annex group . backup
Step 4: You can add small files using git (full content in git), and large files with git annex add.
git add smallFile.txt
git annex add largeFile.txt
git commit # metadata: commit message, author, etc.
Step 5: Adding public accessibility from the web
At this point, we will discuss how to access the repository when the storage server directory with the data is exposed via the web server.
Run the following commands:
....create repository on github....
git remote add github_project <github-URL-to-repository> // If any problem is there, skip the step
and create repository from github.
git push -u github_project master
git push -u github_project git-annex
Do you want to check further How git-annex works?
See, In the GitHub repo, Your git-annex branch will look like this:
Do you remember that we have added largerFile.txt inside git-annex, but where it is? I can't see anything. Let us check the master branch.
See, Here is the culprit.  Nothing has changed. Really?
Let's check their content.
Yeah, the small file content is a little bit okay, what about large file?
Do you get the difference?
Git Annex takes large files out of Git's history, but it handles this by storing symbolic links to the files in .git/annex or /annex/objects.
Differences Between Git LFS and Git-Annex:
| Subject | Git LFS | Git Annex | 
|---|---|---|
| Definition | Git LFS is an open source Git command line extension. | git-annex is a distributed file synchronization system. | 
| Working Principle | Git LFS stores large files outside of the Git repository, while maintaining references to those files within the repository. | Git Annex also takes large files out of Git's history, but it handles this by storing symbolic links to the files in .git/annex | 
| Storage | The files managed by Git LFS are stored as Git objects both in .git/lfs/objects and in the working repository, which can result in duplicated files and increased disk space usage. | The actual data of the large files is stored in a separate backend, such as S3 or rsync. | 
| Protocols | Git LFS supports both SSH and HTTPS protocols for accessing repositories. | Git Annex works only through SSH. | 
| Programming Language | Git LFS is primarily implemented by Go. | Git Annex is written in Haskell. | 
In Summary, both Git LFS and Git Annex provide solutions for managing large files in Git repositories.
Approach 3: Using Git-Submodules
It often happens that while working on one project, you need to use another project from within it. Then why not you can do similar things If you have some large files inside your project. You can manage the files in a separate repo and then use git-submodule to pull them into your project in the same way.
Here is a detailed explanation of the process.
Step 1: Create a new repository for your main project, this will contain your project source codes.
 Create a separate repository for the large files, that you want to include in your projects.
In your main project repository, use the git submodule add command to add the separate repository as a submodule.
git submodule add YOUR_SECOND_REPOSITORY_URL
After adding the submodule, you will see a new folder in your main project repository that corresponds to the submodule. This folder will contain the files from the separate repository.
Commit the changes to your main project repository, including the addition of the submodule.
The above strategies are based on the fact that keeping all those binary files is necessary for your project.
Conclusion:
In conclusion, Optimizing large binary files plays a crucial role, through the implementation of various techniques as discussed above you can able to improve the performance, reduce storage requirements, and enhance overall system efficiency.
