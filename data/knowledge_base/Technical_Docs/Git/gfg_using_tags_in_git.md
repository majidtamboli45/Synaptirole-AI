# Using Tags in Git

> Source: https://www.geeksforgeeks.org/git/using-tags-in-git/

Tagging in Git is used to create reference points in repository history, commonly to mark stable releases or important versions.
- Used to mark release versions and important milestones.
- Helps create historical restore points.
- Supports lightweight and annotated tags.
- Tags can be listed, viewed, pushed, and deleted.
Steps to Create and Manage Tags
Follow these steps to create, view, and manage tags in Git.
Step 1: Switch to Desired Branch
Move to the branch where you want to create the tag.
 git checkout <branch name>
Step 2: Create a Tag
Create a tag to mark a specific commit or version.
git tag <tag name>
There are many more ways in which we create tags.
Annotated Tag
Create a tag with additional metadata like message and author.
 git tag -a <tag name> -m {some message} Step 3: View Tags
List and inspect existing tags.
git tag
git show <tag-name>
git tag -l "v2.*"
Step 4: Push Tags
Upload tags to the remote repository.
git push origin <tag-name>
git push --tags
"git push --tags" will push all tags at once.
Before
After
Step 5: Delete Tags (Local)
Remove tags from the local repository.
git tag -d <tag-name>
git tag --delete <tag-name>
Step 6: Delete Tags (Remote)
Remove tags from the remote repository.
git push origin -d <tag-name>
git push origin --delete <tag-name>
git push origin :<tag-name>
