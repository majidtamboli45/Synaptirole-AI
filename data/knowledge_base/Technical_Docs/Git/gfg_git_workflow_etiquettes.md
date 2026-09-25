# Git Workflow Etiquettes

> Source: https://www.geeksforgeeks.org/git/git-workflow-etiquettes/

Version control systems like Git have revolutionized the way developers collaborate on projects. However, efficient collaboration depends on sticking to certain manners that streamline the workflow and ensure code quality. Here are some important Git workflow etiquettes to follow.
Table of Content
1. Naming conventions for Branches
Your branch name syntax can be similar to something like this:
name/issue#/description
Here name may be Your Github Id or your initial name, issue denotes the issue number and a very short description about the branch
Example:
dora/45/new-feature
You can also consider this naming convention:
A. If it's a new feature
feature/name/issue#    B. If branch is for fixing new bug
bug/name/issue#                Example:
new-footer/dora/251
2. Etiquettes for Git Commit Messages
Having proper commit messages helps in increasing the readability of git logs and file history. One may consider naming your commit messages in the following categories:
- feat - If you work on a new feature
- fix - If your code changes help in fixing some bug
- docs - Documentation related changes
- style - Changes related to formatting
- refactor - If changes are related to just restructuring the codebase
- test - If new tests are added or old tests are modified
- chore - Regular maintainer changes, for example, documentation generation, versioning, build processing, etc
Example:
feat: New xyz component addeddocs: Updated broken blog page link
You can also make more accurate commit messages by mentioning the scope of files:
type(scope): Message
Here, type includes various categories that are discussed above, for example, feat, bug, docs, etc
Scope - represents the place where the code changes are made, for example, file-names
Example:
chore(netlify): Redirected old models
3. Pull Request Guidelines
When Opening a Pull Request, do consider adding the following points in the message
- Issue number - Issue the PR may close
- Changes - Write in detail about the new changes you made
- Related Issue/PR's - Link all the related issues and pull request
Example:
# Closes #412 
# Changes
- Change 1
- Change 2
# Related Issues:
- Issue #410
- PR #387
Here, Closes #412 will indicate to Github that merging this PR will close the issue numbered 412 successfully and Changes can be listed out with the bullets for increasing readability.
