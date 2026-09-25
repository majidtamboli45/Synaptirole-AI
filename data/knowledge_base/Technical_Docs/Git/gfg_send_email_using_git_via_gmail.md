# Send Email Using git send-email via Gmail

> Source: https://www.geeksforgeeks.org/git/how-to-send-email-using-git-send-email-via-gmail/

Email-based collaboration allows developers to share patches and discuss changes directly from Git, making reviews and communication more efficient.
- Enables sharing patches via email without relying on external tools.
- Supports team coordination and asynchronous code reviews.
- Commonly used in projects that follow email-based contribution models, such as open-source projects.
Git Send-Email
git send-email is a Git command for sending patches directly from a repository using Gmail with App Passwords.
- Sends patches via email from Git.
- Common in open-source code reviews.
- Uses Gmail SMTP with App Passwords.
- Reduces reliance on external sharing tools.
Patch
A patch is a small file that represents changes made to a repository and can be shared for review or inclusion.
- Contains code differences from a commit.
- Useful when contributors have read-only access.
- Shared via email or other channels for review.
Note: This tutorial is based on Ubuntu and expect you already have git installed in your system, if not you can check this tutorial on how to install git.
Step-by-Step Guide to Send Email
Configure the environment and required tools to send emails using Git functionality.
Step 1: Install Required Packages
You need to ensure that you have the necessary packages installed. On Debian-based systems like Ubuntu, you can install the git-email package using:
sudo apt-get install git-email
Step 2: Configure Git Send-Email with Gmail
To configure git send-email to use Gmail, you need to set up your Git configuration with your Gmail account details. You can do this by running the following commands:
git config --global --edit
Step 3: Update the configuration file with the following details:
[sendemail]
    smtpserver = smtp.gmail.com
    smtpencryption = tls
    smtpserverport = 587
    smtpuser = youremail@gmail.com
Replace youremail@gmail.com with your actual Gmail address.
- Google no longer allows login using your normal Gmail password.
- Enable 2-Step Verification on your Google account and generate an App Password.
- Use this App Password when git send-email prompts for a password.
After editing the file, save and exit the editor.
Note: Google has disabled basic authentication for SMTP. To use git send-email with Gmail, you must use App Passwords or an alternative SMTP provider.
Step 4: Create a Patch File
This step generates a .patch file from your recent changes. After modifying and saving the files, commit the changes and run the commands to create the patch.
git add .
git commit -m "your message"
git format-patch --to=senderemail@gmail.com HEAD~..HEAD
Note: The HEAD~ option tells git to create the patch of the latest commit only but if you want to create a patch of your last two commits then simply change HEAD~ to HEAD~2.
As you can see after successfully running those commands, a patch file is generated, and we will send this file using git send-email.
Step 5: Sending Emails with Git Send-Email
Once we have the .patch file we can send this patch file to the person maintaining the repository or the one to whom the message is intended to be sent. To do this run the following command:
git send-email *.patch --to=receiver@gmail.com --cc=carboncopy@gmail.com
Note: Don't forget to update the --to option and the --cc option with actual email addresses.
Once you run this command, Git will prompt for your Gmail App Password. Enter the password, and you will receive a success message after the email is sent successfully.
Now wait for it to get reviewed and once reviewed and found valid your contribution will be successful.
