# Patch Operation in Git

> Source: https://www.geeksforgeeks.org/git/patch-operation-in-git/

Git Patch is a feature in git that allows you to create a patch file (diff file) from changes in one branch and apply those changes to another branch.
- A patch file contains all the differences between branches or commits.
- It helps transfer changes without merging branches directly.
- Useful in code sharing, reviews, or applying selective changes.
Creation and Working of Patches
This process demonstrates how to create a patch from one branch and apply it to another branch.
Step 1: Create Repository & File
Create a new repository named Pat and add a file text.txt inside it.
Step 2: Add & Commit in Master
Stage the file and commit it to the master branch with an initial message.
git add text.txt
git commit -m "initial"
Step 3: Check Logs
View the commit history to verify the changes.
git log
Step 4: Create Feature Branch
Create a new branch named feature and switch to it.
git branch feature
git checkout feature
Step 5: Modify File
Edit the text.txt file by adding some new content.
Step 6: Commit Changes in Feature Branch
Stage and commit the updated file in the feature branch.
git add text.txt
git commit -m "this is in feature branch"
Step 7: Check Logs Again
View the commit history of the feature branch.
git log
Step 8: Create Patch File
Generate a patch file from the feature branch changes.
git format-patch master -o patches
We can also create a patch file using a particular commit's hash key. For example:-
git format-patch -1 012fe999affd9b92f6c96eb72a7260273411ea81 -o patches
The hash key is present in the git log written in dark yellow.
Step 9: Switch to Master Branch
Move back to the master branch to apply the patch.
git checkout master
Note: Here, "cat text.txt" is used to view the file. This may not run in Windows. Please use Notepad or any code editor to view this.
Step 10: Apply Patch File
Apply the generated patch file to the master branch.
git am patches/<patch-file-name>
Step 11: Verify Changes
Check whether the patch has been successfully applied.
git log
cat text.txt
