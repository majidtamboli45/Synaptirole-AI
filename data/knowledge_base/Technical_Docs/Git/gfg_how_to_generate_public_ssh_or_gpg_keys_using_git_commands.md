# How to Generate Public SSH or GPG Keys Using Git Commands?

> Source: https://www.geeksforgeeks.org/git/how-to-generate-public-ssh-or-gpg-keys-using-git-commands/

Generating public SSH or GPG keys is important for securing your Git operations and ensuring the authenticity of your commits. In this guide, we'll walk you through the process of generating these keys using Git commands, making it easy to track along and understand.
What Are SSH Keys?
SSH (Secure Shell) keys are a pair of cryptographic keys used to authenticate a user to an SSH server. They consist of a private key, which you keep secure, and a public key, which you share with others.
What Are GPG Keys?
GPG (GNU Privacy Guard) keys are used to sign and encrypt messages and files. They ensure the authenticity and integrity of your commits and tags in Git.
Why Use SSH and GPG Keys?
- Security: SSH keys provide a secure way to authenticate without using a password, reducing the risk of brute-force attacks.
- Authentication: GPG keys verify that commits and tags are truly from you, preventing forgery.
- Convenience: Once set up, SSH keys simplify the authentication process when interacting with Git repositories.
Steps to Generate SSH Key
Step 1: First, open your Git Bash terminal. Now, just run the following commands to get your keys. Type ssh-keygen -o and then press enter. It will ask, for some confirmations, just press Enter, y, Enter, and Enter respectively.
Step 2: Type cat ~/.ssh/id_rsa.pub and then press enter. It will automatically generate your SSH key (it starts with "ssh-rsa"). Now copy the key and Add it as a "New SSH key" present there in the SSH and GPG keys section of your Github profile setting.
Now you're good to go.
