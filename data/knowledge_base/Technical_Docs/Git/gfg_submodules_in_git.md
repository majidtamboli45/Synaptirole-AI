# Submodules in Git

> Source: https://www.geeksforgeeks.org/git/submodules-in-git/

Git submodules allow one repository to reference another at a specific commit, enabling dependency management without merging codebases.
- Act as pointers to external repositories.
- Keep dependencies separate yet linked.
- Help maintain clean and organized repositories.
Benefits of Using Git Submodules
Git submodules help you manage external repositories in a structured, controlled, and scalable way within your main project.
- Modularity: Keep your project modular by separating dependencies into distinct repositories.
- Isolation: Manage changes in external dependencies without directly affecting your main project.
- Version Control: Pin dependencies to specific versions, ensuring stability and consistency.
- Reusability: Reuse submodules across multiple projects, avoiding code duplication.
Use Cases for Git Submodules
Git submodules are especially useful when projects require shared codebases or independent version management.
- Large Projects: Split large projects into manageable components.
- Shared Libraries: Include common libraries shared across different projects.
- Third-Party Dependencies: Manage third-party code dependencies separately from your main codebase.
Adding Git Submodules
Here, we can see to add a submodule in the git repository we have used the command:-
git submodule add url_of_the_git_repository
- Accepts a GitHub repository URL as input.
- Adds Submodules-in-git as a submodule to the project.
- Clones the submodule into the repository.
- Use git status to verify the submodule addition.
Running git status shows the .gitmodules file and the submodules-in-git directory. You can then inspect the contents of the .gitmodules file as shown in the terminal output:
Cloning a GitHub repository having .gitmodules
For Cloning the repository having submodules we have to use the following command:
git clone --recursive url_of_the_github_repository
Git init
This command copies submodule configuration from the .gitmodules file to the local .gitconfig, enabling selective submodule usage.
- Syncs submodule mappings into the local Git configuration.
- Allows activating only required submodules in large repositories.
Workflows in Submodules
After initialization, a submodule works as an independent Git repository within the parent project.
- Has its own branches and commit history.
- Changes must be committed separately inside the submodule.
After making changes in a submodule, the parent repository detects those updates and must be committed to record the new submodule state.
- The parent repository shows submodule changes in git status.
- Use git add and git commit to update the parent repository reference.
