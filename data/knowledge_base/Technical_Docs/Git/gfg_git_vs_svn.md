# GIT Vs SVN

> Source: https://www.geeksforgeeks.org/git/difference-between-git-and-svn/

Git and SVN are version control systems used to manage, store, and track changes in source code during software development.
- Used to manage and track changes in source code efficiently.
- Maintain detailed version history for tracking and restoring changes.
- Support collaborative development by enabling multiple developers to work on projects.
GIT
Git and SVN are version control systems used to manage and track changes in source code during development.
- Distributed Version Control: Each developer has a full local copy with complete history, enabling offline work.
- Efficient Branching and Merging: Supports fast branch creation, merging, and flexible workflows.
- Speed and Performance: Local operations are quick without network dependency.
- Staging Area (Index): Allows controlled preparation of changes before committing.
- Strong Community and Ecosystem: Widely supported with tools like GitHub, GitLab, and Bitbucket.
SVN
Apache Subversion (SVN) is an open-source version control system that manages files and directories in a repository and allows access over a network for collaboration across multiple computers.
- Centralized Version Control: Stores all files and their history in a central repository, ensuring everyone works on the latest version.
- Atomic Commits: Applies all changes in a commit together or not at all, avoiding inconsistencies.
- Directory Versioning: Tracks changes to directories, renames, and file metadata along with content.
- Efficient Binary Handling: Manages binary files effectively for non-text data.
- Access Control: Provides fine-grained permissions at repository, directory, and file levels.
Difference between GIT and SVN
| GIT | SVN | 
|---|---|
| Distributed version control system by Linus Torvalds (2005) | Centralized version control system under Apache license | 
| Git has a Distributed Model. | SVN has a Centralized Model. | 
| Each user has a full local copy of the repository | Single central repository with working copies | 
| Works offline without network | Requires network for most operations | 
| More complex with many commands | Easier to learn and use | 
| Handles large and binary files less efficiently | Better support for binary files | 
| Uses a single .git directory | Uses .svn directory | 
| Limited UI support | Simpler and better UI | 
When to use Git
- A distributed version control system is required.
- Development involves branching-based workflows.
- Integration with modern DevOps tools is needed.
When to use SVN
- A centralized version control model is preferred.
- Existing workflows are based on SVN.
- Working with legacy systems dependent on SVN.
