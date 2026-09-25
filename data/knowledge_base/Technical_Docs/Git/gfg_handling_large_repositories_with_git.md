# Handling Large Repositories With Git

> Source: https://www.geeksforgeeks.org/git/how-to-handle-big-repositories-with-git/

Handling Large Git repositories involves optimizing performance, reducing storage usage, and maintaining a clean project structure.
- Use efficient techniques like shallow cloning and garbage collection to improve speed.
- Manage large files and commit history to reduce repository size.
- Maintain clean branches and structure for better organization.
Techniques for Efficient Repository Management
Methods used to improve performance, reduce size, and efficiently manage large Git repositories.
Using the shallow clone
Shallow cloning is a faster way to clone a repository by downloading only the most recent commits instead of the entire history.
- In large repositories (e.g., 1 GB with 35,000+ commits), full cloning takes significant time.
- Shallow cloning reduces time by fetching only the latest n commits.
- Useful when full history is not required.
git clone --depth [n] [url]
- n : number of latest commits to fetch.
- url : remote repository link.
Using git-filter
This technique allows modifying or filtering repository history, especially useful for removing unnecessary large files.
- Can traverse entire project history.
- Allows removing or modifying specific files (e.g., large binaries).
- Helps reduce repository size.
git filter-branch --tree-filter 'rm -rf [path-to-asset]'
path-to-asset: location of unwanted files.
Note: Changes commit IDs, so the repository must be recloned and used carefully due to its impact on history.
Cloning a single branch
When a repository has multiple branches but you only need one, cloning a single branch is more efficient.
- Avoids downloading unnecessary branches.
- Saves time and storage.
- Ideal for focused development.
git clone [url] --branch [branch_name] --single-branch
- url: repository link
- branch_name: specific branch to clone
Large binary files can slow down Git operations. These approaches help manage them effectively:
1. Using Submodules
Used to manage large files by separating them into a nested repository.
- A repository inside another repository that stores large binary files separately.
- Keeps the main project lightweight and isolates changes from affecting the parent repo.
2. Using Git LFS (Large File Storage)
Used to handle large files efficiently by storing them separately from the main repository.
- Stores large files outside the main repository and tracks them using pointers.
- Improves performance and reduces overall repository size.
3. Using Garbage Collection (git gc)
Used to clean and optimize the repository by managing stored objects efficiently.
- Combines loose objects into a single packed file and removes unnecessary data.
- Improves overall repository performance.
- Helps reduce repository size and maintain efficiency.
git gc
