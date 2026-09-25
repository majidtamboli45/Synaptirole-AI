# Git LFS: Managing Large Files in Git Repositories

> Source: https://www.geeksforgeeks.org/git/git-lfs-managing-large-files-in-git-repositories/

Git, undoubtedly one of the most popular version control systems, is widely used for managing source code in software development projects. However, one of its limitations is its handling of large files. Traditional Git repositories struggle to efficiently manage large files, leading to bloated repositories and slow performance. This is where Git Large File Storage (LFS) comes into play.
Terminologies Decoded:
- Git: A distributed version control system used for tracking changes in source code during software development.
- Git LFS: Git Large File Storage is an extension for managing large files within Git repositories efficiently.
- Large Files: Files that are too large to be handled efficiently by traditional Git repositories, typically binaries, multimedia files, datasets, etc.
- Repository: A storage location where the versioned files for a project are stored.
How Does Git LFS Work?
Starting with Git LFS is simple. Begin by downloading the extension and configuring the file types. Instead of storing large files or binary large objects (blobs) directly in the Git repository, Git LFS uses pointers (references) to these files. The actual files or blobs are stored on a separate server, known as the LFS store. This approach enables versioning of large files and efficient management of blobs, while also conserving space within Git repositories.
Steps to Manage Large Files in Git Repositories:
Step 1: Install Git LFS by downloading and running the installer from the official Git LFS website or through package managers like Homebrew.
Step 2: Initializing Git LFS in a Repository: Navigate to the root directory of your Git repository in the command line.
git lfs install Step 3: Tracking Large Files: Identify the large files in your project that need to be managed by Git LFS.
git lfs track [file], replacing [file] with the filename or file pattern.
Step 4: Committing and Pushing Changes: Stage and commit your changes as usual using
git add . 
git commit -m "message"
- Push your changes to the remote repository using
git push origin <branch>
Step 5: Cloning a Repository with Git LFS: When cloning a repository that uses Git LFS, ensure Git LFS is installed on your system.
git clone [repository_url]
Step 6: Pulling Changes with Git LFS: After cloning or pulling changes from a repository using Git LFS, Git LFS will automatically download the large files associated with the latest commit.
Benefits of Git LFS with Example Case:
Consider a scenario where you're developing a web application that includes large image files. Without Git LFS, every time you commit changes that include these images, the entire binary data of the images would be stored in the Git repository, making it bloated and slowing down operations like cloning and pulling. By using Git LFS to track and manage these image files, only the pointers to the large files are stored in Git, while the actual binary data is stored externally, resulting in a more efficient repository.
Conclusion:
In conclusion, Git LFS is a valuable extension for managing large files in Git repositories, offering improved performance and efficiency. By understanding its concepts and following the steps outlined above, developers can effectively integrate Git LFS into their workflows and better manage large files in their projects.
