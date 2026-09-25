# How to Install Git on Termux?

> Source: https://www.geeksforgeeks.org/git/how-to-install-git-on-termux/

We can use Git in our Android mobiles with the help of Termux. Sometimes we need to work with Git but at that time we may need a laptop to work. So we can use Git in our Android mobiles also using the tool Termux. We can easily install this command-line tool on our mobiles. We will use Android 9 in this article.
Prerequisite: You should have the device with android version 5.0+ and a GitHub account. If you don't have a GitHub account then you can create one by visiting this link.
Step by Step Implementation
Install Termux:
Download Termux application from Google play store.
After installed, the launcher would be added to the home screen and app menu. locate the app and launch it. The terminal window will appear as shown:
Install Git & SSH:
We need to update and upgrade using the below command before we install Git and SSH.
apt update && apt upgrade
After that, we can install Git and SSH now
apt install git openssh
Setting the Git Storage:
Set the storage for termux using the command: termux-setup-storage. It will ask you to access the storage of your mobile phone. Allow this to continue.
Connect to GitHub:
We need to create the key-pair of SSH using the command:
ssh-keygen -t rsa -C "YOUR_EMAIL_ADDRESS"
Here, YOUR_EMAIL_ADDRESS is your email id associated with your GitHub account.
Log in to GitHub:
Log into your GitHub account using the command:
ssh -T git@github.com
After successful authentication, you can start using Git on your Android device. You can create, pull, push the repositories. This is the easy way to use Git on your smartphone and it is a safe way because the Termux app is installed using Google play store.
