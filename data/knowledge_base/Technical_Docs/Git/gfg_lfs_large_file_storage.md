# LFS (Large File Storage)

> Source: https://www.geeksforgeeks.org/git/git-lfs-large-file-storage/

Git LFS (Large File Storage) extends Git to handle large files efficiently by storing them outside the main repository and using lightweight pointers.
- Optimized for large files such as images, videos, and datasets.
- Replaces large files with pointers in the Git history.
- Stores actual file content on a remote server.
- Improves repository performance and faster clone/fetch operations.
- Ideal for projects with media files or large binaries.
Features of Git LFS
- Efficient Storage: Git LFS keeps your repository size manageable by storing large files separately.
- Seamless Integration: It integrates smoothly with your existing Git workflow.
- Bandwidth Optimization: Downloads only required versions of large files, reducing bandwidth usage and clone time.
- Compatibility: Works with existing Git commands, requiring minimal changes to your workflow.
Working of Git LFS
Git LFS manages large files by storing them externally and using pointer files within the Git repository.
- Replaces large files with small pointer files in the repository.
- Pointer files store metadata about the original files.
- Actual large files are stored on an LFS server.
- Automatically fetches the required files on checkout.
Installation and Set Up of Git LFS
In order to use Git LFS, first, we need to install it on our system. We can use the following command to do so.
sudo apt-get install git-lfs
Now on the repository where we want to use Git-LFS, there we have to set up that.
Step 1: Run the command on the repository.
git lfs install It will initialize the LFS in the repository and will update the Git Hooks.
Step 2: Run the below command as listed:
git lfs track "*.jpg" This will tell git lfs to handle the jpg files, in case you want any other file, then you can specify that particular extension.
Step 3: As the configuration that is done on Step 2, is stored in the .gitattributes file, so we will add it for commit using the following command
git add .gitattributes Step 4: After this, create a new branch, add the large files, and push the branch to the remote repository.
Tip: If you don't know how to set up a remote branch and push code to it, then go through Git tutorial
Step 5: Now let us clone the repository from the remote.
Step 6: After cloning if we look at the size of the cloned repository and the original repository we can see that there is a big difference between their sizes.
The original Repository is as follows:
Cloned Repository is as follows:
- Original repository size is 9.2 MB.
- Cloned repository size is only 172 KB.
- Git LFS stores pointer files, not actual large images.
- Large files are fetched only when needed.
Step 7: When you switch to the branch containing large files, Git LFS downloads the actual files from the remote server.
- After checking out the large_file_branch, Git LFS starts downloading the actual files.
- The files are fetched only at checkout time.
- This confirms that large files are not downloaded until needed.
Use Cases for Git LFS
Here aer some common use cases:
- Game Development: Handling large textures, models, and other assets.
- Multimedia Projects: Managing video, audio, and image files efficiently.
- Data Science: Storing large datasets and machine learning models.
